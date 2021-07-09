Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BA3C211A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 10:59:20 +0200 (CEST)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mLv-0005Ma-6y
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 04:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1mL0-00044o-Sy
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:58:22 -0400
Received: from mga12.intel.com ([192.55.52.136]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1mKx-0006ol-TX
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:58:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="189350831"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="189350831"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 01:58:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="498841782"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2021 01:58:13 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 9 Jul 2021 01:58:12 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 9 Jul 2021 16:58:08 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Fri, 9 Jul 2021 16:58:08 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAAWbAwIAGyxGAgAEKbICAAHLHgIABKgLggACGHwCAAUoocA==
Date: Fri, 9 Jul 2021 08:58:08 +0000
Message-ID: <b242b77a68c64ae9aa13ae0dc6c081ec@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com> <YOSaDzCd4ZmcRQHl@t490s>
 <2eb1ccd7105d4823898ea68a614d16f9@intel.com> <YOXZ1fzH+qXGJLs1@t490s>
 <e392987d17f345969dd86be513b1702b@intel.com> <YOdEVI74aWIao3lU@t490s>
In-Reply-To: <YOdEVI74aWIao3lU@t490s>
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
Received-SPF: pass client-ip=192.55.52.136; envelope-from=wei.w.wang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gRnJpZGF5LCBKdWx5IDksIDIwMjEgMjozMSBBTSwgUGV0ZXIgWHUgd3JvdGU6DQo+ID4gPiBZ
ZXMgSSB0aGluayB0aGlzIGlzIHRoZSBwbGFjZSBJIGRpZG4ndCBtYWtlIG15c2VsZiBjbGVhci4g
IEl0J3Mgbm90DQo+ID4gPiBhYm91dCBzbGVlcGluZywgaXQncyBhYm91dCB0aGUgY21weGNoZyBi
ZWluZyBleHBlbnNpdmUgYWxyZWFkeSB3aGVuIHRoZSB2bQ0KPiBpcyBodWdlLg0KPiA+DQo+ID4g
T0suDQo+ID4gSG93IGRpZCB5b3Ugcm9vdCBjYXVzZSB0aGF0IGl0J3MgY2F1c2VkIGJ5IGNtcHhj
aGcsIGluc3RlYWQgb2YgbG9jaw0KPiA+IGNvbnRlbnRpb24gKGkuZS4gc3lzY2FsbCBhbmQgc2xl
ZXApIG9yIHNvbWUgb3RoZXIgY29kZSBpbnNpZGUNCj4gcHRocmVhZF9tdXRleF9sb2NrKCkuIERv
IHlvdSBoYXZlIGN5Y2xlcyBhYm91dCBjbXB4Y2hnIHYucy4gY3ljbGVzIG9mDQo+IHB0aHJlYWRf
bXV0ZXhfbG9jaygpPw0KPiANCj4gV2UndmUgZ290ICJwZXJmIHRvcCAtZyIgc2hvd2luZyBhIGh1
Z2UgYW1vdW50IG9mIHN0YWNrcyBseWluZyBpbg0KPiBwdGhyZWFkX211dGV4X2xvY2soKS4NCg0K
VGhpcyBvbmx5IGV4cGxhaW5zIHB0aHJlYWRfbXV0ZXhfbG9jayBpcyB0aGUgY2F1c2UsIG5vdCBy
b290IGNhdXNlZCB0byBjbXB4Y2hnLg0KDQo+IA0KPiA+DQo+ID4gSSBjaGVjayB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgcHRocmVhZF9tdXRleF9sb2NrKCkuIFRoZSBjb2RlIHBhdGggZm9yIGxvY2sN
Cj4gYWNxdWlyZSBpcyBsb25nLiBRZW11U3BpbiBsb29rcyBtb3JlIGVmZmljaWVudC4NCj4gPiAo
cHJvYmFibHkgd2UgYWxzbyBkb27igJl0IHdhbnQgbWlncmF0aW9uIHRocmVhZCB0byBzbGVlcCBp
biBhbnkgY2FzZSkNCj4gDQo+IEkgZGlkbid0IGNoZWNrIGl0LCBidXQgSSByZWFsbHkgaG9wZWQg
aXQgc2hvdWxkIGJlIHZlcnkgY2xvc2UgdG8gYSBzcGlubG9jayB2ZXJzaW9uDQo+IHdoZW4gaXQn
cyBub3QgY29udGVuZGVkLiAgV2Ugc2hvdWxkIGJlIGNhcmVmdWwgb24gdXNpbmcgc3BpbiBsb2Nr
cyBpbiB1c2Vyc3BhY2UsDQo+IGUuZy4sIHdpdGggdGhhdCBtb3ZpbmcgY2xlYXIgbG9nIGludG8g
Y3JpdGljYWwgc2VjdGlvbiB3aWxsIGJlIHRvbyBtdWNoIGFuZCBhY3R1YWxsDQo+IGNsb3NlIHRv
ICJ3cm9uZyIsIGltaG8sIGJlY2F1c2UgdGhlIGt2bSBtZW1zbG90IGxvY2sgaW5zaWRlIGlzIHNs
ZWVwYWJsZS4NCg0KT0ssIHRoYXQgbWlnaHQgYmUgYSBnb29kIHJlYXNvbiB0byBrZWVwIGNsZWFy
X21hcCBvdXQgb2YgdGhlIGxvY2suDQpXZSBhbHNvIGRvbuKAmXQgd2FudCB0aGUgbG9jayBob2xk
ZXIgdG8gaGF2ZSBtb3JlIGNoYW5jZXMgdG8gZ28gdG8gc2xlZXAgdGhvdWdoIGl0IGlzIG11dGV4
Lg0KDQo+IA0KPiBJIHRoaW5rIGl0J3MgdmVyeSBmaW5lIHRvIGhhdmUgbWlncmF0aW9uIHRocmVh
ZCBzbGVlcC4gIElNSE8gd2UgbmVlZCBleHBsaWNpdA0KPiBqdXN0aWZpY2F0aW9uIGZvciBlYWNo
IG11dGV4IHRvIGJlIGNvbnZlcnRlZCB0byBhIHNwaW5sb2NrIGluIHVzZXJzcGFjZS4gIFNvIGZh
ciBJDQo+IGRvbid0IHNlZSBpdCB5ZXQgZm9yIHRoaXMgYml0bWFwIGxvY2suDQoNCldoYXQgaWYg
dGhlIGd1ZXN0IGdldHMgc3RvcHBlZCBhbmQgdGhlbiB0aGUgbWlncmF0aW9uIHRocmVhZCBnb2Vz
IHRvIHNsZWVwPw0KDQo+IA0KPiBGcmFua2x5IEkgYWxzbyBkb24ndCBrbm93IGhvdyBzcGlubG9j
ayB3b3VsZCB3b3JrIHJlbGlhYmx5IHdpdGhvdXQgYmVpbmcgYWJsZSB0bw0KPiBkaXNhYmxlIHNj
aGVkdWxpbmcsIHRoZW4gY291bGQgdGhlIHRocmVhZCBnb3Qgc2NoZWR1bGVkIG91dCBkdWluZyB0
YWtpbmcgdGhlDQo+IHNwaW5sb2NrPyAgV291bGQgYW5vdGhlciB0aHJlYWQgdHJ5aW5nIHRvIHRh
a2UgdGhpcyBsb2NrIHNwaW5uaW5nIG9uIHRoaXMgc2xlZXBpbmcNCj4gdGFzaz8NCg0KWWVzLCBh
bmQgaXQgbmVlZHMgZ29vZCBqdXN0aWZpY2F0aW9uOg0KSWYgaXQncyBwZXItcGFnZSBzcGlubG9j
aywgdGhlIGdyYW51bGFyaXR5IGlzIHZlcnkgc21hbGwsIHNvIGl0IGhhcyB2ZXJ5IGxpdHRsZSBj
aGFuY2UgdGhhdCBhIGxvY2sgaG9sZGVyIGdldHMgc2NoZWR1bGVkIG91dCBhcyB0aW1lIHNsaWNl
IHVzZXMgdXAuIEV2ZW4gdGhhdCBoYXBwZW5zIG9uY2UsIGl0IHNlZW1zIG5vIGJpZyBpc3N1ZXMs
IGp1c3QgdGhlIHdhaXRlciB3YXN0ZXMgc29tZSBDUFUgY3ljbGVzLCB0aGlzIGlzIGJldHRlciB0
aGFuIGhhdmluZyB0aGUgbWlncmF0aW9uIHRocmVhZCBzY2hlZHVsZWQgb3V0IGJ5IG11dGV4LCBJ
IHRoaW5rLg0KDQo+IA0KPiA+DQo+ID4gSSB0aGluayBpdCdzIGFsc28gYmV0dGVyIHRvIHNlZSB0
aGUgY29tcGFyaXNvbiBvZiBtaWdyYXRpb24gdGhyb3VnaHB1dCBkYXRhIChpLmUuDQo+IHBhZ2Vz
IHBlciBzZWNvbmQpIGluIHRoZSBmb2xsb3dpbmcgY2FzZXMsIGJlZm9yZSB3ZSBtYWtlIGEgZGVj
aXNpb246DQo+ID4gLSBwZXItcGFnZSBtdXRleA0KPiA+IC0gcGVyLXBhZ2Ugc3BpbmxvY2sNCj4g
PiAtIDUwLW1zIG11dGV4DQo+IA0KPiBJIGRvbid0IGhhdmUgdGhlIG1hY2hpbmVzLCBzbyBJIGNh
bid0IGRvIHRoaXMuICBJIGFsc28gc2VlIHRoaXMgYXMgc2VwYXJhdGUgaXNzdWVzIHRvDQo+IHNv
bHZlIHRvIHVzZSBzcGlubG9jaywgYXMgSSBzYWlkIGJlZm9yZSBJIHdvdWxkIHByZWZlciBzb21l
IGp1c3RpZmljYXRpb24gZmlyc3QgdG8gdXNlDQo+IGl0IHJhdGhlciB0aGFuIGJsaW5kbHkgcnVu
bmluZyB0ZXN0cyBhbmQgcGljayBhIHBhdGNoIHdpdGggaGlnaGVyIG51bWJlci4NCj4gDQo+IEkg
YWxzbyBob3BlIHdlIGNhbiByZWFjaCBhIGNvbnNlbnN1cyB0aGF0IHdlIGZpeCBvbmUgaXNzdWUg
YXQgYSB0aW1lLiAgVGhpcyBwYXRjaA0KPiBhbHJlYWR5IHByb3ZlcyBpdHNlbGYgd2l0aCBzb21l
IHJlYWwgd29ya2xvYWRzLCBJIGhvcGUgd2UgY2FuIG1lcmdlIGl0IGZpcnN0LA0KPiBlaXRoZXIg
d2l0aCA1MG1zIHBlcmlvZCBvciBsZXNzLg0KPiANCj4gUGVyLXBhZ2UgbG9ja2luZyBpcyBhbHJl
YWR5IGFnYWluc3QgYXQgbGVhc3QgbXkgaW5zdGluY3Rpb24gb2YgaG93IHRoaXMgc2hvdWxkIGJl
DQo+IGRvbmU7IEkganVzdCByZWdyZXRlZCBJIGRpZG4ndCBzZWUgdGhhdCBhbiBpc3N1ZSB3aGVu
IHJldmlld2luZyB0aGUgYmFsbG9vbiBwYXRjaA0KPiBhcyBJIG9mZmVyZWQgdGhlIHItYiBteXNl
bGYuICBIb3dldmVyIEkgd2FudCB0byBtYWtlIGl0IHdvcmsgYXMgYmVmb3JlIHRoZW4gd2UNCj4g
ZmlndXJlIG91dCBhIGJldHRlciBhcHByb2FjaCBvbiBob3cgdGhlIGxvY2sgaXMgdGFrZW4sIGFu
ZCB3aGljaCBsb2NrIHdlIHNob3VsZA0KPiB1c2UuICBJIGRvbid0IHNlZSBpdCBhIG11c3QgdG8g
ZG8gYWxsIHRoaW5ncyBpbiBvbmUgcGF0Y2guDQoNClNvcnJ5LCBpdCB3YXNuJ3QgbXkgaW50ZW50
aW9uIHRvIGJlIGEgYmFycmllciB0byBtZXJnaW5nIHlvdXIgcGF0Y2guDQpKdXN0IHRyeSB0byBj
b21lIHVwIHdpdGggYmV0dGVyIHNvbHV0aW9ucyBpZiBwb3NzaWJsZS4NCi0gT3B0aW9uMSBRZW11
U3BpbiBsb2NrIHdvdWxkIHJlZHVjZSB0aGUgbG9jayBhY3F1aXJpbmcgb3ZlcmhlYWQsIGJ1dCBu
ZWVkIHRvIHRlc3QgaWYgdGhhdCBtaWdyYXRpb24gY291bGQgY29udmVyZ2U7DQotIE9wdGlvbjIg
Y29uZGl0aW9uYWwgbG9jay4gV2UgaGF2ZW4ndCBzZWUgdGhlIHRlc3QgcmVzdWx0cyBpZiB0dXJu
aW5nIG9uIGZyZWUgcGFnZSBvcHRpbWl6YXRpb24gd2l0aCB0aGF0IHBlci1wYWdlIGxvY2sgY291
bGQgc3RpbGwgbWFrZSB5b3VyIDJUQiBndWVzdCBtaWdyYXRpb24gY29udmVyZ2UuDQoNClNlZW1z
IHdlIGxhY2sgcmVzb3VyY2VzIGZvciB0aG9zZSB0ZXN0cyByaWdodCBub3cuIElmIHlvdSBhcmUg
dXJnZW50IGZvciBhIGRlY2lzaW9uIHRvIGhhdmUgaXQgd29yayBmaXJzdCwgSSdtIGFsc28gT0sg
d2l0aCB5b3UgdG8gbWVyZ2UgaXQuDQoNCkJlc3QsDQpXZWkNCg0K

