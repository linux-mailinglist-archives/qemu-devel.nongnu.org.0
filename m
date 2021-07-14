Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8009B3C7DCF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:06:02 +0200 (CEST)
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3X5t-00077M-K3
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3X4d-00069G-1Y
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:04:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:7846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3X4a-0004Cl-FQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:04:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="271399280"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="271399280"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 22:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="654631436"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2021 22:04:33 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 13 Jul 2021 22:04:33 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 13:04:30 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Wed, 14 Jul 2021 13:04:30 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKtAp0+A///2yACAAWB80A==
Date: Wed, 14 Jul 2021 05:04:30 +0000
Message-ID: <fed8b4cd5ea04c61a325096712c107f2@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <9a8224c9a02b4d9395f6581b24deaa54@intel.com> <YO24UM1oWQqLMtvZ@t490s>
In-Reply-To: <YO24UM1oWQqLMtvZ@t490s>
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlc2RheSwgSnVseSAxMywgMjAyMSAxMTo1OSBQTSwgUGV0ZXIgWHUgd3JvdGU6DQo+IE9u
IFR1ZSwgSnVsIDEzLCAyMDIxIGF0IDA4OjQwOjIxQU0gKzAwMDAsIFdhbmcsIFdlaSBXIHdyb3Rl
Og0KPiANCj4gRGlkbid0IGdldCBhIGNoYW5jZSB0byBkb2N1bWVudCBpdCBhcyBpdCdzIGluIGEg
cHVsbCBub3c7IGJ1dCBhcyBsb25nIGFzIHlvdSdyZSBva2F5DQo+IHdpdGggbm8tcGVyLXBhZ2Ug
bG9jayAod2hpY2ggSSBzdGlsbCBkb24ndCBhZ3JlZSB3aXRoKSwgSSBjYW4gZm9sbG93IHRoaXMg
dXAuDQo+IA0KPiBBcmUgYmVsb3cgcGFyYW1ldGVycyBlbm91Z2ggZm9yIG1lIHRvIGVuYWJsZSBm
cmVlLXBhZ2UtaGludD8NCj4gDQo+ICAgICAgLW9iamVjdCBpb3RocmVhZCxpZD1pbzEgXA0KPiAg
ICAgIC1kZXZpY2UgdmlydGlvLWJhbGxvb24sZnJlZS1wYWdlLWhpbnQ9b24saW90aHJlYWQ9aW8x
IFwNCj4gDQo+IEkgdHJpZWQgdG8gdmVyaWZ5IGl0J3MgcnVubmluZyBieSB0cmFjaW5nIGluc2lk
ZSBndWVzdCB3aXRoIGtwcm9iZQ0KPiByZXBvcnRfZnJlZV9wYWdlX2Z1bmMoKSBidXQgaXQgZGlk
bid0IHJlYWxseSB0cmlnZ2VyLiAgR3Vlc3QgaGFzIGtlcm5lbA0KPiA1LjExLjEyLTMwMC5mYzM0
Lng4Nl82NCwgc2hvdWxkIGJlIGZhaXJseSBuZXcgdG8gaGF2ZSB0aGF0IHN1cHBvcnRlZC4gIERv
IHlvdQ0KPiBrbm93IHdoYXQgSSdtIG1pc3Npbmc/DQoNClBsZWFzZSBjaGVjayBpZiB5b3UgaGF2
ZSB0aGUgdmlydGlvLWJhbGxvb24gZHJpdmVyIGxvYWRlZCBpbiB0aGUgZ3Vlc3QuDQoNCj4gDQo+
IFAuUy4gVGhpcyBhbHNvIHJlbWluZGVkIG1lIHRoYXQsIG1heWJlIHdlIHdhbnQgYW4gZW50cnkg
aW4gcWVtdS1vcHRpb25zLmh4IGZvcg0KPiBiYWxsb29uIGRldmljZSwgYXMgaXQgaGFzIGxvdHMg
b2Ygb3B0aW9ucywgc29tZSBvZiB0aGVtIG1heSBub3QgYmUgZWFzeSB0byBiZQ0KPiBzZXR1cCBy
aWdodC4NCj4gDQoNClNvdW5kcyBnb29kIHRvIG1lLg0KDQpCZXN0LA0KV2VpDQo=

