Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF52CD273
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:23:53 +0100 (CET)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkkq7-0004ku-Na
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>)
 id 1kkkpE-0004I2-GX; Thu, 03 Dec 2020 04:22:56 -0500
Received: from smtp.h3c.com ([60.191.123.56]:56747 helo=h3cspam01-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>)
 id 1kkkp6-0002sR-U7; Thu, 03 Dec 2020 04:22:55 -0500
Received: from DAG2EX10-IDC.srv.huawei-3com.com ([10.8.0.73])
 by h3cspam01-ex.h3c.com with ESMTP id 0B39M8Hf053202;
 Thu, 3 Dec 2020 17:22:09 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) by
 DAG2EX10-IDC.srv.huawei-3com.com (10.8.0.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 3 Dec 2020 17:22:11 +0800
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074])
 by DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074%7])
 with mapi id 15.01.2106.002; Thu, 3 Dec 2020 17:22:11 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>
Subject: RE: [PATCH] block: Don't inactivate bs if it is aleady inactive
Thread-Topic: [PATCH] block: Don't inactivate bs if it is aleady inactive
Thread-Index: AdbCSQxswlhoF8V3RjCLABUwyacY/AC1xjqAAQyE6/A=
Date: Thu, 3 Dec 2020 09:22:11 +0000
Message-ID: <987f31276a754d2d8cc84d1340d62067@h3c.com>
References: <b6caaaf3bfa84e3d913c81361b32ddae@h3c.com>
 <5881a9de-9fc0-63a0-2bb2-7999cf533a51@virtuozzo.com>
In-Reply-To: <5881a9de-9fc0-63a0-2bb2-7999cf533a51@virtuozzo.com>
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
X-MAIL: h3cspam01-ex.h3c.com 0B39M8Hf053202
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWbGFkaW1pciBTZW1lbnRzb3Yt
T2dpZXZza2l5IFttYWlsdG86dnNlbWVudHNvdkB2aXJ0dW96em8uY29tXQ0KPiBTZW50OiBTYXR1
cmRheSwgTm92ZW1iZXIgMjgsIDIwMjAgNDo0OCBQTQ0KPiBUbzogdHVndW95aSAoQ2xvdWQpIDx0
dS5ndW95aUBoM2MuY29tPjsgS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT47DQo+IE1heCBS
ZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+OyBxZW11LWJsb2NrQG5vbmdudS5vcmcNCj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgd2FuZ3lvbmcgKENsb3VkKSA8d2FuZy55b25nREBoM2MuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBibG9jazogRG9uJ3QgaW5hY3RpdmF0ZSBicyBpZiBp
dCBpcyBhbGVhZHkgaW5hY3RpdmUNCj4gDQo+IDI0LjExLjIwMjAgMTM6MDQsIFR1Z3VveWkgd3Jv
dGU6DQo+ID4gVGhlIGZvbGxvd2luZyBzdGVwcyB3aWxsIGNhdXNlIHFlbXUgYXNzZXJ0aW9uIGZh
aWx1cmU6DQo+ID4gLSBwYXVzZSB2bQ0KPiA+IC0gc2F2ZSBtZW1vcnkgc25hcHNob3QgaW50byBs
b2NhbCBmaWxlIHRocm91Z2ggZmQgbWlncmF0aW9uDQo+ID4gLSBkbyB0aGUgYWJvdmUgb3BlcmF0
aW9uIGFnYWluIHdpbGwgY2F1c2UgcWVtdSBhc3NlcnRpb24gZmFpbHVyZQ0KPiANCj4gSGkhDQo+
IA0KPiBXaHkgZG8geW91IG5lZWQgc3VjaCBzY2VuYXJpbz8gSXNuJ3QgaXQgbW9yZSBjb3JyZWN0
IGFuZCBzYWZlciB0byBqdXN0DQo+IGVycm9yLW91dCBvbiBzYXZldm0gaWYgZGlza3MgYXJlIGFs
cmVhZHkgaW5hY3RpdmU/IEluYWN0aXZlIGRpc2tzIGFyZSBhIHNpZ24sDQo+IHRoYXQgdm0gbWF5
IGJlIG1pZ3JhdGVkIHRvIG90aGVyIGhvc3QgYW5kIGFscmVhZHkgcnVubmluZywgc28gY3JlYXRp
bmcgYW55DQo+IGtpbmQgb2Ygc25hcHNob3RzIG9mIHRoaXMgb2xkIHN0YXRlIG1heSBiZSBiYWQg
aWRlYS4gSSBtZWFuLCB5b3UgdHJ5IHRvIGFsbG93IGENCj4gZG91YnRmdWwgZmVhdHVyZSB0byBh
dm9pZCBhbiBhc3NlcnRpb24uIElmIHlvdSBkb24ndCBoYXZlIHN0cm9uZyByZWFzb25zIGZvciB0
aGUNCj4gZmVhdHVyZSwgaXQncyBiZXR0ZXIgdG8gdHVybiBhIGNyYXNoIGludG8gY2xlYW4gZXJy
b3Itb3V0Lg0KDQpUaGlzIHNjZW5hcmlvIGlzIHRyaWdnZXJlZCBieSBhdXRvIHRlc3QgdG9vbCB3
aGljaCBoYXMgYSBzbmFwc2hvdCBwb2xpY3kgdGhhdCBjcmVhdGUgDQpleHRlcm5hbCBzbmFwc2hv
dHMgb2YgZGlzayBhbmQgbWVtb3J5IHBlcmlvZGljYWxseSBieSB2aXJzaC4gQnV0IGR1cmluZyB0
aGUgdGVzdCwgDQp0aGUgdmlydHVhbCBtYWNoaW5lIGdldCBwYXVzZWQgZHVlIHRvIHN0b3JhZ2Ug
c2hvcnRhZ2UsIHNvIHRoZSBzZWNvbmQgZXh0ZXJuYWwgc25hcHNob3QNCmFmdGVyIHRoYXQgcG9p
bnQgd2lsbCBjYXVzZSBxZW11IGNyYXNoLg0KDQpJIGFncmVlIHRoYXQgaXQncyBiZXR0ZXIgdG8g
ZXJyb3Itb3V0IHdoZW4gdGhhdCBjYXNlIGhhcHBlbnMuDQoNCj4gQXMgZmFyIGFzIEkgcmVtZW1i
ZXIsIGJkcnZfaW5hY3RpdmVfYWxsKCkgaXMgdGhlIG9ubHkgc291cmNlIG9mIGluYWN0aXZhdGlv
biwgc28NCj4gYWN0dWFsbHksIGl0J3MgbW9yZSBsaWtlICJpbmFjdGl2ZSIgc3RhdGUgb2YgdGhl
IHZtLCBub3QganVzdCBzb21lIGRpc2tzIGFyZQ0KPiBpbmFjdGl2ZS4uIEFuZCB5b3UgY2hhbmdl
IHRoZSBjb2RlIGluIGEgd2F5IHRoYXQgaXQgbG9va3MgbGlrZSB0aGF0IHNvbWUgZGlza3MNCj4g
bWF5IGJlIGluYWN0aXZlIGFuZCBzb21lIG5vdCwgd2hpY2ggd291bGQgYWN0dWFsbHkgYmUgdW5l
eHBlY3RlZCBiZWhhdmlvci4NCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLCBhbmQgSSdsbCBz
ZW5kIGEgbmV3IHBhdGNoDQoNCj4gPg0KPiA+IFRoZSBiYWNrdHJhY2UgbG9va3MgbGlrZToNCj4g
PiAjMCAgMHgwMDAwN2ZiZjk1OGM1YzM3IGluIHJhaXNlICgpIGZyb20gL2xpYi94ODZfNjQtbGlu
dXgtZ251L2xpYmMuc28uNg0KPiA+ICMxICAweDAwMDA3ZmJmOTU4YzkwMjggaW4gYWJvcnQgKCkg
ZnJvbSAvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42DQo+ID4gIzIgIDB4MDAwMDdmYmY5
NThiZWJmNiBpbiA/PyAoKSBmcm9tIC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjYNCj4g
PiAjMyAgMHgwMDAwN2ZiZjk1OGJlY2EyIGluIF9fYXNzZXJ0X2ZhaWwgKCkgZnJvbQ0KPiAvbGli
L3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42DQo+ID4gIzQgIDB4MDAwMDU1Y2E4ZGVjZDM5ZCBp
biBiZHJ2X2luYWN0aXZhdGVfcmVjdXJzZSAoYnM9MHg1NWNhOTBjODA0MDApDQo+IGF0IC9idWls
ZC9xZW11LTUuMC9ibG9jay5jOjU3MjQNCj4gPiAjNSAgMHgwMDAwNTVjYThkZWNlOTY3IGluIGJk
cnZfaW5hY3RpdmF0ZV9hbGwgKCkgYXQNCj4gL2J1aWxkLy9xZW11LTUuMC9ibG9jay5jOjU3OTIN
Cj4gPiAjNiAgMHgwMDAwNTVjYThkZTU1MzlkIGluDQo+IHFlbXVfc2F2ZXZtX3N0YXRlX2NvbXBs
ZXRlX3ByZWNvcHlfbm9uX2l0ZXJhYmxlIChpbmFjdGl2YXRlX2Rpc2tzPXRydWUsDQo+IGluX3Bv
c3Rjb3B5PWZhbHNlLCBmPTB4NTVjYTkwNzA0NGIwKQ0KPiA+ICAgICAgYXQgL2J1aWxkL3FlbXUt
NS4wL21pZ3JhdGlvbi9zYXZldm0uYzoxNDAxDQo+ID4gIzcgIHFlbXVfc2F2ZXZtX3N0YXRlX2Nv
bXBsZXRlX3ByZWNvcHkgKGY9MHg1NWNhOTA3MDQ0YjAsDQo+IGl0ZXJhYmxlX29ubHk9aXRlcmFi
bGVfb25seUBlbnRyeT1mYWxzZSwNCj4gaW5hY3RpdmF0ZV9kaXNrcz1pbmFjdGl2YXRlX2Rpc2tz
QGVudHJ5PXRydWUpDQo+ID4gICAgICBhdCAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL3NhdmV2
bS5jOjE0NTMNCj4gPiAjOCAgMHgwMDAwNTVjYThkZTRmNTgxIGluIG1pZ3JhdGlvbl9jb21wbGV0
aW9uIChzPTB4NTVjYThmNjRkOWYwKSBhdA0KPiAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL21p
Z3JhdGlvbi5jOjI5NDENCj4gPiAjOSAgbWlncmF0aW9uX2l0ZXJhdGlvbl9ydW4gKHM9MHg1NWNh
OGY2NGQ5ZjApIGF0DQo+IC9idWlsZC9xZW11LTUuMC9taWdyYXRpb24vbWlncmF0aW9uLmM6MzI5
NQ0KPiA+ICMxMCBtaWdyYXRpb25fdGhyZWFkIChvcGFxdWU9b3BhcXVlQGVudHJ5PTB4NTVjYThm
NjRkOWYwKSBhdA0KPiAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlvbi5jOjM0NTkN
Cj4gPiAjMTEgMHgwMDAwNTVjYThkZmM2NzE2IGluIHFlbXVfdGhyZWFkX3N0YXJ0IChhcmdzPTxv
cHRpbWl6ZWQgb3V0PikgYXQNCj4gL2J1aWxkL3FlbXUtNS4wL3V0aWwvcWVtdS10aHJlYWQtcG9z
aXguYzo1MTkNCj4gPiAjMTIgMHgwMDAwN2ZiZjk1YzVmMTg0IGluIHN0YXJ0X3RocmVhZCAoKSBm
cm9tDQo+IC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJwdGhyZWFkLnNvLjANCj4gPiAjMTMgMHgw
MDAwN2ZiZjk1OThjYmVkIGluIGNsb25lICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251L2xp
YmMuc28uNg0KPiA+DQo+ID4gV2hlbiB0aGUgZmlyc3QgbWlncmF0aW9uIGNvbXBsZXRlcywgYnMt
Pm9wZW5fZmxhZ3Mgd2lsbCBzZXQNCj4gQkRSVl9PX0lOQUNUSVZFIGZsYWcNCj4gPiBieSBiZHJ2
X2luYWN0aXZhdGVfcmVjdXJzZSgpLCBhbmQgZHVyaW5nIHRoZSBzZWNvbmQgbWlncmF0aW9uIHRo
ZQ0KPiA+IGJkcnZfaW5hY3RpdmF0ZV9yZWN1cnNlIGFzc2VydCB0aGF0IHRoZSBicy0+b3Blbl9m
bGFncyBpcyBhbHJlYWR5DQo+IEJEUlZfT19JTkFDVElWRQ0KPiA+IGVuYWJsZWQgd2hpY2ggY2F1
c2UgY3Jhc2guDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGp1c3QgbWFrZSB0aGUgYmRydl9pbmFjdGl2
YXRlX2FsbCgpIHRvIGRvbid0IGluYWN0aXZhdGUgdGhlIGJzIGlmIGl0IGlzDQo+ID4gYWxyZWFk
eSBpbmFjdGl2ZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVHVndW95aSA8dHUuZ3VveWlAaDNj
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGJsb2NrLmMgfCA3ICsrKysrKy0NCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9ibG9jay5jIGIvYmxvY2suYw0KPiA+IGluZGV4IGYxY2VkYWMuLjAyMzYxZTEgMTAwNjQ0
DQo+ID4gLS0tIGEvYmxvY2suYw0KPiA+ICsrKyBiL2Jsb2NrLmMNCj4gPiBAQCAtNTkzOCw2ICs1
OTM4LDExIEBAIHN0YXRpYyBpbnQNCj4gYmRydl9pbmFjdGl2YXRlX3JlY3Vyc2UoQmxvY2tEcml2
ZXJTdGF0ZSAqYnMpDQo+ID4gICAgICAgcmV0dXJuIDA7DQo+ID4gICB9DQo+ID4NCj4gPiArc3Rh
dGljIGJvb2wgYmRydl9pc19pbmFjdGl2ZShCbG9ja0RyaXZlclN0YXRlICpicykNCj4gPiArew0K
PiA+ICsgICAgcmV0dXJuIGJzLT5vcGVuX2ZsYWdzICYgQkRSVl9PX0lOQUNUSVZFOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICAgaW50IGJkcnZfaW5hY3RpdmF0ZV9hbGwodm9pZCkNCj4gPiAgIHsNCj4g
PiAgICAgICBCbG9ja0RyaXZlclN0YXRlICpicyA9IE5VTEw7DQo+ID4gQEAgLTU5NTgsNyArNTk2
Myw3IEBAIGludCBiZHJ2X2luYWN0aXZhdGVfYWxsKHZvaWQpDQo+ID4gICAgICAgICAgIC8qIE5v
ZGVzIHdpdGggQkRTIHBhcmVudHMgYXJlIGNvdmVyZWQgYnkgcmVjdXJzaW9uIGZyb20gdGhlDQo+
IGxhc3QNCj4gPiAgICAgICAgICAgICogcGFyZW50IHRoYXQgZ2V0cyBpbmFjdGl2YXRlZC4gRG9u
J3QgaW5hY3RpdmF0ZSB0aGVtIGEgc2Vjb25kDQo+ID4gICAgICAgICAgICAqIHRpbWUgaWYgdGhh
dCBoYXMgYWxyZWFkeSBoYXBwZW5lZC4gKi8NCj4gPiAtICAgICAgICBpZiAoYmRydl9oYXNfYmRz
X3BhcmVudChicywgZmFsc2UpKSB7DQo+ID4gKyAgICAgICAgaWYgKGJkcnZfaGFzX2Jkc19wYXJl
bnQoYnMsIGZhbHNlKSB8fCBiZHJ2X2lzX2luYWN0aXZlKGJzKSkgew0KPiA+ICAgICAgICAgICAg
ICAgY29udGludWU7DQo+ID4gICAgICAgICAgIH0NCj4gPiAgICAgICAgICAgcmV0ID0gYmRydl9p
bmFjdGl2YXRlX3JlY3Vyc2UoYnMpOw0KPiA+DQo+IA0KPiANCj4gDQo+IC0tDQo+IEJlc3QgcmVn
YXJkcywNCj4gVmxhZGltaXINCg==

