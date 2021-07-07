Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCA3BE835
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:47:42 +0200 (CEST)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16xp-0004Op-Jt
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m16vy-0003io-Bo
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:45:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:2715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m16vv-0006oK-A7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:45:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196461897"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="196461897"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 05:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="423482619"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jul 2021 05:45:35 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 7 Jul 2021 05:45:34 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 7 Jul 2021 20:45:32 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.008;
 Wed, 7 Jul 2021 20:45:32 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAABk7AIABVF1Q///EdQCAAc2LkIADV9oAgAHNrMD//4hLgIAAftgAgAHFNbA=
Date: Wed, 7 Jul 2021 12:45:32 +0000
Message-ID: <b94e02b7e7bd4f2a8cbed73cb7756a68@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
 <a01758f98b3f46f282f0d6974862680d@intel.com>
 <f554501a-19d9-a22d-f399-5db4dbb81764@redhat.com> <YOSVZLwZzY/rZ0db@t490s>
In-Reply-To: <YOSVZLwZzY/rZ0db@t490s>
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
Received-SPF: pass client-ip=134.134.136.20; envelope-from=wei.w.wang@intel.com;
 helo=mga02.intel.com
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
Cc: Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gV2VkbmVzZGF5LCBKdWx5IDcsIDIwMjEgMTo0MCBBTSwgUGV0ZXIgWHUgd3JvdGU6DQo+IE9u
IFR1ZSwgSnVsIDA2LCAyMDIxIGF0IDEyOjA1OjQ5UE0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5k
IHdyb3RlOg0KPiA+IE9uIDA2LjA3LjIxIDExOjQxLCBXYW5nLCBXZWkgVyB3cm90ZToNCj4gPiA+
IE9uIE1vbmRheSwgSnVseSA1LCAyMDIxIDk6NDIgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
Og0KPiA+ID4gPiBPbiAwMy4wNy4yMSAwNDo1MywgV2FuZywgV2VpIFcgd3JvdGU6DQo+ID4gPiA+
ID4gT24gRnJpZGF5LCBKdWx5IDIsIDIwMjEgMzowNyBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3Jv
dGU6DQo+ID4gPiA+ID4gPiBPbiAwMi4wNy4yMSAwNDo0OCwgV2FuZywgV2VpIFcgd3JvdGU6DQo+
ID4gPiA+ID4gPiA+IE9uIFRodXJzZGF5LCBKdWx5IDEsIDIwMjEgMTA6MjIgUE0sIERhdmlkIEhp
bGRlbmJyYW5kIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IE9uIDAxLjA3LjIxIDE0OjUxLCBQZXRl
ciBYdSB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJIHRoaW5rIHRoYXQgY2xlYXJs
eSBzaG93cyB0aGUgaXNzdWUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTXkgdGhlb3J5IEkg
ZGlkIG5vdCB2ZXJpZnkgeWV0OiBBc3N1bWUgd2UgaGF2ZSAxR0IgY2h1bmtzIGluIHRoZSBjbGVh
cg0KPiBibWFwLg0KPiA+ID4gPiA+ID4gQXNzdW1lIHRoZSBWTSByZXBvcnRzIGFsbCBwYWdlcyB3
aXRoaW4gYSAxR0IgY2h1bmsgYXMgZnJlZQ0KPiA+ID4gPiA+ID4gKGVhc3kgd2l0aCBhIGZyZXNo
IFZNKS4gV2hpbGUgcHJvY2Vzc2luZyBoaW50cywgd2Ugd2lsbCBjbGVhcg0KPiA+ID4gPiA+ID4g
dGhlIGJpdHMgZnJvbSB0aGUgZGlydHkgYm1hcCBpbiB0aGUgUkFNQmxvY2suIEFzIHdlIHdpbGwg
bmV2ZXINCj4gPiA+ID4gPiA+IG1pZ3JhdGUgYW55IHBhZ2Ugb2YgdGhhdCAxR0IgY2h1bmssIHdl
IHdpbGwgbm90IGFjdHVhbGx5IGNsZWFyDQo+ID4gPiA+ID4gPiB0aGUgZGlydHkgYml0bWFwIG9m
IHRoZSBtZW1vcnkgcmVnaW9uLiBXaGVuIHJlLXN5bmNpbmcsIHdlDQo+ID4gPiA+ID4gPiB3aWxs
IHNldCBhbGwgYml0cyBiaXRzIGluIHRoZSBkaXJ0eSBibWFwIGFnYWluIGZyb20gdGhlIGRpcnR5
DQo+ID4gPiA+ID4gPiBiaXRtYXAgaW4gdGhlIG1lbW9yeSByZWdpb24uIFRodXMsIG1hbnkgb2Yg
b3VyIGhpbnRzIGVuZCB1cA0KPiA+ID4gPiA+ID4gYmVpbmcgbW9zdGx5IGlnbm9yZWQuIFRoZSBz
bWFsbGVyIHRoZSBjbGVhciBibWFwIGNodW5rLCB0aGUNCj4gPiA+ID4gbW9yZSBleHRyZW1lIHRo
ZSBpc3N1ZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9LLCB0aGF0IGxvb2tzIHBvc3NpYmxlLiBX
ZSBuZWVkIHRvIGNsZWFyIHRoZSByZWxhdGVkIGJpdHMgZnJvbQ0KPiA+ID4gPiA+IHRoZSBtZW1v
cnkgcmVnaW9uIGJpdG1hcCBiZWZvcmUgc2tpcHBpbmcgdGhlIGZyZWUgcGFnZXMuIENvdWxkDQo+
ID4gPiA+ID4geW91IHRyeSB3aXRoDQo+ID4gPiA+IGJlbG93IHBhdGNoOg0KPiA+ID4gPg0KPiA+
ID4gPiBJIGRpZCBhIHF1aWNrIHRlc3QgKHdpdGggdGhlIG1lbWhvZyBleGFtcGxlKSBhbmQgaXQg
c2VlbXMgbGlrZSBpdCBtb3N0bHkNCj4gd29ya3MuDQo+ID4gPiA+IEhvd2V2ZXIsIHdlJ3JlIG5v
dyBkb2luZyB0aGUgYml0bWFwIGNsZWFyaW5nIGZyb20gYW5vdGhlciwgcmFjaW5nDQo+ID4gPiA+
IHdpdGggdGhlIG1pZ3JhdGlvbiB0aHJlYWQuIEVzcGVjaWFsbHk6DQo+ID4gPiA+DQo+ID4gPiA+
IDEuIFJhY2luZyB3aXRoIGNsZWFyX2JtYXBfc2V0KCkgdmlhDQo+ID4gPiA+IGNwdV9waHlzaWNh
bF9tZW1vcnlfc3luY19kaXJ0eV9iaXRtYXAoKQ0KPiA+ID4gPiAyLiBSYWNpbmcgd2l0aCBtaWdy
YXRpb25fYml0bWFwX2NsZWFyX2RpcnR5KCkNCj4gPiA+ID4NCj4gPiA+ID4gU28gdGhhdCBtaWdo
dCBuZWVkIHNvbWUgdGhvdWdodCwgaWYgSSdtIG5vdCB3cm9uZy4NCj4gPiA+DQo+ID4gPiBJIHRo
aW5rIHRoaXMgaXMgc2ltaWxhciB0byB0aGUgbm9uLWNsZWFyX2JtYXAgY2FzZSwgd2hlcmUgdGhl
DQo+ID4gPiByYi0+Ym1hcCBpcyBzZXQgb3IgY2xlYXJlZCBieSB0aGUgbWlncmF0aW9uIHRocmVh
ZCBhbmQNCj4gPiA+IHFlbXVfZ3Vlc3RfZnJlZV9wYWdlX2hpbnQuIEZvciBleGFtcGxlLCB0aGUg
bWlncmF0aW9uIHRocmVhZCBjb3VsZCBmaW5kIGENCj4gYml0IGlzIHNldCBmcm9tIHJiLT5ibWFw
IGJlZm9yZSBxZW11X2d1ZXN0X2ZyZWVfcGFnZV9oaW50IGdldHMgdGhhdCBiaXQNCj4gY2xlYXJl
ZCBpbiB0aW1lLg0KPiA+ID4gVGhlIHJlc3VsdCBpcyB0aGF0IHRoZSBmcmVlIHBhZ2UgaXMgdHJh
bnNmZXJyZWQsIHdoaWNoIGlzbid0IG5lY2Vzc2FyeSwgYnV0IHdvbid0DQo+IGNhdXNlIGFueSBp
c3N1ZS4NCj4gPiA+IFRoaXMgaXMgdmVyeSByYXJlIGluIHByYWN0aWNlLg0KPiA+DQo+ID4gSGVy
ZSBhcmUgbXkgY29uY2VybnMgcmVnYXJkaW5nIHJhY2VzOg0KPiA+DQo+ID4gYSkgV2Ugbm93IGVu
ZCB1cCBjYWxsaW5nIG1pZ3JhdGlvbl9jbGVhcl9tZW1vcnlfcmVnaW9uX2RpcnR5X2JpdG1hcCgp
DQo+ID4gd2l0aG91dCBob2xkaW5nIHRoZSBiaXRtYXBfbXV0ZXguIFdlIGhhdmUgdG8gY2xhcmlm
eSBpZiB0aGF0IGlzIG9rLiBBdA0KPiA+IGxlYXN0DQo+ID4gbWlncmF0aW9uX2JpdG1hcF9jbGVh
cl9kaXJ0eSgpIGhvbGRzIGl0ICp3aGlsZSogY2xlYXJpbmcgdGhlIGxvZyBhbmQNCj4gPiBtaWdy
YXRpb25fYml0bWFwX3N5bmMoKSB3aGlsZSBzZXR0aW5nIGJpdHMgaW4gdGhlIGNsZWFyX2JtYXAu
IEkgdGhpbmsNCj4gPiB3ZSBhbHNvIGhhdmUgdG8gaG9sZCB0aGUgbXV0ZXggb24gdGhlIG5ldyBw
YXRoLg0KPiANCj4gTWFrZXMgc2Vuc2U7IEkgdGhpbmsgd2UgY2FuIGxldCBiaXRtYXBfbXV0ZXgg
dG8gcHJvdGVjdCBib3RoIGRpcnR5L2NsZWFyDQo+IGJpdG1hcHMsIGFuZCBhbHNvIHRoZSBkaXJ0
eSBwYWdlcyBjb3VudGVyLiAgSSdsbCBjb21tZW50IGluIFdlaSdzIHBhdGNoIHRvbyBsYXRlci4N
Cg0KQnR3LCB3aGF0IHdvdWxkIHlvdSB0aGluayBpZiB3ZSBjaGFuZ2UgbXV0ZXggdG8gUWVtdVNw
aW4/IEl0IHdpbGwgYWxzbyByZWR1Y2UgdGhlIG92ZXJoZWFkLCBJIHRoaW5rLg0KDQpCZXN0LA0K
V2VpDQo=

