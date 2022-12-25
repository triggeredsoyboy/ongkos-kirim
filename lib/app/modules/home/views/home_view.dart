import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../data/models/province_model.dart';
import '../../../data/models/city_model.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyOngkir'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih Provinsi Asal",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            clearButtonProps: ClearButtonProps(
              isVisible: true,
            ),
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: "Cari Provinsi ...",
                  border: OutlineInputBorder(),
                ),
              ),
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
            ),
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/province",
                queryParameters: {
                  "key": "524727c5f5fad7cc51348fe4b8e7d74c",
                },
              );
              return Province.fromJsonList(
                  response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.provAsalId.value = value?.provinceId ?? "0",
          ),
          SizedBox(height: 12),
          DropdownSearch<City>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih Kota/Kabupaten Asal",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            clearButtonProps: ClearButtonProps(
              isVisible: true,
            ),
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: "Cari Kota ...",
                  border: OutlineInputBorder(),
                ),
              ),
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} ${item.cityName}"),
              ),
            ),
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/city?province=${controller.provAsalId}",
                queryParameters: {
                  "key": "524727c5f5fad7cc51348fe4b8e7d74c",
                },
              );
              return City.fromJsonList(response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.cityAsalId.value = value?.cityId ?? "0",
          ),
          SizedBox(height: 32),
          DropdownSearch<Province>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih Provinsi Tujuan",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            clearButtonProps: ClearButtonProps(
              isVisible: true,
            ),
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: "Cari Provinsi ...",
                  border: OutlineInputBorder(),
                ),
              ),
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
            ),
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/province",
                queryParameters: {
                  "key": "524727c5f5fad7cc51348fe4b8e7d74c",
                },
              );
              return Province.fromJsonList(
                  response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.provTujuanId.value = value?.provinceId ?? "0",
          ),
          SizedBox(height: 12),
          DropdownSearch<City>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih Kota/Kabupaten Tujuan",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            clearButtonProps: ClearButtonProps(
              isVisible: true,
            ),
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: "Cari Kota ...",
                  border: OutlineInputBorder(),
                ),
              ),
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} ${item.cityName}"),
              ),
            ),
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/city?province=${controller.provTujuanId}",
                queryParameters: {
                  "key": "524727c5f5fad7cc51348fe4b8e7d74c",
                },
              );
              return City.fromJsonList(response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.cityTujuanId.value = value?.cityId ?? "0",
          ),
          SizedBox(height: 32),
          TextField(
            controller: controller.weightCon,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Masukkan Berat Paket (gram)",
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 32),
          DropdownSearch<Map<String, dynamic>>(
            items: [
              {
                "code": "jne",
                "name": "JNE",
              },
              {
                "code": "pos",
                "name": "Pos Indonesia",
              },
              {
                "code": "tiki",
                "name": "TIKI",
              },
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                // labelText: "Pilih Kurir",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            clearButtonProps: ClearButtonProps(
              isVisible: true,
            ),
            popupProps: PopupProps.menu(
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item['name']}"),
              ),
            ),
            dropdownBuilder: (context, selectedItem) =>
                Text("${selectedItem?['name'] ?? "Pilih Kurir"}"),
            onChanged: (value) =>
                controller.kurirCode.value = value?['code'] ?? "",
          ),
          SizedBox(height: 32),
          Obx(
            () => ElevatedButton(
              onPressed: () => controller.cekOngkir(),
              child: Text(controller.isLoading.isFalse
                  ? "Cek Ongkos Kirim"
                  : "Mohon Tunggu..."),
            ),
          ),
        ],
      ),
    );
  }
}
