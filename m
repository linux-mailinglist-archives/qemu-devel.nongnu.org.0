Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF06B3CCD4A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 07:19:27 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Lgc-00015x-A3
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 01:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m5Lft-0000RB-Gx
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 01:18:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:52041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m5Lfo-0002eL-JU
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 01:18:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="191276442"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="191276442"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2021 22:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="430634377"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2021 22:18:32 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 18 Jul 2021 22:18:31 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 13:18:29 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Mon, 19 Jul 2021 13:18:29 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Topic: [PATCH v2] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Index: AQHXeVg234WlDbVm9EifMBsRhgtzM6tDPsMAgAHa+5D//6XngIAExOhw
Date: Mon, 19 Jul 2021 05:18:29 +0000
Message-ID: <bcf1c9a8817e41669b0c95a194a160fd@intel.com>
References: <20210715075326.421977-1-wei.w.wang@intel.com>
 <2581d2a2-de9d-7937-4d71-25a33cfbce3e@redhat.com>
 <83c6af0d803b436aab62d1495375ae3c@intel.com>
 <3c3a44c8-c819-5946-e1f6-a0d69215e2fe@redhat.com>
In-Reply-To: <3c3a44c8-c819-5946-e1f6-a0d69215e2fe@redhat.com>
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
Received-SPF: pass client-ip=192.55.52.151; envelope-from=wei.w.wang@intel.com;
 helo=mga17.intel.com
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

T24gRnJpZGF5LCBKdWx5IDE2LCAyMDIxIDQ6MjYgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
Og0KPiA+Pj4gKyAgICAvKg0KPiA+Pj4gKyAgICAgKiBDTEVBUl9CSVRNQVBfU0hJRlRfTUlOIHNo
b3VsZCBhbHdheXMgZ3VhcmFudGVlIHRoaXMuLi4gdGhpcw0KPiA+Pj4gKyAgICAgKiBjYW4gbWFr
ZSB0aGluZ3MgZWFzaWVyIHNvbWV0aW1lcyBzaW5jZSB0aGVuIHN0YXJ0IGFkZHJlc3MNCj4gPj4+
ICsgICAgICogb2YgdGhlIHNtYWxsIGNodW5rIHdpbGwgYWx3YXlzIGJlIDY0IHBhZ2VzIGFsaWdu
ZWQgc28gdGhlDQo+ID4+PiArICAgICAqIGJpdG1hcCB3aWxsIGFsd2F5cyBiZSBhbGlnbmVkIHRv
IHVuc2lnbmVkIGxvbmcuIFdlIHNob3VsZA0KPiA+Pj4gKyAgICAgKiBldmVuIGJlIGFibGUgdG8g
cmVtb3ZlIHRoaXMgcmVzdHJpY3Rpb24gYnV0IEknbSBzaW1wbHkNCj4gPj4+ICsgICAgICoga2Vl
cGluZyBpdC4NCj4gPj4+ICsgICAgICovDQo+ID4+PiArICAgIGFzc2VydChzaGlmdCA+PSA2KTsN
Cj4gPj4+ICsNCj4gPj4+ICsgICAgc2l6ZSA9IDFVTEwgPDwgKFRBUkdFVF9QQUdFX0JJVFMgKyBz
aGlmdCk7DQo+ID4+PiArICAgIHN0YXJ0ID0gKCgocmFtX2FkZHJfdClwYWdlKSA8PCBUQVJHRVRf
UEFHRV9CSVRTKSAmICgtc2l6ZSk7DQo+ID4+DQo+ID4+IHRoZXNlIGFzIHdlbGwgYXMuDQo+ID4N
Cj4gPiBJcyB0aGVyZSBhbnkgY29kaW5nIHN0eWxlIHJlcXVpcmVtZW50IGZvciB0aGlzPw0KPiAN
Cj4gRG9uJ3QgdGhpbmsgc28uIEl0IHNpbXBseSByZXN1bHRzIGluIGxlc3MgTE9DIGFuZCBsZXNz
IG9jY3VycmVuY2VzIG9mIHZhcmlhYmxlcy4NCj4gDQo+ID4gTXkgdGhvdWdodCB3YXMgdGhhdCB0
aG9zZSBvcGVyYXRpb25zIGNvdWxkIG1vc3RseSBiZSBhdm9pZGVkIGlmIHRoZXkNCj4gPiBkb24n
dCBwYXNzIHRoZSBhYm92ZSBpZiBjb25kaXRpb24gKGUuZy4ganVzdCBvbmNlIHBlciAxR0IgY2h1
bmspLg0KPiANCj4gVXN1YWxseSB0aGUgY29tcGlsZXIgd2lsbCByZXNodWZmbGUgYXMgcG9zc2li
bGUgdG8gb3B0aW1pemUuIEJ1dCBpbiB0aGlzIGNhc2UsIGR1ZQ0KPiB0byBjbGVhcl9ibWFwX3Rl
c3RfYW5kX2NsZWFyKCksIGl0IG1pZ2h0IG5vdCBiZSBhYmxlIHRvIG1vdmUgdGhlDQo+IGNvbXB1
dGF0aW9ucyBiZWhpbmQgdGhhdCBjYWxsLiBTbyB0aGUgZmluYWwgY29kZSBtaWdodCBhY3R1YWxs
eSBkaWZmZXIuDQo+IA0KPiBOb3QgdGhhdCB3ZSByZWFsbHkgY2FyZSBhYm91dCB0aGlzIG1pY3Jv
LW9wdGltaXphdGlvbiwgdGhvdWdoLg0KDQpPSywgbG9va3MgdGhhdCdzIGp1c3QgYSBwZXJzb25h
bCBmYXZvci4gSSdtIGluY2xpbmVkIHRvIGtlZXBpbmcgdGhlIG1pY3JvLW9wdGltaXphdGlvbi4N
Cg0KPiANCj4gPg0KPiA+Pg0KPiA+Pj4gKyAgICB0cmFjZV9taWdyYXRpb25fYml0bWFwX2NsZWFy
X2RpcnR5KHJiLT5pZHN0ciwgc3RhcnQsIHNpemUsIHBhZ2UpOw0KPiA+Pj4gKyAgICBtZW1vcnlf
cmVnaW9uX2NsZWFyX2RpcnR5X2JpdG1hcChyYi0+bXIsIHN0YXJ0LCBzaXplKTsgfQ0KPiA+Pj4g
Kw0KPiA+Pj4gK3N0YXRpYyB2b2lkDQo+ID4+PiArbWlncmF0aW9uX2NsZWFyX21lbW9yeV9yZWdp
b25fZGlydHlfYml0bWFwX3JhbmdlKFJBTVN0YXRlICpycywNCj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkFNQmxvY2sNCj4gKnJiLA0KPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZA0KPiBsb25nDQo+ID4+IHN0YXJ0LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZA0KPiBsb25nDQo+ID4+PiArbnBhZ2Vz
KSB7DQo+ID4+PiArICAgIHVuc2lnbmVkIGxvbmcgcGFnZV90b19jbGVhciwgaSwgbmNodW5rczsN
Cj4gPj4+ICsgICAgdW5zaWduZWQgbG9uZyBjaHVua19wYWdlcyA9IDFVTCA8PCByYi0+Y2xlYXJf
Ym1hcF9zaGlmdDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgbmNodW5rcyA9IChzdGFydCArIG5wYWdl
cykgLyBjaHVua19wYWdlcyAtIHN0YXJ0IC8gY2h1bmtfcGFnZXMNCj4gPj4+ICsgKyAxOw0KPiA+
Pg0KPiA+PiBXb3VsZG4ndCB5b3UgaGF2ZSB0byBhbGlnbiB0aGUgc3RhcnQgYW5kIHRoZSBlbmQg
cmFuZ2UgdXAvZG93biB0bw0KPiA+PiBwcm9wZXJseSBjYWxjdWxhdGUgdGhlIG51bWJlciBvZiBj
aHVua3M/DQo+ID4NCj4gPiBObywgZGl2aWRlIHdpbGwgcm91bmQgaXQgdG8gdGhlIGludGVnZXIg
KGJlZ2lubmluZyBvZiB0aGUgY2h1bmsgdG8gY2xlYXIpLg0KPiANCj4gDQo+IG5jaHVua3MgPSAo
c3RhcnQgKyBucGFnZXMpIC8gY2h1bmtfcGFnZXMgLSBzdGFydCAvIGNodW5rX3BhZ2VzICsgMTsN
Cg0KSSBoYWQgYSBtaXN0YWtlIG9uIHRoZSByaWdodCBib3VuZGFyeSwgaXQgc2hvdWxkIGJlIFtz
dGFydCwgc3RhcnQgKyBucGFnZXMpLCBpbnN0ZWFkIG9mIFtzdGFydCwgc3RhcnQgKyBucGFnZXNd
Lg0KaS5lLiBuY2h1bmtzID0gKHN0YXJ0ICsgbnBhZ2VzIC0gMSkgLyBjaHVua19wYWdlcyAtIHN0
YXJ0IC8gY2h1bmtfcGFnZXMgKyAxDQoNCkJ1dCBJIGNhbiB0YWtlIHlvdXIgYXBwcm9hY2ggaGVy
ZSwgdGhhbmtzLg0KDQpCZXN0LA0KV2VpDQoNCg==

