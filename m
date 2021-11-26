Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ADE45E3F9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 02:23:14 +0100 (CET)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqPxJ-0001mB-3e
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 20:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mqPw7-0000Yh-1y
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 20:21:59 -0500
Received: from mga18.intel.com ([134.134.136.126]:28028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mqPw4-0007q6-2N
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 20:21:58 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222457972"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="222457972"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 17:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="475758542"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 25 Nov 2021 17:21:49 -0800
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 25 Nov 2021 17:21:48 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 26 Nov 2021 09:21:46 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.012;
 Fri, 26 Nov 2021 09:21:46 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Thread-Topic: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Thread-Index: AQHX4aM373Nsl56tkkG+6+cIJtb0FKwTY5qAgACAqgCAAABxgIABFUCQ
Date: Fri, 26 Nov 2021 01:21:46 +0000
Message-ID: <b8d226cb51d04484861f1e1809043c1d@intel.com>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
 <20211125110724-mutt-send-email-mst@kernel.org>
 <d162f85f-214b-3d4b-c860-47b3367e7099@redhat.com>
In-Reply-To: <d162f85f-214b-3d4b-c860-47b3367e7099@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=wei.w.wang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mpe@ellerman.id.au" <mpe@ellerman.id.au>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Duyck <alexander.duyck@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpZGF5LCBOb3ZlbWJlciAyNiwgMjAyMSAxMjoxMSBBTSwgRGF2aWQgSGlsZGVuYnJhbmQg
d3JvdGU6DQo+IE9uIDI1LjExLjIxIDE3OjA5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+
ID4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDk6Mjg6NTlBTSArMDEwMCwgRGF2aWQgSGlsZGVu
YnJhbmQgd3JvdGU6DQo+ID4+IE9uIDI1LjExLjIxIDAzOjIwLCBKYXNvbiBXYW5nIHdyb3RlOg0K
PiA+Pj4gV2Ugb25seSBwcm9jZXNzIHRoZSBmaXJzdCBpbiBzZyB3aGljaCBtYXkgbGVhZCB0byB0
aGUgYml0bWFwIG9mIHRoZQ0KPiA+Pj4gcGFnZXMgYmVsb25ncyB0byBmb2xsb3dpbmcgc2dzIHdl
cmUgbm90IGNsZWFyZWQuIFRoaXMgbWF5IHJlc3VsdA0KPiA+Pj4gbW9yZSBwYWdlcyB0byBiZSBt
aWdyYXRlZC4gRml4aW5nIHRoaXMgYnkgcHJvY2VzcyBhbGwgaW4gc2dzIGZvcg0KPiA+Pj4gZnJl
ZV9wYWdlX3ZxLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICBody92aXJ0aW8vdmlydGlvLWJhbGxv
b24uYyB8IDcgKysrKystLQ0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aXJ0
aW8tYmFsbG9vbi5jIGIvaHcvdmlydGlvL3ZpcnRpby1iYWxsb29uLmMNCj4gPj4+IGluZGV4IGM2
OTYyZmNiZmUuLjE3ZGUyNTU4Y2IgMTAwNjQ0DQo+ID4+PiAtLS0gYS9ody92aXJ0aW8vdmlydGlv
LWJhbGxvb24uYw0KPiA+Pj4gKysrIGIvaHcvdmlydGlvL3ZpcnRpby1iYWxsb29uLmMNCj4gPj4+
IEBAIC01MTAsNiArNTEwLDcgQEAgc3RhdGljIGJvb2wgZ2V0X2ZyZWVfcGFnZV9oaW50cyhWaXJ0
SU9CYWxsb29uDQo+ICpkZXYpDQo+ID4+PiAgICAgIFZpcnRJT0RldmljZSAqdmRldiA9IFZJUlRJ
T19ERVZJQ0UoZGV2KTsNCj4gPj4+ICAgICAgVmlydFF1ZXVlICp2cSA9IGRldi0+ZnJlZV9wYWdl
X3ZxOw0KPiA+Pj4gICAgICBib29sIHJldCA9IHRydWU7DQo+ID4+PiArICAgIGludCBpOw0KPiA+
Pj4NCj4gPj4+ICAgICAgd2hpbGUgKGRldi0+YmxvY2tfaW90aHJlYWQpIHsNCj4gPj4+ICAgICAg
ICAgIHFlbXVfY29uZF93YWl0KCZkZXYtPmZyZWVfcGFnZV9jb25kLA0KPiAmZGV2LT5mcmVlX3Bh
Z2VfbG9jayk7DQo+ID4+PiBAQCAtNTQ0LDggKzU0NSwxMCBAQCBzdGF0aWMgYm9vbCBnZXRfZnJl
ZV9wYWdlX2hpbnRzKFZpcnRJT0JhbGxvb24NCj4gKmRldikNCj4gPj4+ICAgICAgfQ0KPiA+Pj4N
Cj4gPj4+ICAgICAgaWYgKGVsZW0tPmluX251bSAmJiBkZXYtPmZyZWVfcGFnZV9oaW50X3N0YXR1
cyA9PQ0KPiBGUkVFX1BBR0VfSElOVF9TX1NUQVJUKSB7DQo+ID4+PiAtICAgICAgICBxZW11X2d1
ZXN0X2ZyZWVfcGFnZV9oaW50KGVsZW0tPmluX3NnWzBdLmlvdl9iYXNlLA0KPiA+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbGVtLT5pbl9zZ1swXS5pb3ZfbGVuKTsNCj4g
Pj4+ICsgICAgICAgIGZvciAoaSA9IDA7IGkgPCBlbGVtLT5pbl9udW07IGkrKykgew0KPiA+Pj4g
KyAgICAgICAgICAgIHFlbXVfZ3Vlc3RfZnJlZV9wYWdlX2hpbnQoZWxlbS0+aW5fc2dbaV0uaW92
X2Jhc2UsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbGVt
LT5pbl9zZ1tpXS5pb3ZfbGVuKTsNCj4gPj4+ICsgICAgICAgIH0NCj4gPj4+ICAgICAgfQ0KPiA+
Pj4NCj4gPj4+ICBvdXQ6DQo+ID4+Pg0KPiA+Pg0KPiA+PiBZZXMsIGJ1dDoNCj4gPj4NCj4gPj4g
MS4gTGludXggbmV2ZXIgdXNlZCBtb3JlIHRoYW4gb25lDQo+ID4+IDIuIFFFTVUgbmV2ZXIgY29u
c3VtZWQgbW9yZSB0aGFuIG9uZQ0KDQpZZXMsIGl0IHdvcmtzIGJhc2VkIG9uIHRoZSBmYWN0IHRo
YXQgTGludXggb25seSBzZW5kcyBvbmUgaGludCBlYWNoIHRpbWUuDQoNCj4gPj4NCj4gPj4gVGhl
IHNwZWMgc3RhdGVzOg0KPiA+Pg0KPiA+PiAiKGIpIFRoZSBkcml2ZXIgbWFwcyBhIHNlcmllcyBv
ZiBwYWdlcyBhbmQgYWRkcyB0aGVtIHRvIHRoZQ0KPiA+PiBmcmVlX3BhZ2VfdnEgYXMgaW5kaXZp
ZHVhbCBzY2F0dGVyLWdhdGhlciBpbnB1dCBidWZmZXIgZW50cmllcy4iDQo+ID4+DQo+ID4+IEhv
d2V2ZXIsIHRoZSBzcGVjIHdhcyB3cml0dGVuIGJ5IHNvbWVvbmUgZWxzZSAoQWxleCkgYXMgdGhl
IGNvZGUgd2FzDQo+ID4+IChXZWkpLiBUaGUgY29kZSB3YXMgdGhlcmUgZmlyc3QuDQo+ID4+DQo+
ID4+IEkgZG9uJ3QgcGFydGljdWxhcmx5IGNhcmUgd2hhdCB0byBhZGp1c3QgKGNvZGUgb3Igc3Bl
YykuIEhvd2V2ZXIsIHRvDQo+ID4+IG1lIGl0IGZlZWxzIG1vcmUgbGlrZSB0aGUgc3BlYyBpcyBz
bGlnaHRseSB3cm9uZyBhbmQgaXQgd2FzIGludGVuZGVkDQo+ID4+IGxpa2UgdGhlIGNvZGUgaXMg
YnkgdGhlIG9yaWdpbmFsIGNvZGUgYXV0aG9yLg0KPiA+Pg0KPiA+PiBCdXQgdGhlbiBhZ2Fpbiwg
SSBkb24ndCBwYXJ0aWN1bGFybHkgY2FyZSA6KQ0KPiA+DQo+ID4gT3JpZ2luYWwgUUVNVSBzaWRl
IGNvZGUgaGFkIHNldmVyYWwgYnVncyBzbywgdGhhdCdzIGFub3RoZXIgb25lLg0KPiA+IEdpdmVu
IG5vdGhpbmcgdG9vIGJhZCBoYXBwZW5zIGlmIGd1ZXN0IHN1Ym1pdHMgdG9vIG1hbnkgUy9Hcywg
YW5kDQo+ID4gZ2l2ZW4gdGhlIHNwZWMgYWxzbyBoYXMgYSBnZW5lcmFsIGNoYXB0ZXIgc3VnZ2Vz
dGluZyBkZXZpY2VzIGFyZQ0KPiA+IGZsZXhpYmxlIGluIGFjY2VwdGluZyBhIHNpbmdsZSBidWZm
ZXIgc3BsaXQgdG8gbXVsdGlwbGUgUy9HcywgSSdtDQo+ID4gaW5jbGluZWQgdG8gYWNjZXB0IHRo
ZSBwYXRjaC4NCj4gDQo+IFllYWgsIGFzIEkgc2FpZCwgSSBkb24ndCBwYXJ0aWN1bGFybHkgY2Fy
ZS4gSXQncyBjZXJ0YWlubHkgYW4gImVhc3kgY2hhbmdlIi4NCj4gDQo+IEFja2VkLWJ5OiBEYXZp
ZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gDQoNCkRvbuKAmXQgb2JqZWN0IHRo
ZSBjaGFuZ2UuDQpKdXN0IGluIGNhc2Ugc29tZXRoaW5nIHVuZXhwZWN0ZWQsIGl0IHdvdWxkIGJl
IGJldHRlciBpZiBzb21lb25lIGNvdWxkIGhlbHAgZG8gYSB0ZXN0Lg0KDQpUaGFua3MsDQpXZWkN
Cg==

