Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCD5956D5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:43:52 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNt71-0007K6-CZ
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1oNt2t-0003lN-8J; Tue, 16 Aug 2022 05:39:35 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1oNt2p-0005mJ-AB; Tue, 16 Aug 2022 05:39:34 -0400
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M6Qxy5SSxzkWNl;
 Tue, 16 Aug 2022 17:36:06 +0800 (CST)
Received: from dggpeml100022.china.huawei.com (7.185.36.176) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 16 Aug 2022 17:39:26 +0800
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggpeml100022.china.huawei.com (7.185.36.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 16 Aug 2022 17:39:26 +0800
Received: from kwepemm600016.china.huawei.com ([7.193.23.20]) by
 kwepemm600016.china.huawei.com ([7.193.23.20]) with mapi id 15.01.2375.024;
 Tue, 16 Aug 2022 17:39:25 +0800
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGFjcGlfZ2VkOiBBZGQgb3NwbV9zdGF0dXMgaG9v?=
 =?utf-8?Q?k_implementation?=
Thread-Topic: [PATCH] acpi_ged: Add ospm_status hook implementation
Thread-Index: AQHYsVJa+vqGTE7yt0qRXZ8lKONLy62wvNAAgACG/8A=
Date: Tue, 16 Aug 2022 09:39:25 +0000
Message-ID: <47f60df98b514502b422adee6b970880@huawei.com>
References: <20220816092624.15168-1-zhukeqian1@huawei.com>
 <CAFEAcA8UN=NABfNzzP-m5b3ki5mKH1qyfwgi6_yiT__6u_-1ng@mail.gmail.com>
In-Reply-To: <CAFEAcA8UN=NABfNzzP-m5b3ki5mKH1qyfwgi6_yiT__6u_-1ng@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.224]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhukeqian1@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  zhukeqian <zhukeqian1@huawei.com>
From:  zhukeqian via <qemu-devel@nongnu.org>

SGkgUGV0ZXIsDQoNClNldHVwIGFuIEFSTSB2aXJ0dWFsIG1hY2hpbmUgb2YgbWFjaGluZSB2aXJ0
IGFuZCBleGVjdXRlIHFtcCAicXVlcnktYWNwaS1vc3BtLXN0YXR1cyIgY2FuIHRyaWdnZXIgdGhp
cyBidWcuDQoNClRoYW5rcy4NCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBR
ZW11LWRldmVsIFttYWlsdG86cWVtdS1kZXZlbC1ib3VuY2VzK3podWtlcWlhbjE9aHVhd2VpLmNv
bUBub25nbnUub3JnXSDku6PooaggUGV0ZXIgTWF5ZGVsbA0K5Y+R6YCB5pe26Ze0OiAyMDIy5bm0
OOaciDE25pelIDE3OjMwDQrmlLbku7bkuro6IHpodWtlcWlhbiA8emh1a2VxaWFuMUBodWF3ZWku
Y29tPg0K5oqE6YCBOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtYXJtQG5vbmdudS5vcmc7
IHFlbXUtdHJpdmlhbEBub25nbnUub3JnOyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QHJlZGhhdC5jb20+OyBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+OyBQZXRlciBY
dSA8cGV0ZXJ4QHJlZGhhdC5jb20+OyBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29t
PjsgV2FuZ2hhaWJpbiAoRCkgPHdhbmdoYWliaW4ud2FuZ0BodWF3ZWkuY29tPg0K5Li76aKYOiBS
ZTogW1BBVENIXSBhY3BpX2dlZDogQWRkIG9zcG1fc3RhdHVzIGhvb2sgaW1wbGVtZW50YXRpb24N
Cg0KT24gVHVlLCAxNiBBdWcgMjAyMiBhdCAxMDoyNiwgS2VxaWFuIFpodSA8emh1a2VxaWFuMUBo
dWF3ZWkuY29tPiB3cm90ZToNCj4NCj4gVGhpcyBmaXhlcyBhIGJ1ZyB0aGF0IGNhdXNlcyBzZWdt
ZW50YXRpb24gZmF1bHQgd2l0aCBmb2xsb3dpbmcgZHVtcHN0YWNrOg0KPiAgIzEgIDB4MDAwMGFh
YWFhYjY0MjM1YyBpbiBxbXBfcXVlcnlfYWNwaV9vc3BtX3N0YXR1cyANCj4gKGVycnA9ZXJycEBl
bnRyeT0weGZmZmZmZmZmZjAzMCkgYXQgLi4vbW9uaXRvci9xbXAtY21kcy5jOjMxMg0KPiAgIzIg
IDB4MDAwMGFhYWFhYmZjNGUyMCBpbiBxbXBfbWFyc2hhbF9xdWVyeV9hY3BpX29zcG1fc3RhdHVz
IA0KPiAoYXJncz08b3B0aW1pemVkIG91dD4sIHJldD0weGZmZmZlYTRmZmU5MCwgZXJycD0weGZm
ZmZlYTRmZmU4OCkgYXQgDQo+IHFhcGkvcWFwaS1jb21tYW5kcy1hY3BpLmM6NjMNCj4gICMzICAw
eDAwMDBhYWFhYWJmZjhiYTAgaW4gZG9fcW1wX2Rpc3BhdGNoX2JoIChvcGFxdWU9MHhmZmZmZWE0
ZmZlOTgpIA0KPiBhdCAuLi9xYXBpL3FtcC1kaXNwYXRjaC5jOjEyOA0KPiAgIzQgIDB4MDAwMGFh
YWFhYzAyZTU5NCBpbiBhaW9fYmhfY2FsbCAoYmg9MHhmZmZmZTAwMDRkODApIGF0IA0KPiAuLi91
dGlsL2FzeW5jLmM6MTUwDQo+ICAjNSAgYWlvX2JoX3BvbGwgKGN0eD1jdHhAZW50cnk9MHhhYWFh
YWQwZjYwNDApIGF0IC4uL3V0aWwvYXN5bmMuYzoxNzgNCj4gICM2ICAweDAwMDBhYWFhYWMwMGJk
NDAgaW4gYWlvX2Rpc3BhdGNoIChjdHg9Y3R4QGVudHJ5PTB4YWFhYWFkMGY2MDQwKSANCj4gYXQg
Li4vdXRpbC9haW8tcG9zaXguYzo0MjENCj4gICM3ICAweDAwMDBhYWFhYWMwMmUwMTAgaW4gYWlv
X2N0eF9kaXNwYXRjaCAoc291cmNlPTB4YWFhYWFkMGY2MDQwLCANCj4gY2FsbGJhY2s9PG9wdGlt
aXplZCBvdXQ+LCB1c2VyX2RhdGE9PG9wdGltaXplZCBvdXQ+KSBhdCANCj4gLi4vdXRpbC9hc3lu
Yy5jOjMyMA0KPiAgIzggIDB4MDAwMGZmZmZmNzZmNjg4NCBpbiBnX21haW5fY29udGV4dF9kaXNw
YXRjaCAoKSBhdCANCj4gL3Vzci9saWI2NC9saWJnbGliLTIuMC5zby4wDQo+ICAjOSAgMHgwMDAw
YWFhYWFjMDQ1MmQ0IGluIGdsaWJfcG9sbGZkc19wb2xsICgpIGF0IA0KPiAuLi91dGlsL21haW4t
bG9vcC5jOjI5Nw0KPiAgIzEwIG9zX2hvc3RfbWFpbl9sb29wX3dhaXQgKHRpbWVvdXQ9MCkgYXQg
Li4vdXRpbC9tYWluLWxvb3AuYzozMjANCj4gICMxMSBtYWluX2xvb3Bfd2FpdCAobm9uYmxvY2tp
bmc9bm9uYmxvY2tpbmdAZW50cnk9MCkgYXQgDQo+IC4uL3V0aWwvbWFpbi1sb29wLmM6NTk2DQo+
ICAjMTIgMHgwMDAwYWFhYWFiNWM5ZTUwIGluIHFlbXVfbWFpbl9sb29wICgpIGF0IA0KPiAuLi9z
b2Z0bW11L3J1bnN0YXRlLmM6NzM0DQo+ICAjMTMgMHgwMDAwYWFhYWFiMTg1MzcwIGluIHFlbXVf
bWFpbiAoYXJnYz1hcmdjQGVudHJ5PTQ3LCANCj4gYXJndj1hcmd2QGVudHJ5PTB4ZmZmZmZmZmZm
NTE4LCBlbnZwPWVudnBAZW50cnk9MHgwKSBhdCANCj4gLi4vc29mdG1tdS9tYWluLmM6MzgNCj4g
ICMxNCAweDAwMDBhYWFhYWIxNmY5OWMgaW4gbWFpbiAoYXJnYz00NywgYXJndj0weGZmZmZmZmZm
ZjUxOCkgYXQgDQo+IC4uL3NvZnRtbXUvbWFpbi5jOjQ3DQoNCldoYXQgYXJlIHRoZSBjb25kaXRp
b25zIHJlcXVpcmVkIHRvIHRyaWdnZXIgdGhlIHNlZ2ZhdWx0Pw0KDQoNCj4gRml4ZXM6IGViYjYy
MDc1MDIxYSAoImh3L2FjcGk6IEFkZCBBQ1BJIEdlbmVyaWMgRXZlbnQgRGV2aWNlIFN1cHBvcnQi
KQ0KPiBTaWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+DQo+
IC0tLQ0KPiAgaHcvYWNwaS9nZW5lcmljX2V2ZW50X2RldmljZS5jIHwgOCArKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvaHcvYWNw
aS9nZW5lcmljX2V2ZW50X2RldmljZS5jIA0KPiBiL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZp
Y2UuYyBpbmRleCBlMjg0NTdhN2QxLi5hM2QzMTYzMWZlIDEwMDY0NA0KPiAtLS0gYS9ody9hY3Bp
L2dlbmVyaWNfZXZlbnRfZGV2aWNlLmMNCj4gKysrIGIvaHcvYWNwaS9nZW5lcmljX2V2ZW50X2Rl
dmljZS5jDQo+IEBAIC0yNjcsNiArMjY3LDEzIEBAIHN0YXRpYyB2b2lkIGFjcGlfZ2VkX3VucGx1
Z19jYihIb3RwbHVnSGFuZGxlciAqaG90cGx1Z19kZXYsDQo+ICAgICAgfQ0KPiAgfQ0KPg0KPiAr
c3RhdGljIHZvaWQgYWNwaV9nZWRfb3NwbV9zdGF0dXMoQWNwaURldmljZUlmICphZGV2LCBBQ1BJ
T1NUSW5mb0xpc3QgDQo+ICsqKipsaXN0KSB7DQo+ICsgICAgQWNwaUdlZFN0YXRlICpzID0gQUNQ
SV9HRUQoYWRldik7DQo+ICsNCj4gKyAgICBhY3BpX21lbW9yeV9vc3BtX3N0YXR1cygmcy0+bWVt
aHBfc3RhdGUsIGxpc3QpOyB9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGFjcGlfZ2VkX3NlbmRfZXZl
bnQoQWNwaURldmljZUlmICphZGV2LCANCj4gQWNwaUV2ZW50U3RhdHVzQml0cyBldikgIHsNCj4g
ICAgICBBY3BpR2VkU3RhdGUgKnMgPSBBQ1BJX0dFRChhZGV2KTsgQEAgLTQwOSw2ICs0MTYsNyBA
QCBzdGF0aWMgdm9pZCANCj4gYWNwaV9nZWRfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqY2xhc3Ms
IHZvaWQgKmRhdGEpDQo+ICAgICAgaGMtPnVucGx1Z19yZXF1ZXN0ID0gYWNwaV9nZWRfdW5wbHVn
X3JlcXVlc3RfY2I7DQo+ICAgICAgaGMtPnVucGx1ZyA9IGFjcGlfZ2VkX3VucGx1Z19jYjsNCj4N
Cj4gKyAgICBhZGV2Yy0+b3NwbV9zdGF0dXMgPSBhY3BpX2dlZF9vc3BtX3N0YXR1czsNCj4gICAg
ICBhZGV2Yy0+c2VuZF9ldmVudCA9IGFjcGlfZ2VkX3NlbmRfZXZlbnQ7ICB9DQo+DQo+IC0tDQoN
CnRoYW5rcw0KLS0gUE1NDQoNCg==

