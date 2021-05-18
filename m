Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7B38743C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:43:23 +0200 (CEST)
Received: from localhost ([::1]:54380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livJy-0000fp-9C
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1livGS-00045h-9W; Tue, 18 May 2021 04:39:48 -0400
Received: from mga01.intel.com ([192.55.52.88]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1livGH-0004Ki-H0; Tue, 18 May 2021 04:39:42 -0400
IronPort-SDR: 3br4C7NpIjz0hua7mFRF5xXRwQjygR8psgAa+8lhpHSIjCRTkonZIEWK0KXzjwAe11Rfjt87yH
 ihViZSTWmxjA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="221709697"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="221709697"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:39:26 -0700
IronPort-SDR: aVFnIGHqgS/GD+G+7HmN2q2pWv10ZTluc4bPYGI99WQu0c2sJwBR38eQFWgyq4BBi5280G7LJ4
 +/rktzy+G8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="460641594"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2021 01:39:26 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 01:39:25 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 16:39:23 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Tue, 18 May 2021 16:39:23 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: RE: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Thread-Topic: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Thread-Index: AQHXRwRWTNVVdZiii0S5yDXEQzCtqaroS1KAgAASM4CAAJYJAA==
Date: Tue, 18 May 2021 08:39:23 +0000
Message-ID: <628ebb3df19e4898a8d407ad8e3671f4@intel.com>
References: <20210512074957.763711-1-chen.zhang@intel.com>
 <20210518083337.3308b069@gecko.fritz.box> <YKNvBWMyX/kNIPbt@merkur.fritz.box>
In-Reply-To: <YKNvBWMyX/kNIPbt@merkur.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block <qemu-block@nongnu.org>,
 qemu-dev <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Minghao Yuan <meeho@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2V2aW4gV29sZiA8a3dv
bGZAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDM6MzkgUE0NCj4g
VG86IEx1a2FzIFN0cmF1YiA8bHVrYXNzdHJhdWIyQHdlYi5kZT4NCj4gQ2M6IFpoYW5nLCBDaGVu
IDxjaGVuLnpoYW5nQGludGVsLmNvbT47IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+Ow0K
PiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBGYW0gWmhlbmcgPGZhbUBl
dXBob24ubmV0PjsNCj4gcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IHFlbXUtYmxv
Y2sgPHFlbXUtDQo+IGJsb2NrQG5vbmdudS5vcmc+OyBNaW5naGFvIFl1YW4gPG1lZWhvQHFxLmNv
bT47IFpoYW5nIENoZW4NCj4gPHpoYW5nY2tpZEBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UkZDIFBBVENIXSBibG9jay9pby5jOiBGbHVzaCBwYXJlbnQgZm9yIHF1b3J1bSBpbiBnZW5lcmlj
IGNvZGUNCj4gDQo+IEFtIDE4LjA1LjIwMjEgdW0gMDg6MzMgaGF0IEx1a2FzIFN0cmF1YiBnZXNj
aHJpZWJlbjoNCj4gPiBPbiBXZWQsIDEyIE1heSAyMDIxIDE1OjQ5OjU3ICswODAwDQo+ID4gWmhh
bmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiBGaXggdGhl
IGlzc3VlIGZyb20gdGhpcyBwYXRjaDoNCj4gPiA+IFtQQVRDSF0gYmxvY2s6IEZsdXNoIGFsbCBj
aGlsZHJlbiBpbiBnZW5lcmljIGNvZGUgRnJvbQ0KPiA+ID4gODgzODMzZTI5Y2I4MDBiNGQ5MmI1
ZDQ3MzYyNTJmNDAwNDg4NTE5MQ0KPiA+ID4NCj4gPiA+IFF1b3J1bSBkcml2ZXIgZG8gbm90IGhh
dmUgdGhlIHByaW1hcnkgY2hpbGQuDQo+ID4gPiBJdCB3aWxsIGNhdXNlZCBndWVzdCBibG9jayBm
bHVzaCBpc3N1ZSB3aGVuIHVzZSBxdW9ydW0gYW5kIE5CRC4NCj4gPiA+IFRoZSB2bSBndWVzdCBm
bHVzaGVzIGZhaWxlZO+8jGFuZCB0aGVuIGd1ZXN0IGZpbGVzeXN0ZW0gaXMgc2h1dGRvd24uDQo+
ID4NCj4gPiBIaSwNCj4gPiBJIHRoaW5rIHRoZSBwcm9ibGVtIGlzIHJhdGhlciB0aGF0IHRoZSBx
dW9ydW0gZHJpdmVyIHByb3ZpZGVzDQo+ID4gLmJkcnZfY29fZmx1c2hfdG9fZGlzayAod2hpY2gg
cHJlZGF0ZXMgLmJkcnZfY29fZmx1c2gpIGluc3RlYWQgb2YNCj4gPiAuYmRydl9jb19mbHVzaC4g
Q2FuIHlvdSB0cnkgd2l0aCB0aGUgZm9sbG93aW5nIHBhdGNoIGluc3RlYWQ/DQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvYmxvY2svcXVvcnVtLmMgYi9ibG9jay9xdW9ydW0uYyBpbmRleA0KPiA+IGNm
YzE0MzZhYmIuLmYyYzA4MDUwMDAgMTAwNjQ0DQo+ID4gLS0tIGEvYmxvY2svcXVvcnVtLmMNCj4g
PiArKysgYi9ibG9jay9xdW9ydW0uYw0KPiA+IEBAIC0xMjc5LDcgKzEyNzksNyBAQCBzdGF0aWMg
QmxvY2tEcml2ZXIgYmRydl9xdW9ydW0gPSB7DQo+ID4gICAgICAuYmRydl9kaXJuYW1lICAgICAg
ICAgICAgICAgICAgICAgICA9IHF1b3J1bV9kaXJuYW1lLA0KPiA+ICAgICAgLmJkcnZfY29fYmxv
Y2tfc3RhdHVzICAgICAgICAgICAgICAgPSBxdW9ydW1fY29fYmxvY2tfc3RhdHVzLA0KPiA+DQo+
ID4gLSAgICAuYmRydl9jb19mbHVzaF90b19kaXNrICAgICAgICAgICAgICA9IHF1b3J1bV9jb19m
bHVzaCwNCj4gPiArICAgIC5iZHJ2X2NvX2ZsdXNoICAgICAgICAgICAgICAgICAgICAgID0gcXVv
cnVtX2NvX2ZsdXNoLA0KPiA+DQo+ID4gICAgICAuYmRydl9nZXRsZW5ndGggICAgICAgICAgICAg
ICAgICAgICA9IHF1b3J1bV9nZXRsZW5ndGgsDQo+IA0KPiBUaGFua3MsIEx1a2FzLiBUaGlzIGlz
IGV4YWN0bHkgd2hhdCBJIHdhcyBnb2luZyB0byBzdWdnZXN0IGFmdGVyIGhhdmluZyBhIGxvb2sN
Cj4gYXQgdGhlIGNvZGUgbm93Lg0KPiANCj4gVGhlIHByb2JsZW0gaXMgbm90IHJlbGF0ZWQgdG8g
ZHJpdmVycyBub3QgaGF2aW5nIGEgcHJpbWFyeSBjaGlsZCBpbiBnZW5lcmFsDQo+ICh0aG91Z2gg
cXVvcnVtIG1pZ2h0IGJlIHRoZSBvbmx5IG9uZSBpbiB0aGlzIGNhdGVnb3J5IGF0IHRoZSBtb21l
bnQpLCBidXQNCj4gdGhhdCBxdW9ydW0gd2FudHMgdG8gb3ZlcnJpZGUgdGhlIGRlZmF1bHQgZXJy
b3IgaGFuZGxpbmcgc2VtYW50aWNzIHdpdGggaXRzDQo+IHZvdGluZyBtZWNoYW5pc20uDQoNClll
cywgeW91IGFyZSByaWdodC4gV2UgY2FuIGlnbm9yZSB0aGlzIHBhdGNoLg0KSSB0ZXN0ZWQgTHVr
YXMncyBwYXRjaCwgaXQgd29ya3MgZm9yIG1lLg0KSGkgTHVrYXMsIENhbiB5b3Ugc2VuZCB0aGlz
IHBhdGNoIHRvIHVwc3RyZWFtPw0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gS2V2aW4NCg==

