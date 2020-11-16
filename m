Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D362B3B3B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 02:53:57 +0100 (CET)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keTiO-0007iz-CN
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 20:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keThL-0007IN-Vn; Sun, 15 Nov 2020 20:52:52 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keThI-0005Uq-0J; Sun, 15 Nov 2020 20:52:50 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CZBs36jYzzVp9q;
 Mon, 16 Nov 2020 09:52:07 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.128]) by
 DGGEMM403-HUB.china.huawei.com ([10.3.20.211]) with mapi id 14.03.0487.000;
 Mon, 16 Nov 2020 09:52:26 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH-for-5.2 v2] hw/intc: fix heap-buffer-overflow in
 rxicu_realize()
Thread-Topic: [PATCH-for-5.2 v2] hw/intc: fix heap-buffer-overflow in
 rxicu_realize()
Thread-Index: AQHWuDV+i+0w/Yg1Z0uWEKx0wUz5p6nJ+ihg
Date: Mon, 16 Nov 2020 01:52:25 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA735E8@dggemm531-mbx.china.huawei.com>
References: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 20:11:22
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "f4bug@amsat.org" <f4bug@amsat.org>,
 ganqixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

S2luZGx5IHBpbmfvvIENCg0KTWF5YmUgaXQgc2hvdWxkIGJlIG5lZWQgZm9yIHZlcnNpb24gNS4y
Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENoZW5xdW4gKGt1aG4p
DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTEsIDIwMjAgMTA6MTggUE0NCj4gVG86IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS10cml2aWFsQG5vbmdudS5vcmcNCj4gQ2M6IFpoYW5n
aGFpbGlhbmcgPHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT47IGdhbnFpeGluDQo+IDxn
YW5xaXhpbkBodWF3ZWkuY29tPjsgZjRidWdAYW1zYXQub3JnOyBDaGVucXVuIChrdWhuKQ0KPiA8
a3Vobi5jaGVucXVuQGh1YXdlaS5jb20+OyBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxp
bmFyby5vcmc+Ow0KPiBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT47IFlvc2hp
bm9yaSBTYXRvDQo+IDx5c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD4NCj4gU3ViamVjdDogW1BB
VENILWZvci01LjIgdjJdIGh3L2ludGM6IGZpeCBoZWFwLWJ1ZmZlci1vdmVyZmxvdyBpbiByeGlj
dV9yZWFsaXplKCkNCj4gDQo+IFdoZW4gJ2ogPSBpY3UtPm5yX3NlbnNlIOKAkyAxJywgdGhlICdq
IDwgaWN1LT5ucl9zZW5zZScgY29uZGl0aW9uIGlzIHRydWUsIHRoZW4gJ2ogPQ0KPiBpY3UtPm5y
X3NlbnNlJywgdGhlJ2ljdS0+aW5pdF9zZW5zZVtqXScgaGFzIG91dC1vZi1ib3VuZHMgYWNjZXNz
Lg0KPiANCj4gVGhlIGFzYW4gc2hvd2VkIHN0YWNrOg0KPiBFUlJPUjogQWRkcmVzc1Nhbml0aXpl
cjogaGVhcC1idWZmZXItb3ZlcmZsb3cgb24gYWRkcmVzcyAweDYwNDAwMDAwNGQ3ZCBhdA0KPiBw
YyAweDU1ODUyY2QyNmE3NiBicCAweDdmZmUzOWYyNjIwMCBzcCAweDdmZmUzOWYyNjFmMCBSRUFE
IG9mIHNpemUgMSBhdA0KPiAweDYwNDAwMDAwNGQ3ZCB0aHJlYWQgVDANCj4gICAgICMwIDB4NTU4
NTJjZDI2YTc1IGluIHJ4aWN1X3JlYWxpemUgLi4vaHcvaW50Yy9yeF9pY3UuYzozMTENCj4gICAg
ICMxIDB4NTU4NTJjZjA3NWY3IGluIGRldmljZV9zZXRfcmVhbGl6ZWQgLi4vaHcvY29yZS9xZGV2
LmM6ODg2DQo+ICAgICAjMiAweDU1ODUyY2Q0YTMyZiBpbiBwcm9wZXJ0eV9zZXRfYm9vbCAuLi9x
b20vb2JqZWN0LmM6MjI1MQ0KPiAgICAgIzMgMHg1NTg1MmNkNGY5YmIgaW4gb2JqZWN0X3Byb3Bl
cnR5X3NldCAuLi9xb20vb2JqZWN0LmM6MTM5OA0KPiAgICAgIzQgMHg1NTg1MmNkNTRmM2YgaW4N
Cj4gb2JqZWN0X3Byb3BlcnR5X3NldF9xb2JqZWN0IC4uL3FvbS9xb20tcW9iamVjdC5jOjI4DQo+
ICAgICAjNSAweDU1ODUyY2Q0ZmMzZiBpbiBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2wgLi4vcW9t
L29iamVjdC5jOjE0NjUNCj4gICAgICM2IDB4NTU4NTJjYmYwYjI3IGluIHJlZ2lzdGVyX2ljdSAu
Li9ody9yeC9yeDYybi5jOjE1Ng0KPiAgICAgIzcgMHg1NTg1MmNiZjEyYTYgaW4gcng2Mm5fcmVh
bGl6ZSAuLi9ody9yeC9yeDYybi5jOjI2MQ0KPiAgICAgIzggMHg1NTg1MmNmMDc1ZjcgaW4gZGV2
aWNlX3NldF9yZWFsaXplZCAuLi9ody9jb3JlL3FkZXYuYzo4ODYNCj4gICAgICM5IDB4NTU4NTJj
ZDRhMzJmIGluIHByb3BlcnR5X3NldF9ib29sIC4uL3FvbS9vYmplY3QuYzoyMjUxDQo+ICAgICAj
MTAgMHg1NTg1MmNkNGY5YmIgaW4gb2JqZWN0X3Byb3BlcnR5X3NldCAuLi9xb20vb2JqZWN0LmM6
MTM5OA0KPiAgICAgIzExIDB4NTU4NTJjZDU0ZjNmIGluDQo+IG9iamVjdF9wcm9wZXJ0eV9zZXRf
cW9iamVjdCAuLi9xb20vcW9tLXFvYmplY3QuYzoyOA0KPiAgICAgIzEyIDB4NTU4NTJjZDRmYzNm
IGluIG9iamVjdF9wcm9wZXJ0eV9zZXRfYm9vbCAuLi9xb20vb2JqZWN0LmM6MTQ2NQ0KPiAgICAg
IzEzIDB4NTU4NTJjYmYxYTg1IGluIHJ4X2dkYnNpbV9pbml0IC4uL2h3L3J4L3J4LWdkYnNpbS5j
OjEwOQ0KPiAgICAgIzE0IDB4NTU4NTJjZDIyZGUwIGluIHFlbXVfaW5pdCAuLi9zb2Z0bW11L3Zs
LmM6NDM4MA0KPiAgICAgIzE1IDB4NTU4NTJjYTU3MDg4IGluIG1haW4gLi4vc29mdG1tdS9tYWlu
LmM6NDkNCj4gICAgICMxNiAweDdmZWVmYWZhNWQ0MiBpbiBfX2xpYmNfc3RhcnRfbWFpbiAoL2xp
YjY0L2xpYmMuc28uNisweDI2ZDQyKQ0KPiANCj4gQWRkIHRoZSAnaWNlLT5zcmNbaV0uc2Vuc2Un
IGluaXRpYWxpemUgdG8gdGhlIGRlZmF1bHQgdmFsdWUsIGFuZCB0aGVuIHByb2Nlc3MNCj4gaW5p
dF9zZW5zZSBhcnJheSB0byBpZGVudGlmeSB3aGljaCBpcnFzIHNob3VsZCBiZSBsZXZlbC10cmln
Z2VyZWQuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZz4NCj4gUmVwb3J0ZWQtYnk6IEV1bGVyIFJvYm90IDxldWxlci5yb2JvdEBodWF3
ZWkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFF1biA8a3Vobi5jaGVucXVuQGh1YXdlaS5j
b20+DQo+IC0tLQ0KPiBDYzogWW9zaGlub3JpIFNhdG8gPHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdl
LmpwPg0KPiANCj4gdjEtPnYyOg0KPiBNb2RpZnkgdGhlIGNvZGUgbG9naWMgYmFzZWQgb24gUGV0
ZXIncyBzdWdnZXN0aW9ucy4NCj4gV2UgZmlyc3QgaW5pdGlhbGl6ZSBldmVyeXRoaW5nIHRvIHRo
ZSBkZWZhdWx0IGJlZm9yZSBwcm9jZXNzaW5nIHRoZSBpbml0X3NlbnNlDQo+IGFycmF5IHRvIGlk
ZW50aWZ5IHdoaWNoIGlycXMgc2hvdWxkIGJlIGxldmVsLXRyaWdnZXJlZC4NCj4gLS0tDQo+ICBo
dy9pbnRjL3J4X2ljdS5jIHwgMTggKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9o
dy9pbnRjL3J4X2ljdS5jIGIvaHcvaW50Yy9yeF9pY3UuYyBpbmRleCA5NGUxN2E5ZGVhLi5lNWMw
MTgwN2I5DQo+IDEwMDY0NA0KPiAtLS0gYS9ody9pbnRjL3J4X2ljdS5jDQo+ICsrKyBiL2h3L2lu
dGMvcnhfaWN1LmMNCj4gQEAgLTMwMCwyMiArMzAwLDIwIEBAIHN0YXRpYyBjb25zdCBNZW1vcnlS
ZWdpb25PcHMgaWN1X29wcyA9IHsgIHN0YXRpYw0KPiB2b2lkIHJ4aWN1X3JlYWxpemUoRGV2aWNl
U3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKSAgew0KPiAgICAgIFJYSUNVU3RhdGUgKmljdSA9IFJY
X0lDVShkZXYpOw0KPiAtICAgIGludCBpLCBqOw0KPiArICAgIGludCBpOw0KPiANCj4gICAgICBp
ZiAoaWN1LT5pbml0X3NlbnNlID09IE5VTEwpIHsNCj4gICAgICAgICAgcWVtdV9sb2dfbWFzayhM
T0dfR1VFU1RfRVJST1IsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgInJ4X2ljdTogdHJpZ2dl
ci1sZXZlbCBwcm9wZXJ0eSBtdXN0IGJlIHNldC4iKTsNCj4gICAgICAgICAgcmV0dXJuOw0KPiAg
ICAgIH0NCj4gLSAgICBmb3IgKGkgPSBqID0gMDsgaSA8IE5SX0lSUVM7IGkrKykgew0KPiAtICAg
ICAgICBpZiAoaWN1LT5pbml0X3NlbnNlW2pdID09IGkpIHsNCj4gLSAgICAgICAgICAgIGljdS0+
c3JjW2ldLnNlbnNlID0gVFJHX0xFVkVMOw0KPiAtICAgICAgICAgICAgaWYgKGogPCBpY3UtPm5y
X3NlbnNlKSB7DQo+IC0gICAgICAgICAgICAgICAgaisrOw0KPiAtICAgICAgICAgICAgfQ0KPiAt
ICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAgaWN1LT5zcmNbaV0uc2Vuc2UgPSBUUkdf
UEVER0U7DQo+IC0gICAgICAgIH0NCj4gKw0KPiArICAgIGZvciAoaSA9IDA7IGkgPCBOUl9JUlFT
OyBpKyspIHsNCj4gKyAgICAgICAgaWN1LT5zcmNbaV0uc2Vuc2UgPSBUUkdfUEVER0U7DQo+ICsg
ICAgfQ0KPiArICAgIGZvciAoaSA9IDA7IGkgPCBpY3UtPm5yX3NlbnNlOyBpKyspIHsNCj4gKyAg
ICAgICAgdWludDhfdCBpcnFubyA9IGljdS0+aW5pdF9zZW5zZVtpXTsNCj4gKyAgICAgICAgaWN1
LT5zcmNbaXJxbm9dLnNlbnNlID0gVFJHX0xFVkVMOw0KPiAgICAgIH0NCj4gICAgICBpY3UtPnJl
cV9pcnEgPSAtMTsNCj4gIH0NCj4gLS0NCj4gMi4yNy4wDQoNCg==

