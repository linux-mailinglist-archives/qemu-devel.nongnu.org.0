Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE03B9AB4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 04:31:11 +0200 (CEST)
Received: from localhost ([::1]:39738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz8xS-0005mk-7A
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 22:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lz8wE-00052u-Ny
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 22:29:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:26723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lz8wB-0002UB-Rg
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 22:29:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="205654312"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="205654312"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 19:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="409149319"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 01 Jul 2021 19:29:44 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 1 Jul 2021 19:29:43 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 2 Jul 2021 10:29:41 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.008;
 Fri, 2 Jul 2021 10:29:41 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAAWbAwA==
Date: Fri, 2 Jul 2021 02:29:41 +0000
Message-ID: <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
In-Reply-To: <YN26SDxZS1aShbHi@t490s>
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
Received-SPF: pass client-ip=192.55.52.93; envelope-from=wei.w.wang@intel.com;
 helo=mga11.intel.com
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
 David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1cnNkYXksIEp1bHkgMSwgMjAyMSA4OjUxIFBNLCBQZXRlciBYdSB3cm90ZToNCj4gT24g
VGh1LCBKdWwgMDEsIDIwMjEgYXQgMDQ6NDI6MzhBTSArMDAwMCwgV2FuZywgV2VpIFcgd3JvdGU6
DQo+ID4gT24gVGh1cnNkYXksIEp1bHkgMSwgMjAyMSA0OjA4IEFNLCBQZXRlciBYdSB3cm90ZToN
Cj4gPiA+IFRha2luZyB0aGUgbXV0ZXggZXZlcnkgdGltZSBmb3IgZWFjaCBkaXJ0eSBiaXQgdG8g
Y2xlYXIgaXMgdG9vIHNsb3csDQo+ID4gPiBlc3BlY2lhbGx5IHdlJ2xsIHRha2UvcmVsZWFzZSBl
dmVuIGlmIHRoZSBkaXJ0eSBiaXQgaXMgY2xlYXJlZC4gIFNvDQo+ID4gPiBmYXIgaXQncyBvbmx5
IHVzZWQgdG8gc3luYyB3aXRoIHNwZWNpYWwgY2FzZXMgd2l0aA0KPiA+ID4gcWVtdV9ndWVzdF9m
cmVlX3BhZ2VfaGludCgpIGFnYWluc3QgbWlncmF0aW9uIHRocmVhZCwgbm90aGluZyByZWFsbHkg
dGhhdA0KPiBzZXJpb3VzIHlldC4gIExldCdzIG1vdmUgdGhlIGxvY2sgdG8gYmUgdXBwZXIuDQo+
ID4gPg0KPiA+ID4gVGhlcmUncmUgdHdvIGNhbGxlcnMgb2YgbWlncmF0aW9uX2JpdG1hcF9jbGVh
cl9kaXJ0eSgpLg0KPiA+ID4NCj4gPiA+IEZvciBtaWdyYXRpb24sIG1vdmUgaXQgaW50byByYW1f
c2F2ZV9pdGVyYXRlKCkuICBXaXRoIHRoZSBoZWxwIG9mDQo+ID4gPiBNQVhfV0FJVCBsb2dpYywg
d2UnbGwgb25seSBydW4gcmFtX3NhdmVfaXRlcmF0ZSgpIGZvciBubyBtb3JlIHRoYW4NCj4gPiA+
IDUwbXMtaXNoIHRpbWUsIHNvIHRha2luZyB0aGUgbG9jayBvbmNlIHRoZXJlIGF0IHRoZSBlbnRy
eS4gIEl0IGFsc28NCj4gPiA+IG1lYW5zIGFueSBjYWxsIHNpdGVzIHRvDQo+ID4gPiBxZW11X2d1
ZXN0X2ZyZWVfcGFnZV9oaW50KCkgY2FuIGJlIGRlbGF5ZWQ7IGJ1dCBpdCBzaG91bGQgYmUgdmVy
eQ0KPiA+ID4gcmFyZSwgb25seSBkdXJpbmcgbWlncmF0aW9uLCBhbmQgSSBkb24ndCBzZWUgYSBw
cm9ibGVtIHdpdGggaXQuDQo+ID4gPg0KPiA+ID4gRm9yIENPTE8sIG1vdmUgaXQgdXAgdG8gY29s
b19mbHVzaF9yYW1fY2FjaGUoKS4gIEkgdGhpbmsgQ09MTyBmb3Jnb3QNCj4gPiA+IHRvIHRha2Ug
dGhhdCBsb2NrIGV2ZW4gd2hlbiBjYWxsaW5nIHJhbWJsb2NrX3N5bmNfZGlydHlfYml0bWFwKCks
DQo+ID4gPiB3aGVyZSBhbm90aGVyIGV4YW1wbGUgaXMgbWlncmF0aW9uX2JpdG1hcF9zeW5jKCkg
d2hvIHRvb2sgaXQgcmlnaHQuDQo+ID4gPiBTbyBsZXQgdGhlIG11dGV4IGNvdmVyIGJvdGggdGhl
DQo+ID4gPiByYW1ibG9ja19zeW5jX2RpcnR5X2JpdG1hcCgpIGFuZCBtaWdyYXRpb25fYml0bWFw
X2NsZWFyX2RpcnR5KCkgY2FsbHMuDQo+ID4gPg0KPiA+ID4gSXQncyBldmVuIHBvc3NpYmxlIHRv
IGRyb3AgdGhlIGxvY2sgc28gd2UgdXNlIGF0b21pYyBvcGVyYXRpb25zIHVwb24NCj4gPiA+IHJi
LT5ibWFwIGFuZCB0aGUgdmFyaWFibGUgbWlncmF0aW9uX2RpcnR5X3BhZ2VzLiAgSSBkaWRuJ3Qg
ZG8gaXQNCj4gPiA+IGp1c3QgdG8gc3RpbGwgYmUgc2FmZSwgYWxzbyBub3QgcHJlZGljdGFibGUg
d2hldGhlciB0aGUgZnJlcXVlbnQgYXRvbWljIG9wcw0KPiBjb3VsZCBicmluZyBvdmVyaGVhZCB0
b28gZS5nLg0KPiA+ID4gb24gaHVnZSB2bXMgd2hlbiBpdCBoYXBwZW5zIHZlcnkgb2Z0ZW4uICBX
aGVuIHRoYXQgcmVhbGx5IGNvbWVzLCB3ZQ0KPiA+ID4gY2FuIGtlZXAgYSBsb2NhbCBjb3VudGVy
IGFuZCBwZXJpb2RpY2FsbHkgY2FsbCBhdG9taWMgb3BzLiAgS2VlcCBpdCBzaW1wbGUgZm9yDQo+
IG5vdy4NCj4gPiA+DQo+ID4NCj4gPiBJZiBmcmVlIHBhZ2Ugb3B0IGlzIGVuYWJsZWQsIDUwbXMg
d2FpdGluZyB0aW1lIG1pZ2h0IGJlIHRvbyBsb25nIGZvciBoYW5kbGluZw0KPiBqdXN0IG9uZSBo
aW50ICh2aWEgcWVtdV9ndWVzdF9mcmVlX3BhZ2VfaGludCk/DQo+ID4gSG93IGFib3V0IG1ha2lu
ZyB0aGUgbG9jayBjb25kaXRpb25hbGx5Pw0KPiA+IGUuZy4NCj4gPiAjZGVmaW5lIFFFTVVfTE9D
S19HVUFSRF9DT05EIChsb2NrLCBjb25kKSB7DQo+ID4gCWlmIChjb25kKQ0KPiA+IAkJUUVNVV9M
T0NLX0dVQVJEKGxvY2spOw0KPiA+IH0NCj4gPiBUaGVuIGluIG1pZ3JhdGlvbl9iaXRtYXBfY2xl
YXJfZGlydHk6DQo+ID4gUUVNVV9MT0NLX0dVQVJEX0NPTkQoJnJzLT5iaXRtYXBfbXV0ZXgsIHJz
LT5mcG9fZW5hYmxlZCk7DQo+IA0KPiBZZWFoIHRoYXQncyBpbmRlZWQgc29tZSBraW5kIG9mIGNv
bW1lbnQgSSdkIGxpa2UgdG8gZ2V0IGZyb20gZWl0aGVyIHlvdSBvciBEYXZpZA0KPiB3aGVuIEkg
YWRkIHRoZSBjYyBsaXN0Li4gOikNCj4gDQo+IEkgd2FzIGN1cmlvdXMgaG93IHRoYXQgd291bGQg
YWZmZWN0IHRoZSBndWVzdCB3aGVuIHRoZSBmcmVlIHBhZ2UgaGludCBoZWxwZXIgY2FuDQo+IHN0
dWNrIGZvciBhIHdoaWxlLiAgUGVyIG15IHVuZGVyc3RhbmRpbmcgaXQncyBmdWxseSBhc3luYyBh
cyB0aGUgYmxvY2tlZCB0aHJlYWQNCj4gaGVyZSBpcyBhc3luY2hyb25vdXNseSB3aXRoIHRoZSBn
dWVzdCBzaW5jZSBib3RoIHZpcnRpby1iYWxsb29uIGFuZCB2aXJ0aW8tbWVtDQo+IGFyZSBmdWxs
eSBhc3luYy4gSWYgc28sIHdvdWxkIGl0IHJlYWxseSBhZmZlY3QgdGhlIGd1ZXN0IGEgbG90PyAg
SXMgaXQgc3RpbGwgdG9sZXJhYmxlIGlmIGl0DQo+IG9ubHkgaGFwcGVucyBkdXJpbmcgbWlncmF0
aW9uPw0KDQpZZXMsIGl0IGlzIGFzeW5jIGFuZCB3b24ndCBibG9jayB0aGUgZ3Vlc3QuIEJ1dCBp
dCB3aWxsIG1ha2UgdGhlIG9wdGltaXphdGlvbiBkb2VzbuKAmXQgcnVuIGFzIGV4cGVjdGVkLg0K
VGhlIGludGVudGlvbiBpcyB0byBoYXZlIHRoZSBtaWdyYXRpb24gdGhyZWFkIHNraXAgdGhlIHRy
YW5zZmVyIG9mIHRoZSBmcmVlIHBhZ2VzLCBidXQgbm93IHRoZSBtaWdyYXRpb24NCnRocmVhZCBp
cyBraW5kIG9mIHVzaW5nIHRoZSA1MG1zIGxvY2sgdG8gcHJldmVudCB0aGUgY2xlYXJpbmcgb2Yg
ZnJlZSBwYWdlcyB3aGlsZSBpdCBpcyBsaWtlbHkganVzdCBzZW5kaW5nIGZyZWUgcGFnZXMgaW5z
aWRlIHRoZSBsb2NrLg0KKHRoZSByZXBvcnRlZCBmcmVlIHBhZ2VzIGFyZSBiZXR0ZXIgdG8gYmUg
Y2xlYXJlZCBpbiB0aGUgYml0bWFwIGluIHRpbWUgaW4gY2FzZSB0aGV5IGhhdmUgYWxyZWFkeSBz
ZW50KQ0KDQo+IA0KPiBUYWtpbmcgdGhhdCBtdXRleCBmb3IgZWFjaCBkaXJ0eSBiaXQgaXMgc3Rp
bGwgYW4gb3ZlcmtpbGwgdG8gbWUsIGlycmVsZXZhbnQgb2Ygd2hldGhlcg0KPiBpdCdzICJjb25k
aXRpb25hbCIgb3Igbm90LiAgDQoNCldpdGggdGhhdCwgaWYgZnJlZSBwYWdlIG9wdCBpcyBvZmYs
IHRoZSBtdXRleCBpcyBza2lwcGVkLCBpc24ndCBpdD8NCg0KPiBJZiBJJ20gdGhlIGNsb3VkIGFk
bWluLCBJIHdvdWxkIG1vcmUgcHJlZmVyIG1pZ3JhdGlvbg0KPiBmaW5pc2hlcyBlYXJsaWVyLCBp
bWhvLCByYXRoZXIgdGhhbiBmcmVlaW5nIHNvbWUgbW9yZSBwYWdlcyBvbiB0aGUgaG9zdCAoYWZ0
ZXINCj4gbWlncmF0aW9uIGFsbCBwYWdlcyB3aWxsIGJlIGdvbmUhKS4gIElmIGl0IHN0aWxsIGJs
b2NrcyB0aGUgZ3Vlc3QgaW4gc29tZSB1bmhlYWx0aHkNCj4gd2F5IEkgc3RpbGwgcHJlZmVyIHRv
IHRha2UgdGhlIGxvY2sgaGVyZSwgaG93ZXZlciBtYXliZSBtYWtlIGl0IHNob3J0ZXIgdGhhbg0K
PiA1MG1zLg0KPiANCg0KWWVzLCB3aXRoIHRoZSBvcHRpbWl6YXRpb24sIG1pZ3JhdGlvbiB3aWxs
IGJlIGZpbmlzaGVkIGVhcmxpZXIuDQpXaHkgaXQgbmVlZHMgdG8gZnJlZSBwYWdlcyBvbiB0aGUg
aG9zdD8NCihqdXN0IHNraXAgc2VuZGluZyB0aGUgcGFnZSkNCg0KQmVzdCwNCldlaQ0KDQoNCg0K

