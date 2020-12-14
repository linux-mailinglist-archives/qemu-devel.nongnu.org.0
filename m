Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2C2D91C6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 03:28:09 +0100 (CET)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kodaq-0001fK-Bk
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 21:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kodZs-00018j-Kk; Sun, 13 Dec 2020 21:27:08 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kodZp-0008KQ-CC; Sun, 13 Dec 2020 21:27:08 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CvQHl0dxnzQrjS;
 Mon, 14 Dec 2020 10:26:27 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.125]) by
 DGGEMM402-HUB.china.huawei.com ([10.3.20.210]) with mapi id 14.03.0509.000;
 Mon, 14 Dec 2020 10:26:49 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Laurent Vivier <laurent@vivier.eu>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: RE: [PATCH RESEND v2 3/7] elf2dmp/qemu_elf: Plug memleak in
 QEMU_Elf_init
Thread-Topic: [PATCH RESEND v2 3/7] elf2dmp/qemu_elf: Plug memleak in
 QEMU_Elf_init
Thread-Index: AQHWqQODYbMTtOrl1U2RnapEYWpht6n1FvGAgAESLWA=
Date: Mon, 14 Dec 2020 02:26:48 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BB05E2C@dggemm531-mbx.china.huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-4-kuhn.chenqun@huawei.com>
 <1973545a-9f9b-94d0-fadd-ec7c24fd33b8@vivier.eu>
In-Reply-To: <1973545a-9f9b-94d0-fadd-ec7c24fd33b8@vivier.eu>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga02-in.huawei.com
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Li Qiang <liq3ea@gmail.com>,
 Pannengyuan <pannengyuan@huawei.com>, ganqixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFZpdmllciBbbWFp
bHRvOmxhdXJlbnRAdml2aWVyLmV1XQ0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDE0LCAyMDIw
IDE6NDQgQU0NCj4gVG86IENoZW5xdW4gKGt1aG4pIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT47
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gcWVtdS10cml2aWFsQG5vbmdudS5vcmcNCj4gQ2M6
IGx2aXZpZXJAcmVkaGF0LmNvbTsgWmhhbmdoYWlsaWFuZyA8emhhbmcuemhhbmdoYWlsaWFuZ0Bo
dWF3ZWkuY29tPjsNCj4gVmlrdG9yIFBydXR5YW5vdiA8dmlrdG9yLnBydXR5YW5vdkBwaHlzdGVj
aC5lZHU+OyBMaSBRaWFuZw0KPiA8bGlxM2VhQGdtYWlsLmNvbT47IFBhbm5lbmd5dWFuIDxwYW5u
ZW5neXVhbkBodWF3ZWkuY29tPjsgZ2FucWl4aW4NCj4gPGdhbnFpeGluQGh1YXdlaS5jb20+OyBF
dWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBSRVNFTkQgdjIgMy83XSBlbGYyZG1wL3FlbXVfZWxmOiBQbHVnIG1lbWxlYWsgaW4NCj4gUUVN
VV9FbGZfaW5pdA0KPiANCj4gTGUgMjMvMTAvMjAyMCDDoCAwODoxMiwgQ2hlbiBRdW4gYSDDqWNy
aXTCoDoNCj4gPiBGcm9tOiBQYW4gTmVuZ3l1YW4gPHBhbm5lbmd5dWFuQGh1YXdlaS5jb20+DQo+
ID4NCj4gPiBNaXNzaW5nIGdfZXJyb3JfZnJlZSBpbiBRRU1VX0VsZl9pbml0KCkgZXJyb3IgcGF0
aC4gRml4IHRoYXQuDQo+ID4NCj4gPiBSZXBvcnRlZC1ieTogRXVsZXIgUm9ib3QgPGV1bGVyLnJv
Ym90QGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGFuIE5lbmd5dWFuIDxwYW5uZW5n
eXVhbkBodWF3ZWkuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBWaWt0b3IgUHJ1dHlhbm92IDx2aWt0
b3IucHJ1dHlhbm92QHBoeXN0ZWNoLmVkdT4NCj4gPiBSZXZpZXdlZC1ieTogTGkgUWlhbmcgPGxp
cTNlYUBnbWFpbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRdW4gPGt1aG4uY2hlbnF1
bkBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICBjb250cmliL2VsZjJkbXAvcWVtdV9lbGYuYyB8
IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9jb250cmliL2VsZjJkbXAvcWVtdV9lbGYuYyBiL2NvbnRyaWIvZWxmMmRtcC9xZW11
X2VsZi5jDQo+ID4gaW5kZXggMGRiNzgxNjU4Ni4uYjYwMWI2ZDdiYSAxMDA2NDQNCj4gPiAtLS0g
YS9jb250cmliL2VsZjJkbXAvcWVtdV9lbGYuYw0KPiA+ICsrKyBiL2NvbnRyaWIvZWxmMmRtcC9x
ZW11X2VsZi5jDQo+ID4gQEAgLTEyNiw2ICsxMjYsNyBAQCBpbnQgUUVNVV9FbGZfaW5pdChRRU1V
X0VsZiAqcWUsIGNvbnN0IGNoYXINCj4gKmZpbGVuYW1lKQ0KPiA+ICAgICAgcWUtPmdtZiA9IGdf
bWFwcGVkX2ZpbGVfbmV3KGZpbGVuYW1lLCBUUlVFLCAmZ2Vycik7DQo+ID4gICAgICBpZiAoZ2Vy
cikgew0KPiA+ICAgICAgICAgIGVwcmludGYoIkZhaWxlZCB0byBtYXAgRUxGIGR1bXAgZmlsZSBc
JyVzXCdcbiIsIGZpbGVuYW1lKTsNCj4gPiArICAgICAgICBnX2Vycm9yX2ZyZWUoZ2Vycik7DQo+
ID4gICAgICAgICAgcmV0dXJuIDE7DQo+ID4gICAgICB9DQo+ID4NCj4gPg0KPiANCj4gQXBwbGll
ZCB0byBteSB0cml2aWFsLXBhdGNoZXMgYnJhbmNoLg0KPiANCkhpIExhdXJlbnQsDQogIFRoYW5r
IHlvdSBmb3IgcGlja2VkIHRoZW0gdXAhDQpCdXQsIHRoZXJlIGFyZSB0d28gcGF0Y2hlcyB0aGF0
IGhhdmUgbm90IGJlZW4gcGlja2VkIHVwLg0KTWF5YmUgSSBzaG91bGQgcGluZyB0aGUgY29ycmVz
cG9uZGluZyBNYWludGFpbmVyIGZpcnN0Lg0KDQpUaGUgbWlzc2luZyBwYXRjaGVzIGFyZe+8mg0K
W1BBVENIIFJFU0VORCB2MiAyLzddIHFnYS9jaGFubmVsLXBvc2l4OiBQbHVnIG1lbW9yeSBsZWFr
IGluIGdhX2NoYW5uZWxfd3JpdGVfYWxsKCkNCltQQVRDSCBSRVNFTkQgdjIgNS83XSBtaWdyYXRp
b24vY29sbzogUGx1ZyBtZW1sZWFrcyBpbiBjb2xvX3Byb2Nlc3NfaW5jb21pbmdfdGhyZWFkDQoN
ClRoYW5rcywNCkNoZW4gUXVuDQo=

