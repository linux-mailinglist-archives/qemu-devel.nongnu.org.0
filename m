Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD052F0B07
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 03:26:56 +0100 (CET)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kymv1-0006eJ-6e
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 21:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kymuG-00069Z-69; Sun, 10 Jan 2021 21:26:08 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kymuC-0006Ph-FM; Sun, 10 Jan 2021 21:26:07 -0500
Received: from dggemi403-hub.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4DDcwB5C2Rz13g3n;
 Mon, 11 Jan 2021 10:24:10 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.51]) by
 dggemi403-hub.china.huawei.com ([10.3.17.136]) with mapi id 14.03.0509.000;
 Mon, 11 Jan 2021 10:25:40 +0800
From: ganqixin <ganqixin@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 0/7] Fix some memleaks caused by ptimer_init
Thread-Topic: [PATCH v2 0/7] Fix some memleaks caused by ptimer_init
Thread-Index: AQHW1GhbfX5OzV4bGkyve9Xidi/Fb6odN9iAgASetUA=
Date: Mon, 11 Jan 2021 02:25:39 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F49606625057@DGGEMI525-MBS.china.huawei.com>
References: <20201217113137.121607-1-ganqixin@huawei.com>
 <CAFEAcA9Z9VDTW5GSC=R_NYF_FOoKMXQcCy3U6pctmj0jg=0-Fg@mail.gmail.com>
In-Reply-To: <CAFEAcA9Z9VDTW5GSC=R_NYF_FOoKMXQcCy3U6pctmj0jg=0-Fg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=ganqixin@huawei.com;
 helo=szxga08-in.huawei.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgOCwg
MjAyMSA3OjQzIFBNDQo+IFRvOiBnYW5xaXhpbiA8Z2FucWl4aW5AaHVhd2VpLmNvbT4NCj4gQ2M6
IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgUUVNVSBUcml2aWFsDQo+
IDxxZW11LXRyaXZpYWxAbm9uZ251Lm9yZz47IEJlbmlhbWlubyBHYWx2YW5pIDxiLmdhbHZhbmlA
Z21haWwuY29tPjsNCj4gQW50b255IFBhdmxvdiA8YW50b255bnBhdmxvdkBnbWFpbC5jb20+OyBJ
Z29yIE1pdHN5YW5rbw0KPiA8aS5taXRzeWFua29AZ21haWwuY29tPjsgc3VuZGVlcCBzdWJiYXJh
eWEgPHN1bmRlZXAubGttbEBnbWFpbC5jb20+Ow0KPiBKYW4gS2lzemthIDxqYW4ua2lzemthQHdl
Yi5kZT47IENoZW5xdW4gKGt1aG4pDQo+IDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT47IFpoYW5n
aGFpbGlhbmcNCj4gPHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwLzddIEZpeCBzb21lIG1lbWxlYWtzIGNhdXNlZCBieSBwdGltZXJfaW5p
dA0KPiANCj4gT24gVGh1LCAxNyBEZWMgMjAyMCBhdCAxMTozMiwgR2FuIFFpeGluIDxnYW5xaXhp
bkBodWF3ZWkuY29tPiB3cm90ZToNCj4gPg0KPiA+IHYxLT52MjoNCj4gPiBDaGFuZ2VzIHN1Z2dl
c3RlZCBieSBQZXRlciBNYXlkZWxsOg0KPiA+ICAgICBEZWxldGUgdGhlIG1vZGlmaWNhdGlvbiBv
ZiB1bnJlbGF0ZWQgd2hpdGVzcGFjZS4NCj4gPg0KPiA+IEdhbiBRaXhpbiAoNyk6DQo+ID4gICBh
bGx3aW5uZXItYTEwLXBpdDogVXNlIHB0aW1lcl9mcmVlKCkgaW4gdGhlIGZpbmFsaXplIGZ1bmN0
aW9uIHRvIGF2b2lkDQo+ID4gICAgIG1lbWxlYWtzDQo+ID4gICBkaWdpYy10aW1lcjogVXNlIHB0
aW1lcl9mcmVlKCkgaW4gdGhlIGZpbmFsaXplIGZ1bmN0aW9uIHRvIGF2b2lkDQo+ID4gICAgIG1l
bWxlYWtzDQo+ID4gICBleHlub3M0MjEwX21jdDogVXNlIHB0aW1lcl9mcmVlKCkgaW4gdGhlIGZp
bmFsaXplIGZ1bmN0aW9uIHRvIGF2b2lkDQo+ID4gICAgIG1lbWxlYWtzDQo+ID4gICBleHlub3M0
MjEwX3B3bTogVXNlIHB0aW1lcl9mcmVlKCkgaW4gdGhlIGZpbmFsaXplIGZ1bmN0aW9uIHRvIGF2
b2lkDQo+ID4gICAgIG1lbWxlYWtzDQo+ID4gICBleHlub3M0MjEwX3J0YzogVXNlIHB0aW1lcl9m
cmVlKCkgaW4gdGhlIGZpbmFsaXplIGZ1bmN0aW9uIHRvIGF2b2lkDQo+ID4gICAgIG1lbWxlYWtz
DQo+ID4gICBtc3MtdGltZXI6IFVzZSBwdGltZXJfZnJlZSgpIGluIHRoZSBmaW5hbGl6ZSBmdW5j
dGlvbiB0byBhdm9pZA0KPiA+ICAgICBtZW1sZWFrcw0KPiA+ICAgbXVzaWNwYWw6IFVzZSBwdGlt
ZXJfZnJlZSgpIGluIHRoZSBmaW5hbGl6ZSBmdW5jdGlvbiB0byBhdm9pZA0KPiA+IG1lbWxlYWtz
DQo+IA0KPiBBcHBsaWVkIHRvIHRhcmdldC1hcm0ubmV4dCwgdGhhbmtzLg0KPiANCj4gUFM6IHNv
bWV0aGluZyBvZGQgaGFwcGVuZWQgd2l0aCB0aGUgdGhyZWFkaW5nIG9mIHRoaXMgc2VyaWVzIC0t
IHRoZSBwYXRjaA0KPiBlbWFpbHMgd2VyZW4ndCBmb2xsb3ctdXBzIHRvIHRoZSBjb3ZlciBsZXR0
ZXIgLS0gc28gdGhlIGF1dG9tYXRlZCB0b29scyBsaWtlDQo+IHBhdGNoZXcgZ290IGNvbmZ1c2Vk
IGFuZCB0aG91Z2h0IHRoZSBzZXJpZXMgd2FzIGVtcHR5Og0KPiBodHRwczovL3BhdGNoZXcub3Jn
L1FFTVUvMjAyMDEyMTcxMTMxMzcuMTIxNjA3LTEtZ2FucWl4aW5AaHVhd2VpLmNvDQo+IG0vDQo+
IA0KPiBZb3UgbWlnaHQgd2FudCB0byBsb29rIGludG8gZml4aW5nIHRoYXQgZm9yIG5leHQgdGlt
ZSB5b3Ugc2VuZCBhIHBhdGNoc2V0Lg0KPiANCg0KVGhhbmtzIGZvciB0ZWxsaW5nIG1lIHRoZSBl
cnJvciB0aGF0IG9jY3VycmVkIHdoZW4gcmVjZWl2aW5nIHRoaXMgcGF0Y2ggZW1haWwuIEkgd2ls
bCBmaXggaXQuDQo=

