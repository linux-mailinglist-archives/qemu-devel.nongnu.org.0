Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633D3C6BF2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 10:21:50 +0200 (CEST)
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Dfn-0006SD-04
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 04:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3DeU-0005Bo-TT
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:20:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:56319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3DeS-0008UG-Cv
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:20:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="210097572"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="210097572"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 01:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="429966874"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 13 Jul 2021 01:20:11 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 13 Jul 2021 01:20:10 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 13 Jul 2021 16:20:08 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Tue, 13 Jul 2021 16:20:08 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAAWbAwIAGyxGAgAEKbICAAHLHgIABKgLggACGHwCAAUoocIAACfIAgAZdEOA=
Date: Tue, 13 Jul 2021 08:20:08 +0000
Message-ID: <22867e1aa6fe4533943e912b4b2e080f@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com> <YOSaDzCd4ZmcRQHl@t490s>
 <2eb1ccd7105d4823898ea68a614d16f9@intel.com> <YOXZ1fzH+qXGJLs1@t490s>
 <e392987d17f345969dd86be513b1702b@intel.com> <YOdEVI74aWIao3lU@t490s>
 <b242b77a68c64ae9aa13ae0dc6c081ec@intel.com> <YOhhoHJFyiQAEBRZ@t490s>
In-Reply-To: <YOhhoHJFyiQAEBRZ@t490s>
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
Received-SPF: pass client-ip=134.134.136.24; envelope-from=wei.w.wang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpZGF5LCBKdWx5IDksIDIwMjEgMTA6NDggUE0sIFBldGVyIFh1IHdyb3RlOg0KPiBPbiBG
cmksIEp1bCAwOSwgMjAyMSBhdCAwODo1ODowOEFNICswMDAwLCBXYW5nLCBXZWkgVyB3cm90ZToN
Cj4gPiBPbiBGcmlkYXksIEp1bHkgOSwgMjAyMSAyOjMxIEFNLCBQZXRlciBYdSB3cm90ZToNCj4g
PiA+ID4gPiBZZXMgSSB0aGluayB0aGlzIGlzIHRoZSBwbGFjZSBJIGRpZG4ndCBtYWtlIG15c2Vs
ZiBjbGVhci4gIEl0J3MNCj4gPiA+ID4gPiBub3QgYWJvdXQgc2xlZXBpbmcsIGl0J3MgYWJvdXQg
dGhlIGNtcHhjaGcgYmVpbmcgZXhwZW5zaXZlDQo+ID4gPiA+ID4gYWxyZWFkeSB3aGVuIHRoZSB2
bQ0KPiA+ID4gaXMgaHVnZS4NCj4gPiA+ID4NCj4gPiA+ID4gT0suDQo+ID4gPiA+IEhvdyBkaWQg
eW91IHJvb3QgY2F1c2UgdGhhdCBpdCdzIGNhdXNlZCBieSBjbXB4Y2hnLCBpbnN0ZWFkIG9mDQo+
ID4gPiA+IGxvY2sgY29udGVudGlvbiAoaS5lLiBzeXNjYWxsIGFuZCBzbGVlcCkgb3Igc29tZSBv
dGhlciBjb2RlIGluc2lkZQ0KPiA+ID4gcHRocmVhZF9tdXRleF9sb2NrKCkuIERvIHlvdSBoYXZl
IGN5Y2xlcyBhYm91dCBjbXB4Y2hnIHYucy4gY3ljbGVzDQo+ID4gPiBvZiBwdGhyZWFkX211dGV4
X2xvY2soKT8NCj4gPiA+DQo+ID4gPiBXZSd2ZSBnb3QgInBlcmYgdG9wIC1nIiBzaG93aW5nIGEg
aHVnZSBhbW91bnQgb2Ygc3RhY2tzIGx5aW5nIGluDQo+ID4gPiBwdGhyZWFkX211dGV4X2xvY2so
KS4NCj4gPg0KPiA+IFRoaXMgb25seSBleHBsYWlucyBwdGhyZWFkX211dGV4X2xvY2sgaXMgdGhl
IGNhdXNlLCBub3Qgcm9vdCBjYXVzZWQgdG8NCj4gY21weGNoZy4NCj4gDQo+IEkgdGhpbmsgdGhh
dCdzIGVub3VnaCBhbHJlYWR5IHRvIHByb3ZlIHdlIGNhbiBtb3ZlIHRoZSBsb2NrIGVsc2V3aGVy
ZS4NCj4gDQo+IEl0J3Mgbm90IHJlYWxseSBhIGhlYXZ5IHJhY2UgYmV0d2VlbiB0aHJlYWRzOyBp
dCdzIHRoZSBwdXJlIG92ZXJoZWFkIHdlIGNhbGxlZCBpdA0KPiB0b28gbWFueSB0aW1lcy4gIFNv
IGl0J3Mgbm90IHJlYWxseSBhIHByb2JsZW0geWV0IGFib3V0ICJ3aGF0IHR5cGUgb2YgbG9jayB3
ZQ0KPiBzaG91bGQgdXNlIiAobXV0ZXggb3Igc3BpbiBsb2NrKSBvciAiaG93IHRoaXMgbG9jayBp
cyBpbXBsZW1lbnRlZCIgKHNheSwgd2hldGhlcg0KPiB1c2luZyBjbXB4Y2hnIG9ubHkgb3Igb3B0
aW1pemUgdXNpbmcgdGVzdCArIHRlc3QtYW5kLXNldCwgYXMgdGhhdCBzb3VuZHMgbGlrZSBhDQo+
IGdvb2Qgb3B0aW1pemF0aW9uIG9mIHB1cmUgdGVzdC1hbmQtc2V0IHNwaW5sb2NrcykgYmVjYXVz
ZSB0aGUgbG9jayBpcyBub3QgYnVzeSBhdA0KPiBhbGwuDQoNCkp1c3QgRllJOg0KdGhlcmUgaXMg
YSBiaWcgd2hpbGUoMSkge30gaW5zaWRlIHB0aHJlYWRfbXV0ZXhfbG9jaywgbm90IHN1cmUgaWYg
dGhlIGhvdHNwb3QgaXMgaW4gdGhlIGxvb3AgdGhlcmUuDQoNCg0KPiA+IFdoYXQgaWYgdGhlIGd1
ZXN0IGdldHMgc3RvcHBlZCBhbmQgdGhlbiB0aGUgbWlncmF0aW9uIHRocmVhZCBnb2VzIHRvIHNs
ZWVwPw0KPiANCj4gSXNuJ3QgdGhlIGJhbGxvb24gY29kZSBydW4gaW4gYSBzdGFuZGFsb25lIGlv
dGhyZWFkPyAgV2h5IGd1ZXN0IHN0b3BwZWQgY2FuDQo+IHN0b3AgbWlncmF0aW9uIHRocmVhZD8N
Cg0KWWVzLCBpdCBpcyBhc3luYyBhcyB5b3Uga25vdy4gR3Vlc3QgcHV0cyBoaW50cyBpbnRvIHRo
ZSB2cSwgdGhlbiBnZXRzIHBhdXNlZCwNCmFuZCB0aGVuIHRoZSBkZXZpY2UgdGFrZXMgdGhlIG11
dGV4LCB0aGVuIHRoZSBtaWdyYXRpb24gdGhyZWFkIGdldHMgYmxvY2tlZC4NCkluIGdlbmVyYWws
IHdoZW4gd2UgdXNlIG11dGV4LCB3ZSBuZWVkIHRvIGNvbnNpZGVyIHRoYXQgY2FzZSB0aGF0IGl0
IGNvdWxkIGJlIGJsb2NrZWQuDQoNCj4gRnJvbSB3aGF0IEkgbGVhcm5lZCBpbiB0aGUgcGFzdCBm
ZXcgeWVhcnMsIGZ1bm5pbHkgInNwZWVkIG9mIG1pZ3JhdGlvbiIgaXMNCj4gbm9ybWFsbHkgbm90
IHdoYXQgcGVvcGxlIGNhcmUgdGhlIG1vc3QuICBJc3N1ZXMgYXJlIG1vc3RseSB3aXRoIGNvbnZl
cmdlbmNlDQo+IGFuZCBiZWluZyB0cmFuc3BhcmVudCB0byB1c2VycyB1c2luZyB0aGUgVk1zIHNv
IHRoZXkgYXJlbid0IGV2ZW4gYXdhcmUuDQoNClllcywgbWlncmF0aW9uIHRpbWUgaXNu4oCZdCB0
aGF0IGNyaXRpY2FsbHkgaW1wb3J0YW50LCBidXQgc2hvcnRlciBpcyBiZXR0ZXIgdGhhbiBsb25n
ZXIuDQpTa2lwcGluZyB0aG9zZSBmcmVlIHBhZ2VzIHNhdmVzIG5ldHdvcmsgYmFuZHdpZHRoLCB3
aGljaCBpcyBhbHNvIGdvb2QuDQpPaGVyd2lzZSwgMC1wYWdlIG9wdGltaXphdGlvbiBpbiBtaWdy
YXRpb24gaXMgYWxzbyBtZWFuaW5nbGVzcy4NCkluIHRoZW9yeSwgZnJlZSBwYWdlcyBpbiB0aGUg
bGFzdCByb3VuZCBjb3VsZCBhbHNvIGJlIHNraXBwZWQgdG8gcmVkdWNlIGRvd250aW1lDQooanVz
dCBoYXZlbid0IGdvdCBhIGdvb2QgdGVzdGNhc2UgdG8gc2hvdyBpdCkuDQoNCj4gPg0KPiA+IFNl
ZW1zIHdlIGxhY2sgcmVzb3VyY2VzIGZvciB0aG9zZSB0ZXN0cyByaWdodCBub3cuIElmIHlvdSBh
cmUgdXJnZW50IGZvciBhDQo+IGRlY2lzaW9uIHRvIGhhdmUgaXQgd29yayBmaXJzdCwgSSdtIGFs
c28gT0sgd2l0aCB5b3UgdG8gbWVyZ2UgaXQuDQo+IA0KPiBObyBJIGNhbid0IG1lcmdlIGl0IG15
c2VsZiBhcyBJJ20gbm90IHRoZSBtYWludGFpbmVyLiA6KSBJIGhhdmVuJ3QgcmVjZWl2ZWQgYW55
IGFjaw0KPiB5ZXQsIHNvIGF0IGxlYXN0IEknbGwgbmVlZCB0byBzZWUgaG93IERhdmUgYW5kIEp1
YW4gdGhpbmsuICBJdCdzIGp1c3QgdGhhdCBJIGRvbid0DQo+IHRoaW5rIHFlbXVzcGluIGNvdWxk
IGhlbHAgbXVjaCBpbiB0aGlzIGNhc2UsIGFuZCBJIGRvbid0IHdhbnQgdG8gbWVzcyB1cCB0aGUN
Cj4gaXNzdWUgdG9vLg0KPiANCg0KWWVzLCBJJ20gYWxzbyBPSyBpZiB0aGV5IHdhbnQgdG8gbWVy
Z2UgaXQuDQpJZiBpdCBpcyBwb3NzaWJsZSB0aGF0IGFueW9uZSBmcm9tIHlvdXIgdGVzdGluZyB0
ZWFtIChRQT8pIGNvdWxkIGhlbHAgZG8gYSByZWdyZXNzaW9uIHRlc3Qgb2YgZnJlZSBwYWdlIGhp
bnQsDQpjaGVja2luZyB0aGUgZGlmZmVyZW5jZSAoZS5nLiBtaWdyYXRpb24gdGltZSBvZiBhbiBp
ZGxlIGd1ZXN0KSBhZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLCB0aGF0IHdvdWxkIGJlIGdyZWF0
ZXIuIA0KVGhhbmtzIQ0KDQpCZXN0LA0KV2VpDQo=

