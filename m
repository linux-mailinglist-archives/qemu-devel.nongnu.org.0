Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FEC48595F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:46:48 +0100 (CET)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5CFD-0005uY-Gr
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n5CE5-00058D-4q
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:45:37 -0500
Received: from mail-eopbgr70059.outbound.protection.outlook.com
 ([40.107.7.59]:48089 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n5CDp-0002iD-GE
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:45:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n13xmCysyP6XdnGRzpRE0fEMPwyzmY2njfFgn8PuO8bPwKdel4RE7BHRxtR6yjUp7EHw+WDuVw768rKYkfYwc4Tx84WctGexoYrtpWpBMGLDMLutUihfi2bncrCUjR2sozAZ66K8qziRvxC+CV4xDBNAQ4br4mrEnJhlIW32pt8oOxdzYxAp5upHr/m6xapQFxchIq0LR6+DPaDrPTuseqn842wIIIcQ2xVfQ9MBqtr4ag9bbkBD2u0ySEOqvfqq928v8Y0mprCm6LH0oXPoYaRoF9qNg2OIhmavk9+8+i4ryXlJGBVQLbywP5y8opbCiD0kA0xvge1KX2PeOT3iHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STEM96spbrV+KV75UY/fpOIoW8Kswyn/nDlpvXpDV7I=;
 b=jz4rhyOWfocPIebcmxcQuKXrLALkxMLiiE+tdJG5am2hb5pCD42P7DXqAt8aRIY5IVuIWdCdsPikqDNAEJ7Xdn+aOA+YFFmxXQpJIOMkSOcal7v/Q/KpbGKHYWFe2LUZ9o4zSHYRBlrNKGSDwjgdDLGRtEoiGy73KiPyCUW3bWxSWr51rhbdLKRIPeYawIkPdeJi8mg9oQPZIL3kQdoIk0lsh/sCI0x7rd+2DnbywwoarI0R/hJXbLEtUhtNpHab2R5E6I7o9PT2WocgPPd3LzTITnYKMaLl6f1bv5rpNqzoK1m57QqOa4aY2kdK5kCnAr92CoP6BLf2GAvm4W/bMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=linaro.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STEM96spbrV+KV75UY/fpOIoW8Kswyn/nDlpvXpDV7I=;
 b=UWSpluBJ3RR5L0yQvSy9aDJLHWcYjo3sGizLkIrX+TMn0SgRnqCVlBs35DCyZHsM2p9WrT95FEljswBihblsWlw+2SHV3awGItrlUjI7JwqPQReEm8/cK+uzRAq8/1US9peSVcVNT1KOiS8Ey33AelIyUt3ookw41E2CUnEGBP+ge+5zgs897tmMUn0Gh+Sa9hfO0ckVZm9GsKX4YuXFvIqKt3ByxoqQ0bUQjVOK+d0gE2KsN23zykaequc8halkl2o3ECD4cAMZTNFMO7Q0rzTwDdfy2I40hWsXsGcvQmPkqshP5KF4IPJspzOEGvd8RGpfketRnhy8r9DxjzcFrw==
Received: from AS8PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:20b:311::22)
 by VI1PR10MB2478.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:8a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 19:24:57 +0000
Received: from VE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::2b) by AS8PR05CA0017.outlook.office365.com
 (2603:10a6:20b:311::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Wed, 5 Jan 2022 19:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT005.mail.protection.outlook.com (10.152.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Wed, 5 Jan 2022 19:24:56 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 20:24:54 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 20:24:53 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) by
 DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) with mapi id 15.01.2375.017; 
 Wed, 5 Jan 2022 20:24:53 +0100
From: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Thread-Topic: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Thread-Index: AQHYAYMLR0Cx5EhjlkWmNt5NhqkcMqxUtH0AgAAZJdA=
Date: Wed, 5 Jan 2022 19:24:53 +0000
Message-ID: <58ecc207ca704277a5cf1b259b77f6b0@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
 <874k6ij9z4.fsf@linaro.org>
In-Reply-To: <874k6ij9z4.fsf@linaro.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-01-05T19:24:52Z; 
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=75b727ce-87d6-4a98-ad01-82b0347262ed;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
x-originating-ip: [144.145.220.67]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6726c2c-5994-486f-3148-08d9d0810efc
X-MS-TrafficTypeDiagnostic: VI1PR10MB2478:EE_
X-Microsoft-Antispam-PRVS: <VI1PR10MB2478CFFCA210BB57F8F530F78A4B9@VI1PR10MB2478.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XUNtLvUDZzj6ze/XMPOo5OaIQ/D/TgYct4FNiMc2C2Fq0o2m7MBz0l23CZWQGG1L28M/3gIBhgN64yRUZoJdK8Q8L8lk4zGQE8yyL+tdYr4rHGkzWuq9H9HfO/fJA8r74w9x/YsMUWFN9oFCNp7urHp7reC/tZyQGzBIMYF7EIo2DNOoy8xCPn0kmhw1XgurWWRTKksH7qWF2PzI693t4TcaS43q89f5sW26igMhBRxwHr9bof2HP2riA+BsG8thbh3ienT0BaG0qYklnZW4edHmX+lykp7UrXe4DHHIt7ycaDMoXsrgMi8Qi/EjC06osTj13H6Pw+ECAq9vDAs9W7yV2+er3vJfPhuDQKFQU+kLsqhHR+CWUV79AaMpwv/xdRxjbfgWpG2AYddwanH+lLs671QGK2/oBJr3irHGU3xQUt56YQbKaNBqgGxm4TQWtjsGxvoyYqItXwoPhYcYMaXrFLfDK5I9vVPTui46E3XMkq1K/P/mItP4UwSKiBQP/nvDh3waHEwgiBezGsZ81JVevhujO39k2zRiNzo+FUWYParEjx8xF7RUKVgXWpULSyHCSg29apTW2io8f1sIfJu8UDisWctLH/CCJCYyqfZIYKZaU1WL/BeG90bQHoj4ZmEjBmPMIuoUp8GLAOK5XeeZ5U4rN7Vzz1+zDYfNX/I2E0+6hlW4/J1WgOvWziwHEGZ4HVya3WZXb7lhMwW7zURe3xeeMMsJFRlcEc8GULjRp0o8aqTxC5kHLbB84Qmp2/lwKDW4WrBEtInFRBsIw==
X-Forefront-Antispam-Report: CIP:194.138.21.70; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:hybrid.siemens.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(336012)(86362001)(8676002)(508600001)(8936002)(5660300002)(54906003)(108616005)(24736004)(6916009)(356005)(26005)(70586007)(186003)(7636003)(70206006)(7596003)(40460700001)(2906002)(47076005)(4326008)(316002)(36756003)(2616005)(36860700001)(82310400004)(956004)(83380400001)(82960400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 19:24:56.9934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6726c2c-5994-486f-3148-08d9d0810efc
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.70];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2478
Received-SPF: pass client-ip=40.107.7.59;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KDQo+IEtvbnJhZCBTY2h3YXJ6IDxrb25yYWQuc2Nod2Fy
ekBzaWVtZW5zLmNvbT4gd3JpdGVzOg0KPiANCg0KPiA+ICBzdGF0aWMgaW50IHJpc2N2X2dlbl9k
eW5hbWljX2Nzcl94bWwoQ1BVU3RhdGUgKmNzLCBpbnQgYmFzZV9yZWcpDQo+ID4gIHsNCj4gPiAg
ICAgIFJJU0NWQ1BVICpjcHUgPSBSSVNDVl9DUFUoY3MpOw0KPiA+IEBAIC0xNjMsMjEgKzE2Nywz
MyBAQCBzdGF0aWMgaW50IHJpc2N2X2dlbl9keW5hbWljX2Nzcl94bWwoQ1BVU3RhdGUgKmNzLCBp
bnQgYmFzZV9yZWcpDQo+ID4gICAgICByaXNjdl9jc3JfcHJlZGljYXRlX2ZuIHByZWRpY2F0ZTsN
Cj4gPiAgICAgIGludCBiaXRzaXplID0gMTYgPDwgZW52LT5taXNhX214bF9tYXg7DQo+ID4gICAg
ICBpbnQgaTsNCj4gPiArICAgIHJpc2N2X2Nzcl9vcGVyYXRpb25zICpjc3Jfb3A7DQo+ID4gKyAg
ICBzdHJ1Y3QgcmlzY3ZfZ2RiX2Nzcl90ZyBjb25zdCAqY3NyX3RnOw0KPiA+DQo+ID4gICAgICBn
X3N0cmluZ19wcmludGYocywgIjw/eG1sIHZlcnNpb249XCIxLjBcIj8+Iik7DQo+ID4gICAgICBn
X3N0cmluZ19hcHBlbmRfcHJpbnRmKHMsICI8IURPQ1RZUEUgZmVhdHVyZSBTWVNURU0gXCJnZGIt
dGFyZ2V0LmR0ZFwiPiIpOw0KPiA+ICAgICAgZ19zdHJpbmdfYXBwZW5kX3ByaW50ZihzLCAiPGZl
YXR1cmU+ICAgICAgbmFtZT1cIm9yZy5nbnUuZ2RiLnJpc2N2LmNzclwiPiIpOw0KPiANCj4gV2l0
aCB0aGVzZSBjaGFuZ2VzIGRvZXMgaXQgc3RpbGwgbWF0Y2ggdGhlIG9yZy5nbnUuZ2RiLnJpc2N2
LmNzcg0KPiByZWdpc3RlciBkZXNjcmlwdGlvbiBpbiBnZGI/IFByZXZpb3VzbHkgZm9yIGN1c3Rv
bSBYTUwgSSd2ZSB1c2VkIHRoZQ0KPiBvcmcucWVtdS5BUkNILlJFR1MgZm9ybSB0byBkaXN0aW5n
dWlzaCBiZXR3ZWVuIHNvbWV0aGluZyBHREIgZXhwZWN0cyBhbmQNCj4gc29tZXRoaW5nIHdlIGlu
dmVudGVkIChjaGFuZ2VkIHNpbmNlIDc5NzkyMGI5NTJlYSkuDQoNCkkgZG9uJ3QgZXhwZWN0IGl0
IHRvIG1hdGNoIC0tIGJ1dCB3aHkgc2hvdWxkIGl0Pw0KVGhlIHdob2xlIHBvaW50IG9mIHRhcmdl
dCBkZXNjcmlwdGlvbnMgaXMgZm9yIEdEQnNlcnZlciB0byBpbmZvcm0NCkdEQiBvZiB0aGUgcHJl
Y2lzZSBzZXQgYW5kIGxheW91dCBvZiBwcmUtZGVmaW5lZCByZWdpc3RlciBjbGFzc2VzLg0KVGhl
IGNsYXNzIGBvcmcuZ251LmdkYi5yaXNjdi5jc3InIGlzIGtub3duIHRvIGEgUklTQy1WIGNhcGFi
bGUNCkdEQiBhcyB0aGUgY2xhc3Mgb2YgYWxsIENTUnM7IGEgc3BlY2lmaWMgUklTQy1WIGNvcmUg
bWlnaHQNCmhhdmUgdmVuZG9yLXNwZWNpZmljIENTUnMsIGJ1dCB0aGV5IHdvdWxkIHN0aWxsIGJl
IGluY2x1ZGVkDQppbiBgb3JnLmdudS5nZGIucmlzY3YuY3NyJy4NCg0KU2VjdGlvbiBHLjUgaW4g
dGhlIEdEQiBtYW51YWwgbWFrZXMgdGhpcyBjbGVhcjoNCiJZb3UgY2FuIGFkZCBhZGRpdGlvbmFs
IHJlZ2lzdGVycyB0byBhbnkgb2YgdGhlIHN0YW5kYXJkIGZlYXR1cmVzIC0tDQpHREIgd2lsbCBk
aXNwbGF5IHRoZW0ganVzdCBhcyB0aGV5IHdlcmUgYWRkZWQgdG8gYW4NCnVucmVjb2duaXplZCBm
ZWF0dXJlLiINCg0KLS0NCktvbnJhZA0K

