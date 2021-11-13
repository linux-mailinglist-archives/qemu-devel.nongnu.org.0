Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A344F249
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 10:22:41 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlpF9-00027J-6f
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 04:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mlpEO-0001Rn-Ee
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 04:21:52 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mlpEL-0006KB-AR
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 04:21:52 -0500
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hrqf23QGqz1DJGn;
 Sat, 13 Nov 2021 17:19:22 +0800 (CST)
Received: from dggpemm500008.china.huawei.com (7.185.36.136) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 13 Nov 2021 17:21:40 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500008.china.huawei.com (7.185.36.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 13 Nov 2021 17:21:40 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.015;
 Sat, 13 Nov 2021 17:21:39 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v5 4/6] kvm: irqchip: extract
 kvm_irqchip_add_deferred_msi_route
Thread-Topic: [PATCH v5 4/6] kvm: irqchip: extract
 kvm_irqchip_add_deferred_msi_route
Thread-Index: AQHX0IsxWviLXRP53kGau6vBqNcnCav/KQoAgAHxZTA=
Date: Sat, 13 Nov 2021 09:21:39 +0000
Message-ID: <50dd003fefbf4f3e961b07586613dcf5@huawei.com>
References: <20211103081657.1945-1-longpeng2@huawei.com>
 <20211103081657.1945-5-longpeng2@huawei.com>
 <e4b6e45f-dddd-8401-8d7b-9d9cc4f1def0@redhat.com>
In-Reply-To: <e4b6e45f-dddd-8401-8d7b-9d9cc4f1def0@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFvbG8gQm9uemluaSBb
bWFpbHRvOnBib256aW5pQHJlZGhhdC5jb21dDQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTIs
IDIwMjEgNTozMiBQTQ0KPiBUbzogTG9uZ3BlbmcgKE1pa2UsIENsb3VkIEluZnJhc3RydWN0dXJl
IFNlcnZpY2UgUHJvZHVjdCBEZXB0LikNCj4gPGxvbmdwZW5nMkBodWF3ZWkuY29tPjsgYWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsga3ZtQHZn
ZXIua2VybmVsLm9yZzsgR29uZ2xlaSAoQXJlaSkNCj4gPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDQvNl0ga3ZtOiBpcnFjaGlwOiBleHRyYWN0DQo+
IGt2bV9pcnFjaGlwX2FkZF9kZWZlcnJlZF9tc2lfcm91dGUNCj4gDQo+IE9uIDExLzMvMjEgMDk6
MTYsIExvbmdwZW5nKE1pa2UpIHdyb3RlOg0KPiA+IEV4dHJhY3QgYSBjb21tb24gaGVscGVyIHRo
YXQgYWRkIE1TSSByb3V0ZSBmb3Igc3BlY2lmaWMgdmVjdG9yDQo+ID4gYnV0IGRvZXMgbm90IGNv
bW1pdCBpbW1lZGlhdGVseS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExvbmdwZW5nKE1pa2Up
IDxsb25ncGVuZzJAaHVhd2VpLmNvbT4NCj4gDQo+IEkgdGhpbmsgYWRkaW5nIHRoZSBuZXcgZnVu
Y3Rpb24gaXMgbm90IG5lY2Vzc2FyeTsgSSBoYXZlIG5vIHByb2JsZW0NCj4gbW92aW5nIHRoZSBj
YWxsIHRvIGt2bV9pcnFjaGlwX2NvbW1pdF9yb3V0ZXMgdG8gdGhlIGNhbGxlcnMuICBQZXJoYXBz
DQo+IHlvdSBjYW4gaGF2ZSBhbiBBUEkgbGlrZSB0aGlzOg0KPiANCj4gdHlwZWRlZiBzdHJ1Y3Qg
S1ZNUm91dGVDaGFuZ2Ugew0KPiAgICAgIEtWTVN0YXRlICpzOw0KPiAgICAgIGludCBjaGFuZ2Vz
Ow0KPiB9IEtWTVJvdXRlQ2hhbmdlOw0KPiANCj4gS1ZNUm91dGVDaGFuZ2Uga3ZtX2lycWNoaXBf
YmVnaW5fcm91dGVfY2hhbmdlcyhLVk1TdGF0ZSAqcykNCj4gew0KPiAgICAgIHJldHVybiAoS1ZN
Um91dGVDaGFuZ2UpIHsgLnMgPSBzLCAuY2hhbmdlcyA9IDAgfTsNCj4gfQ0KPiANCj4gdm9pZCBr
dm1faXJxY2hpcF9jb21taXRfcm91dGVfY2hhbmdlcyhLVk1Sb3V0ZUNoYW5nZSAqYykNCj4gew0K
PiAgICAgIGlmIChjLT5jaGFuZ2VzKSB7DQo+ICAgICAgICAgIGt2bV9pcnFjaGlwX2NvbW1pdF9y
b3V0ZXMoYy0+cyk7DQo+ICAgICAgICAgIGMtPmNoYW5nZXMgPSAwOw0KPiAgICAgfQ0KPiB9DQo+
IA0KPiBpbnQga3ZtX2lycWNoaXBfYWRkX21zaV9yb3V0ZShLVk1Sb3V0ZUNoYW5nZSAqYywgaW50
IHZlY3RvciwgUENJRGV2aWNlICpkZXYpDQo+IHsNCj4gICAgICBLVk1TdGF0ZSAqcyA9IGMtPnM7
DQo+ICAgICAgLi4uDQo+ICAgICAga3ZtX2FkZF9yb3V0aW5nX2VudHJ5KHMsICZrcm91dGUpOw0K
PiAgICAgIGt2bV9hcmNoX2FkZF9tc2lfcm91dGVfcG9zdCgma3JvdXRlLCB2ZWN0b3IsIGRldik7
DQo+ICAgICAgYy0+Y2hhbmdlcysrOw0KPiANCj4gICAgICByZXR1cm4gdmlycTsNCj4gfQ0KPiAN
Cj4gc28gaXQncyBoYXJkZXIgZm9yIHRoZSBjYWxsZXJzIHRvICJmb3JnZXQiIGt2bV9pcnFjaGlw
X2NvbW1pdF9yb3V0ZV9jaGFuZ2VzLg0KPiANCg0KTWFrZSBzZW5zZS4NCg0KV2UgaGF2ZSA0IGFk
ZGluZyBmdW5jdGlvbnMgY3VycmVudGx5LCB0aGUgZmlyc3QgdHdvIHRyaWdnZXIgY29tbWl0dGlu
ZyBpbnNpZGUNCmFuZCB0aGUgb3RoZXJzIGRvIG5vdC4NCiAxLiBrdm1faXJxY2hpcF9hZGRfYWRh
cHRlcl9yb3V0ZSAoY29tbWl0IGluc2lkZSkNCiAyLiBrdm1faXJxY2hpcF9hZGRfbXNpX3JvdXRl
IChjb21taXQgaW5zaWRlKQ0KIDMuIGt2bV9pcnFjaGlwX2FkZF9pcnFfcm91dGUgKGNvbW1pdCBv
dXRzaWRlKQ0KIDQuIGt2bV9pcnFjaGlwX2FkZF9odl9zaW50X3JvdXRlIChjb21taXQgb3V0c2lk
ZSkNCg0KSG93IGFib3V0IGp1c3QgbW92aW5nIHRoZSBrdm1faXJxY2hpcF9jb21taXRfcm91dGVz
KCkgb3V0IG9mIA0Ka3ZtX2lycWNoaXBfYWRkX21zaV9yb3V0ZSgpIGluIHRoaXMgc2VyaWVzIGFu
ZCBpbXBsZW1lbnQgdGhlIHNvbHV0aW9uIHlvdQ0Kc3VnZ2VzdGVkIGluIGFub3RoZXIgc2VyaWVz
ID8gSSB0aGluayB3ZSBzaG91bGQgYXBwbHkgdGhlIHNvbHV0aW9uIHRvDQpzMzkwX2FkYXB0ZXIg
cm91dGluZyB0eXBlIGFuZCB1cGRhdGluZyBwYXRocy4NCg0KDQo+IFBhb2xvDQo+IA0KPiA+IC0t
LQ0KPiA+ICAgYWNjZWwva3ZtL2t2bS1hbGwuYyAgfCAxNSArKysrKysrKysrKysrLS0NCj4gPiAg
IGluY2x1ZGUvc3lzZW11L2t2bS5oIHwgIDYgKysrKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
YWNjZWwva3ZtL2t2bS1hbGwuYyBiL2FjY2VsL2t2bS9rdm0tYWxsLmMNCj4gPiBpbmRleCBkYjhk
ODNiLi44NjI3ZjdjIDEwMDY0NA0KPiA+IC0tLSBhL2FjY2VsL2t2bS9rdm0tYWxsLmMNCj4gPiAr
KysgYi9hY2NlbC9rdm0va3ZtLWFsbC5jDQo+ID4gQEAgLTE5NTMsNyArMTk1Myw3IEBAIGludCBr
dm1faXJxY2hpcF9zZW5kX21zaShLVk1TdGF0ZSAqcywgTVNJTWVzc2FnZSBtc2cpDQo+ID4gICAg
ICAgcmV0dXJuIGt2bV9zZXRfaXJxKHMsIHJvdXRlLT5rcm91dGUuZ3NpLCAxKTsNCj4gPiAgIH0N
Cj4gPg0KPiA+IC1pbnQga3ZtX2lycWNoaXBfYWRkX21zaV9yb3V0ZShLVk1TdGF0ZSAqcywgaW50
IHZlY3RvciwgUENJRGV2aWNlICpkZXYpDQo+ID4gK2ludCBrdm1faXJxY2hpcF9hZGRfZGVmZXJy
ZWRfbXNpX3JvdXRlKEtWTVN0YXRlICpzLCBpbnQgdmVjdG9yLCBQQ0lEZXZpY2UNCj4gKmRldikN
Cj4gPiAgIHsNCj4gPiAgICAgICBzdHJ1Y3Qga3ZtX2lycV9yb3V0aW5nX2VudHJ5IGtyb3V0ZSA9
IHt9Ow0KPiA+ICAgICAgIGludCB2aXJxOw0KPiA+IEBAIC0xOTk2LDcgKzE5OTYsMTggQEAgaW50
IGt2bV9pcnFjaGlwX2FkZF9tc2lfcm91dGUoS1ZNU3RhdGUgKnMsIGludCB2ZWN0b3IsDQo+IFBD
SURldmljZSAqZGV2KQ0KPiA+DQo+ID4gICAgICAga3ZtX2FkZF9yb3V0aW5nX2VudHJ5KHMsICZr
cm91dGUpOw0KPiA+ICAgICAgIGt2bV9hcmNoX2FkZF9tc2lfcm91dGVfcG9zdCgma3JvdXRlLCB2
ZWN0b3IsIGRldik7DQo+ID4gLSAgICBrdm1faXJxY2hpcF9jb21taXRfcm91dGVzKHMpOw0KPiA+
ICsNCj4gPiArICAgIHJldHVybiB2aXJxOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtpbnQga3ZtX2ly
cWNoaXBfYWRkX21zaV9yb3V0ZShLVk1TdGF0ZSAqcywgaW50IHZlY3RvciwgUENJRGV2aWNlICpk
ZXYpDQo+ID4gK3sNCj4gPiArICAgIGludCB2aXJxOw0KPiA+ICsNCj4gPiArICAgIHZpcnEgPSBr
dm1faXJxY2hpcF9hZGRfZGVmZXJyZWRfbXNpX3JvdXRlKHMsIHZlY3RvciwgZGV2KTsNCj4gPiAr
ICAgIGlmICh2aXJxID49IDApIHsNCj4gPiArICAgICAgICBrdm1faXJxY2hpcF9jb21taXRfcm91
dGVzKHMpOw0KPiA+ICsgICAgfQ0KPiA+DQo+ID4gICAgICAgcmV0dXJuIHZpcnE7DQo+ID4gICB9
DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3lzZW11L2t2bS5oIGIvaW5jbHVkZS9zeXNlbXUv
a3ZtLmgNCj4gPiBpbmRleCBhMWFiMWVlLi44ZGUwZDlhIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1
ZGUvc3lzZW11L2t2bS5oDQo+ID4gKysrIGIvaW5jbHVkZS9zeXNlbXUva3ZtLmgNCj4gPiBAQCAt
NDc2LDYgKzQ3NiwxMiBAQCB2b2lkIGt2bV9pbml0X2NwdV9zaWduYWxzKENQVVN0YXRlICpjcHUp
Ow0KPiA+ICAgICogQHJldHVybjogdmlycSAoPj0wKSB3aGVuIHN1Y2Nlc3MsIGVycm5vICg8MCkg
d2hlbiBmYWlsZWQuDQo+ID4gICAgKi8NCj4gPiAgIGludCBrdm1faXJxY2hpcF9hZGRfbXNpX3Jv
dXRlKEtWTVN0YXRlICpzLCBpbnQgdmVjdG9yLCBQQ0lEZXZpY2UgKmRldik7DQo+ID4gKy8qKg0K
PiA+ICsgKiBBZGQgTVNJIHJvdXRlIGZvciBzcGVjaWZpYyB2ZWN0b3IgYnV0IGRvZXMgbm90IGNv
bW1pdCB0byBLVk0NCj4gPiArICogaW1tZWRpYXRlbHkNCj4gPiArICovDQo+ID4gK2ludCBrdm1f
aXJxY2hpcF9hZGRfZGVmZXJyZWRfbXNpX3JvdXRlKEtWTVN0YXRlICpzLCBpbnQgdmVjdG9yLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lEZXZpY2UgKmRl
dik7DQo+ID4gICBpbnQga3ZtX2lycWNoaXBfdXBkYXRlX21zaV9yb3V0ZShLVk1TdGF0ZSAqcywg
aW50IHZpcnEsIE1TSU1lc3NhZ2UgbXNnLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUENJRGV2aWNlICpkZXYpOw0KPiA+ICAgdm9pZCBrdm1faXJxY2hpcF9jb21taXRf
cm91dGVzKEtWTVN0YXRlICpzKTsNCj4gPg0KDQo=

