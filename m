Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5D3BF270
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 01:26:57 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1GwS-00087J-8S
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 19:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1Gvb-0007Ri-T0
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 19:26:03 -0400
Received: from mga05.intel.com ([192.55.52.43]:2463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1GvZ-0004rn-79
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 19:26:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="295046980"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="295046980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 16:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="564232372"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2021 16:25:52 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 16:25:52 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 8 Jul 2021 07:25:50 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Thu, 8 Jul 2021 07:25:50 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAABk7AIABVF1Q///EdQCAAc2LkIADV9oAgAHNrMD//4hLgIAAftgAgAHFNbD//73qAAAeogig
Date: Wed, 7 Jul 2021 23:25:50 +0000
Message-ID: <7f3e27272da9469281d8fa5820978e51@intel.com>
References: <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
 <a01758f98b3f46f282f0d6974862680d@intel.com>
 <f554501a-19d9-a22d-f399-5db4dbb81764@redhat.com> <YOSVZLwZzY/rZ0db@t490s>
 <b94e02b7e7bd4f2a8cbed73cb7756a68@intel.com> <YOXaIlPxHSlINjiz@t490s>
In-Reply-To: <YOXaIlPxHSlINjiz@t490s>
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
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1cnNkYXksIEp1bHkgOCwgMjAyMSAxMjo0NSBBTSwgUGV0ZXIgWHUgd3JvdGU6DQo+IE9u
IFdlZCwgSnVsIDA3LCAyMDIxIGF0IDEyOjQ1OjMyUE0gKzAwMDAsIFdhbmcsIFdlaSBXIHdyb3Rl
Og0KPiA+IEJ0dywgd2hhdCB3b3VsZCB5b3UgdGhpbmsgaWYgd2UgY2hhbmdlIG11dGV4IHRvIFFl
bXVTcGluPyBJdCB3aWxsIGFsc28gcmVkdWNlDQo+IHRoZSBvdmVyaGVhZCwgSSB0aGluay4NCj4g
DQo+IEFzIEkgcmVwbGllZCBhdCB0aGUgb3RoZXIgcGxhY2UsIHRoZSBib3R0bGVuZWNrIHdlIGVu
Y291bnRlcmVkIGlzIHRoZSBsb2NrIHRha2luZw0KPiBub3Qgc2xlZXBpbmcsIHNvIEknbSBhZnJh
aWQgc3BpbmxvY2sgd2lsbCBoYXZlIHRoZSBzYW1lIGlzc3VlLiBUaGFua3MsDQoNCkkgc3VzcGVj
dCB0aGUgb3ZlcmhlYWQgeW91IG9ic2VydmVkIG1pZ2h0IGJlIGNhdXNlZCBieSB0aGUgc3lzY2Fs
bHMgZm9yIG11dGV4LiBQZXItcGFnZSBzeXNjYWxsIG1pZ2h0IGJlIHRvbyBtdWNoLg0KSWYgcG9z
c2libGUsIHlvdSBjb3VsZCBoYXZlIGFub3RoZXIgdGVzdCBvZiB0aGUgM0dCIGd1ZXN0IG1pZ3Jh
dGlvbiB1c2luZyBRZW11U3Bpbi4NCg0KQmVzdCwNCldlaQ0KDQo=

