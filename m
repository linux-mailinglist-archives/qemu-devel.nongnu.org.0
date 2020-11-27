Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3932C5ECE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 03:54:47 +0100 (CET)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiTuI-0002dm-KB
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 21:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>)
 id 1kiTsy-000285-Lv; Thu, 26 Nov 2020 21:53:24 -0500
Received: from smtp.h3c.com ([60.191.123.56]:41419 helo=h3cspam01-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>)
 id 1kiTsu-0001X0-RH; Thu, 26 Nov 2020 21:53:24 -0500
Received: from DAG2EX10-IDC.srv.huawei-3com.com ([10.8.0.73])
 by h3cspam01-ex.h3c.com with ESMTP id 0AR2m2Y7013124;
 Fri, 27 Nov 2020 10:48:02 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) by
 DAG2EX10-IDC.srv.huawei-3com.com (10.8.0.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 27 Nov 2020 10:48:03 +0800
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074])
 by DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074%7])
 with mapi id 15.01.2106.002; Fri, 27 Nov 2020 10:48:03 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: RE: [PATCH] block: Don't inactivate bs if it is aleady inactive
Thread-Topic: [PATCH] block: Don't inactivate bs if it is aleady inactive
Thread-Index: AdbCSQxswlhoF8V3RjCLABUwyacY/ACHZ95w
Date: Fri, 27 Nov 2020 02:48:03 +0000
Message-ID: <709ba24ece6b40ae992c0a46e6e11ef7@h3c.com>
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
X-MAIL: h3cspam01-ex.h3c.com 0AR2m2Y7013124
Received-SPF: pass client-ip=60.191.123.56; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam01-ex.h3c.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Wangyong <wang.yongD@h3c.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBUaGUgZm9sbG93aW5nIHN0ZXBzIHdpbGwgY2F1c2UgcWVtdSBhc3NlcnRpb24gZmFpbHVyZToN
Cj4gLSBwYXVzZSB2bQ0KPiAtIHNhdmUgbWVtb3J5IHNuYXBzaG90IGludG8gbG9jYWwgZmlsZSB0
aHJvdWdoIGZkIG1pZ3JhdGlvbg0KPiAtIGRvIHRoZSBhYm92ZSBvcGVyYXRpb24gYWdhaW4gd2ls
bCBjYXVzZSBxZW11IGFzc2VydGlvbiBmYWlsdXJlDQo+IA0KPiBUaGUgYmFja3RyYWNlIGxvb2tz
IGxpa2U6DQo+ICMwICAweDAwMDA3ZmJmOTU4YzVjMzcgaW4gcmFpc2UgKCkgZnJvbSAvbGliL3g4
Nl82NC1saW51eC1nbnUvbGliYy5zby42DQo+ICMxICAweDAwMDA3ZmJmOTU4YzkwMjggaW4gYWJv
cnQgKCkgZnJvbSAvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42DQo+ICMyICAweDAwMDA3
ZmJmOTU4YmViZjYgaW4gPz8gKCkgZnJvbSAvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42
DQo+ICMzICAweDAwMDA3ZmJmOTU4YmVjYTIgaW4gX19hc3NlcnRfZmFpbCAoKSBmcm9tDQo+IC9s
aWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjYNCj4gIzQgIDB4MDAwMDU1Y2E4ZGVjZDM5ZCBp
biBiZHJ2X2luYWN0aXZhdGVfcmVjdXJzZSAoYnM9MHg1NWNhOTBjODA0MDApIGF0DQo+IC9idWls
ZC9xZW11LTUuMC9ibG9jay5jOjU3MjQNCj4gIzUgIDB4MDAwMDU1Y2E4ZGVjZTk2NyBpbiBiZHJ2
X2luYWN0aXZhdGVfYWxsICgpIGF0DQo+IC9idWlsZC8vcWVtdS01LjAvYmxvY2suYzo1NzkyDQo+
ICM2ICAweDAwMDA1NWNhOGRlNTUzOWQgaW4NCj4gcWVtdV9zYXZldm1fc3RhdGVfY29tcGxldGVf
cHJlY29weV9ub25faXRlcmFibGUgKGluYWN0aXZhdGVfZGlza3M9dHJ1ZSwNCj4gaW5fcG9zdGNv
cHk9ZmFsc2UsIGY9MHg1NWNhOTA3MDQ0YjApDQo+ICAgICBhdCAvYnVpbGQvcWVtdS01LjAvbWln
cmF0aW9uL3NhdmV2bS5jOjE0MDENCj4gIzcgIHFlbXVfc2F2ZXZtX3N0YXRlX2NvbXBsZXRlX3By
ZWNvcHkgKGY9MHg1NWNhOTA3MDQ0YjAsDQo+IGl0ZXJhYmxlX29ubHk9aXRlcmFibGVfb25seUBl
bnRyeT1mYWxzZSwNCj4gaW5hY3RpdmF0ZV9kaXNrcz1pbmFjdGl2YXRlX2Rpc2tzQGVudHJ5PXRy
dWUpDQo+ICAgICBhdCAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL3NhdmV2bS5jOjE0NTMNCj4g
IzggIDB4MDAwMDU1Y2E4ZGU0ZjU4MSBpbiBtaWdyYXRpb25fY29tcGxldGlvbiAocz0weDU1Y2E4
ZjY0ZDlmMCkgYXQNCj4gL2J1aWxkL3FlbXUtNS4wL21pZ3JhdGlvbi9taWdyYXRpb24uYzoyOTQx
DQo+ICM5ICBtaWdyYXRpb25faXRlcmF0aW9uX3J1biAocz0weDU1Y2E4ZjY0ZDlmMCkgYXQNCj4g
L2J1aWxkL3FlbXUtNS4wL21pZ3JhdGlvbi9taWdyYXRpb24uYzozMjk1DQo+ICMxMCBtaWdyYXRp
b25fdGhyZWFkIChvcGFxdWU9b3BhcXVlQGVudHJ5PTB4NTVjYThmNjRkOWYwKSBhdA0KPiAvYnVp
bGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlvbi5jOjM0NTkNCj4gIzExIDB4MDAwMDU1Y2E4
ZGZjNjcxNiBpbiBxZW11X3RocmVhZF9zdGFydCAoYXJncz08b3B0aW1pemVkIG91dD4pIGF0DQo+
IC9idWlsZC9xZW11LTUuMC91dGlsL3FlbXUtdGhyZWFkLXBvc2l4LmM6NTE5DQo+ICMxMiAweDAw
MDA3ZmJmOTVjNWYxODQgaW4gc3RhcnRfdGhyZWFkICgpIGZyb20NCj4gL2xpYi94ODZfNjQtbGlu
dXgtZ251L2xpYnB0aHJlYWQuc28uMA0KPiAjMTMgMHgwMDAwN2ZiZjk1OThjYmVkIGluIGNsb25l
ICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmMuc28uNg0KPiANCj4gV2hlbiB0aGUg
Zmlyc3QgbWlncmF0aW9uIGNvbXBsZXRlcywgYnMtPm9wZW5fZmxhZ3Mgd2lsbCBzZXQNCj4gQkRS
Vl9PX0lOQUNUSVZFIGZsYWcNCj4gYnkgYmRydl9pbmFjdGl2YXRlX3JlY3Vyc2UoKSwgYW5kIGR1
cmluZyB0aGUgc2Vjb25kIG1pZ3JhdGlvbiB0aGUNCj4gYmRydl9pbmFjdGl2YXRlX3JlY3Vyc2Ug
YXNzZXJ0IHRoYXQgdGhlIGJzLT5vcGVuX2ZsYWdzIGlzIGFscmVhZHkNCj4gQkRSVl9PX0lOQUNU
SVZFDQo+IGVuYWJsZWQgd2hpY2ggY2F1c2UgY3Jhc2guDQo+IA0KPiBUaGlzIHBhdGNoIGp1c3Qg
bWFrZSB0aGUgYmRydl9pbmFjdGl2YXRlX2FsbCgpIHRvIGRvbid0IGluYWN0aXZhdGUgdGhlIGJz
IGlmIGl0IGlzDQo+IGFscmVhZHkgaW5hY3RpdmUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFR1Z3Vv
eWkgPHR1Lmd1b3lpQGgzYy5jb20+DQo+IC0tLQ0KPiAgYmxvY2suYyB8IDcgKysrKysrLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2Jsb2NrLmMgYi9ibG9jay5jDQo+IGluZGV4IGYxY2VkYWMuLjAyMzYxZTEgMTAw
NjQ0DQo+IC0tLSBhL2Jsb2NrLmMNCj4gKysrIGIvYmxvY2suYw0KPiBAQCAtNTkzOCw2ICs1OTM4
LDExIEBAIHN0YXRpYyBpbnQgYmRydl9pbmFjdGl2YXRlX3JlY3Vyc2UoQmxvY2tEcml2ZXJTdGF0
ZQ0KPiAqYnMpDQo+ICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiArc3RhdGljIGJvb2wgYmRy
dl9pc19pbmFjdGl2ZShCbG9ja0RyaXZlclN0YXRlICpicykNCj4gK3sNCj4gKyAgICByZXR1cm4g
YnMtPm9wZW5fZmxhZ3MgJiBCRFJWX09fSU5BQ1RJVkU7DQo+ICt9DQo+ICsNCj4gIGludCBiZHJ2
X2luYWN0aXZhdGVfYWxsKHZvaWQpDQo+ICB7DQo+ICAgICAgQmxvY2tEcml2ZXJTdGF0ZSAqYnMg
PSBOVUxMOw0KPiBAQCAtNTk1OCw3ICs1OTYzLDcgQEAgaW50IGJkcnZfaW5hY3RpdmF0ZV9hbGwo
dm9pZCkNCj4gICAgICAgICAgLyogTm9kZXMgd2l0aCBCRFMgcGFyZW50cyBhcmUgY292ZXJlZCBi
eSByZWN1cnNpb24gZnJvbSB0aGUgbGFzdA0KPiAgICAgICAgICAgKiBwYXJlbnQgdGhhdCBnZXRz
IGluYWN0aXZhdGVkLiBEb24ndCBpbmFjdGl2YXRlIHRoZW0gYSBzZWNvbmQNCj4gICAgICAgICAg
ICogdGltZSBpZiB0aGF0IGhhcyBhbHJlYWR5IGhhcHBlbmVkLiAqLw0KPiAtICAgICAgICBpZiAo
YmRydl9oYXNfYmRzX3BhcmVudChicywgZmFsc2UpKSB7DQo+ICsgICAgICAgIGlmIChiZHJ2X2hh
c19iZHNfcGFyZW50KGJzLCBmYWxzZSkgfHwgYmRydl9pc19pbmFjdGl2ZShicykpIHsNCj4gICAg
ICAgICAgICAgIGNvbnRpbnVlOw0KPiAgICAgICAgICB9DQo+ICAgICAgICAgIHJldCA9IGJkcnZf
aW5hY3RpdmF0ZV9yZWN1cnNlKGJzKTsNCj4gLS0NCj4gMi43LjQNCg0KUGluZw0K

