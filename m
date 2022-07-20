Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CF757B447
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:09:13 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6dk-000755-4U
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oE6bq-0005M7-8l
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:07:14 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oE6bm-0004DU-JK
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:07:13 -0400
Received: from canpemm100007.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Lnrtv0QsYzFq4r;
 Wed, 20 Jul 2022 18:05:59 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 canpemm100007.china.huawei.com (7.192.105.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Jul 2022 18:07:01 +0800
Received: from kwepemm600015.china.huawei.com ([7.193.23.52]) by
 kwepemm600015.china.huawei.com ([7.193.23.52]) with mapi id 15.01.2375.024;
 Wed, 20 Jul 2022 18:07:01 +0800
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, "Markus
 Armbruster" <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini
 <pbonzini@redhat.com>, "Wangxin (Alexander)" <wangxinxin.wang@huawei.com>
Subject: Re: [PATCH v2] chardev: avoid use-after-free when client disconnect
Thread-Topic: [PATCH v2] chardev: avoid use-after-free when client disconnect
Thread-Index: AdicIHJk60oS5GW3CEqZQiETUJXEiQ==
Date: Wed, 20 Jul 2022 10:07:01 +0000
Message-ID: <a8a5a7f0e5d748caa6649258cecc6491@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.172]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=hogan.wang@huawei.com; helo=szxga03-in.huawei.com
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
Reply-to:  "Wangjing(Hogan)" <hogan.wang@huawei.com>
From:  "Wangjing(Hogan)" via <qemu-devel@nongnu.org>

PiBPbiBXZWQsIEp1bCAyMCwgMjAyMiBhdCAwODo1NTo0NkFNICswMDAwLCBXYW5namluZyhIb2dh
bikgd3JvdGU6DQo+ID4gDQo+ID4gPiBPbiBXZWQsIEp1bCAyMCwgMjAyMiBhdCAxMTozNjowN0FN
ICswNDAwLCBNYXJjLUFuZHLDqSBMdXJlYXUgd3JvdGU6DQo+ID4gPiA+IEhpDQo+ID4gPiA+IA0K
PiA+ID4gPiBPbiBXZWQsIEp1bCAyMCwgMjAyMiBhdCAxMToxMyBBTSBIb2dhbiBXYW5nIHZpYSAN
Cj4gPiA+ID4gPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+
IA0KPiA+ID4gPiA+IElPV2F0Y2hQb2xsIG9iamVjdCBkaWQgbm90IGhvbGQgdGhlIEBpb2MgYW5k
IEBzcmMgb2JqZWN0cyANCj4gPiA+ID4gPiByZWZlcmVuY2UsIHRoZW4gaW9fd2F0Y2hfcG9sbF9w
cmVwYXJlIGV4ZWN1dGUgaW4gSU8gdGhyZWFkLCBpZiANCj4gPiA+ID4gPiBJT1dhdGNoUG9sbCBy
ZW1vdmVkIGJ5IG1haW4gdGhyZWFkLCB0aGVuIGlvX3dhdGNoX3BvbGxfcHJlcGFyZSANCj4gPiA+
ID4gPiBhY2Nlc3MgQGlvYyBvciBAc3JjIGNvbmN1cnJlbnRseSBsZWFkIHRvIGNvcmVkdW1wLg0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gSW4gSU8gdGhyZWFkIG1vbml0b3Igc2NlbmUsIHRoZSBJTyB0
aHJlYWQgdXNlZCB0byBhY2NlcHQgY2xpZW50LCANCj4gPiA+ID4gPiByZWNlaXZlIHFtcCByZXF1
ZXN0IGFuZCBoYW5kbGUgaHVuZy11cCBldmVudC4gTWFpbiB0aHJlYWQgdXNlZCANCj4gPiA+ID4g
PiB0byBoYW5kbGUgcW1wIHJlcXVlc3QgYW5kIHNlbmQgcmVzcG9uc2UsIGl0IHdpbGwgcmVtb3Zl
IA0KPiA+ID4gPiA+IElPV2F0Y2hQb2xsIGFuZCBmcmVlIEBpb2Mgd2hlbiBzZW5kIHJlc3BvbnNl
IGZhaWwsIHRoZW4gY2F1c2UgDQo+ID4gPiA+ID4gdXNlLWFmdGVyLWZyZWUNCj4gPiA+ID4gPg0K
PiA+ID4gPiANCj4gPiA+ID4gSSB3b25kZXIgaWYgd2UgYXJlIG1pc3VzaW5nIEdTb3VyY2VzIGlu
IHRoYXQgY2FzZSwgYnkgcmVtb3ZpbmcgDQo+ID4gPiA+IHNvdXJjZXMgZnJvbSBkaWZmZXJlbnQg
dGhyZWFkcy4uIENvdWxkIHlvdSBiZSBtb3JlIHNwZWNpZmljIGFib3V0IA0KPiA+ID4gPiB0aGUg
Y29kZSBwYXRoIHRoYXQgbGVhZHMgdG8gdGhhdD8NCj4gPiA+IA0KPiA+ID4gSXQgaXMgcGVybWl0
dGVkLCBidXQgdW5mb3J0dW5hdGVseSBldmVyeSB2ZXJzaW9uIG9mIGdsaWIgcHJpb3IgdG8gMi42
NCBoYXMgYSByYWNlIGNvbmRpdGlvbiB0aGF0IG1lYW5zIHlvdSdsbCBwZXJpb2RpY2FsbHkgZ2V0
IGEgdXNlLWFmdGVyLWZyZWUgYW5kIGEgY3Jhc2g6DQo+ID4gPiANCj4gPiA+ICAgaHR0cHM6Ly9n
aXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9tZXJnZV9yZXF1ZXN0cy8xMzU4DQo+ID4gPiAN
Cj4gPiA+IExpYnZpcnQgd29ya2VkIGFyb3VuZCB0aGlzIHByb2JsZW0gYnkgbm90IGNhbGxpbmcg
J2dfc291cmNlX3VucmVmJw0KPiA+ID4gZGlyZWN0bHksIGJ1dCBpbnN0ZWFkIGhhdmUgYSBoZWxw
ZXIgdGhhdCB1c2VzIGdfaWRsZV9hZGQgdG8gZGVsYXkgdGhlIHVucmVmIHN1Y2ggdGhhdCBpdHMg
Z3VhcmFudGVlZCB0byBoYXBwZW4gaW5zaWRlIHRoZSBtYWluIGV2ZW50IGxvb3AgdGhyZWFkLg0K
PiA+ID4gDQo+ID4gPiBTbyBJJ2QgbGlrZSB0byBrbm93IHdoYXQgdmVyc2lvbiBvZiBnbGliIEhv
Z2FuIGlzIHVzaW5nDQo+ID4gDQo+ID4gSSBhbSB1c2luZyBnbGliMi0yLjYyLjUgaW4gdGVzdCBl
bnZpcm9ubWVudCwgc28gaXQncyBsb29rcyBsaWtlIGEgZ2xpYjIga25vd24gaXNzdWUuDQo+IA0K
PiBIbW0sIGFjdHVhbGx5IHRoZSBmaXggc2hvdWxkIGhhdmUgYmVlbiBiYWNrcG9ydGVkIGludG8g
dGhlIDIuNjIuNSByZWxlYXNlIGFjY29yZGluZyB0byB0aGlzDQo+IA0KPiAgIGh0dHBzOi8vZ2l0
bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vbWVyZ2VfcmVxdWVzdHMvMTM2MQ0KDQpBY2NvcmRp
bmcgdG8gdGhlIGN1cnJlbnQgc291cmNlIGNvZGU6DQpDbGllbnQgY29ubmVjdCB0byB0aGUgbW9u
aXRvciBzZXJ2ZXIsIGNoci0+Z3NvdXJjZShJT1dhdGNoUG9sbCkgd2lsbCBiZSBpbml0aWFsaXpl
ZCBieSBpb19hZGRfd2F0Y2hfcG9sbC4NCg0KQWNjb3JkaW5nIHRvIGlvX3dhdGNoX3BvbGxfcHJl
cGFyZShFeGVjdXRlIGluIElPIFRocmVhZCkgZnVuY3Rpb246DQpJT1dhdGNoUG9sbC0+c3JjIHdp
bGwgYmUgYWRkZWQgdG8gY2hyLT5nc291cmNlIGFzIGEgY2hpbGQgc291cmNlIHdoaWxlIHRoZSBj
aGFubmVsIHJlYWRhYmxlLCBidXQgSU9XYXRjaFBvbGwgbm90IGhvbGQgdGhlIGNoaWxkIHNvdXJj
ZSdzIHJlZmVyZW5jZSBiZWNhdXNlIG9mIGdfc291cmNlX3VucmVmKGl3cC0+c3JjKSwgc28gbGVm
dCB0aGUgb25seSBvbmUgcmVmZXJlbmNlIGhvbGQgYnkgdGhlIGNoaWxkIHNvdXJjZSBsaXN0Lg0K
DQpJZiBjbGllbnQgZGlzY29ubmVjdCx0aGVuIG1haW4gdGhyZWFkIHdpbGwgZGVzdHJveSB0aGUg
SU9XYXRjaFBvbGwgYW5kIHVucmVmIGFsbCB0aGUgY2hpbGQgc291cmNlIGJ5IGdfc291cmNlX2Rl
c3Ryb3kuDQpDYWxsIHRyYWNlOg0KdGNwX2Nocl9yZWFkDQogICAgdGNwX2Nocl9kaXNjb25uZWN0
DQogICAgICAgIHRjcF9jaHJfZGlzY29ubmVjdF9sb2NrZWQNCiAgICAgICAgICAgIHRjcF9jaHJf
ZnJlZV9jb25uZWN0aW9uDQogICAgICAgICAgICAgICAgcmVtb3ZlX2ZkX2luX3dhdGNoDQogICAg
ICAgICAgICAgICAgICAgIGdfc291cmNlX2Rlc3Ryb3koY2hyLT5nc291cmNlKSAvKiB1bnJlZiBh
bGwgdGhlIGNoaWxkIHNvdXJjZSAqLw0KICAgICAgICAgICAgICAgIG9iamVjdF91bnJlZihPQkpF
Q1Qocy0+aW9jKSk7ICAgICAgLyogUUlPQ2hhbm5lbCBmcmVlZCBhbmQgSU9XYXRjaFBvbGwtPmlv
YyBpcyBhIHdpbGQgcG9pbnRlciAqLw0KICAgICAgICAgICAgICAgIHMtPmlvYyA9IE5VTEw7DQoN
CkF0IHRoaXMgdGltZSwgSU9XYXRjaFBvbGwtPnNyYyBhbmQgSU9XYXRjaFBvbGwtPmlvYyBmcmVl
ZCwgaW9fd2F0Y2hfcG9sbF9wcmVwYXJlIGNhbGxlZCBmcmVxdWVudGx5IGFuZCBsb3ctcHJvYmFi
aWxpdHkgdXNlLWFmdGVyLWZyZWUuDQo=

