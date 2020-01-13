Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A5138DF0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 10:41:14 +0100 (CET)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqwDh-00012r-6b
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 04:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1iqwCn-0000BP-L3
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:40:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1iqwCm-00063T-HK
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:40:17 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2487 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1iqwCm-0005q4-6c; Mon, 13 Jan 2020 04:40:16 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 70BB11EBBF731E10A0B1;
 Mon, 13 Jan 2020 17:40:07 +0800 (CST)
Received: from DGGEMM422-HUB.china.huawei.com (10.1.198.39) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Jan 2020 17:39:21 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.215]) by
 dggemm422-hub.china.huawei.com ([10.1.198.39]) with mapi id 14.03.0439.000;
 Mon, 13 Jan 2020 17:39:15 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: RE: [PATCH] xhci: Fix memory leak in xhci_kick_epctx when poweroff
 GuestOS
Thread-Topic: [PATCH] xhci: Fix memory leak in xhci_kick_epctx when poweroff
 GuestOS
Thread-Index: AQHVx6T71tCpOn/wSkGorEYKOY6OCKfjWkgAgARb5YCAAJoCgA==
Date: Mon, 13 Jan 2020 09:39:14 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83B0E957F@dggemm531-mbx.china.huawei.com>
References: <20200110105855.81144-1-kuhn.chenqun@huawei.com>
 <d5e369c6-b1c2-2b64-97a5-d9b2fc443842@redhat.com>
 <20200113074805.4nsqairqwvrf37eb@sirius.home.kraxel.org>
In-Reply-To: <20200113074805.4nsqairqwvrf37eb@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.205.93]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.188
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Pannengyuan <pannengyuan@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogR2VyZCBIb2ZmbWFubiBbbWFpbHRv
OmtyYXhlbEByZWRoYXQuY29tXQ0KPlNlbnQ6IE1vbmRheSwgSmFudWFyeSAxMywgMjAyMCAzOjQ4
IFBNDQo+VG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4NCj5D
YzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPjsgcWVtdS0NCj5kZXZl
bEBub25nbnUub3JnOyBxZW11LXRyaXZpYWxAbm9uZ251Lm9yZzsgUGFubmVuZ3l1YW4NCj48cGFu
bmVuZ3l1YW5AaHVhd2VpLmNvbT47IFpoYW5naGFpbGlhbmcNCj48emhhbmcuemhhbmdoYWlsaWFu
Z0BodWF3ZWkuY29tPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhoY2k6IEZpeCBtZW1vcnkgbGVh
ayBpbiB4aGNpX2tpY2tfZXBjdHggd2hlbiBwb3dlcm9mZg0KPkd1ZXN0T1MNCj4NCj4+ID4gZGlm
ZiAtLWdpdCBhL2h3L3VzYi9oY2QteGhjaS5jIGIvaHcvdXNiL2hjZC14aGNpLmMgaW5kZXgNCj4+
ID4gODA5ODhiYjMwNS4uMGQzZDk2ZDA1YSAxMDA2NDQNCj4+ID4gLS0tIGEvaHcvdXNiL2hjZC14
aGNpLmMNCj4+ID4gKysrIGIvaHcvdXNiL2hjZC14aGNpLmMNCj4+ID4gQEAgLTIwMDAsNiArMjAw
MCw3IEBAIHN0YXRpYyB2b2lkIHhoY2lfa2lja19lcGN0eChYSENJRVBDb250ZXh0DQo+KmVwY3R4
LCB1bnNpZ25lZCBpbnQgc3RyZWFtaWQpDQo+PiA+ICAgICAgICAgICBpZiAoeGZlciAhPSBOVUxM
ICYmIHhmZXItPnJ1bm5pbmdfcmV0cnkpIHsNCj4+ID4gICAgICAgICAgICAgICBEUFJJTlRGKCJ4
aGNpOiB4ZmVyIG5hY2tlZCwgc3RvcHBpbmcgc2NoZWR1bGVcbiIpOw0KPj4gPiAgICAgICAgICAg
ICAgIGVwY3R4LT5yZXRyeSA9IHhmZXI7DQo+PiA+ICsgICAgICAgICAgICB4aGNpX3hmZXJfdW5t
YXAoeGZlcik7DQo+Pg0KPj4gU2hvdWxkbid0IHdlIHVzZSB4aGNpX2VwX2ZyZWVfeGZlcigpIGlu
c3RlYWQ/DQo+DQo+Tm8sIHhoY2kgd2lsbCB0cnkgdG8gcnVuIHRoZSB0cmFuc2ZlciBhZ2FpbiBs
YXRlci4NCj4NCj54aGNpIHdpbGwgcmUtY3JlYXRlIHRoZSBzZ2wgdGhlbiwgc28gZnJlZWluZyB0
aGUgc2dsIGhlcmUgaXMgY29ycmVjdC4gIFBhdGNoIGFkZGVkDQo+dG8gdXNiIHF1ZXVlLg0KDQpI
aSAgR2VyZCwNCg0KSSB0ZXN0IGV2ZXJ5IGtleWJvYXJkIGlucHV0LCBpdCB3aWxsIGxlYWsgb25j
ZS4gICANCkkgdGVzdGVkIHFlbXUtNC4wLjAgIGFsc28gaGFkICB0aGlzIGxlYWsgLg0KDQpNYXli
ZSAgd2Ugc2hvdWxkIGNjIHRvIHFlbXUtc3RhYmxlID8NCg0KVGhhbmtzLg0KPg0KPnRoYW5rcywN
Cj4gIEdlcmQNCg0K

