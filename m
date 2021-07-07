Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972BB3BE486
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:37:25 +0200 (CEST)
Received: from localhost ([::1]:59348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m133c-0005fq-E6
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m12zw-0000pu-Sa
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:33:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:65089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m12zt-0005gn-Vy
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:33:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="294905609"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="294905609"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 01:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="627948762"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2021 01:33:24 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 01:33:23 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 7 Jul 2021 16:33:21 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.008;
 Wed, 7 Jul 2021 16:33:21 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAAWbAwIAGyxGAgAEKbIA=
Date: Wed, 7 Jul 2021 08:33:21 +0000
Message-ID: <2eb1ccd7105d4823898ea68a614d16f9@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com> <YOSaDzCd4ZmcRQHl@t490s>
In-Reply-To: <YOSaDzCd4ZmcRQHl@t490s>
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
Received-SPF: pass client-ip=192.55.52.43; envelope-from=wei.w.wang@intel.com;
 helo=mga05.intel.com
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gV2VkbmVzZGF5LCBKdWx5IDcsIDIwMjEgMjowMCBBTSwgUGV0ZXIgWHUgd3JvdGU6DQo+IE9u
IEZyaSwgSnVsIDAyLCAyMDIxIGF0IDAyOjI5OjQxQU0gKzAwMDAsIFdhbmcsIFdlaSBXIHdyb3Rl
Og0KPiA+IFdpdGggdGhhdCwgaWYgZnJlZSBwYWdlIG9wdCBpcyBvZmYsIHRoZSBtdXRleCBpcyBz
a2lwcGVkLCBpc24ndCBpdD8NCj4gDQo+IFllcywgYnV0IHdoZW4gZnJlZSBwYWdlIGlzIG9uLCBp
dCdsbCBjaGVjayBvbmNlIHBlciBwYWdlLiAgQXMgSSBtZW50aW9uZWQgSSBzdGlsbA0KPiBkb24n
dCB0aGluayBpdCdzIHRoZSByaWdodCB0aGluZyB0byBkby4NCg0KV2l0aCBmcmVlIHBhZ2Ugb3B0
IG9uLCBpZiB0aGUgbWlncmF0aW9uIHRocmVhZCB3YWl0cyBmb3IgbG9jayBhY3F1aXJlIG9uIGEg
cGFnZSwgaXQgYWN0dWFsbHkgbWVhbnMgdGhhdCBpdCBpcyB0cnlpbmcgdG8gc2tpcCB0aGUgdHJh
bnNmZXIgb2YgYSBwYWdlLg0KRm9yIGV4YW1wbGUsIHdhaXRpbmcgZm9yIHRoZSBsb2NrIHRha2Vz
IDEwMG5zLCB0aGVuIHRoZSBza2lwIG9mIHNlbmRpbmcgYSBwYWdlIHNhdmVzIGJhY2sgMTAwMG5z
LCB0aGVuIG92ZXJhbGwgd2Ugc2F2ZWQgOTAwbnMgcGVyIHBhZ2UgKGkuZS4gcGF5IGxlc3MgYW5k
IGVhcm4gbW9yZSkuDQoNCj4gDQo+IFdlIGVuY291bnRlcmVkIHRoaXMgcHJvYmxlbSB3aGVuIG1p
Z3JhdGluZyBhIDN0YiB2bSBhbmQgdGhlIG11dGV4IHNwaW5zIGFuZA0KPiBlYXRzIHRvbnMgb2Yg
Y3B1IHJlc291cmNlcy4gIEl0IHNob3VsZG4ndCBoYXBwZW4gd2l0aC93aXRob3V0IGJhbGxvb24s
IGltaG8uDQoNCkkgdGhpbmsgd2Ugc2hvdWxkIGNvbXBhcmUgdGhlIG92ZXJhbGwgbWlncmF0aW9u
IHRpbWUuDQoNCj4gDQo+IE5vdCB0byBtZW50aW9uIHRoZSBoYXJkIG1pZ3JhdGlvbiBpc3N1ZXMg
YXJlIG1vc3RseSB3aXRoIG5vbi1pZGxlIGd1ZXN0LCBpbiB0aGF0DQo+IGNhc2UgaGF2aW5nIHRo
ZSBiYWxsb29uIGluIHRoZSBndWVzdCB3aWxsIGJlIGRpc2FzdHJvdXMgZnJvbSB0aGlzIHBvdiBz
aW5jZSBpdCdsbCBzdGFydA0KPiB0byB0YWtlIG11dGV4IGZvciBlYWNoIHBhZ2UsIHdoaWxlIGJh
bGxvb24gd291bGQgaGFyZGx5IHJlcG9ydCBhbnl0aGluZyB2YWxpZA0KPiBzaW5jZSBtb3N0IGd1
ZXN0IHBhZ2VzIGFyZSBiZWluZyB1c2VkLg0KDQpJZiBubyBwYWdlcyBhcmUgcmVwb3J0ZWQsIG1p
Z3JhdGlvbiB0aHJlYWQgd291bGRuJ3Qgd2FpdCBvbiB0aGUgbG9jayB0aGVuLg0KDQpUbyBjb25j
bHVkZTogdG8gZGVjaWRlIHdoZXRoZXIgdGhlIHBlciBwYWdlIGxvY2sgaHVydHMgdGhlIHBlcmZv
cm1hbmNlIGNvbnNpZGVyaW5nIHRoYXQgdGhlIGxvY2sgaW4gc29tZSBzZW5zZSBhY3R1YWxseSBw
cmV2ZW50cyB0aGUgbWlncmF0aW9uIHRocmVhZCBmcm9tIHNlbmRpbmcgZnJlZSBwYWdlcyB3aGlj
aCBpdCBzaG91bGRuJ3QsIHdlIG5lZWQgdG8gY29tcGFyZSB0aGUgb3ZlcmFsbCBtaWdyYXRpb24g
dGltZS4NCihwcmV2aW91cyBkYXRhIGNvdWxkIGJlIGZvdW5kIGhlcmU6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2t2bS9jb3Zlci8xNTM1MzMzNTM5LTMyNDIwLTEtZ2l0LXNl
bmQtZW1haWwtd2VpLncud2FuZ0BpbnRlbC5jb20vLCBJIHRoaW5rIHRoZSBzaXR1YXRpb24gc2hv
dWxkIGJlIHRoZSBzYW1lIGZvciBlaXRoZXIgOEdCIG9yIDNUQiBndWVzdCwgaW4gdGVybXMgb2Yg
dGhlIG92ZXJhbGwgbWlncmF0aW9uIHRpbWUgY29tcGFyaXNvbikgDQoNCkJlc3QsDQpXZWkNCg==

