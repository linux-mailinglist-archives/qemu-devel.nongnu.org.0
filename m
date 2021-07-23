Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D93D3656
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:16:06 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qLl-00017Q-Rb
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m6qKY-0000HN-Gp
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:14:50 -0400
Received: from mga01.intel.com ([192.55.52.88]:44487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m6qKV-0005Kr-3u
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:14:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="233672699"
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="233672699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 01:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="663029841"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2021 01:14:43 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 23 Jul 2021 01:14:42 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 16:14:41 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Fri, 23 Jul 2021 16:14:40 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Topic: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Index: AQHXft3AV6w9M1ajBkq/WNe0GUK6y6tOOWGAgACGoSD//84eAIAAADoAgAAvgQCAAO0PAIAAiLJQ
Date: Fri, 23 Jul 2021 08:14:40 +0000
Message-ID: <30a4eb65544241719a55bc2a9e9e1605@intel.com>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com> <YPmF1BAHA059yYln@t490s>
 <ab4a5e1e-ed7f-5b4b-88e6-d4c56ed5a256@redhat.com> <YPmt3vrn5MfH6I13@t490s>
 <087670b0-d28c-7f3d-caf4-f37acf8f7d7e@redhat.com>
In-Reply-To: <087670b0-d28c-7f3d-caf4-f37acf8f7d7e@redhat.com>
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpZGF5LCBKdWx5IDIzLCAyMDIxIDM6NTAgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
Og0KPiANCj4gTWlncmF0aW9uIG9mIGEgOCBHaUIgVk0NCj4gKiB3aXRoaW4gdGhlIHNhbWUgaG9z
dA0KPiAqIGFmdGVyIExpbnV4IGlzIHVwIGFuZCBpZGxlDQo+ICogZnJlZSBwYWdlIGhpbnRpbmcg
ZW5hYmxlZA0KPiAqIGFmdGVyIGRpcnR5aW5nIG1vc3QgVk0gbWVtb3J5IHVzaW5nIG1lbWhvZw0K
DQpUaGFua3MgZm9yIHRoZSB0ZXN0cyENCg0KSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
dGVzdCB1c2luZyBpZGxlIGd1ZXN0cyAobm8gbWVtaG9nKS4NCldpdGggbWVtaG9nIGVhdGluZyBt
b3N0IG9mIHRoZSBndWVzdCBmcmVlIHBhZ2VzLCBpdCdzIGxpa2VseSBubyBvciB2ZXJ5IGZldyBm
cmVlIHBhZ2VzIGFyZSByZXBvcnRlZCBkdXJpbmcgdGhlIHRlc3QuDQoNCkJlc3QsDQpXZWkNCg==

