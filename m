Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF33D2171
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:59:02 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6VTp-00019V-Nk
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m6VSH-0008HS-Qp
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:57:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:63089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m6VSE-0002GZ-GW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:57:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="233422257"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="233422257"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 02:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="662513916"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2021 02:57:15 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 22 Jul 2021 02:57:15 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 22 Jul 2021 17:57:13 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Thu, 22 Jul 2021 17:57:13 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Topic: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
Thread-Index: AQHXft3AV6w9M1ajBkq/WNe0GUK6y6tOOWGAgACGoSA=
Date: Thu, 22 Jul 2021 09:57:13 +0000
Message-ID: <b39f279ef6634325ab2be8d903e41001@intel.com>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
In-Reply-To: <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
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
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1cnNkYXksIEp1bHkgMjIsIDIwMjEgNTo0OCBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3Jv
dGU6DQo+IE9uIDIyLjA3LjIxIDEwOjMwLCBXZWkgV2FuZyB3cm90ZToNCj4gPiBXaGVuIHNraXBw
aW5nIGZyZWUgcGFnZXMgdG8gc2VuZCwgdGhlaXIgY29ycmVzcG9uZGluZyBkaXJ0eSBiaXRzIGlu
DQo+ID4gdGhlIG1lbW9yeSByZWdpb24gZGlydHkgYml0bWFwIG5lZWQgdG8gYmUgY2xlYXJlZC4g
T3RoZXJ3aXNlIHRoZQ0KPiA+IHNraXBwZWQgcGFnZXMgd2lsbCBiZSBzZW50IGluIHRoZSBuZXh0
IHJvdW5kIGFmdGVyIHRoZSBtaWdyYXRpb24NCj4gPiB0aHJlYWQgc3luY3MgZGlydHkgYml0cyBm
cm9tIHRoZSBtZW1vcnkgcmVnaW9uIGRpcnR5IGJpdG1hcC4NCj4gPg0KPiA+IENjOiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gPiBDYzogUGV0ZXIgWHUgPHBldGVyeEBy
ZWRoYXQuY29tPg0KPiA+IENjOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0K
PiA+IFJlcG9ydGVkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgV2FuZyA8d2VpLncud2FuZ0BpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gICBtaWdyYXRpb24vcmFtLmMgfCA3NA0KPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+ID4NCj4gDQo+IExHVE0sIHRoYW5rcw0KPiANCj4g
UmV2aWV3ZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPg0KPiANCg0K
VGhhbmtzLiBQbGVhc2UgcmVtZW1iZXIgdG8gaGF2ZSBhIHJlZ3Jlc3Npb24gdGVzdCB0b2dldGhl
ciB3aXRoIFBldGVyeCdzIHRoYXQgcGF0Y2ggd2hlbiB5b3UgZ2V0IGEgY2hhbmNlLg0KDQpCZXN0
LA0KV2VpDQo=

