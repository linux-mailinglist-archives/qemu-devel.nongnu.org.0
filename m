Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891152D2046
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 02:48:33 +0100 (CET)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmS7E-0004yI-K5
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 20:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmS5a-0004Y2-8n
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 20:46:50 -0500
Received: from smtp.h3c.com ([60.191.123.50]:52111 helo=h3cspam02-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmS5O-0006f6-SA
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 20:46:50 -0500
Received: from DAG2EX07-IDC.srv.huawei-3com.com ([10.8.0.70])
 by h3cspam02-ex.h3c.com with ESMTP id 0B81kOVR001368;
 Tue, 8 Dec 2020 09:46:24 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) by
 DAG2EX07-IDC.srv.huawei-3com.com (10.8.0.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 8 Dec 2020 09:46:25 +0800
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074])
 by DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074%7])
 with mapi id 15.01.2106.002; Tue, 8 Dec 2020 09:46:25 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: [PATCH v3] migration: Don't allow migration if vm is in POSTMIGRATE
Thread-Topic: [PATCH v3] migration: Don't allow migration if vm is in
 POSTMIGRATE
Thread-Index: AdbNA412vEo+hmt0TmuQR+h7GaeR1g==
Date: Tue, 8 Dec 2020 01:46:25 +0000
Message-ID: <6b704294ad2e405781c38fb38d68c744@h3c.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.131]
x-sender-location: DAG2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 0B81kOVR001368
Received-SPF: pass client-ip=60.191.123.50; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam02-ex.h3c.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "vsementsov@virtuozzo.com" <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBzdGVwcyB3aWxsIGNhdXNlIHFlbXUgYXNzZXJ0aW9uIGZhaWx1cmU6DQot
IHBhdXNlIHZtIGJ5IGV4ZWN1dGluZyAndmlyc2ggc3VzcGVuZCcNCi0gY3JlYXRlIGV4dGVybmFs
IHNuYXBzaG90IG9mIG1lbW9yeSBhbmQgZGlzayB1c2luZyAndmlyc2ggc25hcHNob3QtY3JlYXRl
LWFzJw0KLSBkb2luZyB0aGUgYWJvdmUgb3BlcmF0aW9uIGFnYWluIHdpbGwgY2F1c2UgcWVtdSBj
cmFzaA0KDQpUaGUgYmFja3RyYWNlIGxvb2tzIGxpa2U6DQojMCAgMHgwMDAwN2ZiZjk1OGM1YzM3
IGluIHJhaXNlICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmMuc28uNg0KIzEgIDB4
MDAwMDdmYmY5NThjOTAyOCBpbiBhYm9ydCAoKSBmcm9tIC9saWIveDg2XzY0LWxpbnV4LWdudS9s
aWJjLnNvLjYNCiMyICAweDAwMDA3ZmJmOTU4YmViZjYgaW4gPz8gKCkgZnJvbSAvbGliL3g4Nl82
NC1saW51eC1nbnUvbGliYy5zby42DQojMyAgMHgwMDAwN2ZiZjk1OGJlY2EyIGluIF9fYXNzZXJ0
X2ZhaWwgKCkgZnJvbSAvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42DQojNCAgMHgwMDAw
NTVjYThkZWNkMzlkIGluIGJkcnZfaW5hY3RpdmF0ZV9yZWN1cnNlIChicz0weDU1Y2E5MGM4MDQw
MCkgYXQgL2J1aWxkL3FlbXUtNS4wL2Jsb2NrLmM6NTcyNA0KIzUgIDB4MDAwMDU1Y2E4ZGVjZTk2
NyBpbiBiZHJ2X2luYWN0aXZhdGVfYWxsICgpIGF0IC9idWlsZC8vcWVtdS01LjAvYmxvY2suYzo1
NzkyDQojNiAgMHgwMDAwNTVjYThkZTU1MzlkIGluIHFlbXVfc2F2ZXZtX3N0YXRlX2NvbXBsZXRl
X3ByZWNvcHlfbm9uX2l0ZXJhYmxlIChpbmFjdGl2YXRlX2Rpc2tzPXRydWUsIGluX3Bvc3Rjb3B5
PWZhbHNlLCBmPTB4NTVjYTkwNzA0NGIwKQ0KICAgIGF0IC9idWlsZC9xZW11LTUuMC9taWdyYXRp
b24vc2F2ZXZtLmM6MTQwMQ0KIzcgIHFlbXVfc2F2ZXZtX3N0YXRlX2NvbXBsZXRlX3ByZWNvcHkg
KGY9MHg1NWNhOTA3MDQ0YjAsIGl0ZXJhYmxlX29ubHk9aXRlcmFibGVfb25seUBlbnRyeT1mYWxz
ZSwgaW5hY3RpdmF0ZV9kaXNrcz1pbmFjdGl2YXRlX2Rpc2tzQGVudHJ5PXRydWUpDQogICAgYXQg
L2J1aWxkL3FlbXUtNS4wL21pZ3JhdGlvbi9zYXZldm0uYzoxNDUzDQojOCAgMHgwMDAwNTVjYThk
ZTRmNTgxIGluIG1pZ3JhdGlvbl9jb21wbGV0aW9uIChzPTB4NTVjYThmNjRkOWYwKSBhdCAvYnVp
bGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlvbi5jOjI5NDENCiM5ICBtaWdyYXRpb25faXRl
cmF0aW9uX3J1biAocz0weDU1Y2E4ZjY0ZDlmMCkgYXQgL2J1aWxkL3FlbXUtNS4wL21pZ3JhdGlv
bi9taWdyYXRpb24uYzozMjk1DQojMTAgbWlncmF0aW9uX3RocmVhZCAob3BhcXVlPW9wYXF1ZUBl
bnRyeT0weDU1Y2E4ZjY0ZDlmMCkgYXQgL2J1aWxkL3FlbXUtNS4wL21pZ3JhdGlvbi9taWdyYXRp
b24uYzozNDU5DQojMTEgMHgwMDAwNTVjYThkZmM2NzE2IGluIHFlbXVfdGhyZWFkX3N0YXJ0IChh
cmdzPTxvcHRpbWl6ZWQgb3V0PikgYXQgL2J1aWxkL3FlbXUtNS4wL3V0aWwvcWVtdS10aHJlYWQt
cG9zaXguYzo1MTkNCiMxMiAweDAwMDA3ZmJmOTVjNWYxODQgaW4gc3RhcnRfdGhyZWFkICgpIGZy
b20gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYnB0aHJlYWQuc28uMA0KIzEzIDB4MDAwMDdmYmY5
NTk4Y2JlZCBpbiBjbG9uZSAoKSBmcm9tIC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjYN
Cg0KV2hlbiB0aGUgZmlyc3QgbWlncmF0aW9uIGNvbXBsZXRlcywgYnMtPm9wZW5fZmxhZ3Mgd2ls
bCBzZXQgQkRSVl9PX0lOQUNUSVZFDQpmbGFnIGJ5IGJkcnZfaW5hY3RpdmF0ZV9hbGwoKSwgYW5k
IGR1cmluZyB0aGUgc2Vjb25kIG1pZ3JhdGlvbiB0aGUNCmJkcnZfaW5hY3RpdmF0ZV9yZWN1cnNl
IGFzc2VydCB0aGF0IHRoZSBicy0+b3Blbl9mbGFncyBpcyBhbHJlYWR5DQpCRFJWX09fSU5BQ1RJ
VkUgZW5hYmxlZCB3aGljaCBjYXVzZSBjcmFzaC4NCg0KQXMgVmxhZGltaXIgc3VnZ2VzdGVkLCB0
aGlzIHBhdGNoIG1ha2VzIG1pZ3JhdGVfcHJlcGFyZSBjaGVjayB0aGUgc3RhdGUgb2Ygdm0gYW5k
DQpyZXR1cm4gZXJyb3IgaWYgaXQgaXMgaW4gUlVOX1NUQVRFX1BPU1RNSUdSQVRFIHN0YXRlLg0K
DQpTaWduZWQtb2ZmLWJ5OiBUdWd1b3lpIDx0dS5ndW95aUBoM2MuY29tPg0KLS0tDQogbWlncmF0
aW9uL21pZ3JhdGlvbi5jIHwgNiArKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspDQoNCmRpZmYgLS1naXQgYS9taWdyYXRpb24vbWlncmF0aW9uLmMgYi9taWdyYXRpb24vbWln
cmF0aW9uLmMNCmluZGV4IDg3YTliNTkuLjVlMzM5NjIgMTAwNjQ0DQotLS0gYS9taWdyYXRpb24v
bWlncmF0aW9uLmMNCisrKyBiL21pZ3JhdGlvbi9taWdyYXRpb24uYw0KQEAgLTIxMTUsNiArMjEx
NSwxMiBAQCBzdGF0aWMgYm9vbCBtaWdyYXRlX3ByZXBhcmUoTWlncmF0aW9uU3RhdGUgKnMsIGJv
b2wgYmxrLCBib29sIGJsa19pbmMsDQogICAgICAgICByZXR1cm4gZmFsc2U7DQogICAgIH0NCiAN
CisgICAgaWYgKHJ1bnN0YXRlX2NoZWNrKFJVTl9TVEFURV9QT1NUTUlHUkFURSkpIHsNCisgICAg
ICAgIGVycm9yX3NldGcoZXJycCwgIkNhbid0IG1pZ3JhdGUgdGhlIHZtIHRoYXQgd2FzIHBhdXNl
ZCBkdWUgdG8gIg0KKyAgICAgICAgICAgICAgICAgICAicHJldmlvdXMgbWlncmF0aW9uIik7DQor
ICAgICAgICByZXR1cm4gZmFsc2U7DQorICAgIH0NCisNCiAgICAgaWYgKG1pZ3JhdGlvbl9pc19i
bG9ja2VkKGVycnApKSB7DQogICAgICAgICByZXR1cm4gZmFsc2U7DQogICAgIH0NCi0tIA0KMi43
LjQNCg0KW1BhdGNoIHYyXTogaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11
LWRldmVsLzIwMjAtMTIvbXNnMDEzMTguaHRtbA0KW1BhdGNoIHYxXTogaHR0cHM6Ly9saXN0cy5n
bnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjAtMTEvbXNnMDU5NTAuaHRtbA0K

