Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7AC4F1FBE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 01:03:24 +0200 (CEST)
Received: from localhost ([::1]:47078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbVjG-0006tx-Qn
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 19:03:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1nbVhq-0006Cy-8S
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 19:01:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:29420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1nbVhn-0008DA-Ig
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 19:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649113311; x=1680649311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zRANvZO2cCjZvz5SU3JNeX3vFtoPGz/X7t9nqkVgCz0=;
 b=eVLyhySD1TsB36p6A9hSLcE4fMR3rq7uFRdvNSfWjKjks/zBdJW1hh2H
 py3Gy56ZGbbIy9byJ0JFXKImnaWvTNmSnBO3EXUCfIvhB9jZWKZLjGrKy
 sfuKIz5DkMnOTNmvD90uhYEccMGIUKJGOT9VpHTOVodsQpIbDYpyYgIwS
 Xwz128iJtyqlwSzjnGhkQocKBYszhBafWUYJNe0r9EZT/5n8YdRLzqwYs
 oueJe17Kkd09Js4u0M2boKbX4O7tNmmf4cMXIbUHfteRZP1IF99A6Pgm+
 liUBBH5/76Y8/O5XWVOY4rE54R5sz5/FIk9wkZVsECULu6Aqgww3EYMnx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="321319866"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; d="scan'208";a="321319866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 16:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; d="scan'208";a="608204193"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 04 Apr 2022 16:01:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Apr 2022 16:01:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Apr 2022 16:01:43 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.027;
 Mon, 4 Apr 2022 16:01:43 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: RE: [PATCH v1] ui/gtk-egl: Check for a valid context before making
 EGL calls
Thread-Topic: [PATCH v1] ui/gtk-egl: Check for a valid context before making
 EGL calls
Thread-Index: AQHYMd0bfnG/Blf5/E2DD1/LaebBoay0ElGAgAAdayCAAzXlgIApJKrw
Date: Mon, 4 Apr 2022 23:01:43 +0000
Message-ID: <a356d95f0a30413fbf60c6f212ecfa6c@intel.com>
References: <20220307042108.296428-1-vivek.kasireddy@intel.com>
 <CAMxuvawcUYkjPt-iopJhJ8seO_3tJJGqkECqZfEPb3_7SSWpkg@mail.gmail.com>
 <8a19aa5fbfca434a9b1ddd57566e00ad@intel.com>
 <CAMxuvay_aj3roDHtbPBgwi=dxpA5u65bt-KL1Pk-qTpZKRirJg@mail.gmail.com>
In-Reply-To: <CAMxuvay_aj3roDHtbPBgwi=dxpA5u65bt-KL1Pk-qTpZKRirJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgTWFyYy1BbmRyZSwNCg0KPiANCj4gSGkNCj4gDQo+IE9uIE1vbiwgTWFyIDcsIDIwMjIgYXQg
MTA6MDAgUE0gS2FzaXJlZGR5LCBWaXZlaw0KPiA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBIaSBNYXJjLUFuZHJlLA0KPiA+DQo+ID4gPg0KPiA+ID4gSGkgVml2
ZWsNCj4gPiA+DQo+ID4gPiBPbiBNb24sIE1hciA3LCAyMDIyIGF0IDg6MzkgQU0gVml2ZWsgS2Fz
aXJlZGR5DQo+ID4gPiA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+
DQo+ID4gPiA+IFNpbmNlIG5vdCBhbGwgbGlzdGVuZXJzIChpLmUgVmlydHVhbENvbnNvbGVzKSBv
ZiBHTCBldmVudHMgaGF2ZQ0KPiA+ID4gPiBhIHZhbGlkIEVHTCBjb250ZXh0LCBtYWtlIHN1cmUg
dGhhdCB0aGVyZSBpcyBhIHZhbGlkIGNvbnRleHQNCj4gPiA+ID4gYmVmb3JlIG1ha2luZyBFR0wg
Y2FsbHMuDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBjcmFzaCBz
ZWVuIHdoaWxlIGxhdW5jaGluZyB0aGUgVk0gd2l0aA0KPiA+ID4gPiAiLWRldmljZSB2aXJ0aW8t
Z3B1LXBjaSxtYXhfb3V0cHV0cz0xLGJsb2I9dHJ1ZSAtZGlzcGxheSBndGssZ2w9b24iDQo+ID4g
PiA+DQo+ID4gPiA+IE5vIHByb3ZpZGVyIG9mIGVnbENyZWF0ZUltYWdlS0hSIGZvdW5kLiAgUmVx
dWlyZXMgb25lIG9mOg0KPiA+ID4gPiBFR0xfS0hSX2ltYWdlDQo+ID4gPiA+IEVHTF9LSFJfaW1h
Z2VfYmFzZQ0KPiA+ID4gPg0KPiA+ID4gPiBGaXhlczogN2NjNzEyZTk4NjJmZiAoInVpOiBkaXNw
YXRjaCBHTCBldmVudHMgdG8gYWxsIGxpc3RlbmVycyIpDQo+ID4gPg0KPiA+ID4gSSBhbSBub3Qg
YWJsZSB0byByZXByb2R1Y2Ugb24gY3VycmVudCBtYXN0ZXIuDQo+ID4gW0thc2lyZWRkeSwgVml2
ZWtdIEkgY2FuIHN0aWxsIHNlZSBpdCB3aXRoIGN1cnJlbnQgbWFzdGVyLiBJIHRoaW5rIHRoaXMg
aXNzdWUNCj4gPiBpcyBvbmx5IHNlZW4gd2hlbiBydW5uaW5nIFFlbXUgaW4gYW4gWG9yZyBiYXNl
ZCBIb3N0IGVudmlyb25tZW50IGFuZA0KPiA+IGNhbm5vdCBiZSByZXByb2R1Y2VkIGluIGEgV2F5
bGFuZCBiYXNlZCBlbnZpcm9ubWVudCAtLSBhcyBRZW11IFVJDQo+ID4gdXNlcyB0aGUgR0xBcmVh
IHdpZGdldCBpbiB0aGUgV2F5bGFuZCBjYXNlIHdoZXJlIHRoZSBFR0wgY29udGV4dA0KPiA+IGlz
IG1hbmFnZWQgYnkgR1RLLg0KPiA+DQo+ID4gPg0KPiA+ID4gSXNuJ3QgaXQgZml4ZWQgd2l0aCBj
b21taXQgYTlmYmNlNWU5ICgidWkvY29uc29sZTogZml4IGNyYXNoIHdoZW4NCj4gPiA+IHVzaW5n
IGdsIGNvbnRleHQgd2l0aCBub24tZ2wgbGlzdGVuZXJzIikgPw0KPiA+IFtLYXNpcmVkZHksIFZp
dmVrXSBObywgaXQgdW5mb3J0dW5hdGVseSBkb2VzIG5vdCBmaXggdGhlIGlzc3VlIEkgYW0gc2Vl
aW5nLiBJbg0KPiA+IG15IGNhc2UsIHRoZXJlIGFyZSB0aHJlZSBWaXJ0dWFsQ29uc29sZXMgY3Jl
YXRlZCAoInBhcmFsbGVsMCIsICJjb21wYXRtb25pdG9yMCIsDQo+ID4gInZpcnRpby1ncHUtcGNp
IikgYW5kIGFsbCB0aHJlZSBvZiB0aGVtIHNlZW0gdG8gaGF2ZSBhIHZhbGlkIGRweV9nbF9zY2Fu
b3V0X2RtYWJ1ZigpDQo+ID4gYnV0IG9ubHkgdmlydGlvLWdwdS1wY2kgaGFzIGEgdmFsaWQgRUdM
IGNvbnRleHQuDQo+ID4NCj4gPiA+DQo+ID4gPiBDb3VsZCB5b3UgYWxzbyBjaGVjayBhZnRlciAi
W1BBVENIIHYzIDAwLzEyXSBHTCAmIEQtQnVzIGRpc3BsYXkgcmVsYXRlZCBmaXhlcyIgPw0KPiA+
IFtLYXNpcmVkZHksIFZpdmVrXSBJIGNhbiBjaGVjayBidXQgSSBkb24ndCB0aGluayB0aGlzIGlz
c3VlIGNhbiBiZSBmaXhlZCBpbiB1aS9jb25zb2xlLmMNCj4gPiBhcyBhbGwgdGhyZWUgVmlydHVh
bENvbnNvbGVzIHBhc3MgdGhlIGNvbnNvbGVfaGFzX2dsKCkgY2hlY2sgYW5kIG9uZSBvZiB0aGUg
b25seSB0aGluZ3MNCj4gPiB0aGF0IGRpc3Rpbmd1aXNoZXMgdGhlbSBpcyB3aGV0aGVyIHRoZXkg
aGF2ZSBhIHZhbGlkIEVHTCBjb250ZXh0Lg0KPiA+DQo+IA0KPiBVbmRlciBYMTEsIEkgZ2V0IHRo
ZSBzYW1lIGVycm9yIG9uIHY2LjIuMCBhbmQgbWFzdGVyOg0KPiBxZW11LXN5c3RlbS14ODZfNjQg
IC1tIDRHIC1vYmplY3QNCj4gbWVtb3J5LWJhY2tlbmQtbWVtZmQsaWQ9bWVtLHNpemU9NEcsc2hh
cmU9b24gLW1hY2hpbmUNCj4gcTM1LGFjY2VsPWt2bSxtZW1vcnktYmFja2VuZD1tZW0gLWRldmlj
ZQ0KPiB2aXJ0aW8tZ3B1LXBjaSxtYXhfb3V0cHV0cz0xLGJsb2I9dHJ1ZSAtZGlzcGxheSBndGss
Z2w9b24gLWNkcm9tDQo+IHJhd2hpZGUuaXNvDQo+IE5vIHByb3ZpZGVyIG9mIGVnbENyZWF0ZUlt
YWdlS0hSIGZvdW5kLiAgUmVxdWlyZXMgb25lIG9mOg0KPiAgICAgRUdMX0tIUl9pbWFnZQ0KPiAg
ICAgRUdMX0tIUl9pbWFnZV9iYXNlDQo+IA0KPiBOb3RlIHRoYXQgd2l0aCB2aXJ0aW8tZ3B1LWds
LXBjaSBJIGdldDoNCj4gcWVtdS1zeXN0ZW0teDg2XzY0OiAuLi9zcmMvZGlzcGF0Y2hfY29tbW9u
LmM6ODY4Og0KPiBlcG94eV9nZXRfcHJvY19hZGRyZXNzOiBBc3NlcnRpb24gYDAgJiYgIkNvdWxk
bid0IGZpbmQgY3VycmVudCBHTFggb3INCj4gRUdMIGNvbnRleHQuXG4iJyBmYWlsZWQuDQpbS2Fz
aXJlZGR5LCBWaXZla10gSXQgbG9va3MgbGlrZSB0aGlzIHBhcnRpY3VsYXIgZXJyb3IgYW5kIHRo
ZSBvbmUgSSBzYXcgYXJlDQpib3RoIHJlc29sdmVkIGJ5IHRoaXMgY29tbWl0Og0KQXV0aG9yOiBB
a2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtpQGdtYWlsLmNvbT4NCkRhdGU6ICAgU2F0IE1hciAy
NiAwMToxMjoxNiAyMDIyICswOTAwDQoNCiAgICB1aS9jb25zb2xlOiBDaGVjayBjb25zb2xlIGJl
Zm9yZSBlbWl0dGluZyBHTCBldmVudA0KDQpPbiBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IG5vdGUs
IEkgYW0gd29uZGVyaW5nIGlmIHlvdSBoYXZlIGFueSBwbGFuIHRvDQpldmVudHVhbGx5IGludGVn
cmF0ZSB0aGUgUnVzdCBiYXNlZCBHdGs0IGNsaWVudCBpbnRvIFFlbXUgc291cmNlIHJlcG8/DQpP
ciwgaXMgaXQgZ29pbmcgdG8gc3RheSBvdXQtb2YtdHJlZSBldmVuIGFmdGVyIGl0IGlzIG5vIGxv
bmdlciBXSVA/DQoNClRoYW5rcywNClZpdmVrDQoNCg0K

