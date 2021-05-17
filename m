Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F42383BD7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:03:14 +0200 (CEST)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihaD-0002IC-3W
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lihWy-0000h5-Ei; Mon, 17 May 2021 13:59:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:52321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lihWu-0006nw-3y; Mon, 17 May 2021 13:59:52 -0400
IronPort-SDR: frd+UpSCpnlYK6Df1Qbz4q3a5GGyg77wCC+H3sLndTRAv74f8W7a7mY2mwetVaDvyc1yrvyFV7
 DtOfmNBgdBYg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="264439752"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="264439752"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 10:59:41 -0700
IronPort-SDR: hm0BJ80/cQcEIViqhIVkNJ98ZAfnE48znb3ivKifruQ6YXZYAaQu4drUmjJ5p4iZMfs31F2JCC
 nQ1HVutzBeAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="541354400"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 17 May 2021 10:59:41 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 10:59:40 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 01:59:38 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Tue, 18 May 2021 01:59:38 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Thread-Topic: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Thread-Index: AQHXRwRWTNVVdZiii0S5yDXEQzCtqarg85QAgAb/hWA=
Date: Mon, 17 May 2021 17:59:38 +0000
Message-ID: <0ace87548ad04863ab080795069664d5@intel.com>
References: <20210512074957.763711-1-chen.zhang@intel.com>
 <YJ026q2oFkTckc8u@stefanha-x1.localdomain>
In-Reply-To: <YJ026q2oFkTckc8u@stefanha-x1.localdomain>
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
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block <qemu-block@nongnu.org>, qemu-dev <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Minghao Yuan <meeho@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDEzLCAyMDIxIDEw
OjI2IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBL
ZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPjsgTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNv
bT47IEZhbQ0KPiBaaGVuZyA8ZmFtQGV1cGhvbi5uZXQ+OyBxZW11LWRldiA8cWVtdS1kZXZlbEBu
b25nbnUub3JnPjsgcWVtdS0NCj4gYmxvY2sgPHFlbXUtYmxvY2tAbm9uZ251Lm9yZz47IFpoYW5n
IENoZW4gPHpoYW5nY2tpZEBnbWFpbC5jb20+Ow0KPiBNaW5naGFvIFl1YW4gPG1lZWhvQHFxLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0hdIGJsb2NrL2lvLmM6IEZsdXNoIHBhcmVudCBm
b3IgcXVvcnVtIGluIGdlbmVyaWMgY29kZQ0KPiANCj4gT24gV2VkLCBNYXkgMTIsIDIwMjEgYXQg
MDM6NDk6NTdQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90ZToNCj4gPiBGaXggdGhlIGlzc3VlIGZy
b20gdGhpcyBwYXRjaDoNCj4gPiBbUEFUQ0hdIGJsb2NrOiBGbHVzaCBhbGwgY2hpbGRyZW4gaW4g
Z2VuZXJpYyBjb2RlIEZyb20NCj4gPiA4ODM4MzNlMjljYjgwMGI0ZDkyYjVkNDczNjI1MmY0MDA0
ODg1MTkxDQo+ID4NCj4gPiBRdW9ydW0gZHJpdmVyIGRvIG5vdCBoYXZlIHRoZSBwcmltYXJ5IGNo
aWxkLg0KPiA+IEl0IHdpbGwgY2F1c2VkIGd1ZXN0IGJsb2NrIGZsdXNoIGlzc3VlIHdoZW4gdXNl
IHF1b3J1bSBhbmQgTkJELg0KPiA+IFRoZSB2bSBndWVzdCBmbHVzaGVzIGZhaWxlZO+8jGFuZCB0
aGVuIGd1ZXN0IGZpbGVzeXN0ZW0gaXMgc2h1dGRvd24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiBSZXBvcnRlZC1ieTogTWlu
Z2hhbyBZdWFuIDxtZWVob0BxcS5jb20+DQo+ID4gLS0tDQo+ID4gIGJsb2NrL2lvLmMgfCAzMSAr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiAuLi4NCj4gPiArZmx1c2hfZGF0YToNCj4g
PiArICAgIGlmIChub19wcmltYXJ5X2NoaWxkKSB7DQo+ID4gKyAgICAgICAgLyogRmx1c2ggcGFy
ZW50ICovDQo+ID4gKyAgICAgICAgcmV0ID0gYnMtPmZpbGUgPyBiZHJ2X2NvX2ZsdXNoKGJzLT5m
aWxlLT5icykgOiAwOw0KPiA+ICsgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAvKiBGbHVzaCBj
aGlsZHJlbnMgKi8NCj4gPiArICAgICAgICByZXQgPSAwOw0KPiA+ICsgICAgICAgIFFMSVNUX0ZP
UkVBQ0goY2hpbGQsICZicy0+Y2hpbGRyZW4sIG5leHQpIHsNCj4gPiArICAgICAgICAgICAgaWYg
KGNoaWxkLT5wZXJtICYgKEJMS19QRVJNX1dSSVRFIHwNCj4gQkxLX1BFUk1fV1JJVEVfVU5DSEFO
R0VEKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgaW50IHRoaXNfY2hpbGRfcmV0ID0gYmRydl9j
b19mbHVzaChjaGlsZC0+YnMpOw0KPiA+ICsgICAgICAgICAgICAgICAgaWYgKCFyZXQpIHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICByZXQgPSB0aGlzX2NoaWxkX3JldDsNCj4gPiArICAgICAg
ICAgICAgICAgIH0NCj4gPiAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgIH0NCj4gDQo+IEkn
bSBtaXNzaW5nIHNvbWV0aGluZzoNCj4gDQo+IFRoZSBxdW9ydW0gZHJpdmVyIGhhcyBhIHZhbGlk
IGJzLT5jaGlsZHJlbiBsaXN0IGV2ZW4gdGhvdWdoIGl0IGRvZXMgbm90IGhhdmUgYQ0KPiBwcmlt
YXJ5IGNoaWxkLiBXaHkgZG9lcyBRTElTVF9GT1JFQUNIKCkgbG9vcCBmYWlsIGZvciB5b3U/DQo+
IA0KDQpZZXMsIGluIG1vc3QgY2FzZXMgUUxJU1RfRk9SRUFDSCgpIHdvcmtzIGZvciBtZS4NCkJ1
dCBub3Qgd29yayB3aGVuIG9uZSBvZiB0aGUgY2hpbGQgZGlzY29ubmVjdGVkLCB0aGUgb3JpZ2lu
YWwgcGF0Y2ggY2hhbmdlZA0KdGhlIGRlZmF1bHQgYmVoYXZpb3Igb2YgcXVvcnVtIGRyaXZlciB3
aGVuIG9jY3VycyBpc3N1ZS4NCg0KRm9yIGV4YW1wbGU6DQpWTSBxdW9ydW0gZHJpdmVyIGhhdmUg
dHdvIGNoaWxkcmVuLCBsb2NhbCBkaXNrMSBhbmQgTkJEIGRpc2syLg0KV2hlbiBuZXR3b3JrIGRv
d24gYW5kIE5CRCBkaXNrMiBkaXNjb25uZWN0ZWQsIGN1cnJlbnQgY29kZSB3aWxsIHJlcG9ydCAN
CiJldmVudCI6ICJRVU9SVU1fUkVQT1JUX0JBRCIgInR5cGUiOiAiZmx1c2giLCAiZXJyb3IiOiAi
SW5wdXQvb3V0cHV0IGVycm9yIg0KQW5kDQoiZXZlbnQiOiAiQkxPQ0tfSU9fRVJST1IiICIjYmxv
Y2swMDgiLCAicmVhc29uIjogIklucHV0L291dHB1dCBlcnJvciINCg0KVGhlIGd1ZXN0IGV2ZW4g
Y2Fubm90IHJlYWQvd3JpdGUgdGhlIG5vcm1hbCBsb2NhbCBkaXNrMS4gVk0gSU8gd2lsbCBjcmFz
aGVkIGNhdXNlZCBieSBOREIgZGlzazIgaW5wdXQvb3V0cHV0IGVycm9yLg0KSSB0aGluayB3ZSBk
byBuZWVkIHJlcG9ydCB0aGUgZXZlbnQgYWJvdXQgd2UgbG9zZSBhIGNoaWxkKE5CRCBkaXNrMikg
YXQgdGhpcyB0aW1lLCBidXQgbm8gbmVlZCBjcmFzaCBhbGwgSU8gc3lzdGVtLg0KQmVjYXVzZSB3
ZSBjYW4gZml4IGl0IGJ5IHgtYmxvY2tkZXYtY2hhbmdlIGFuZCBkcml2ZV9hZGQvZHJpdmVfZGVs
IGZvciBuZXcgY2hpbGRyZW4uIA0KQmVmb3JlIHRoZSBvcmlnaW5hbCBwYXRjaCg4ODM4MzNlMiks
IFZNIHN0aWxsIGNhbiByZWFkL3dyaXRlIHRoZSBsb2NhbCBkaXNrMS4NCg0KVGhpcyBwYXRjaCBq
dXN0IHRoZSBSRkMgdmVyc2lvbiwgcGxlYXNlIGdpdmUgbWUgbW9yZSBjb21tZW50cyB0byBmaXgg
dGhpcyBpc3N1ZS4NCiANClRoYW5rcw0KQ2hlbg0KDQoNCj4gRG9lcyB0aGlzIHBhdGNoIGVmZmVj
dGl2ZWx5IHNraXAgYmRydl9jb19mbHVzaCgpIGNhbGxzIG9uIGFsbCBxdW9ydW0gY2hpbGRyZW4/
DQo+IFRoYXQgc2VlbXMgd3Jvbmcgc2luY2UgY2hpbGRyZW4gbmVlZCB0byBiZSBmbHVzaGVkIHNv
IHRoYXQgZGF0YSBpcyBwZXJzaXN0ZWQuDQo+IA0KDQpZZXMsIA0KDQo+IFN0ZWZhbg0K

