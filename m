Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB03CB248
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 08:16:45 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4H9Q-00074A-H1
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 02:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m4H7z-0006DJ-Gr
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 02:15:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:63903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m4H7w-000776-J9
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 02:15:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271794341"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="271794341"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 23:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="429050920"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2021 23:15:08 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 15 Jul 2021 23:15:08 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 14:15:06 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Fri, 16 Jul 2021 14:15:06 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Topic: [PATCH v2] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Index: AQHXeVg234WlDbVm9EifMBsRhgtzM6tDPsMAgAHa+5A=
Date: Fri, 16 Jul 2021 06:15:06 +0000
Message-ID: <83c6af0d803b436aab62d1495375ae3c@intel.com>
References: <20210715075326.421977-1-wei.w.wang@intel.com>
 <2581d2a2-de9d-7937-4d71-25a33cfbce3e@redhat.com>
In-Reply-To: <2581d2a2-de9d-7937-4d71-25a33cfbce3e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.31; envelope-from=wei.w.wang@intel.com;
 helo=mga06.intel.com
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1cnNkYXksIEp1bHkgMTUsIDIwMjEgNToyOSBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3Jv
dGU6DQo+IE9uIDE1LjA3LjIxIDA5OjUzLCBXZWkgV2FuZyB3cm90ZToNCj4gPiBXaGVuIHNraXBw
aW5nIGZyZWUgcGFnZXMgdG8gc2VuZCwgdGhlaXIgY29ycmVzcG9uZGluZyBkaXJ0eSBiaXRzIGlu
DQo+ID4gdGhlIG1lbW9yeSByZWdpb24gZGlydHkgYml0bWFwIG5lZWQgdG8gYmUgY2xlYXJlZC4g
T3RoZXJ3aXNlIHRoZQ0KPiA+IHNraXBwZWQgcGFnZXMgd2lsbCBiZSBzZW50IGluIHRoZSBuZXh0
IHJvdW5kIGFmdGVyIHRoZSBtaWdyYXRpb24NCj4gPiB0aHJlYWQgc3luY3MgZGlydHkgYml0cyBm
cm9tIHRoZSBtZW1vcnkgcmVnaW9uIGRpcnR5IGJpdG1hcC4NCj4gPg0KPiA+IENjOiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gPiBDYzogUGV0ZXIgWHUgPHBldGVyeEBy
ZWRoYXQuY29tPg0KPiA+IENjOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0K
PiA+IFJlcG9ydGVkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgV2FuZyA8d2VpLncud2FuZ0BpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gICBtaWdyYXRpb24vcmFtLmMgfCA3Mg0KPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+ID4NCj4gPiB2MS0+djIgY2hhbmdlbG9nOg0KPiA+
IC0gbW92ZSBtaWdyYXRpb25fY2xlYXJfbWVtb3J5X3JlZ2lvbl9kaXJ0eV9iaXRtYXAgdW5kZXIg
Yml0bWFwX211dGV4DQo+IGFzDQo+ID4gICAgd2UgbGFjayBjb25maWRlbmNlIHRvIGhhdmUgaXQg
b3V0c2lkZSB0aGUgbG9jayBmb3Igbm93Lg0KPiA+IC0gY2xlYW4gdGhlIHVubmVjZXNzYXJ5IHN1
YnByb2plY3QgY29tbWl0Lg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9yYW0uYyBi
L21pZ3JhdGlvbi9yYW0uYyBpbmRleA0KPiA+IGI1ZmM0NTRiMmYuLjY5ZTA2YjU1ZWMgMTAwNjQ0
DQo+ID4gLS0tIGEvbWlncmF0aW9uL3JhbS5jDQo+ID4gKysrIGIvbWlncmF0aW9uL3JhbS5jDQo+
ID4gQEAgLTc4OSw2ICs3ODksNTEgQEAgdW5zaWduZWQgbG9uZw0KPiBtaWdyYXRpb25fYml0bWFw
X2ZpbmRfZGlydHkoUkFNU3RhdGUgKnJzLCBSQU1CbG9jayAqcmIsDQo+ID4gICAgICAgcmV0dXJu
IGZpbmRfbmV4dF9iaXQoYml0bWFwLCBzaXplLCBzdGFydCk7DQo+ID4gICB9DQo+ID4NCj4gPiAr
c3RhdGljIHZvaWQgbWlncmF0aW9uX2NsZWFyX21lbW9yeV9yZWdpb25fZGlydHlfYml0bWFwKFJB
TVN0YXRlICpycywNCj4gPiArDQo+IFJBTUJsb2NrICpyYiwNCj4gPiArDQo+IHVuc2lnbmVkIGxv
bmcNCj4gPiArcGFnZSkgew0KPiA+ICsgICAgdWludDhfdCBzaGlmdDsNCj4gPiArICAgIGh3YWRk
ciBzaXplLCBzdGFydDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIXJiLT5jbGVhcl9ibWFwIHx8ICFj
bGVhcl9ibWFwX3Rlc3RfYW5kX2NsZWFyKHJiLCBwYWdlKSkgew0KPiA+ICsgICAgICAgIHJldHVy
bjsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBzaGlmdCA9IHJiLT5jbGVhcl9ibWFwX3No
aWZ0Ow0KPiANCj4gWW91IGNvdWxkIGluaXRpYWxpemUgdGhpcyByaWdodCBhdCB0aGUgYmVnaW5u
aW5nIG9mIHRoZSBmdW5jdGlvbiB3aXRob3V0IGRvaW5nIGFueQ0KPiBoYXJtLg0KPiANCj4gPiAr
ICAgIC8qDQo+ID4gKyAgICAgKiBDTEVBUl9CSVRNQVBfU0hJRlRfTUlOIHNob3VsZCBhbHdheXMg
Z3VhcmFudGVlIHRoaXMuLi4gdGhpcw0KPiA+ICsgICAgICogY2FuIG1ha2UgdGhpbmdzIGVhc2ll
ciBzb21ldGltZXMgc2luY2UgdGhlbiBzdGFydCBhZGRyZXNzDQo+ID4gKyAgICAgKiBvZiB0aGUg
c21hbGwgY2h1bmsgd2lsbCBhbHdheXMgYmUgNjQgcGFnZXMgYWxpZ25lZCBzbyB0aGUNCj4gPiAr
ICAgICAqIGJpdG1hcCB3aWxsIGFsd2F5cyBiZSBhbGlnbmVkIHRvIHVuc2lnbmVkIGxvbmcuIFdl
IHNob3VsZA0KPiA+ICsgICAgICogZXZlbiBiZSBhYmxlIHRvIHJlbW92ZSB0aGlzIHJlc3RyaWN0
aW9uIGJ1dCBJJ20gc2ltcGx5DQo+ID4gKyAgICAgKiBrZWVwaW5nIGl0Lg0KPiA+ICsgICAgICov
DQo+ID4gKyAgICBhc3NlcnQoc2hpZnQgPj0gNik7DQo+ID4gKw0KPiA+ICsgICAgc2l6ZSA9IDFV
TEwgPDwgKFRBUkdFVF9QQUdFX0JJVFMgKyBzaGlmdCk7DQo+ID4gKyAgICBzdGFydCA9ICgoKHJh
bV9hZGRyX3QpcGFnZSkgPDwgVEFSR0VUX1BBR0VfQklUUykgJiAoLXNpemUpOw0KPiANCj4gdGhl
c2UgYXMgd2VsbCBhcy4NCg0KSXMgdGhlcmUgYW55IGNvZGluZyBzdHlsZSByZXF1aXJlbWVudCBm
b3IgdGhpcz8NCk15IHRob3VnaHQgd2FzIHRoYXQgdGhvc2Ugb3BlcmF0aW9ucyBjb3VsZCBtb3N0
bHkgYmUgYXZvaWRlZCBpZiB0aGV5IGRvbid0IHBhc3MgdGhlDQphYm92ZSBpZiBjb25kaXRpb24g
KGUuZy4ganVzdCBvbmNlIHBlciAxR0IgY2h1bmspLg0KDQo+IA0KPiA+ICsgICAgdHJhY2VfbWln
cmF0aW9uX2JpdG1hcF9jbGVhcl9kaXJ0eShyYi0+aWRzdHIsIHN0YXJ0LCBzaXplLCBwYWdlKTsN
Cj4gPiArICAgIG1lbW9yeV9yZWdpb25fY2xlYXJfZGlydHlfYml0bWFwKHJiLT5tciwgc3RhcnQs
IHNpemUpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZA0KPiA+ICttaWdyYXRpb25fY2xlYXJf
bWVtb3J5X3JlZ2lvbl9kaXJ0eV9iaXRtYXBfcmFuZ2UoUkFNU3RhdGUgKnJzLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkFNQmxvY2sgKnJi
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZw0KPiBzdGFydCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcNCj4gPiArbnBhZ2VzKSB7DQo+ID4g
KyAgICB1bnNpZ25lZCBsb25nIHBhZ2VfdG9fY2xlYXIsIGksIG5jaHVua3M7DQo+ID4gKyAgICB1
bnNpZ25lZCBsb25nIGNodW5rX3BhZ2VzID0gMVVMIDw8IHJiLT5jbGVhcl9ibWFwX3NoaWZ0Ow0K
PiA+ICsNCj4gPiArICAgIG5jaHVua3MgPSAoc3RhcnQgKyBucGFnZXMpIC8gY2h1bmtfcGFnZXMg
LSBzdGFydCAvIGNodW5rX3BhZ2VzICsNCj4gPiArIDE7DQo+IA0KPiBXb3VsZG4ndCB5b3UgaGF2
ZSB0byBhbGlnbiB0aGUgc3RhcnQgYW5kIHRoZSBlbmQgcmFuZ2UgdXAvZG93biB0byBwcm9wZXJs
eQ0KPiBjYWxjdWxhdGUgdGhlIG51bWJlciBvZiBjaHVua3M/DQoNCk5vLCBkaXZpZGUgd2lsbCBy
b3VuZCBpdCB0byB0aGUgaW50ZWdlciAoYmVnaW5uaW5nIG9mIHRoZSBjaHVuayB0byBjbGVhciku
DQoNCj4gDQo+IFRoZSBmb2xsb3dpbmcgbWlnaHQgYmUgYmV0dGVyIGFuZCBhIGxpdHRsZSBlYXNp
ZXIgdG8gZ3Jhc3A6DQo+IA0KPiB1bnNpZ25lZCBsb25nIGNodW5rX3BhZ2VzID0gMVVMTCA8PCBy
Yi0+Y2xlYXJfYm1hcF9zaGlmdDsgdW5zaWduZWQgbG9uZw0KPiBhbGlnbmVkX3N0YXJ0ID0gUUVN
VV9BTElHTl9ET1dOKHN0YXJ0LCBjaHVua19wYWdlcyk7IHVuc2lnbmVkIGxvbmcNCj4gYWxpZ25l
ZF9lbmQgPSBRRU1VX0FMSUdOX1VQKHN0YXJ0ICsgbnBhZ2VzLCBjaHVua19wYWdlcykNCj4gDQo+
IC8qDQo+ICAgKiBDbGVhciB0aGUgY2xhcl9ibWFwIG9mIGFsbCBjb3ZlcmVkIGNodW5rcy4gSXQn
cyBzdWZmaWNpZW50IHRvIGNhbGwgaXQgZm9yDQo+ICAgKiBvbmUgcGFnZSB3aXRoaW4gYSBjaHVu
ay4NCj4gICAqLw0KPiBmb3IgKHN0YXJ0ID0gYWxpZ25lZF9zdGFydCwgc3RhcnQgIT0gYWxpZ25l
ZF9lbmQsIHN0YXJ0ICs9IGNodW5rX3BhZ2VzKSB7DQoNCldoYXQgaWYgImFsaWduZWRfZW5kID09
IHN0YXJ0ICsgbnBhZ2VzIj8NCmkuZSB0aGUgYWJvdmUgc3RhcnQgKyBucGFnZXMgaXMgYWxpZ25l
ZCBieSBpdHNlbGYgd2l0aG91dCBRRU1VX0FMSUdOX1VQKCkuDQpGb3IgZXhhbXBsZSwgY2h1bmsg
c2l6ZSBpcyAxR0IsIGFuZCBzdGFydCtucGFnZXM9MkdCLCB3aGljaCBpcyByaWdodCBhdCB0aGUg
YmVnaW5uaW5nIG9mIFsyR0IsM0dCKSBjaHVuay4NClRoZW4gYWxpZ25lZF9lbmQgaXMgYWxzbyAy
R0IsIGJ1dCB3ZSBuZWVkIHRvIGNsZWFyIHRoZSBbMkdCLCAzR0IpIGNodW5rLCByaWdodD8NCg0K
QmVzdCwNCldlaQ0K

