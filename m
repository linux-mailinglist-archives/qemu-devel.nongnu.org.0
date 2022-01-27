Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8894C49EA38
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:17:34 +0100 (CET)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9Kv-0007Sd-Kl
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Andrew.Baumann@microsoft.com>)
 id 1nD9CN-0008Qr-U8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:08:43 -0500
Received: from [2a01:111:f403:c110::1] (port=16157
 helo=na01-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Andrew.Baumann@microsoft.com>)
 id 1nD9CL-00059Q-6g
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:08:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ3FoLwRQuORS3wKfcOGP3uBkXGYoPKz+Mu+W/MX0dXU9QAScKyHt2TQuXrwo1dGsSnHRvNPShRRdzrUzeBP+c/4RtqkTJD98npqaD2lZE/9JK/8fMmDy6zDElaWMj5bltxmXM5kIJ7IIONk/5fo2LQ1P0N7A+Up+RLmrg8SLr/OjEoPMGqcmEHIa7eOnj2fPOjkTWXjBKsvHMm/R6uob44J0PNBWjPyueccmkhdaI2Dp1aVlt3ns5ApvDH9Co0Xj8zFrZq54XkaN8g46LSU0+u6WRzv1NHub4a6XMKuFW987gDJpYjX4ytxTs9j3nsYYSzAd0HQKKLz0ALI+U3WZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WiFenpVbzAn3qRG4QepH6WGyhyw9KXtRR+yRW7wJL4=;
 b=Njpb6rE5Ie9qD6kxRfMvJjLjDA36gChFsEV5S3GZou2BnTtI1y4asxnjR8JWVxbgCCvmTJNYGw5vGQGBXKwZeHg+2qsu+dRrVot337kE39TTw8gNn7K1hgkP9khtyc3F4wtbiLylOxfqNl4sgp5IAiVeH3B/mrk1CMU3uCnKHaIzyhB2JeKzUM573wh76L1DaIMlCSLV6aTiNawk4uR7bU+xjLm6ecVBFK4MnC5CS31fIaoRr7LFS5VP1cAmojTT4I9toXFu1b+lE0PPO3BorQsYIQKKAlNqsWBo3QU1JxjrMQIP8D5Z5Z0jRgi9nvbUfACo4BOCoZ/qaYegrfkrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WiFenpVbzAn3qRG4QepH6WGyhyw9KXtRR+yRW7wJL4=;
 b=XZzIjVRQsjhAqe4JMXpSQcrA9fu17WV/VEfm/KrtnTkRjlAHPTLu40UICZu24bkKwnYe8K8rBphVyx0H7SdzPJoCZe98ZYtzDj4u6bftUuyFQReo8TD44b5e9jL841611KrIqz//2R/jKysrIyog5XTAPqiQ1oBDiOGfETFdwC4=
Received: from MW4PR21MB1940.namprd21.prod.outlook.com (2603:10b6:303:72::13)
 by SJ0PR21MB1340.namprd21.prod.outlook.com (2603:10b6:a03:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.14; Thu, 27 Jan
 2022 17:30:26 +0000
Received: from MW4PR21MB1940.namprd21.prod.outlook.com
 ([fe80::50ef:f6b6:5ce1:511]) by MW4PR21MB1940.namprd21.prod.outlook.com
 ([fe80::50ef:f6b6:5ce1:511%9]) with mapi id 15.20.4930.010; Thu, 27 Jan 2022
 17:30:26 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: Any example command lines for the RaspberryPi Models
Thread-Topic: Any example command lines for the RaspberryPi Models
Thread-Index: AQHYE4YqWiGV/x8fKUmM/whgsMFR7ax3GusA
Date: Thu, 27 Jan 2022 17:30:26 +0000
Message-ID: <MW4PR21MB1940248686AA8843098BD5A49E219@MW4PR21MB1940.namprd21.prod.outlook.com>
References: <87ilu59t48.fsf@linaro.org>
In-Reply-To: <87ilu59t48.fsf@linaro.org>
Accept-Language: en-001, en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=66146cf2-4ca5-4df2-86ad-e9b1cb855678;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-27T17:11:54Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc18d658-a4ff-4346-131d-08d9e1bab4b6
x-ms-traffictypediagnostic: SJ0PR21MB1340:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <SJ0PR21MB13405D91474AD2AAD478BE959E219@SJ0PR21MB1340.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 55ylnW9J+10Wp6de+MBHz2QcZ764Q59tIMHb+TqBQlTPbQVqKoHDJjb80P6QfbobkIupmUw22/8QPB2n/tdX2ZV8++41FO93G/lZpMgrZYhLVApyVvoaI2jEt5zH7VhKQf72BjTAH0Uu5/MYJhGbLS/NmO/LmUJU9EsSzxCCT2zStiZ7PaiNSHTrfQ2BJApwX/pOSbVVwIGj/K/O8tpmlVpmSicLsPNGp16+dbpOIPP3pmlqqM3aqcZMJmRD543Di0OlOGOEwfrD3UMZFUBrkAMZVqoUR9lSRuWEQQRMBbOQdtvqtM0e3e1sarBoCgcnNPz7KnWAUyPaqGZyG5XIjHJXOYQAk05d7kWXPtuOBbTOmGDxTyie2jAxQqpseNZg5md0+lB5dY8TVbsHmduRE5TVs4kgq5wTVX2hbzy7UXuoFsPT9IIi1Amvb4pYD06JW7mPgahShSC45YUUA/JuvvrqEpODSEmqTGtA/JxDp2jR2Czw9fTx1eobEYqwWd70l1iRSkcBjybxcmTBE6zxi+vsk0aXO1Nypg7mgkSviMfJT7MDJCJo2VsRS155EofPlBUBuSX63IMiA92lsiQ5GQMb7DkBEF1Sd7Ni7p+r3UR+7J/T1MvBpSVPFe8MZWSjWNonBEHLzhC7VZgstem/UTi2OTWOuzdY7nDc6wz3PwZ8DHjUWivjApYeLP4Ypa2WDr5JiLKi6D94OAY1FJWycCfcbcBYTwPnGgx1uW1d7h4e52MAPZ4OIvv/npt/n7GD80yCVfHrD+4FBcw7Lj3Hfw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR21MB1940.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(6506007)(7696005)(508600001)(66574015)(8990500004)(186003)(71200400001)(9686003)(26005)(10290500003)(4744005)(33656002)(5660300002)(52536014)(55016003)(66476007)(110136005)(76116006)(86362001)(316002)(82960400001)(66446008)(2906002)(64756008)(38070700005)(66556008)(38100700002)(82950400001)(8936002)(4326008)(122000001)(66946007)(8676002)(170073001)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0lDaWg1ZlY4OWFEVm5Rcml6WTVGTFdtWkNyMTFCbXRjQ0Y0K2N1V21CdDlu?=
 =?utf-8?B?NmZ3Vnh3MElwa3BhamRhdE54NTA1Rk5Bd3RZTk9ocWh4YWZqS004NWpzOVFy?=
 =?utf-8?B?UEU1Q3FRWC9hcjR3ZTVyZEZsK2d1TEJwMC96Yk55eGxRT1NuRjZrYVZRbHZ2?=
 =?utf-8?B?NWlXdmtkMmIyR0toMGg1R3hibHNmTC9SMXBHMEgwbXFGMjB2U0VIQi9mbVZ4?=
 =?utf-8?B?d0ZYclo5My80NjQwRGpYSDlVV012bEdpZlE5R3JIWEE1blZyVlNvbVhHdzhG?=
 =?utf-8?B?bGxGM0psQTI5NjRhNjNzV2xzVmFrMUNVTEJWaDFGaTVnbzliMCtmb0w1cHBh?=
 =?utf-8?B?MlhmWHVhcjRvVEVESlRsVXQzSzJhdGMxTFFFNUJYQVB2ZStaSml1SlNzTzc4?=
 =?utf-8?B?LzIzSDNCNm5SQW12N3QyUUpyOUlVbjRsdUxzc08zRkwvTmJFSVNab20wRUU4?=
 =?utf-8?B?UGp1cVV2WjlsY2JFK2xGcVdMUnluVTczM2txalhGOXRNeU4wcHlIL29KZXo1?=
 =?utf-8?B?bmsrU2tSWHRQbDVBelVGSlJVc2xmYVZUTmZScGlkWi9uUHExV0tqSysreDNU?=
 =?utf-8?B?Z2VEb3lxemQyQWR6Nit1TjBUeDJrVHkvc2lUaDM5azZac21VOVNvWTIxeHRX?=
 =?utf-8?B?UHJVcXJxUjRQbkNpQVoraktTNUdrMzFSWHBidVB1TlAvZDRBc2tPM01kOWE1?=
 =?utf-8?B?SUkzUzlZWnJ3ZFlOb3VpRFVKNHJnelgvZGN1cHdIR1U5Qzc5aW5XOWE1UzE2?=
 =?utf-8?B?WVFLckxSakNHK1BqL3hpek9PdytacDl6Wlg3TWdKbWo0TE1IL2tqT2NrSGFC?=
 =?utf-8?B?a3pXaURDT3NmdkxpNzVseWJxa1pFWXdQY1ZNQ0N3VUVUeDZ6TS9LTGlMMG5M?=
 =?utf-8?B?NGNUQlNST1kzekxHUXREK0xTVEQycVRiSjc2cEhrTHJXQjQvNFVtVmp2K2tQ?=
 =?utf-8?B?VC8zaThNQ2ZJZUhUZmc5NWd4R2NUNW53S1JRQ05TeG5HUk1VUTQwRENRaVM4?=
 =?utf-8?B?NzdMWjFkL1R0WVB6WTRIRFhHRlN6ZzhDVURBS1o1NlVWeEJzS0RIbENuVHdZ?=
 =?utf-8?B?R1QrQUczazRhNzhGcFdCWXc4RnJsZmJxTFhQVk0yOEc1THRHa1hEZUMyTmFE?=
 =?utf-8?B?QjA0NWp3emhjcC9oVDNaY0NpbVZMVXNrcVpWY042SDRDbmoyR0l2TEgvOXJw?=
 =?utf-8?B?UXJrRFcrOENYL2ZRUExwczZva2ZpYmo4OUdVcjQ3V3Z6eDJLQjZuQ1VudWhV?=
 =?utf-8?B?cVB4Mm9zWWRmNHUzTVRScVk1ejl1TzdvUVdDWXkvbEhwakZGTG1rR0lkak9H?=
 =?utf-8?B?UjIrWEVtTlB5UXFpcjAyeHVlMjg0d2Z4Y2pqdkV2N2ErSGExbmg2Yk5jclZa?=
 =?utf-8?B?bVhEL3N0RU55TXRxSmlxT0ZZTW9kN2o0UWdjdkNpdWxrZzJzUXpHZGpTZ1Vh?=
 =?utf-8?B?TE9TMGRKUm1Kbk5teVVNZ1IwaWdqY0V5SlN1UkVVNGQvVUZoWXBWdmgzUXp1?=
 =?utf-8?B?YlcyNmEyNkJwSDk5dzg4aVRmejFGRkt3Uk9vOFJMaXpuR1F3d0hkZ2huTUV1?=
 =?utf-8?B?ZG9YQWJxdDFrbTB5aGcxajRqNTRFQUxnZUMzNSt1RWhWa1JlSjFBK1NyR3JE?=
 =?utf-8?B?MUd2dG5wZGxFZjQ1SFNjZkpZVnBHY2RCV3plM0MwOTIxb1ZDNURvQ1pENjAz?=
 =?utf-8?B?cHdwdm0yN2YrL1luODcvNVZ4L2FvZCt4b0tROWxkM2JNcEYzOW9hVWVwZk4x?=
 =?utf-8?B?RkFJZExadndZeVM3SENiYS9JWWtYZUFhMld1SWR3NU90WWptVFpZaDB6dEky?=
 =?utf-8?B?WWUzcllxRUFKY2s2Wk5yaGZxdlBsb0tncnMraXFKUXB5V2h5YmV1ZmpPMGxQ?=
 =?utf-8?B?bk5Qd2RBK014VzNYZnMxUHBTNGJ0dTBmNmMwWFY5Sy9CZVVwTjVwZGxRRVFl?=
 =?utf-8?B?c1FicmY0cUlHR1ZLakpRdFpraE1YK2lhbk9NSmVPdENYd1ptK1JvcEIyVUZZ?=
 =?utf-8?B?QkRYTWR5clhhdWRYN0Ezdy9LZ3JyUFMyakduSDVJMk5VQTJRUFJ2c3lBMGl4?=
 =?utf-8?B?ZDhVSElvaGp0eTVtQ01Oc1JUeldYMXNNM2ZBaXFtSDgzUkVpbm1wUGwyeEFl?=
 =?utf-8?B?WncwaUd0NXQxM09zV1lFNER1UXk3b01WemZZWnM3UU42OFRHWVU4aU56R2w2?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR21MB1940.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc18d658-a4ff-4346-131d-08d9e1bab4b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 17:30:26.0634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jou9ShaYEOSZigzAHsUb3at7tvH5KgN3GmMhMzpseAFVJYp8QPPitz2xychrQRN1D8xISKkZddooAp0TGceoww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR21MB1340
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:c110::1
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:c110::1;
 envelope-from=Andrew.Baumann@microsoft.com;
 helo=na01-obe.outbound.protection.outlook.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+DQo+IFNvbWVv
bmUgd2FzIGFza2luZyBvbiBJUkMgZWFybGllciBhbmQgSSByZWFsaXNlZCB3ZSBkb24ndCBnaXZl
IGFueSBleGFtcGxlcw0KPiBpbiB0aGUgZG9jdW1lbnRhdGlvbiBvZiBob3cgdG8gYXR0YWNoIGJs
b2NrIGRldmljZXMuIEkgZm91bmQgYSByZWZlcmVuY2UgaW4NCj4gYW4gb3V0LW9mLXRyZWUgcmVw
byB0aGF0IG1lbnRpb25lZCAtc2Qgd2hpY2ggc2VlbXMgcmlnaHQgYnV0IEkgYXNzdW1lIHlvdQ0K
PiBtdXN0IGJlIGFibGUgdG8gdXNlIC1kZXZpY2Ugc2QtY2FyZCBhcyB3ZWxsPw0KPiANCj4gQ291
bGQgd2UgZG9jdW1lbnQgc29tZSBvZiB0aGUgY29tbW9uIGJvb3QgZXhhbXBsZXMgaW4NCj4gZG9j
cy9zeXN0ZW0vYXJtL3Jhc3BpLnJzdCBwbGVhc2U/DQoNCkFsbCB0aGUgZXhhbXBsZXMgSSBoYXZl
IHVzZWQgLXNkLiBIZXJlJ3MgYW4gaW52b2NhdGlvbiB0aGF0IHdvcmtlZCBiYWNrIGluIDIwMTYv
MTcgKHNvcnJ5IEkga25vdyB0aGlzIGlzIG5vdCB0ZXJyaWJseSBoZWxwZnVsKToNCg0KICBxZW11
LXN5c3RlbS1hcm0gLU0gcmFzcGkyIC1rZXJuZWwgcmFzcGJpYW4tYm9vdC9rZXJuZWw3LmltZyAt
c2QNCiAgMjAxNS0wOS0yNC1yYXNwYmlhbi1qZXNzaWUudmhkIC1hcHBlbmQgInJ3IGVhcmx5cHJp
bnRrIGxvZ2xldmVsPTgNCiAgY29uc29sZT10dHlBTUEwIHJvb3Q9L2Rldi9tbWNibGswcDIgcm9v
dHdhaXQiIC1zZXJpYWwgc3RkaW8NCg0KVW5mb3J0dW5hdGVseSBJIGhhdmUgbm90IGJlZW4ga2Vl
cGluZyB0cmFjayBvZiByYXNwaSBzdXBwb3J0IGluIFFFTVUuIEknbGwgc2VuZCBhIHBhdGNoIHRv
IHJlbW92ZSBteXNlbGYgZnJvbSBNQUlOVEFJTkVSUy4NCg0KQW5kcmV3DQo=

