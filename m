Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED331E916
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:48:58 +0100 (CET)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChnk-0004wR-W1
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lChlt-0004BZ-Rg; Thu, 18 Feb 2021 06:47:01 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lChln-0002bm-UK; Thu, 18 Feb 2021 06:47:00 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DhCZB61wdzY9Ch;
 Thu, 18 Feb 2021 19:45:22 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 18 Feb 2021 19:46:44 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm500010.china.huawei.com (7.185.36.134) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 19:46:44 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2106.006; Thu, 18 Feb 2021 11:46:42 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Topic: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Index: AQHWvEUTUiE9WTe+7E+ovBX+zyeIRqpeRGbwgAAIYwCAAA9WoA==
Date: Thu, 18 Feb 2021 11:46:42 +0000
Message-ID: <5f85d8999c0c40a29c32ac63b8730fa8@huawei.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
 <20201116181349.11908-27-eric.auger@redhat.com>
 <494e4bdf5ecd4b528a016d4545d45f71@huawei.com>
 <f11ef533-da64-3d6a-24f5-79d5e7a205da@redhat.com>
In-Reply-To: <f11ef533-da64-3d6a-24f5-79d5e7a205da@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.95.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 "zhangfei.gao@gmail.com" <zhangfei.gao@gmail.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, "Zengtao
 \(B\)" <prime.zeng@hisilicon.com>, yuzenghui <yuzenghui@huawei.com>,
 qubingbing <qubingbing@hisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpIaSBFcmljLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEF1Z2Vy
IEVyaWMgW21haWx0bzplcmljLmF1Z2VyQHJlZGhhdC5jb21dDQo+IFNlbnQ6IDE4IEZlYnJ1YXJ5
IDIwMjEgMTA6NDINCj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgPHNoYW1lZXJhbGku
a29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47DQo+IGVyaWMuYXVnZXIucHJvQGdtYWlsLmNvbTsg
cWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUub3JnOw0KPiBhbGV4LndpbGxp
YW1zb25AcmVkaGF0LmNvbQ0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBqYWNvYi5q
dW4ucGFuQGxpbnV4LmludGVsLmNvbTsgWmVuZ3RhbyAoQikNCj4gPHByaW1lLnplbmdAaGlzaWxp
Y29uLmNvbT47IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsgdG5Ac2VtaWhhbGYuY29tOw0KPiBw
ZXRlcnhAcmVkaGF0LmNvbTsgbmljb2xlb3RzdWthQGdtYWlsLmNvbTsgdml2ZWsuZ2F1dGFtQGFy
bS5jb207DQo+IHlpLmwubGl1QGludGVsLmNvbTsgemhhbmdmZWkuZ2FvQGdtYWlsLmNvbTsgeXV6
ZW5naHVpDQo+IDx5dXplbmdodWlAaHVhd2VpLmNvbT47IHF1YmluZ2JpbmcgPHF1YmluZ2JpbmdA
aGlzaWxpY29uLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgdjcgMjYvMjZdIHZmaW8vcGNpOiBJ
bXBsZW1lbnQgcmV0dXJuX3BhZ2VfcmVzcG9uc2UgcGFnZQ0KPiByZXNwb25zZSBjYWxsYmFjaw0K
PiANClsuLi5dDQoNCj4gPiBBbHNvLCBJIGp1c3Qgbm90ZWQgdGhhdCB0aGlzIHBhdGNoIGJyZWFr
cyB0aGUgZGV2IGhvdCBhZGQvZGVsIGZ1bmN0aW9uYWxpdHkuDQo+ID4gZGV2aWNlX2FkZCB3b3Jr
cyBmaW5lIGJ1dCBkZXZpY2VfZGVsIGlzIG5vdCByZW1vdmluZyB0aGUgZGV2IGNsZWFubHkuVGhh
bmsNCj4geW91IGZvciByZXBvcnRpbmcgdGhpcyENCj4gDQo+IFRoZSB0ZXN0IG1hdHJpeCBiZWNv
bWVzIGJpZ2dlciBhbmQgYmlnZ2VyIDotKCBJIE5lZWQgdG8gd3JpdGUgc29tZQ0KPiBhdm9jYWRv
LXZ0IHRlc3RzIG9yIGFsaWtlLg0KPiANCj4gSSBhbSBjdXJyZW50bHkgd29ya2luZyBvbiB0aGUg
cmVzcGluLiBBdCB0aGUgbW9tZW50IEkgaW52ZXN0aWdhdGUgdGhlDQo+IERQREsgaXNzdWUgdGhh
dCB5b3UgcmVwb3J0ZWQgYW5kIEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlLg0KDQpPay4gR29vZCB0
byBrbm93IHRoYXQgaXQgaXMgcmVwcm9kdWNpYmxlLg0KDQo+IEkgaW50ZW5kIHRvIHJlYmFzZSBv
biB0b3Agb2YgSmVhbi1QaGlsaXBwZSdzDQo+IFtQQVRDSCB2MTIgMDAvMTBdIGlvbW11OiBJL08g
cGFnZSBmYXVsdHMgZm9yIFNNTVV2Mw0KPiANCj4gSXMgdGhhdCBnb29kIGVub3VnaCBmb3IgeW91
ciBTVkEgaW50ZWdyYXRpb24gb3IgZG8geW91IHdhbnQgSSBwcmVwYXJlIGENCj4gcmViYXNlIG9u
IHNvbWUgZXh0ZW5kZWQgY29kZT8NCg0KQ291bGQgeW91IHBsZWFzZSB0cnkgdG8gYmFzZSBpdCBv
biBodHRwczovL2pwYnJ1Y2tlci5uZXQvZ2l0L2xpbnV4L2xvZy8/aD1zdmEvY3VycmVudA0KDQpJ
IHRoaW5rIHRoYXQgaGFzIHRoZSBsYXRlc3QgZnJvbSBKZWFuLVBoaWxpcHBlIGFuZCB3aWxsIGJl
IGVhc3kgdG8gYWRkDQp1YWNjZS96aXAgc3BlY2lmaWMgcGF0Y2hlcyB0byB0ZXN0IFNWQS92U1ZB
Lg0KDQpUaGFua3MsDQpTaGFtZWVyDQoNCiANCj4gVGhhbmtzDQo+IA0KPiBFcmljDQo+ID4NCj4g
PiBUaGUgYmVsb3cgb25lIGZpeGVzIGl0LiBQbGVhc2UgY2hlY2suDQo+ID4NCj4gPiBUaGFua3Ms
DQo+ID4gU2hhbWVlcg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8vcGNpLmMgYi9ody92
ZmlvL3BjaS5jDQo+ID4gaW5kZXggNzk3YWNkOWM3My4uOTJjMWQ0ODMxNiAxMDA2NDQNCj4gPiAt
LS0gYS9ody92ZmlvL3BjaS5jDQo+ID4gKysrIGIvaHcvdmZpby9wY2kuYw0KPiA+IEBAIC0zNDcw
LDYgKzM0NzAsNyBAQCBzdGF0aWMgdm9pZCB2ZmlvX2luc3RhbmNlX2ZpbmFsaXplKE9iamVjdCAq
b2JqKQ0KPiA+ICAgICAgdmZpb19kaXNwbGF5X2ZpbmFsaXplKHZkZXYpOw0KPiA+ICAgICAgdmZp
b19iYXJzX2ZpbmFsaXplKHZkZXYpOw0KPiA+ICAgICAgdmZpb19yZWdpb25fZmluYWxpemUoJnZk
ZXYtPmRtYV9mYXVsdF9yZWdpb24pOw0KPiA+ICsgICAgdmZpb19yZWdpb25fZmluYWxpemUoJnZk
ZXYtPmRtYV9mYXVsdF9yZXNwb25zZV9yZWdpb24pOw0KPiA+ICAgICAgZ19mcmVlKHZkZXYtPmVt
dWxhdGVkX2NvbmZpZ19iaXRzKTsNCj4gPiAgICAgIGdfZnJlZSh2ZGV2LT5yb20pOw0KPiA+ICAg
ICAgLyoNCj4gPiBAQCAtMzQ5MSw2ICszNDkyLDcgQEAgc3RhdGljIHZvaWQgdmZpb19leGl0Zm4o
UENJRGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgdmZpb191bnJlZ2lzdGVyX2Vycl9ub3RpZmllcih2
ZGV2KTsNCj4gPiAgICAgIHZmaW9fdW5yZWdpc3Rlcl9leHRfaXJxX25vdGlmaWVycyh2ZGV2KTsN
Cj4gPiAgICAgIHZmaW9fcmVnaW9uX2V4aXQoJnZkZXYtPmRtYV9mYXVsdF9yZWdpb24pOw0KPiA+
ICsgICAgdmZpb19yZWdpb25fZXhpdCgmdmRldi0+ZG1hX2ZhdWx0X3Jlc3BvbnNlX3JlZ2lvbik7
DQo+ID4gICAgICBwY2lfZGV2aWNlX3NldF9pbnR4X3JvdXRpbmdfbm90aWZpZXIoJnZkZXYtPnBk
ZXYsIE5VTEwpOw0KPiA+ICAgICAgaWYgKHZkZXYtPmlycWNoaXBfY2hhbmdlX25vdGlmaWVyLm5v
dGlmeSkgew0KPiA+DQo+IGt2bV9pcnFjaGlwX3JlbW92ZV9jaGFuZ2Vfbm90aWZpZXIoJnZkZXYt
PmlycWNoaXBfY2hhbmdlX25vdA0KPiA+DQo+ID4NCj4gPg0KDQo=

