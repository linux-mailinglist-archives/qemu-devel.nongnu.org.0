Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DE2EB996
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 06:48:35 +0100 (CET)
Received: from localhost ([::1]:51648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx1gQ-0003h6-IB
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 00:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kx1eN-0002qe-Rg; Wed, 06 Jan 2021 00:46:27 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kx1eK-0000f9-TA; Wed, 06 Jan 2021 00:46:27 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4D9dc80vQTz5Cy7;
 Wed,  6 Jan 2021 13:44:56 +0800 (CST)
Received: from dggemm753-chm.china.huawei.com (10.1.198.59) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 6 Jan 2021 13:46:05 +0800
Received: from dggeme770-chm.china.huawei.com (10.3.19.116) by
 dggemm753-chm.china.huawei.com (10.1.198.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Wed, 6 Jan 2021 13:46:05 +0800
Received: from dggeme770-chm.china.huawei.com ([10.8.68.58]) by
 dggeme770-chm.china.huawei.com ([10.8.68.58]) with mapi id 15.01.1913.007;
 Wed, 6 Jan 2021 13:46:05 +0800
From: gaojinhao <gaojinhao@huawei.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v3 3/3] vmstate: Fix memory leak in vmstate_handle_alloc()
Thread-Topic: [PATCH v3 3/3] vmstate: Fix memory leak in vmstate_handle_alloc()
Thread-Index: AQHW41SL6tbGdhjV5kaXhVPvQdcug6oaF41A
Date: Wed, 6 Jan 2021 05:46:04 +0000
Message-ID: <6c6fb0e550904237acd913e350de3508@huawei.com>
References: <20201231061020.828-1-gaojinhao@huawei.com>
 <20201231061020.828-4-gaojinhao@huawei.com> <20210105111818.GA2945@work-vm>
In-Reply-To: <20210105111818.GA2945@work-vm>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.50]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=gaojinhao@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?gb2312?B?TWFyYy1BbmRyqKYgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 zhukeqian <zhukeqian1@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmsgeW91IGZvciByZXZpZXchDQoNCkppbmhhbyBHYW8NCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgW21haWx0bzpkZ2lsYmVydEBy
ZWRoYXQuY29tXSANClNlbnQ6IDIwMjHE6jHUwjXI1SAxOToxOA0KVG86IGdhb2ppbmhhbyA8Z2Fv
amluaGFvQGh1YXdlaS5jb20+DQpDYzogcWVtdS1wcGNAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBu
b25nbnUub3JnOyBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47IERhdmlkIEdp
YnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PjsgR3JlZyBLdXJ6IDxncm91Z0BrYW9k
Lm9yZz47IE1hcmMtQW5kcqimIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPjsg
U3RlZmFuIEJlcmdlciA8c3RlZmFuYkBsaW51eC52bmV0LmlibS5jb20+OyBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPjsgSnVhbiBRdWludGVsYSA8cXVpbnRlbGFAcmVkaGF0LmNvbT47
IFdhbmdoYWliaW4gKEQpIDx3YW5naGFpYmluLndhbmdAaHVhd2VpLmNvbT47IHpodWtlcWlhbiA8
emh1a2VxaWFuMUBodWF3ZWkuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyAzLzNdIHZtc3Rh
dGU6IEZpeCBtZW1vcnkgbGVhayBpbiB2bXN0YXRlX2hhbmRsZV9hbGxvYygpDQoNCiogSmluaGFv
IEdhbyAoZ2FvamluaGFvQGh1YXdlaS5jb20pIHdyb3RlOg0KPiBTb21lIG1lbW9yeSBhbGxvY2F0
ZWQgZm9yIGZpZWxkcyBoYXZpbmcgYSBmbGFnIG9mIFZNU19BTExPQyBpbiANCj4gU2F2ZVN0YXRl
IG1heSBub3QgZnJlZSBiZWZvcmUgVk0gbG9hZCB2bXNkIGluIG1pZ3JhdGlvbi4gU28gd2UgDQo+
IHByZS1mcmVlIG1lbW9yeSBiZWZvcmUgYWxsb2NhdGlvbiBpbiB2bXN0YXRlX2hhbmRsZV9hbGxv
YygpIHRvIGF2b2lkIG1lbWxlYWtzLg0KPiANCj4gUmVwb3J0ZWQtYnk6IEV1bGVyIFJvYm90IDxl
dWxlci5yb2JvdEBodWF3ZWkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKaW5oYW8gR2FvIDxnYW9q
aW5oYW9AaHVhd2VpLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT4NCg0KWWVzLCBJIHRoaW5rIHRoYXQncyBPSzsgaXQncyBhY3R1YWxseSBw
cmV0dHkgcmFyZSBmb3IgdGhpcyB0byBoYXBwZW47IG5vcm1hbGx5IGlud2FyZHMgbWlncmF0aW9u
cyBlaXRoZXIgc3VjY2VlZCBvciBmYWlsIGFuZCBleGl0OyBkb2luZyBtdWx0aXBsZSBsb2FkcyBm
cm9tIHNuYXBzaG90cyBpcyB2YWxpZCBhbmQgSSBndWVzcyBDT0xPIGhpdHMgdGhpcyBhcyB3ZWxs
Lg0KDQpSZXZpZXdlZC1ieTogRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0
LmNvbT4NCg0KPiAtLS0NCj4gIG1pZ3JhdGlvbi92bXN0YXRlLmMgfCAxICsNCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi92bXN0
YXRlLmMgYi9taWdyYXRpb24vdm1zdGF0ZS5jIGluZGV4IA0KPiBlOWQyYWVmNjZiLi44NzNmNzY3
MzlmIDEwMDY0NA0KPiAtLS0gYS9taWdyYXRpb24vdm1zdGF0ZS5jDQo+ICsrKyBiL21pZ3JhdGlv
bi92bXN0YXRlLmMNCj4gQEAgLTcwLDYgKzcwLDcgQEAgc3RhdGljIHZvaWQgdm1zdGF0ZV9oYW5k
bGVfYWxsb2Modm9pZCAqcHRyLCBjb25zdCBWTVN0YXRlRmllbGQgKmZpZWxkLA0KPiAgICAgICAg
ICBnc2l6ZSBzaXplID0gdm1zdGF0ZV9zaXplKG9wYXF1ZSwgZmllbGQpOw0KPiAgICAgICAgICBz
aXplICo9IHZtc3RhdGVfbl9lbGVtcyhvcGFxdWUsIGZpZWxkKTsNCj4gICAgICAgICAgaWYgKHNp
emUpIHsNCj4gKyAgICAgICAgICAgIGdfZnJlZSgqKHZvaWQgKiopcHRyKTsNCj4gICAgICAgICAg
ICAgICoodm9pZCAqKilwdHIgPSBnX21hbGxvYyhzaXplKTsNCj4gICAgICAgICAgfQ0KPiAgICAg
IH0NCj4gLS0NCj4gMi4yMy4wDQo+IA0KLS0NCkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQgLyBkZ2ls
YmVydEByZWRoYXQuY29tIC8gTWFuY2hlc3RlciwgVUsNCg0K

