Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C23BF415
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 04:56:20 +0200 (CEST)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1KD5-00025n-Lb
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 22:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1KCM-0001QU-Pi
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:55:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:27351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m1KCK-0001LH-WD
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:55:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189810402"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189810402"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 19:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="491946756"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 07 Jul 2021 19:55:25 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 19:55:24 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 8 Jul 2021 10:55:23 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Thu, 8 Jul 2021 10:55:23 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XAgAAGCwCAABk7AIABVF1Q///EdQCAAc2LkIAFLrMAgAF4ojCAAAsMAIABHQ0w
Date: Thu, 8 Jul 2021 02:55:23 +0000
Message-ID: <8f6c3a0fdc624c41800314b6a786cd7f@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com> <YOSXGpEB323VWepM@t490s>
 <bf763c28d0254cafbdfb7f7485106ae3@intel.com> <YOXcUNG3CaR43yrV@t490s>
In-Reply-To: <YOXcUNG3CaR43yrV@t490s>
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
Received-SPF: pass client-ip=192.55.52.151; envelope-from=wei.w.wang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1cnNkYXksIEp1bHkgOCwgMjAyMSAxMjo1NSBBTSwgUGV0ZXIgWHUgd3JvdGU6DQo+IE9u
IFdlZCwgSnVsIDA3LCAyMDIxIGF0IDA4OjM0OjUwQU0gKzAwMDAsIFdhbmcsIFdlaSBXIHdyb3Rl
Og0KPiA+IE9uIFdlZG5lc2RheSwgSnVseSA3LCAyMDIxIDE6NDcgQU0sIFBldGVyIFh1IHdyb3Rl
Og0KPiA+ID4gT24gU2F0LCBKdWwgMDMsIDIwMjEgYXQgMDI6NTM6MjdBTSArMDAwMCwgV2FuZywg
V2VpIFcgd3JvdGU6DQo+ID4gPiA+ICsgICAgICAgZG8gew0KPiA+ID4gPiArICAgICAgICAgICAg
cGFnZV90b19jbGVhciA9IHN0YXJ0ICsgKGkrKyA8PA0KPiA+ID4gPiArIGJsb2NrLT5jbGVhcl9i
bWFwX3NoaWZ0KTsNCj4gPiA+DQo+ID4gPiBXaHkgImkiIG5lZWRzIHRvIGJlIHNoaWZ0ZWQ/DQo+
ID4NCj4gPiBKdXN0IG1vdmUgdG8gdGhlIG5leHQgY2xlYXIgY2h1bmssIG5vPw0KPiA+IEZvciBl
eGFtcGxlLCAoMSA8PCAxOCkgcGFnZXMgY2h1bmsgKGkuZS4gMUdCKS4NCj4gDQo+IEJ1dCBtaWdy
YXRpb25fY2xlYXJfbWVtb3J5X3JlZ2lvbl9kaXJ0eV9iaXRtYXAoKSBoYXMgZG9uZSB0aGUgc2hp
ZnRpbmc/DQo+IA0KDQpQbGVhc2Ugc2VlIHRoaXMgZXhhbXBsZTogc3RhcnQ9MCwgbnBhZ2VzID0g
MiAqICgxIDw8MTgpLCBpLmUuIHdlIGhhdmUgMiBjaHVua3Mgb2YgcGFnZXMgdG8gY2xlYXIsIGFu
ZCBzdGFydCBmcm9tIDAuDQpGaXJzdCBjaHVuazogZnJvbSAwIHRvICgxIDw8MTgpOw0KU2Vjb25k
IGNodW5rOiBmcm9tICgxIDw8IDE4KSB0byAyKigxPDwxOCkuDQoNClRvIGNsZWFyIHRoZSBzZWNv
bmQgY2h1bmssIHdlIG5lZWQgdG8gcGFzcyAoc3RhcnQgKyAiMSA8PCAxOCIpIHRvIG1pZ3JhdGlv
bl9jbGVhcl9tZW1vcnlfcmVnaW9uX2RpcnR5X2JpdG1hcCgpLA0KYW5kIGNsZWFyX2JtYXBfdGVz
dF9hbmRfY2xlYXIoKSB0aGVyZSB3aWxsIGRvICI+PjE4IiB0byB0cmFuc2Zvcm0gaXQgaW50byB0
aGUgaWQgb2YgY2xlYXJfYml0bWFwLCB3aGljaCBpcyAxLg0KDQpCZXN0LA0KV2VpDQogDQo=

