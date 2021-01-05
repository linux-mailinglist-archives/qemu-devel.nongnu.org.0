Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706C52EA577
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 07:35:21 +0100 (CET)
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwfw8-0007V4-0w
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 01:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kwfqo-0004aw-6I
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 01:29:50 -0500
Received: from mga01.intel.com ([192.55.52.88]:62089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kwfqa-0000nv-Tb
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 01:29:49 -0500
IronPort-SDR: WYmgePuTLYv67tiF7WVTtNNqsBWr4jJNASX9ZaIeq8C8eUmoVvOo50h+lmnpUFPzhrWESIepog
 xyhEt3w5c5Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="195588575"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="195588575"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 22:29:31 -0800
IronPort-SDR: /M3c+uk3DrZuEZ4PihnZ1+yLJdWQ898Bk+tFpR6I7TY871pyQly8jpfJvyrk/pcWQ36iyMVZwo
 Hhx8uZpNXnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="343046148"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2021 22:29:31 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 4 Jan 2021 22:29:30 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 5 Jan 2021 14:29:28 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Tue, 5 Jan 2021 14:29:28 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Eric
 Blake" <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHW2ZH35CoUMePT00WBg9eX6s7M0aoG0rqAgATaJwD//+sqgIABz6iggAEepoCACeSQYP//jy6AgACjrAA=
Date: Tue, 5 Jan 2021 06:29:28 +0000
Message-ID: <4632d2fef5064a07bb2666e9ee4fc498@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
 <a4adb965911348f4901f72e7e472c07e@intel.com>
 <97d593c2-222d-a3cf-e797-8d77b8701bed@redhat.com>
 <704028b0dbf843ed9ae64b93ecd1db13@intel.com>
 <05999128-75c0-aeaf-255f-8c1ec7699eab@redhat.com>
 <666f41843baf4c84bbafa7f9fdfba96f@intel.com>
 <0456c436-40fc-f0e5-2d3b-af348bf5c446@redhat.com>
In-Reply-To: <0456c436-40fc-f0e5-2d3b-af348bf5c446@redhat.com>
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSA1LCAyMDIxIDEyOjE3
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8
cWVtdS0NCj4gZGV2ZWxAbm9uZ251Lm9yZz47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PjsgRHIuIERhdmlkIEFsYW4NCj4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IE1hcmt1
cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gQ2M6IFpoYW5nIENoZW4gPHpoYW5n
Y2tpZEBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBxYXBpL25ldDogQWRk
IG5ldyBRTVAgY29tbWFuZCBmb3IgQ09MTw0KPiBwYXNzdGhyb3VnaA0KPiANCj4gDQo+IE9uIDIw
MjEvMS81IOS4iuWNiDExOjI4LCBaaGFuZywgQ2hlbiB3cm90ZToNCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDMwLCAyMDIwIDExOjU3IEFN
DQo+ID4+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8
cWVtdS0NCj4gPj4gZGV2ZWxAbm9uZ251Lm9yZz47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQu
Y29tPjsgRHIuIERhdmlkIEFsYW4NCj4gPj4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47
IE1hcmt1cyBBcm1icnVzdGVyDQo+IDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gPj4gQ2M6IFpoYW5n
IENoZW4gPHpoYW5nY2tpZEBnbWFpbC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8z
XSBxYXBpL25ldDogQWRkIG5ldyBRTVAgY29tbWFuZCBmb3IgQ09MTw0KPiA+PiBwYXNzdGhyb3Vn
aA0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAyMDIwLzEyLzI5IOS4iuWNiDEwOjU2LCBaaGFuZywgQ2hl
biB3cm90ZToNCj4gPj4+PiBJIHRoaW5rIHdlIGNhbiBzdGFydCBmb3JtIENPTE8uIFRvIGF2b2lk
IFFNUCBjb21wYXRpYmlsaXR5IGlzc3VlcywNCj4gPj4+PiBJIHdvdWxkIGxpa2UgdG8gYWRkIHRo
ZSBuIHR1cGxlIGFuZCB3aWxkY2FyZCBzdXBwb3J0IG5vdy4NCj4gPj4+IE9LLCBJIHdpbGwgZG8g
dGhpcyBqb2IgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+Pj4gRm9yIHRoZSBRTVAgY29tcGF0aWJpbGl0
eSBpc3N1ZXMsIHBsZWFzZSBnaXZlIG1lIGEgZGVtbyBvZiB3aGF0IHdlDQo+ID4+PiB3YW50DQo+
ID4+IHRvIHNlZSwgTGlrZSBzb21lIGV4aXN0aW5nIGNvbW1hbmRzLg0KPiA+Pg0KPiA+Pg0KPiA+
PiBJIG1lYW50IGlmIHdlIHN0YXJ0IGZyb20gcG9ydCBhbmQgdGhlbiB3YW50IHRvIGFkZCBlLmcg
bi10dXBsZSBzdXBwb3J0Lg0KPiA+PiBEbyB3ZSBuZWVkIHRvIGludHJvZHVjZSBhbm90aGVyIGNv
bW1hbmQ/IE9yIGlzIHRoZXJlIGFueQ0KPiA+PiBpbnRyb3NwZWN0aW9uIHRoYXQgY2FuIGxldCBt
YW5hZ2VtZW50IGxheWVyIGtub3cgYWJvdXQgdGhpcz8NCj4gPiBPSywgSSB3aWxsIGFkZCB0aGUg
bi10dXBsZSBzdXBwb3J0Lg0KPiA+IEl0IGxvb2tzIGJhc2ljIGNvbW1hbmQgYXJlIGFkZC9kZWwg
Y29ubmVjdGlvbiwgRG8geW91IHRoaW5rIHNvbWV0aGluZw0KPiBuZWVkcyB0byBiZSBpbnRyb2R1
Y2VkPw0KPiANCj4gDQo+IEl0IGxvb2tzIHRvIG1lIGl0J3MgZmluZSB0byBzdGFydCB3aXRoIHRo
ZW0uDQo+IA0KPiANCj4gPiBGb3IgdGhlIG1hbmFnZW1lbnQgbGF5ZXIsIEkgZG9uJ3Qga25vdyB0
aGUgZGV0YWlsIHByb2Nlc3Mgb2YgaG93IHRvIGFkZA0KPiBuZXcgUWVtdSBjb21tYW5kIHN1cHBv
cnQgZm9yIGV4YW1wbGUgbGlidmlydC4NCj4gPiBNYXliZSBkZXBlbmQgb24gbGlidmlydCBjb21t
dW5pdHkncyBwbGFuPw0KPiANCj4gDQo+IFNvIGEgcXVlc3Rpb24gaGVyZSwgaG93IENPTE8gaXMg
YmVpbmcgdXNlZCBub3cuIElzIGl0IGV4cGVjdGVkIHRvIGJlDQo+IG1hbmFnZWQgYnkgbGlidmly
dCBvciBub3Q/DQoNClllcywgdGhleSB1c2UgbGlidmlydCB0byBtYW5hZ2UgQ09MTy4NCkN1cnJl
bnRseSwgQ2hpbmEgQ1NQIGludGVncmF0ZWQgQ09MTyBvbiBlZGdlIGNvbXB1dGluZyBwcm9kdWN0
LCB0aGV5IG5lZWQgY2hhbmdlIGEgc21hbGwgcGFydCBvZiB0aGUgY29kZSBvbiBsaWJ2aXJ0LA0K
TW9zdCBvZiBDT0xPIHBhcmFtZXRlciB1c2UgbGlidmlydCBieXBhc3MgbWVjaGFuaXNtIGRpcmVj
dCBpbnB1dCB0byBRZW11Lg0KRm9yIG91ciBzaWRlLCB3ZSBmb2N1cyBvbiBRZW11IENPTE8gY29k
ZS4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IFRoYW5rcw0KPiANCj4gDQo+ID4NCj4gPiBUaGFu
a3MNCj4gPiBDaGVuDQo+ID4NCj4gPj4gVGhhbmtzDQo+ID4+DQo+ID4+DQo+ID4+PiBUaGFua3MN
Cj4gPj4+IENoZW4NCj4gPj4+DQoNCg==

