Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42B2E34E6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 09:02:58 +0100 (CET)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnUX-0003n0-H1
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 03:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktnSG-0003Id-Bp; Mon, 28 Dec 2020 03:00:36 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktnSD-0006WM-12; Mon, 28 Dec 2020 03:00:35 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4D491f2VJRzXsrJ;
 Mon, 28 Dec 2020 15:59:34 +0800 (CST)
Received: from dggemm753-chm.china.huawei.com (10.1.198.59) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 28 Dec 2020 16:00:16 +0800
Received: from dggeme770-chm.china.huawei.com (10.3.19.116) by
 dggemm753-chm.china.huawei.com (10.1.198.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Mon, 28 Dec 2020 16:00:16 +0800
Received: from dggeme770-chm.china.huawei.com ([10.8.68.58]) by
 dggeme770-chm.china.huawei.com ([10.8.68.58]) with mapi id 15.01.1913.007;
 Mon, 28 Dec 2020 16:00:16 +0800
From: gaojinhao <gaojinhao@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH 0/8] Fix memory leak of some device state in migration
Thread-Topic: [PATCH 0/8] Fix memory leak of some device state in migration
Thread-Index: AQHW3FLwT3gVoZpoSEKxXf93mKZtIqoMJTuw
Date: Mon, 28 Dec 2020 08:00:16 +0000
Message-ID: <3c23481e2ed645b7a833485bca6d387b@huawei.com>
References: <20201226103347.868-1-gaojinhao@huawei.com>
 <20201227081620-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201227081620-mutt-send-email-mst@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.50]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=gaojinhao@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?gb2312?B?TWFyYy1BbmRyqKYgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 zhukeqian <zhukeqian1@huawei.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmsgeW91IGZvciB5b3UgcmV2aWV3LiBJIHdpbGwgbW9kaWZ5IHBhdGNoZXMgYWNjb3JkaW5n
IHRvIHlvdXIgb3Bpbmlvbi4NCg0KSmluaGFvIEdhbw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogTWljaGFlbCBTLiBUc2lya2luIFttYWlsdG86bXN0QHJlZGhhdC5jb21dIA0K
U2VudDogMjAyMMTqMTLUwjI3yNUgMjE6MjANClRvOiBnYW9qaW5oYW8gPGdhb2ppbmhhb0BodWF3
ZWkuY29tPg0KQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1wcGNAbm9uZ251Lm9yZzsg
TWFyYy1BbmRyqKYgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+OyBTdGVmYW4g
QmVyZ2VyIDxzdGVmYW5iQGxpbnV4LnZuZXQuaWJtLmNvbT47IEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+OyBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdT47
IEdyZWcgS3VyeiA8Z3JvdWdAa2FvZC5vcmc+OyBKdWFuIFF1aW50ZWxhIDxxdWludGVsYUByZWRo
YXQuY29tPjsgRHIgLiBEYXZpZCBBbGFuIEdpbGJlcnQgPGRnaWxiZXJ0QHJlZGhhdC5jb20+OyBX
YW5naGFpYmluIChEKSA8d2FuZ2hhaWJpbi53YW5nQGh1YXdlaS5jb20+OyB6aHVrZXFpYW4gPHpo
dWtlcWlhbjFAaHVhd2VpLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggMC84XSBGaXggbWVtb3J5
IGxlYWsgb2Ygc29tZSBkZXZpY2Ugc3RhdGUgaW4gbWlncmF0aW9uDQoNCk9uIFNhdCwgRGVjIDI2
LCAyMDIwIGF0IDA2OjMzOjM5UE0gKzA4MDAsIGcwMDUxNzc5MSB3cm90ZToNCj4gRnJvbTogSmlu
aGFvIEdhbyA8Z2FvamluaGFvQGh1YXdlaS5jb20+DQo+IA0KPiBGb3Igc29tZSBkZXZpY2Ugc3Rh
dGUgaGF2aW5nIHNvbWUgZmllbGRzIG9mIFZNU19BTExPQyBmbGFnLCB0aGV5IGRvbid0IA0KPiBm
cmVlIG1lbW9yeSBhbGxvY2F0ZWQgZm9yIHRoZSBmaWVsZHMgaW4gdm1zdGF0ZV9zYXZlX3N0YXRl
IGFuZCB2bXN0YXRlIA0KPiBfbG9hZF9zdGF0ZS4gV2UgYWRkIGZ1bmNzIG9yIHNlbnRlbmNlcyBv
ZiBmcmVlIG1lbW9yeSBiZWZvcmUgDQo+IGFsbG9jYXRpb24gb2YgbWVtb3J5IG9yIGFmdGVyIGxv
YWQgb2YgbWVtb3J5IHRvIGF2b2lkIG1lbW9yeSBsZWFrLg0KPiANCg0KSXNuJ3QgdGhlcmUgYSB3
YXkgdG8gaGFuZGxlIGl0IGNlbnRyYWxseT8NCklJVUMgdGhlIGlzc3VlIGlzIHJlcGVhdGVkIGxv
YWRzIGluIGNhc2UgYSBsb2FkIGZhaWxzLCByaWdodD8NClNvIGNhbid0IHdlIGRvIHNvbWV0aGlu
ZyBhbG9uZyB0aGUgbGluZXMgb2Y6DQoNClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtp
biA8bXN0QHJlZGhhdC5jb20+DQoNCmRpZmYgLS1naXQgYS9taWdyYXRpb24vdm1zdGF0ZS5jIGIv
bWlncmF0aW9uL3Ztc3RhdGUuYyBpbmRleCBlOWQyYWVmNjZiLi44NzNmNzY3MzlmIDEwMDY0NA0K
LS0tIGEvbWlncmF0aW9uL3Ztc3RhdGUuYw0KKysrIGIvbWlncmF0aW9uL3Ztc3RhdGUuYw0KQEAg
LTcwLDYgKzcwLDcgQEAgc3RhdGljIHZvaWQgdm1zdGF0ZV9oYW5kbGVfYWxsb2Modm9pZCAqcHRy
LCBjb25zdCBWTVN0YXRlRmllbGQgKmZpZWxkLA0KICAgICAgICAgZ3NpemUgc2l6ZSA9IHZtc3Rh
dGVfc2l6ZShvcGFxdWUsIGZpZWxkKTsNCiAgICAgICAgIHNpemUgKj0gdm1zdGF0ZV9uX2VsZW1z
KG9wYXF1ZSwgZmllbGQpOw0KICAgICAgICAgaWYgKHNpemUpIHsNCisgICAgICAgICAgICBnX2Zy
ZWUoKih2b2lkICoqKXB0cik7DQogICAgICAgICAgICAgKih2b2lkICoqKXB0ciA9IGdfbWFsbG9j
KHNpemUpOw0KICAgICAgICAgfQ0KICAgICB9DQoNCi0tDQpNU1QNCg0K

