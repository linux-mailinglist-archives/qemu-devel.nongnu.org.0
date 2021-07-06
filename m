Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB503BC89B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:42:48 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hbL-00070B-1d
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m0ha1-0005yk-2r
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:41:25 -0400
Received: from mga01.intel.com ([192.55.52.88]:17943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m0hZx-0005Sv-0d
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:41:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="230813931"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="230813931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="481555272"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2021 02:41:14 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 6 Jul 2021 02:41:14 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 6 Jul 2021 17:41:09 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.008;
 Tue, 6 Jul 2021 17:41:09 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAABk7AIABVF1Q///EdQCAAc2LkIADV9oAgAHNrMA=
Date: Tue, 6 Jul 2021 09:41:09 +0000
Message-ID: <a01758f98b3f46f282f0d6974862680d@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
In-Reply-To: <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
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
Received-SPF: pass client-ip=192.55.52.88; envelope-from=wei.w.wang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uZGF5LCBKdWx5IDUsIDIwMjEgOTo0MiBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6
DQo+IE9uIDAzLjA3LjIxIDA0OjUzLCBXYW5nLCBXZWkgVyB3cm90ZToNCj4gPiBPbiBGcmlkYXks
IEp1bHkgMiwgMjAyMSAzOjA3IFBNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4gPj4gT24g
MDIuMDcuMjEgMDQ6NDgsIFdhbmcsIFdlaSBXIHdyb3RlOg0KPiA+Pj4gT24gVGh1cnNkYXksIEp1
bHkgMSwgMjAyMSAxMDoyMiBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+ID4+Pj4gT24g
MDEuMDcuMjEgMTQ6NTEsIFBldGVyIFh1IHdyb3RlOg0KPiA+Pg0KPiA+PiBJIHRoaW5rIHRoYXQg
Y2xlYXJseSBzaG93cyB0aGUgaXNzdWUuDQo+ID4+DQo+ID4+IE15IHRoZW9yeSBJIGRpZCBub3Qg
dmVyaWZ5IHlldDogQXNzdW1lIHdlIGhhdmUgMUdCIGNodW5rcyBpbiB0aGUgY2xlYXIgYm1hcC4N
Cj4gPj4gQXNzdW1lIHRoZSBWTSByZXBvcnRzIGFsbCBwYWdlcyB3aXRoaW4gYSAxR0IgY2h1bmsg
YXMgZnJlZSAoZWFzeSB3aXRoDQo+ID4+IGEgZnJlc2ggVk0pLiBXaGlsZSBwcm9jZXNzaW5nIGhp
bnRzLCB3ZSB3aWxsIGNsZWFyIHRoZSBiaXRzIGZyb20gdGhlDQo+ID4+IGRpcnR5IGJtYXAgaW4g
dGhlIFJBTUJsb2NrLiBBcyB3ZSB3aWxsIG5ldmVyIG1pZ3JhdGUgYW55IHBhZ2Ugb2YgdGhhdA0K
PiA+PiAxR0IgY2h1bmssIHdlIHdpbGwgbm90IGFjdHVhbGx5IGNsZWFyIHRoZSBkaXJ0eSBiaXRt
YXAgb2YgdGhlIG1lbW9yeQ0KPiA+PiByZWdpb24uIFdoZW4gcmUtc3luY2luZywgd2Ugd2lsbCBz
ZXQgYWxsIGJpdHMgYml0cyBpbiB0aGUgZGlydHkgYm1hcA0KPiA+PiBhZ2FpbiBmcm9tIHRoZSBk
aXJ0eSBiaXRtYXAgaW4gdGhlIG1lbW9yeSByZWdpb24uIFRodXMsIG1hbnkgb2Ygb3VyDQo+ID4+
IGhpbnRzIGVuZCB1cCBiZWluZyBtb3N0bHkgaWdub3JlZC4gVGhlIHNtYWxsZXIgdGhlIGNsZWFy
IGJtYXAgY2h1bmssIHRoZQ0KPiBtb3JlIGV4dHJlbWUgdGhlIGlzc3VlLg0KPiA+DQo+ID4gT0ss
IHRoYXQgbG9va3MgcG9zc2libGUuIFdlIG5lZWQgdG8gY2xlYXIgdGhlIHJlbGF0ZWQgYml0cyBm
cm9tIHRoZQ0KPiA+IG1lbW9yeSByZWdpb24gYml0bWFwIGJlZm9yZSBza2lwcGluZyB0aGUgZnJl
ZSBwYWdlcy4gQ291bGQgeW91IHRyeSB3aXRoDQo+IGJlbG93IHBhdGNoOg0KPiANCj4gSSBkaWQg
YSBxdWljayB0ZXN0ICh3aXRoIHRoZSBtZW1ob2cgZXhhbXBsZSkgYW5kIGl0IHNlZW1zIGxpa2Ug
aXQgbW9zdGx5IHdvcmtzLg0KPiBIb3dldmVyLCB3ZSdyZSBub3cgZG9pbmcgdGhlIGJpdG1hcCBj
bGVhcmluZyBmcm9tIGFub3RoZXIsIHJhY2luZyB3aXRoIHRoZQ0KPiBtaWdyYXRpb24gdGhyZWFk
LiBFc3BlY2lhbGx5Og0KPiANCj4gMS4gUmFjaW5nIHdpdGggY2xlYXJfYm1hcF9zZXQoKSB2aWEg
Y3B1X3BoeXNpY2FsX21lbW9yeV9zeW5jX2RpcnR5X2JpdG1hcCgpDQo+IDIuIFJhY2luZyB3aXRo
IG1pZ3JhdGlvbl9iaXRtYXBfY2xlYXJfZGlydHkoKQ0KPiANCj4gU28gdGhhdCBtaWdodCBuZWVk
IHNvbWUgdGhvdWdodCwgaWYgSSdtIG5vdCB3cm9uZy4NCg0KSSB0aGluayB0aGlzIGlzIHNpbWls
YXIgdG8gdGhlIG5vbi1jbGVhcl9ibWFwIGNhc2UsIHdoZXJlIHRoZSByYi0+Ym1hcCBpcyBzZXQg
b3IgY2xlYXJlZCBieQ0KdGhlIG1pZ3JhdGlvbiB0aHJlYWQgYW5kIHFlbXVfZ3Vlc3RfZnJlZV9w
YWdlX2hpbnQuIEZvciBleGFtcGxlLCB0aGUgbWlncmF0aW9uIHRocmVhZA0KY291bGQgZmluZCBh
IGJpdCBpcyBzZXQgZnJvbSByYi0+Ym1hcCBiZWZvcmUgcWVtdV9ndWVzdF9mcmVlX3BhZ2VfaGlu
dCBnZXRzIHRoYXQgYml0IGNsZWFyZWQgaW4gdGltZS4NClRoZSByZXN1bHQgaXMgdGhhdCB0aGUg
ZnJlZSBwYWdlIGlzIHRyYW5zZmVycmVkLCB3aGljaCBpc24ndCBuZWNlc3NhcnksIGJ1dCB3b24n
dCBjYXVzZSBhbnkgaXNzdWUuDQpUaGlzIGlzIHZlcnkgcmFyZSBpbiBwcmFjdGljZS4NCg0KPiAN
Cj4gVGhlIHNpbXBsZXN0IGFwcHJvYWNoIHdvdWxkIGJlIHJlbW92aW5nL2ZyZWVpbmcgdGhlIGNs
ZWFyX2JtYXAgdmlhDQo+IFBSRUNPUFlfTk9USUZZX1NFVFVQKCksIHNpbWlsYXIgdG8NCj4gcHJl
Y29weV9lbmFibGVfZnJlZV9wYWdlX29wdGltaXphdGlvbigpIHdlIGhhZCBiZWZvcmUuIE9mIGNv
dXJzZSwgdGhpcyB3aWxsDQo+IHNraXAgdGhlIGNsZWFyX2JtYXAgb3B0aW1pemF0aW9uLg0KDQpO
b3QgbmVjZXNzYXJpbHksIEkgdGhpbmsuIFRoZSB0d28gb3B0aW1pemF0aW9ucyBhcmUgbm90IG11
dHVhbCBleGNsdXNpdmUgZXNzZW50aWFsbHkuDQpBdCBsZWFzdCwgdGhleSB3b3JrIHdlbGwgdG9n
ZXRoZXIgbm93LiBJZiB0aGVyZSBhcmUgb3RoZXIgaW1wbGVtZW50YXRpb24gaXNzdWVzIHJlcG9y
dGVkLA0Kd2UgY291bGQgY2hlY2sgdGhlbSB0aGVuLg0KDQpCZXN0LA0KV2VpDQo=

