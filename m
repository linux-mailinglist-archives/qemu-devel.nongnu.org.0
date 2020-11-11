Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D3F2AF306
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:05:34 +0100 (CET)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqkf-0006jV-Ho
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcqjE-0006Ag-GJ; Wed, 11 Nov 2020 09:04:04 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcqj8-0002GD-V7; Wed, 11 Nov 2020 09:04:04 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CWRK72NVPzVmgW;
 Wed, 11 Nov 2020 22:03:23 +0800 (CST)
Received: from DGGEMM422-HUB.china.huawei.com (10.1.198.39) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 11 Nov 2020 22:03:40 +0800
Received: from DGGEMM511-MBS.china.huawei.com ([169.254.2.226]) by
 dggemm422-hub.china.huawei.com ([169.254.138.104]) with mapi id
 14.03.0487.000; Wed, 11 Nov 2020 22:03:32 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH] hw/intc: fix heap-buffer-overflow in rxicu_realize()
Thread-Topic: [PATCH] hw/intc: fix heap-buffer-overflow in rxicu_realize()
Thread-Index: AQHWs0I9MjF5nCKDLkWY9Hw35VFGIqnBABMAgAGoIVA=
Date: Wed, 11 Nov 2020 14:03:31 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA5B152@dggemm511-mbs.china.huawei.com>
References: <20201105070626.2277696-1-kuhn.chenqun@huawei.com>
 <CAFEAcA_0=HHG8+p0j2W2j5hLUgGZ_aWfKMQkROLj0HGoU0D7eg@mail.gmail.com>
In-Reply-To: <CAFEAcA_0=HHG8+p0j2W2j5hLUgGZ_aWfKMQkROLj0HGoU0D7eg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 09:03:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ganqixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAx
MCwgMjAyMCAxMTozMCBQTQ0KPiBUbzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3
ZWkuY29tPg0KPiBDYzogUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBR
RU1VIFRyaXZpYWwNCj4gPHFlbXUtdHJpdmlhbEBub25nbnUub3JnPjsgWW9zaGlub3JpIFNhdG8g
PHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwPjsNCj4gWmhhbmdoYWlsaWFuZyA8emhhbmcuemhh
bmdoYWlsaWFuZ0BodWF3ZWkuY29tPjsgZ2FucWl4aW4NCj4gPGdhbnFpeGluQGh1YXdlaS5jb20+
OyBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gaHcvaW50YzogZml4IGhlYXAtYnVmZmVyLW92ZXJmbG93IGluIHJ4aWN1X3JlYWxpemUo
KQ0KPiANCj4gT24gVGh1LCA1IE5vdiAyMDIwIGF0IDA3OjA4LCBDaGVuIFF1biA8a3Vobi5jaGVu
cXVuQGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gV2hlbiAnaiA9IGljdS0+bnJfc2Vuc2Ug
4oCTIDEnLCB0aGUgJ2ogPCBpY3UtPm5yX3NlbnNlJyBjb25kaXRpb24gaXMNCj4gPiB0cnVlLCB0
aGVuICdqID0gaWN1LT5ucl9zZW5zZScsIHRoZSdpY3UtPmluaXRfc2Vuc2Vbal0nIGhhcyBvdXQt
b2YtYm91bmRzIGFjY2Vzcy4NCj4gDQo+IFllcywgdGhpcyBpcyBhIGJ1Zy4uLg0KPiANCj4gPiBN
YXliZSB0aGlzIGNvdWxkIGxlYWQgdG8gc29tZSBzZWN1cml0eSBwcm9ibGVtcy4NCj4gDQo+IC4u
LmJ1dCBpdCdzIG5vdCBhIHNlY3VyaXR5IGJ1ZywgYmVjYXVzZSB0aGlzIGRldmljZSBjYW4ndCBi
ZSB1c2VkIHdpdGggS1ZNLCBzbyBpdCdzDQo+IG5vdCBvbiB0aGUgUUVNVSBzZWN1cml0eSBib3Vu
ZGFyeS4NCj4gDQo+IA0KPiA+ICBody9pbnRjL3J4X2ljdS5jIHwgNiArKy0tLS0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9ody9pbnRjL3J4X2ljdS5jIGIvaHcvaW50Yy9yeF9pY3UuYyBpbmRleA0KPiA+
IDk0ZTE3YTlkZWEuLjY5MmE0Yzc4ZTAgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvaW50Yy9yeF9pY3Uu
Yw0KPiA+ICsrKyBiL2h3L2ludGMvcnhfaWN1LmMNCj4gPiBAQCAtMzA4LDExICszMDgsOSBAQCBz
dGF0aWMgdm9pZCByeGljdV9yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yDQo+ICoqZXJy
cCkNCj4gPiAgICAgICAgICByZXR1cm47DQo+ID4gICAgICB9DQo+ID4gICAgICBmb3IgKGkgPSBq
ID0gMDsgaSA8IE5SX0lSUVM7IGkrKykgew0KPiA+IC0gICAgICAgIGlmIChpY3UtPmluaXRfc2Vu
c2Vbal0gPT0gaSkgew0KPiA+ICsgICAgICAgIGlmIChqIDwgaWN1LT5ucl9zZW5zZSAmJiBpY3Ut
PmluaXRfc2Vuc2Vbal0gPT0gaSkgew0KPiA+ICAgICAgICAgICAgICBpY3UtPnNyY1tpXS5zZW5z
ZSA9IFRSR19MRVZFTDsNCj4gPiAtICAgICAgICAgICAgaWYgKGogPCBpY3UtPm5yX3NlbnNlKSB7
DQo+ID4gLSAgICAgICAgICAgICAgICBqKys7DQo+ID4gLSAgICAgICAgICAgIH0NCj4gPiArICAg
ICAgICAgICAgaisrOw0KPiA+ICAgICAgICAgIH0gZWxzZSB7DQo+ID4gICAgICAgICAgICAgIGlj
dS0+c3JjW2ldLnNlbnNlID0gVFJHX1BFREdFOw0KPiA+ICAgICAgICAgIH0NCj4gDQo+IFRoaXMg
d29ya3MsIHNvOg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRl
bGxAbGluYXJvLm9yZz4NCj4gDQo+IGJ1dCB0byBiZSBob25lc3QgSSB0aGluayB0aGlzIHdvdWxk
IGJlIG1vcmUgcmVhZGFibGU6DQo+IA0KPiAgICAgZm9yIChpID0gMDsgaSA8IE5SX0lSUVM7IGkr
Kykgew0KPiAgICAgICAgIGljZS0+c3JjW2ldLnNlbnNlID0gVFJHX1BFREdFOw0KPiAgICAgfQ0K
PiAgICAgZm9yIChpID0gMDsgaSA8IGljdS0+bnJfc2Vuc2U7IGkrKykgew0KPiAgICAgICAgIHVp
bnQ4X3QgaXJxbm8gPSBpY3UtPmluaXRfc2Vuc2VbaV07DQo+ICAgICAgICAgaWYgKGlycW5vIDwg
TlJfSVJRUykgew0KPiAgICAgICAgICAgICBpY3UtPnNyY1tpcnFub10uc2Vuc2UgPSBUUkdfTEVW
RUw7DQo+ICAgICAgICAgfQ0KPiAgICAgfQ0KPiANCkl0IGlzIGEgZ29vZCBwb2ludCEgIA0KSSB0
cmllZCB0byBtb2RpZnkgYW5kIGNvbXBpbGUgaXQsIGFuZCB0aGUgdGVzdCByZXN1bHRzIGFyZSBl
eGFjdGx5IHRoZSBzYW1lLg0KIA0KT25seSBHQ0M5IHJlcG9ydHMgYSB3YXJuaW5n77yaDQouLi9o
dy9pbnRjL3J4X2ljdS5jOiBJbiBmdW5jdGlvbiDigJhyeGljdV9yZWFsaXpl4oCZOg0KLi4vaHcv
aW50Yy9yeF9pY3UuYzozMTc6MTk6IHdhcm5pbmc6IGNvbXBhcmlzb24gaXMgYWx3YXlzIHRydWUg
ZHVlIHRvIGxpbWl0ZWQgcmFuZ2Ugb2YgZGF0YSB0eXBlIFstV3R5cGUtbGltaXRzXQ0KICAzMTcg
fCAgICAgICAgIGlmIChpcnFubyA8IE5SX0lSUVMpIHsNCiAgICAgfCAgICAgICAgICAgICAgICAg
ICBeDQoNClRoZSAnTlJfSVJRUyA9IDI1NicgLHRoZSAnIGlmIChpcnFubyA8IE5SX0lSUVMpJyBj
b25kaXRpb24gaXMgYWx3YXlzIHRydWUuIA0KU28sbWF5YmUgd2Ugc2hvdWxkIHJlbW92ZSB0aGlz
IGNvbmRpdGlvbi4gSSdsbCBtb2RpZnkgaXQgbGF0ZXIuDQoNClRoYW5rcywNCkNoZW4gUXVuDQo=

