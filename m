Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B3F3C7DCA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:04:29 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3X4N-0005Zj-U7
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3X3Q-0004tO-Dr
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:03:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:45973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3X3L-0003QN-RZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:03:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232095162"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232095162"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 22:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="654630192"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2021 22:03:17 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 13 Jul 2021 22:03:16 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 13:03:15 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Wed, 14 Jul 2021 13:03:14 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKtAp0+A//+YpQCAAb4H4A==
Date: Wed, 14 Jul 2021 05:03:14 +0000
Message-ID: <5a18bd59b3784d6d9e68435ab6afe6a8@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <9a8224c9a02b4d9395f6581b24deaa54@intel.com>
 <c12b6a4e-0802-6cfa-57b2-7c7f4e4f5241@redhat.com>
In-Reply-To: <c12b6a4e-0802-6cfa-57b2-7c7f4e4f5241@redhat.com>
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlc2RheSwgSnVseSAxMywgMjAyMSA2OjIyIFBNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90
ZToNCj4gQ2FuIHlvdSBzZW5kIGFuIG9mZmljaWFsIHBhdGNoIGZvciB0aGUgZnJlZSBwYWdlIGhp
bnRpbmcgY2xlYW5fYm1hcCBoYW5kbGluZyBJDQo+IHJlcG9ydGVkPw0KPiANCj4gSSBjYW4gdGhl
biBnaXZlIGJvdGggdGVzdHMgaW4gY29tYmluYXRpb24gYSBxdWljayB0ZXN0IChiZWZvcmUvYWZ0
ZXIgdGhpcyBwYXRjaA0KPiBoZXJlKS4NCj4gDQoNClllcywgSSdsbCBzZW5kLCB0aGFua3MhDQoN
CkJlc3QsDQpXZWkNCg==

