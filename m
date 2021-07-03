Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A553BA6B8
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 04:54:34 +0200 (CEST)
Received: from localhost ([::1]:56404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzVnd-0008CE-Bs
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 22:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lzVmq-0007Vu-TT
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 22:53:44 -0400
Received: from mga14.intel.com ([192.55.52.115]:32303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lzVmm-0006zl-RW
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 22:53:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="208623103"
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="208623103"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 19:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="409444437"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 02 Jul 2021 19:53:29 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 2 Jul 2021 19:53:29 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 3 Jul 2021 10:53:27 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.008;
 Sat, 3 Jul 2021 10:53:27 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAABk7AIABVF1Q///EdQCAAc2LkA==
Date: Sat, 3 Jul 2021 02:53:27 +0000
Message-ID: <562b42cbd5674853af21be3297fbaada@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
In-Reply-To: <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
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
Received-SPF: pass client-ip=192.55.52.115; envelope-from=wei.w.wang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpZGF5LCBKdWx5IDIsIDIwMjEgMzowNyBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6
DQo+IE9uIDAyLjA3LjIxIDA0OjQ4LCBXYW5nLCBXZWkgVyB3cm90ZToNCj4gPiBPbiBUaHVyc2Rh
eSwgSnVseSAxLCAyMDIxIDEwOjIyIFBNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4gPj4g
T24gMDEuMDcuMjEgMTQ6NTEsIFBldGVyIFh1IHdyb3RlOg0KPiANCj4gSSB0aGluayB0aGF0IGNs
ZWFybHkgc2hvd3MgdGhlIGlzc3VlLg0KPiANCj4gTXkgdGhlb3J5IEkgZGlkIG5vdCB2ZXJpZnkg
eWV0OiBBc3N1bWUgd2UgaGF2ZSAxR0IgY2h1bmtzIGluIHRoZSBjbGVhciBibWFwLg0KPiBBc3N1
bWUgdGhlIFZNIHJlcG9ydHMgYWxsIHBhZ2VzIHdpdGhpbiBhIDFHQiBjaHVuayBhcyBmcmVlIChl
YXN5IHdpdGggYSBmcmVzaA0KPiBWTSkuIFdoaWxlIHByb2Nlc3NpbmcgaGludHMsIHdlIHdpbGwg
Y2xlYXIgdGhlIGJpdHMgZnJvbSB0aGUgZGlydHkgYm1hcCBpbiB0aGUNCj4gUkFNQmxvY2suIEFz
IHdlIHdpbGwgbmV2ZXIgbWlncmF0ZSBhbnkgcGFnZSBvZiB0aGF0IDFHQiBjaHVuaywgd2Ugd2ls
bCBub3QNCj4gYWN0dWFsbHkgY2xlYXIgdGhlIGRpcnR5IGJpdG1hcCBvZiB0aGUgbWVtb3J5IHJl
Z2lvbi4gV2hlbiByZS1zeW5jaW5nLCB3ZSB3aWxsDQo+IHNldCBhbGwgYml0cyBiaXRzIGluIHRo
ZSBkaXJ0eSBibWFwIGFnYWluIGZyb20gdGhlIGRpcnR5IGJpdG1hcCBpbiB0aGUgbWVtb3J5DQo+
IHJlZ2lvbi4gVGh1cywgbWFueSBvZiBvdXIgaGludHMgZW5kIHVwIGJlaW5nIG1vc3RseSBpZ25v
cmVkLiBUaGUgc21hbGxlciB0aGUNCj4gY2xlYXIgYm1hcCBjaHVuaywgdGhlIG1vcmUgZXh0cmVt
ZSB0aGUgaXNzdWUuDQoNCk9LLCB0aGF0IGxvb2tzIHBvc3NpYmxlLiBXZSBuZWVkIHRvIGNsZWFy
IHRoZSByZWxhdGVkIGJpdHMgZnJvbSB0aGUgbWVtb3J5IHJlZ2lvbg0KYml0bWFwIGJlZm9yZSBz
a2lwcGluZyB0aGUgZnJlZSBwYWdlcy4gQ291bGQgeW91IHRyeSB3aXRoIGJlbG93IHBhdGNoOg0K
DQpkaWZmIC0tZ2l0IGEvbWlncmF0aW9uL3JhbS5jIGIvbWlncmF0aW9uL3JhbS5jDQppbmRleCBh
Y2U4YWQ0MzFjLi5hMWY2ZGYzZTZjIDEwMDY0NA0KLS0tIGEvbWlncmF0aW9uL3JhbS5jDQorKysg
Yi9taWdyYXRpb24vcmFtLmMNCkBAIC04MTEsNiArODExLDI2IEBAIHVuc2lnbmVkIGxvbmcgbWln
cmF0aW9uX2JpdG1hcF9maW5kX2RpcnR5KFJBTVN0YXRlICpycywgUkFNQmxvY2sgKnJiLA0KICAg
ICByZXR1cm4gbmV4dDsNCiB9DQoNCisNCitzdGF0aWMgdm9pZCBtaWdyYXRpb25fY2xlYXJfbWVt
b3J5X3JlZ2lvbl9kaXJ0eV9iaXRtYXAoUkFNU3RhdGUgKnJzLA0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSQU1CbG9jayAqcmIsDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBwYWdlKQ0KK3sNCisgICAgdWludDhfdCBzaGlmdDsNCisgICAgaHdhZGRyIHNpemUs
IHN0YXJ0Ow0KKw0KKyAgICBpZiAoIXJiLT5jbGVhcl9ibWFwIHx8ICFjbGVhcl9ibWFwX3Rlc3Rf
YW5kX2NsZWFyKHJiLCBwYWdlKSkNCisgICAgICAgIHJldHVybjsNCisNCisgICAgc2hpZnQgPSBy
Yi0+Y2xlYXJfYm1hcF9zaGlmdDsNCisgICAgYXNzZXJ0KHNoaWZ0ID49IDYpOw0KKw0KKyAgICBz
aXplID0gMVVMTCA8PCAoVEFSR0VUX1BBR0VfQklUUyArIHNoaWZ0KTsNCisgICAgc3RhcnQgPSAo
KChyYW1fYWRkcl90KXBhZ2UpIDw8IFRBUkdFVF9QQUdFX0JJVFMpICYgKC1zaXplKTsNCisgICAg
dHJhY2VfbWlncmF0aW9uX2JpdG1hcF9jbGVhcl9kaXJ0eShyYi0+aWRzdHIsIHN0YXJ0LCBzaXpl
LCBwYWdlKTsNCisgICAgbWVtb3J5X3JlZ2lvbl9jbGVhcl9kaXJ0eV9iaXRtYXAocmItPm1yLCBz
dGFydCwgc2l6ZSk7DQorfQ0KKw0KIHN0YXRpYyBpbmxpbmUgYm9vbCBtaWdyYXRpb25fYml0bWFw
X2NsZWFyX2RpcnR5KFJBTVN0YXRlICpycywNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBSQU1CbG9jayAqcmIsDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYWdlKQ0KQEAgLTgyNywy
NiArODQ3LDkgQEAgc3RhdGljIGlubGluZSBib29sIG1pZ3JhdGlvbl9iaXRtYXBfY2xlYXJfZGly
dHkoUkFNU3RhdGUgKnJzLA0KICAgICAgKiB0aGUgcGFnZSBpbiB0aGUgY2h1bmsgd2UgY2xlYXIg
dGhlIHJlbW90ZSBkaXJ0eSBiaXRtYXAgZm9yIGFsbC4NCiAgICAgICogQ2xlYXJpbmcgaXQgZWFy
bGllciB3b24ndCBiZSBhIHByb2JsZW0sIGJ1dCB0b28gbGF0ZSB3aWxsLg0KICAgICAgKi8NCi0g
ICAgaWYgKHJiLT5jbGVhcl9ibWFwICYmIGNsZWFyX2JtYXBfdGVzdF9hbmRfY2xlYXIocmIsIHBh
Z2UpKSB7DQotICAgICAgICB1aW50OF90IHNoaWZ0ID0gcmItPmNsZWFyX2JtYXBfc2hpZnQ7DQot
ICAgICAgICBod2FkZHIgc2l6ZSA9IDFVTEwgPDwgKFRBUkdFVF9QQUdFX0JJVFMgKyBzaGlmdCk7
DQotICAgICAgICBod2FkZHIgc3RhcnQgPSAoKChyYW1fYWRkcl90KXBhZ2UpIDw8IFRBUkdFVF9Q
QUdFX0JJVFMpICYgKC1zaXplKTsNCi0NCi0gICAgICAgIC8qDQotICAgICAgICAgKiBDTEVBUl9C
SVRNQVBfU0hJRlRfTUlOIHNob3VsZCBhbHdheXMgZ3VhcmFudGVlIHRoaXMuLi4gdGhpcw0KLSAg
ICAgICAgICogY2FuIG1ha2UgdGhpbmdzIGVhc2llciBzb21ldGltZXMgc2luY2UgdGhlbiBzdGFy
dCBhZGRyZXNzDQotICAgICAgICAgKiBvZiB0aGUgc21hbGwgY2h1bmsgd2lsbCBhbHdheXMgYmUg
NjQgcGFnZXMgYWxpZ25lZCBzbyB0aGUNCi0gICAgICAgICAqIGJpdG1hcCB3aWxsIGFsd2F5cyBi
ZSBhbGlnbmVkIHRvIHVuc2lnbmVkIGxvbmcuICBXZSBzaG91bGQNCi0gICAgICAgICAqIGV2ZW4g
YmUgYWJsZSB0byByZW1vdmUgdGhpcyByZXN0cmljdGlvbiBidXQgSSdtIHNpbXBseQ0KLSAgICAg
ICAgICoga2VlcGluZyBpdC4NCi0gICAgICAgICAqLw0KLSAgICAgICAgYXNzZXJ0KHNoaWZ0ID49
IDYpOw0KLSAgICAgICAgdHJhY2VfbWlncmF0aW9uX2JpdG1hcF9jbGVhcl9kaXJ0eShyYi0+aWRz
dHIsIHN0YXJ0LCBzaXplLCBwYWdlKTsNCi0gICAgICAgIG1lbW9yeV9yZWdpb25fY2xlYXJfZGly
dHlfYml0bWFwKHJiLT5tciwgc3RhcnQsIHNpemUpOw0KLSAgICB9DQorICAgIG1pZ3JhdGlvbl9j
bGVhcl9tZW1vcnlfcmVnaW9uX2RpcnR5X2JpdG1hcChycywgcmIsIHBhZ2UpOw0KDQogICAgIHJl
dCA9IHRlc3RfYW5kX2NsZWFyX2JpdChwYWdlLCByYi0+Ym1hcCk7DQotDQogICAgIGlmIChyZXQp
IHsNCiAgICAgICAgIHJzLT5taWdyYXRpb25fZGlydHlfcGFnZXMtLTsNCiAgICAgfQ0KQEAgLTI3
NDYsNyArMjc0OSw3IEBAIHZvaWQgcWVtdV9ndWVzdF9mcmVlX3BhZ2VfaGludCh2b2lkICphZGRy
LCBzaXplX3QgbGVuKQ0KIHsNCiAgICAgUkFNQmxvY2sgKmJsb2NrOw0KICAgICByYW1fYWRkcl90
IG9mZnNldDsNCi0gICAgc2l6ZV90IHVzZWRfbGVuLCBzdGFydCwgbnBhZ2VzOw0KKyAgICBzaXpl
X3QgdXNlZF9sZW4sIHN0YXJ0LCBucGFnZXMsIHBhZ2VfdG9fY2xlYXIsIGkgPSAwOw0KICAgICBN
aWdyYXRpb25TdGF0ZSAqcyA9IG1pZ3JhdGVfZ2V0X2N1cnJlbnQoKTsNCg0KICAgICAvKiBUaGlz
IGZ1bmN0aW9uIGlzIGN1cnJlbnRseSBleHBlY3RlZCB0byBiZSB1c2VkIGR1cmluZyBsaXZlIG1p
Z3JhdGlvbiAqLw0KQEAgLTI3NzUsNiArMjc3OCwxOSBAQCB2b2lkIHFlbXVfZ3Vlc3RfZnJlZV9w
YWdlX2hpbnQodm9pZCAqYWRkciwgc2l6ZV90IGxlbikNCiAgICAgICAgIHN0YXJ0ID0gb2Zmc2V0
ID4+IFRBUkdFVF9QQUdFX0JJVFM7DQogICAgICAgICBucGFnZXMgPSB1c2VkX2xlbiA+PiBUQVJH
RVRfUEFHRV9CSVRTOw0KDQorICAgICAgICAvKg0KKyAgICAgICAgICogVGhlIHNraXBwZWQgZnJl
ZSBwYWdlcyBhcmUgZXF1YXZlbGVudCB0byBiZSBzZW50IGZyb20gY2xlYXJfYm1hcCdzDQorICAg
ICAgICAqIHBlcnNwZWN0aXZlLCBzbyBjbGVhciB0aGUgYml0cyBmcm9tIHRoZSBtZW1vcnkgcmVn
aW9uIGJpdG1hcCB3aGljaA0KKyAgICAgICAgKiBhcmUgaW5pdGlhbGx5IHNldC4gT3RoZXJ3aXNl
IHRob3NlIHNraXBwZWQgcGFnZXMgd2lsbCBiZSBzZW50IGluDQorICAgICAgICAqIHRoZSBuZXh0
IHJvdW5kIGFmdGVyIHN5bmNpbmcgZnJvbSB0aGUgbWVtb3J5IHJlZ2lvbiBiaXRtYXAuDQorICAg
ICAgICAqLw0KKyAgICAgICAgLyoNCisgICAgICAgICAqIFRoZSBza2lwcGVkIGZyZWUgcGFnZXMg
YXJlIGVxdWF2ZWxlbnQgdG8gYmUgc2VudCBmcm9tIGNsZWFyX2JtYXAncw0KKyAgICAgICAgKiBw
ZXJzcGVjdGl2ZSwgc28gY2xlYXIgdGhlIGJpdHMgZnJvbSB0aGUgbWVtb3J5IHJlZ2lvbiBiaXRt
YXAgd2hpY2gNCisgICAgICAgICogYXJlIGluaXRpYWxseSBzZXQuIE90aGVyd2lzZSB0aG9zZSBz
a2lwcGVkIHBhZ2VzIHdpbGwgYmUgc2VudCBpbg0KKyAgICAgICAgKiB0aGUgbmV4dCByb3VuZCBh
ZnRlciBzeW5jaW5nIGZyb20gdGhlIG1lbW9yeSByZWdpb24gYml0bWFwLg0KKyAgICAgICAgKi8N
CisgICAgICAgZG8gew0KKyAgICAgICAgICAgIHBhZ2VfdG9fY2xlYXIgPSBzdGFydCArIChpKysg
PDwgYmxvY2stPmNsZWFyX2JtYXBfc2hpZnQpOw0KKyAgICAgICAgICAgIG1pZ3JhdGlvbl9jbGVh
cl9tZW1vcnlfcmVnaW9uX2RpcnR5X2JpdG1hcChyYW1fc3RhdGUsDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrLA0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3RvX2Ns
ZWFyKTsNCisgICAgICAgfSB3aGlsZSAoaSA8PSBucGFnZXMgPj4gYmxvY2stPmNsZWFyX2JtYXBf
c2hpZnQpOw0KKw0KICAgICAgICAgcWVtdV9tdXRleF9sb2NrKCZyYW1fc3RhdGUtPmJpdG1hcF9t
dXRleCk7DQogICAgICAgICByYW1fc3RhdGUtPm1pZ3JhdGlvbl9kaXJ0eV9wYWdlcyAtPQ0KICAg
ICAgICAgICAgICAgICAgICAgICBiaXRtYXBfY291bnRfb25lX3dpdGhfb2Zmc2V0KGJsb2NrLT5i
bWFwLCBzdGFydCwgbnBhZ2VzKTsNCg0KQmVzdCwNCldlaQ0K

