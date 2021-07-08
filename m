Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E33BF411
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 04:51:14 +0200 (CEST)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1K89-0007zP-Vr
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 22:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1K71-0006Xl-5z
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:50:03 -0400
Received: from mga07.intel.com ([134.134.136.100]:11656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1K6x-0007c4-TH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:50:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="273270205"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="273270205"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 19:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="498207672"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2021 19:49:54 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 19:49:53 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 8 Jul 2021 10:49:51 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Thu, 8 Jul 2021 10:49:51 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAAWbAwIAGyxGAgAEKbICAAHLHgIABKgLg
Date: Thu, 8 Jul 2021 02:49:51 +0000
Message-ID: <e392987d17f345969dd86be513b1702b@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com> <YOSaDzCd4ZmcRQHl@t490s>
 <2eb1ccd7105d4823898ea68a614d16f9@intel.com> <YOXZ1fzH+qXGJLs1@t490s>
In-Reply-To: <YOXZ1fzH+qXGJLs1@t490s>
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
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=wei.w.wang@intel.com; helo=mga07.intel.com
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

T24gVGh1cnNkYXksIEp1bHkgOCwgMjAyMSAxMjo0NCBBTSwgUGV0ZXIgWHUgd3JvdGU6DQo+ID4g
PiBOb3QgdG8gbWVudGlvbiB0aGUgaGFyZCBtaWdyYXRpb24gaXNzdWVzIGFyZSBtb3N0bHkgd2l0
aCBub24taWRsZQ0KPiA+ID4gZ3Vlc3QsIGluIHRoYXQgY2FzZSBoYXZpbmcgdGhlIGJhbGxvb24g
aW4gdGhlIGd1ZXN0IHdpbGwgYmUNCj4gPiA+IGRpc2FzdHJvdXMgZnJvbSB0aGlzIHBvdiBzaW5j
ZSBpdCdsbCBzdGFydCB0byB0YWtlIG11dGV4IGZvciBlYWNoDQo+ID4gPiBwYWdlLCB3aGlsZSBi
YWxsb29uIHdvdWxkIGhhcmRseSByZXBvcnQgYW55dGhpbmcgdmFsaWQgc2luY2UgbW9zdCBndWVz
dCBwYWdlcw0KPiBhcmUgYmVpbmcgdXNlZC4NCj4gPg0KPiA+IElmIG5vIHBhZ2VzIGFyZSByZXBv
cnRlZCwgbWlncmF0aW9uIHRocmVhZCB3b3VsZG4ndCB3YWl0IG9uIHRoZSBsb2NrIHRoZW4uDQo+
IA0KPiBZZXMgSSB0aGluayB0aGlzIGlzIHRoZSBwbGFjZSBJIGRpZG4ndCBtYWtlIG15c2VsZiBj
bGVhci4gIEl0J3Mgbm90IGFib3V0IHNsZWVwaW5nLCBpdCdzDQo+IGFib3V0IHRoZSBjbXB4Y2hn
IGJlaW5nIGV4cGVuc2l2ZSBhbHJlYWR5IHdoZW4gdGhlIHZtIGlzIGh1Z2UuDQoNCk9LLg0KSG93
IGRpZCB5b3Ugcm9vdCBjYXVzZSB0aGF0IGl0J3MgY2F1c2VkIGJ5IGNtcHhjaGcsIGluc3RlYWQg
b2YgbG9jayBjb250ZW50aW9uIChpLmUuIHN5c2NhbGwgYW5kIHNsZWVwKSBvcg0Kc29tZSBvdGhl
ciBjb2RlIGluc2lkZSBwdGhyZWFkX211dGV4X2xvY2soKS4gRG8geW91IGhhdmUgY3ljbGVzIGFi
b3V0IGNtcHhjaGcgdi5zLiBjeWNsZXMgb2YgcHRocmVhZF9tdXRleF9sb2NrKCk/DQoNCkkgY2hl
Y2sgdGhlIGltcGxlbWVudGF0aW9uIG9mIHB0aHJlYWRfbXV0ZXhfbG9jaygpLiBUaGUgY29kZSBw
YXRoIGZvciBsb2NrIGFjcXVpcmUgaXMgbG9uZy4gUWVtdVNwaW4gbG9va3MgbW9yZSBlZmZpY2ll
bnQuDQoocHJvYmFibHkgd2UgYWxzbyBkb27igJl0IHdhbnQgbWlncmF0aW9uIHRocmVhZCB0byBz
bGVlcCBpbiBhbnkgY2FzZSkNCg0KSSB0aGluayBpdCdzIGFsc28gYmV0dGVyIHRvIHNlZSB0aGUg
Y29tcGFyaXNvbiBvZiBtaWdyYXRpb24gdGhyb3VnaHB1dCBkYXRhIChpLmUuIHBhZ2VzIHBlciBz
ZWNvbmQpIGluIHRoZSBmb2xsb3dpbmcgY2FzZXMsIGJlZm9yZSB3ZSBtYWtlIGEgZGVjaXNpb246
DQotIHBlci1wYWdlIG11dGV4DQotIHBlci1wYWdlIHNwaW5sb2NrDQotIDUwLW1zIG11dGV4DQoN
CkJlc3QsDQpXZWkNCg0K

