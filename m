Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1944BDA5A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:49:51 +0100 (CET)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMA0b-0007Ku-SG
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:49:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM9ok-00042H-IM
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:37:35 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM9og-0004ma-Ct
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:37:33 -0500
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K2PxW1dvlzdZTW;
 Mon, 21 Feb 2022 22:36:15 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 22:37:25 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 22:37:25 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Mon, 21 Feb 2022 22:37:25 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "mst@redhat.com" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>
Subject: RE: [RFC 0/2] qemu-sem-posix: use monotonic clock instead
Thread-Topic: [RFC 0/2] qemu-sem-posix: use monotonic clock instead
Thread-Index: AQHYJwlHBoqZQ15zrk+UqzT47Udm5aydWNMAgAC52SA=
Date: Mon, 21 Feb 2022 14:37:24 +0000
Message-ID: <f02c3c79e4124bf796c42b49faee2759@huawei.com>
References: <20220221095617.1974-1-longpeng2@huawei.com>
 <038604a0-13cd-58da-d39d-84ed8c68a6a2@redhat.com>
In-Reply-To: <038604a0-13cd-58da-d39d-84ed8c68a6a2@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFvbG8gQm9uemluaSBb
bWFpbHRvOnBhb2xvLmJvbnppbmlAZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgUGFvbG8gQm9uemlu
aQ0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDIxLCAyMDIyIDc6MzEgUE0NCj4gVG86IExvbmdw
ZW5nIChNaWtlLCBDbG91ZCBJbmZyYXN0cnVjdHVyZSBTZXJ2aWNlIFByb2R1Y3QgRGVwdC4pDQo+
IDxsb25ncGVuZzJAaHVhd2VpLmNvbT47IGJlcnJhbmdlQHJlZGhhdC5jb207IG1zdEByZWRoYXQu
Y29tDQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdv
bmdsZWlAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgMC8yXSBxZW11LXNlbS1wb3Np
eDogdXNlIG1vbm90b25pYyBjbG9jayBpbnN0ZWFkDQo+IA0KPiBPbiAyLzIxLzIyIDEwOjU2LCBM
b25ncGVuZyhNaWtlKSB2aWEgd3JvdGU6DQo+ID4gVGhlIHFlbXVfc2VtX3RpbWVkd2FpdCgpIHVz
ZXMgc3lzdGVtIHRpbWUgYXMgZGVmYXVsdCwgaXQgd291bGQgYmUgYWZmZWN0ZWQNCj4gYnkNCj4g
PiBjaGFuZ2VzIHRvIHRoZSBzeXN0ZW0gdGltZS4gSW4gdGhlIHJlYWwgc2NlbmFyaW8sIHRoZSB0
aW1lIHRoYXQgZ29lcyBmYXN0ZXINCj4gb3INCj4gPiBzbG93ZXIgaXMgYSBjb21tb24gY2FzZSBh
bmQgdGhlIE5UUCBzZXJ2aWNlIGNvdWxkIGhlbHAgdXMgdG8gc3luYyB0aW1lDQo+ID4gcGVyaW9k
aWNhbGx5Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaHNldCB1c2VzIG1vbm90b25pYyBjbG9jayBpbnN0
ZWFkIG9mIHRoZSByZWFsdGltZSBjbG9jaywgdGhpcyBjb3VsZA0KPiA+IG1ha2Ugc3VyZSB3ZSB3
b3VsZCBub3QgYmUgYWZmZWN0ZWQgYnkgdGhlIHN5c3RlbSB0aW1lIGFueW1vcmUuDQo+IA0KPiBU
aGlzIGxvb2tzIGdvb2QsIEkgZG9uJ3QgdGhpbmsgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGEgbW9y
ZSBvcHRpbWl6ZWQNCj4gc2VtYXBob3JlIGlzIG5lY2Vzc2FyeSAoaWYgdGhlcmUgd2VyZSwgd2Ug
Y291bGQgaW50cm9kdWNlIGEgZnV0ZXgNCj4gZmFsbGJhY2sgb24gTGludXgpLg0KPiANCj4gSG93
ZXZlciwgcHRocmVhZF9jb25kYXR0cl90IG5lZWQgbm90IGJlIGluIHRoZSBzdHJ1Y3QuICBUaGUg
YXR0cmlidXRlcw0KPiBjYW4gYmUgYWxsb2NhdGVkIG9uIHRoZSBzdGFjaywgYmVjYXVzZSB0aGV5
IGRvIG5vdCBoYXZlIHRvIHJlbWFpbiBhbGl2ZQ0KPiBhZnRlciBwdGhyZWFkX2NvbmRfaW5pdC4N
Cj4gDQoNCk9LLCB3aWxsIGRvIGluIHRoZSBuZXh0IHZlcnNpb24sIHRoYW5rcyENCg0KPiBUaGFu
a3MsDQo+IA0KPiBQYW9sbw0KPiANCj4gPiBMb25ncGVuZyAoTWlrZSkgKDIpOg0KPiA+ICAgIHNl
bS1wb3NpeDogcmVtb3ZlIHRoZSBwb3NpeCBzZW1hcGhvcmUgc3VwcG9ydA0KPiA+ICAgIHNlbS1w
b3NpeDogdXNlIG1vbm90b25pYyBjbG9jayBpbnN0ZWFkDQo+ID4NCj4gPiAgIGluY2x1ZGUvcWVt
dS90aHJlYWQtcG9zaXguaCB8ICA1ICstLQ0KPiA+ICAgbWVzb24uYnVpbGQgICAgICAgICAgICAg
ICAgIHwgMTIgKysrKysrLQ0KPiA+ICAgdXRpbC9xZW11LXRocmVhZC1wb3NpeC5jICAgIHwgODIN
Cj4gKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAz
IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygtKQ0KPiA+DQoN
Cg==

