Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1115757B352
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:57:31 +0200 (CEST)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5WM-0005P0-0l
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oE5Uv-0003Vz-JI
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:56:01 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oE5Us-0008Vl-OJ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:56:01 -0400
Received: from canpemm500006.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LnqGl0PKZz1M8DC;
 Wed, 20 Jul 2022 16:53:03 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 canpemm500006.china.huawei.com (7.192.105.130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Jul 2022 16:55:46 +0800
Received: from kwepemm600015.china.huawei.com ([7.193.23.52]) by
 kwepemm600015.china.huawei.com ([7.193.23.52]) with mapi id 15.01.2375.024;
 Wed, 20 Jul 2022 16:55:46 +0800
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
CC: Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Wangxin (Alexander)"
 <wangxinxin.wang@huawei.com>
Subject: Re: [PATCH v2] chardev: avoid use-after-free when client disconnect
Thread-Topic: [PATCH v2] chardev: avoid use-after-free when client disconnect
Thread-Index: AdicFn4p60oS5GW3CEqZQiETUJXEiQ==
Date: Wed, 20 Jul 2022 08:55:46 +0000
Message-ID: <30274fbaea9d437baff2d703a203f9a8@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.172]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=hogan.wang@huawei.com; helo=szxga08-in.huawei.com
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

DQo+IE9uIFdlZCwgSnVsIDIwLCAyMDIyIGF0IDExOjM2OjA3QU0gKzA0MDAsIE1hcmMtQW5kcsOp
IEx1cmVhdSB3cm90ZToNCj4gPiBIaQ0KPiA+IA0KPiA+IE9uIFdlZCwgSnVsIDIwLCAyMDIyIGF0
IDExOjEzIEFNIEhvZ2FuIFdhbmcgdmlhIA0KPiA+IDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+
ID4gd3JvdGU6DQo+ID4gDQo+ID4gPiBJT1dhdGNoUG9sbCBvYmplY3QgZGlkIG5vdCBob2xkIHRo
ZSBAaW9jIGFuZCBAc3JjIG9iamVjdHMgcmVmZXJlbmNlLCANCj4gPiA+IHRoZW4gaW9fd2F0Y2hf
cG9sbF9wcmVwYXJlIGV4ZWN1dGUgaW4gSU8gdGhyZWFkLCBpZiBJT1dhdGNoUG9sbCANCj4gPiA+
IHJlbW92ZWQgYnkgbWlhbiB0aHJlYWQsIHRoZW4gaW9fd2F0Y2hfcG9sbF9wcmVwYXJlIGFjY2Vz
cyBAaW9jIG9yDQo+ID4gPg0KPiA+IA0KPiA+IG1pYW4tPm1haW4NCj4gPiANCj4gPiANCj4gPiA+
IEBzcmMgY29uY3VycmVudGx5IGxlYWQgdG8gY29yZWR1bXAuDQo+ID4gPg0KPiA+ID4gSW4gSU8g
dGhyZWFkIG1vbml0b3Igc2NlbmUsIHRoZSBJTyB0aHJlYWQgdXNlZCB0byBhY2NlcHQgY2xpZW50
LCANCj4gPiA+IHJlY2VpdmUgcW1wIHJlcXVlc3QgYW5kIGhhbmRsZSBodW5nLXVwIGV2ZW50LiBN
YWluIHRocmVhZCB1c2VkIHRvIA0KPiA+ID4gaGFuZGxlIHFtcCByZXF1ZXN0IGFuZCBzZW5kIHJl
c3BvbnNlLCBpdCB3aWxsIHJlbW92ZSBJT1dhdGNoUG9sbCBhbmQgDQo+ID4gPiBmcmVlIEBpb2Mg
d2hlbiBzZW5kIHJlc3BvbnNlIGZhaWwsIHRoZW4gY2F1c2UgdXNlLWFmdGVyLWZyZWUNCj4gPiA+
DQo+ID4gDQo+ID4gSSB3b25kZXIgaWYgd2UgYXJlIG1pc3VzaW5nIEdTb3VyY2VzIGluIHRoYXQg
Y2FzZSwgYnkgcmVtb3Zpbmcgc291cmNlcyANCj4gPiBmcm9tIGRpZmZlcmVudCB0aHJlYWRzLi4g
Q291bGQgeW91IGJlIG1vcmUgc3BlY2lmaWMgYWJvdXQgdGhlIGNvZGUgDQo+ID4gcGF0aCB0aGF0
IGxlYWRzIHRvIHRoYXQ/DQo+IA0KPiBJdCBpcyBwZXJtaXR0ZWQsIGJ1dCB1bmZvcnR1bmF0ZWx5
IGV2ZXJ5IHZlcnNpb24gb2YgZ2xpYiBwcmlvciB0byAyLjY0IGhhcyBhIHJhY2UgY29uZGl0aW9u
IHRoYXQgbWVhbnMgeW91J2xsIHBlcmlvZGljYWxseSBnZXQgYSB1c2UtYWZ0ZXItZnJlZSBhbmQg
YSBjcmFzaDoNCj4gDQo+ICAgaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9t
ZXJnZV9yZXF1ZXN0cy8xMzU4DQo+IA0KPiBMaWJ2aXJ0IHdvcmtlZCBhcm91bmQgdGhpcyBwcm9i
bGVtIGJ5IG5vdCBjYWxsaW5nICdnX3NvdXJjZV91bnJlZicNCj4gZGlyZWN0bHksIGJ1dCBpbnN0
ZWFkIGhhdmUgYSBoZWxwZXIgdGhhdCB1c2VzIGdfaWRsZV9hZGQgdG8gZGVsYXkgdGhlIHVucmVm
IHN1Y2ggdGhhdCBpdHMgZ3VhcmFudGVlZCB0byBoYXBwZW4gaW5zaWRlIHRoZSBtYWluIGV2ZW50
IGxvb3AgdGhyZWFkLg0KPiANCj4gU28gSSdkIGxpa2UgdG8ga25vdyB3aGF0IHZlcnNpb24gb2Yg
Z2xpYiBIb2dhbiBpcyB1c2luZyANCg0KSSBhbSB1c2luZyBnbGliMi0yLjYyLjUgaW4gdGVzdCBl
bnZpcm9ubWVudCwgc28gaXQncyBsb29rcyBsaWtlIGEgZ2xpYjIga25vd24gaXNzdWUuDQoNCj4g
DQo+IFdpdGggcmVnYXJkcywNCj4gRGFuaWVsDQo+IC0tIA0KPnw6IGh0dHBzOi8vYmVycmFuZ2Uu
Y29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6
fA0KPnw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczov
L2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fA0KPnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3Jn
ICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fA0KDQo=

