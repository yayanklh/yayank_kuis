import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'dummy_data.dart'; // Data dummy yang berisi scheduleList

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Pagi, $username'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailOrderPage(),
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Apa itu Bank Sampah Keliling?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Jadwal Keliling",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: scheduleList.map((schedule) {
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    schedule.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, size: 50); // Menangani error jika gambar gagal dimuat
                    },
                  ),
                  title: Text(schedule.wasteBankName),
                  subtitle: Text(
                    "${schedule.coverageArea}\n(${schedule.implementationDate}),(${schedule.startTime} - ${schedule.endTime})",
                  ),
                  isThreeLine: true,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
