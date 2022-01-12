Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8743C48BDE8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 05:36:51 +0100 (CET)
Received: from localhost ([::1]:56542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7VNS-0001OS-5o
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 23:36:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1n7VLg-0000bs-0K
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 23:35:00 -0500
Received: from mga14.intel.com ([192.55.52.115]:48037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1n7VLc-0002pr-Nw
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 23:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641962096; x=1673498096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wDWJjKhvr9GrRlfgc/g6cm5JB1+KOUuJndYMEMCU4Ug=;
 b=RfPKlR7BpV83eGhA4LHmNAmxCTk77xibVcZ6MM/cWfp5g8niVGzmVZqR
 kVV3uEtUB8ToTgRumVkYnXBUMOdDWiKmBPhvPo9oYj32JH664aLrOdNNl
 +pFXhaRxuQeGc3qdnXRuF4fuLRr8arNgPE7MTAIZkC+qTi+QhOhTaLdOw
 /6/z2rtKEFShb4Z16rBUop5Zv/13d1lGmzmn6EkBrpGmq4MbtnRH39uMx
 QGpcPaPqKoCkSpI6RiBQL6mKf/879cJpiuqs2aG8WC8JjYAdro7ge9RR5
 +0figeO2uJDA2n05le27IY1gtU2yeo4oT4rFe8G1T7USC8IxMy/Imgg/d g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243857171"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="243857171"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 20:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="474780754"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2022 20:34:51 -0800
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 20:34:49 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 12:34:47 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2308.020;
 Wed, 12 Jan 2022 12:34:47 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: "Zeng, Guang" <guang.zeng@intel.com>, "Tian, Kevin"
 <kevin.tian@intel.com>, "Zhong, Yang" <yang.zhong@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 6/7] x86: Use new XSAVE ioctls handling
Thread-Topic: [RFC PATCH 6/7] x86: Use new XSAVE ioctls handling
Thread-Index: AQHYA6lm7Fuab0FjJ0CHh31nA5vJqaxbbesAgAASsQCAARhOgIABmCsAgACG8tA=
Date: Wed, 12 Jan 2022 04:34:47 +0000
Message-ID: <18e3a66b27e3489f9a81f89093698ad9@intel.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-7-yang.zhong@intel.com>
 <BN9PR11MB527600E4DD1EA7BE7638A0518C509@BN9PR11MB5276.namprd11.prod.outlook.com>
 <6976bcbe-ba64-3c33-a445-fe29ace41ff3@intel.com>
 <BN9PR11MB52764527D9BD25EAFD54C8888C519@BN9PR11MB5276.namprd11.prod.outlook.com>
 <a965c3c3-0dc4-8236-5e76-81f4b101d288@intel.com>
In-Reply-To: <a965c3c3-0dc4-8236-5e76-81f4b101d288@intel.com>
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
Received-SPF: pass client-ip=192.55.52.115; envelope-from=wei.w.wang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>, "Christopherson, ,
 Sean" <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gV2VkbmVzZGF5LCBKYW51YXJ5IDEyLCAyMDIyIDEwOjUxIEFNLCBaZW5nLCBHdWFuZyB3cm90
ZToNCj4gVG86IFRpYW4sIEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT47IFpob25nLCBZYW5n
IDx5YW5nLnpob25nQGludGVsLmNvbT47DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzog
cGJvbnppbmlAcmVkaGF0LmNvbTsgQ2hyaXN0b3BoZXJzb24sLCBTZWFuIDxzZWFuamNAZ29vZ2xl
LmNvbT47DQo+IGppbmcyLmxpdUBsaW51eC5pbnRlbC5jb207IFdhbmcsIFdlaSBXIDx3ZWkudy53
YW5nQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggNi83XSB4ODY6IFVzZSBu
ZXcgWFNBVkUgaW9jdGxzIGhhbmRsaW5nDQo+IA0KPiBPbiAxLzExLzIwMjIgMTA6MzAgQU0sIFRp
YW4sIEtldmluIHdyb3RlOg0KPiA+PiBGcm9tOiBaZW5nLCBHdWFuZyA8Z3VhbmcuemVuZ0BpbnRl
bC5jb20+DQo+ID4+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAxMCwgMjAyMiA1OjQ3IFBNDQo+ID4+
DQo+ID4+IE9uIDEvMTAvMjAyMiA0OjQwIFBNLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPj4+PiBG
cm9tOiBaaG9uZywgWWFuZyA8eWFuZy56aG9uZ0BpbnRlbC5jb20+DQo+ID4+Pj4gU2VudDogRnJp
ZGF5LCBKYW51YXJ5IDcsIDIwMjIgNTozMiBQTQ0KPiA+Pj4+DQo+ID4+Pj4gRnJvbTogSmluZyBM
aXUgPGppbmcyLmxpdUBpbnRlbC5jb20+DQo+ID4+Pj4NCj4gPj4+PiBFeHRlbmRlZCBmZWF0dXJl
IGhhcyBsYXJnZSBzdGF0ZSB3aGlsZSBjdXJyZW50IGt2bV94c2F2ZSBvbmx5DQo+ID4+Pj4gYWxs
b3dzIDRLQi4gVXNlIG5ldyBYU0FWRSBpb2N0bHMgaWYgdGhlIHhzdGF0ZSBzaXplIGlzIGxhcmdl
IHRoYW4NCj4gPj4+PiBrdm1feHNhdmUuDQo+ID4+PiBzaG91bGRuJ3Qgd2UgYWx3YXlzIHVzZSB0
aGUgbmV3IHhzYXZlIGlvY3RscyBhcyBsb25nIGFzDQo+ID4+PiBDQVBfWFNBVkUyIGlzIGF2YWls
YWJsZT8NCj4gPj4NCj4gPj4gQ0FQX1hTQVZFMiBtYXkgcmV0dXJuIGxlZ2FjeSB4c2F2ZSBzaXpl
IG9yIDAgd29ya2luZyB3aXRoIG9sZCBrdm0NCj4gPj4gdmVyc2lvbiBpbiB3aGljaCBpdCdzIG5v
dCBhdmFpbGFibGUuDQo+ID4+IFFFTVUganVzdCB1c2UgdGhlIG5ldyB4c2F2ZSBpb2N0bHMgb25s
eSB3aGVuIHRoZSByZXR1cm4gdmFsdWUgb2YNCj4gPj4gQ0FQX1hTQVZFMiBpcyBsYXJnZXIgdGhh
biBsZWdhY3kgeHNhdmUgc2l6ZS4NCj4gPiBDQVBfWFNBVkUyICBpcyB0aGUgc3VwZXJzZXQgb2Yg
Q0FQX1hTQVZFLiBJZiBhdmFpbGFibGUgaXQgY2FuIHN1cHBvcnQNCj4gPiBib3RoIGxlZ2FjeSA0
SyBzaXplIG9yIGJpZ2dlci4NCj4gDQo+IEdvdCB5b3VyIHBvaW50IG5vdy4gV2UgY2FuIHVzZSBu
ZXcgaW9jdGwgb25jZSBDQVBfWFNBVkUyIGlzIGF2YWlsYWJsZS4NCj4gQXMgeW91ciBzdWdnZXN0
aW9uLCBJJ2QgbGlrZSB0byBjaGFuZ2UgY29tbWl0IGxvZyBhcyBmb2xsb3dzOg0KPiANCj4gIng4
NjogVXNlIG5ldyBYU0FWRSBpb2N0bHMgaGFuZGxpbmcNCj4gDQo+ICDCoCBFeHRlbmRlZCBmZWF0
dXJlIGhhcyBsYXJnZSBzdGF0ZSB3aGlsZSBjdXJyZW50DQo+ICDCoCBrdm1feHNhdmUgb25seSBh
bGxvd3MgNEtCLiBVc2UgbmV3IFhTQVZFIGlvY3Rscw0KPiAgwqAgaWYgY2hlY2sgZXh0ZW5zaW9u
IG9mIENBUF9YU0FWRTIgaXMgYXZhaWxhYmxlLiINCj4gDQo+IEFuZCBpbnRyb2R1Y2UgaGFzX3hz
YXZlMiB0byBpbmRpY2F0ZSB0aGUgdmFsaWQgb2YgQ0FQX1hTQVZFMiB3aXRoIGZvbGxvd2luZw0K
PiBjaGFuZ2U6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2kzODYva3ZtL2t2bS5jIGIvdGFy
Z2V0L2kzODYva3ZtL2t2bS5jIGluZGV4DQo+IDk3NTIwZTlkZmYuLmM4ZGFlODhjZWQgMTAwNjQ0
DQo+IC0tLSBhL3RhcmdldC9pMzg2L2t2bS9rdm0uYw0KPiArKysgYi90YXJnZXQvaTM4Ni9rdm0v
a3ZtLmMNCj4gQEAgLTExNiw2ICsxMTYsNyBAQCBzdGF0aWMgYm9vbCBoYXNfbXNyX3Vjb2RlX3Jl
djsNCj4gIMKgc3RhdGljIGJvb2wgaGFzX21zcl92bXhfcHJvY2Jhc2VkX2N0bHMyOw0KPiAgwqBz
dGF0aWMgYm9vbCBoYXNfbXNyX3BlcmZfY2FwYWJzOw0KPiAgwqBzdGF0aWMgYm9vbCBoYXNfbXNy
X3BrcnM7DQo+ICtzdGF0aWMgYm9vbCBoYXNfeHNhdmUyID0gZmFsc2U7DQoNCkl0J3MgMC1pbml0
aWFsaXplZCwgc28gSSB0aGluayBubyBuZWVkIGZvciB0aGUgImZhbHNlIiBhc3NpZ25tZW50Lg0K
UHJvYmFibHkgYmV0dGVyIHRvIHVzZSAiaW50IiAobGlrZSBoYXNfeHNhdmUpLCBhbmQgaW1wcm92
ZWQgaXQgYSBiaXQ6DQoNCmRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9rdm0va3ZtLmMgYi90YXJn
ZXQvaTM4Ni9rdm0va3ZtLmMNCmluZGV4IDNmYjNkZGJlMmIuLmRlZTQwYWQwYWQgMTAwNjQ0DQot
LS0gYS90YXJnZXQvaTM4Ni9rdm0va3ZtLmMNCisrKyBiL3RhcmdldC9pMzg2L2t2bS9rdm0uYw0K
QEAgLTEyMiw2ICsxMjIsNyBAQCBzdGF0aWMgdWludDMyX3QgbnVtX2FyY2hpdGVjdHVyYWxfcG11
X2dwX2NvdW50ZXJzOw0KIHN0YXRpYyB1aW50MzJfdCBudW1fYXJjaGl0ZWN0dXJhbF9wbXVfZml4
ZWRfY291bnRlcnM7DQoNCiBzdGF0aWMgaW50IGhhc194c2F2ZTsNCitzdGF0aWMgaW50IGhhc194
c2F2ZTI7DQogc3RhdGljIGludCBoYXNfeGNyczsNCiBzdGF0aWMgaW50IGhhc19waXRfc3RhdGUy
Ow0KIHN0YXRpYyBpbnQgaGFzX2V4Y2VwdGlvbl9wYXlsb2FkOw0KQEAgLTE1NjQsNiArMTU2NSwy
NiBAQCBzdGF0aWMgRXJyb3IgKmludnRzY19taWdfYmxvY2tlcjsNCg0KICNkZWZpbmUgS1ZNX01B
WF9DUFVJRF9FTlRSSUVTICAxMDANCg0KK3N0YXRpYyB2b2lkIGt2bV9pbml0X3hzYXZlKENQVVg4
NlN0YXRlICplbnYpDQorew0KKyAgICBpZiAoaGFzX3hzYXZlMikgew0KKyAgICAgICAgZW52LT54
c2F2ZV9idWZfbGVuID0gUUVNVV9BTElHTl9VUChoYXNfeHNhdmUyLCA0MDk2KTs7DQorICAgIH0g
ZWxzZSBpZiAoaGFzX3hzYXZlKSB7DQorICAgICAgICBlbnYtPnhzYXZlX2J1Zl9sZW4gPSBzaXpl
b2Yoc3RydWN0IGt2bV94c2F2ZSk7DQorICAgIH0gZWxzZSB7DQorICAgICAgICByZXR1cm47DQor
ICAgIH0NCisNCisgICAgZW52LT54c2F2ZV9idWYgPSBxZW11X21lbWFsaWduKDQwOTYsIGVudi0+
eHNhdmVfYnVmX2xlbik7DQorICAgIG1lbXNldChlbnYtPnhzYXZlX2J1ZiwgMCwgZW52LT54c2F2
ZV9idWZfbGVuKTsNCisgICAgIC8qDQorICAgICAgKiBUaGUgYWxsb2NhdGVkIHN0b3JhZ2UgbXVz
dCBiZSBsYXJnZSBlbm91Z2ggZm9yIGFsbCBvZiB0aGUNCisgICAgICAqIHBvc3NpYmxlIFhTQVZF
IHN0YXRlIGNvbXBvbmVudHMuDQorICAgICAgKi8NCisgICAgYXNzZXJ0KGt2bV9hcmNoX2dldF9z
dXBwb3J0ZWRfY3B1aWQoa3ZtX3N0YXRlLCAweGQsIDAsIFJfRUNYKSA8PQ0KKyAgICAgICAgICAg
ZW52LT54c2F2ZV9idWZfbGVuKTsNCit9DQorDQogaW50IGt2bV9hcmNoX2luaXRfdmNwdShDUFVT
dGF0ZSAqY3MpDQogew0KICAgICBzdHJ1Y3Qgew0KQEAgLTE5ODIsMTggKzIwMDMsNyBAQCBpbnQg
a3ZtX2FyY2hfaW5pdF92Y3B1KENQVVN0YXRlICpjcykNCiAgICAgICAgIGdvdG8gZmFpbDsNCiAg
ICAgfQ0KDQotICAgIGlmIChoYXNfeHNhdmUpIHsNCi0gICAgICAgIGVudi0+eHNhdmVfYnVmX2xl
biA9IHNpemVvZihzdHJ1Y3Qga3ZtX3hzYXZlKTsNCi0gICAgICAgIGVudi0+eHNhdmVfYnVmID0g
cWVtdV9tZW1hbGlnbig0MDk2LCBlbnYtPnhzYXZlX2J1Zl9sZW4pOw0KLSAgICAgICAgbWVtc2V0
KGVudi0+eHNhdmVfYnVmLCAwLCBlbnYtPnhzYXZlX2J1Zl9sZW4pOw0KLQ0KLSAgICAgICAgLyoN
Ci0gICAgICAgICAqIFRoZSBhbGxvY2F0ZWQgc3RvcmFnZSBtdXN0IGJlIGxhcmdlIGVub3VnaCBm
b3IgYWxsIG9mIHRoZQ0KLSAgICAgICAgICogcG9zc2libGUgWFNBVkUgc3RhdGUgY29tcG9uZW50
cy4NCi0gICAgICAgICAqLw0KLSAgICAgICAgYXNzZXJ0KGt2bV9hcmNoX2dldF9zdXBwb3J0ZWRf
Y3B1aWQoa3ZtX3N0YXRlLCAweGQsIDAsIFJfRUNYKQ0KLSAgICAgICAgICAgICAgIDw9IGVudi0+
eHNhdmVfYnVmX2xlbik7DQotICAgIH0NCisgICAga3ZtX2luaXRfeHNhdmUoZW52KTsNCg0KICAg
ICBtYXhfbmVzdGVkX3N0YXRlX2xlbiA9IGt2bV9tYXhfbmVzdGVkX3N0YXRlX2xlbmd0aCgpOw0K
ICAgICBpZiAobWF4X25lc3RlZF9zdGF0ZV9sZW4gPiAwKSB7DQpAQCAtMjMyMyw2ICsyMzMzLDcg
QEAgaW50IGt2bV9hcmNoX2luaXQoTWFjaGluZVN0YXRlICptcywgS1ZNU3RhdGUgKnMpDQogICAg
IH0NCg0KICAgICBoYXNfeHNhdmUgPSBrdm1fY2hlY2tfZXh0ZW5zaW9uKHMsIEtWTV9DQVBfWFNB
VkUpOw0KKyAgICBoYXNfeHNhdmUyID0ga3ZtX2NoZWNrX2V4dGVuc2lvbihzLCBLVk1fQ0FQX1hT
QVZFMik7DQogICAgIGhhc194Y3JzID0ga3ZtX2NoZWNrX2V4dGVuc2lvbihzLCBLVk1fQ0FQX1hD
UlMpOw0KICAgICBoYXNfcGl0X3N0YXRlMiA9IGt2bV9jaGVja19leHRlbnNpb24ocywgS1ZNX0NB
UF9QSVRfU1RBVEUyKTsNCg0KQEAgLTMyNDEsMTMgKzMyNTIsMTQgQEAgc3RhdGljIGludCBrdm1f
Z2V0X3hzYXZlKFg4NkNQVSAqY3B1KQ0KIHsNCiAgICAgQ1BVWDg2U3RhdGUgKmVudiA9ICZjcHUt
PmVudjsNCiAgICAgdm9pZCAqeHNhdmUgPSBlbnYtPnhzYXZlX2J1ZjsNCi0gICAgaW50IHJldDsN
CisgICAgaW50IHR5cGUsIHJldDsNCg0KICAgICBpZiAoIWhhc194c2F2ZSkgew0KICAgICAgICAg
cmV0dXJuIGt2bV9nZXRfZnB1KGNwdSk7DQogICAgIH0NCg0KLSAgICByZXQgPSBrdm1fdmNwdV9p
b2N0bChDUFUoY3B1KSwgS1ZNX0dFVF9YU0FWRSwgeHNhdmUpOw0KKyAgICB0eXBlID0gaGFzX3hz
YXZlMiA/IEtWTV9HRVRfWFNBVkUyOiBLVk1fR0VUX1hTQVZFOw0KKyAgICByZXQgPSBrdm1fdmNw
dV9pb2N0bChDUFUoY3B1KSwgdHlwZSwgeHNhdmUpOw0KICAgICBpZiAocmV0IDwgMCkgew0KICAg
ICAgICAgcmV0dXJuIHJldDsNCiAgICAgfQ0K

