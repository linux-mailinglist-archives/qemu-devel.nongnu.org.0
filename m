Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351A4D05DE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:01:50 +0100 (CET)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHg4-0002Uf-5z
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:01:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1nRHeV-0001iP-Gj
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:00:14 -0500
Received: from mga06.intel.com ([134.134.136.31]:49754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1nRHeQ-0002YI-OI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676006; x=1678212006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=scrkXT4xfnfsdkMOXcHeD5hYVssJTlhEdHkbVDV3OTA=;
 b=gRDFjkhTCIqjNKtbkUlrkMjlzj5jJW2fBNQbij8mZfEgX2stFaBLefMn
 nAtidwAe/Wzrl4p7uQ691u6dDL7brHl4dek+rHzN1wTiOKr2sTgr94NT0
 HI7IhUq+bB/HsjHEpD6G3Bon/B6iMnbDvIsXz8FMwRO7PWf9tRafTkkoB
 AIBGhNCRfpdTHISdHnvejFjKEhMYGi0dJ2VB6UA8njgabPL4K6u8NeTee
 cAH86MzVHHkKBeuTqQmG0dqDU8OJPp3BfojxrJvaMWZbwI5u3kItYvWAy
 TSLHEhODN1wC/mBpUJWYcpVyv0wvHY7SC6zni51F5iVVkbmxrhOTPQiTu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="315173101"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="315173101"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:00:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="512772848"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 07 Mar 2022 10:00:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 10:00:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 10:00:02 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.021;
 Mon, 7 Mar 2022 10:00:02 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: RE: [PATCH v1] ui/gtk-egl: Check for a valid context before making
 EGL calls
Thread-Topic: [PATCH v1] ui/gtk-egl: Check for a valid context before making
 EGL calls
Thread-Index: AQHYMd0bfnG/Blf5/E2DD1/LaebBoay0ElGAgAAdayA=
Date: Mon, 7 Mar 2022 18:00:02 +0000
Message-ID: <8a19aa5fbfca434a9b1ddd57566e00ad@intel.com>
References: <20220307042108.296428-1-vivek.kasireddy@intel.com>
 <CAMxuvawcUYkjPt-iopJhJ8seO_3tJJGqkECqZfEPb3_7SSWpkg@mail.gmail.com>
In-Reply-To: <CAMxuvawcUYkjPt-iopJhJ8seO_3tJJGqkECqZfEPb3_7SSWpkg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgTWFyYy1BbmRyZSwNCg0KPiANCj4gSGkgVml2ZWsNCj4gDQo+IE9uIE1vbiwgTWFyIDcsIDIw
MjIgYXQgODozOSBBTSBWaXZlayBLYXNpcmVkZHkNCj4gPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5j
b20+IHdyb3RlOg0KPiA+DQo+ID4gU2luY2Ugbm90IGFsbCBsaXN0ZW5lcnMgKGkuZSBWaXJ0dWFs
Q29uc29sZXMpIG9mIEdMIGV2ZW50cyBoYXZlDQo+ID4gYSB2YWxpZCBFR0wgY29udGV4dCwgbWFr
ZSBzdXJlIHRoYXQgdGhlcmUgaXMgYSB2YWxpZCBjb250ZXh0DQo+ID4gYmVmb3JlIG1ha2luZyBF
R0wgY2FsbHMuDQo+ID4NCj4gPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgY3Jhc2ggc2VlbiB3
aGlsZSBsYXVuY2hpbmcgdGhlIFZNIHdpdGgNCj4gPiAiLWRldmljZSB2aXJ0aW8tZ3B1LXBjaSxt
YXhfb3V0cHV0cz0xLGJsb2I9dHJ1ZSAtZGlzcGxheSBndGssZ2w9b24iDQo+ID4NCj4gPiBObyBw
cm92aWRlciBvZiBlZ2xDcmVhdGVJbWFnZUtIUiBmb3VuZC4gIFJlcXVpcmVzIG9uZSBvZjoNCj4g
PiBFR0xfS0hSX2ltYWdlDQo+ID4gRUdMX0tIUl9pbWFnZV9iYXNlDQo+ID4NCj4gPiBGaXhlczog
N2NjNzEyZTk4NjJmZiAoInVpOiBkaXNwYXRjaCBHTCBldmVudHMgdG8gYWxsIGxpc3RlbmVycyIp
DQo+IA0KPiBJIGFtIG5vdCBhYmxlIHRvIHJlcHJvZHVjZSBvbiBjdXJyZW50IG1hc3Rlci4NCltL
YXNpcmVkZHksIFZpdmVrXSBJIGNhbiBzdGlsbCBzZWUgaXQgd2l0aCBjdXJyZW50IG1hc3Rlci4g
SSB0aGluayB0aGlzIGlzc3VlDQppcyBvbmx5IHNlZW4gd2hlbiBydW5uaW5nIFFlbXUgaW4gYW4g
WG9yZyBiYXNlZCBIb3N0IGVudmlyb25tZW50IGFuZA0KY2Fubm90IGJlIHJlcHJvZHVjZWQgaW4g
YSBXYXlsYW5kIGJhc2VkIGVudmlyb25tZW50IC0tIGFzIFFlbXUgVUkgDQp1c2VzIHRoZSBHTEFy
ZWEgd2lkZ2V0IGluIHRoZSBXYXlsYW5kIGNhc2Ugd2hlcmUgdGhlIEVHTCBjb250ZXh0DQppcyBt
YW5hZ2VkIGJ5IEdUSy4NCg0KPiANCj4gSXNuJ3QgaXQgZml4ZWQgd2l0aCBjb21taXQgYTlmYmNl
NWU5ICgidWkvY29uc29sZTogZml4IGNyYXNoIHdoZW4NCj4gdXNpbmcgZ2wgY29udGV4dCB3aXRo
IG5vbi1nbCBsaXN0ZW5lcnMiKSA/DQpbS2FzaXJlZGR5LCBWaXZla10gTm8sIGl0IHVuZm9ydHVu
YXRlbHkgZG9lcyBub3QgZml4IHRoZSBpc3N1ZSBJIGFtIHNlZWluZy4gSW4gDQpteSBjYXNlLCB0
aGVyZSBhcmUgdGhyZWUgVmlydHVhbENvbnNvbGVzIGNyZWF0ZWQgKCJwYXJhbGxlbDAiLCAiY29t
cGF0bW9uaXRvcjAiLA0KInZpcnRpby1ncHUtcGNpIikgYW5kIGFsbCB0aHJlZSBvZiB0aGVtIHNl
ZW0gdG8gaGF2ZSBhIHZhbGlkIGRweV9nbF9zY2Fub3V0X2RtYWJ1ZigpDQpidXQgb25seSB2aXJ0
aW8tZ3B1LXBjaSBoYXMgYSB2YWxpZCBFR0wgY29udGV4dC4gDQoNCj4gDQo+IENvdWxkIHlvdSBh
bHNvIGNoZWNrIGFmdGVyICJbUEFUQ0ggdjMgMDAvMTJdIEdMICYgRC1CdXMgZGlzcGxheSByZWxh
dGVkIGZpeGVzIiA/DQpbS2FzaXJlZGR5LCBWaXZla10gSSBjYW4gY2hlY2sgYnV0IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBpc3N1ZSBjYW4gYmUgZml4ZWQgaW4gdWkvY29uc29sZS5jDQphcyBhbGwgdGhy
ZWUgVmlydHVhbENvbnNvbGVzIHBhc3MgdGhlIGNvbnNvbGVfaGFzX2dsKCkgY2hlY2sgYW5kIG9u
ZSBvZiB0aGUgb25seSB0aGluZ3MNCnRoYXQgZGlzdGluZ3Vpc2hlcyB0aGVtIGlzIHdoZXRoZXIg
dGhleSBoYXZlIGEgdmFsaWQgRUdMIGNvbnRleHQuIA0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0K
PiB0aGFua3MNCj4gDQo+ID4NCj4gPiBDYzogTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUu
bHVyZWF1QHJlZGhhdC5jb20+DQo+ID4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQu
Y29tPg0KPiA+IENjOiBEb25nd29uIEtpbSA8ZG9uZ3dvbi5raW1AaW50ZWwuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFZpdmVrIEthc2lyZWRkeSA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgdWkvZ3RrLWVnbC5jIHwgOCArKysrKysrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdWkvZ3RrLWVnbC5j
IGIvdWkvZ3RrLWVnbC5jDQo+ID4gaW5kZXggZTNiZDRiYzI3NC4uMzExNzU4MjdkMCAxMDA2NDQN
Cj4gPiAtLS0gYS91aS9ndGstZWdsLmMNCj4gPiArKysgYi91aS9ndGstZWdsLmMNCj4gPiBAQCAt
MjQ0LDYgKzI0NCwxMCBAQCB2b2lkIGdkX2VnbF9zY2Fub3V0X2RtYWJ1ZihEaXNwbGF5Q2hhbmdl
TGlzdGVuZXIgKmRjbCwNCj4gPiAgI2lmZGVmIENPTkZJR19HQk0NCj4gPiAgICAgIFZpcnR1YWxD
b25zb2xlICp2YyA9IGNvbnRhaW5lcl9vZihkY2wsIFZpcnR1YWxDb25zb2xlLCBnZnguZGNsKTsN
Cj4gPg0KPiA+ICsgICAgaWYgKCF2Yy0+Z2Z4LmVjdHggfHwgIXZjLT5nZnguZXN1cmZhY2UpIHsN
Cj4gPiArICAgICAgICByZXR1cm47DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICAgICAgZWdsTWFr
ZUN1cnJlbnQocWVtdV9lZ2xfZGlzcGxheSwgdmMtPmdmeC5lc3VyZmFjZSwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgIHZjLT5nZnguZXN1cmZhY2UsIHZjLT5nZnguZWN0eCk7DQo+ID4NCj4gPiBA
QCAtMjY5LDYgKzI3MywxMCBAQCB2b2lkIGdkX2VnbF9jdXJzb3JfZG1hYnVmKERpc3BsYXlDaGFu
Z2VMaXN0ZW5lciAqZGNsLA0KPiA+ICAjaWZkZWYgQ09ORklHX0dCTQ0KPiA+ICAgICAgVmlydHVh
bENvbnNvbGUgKnZjID0gY29udGFpbmVyX29mKGRjbCwgVmlydHVhbENvbnNvbGUsIGdmeC5kY2wp
Ow0KPiA+DQo+ID4gKyAgICBpZiAoIXZjLT5nZnguZWN0eCB8fCAhdmMtPmdmeC5lc3VyZmFjZSkg
ew0KPiA+ICsgICAgICAgIHJldHVybjsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gICAgICBpZiAo
ZG1hYnVmKSB7DQo+ID4gICAgICAgICAgZWdsX2RtYWJ1Zl9pbXBvcnRfdGV4dHVyZShkbWFidWYp
Ow0KPiA+ICAgICAgICAgIGlmICghZG1hYnVmLT50ZXh0dXJlKSB7DQo+ID4gLS0NCj4gPiAyLjM1
LjENCj4gPg0KDQo=

