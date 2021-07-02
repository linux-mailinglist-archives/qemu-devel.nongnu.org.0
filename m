Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0E3B9AC1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 04:49:44 +0200 (CEST)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz9FO-00008v-Sa
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 22:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lz9EC-0007vT-VL
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 22:48:29 -0400
Received: from mga02.intel.com ([134.134.136.20]:32463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lz9E9-0005xL-RV
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 22:48:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="195826466"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="195826466"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 19:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="457935577"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2021 19:48:15 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 1 Jul 2021 19:48:15 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 2 Jul 2021 10:48:13 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.008;
 Fri, 2 Jul 2021 10:48:13 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAABk7AIABVF1Q
Date: Fri, 2 Jul 2021 02:48:13 +0000
Message-ID: <604935aa45114d889800f6ccc23c6b13@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
In-Reply-To: <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
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

T24gVGh1cnNkYXksIEp1bHkgMSwgMjAyMSAxMDoyMiBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3Jv
dGU6DQo+IE9uIDAxLjA3LjIxIDE0OjUxLCBQZXRlciBYdSB3cm90ZToNCj4gU3BvaWxlciBhbGVy
dDogdGhlIGludHJvZHVjdGlvbiBvZiBjbGVhbiBiaXRtYXBzIHBhcnRpYWxseSBicm9rZSBmcmVl
IHBhZ2UgaGludGluZw0KPiBhbHJlYWR5IChhcyBjbGVhcmluZyBoYXBwZW5zIGRlZmVycmVkIC0t
IGFuZCBtaWdodCBuZXZlciBoYXBwZW4gaWYgd2UgZG9uJ3QNCj4gbWlncmF0ZSAqYW55KiBwYWdl
IHdpdGhpbiBhIGNsZWFuIGJpdG1hcCBjaHVuaywgc28gcGFnZXMgYWN0dWFsbHkgcmVtYWluDQo+
IGRpcnR5IC4uLikuICJicm9rZSIgaGVyZSBtZWFucyB0aGF0IHBhZ2VzIHN0aWxsIGdldCBtaWdy
YXRlZCBldmVuIHRob3VnaCB0aGV5DQo+IHdlcmUgcmVwb3J0ZWQgYnkgdGhlIGd1ZXN0LiBXZSdk
IGFjdHVhbGx5IG5vdCB3YW50IHRvIHVzZSBjbGVhbiBibWFwcyB3aXRoIGZyZWUNCj4gcGFnZSBo
aW50aW5nIC4uLiBsb25nIHN0b3J5IHNob3J0LCBmcmVlIHBhZ2UgaGludGluZyBpcyBhIHZlcnkg
ZnJhZ2lsZSBiZWFzdCBhbHJlYWR5DQo+IGFuZCBzb21lIG9mIHRoZSBoaW50cyBhcmUgYmFzaWNh
bGx5IGlnbm9yZWQgYW5kIHB1cmUgb3ZlcmhlYWQgLi4uDQoNCk5vdCByZWFsbHkuIEJvdGggY2xl
YXJfYm1hcCBhbmQgZnJlZSBwYWdlIGhpbnQgYXJlIHRvICJjbGVhciIgdGhlIGJpdG1hcC4NCk5v
IG1hdHRlciB3aG8gY29tZXMgZmlyc3QgdG8gY2xlYXIgaXQsIGl0IHdvbuKAmXQgY2F1c2UgbW9y
ZSAodW5leHBlY3RlZCkgcGFnZXMgdG8gYmUgc2VudC4NCg0KQmVzdCwNCldlaQ0K

