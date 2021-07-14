Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947CE3C868B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:01:39 +0200 (CEST)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gOI-0006ID-K1
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3gLZ-0004sV-Px
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:58:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:62469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3gLV-0005qe-MG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:58:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="274191092"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="274191092"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 07:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="494479165"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2021 07:58:33 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 07:58:33 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 22:58:31 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Wed, 14 Jul 2021 22:58:31 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v1] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Topic: [PATCH v1] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Index: AQHXeI7MOHvUULv3OEiNrwnLSYnZ+atBvpAAgAAApoCAAM+DIA==
Date: Wed, 14 Jul 2021 14:58:31 +0000
Message-ID: <64973ae51976490b864ded3ff628058c@intel.com>
References: <20210714075104.397484-1-wei.w.wang@intel.com>
 <20210714062715-mutt-send-email-mst@kernel.org>
 <25a2203f-fe82-41a6-ab40-2e4b5522fa14@redhat.com>
In-Reply-To: <25a2203f-fe82-41a6-ab40-2e4b5522fa14@redhat.com>
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
Cc: "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gV2VkbmVzZGF5LCBKdWx5IDE0LCAyMDIxIDY6MzAgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdy
b3RlOg0KPiANCj4gT24gMTQuMDcuMjEgMTI6MjcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToN
Cj4gPiBPbiBXZWQsIEp1bCAxNCwgMjAyMSBhdCAwMzo1MTowNEFNIC0wNDAwLCBXZWkgV2FuZyB3
cm90ZToNCj4gPj4gV2hlbiBza2lwcGluZyBmcmVlIHBhZ2VzLCB0aGVpciBjb3JyZXNwb25kaW5n
IGRpcnR5IGJpdHMgaW4gdGhlDQo+ID4+IG1lbW9yeSByZWdpb24gZGlydHkgYml0bWFwIG5lZWQg
dG8gYmUgY2xlYXJlZC4gT3RoZXJ3aXNlIHRoZSBza2lwcGVkDQo+ID4+IHBhZ2VzIHdpbGwgYmUg
c2VudCBpbiB0aGUgbmV4dCByb3VuZCBhZnRlciB0aGUgbWlncmF0aW9uIHRocmVhZCBzeW5jcw0K
PiA+PiBkaXJ0eSBiaXRzIGZyb20gdGhlIG1lbW9yeSByZWdpb24gZGlydHkgYml0bWFwLg0KPiA+
Pg0KPiA+PiBtaWdyYXRpb25fY2xlYXJfbWVtb3J5X3JlZ2lvbl9kaXJ0eV9iaXRtYXBfcmFuZ2Ug
aXMgcHV0IG91dHNpZGUgdGhlDQo+ID4+IGJpdG1hcF9tdXRleCwgYmVjYXN1ZQ0KPiA+DQo+ID4g
YmVjYXVzZT8NCj4gPg0KPiA+PiBtZW1vcnlfcmVnaW9uX2NsZWFyX2RpcnR5X2JpdG1hcCBpcyBw
b3NzaWJsZSB0byBibG9jayBvbiB0aGUga3ZtIHNsb3QNCj4gPj4gbXV0ZXggKGRvbid0IHdhbnQg
aG9sZGluZyBiaXRtYXBfbXV0ZXggd2hpbGUgYmxvY2tlZCBvbiBhbm90aGVyDQo+ID4+IG11dGV4
KSwgYW5kIGNsZWFyX2JtYXBfdGVzdF9hbmRfY2xlYXIgdXNlcyBhdG9taWMgb3BlcmF0aW9uLg0K
PiANCj4gSG93IGlzIHRoYXQgZGlmZmVyZW50IGZyb20gb3VyIGV4aXN0aW5nIGNhbGxlcj8NCj4g
DQo+IFBsZWFzZSBlaXRoZXIgY2xlYW4gZXZlcnl0aGluZyB1cCwgY29tcGxldGVseSBhdm9pZGlu
ZyB0aGUgbG9jayAoc2VwYXJhdGUNCj4gcGF0Y2gpLCBvciBtb3ZlIGl0IHVuZGVyIHRoZSBsb2Nr
Lg0KPiANCj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZyBpbXBvcnRhbnQ/DQoNClRoYXQgc2Vl
bXMgb2sgdG8gbWUgYW5kIFBldGVyIHRvIGhhdmUgaXQgb3V0c2lkZSB0aGUgbG9jay4gTm90IHN1
cmUgaWYgRGF2ZSBvciBKdWFuIGtub3dzIHRoZSByZWFzb24gd2h5IGNsZWFyX2JtYXAgbmVlZHMg
dG8gYmUgdW5kZXIgdGhlIG11dGV4IGdpdmVuIHRoYXQgaXQgaXMgYXRvbWljIG9wZXJhdGlvbi4N
Cg0KQmVzdCwNCldlaQ0K

