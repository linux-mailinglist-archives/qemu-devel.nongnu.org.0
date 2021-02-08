Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A35313D16
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:19:38 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B8L-0004vm-UV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1l950L-000251-11; Mon, 08 Feb 2021 06:46:57 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1l9508-0008W0-VC; Mon, 08 Feb 2021 06:46:56 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DZ42g56JjzY6rK;
 Mon,  8 Feb 2021 19:45:15 +0800 (CST)
Received: from dggemm754-chm.china.huawei.com (10.1.198.60) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 8 Feb 2021 19:46:30 +0800
Received: from dggeme770-chm.china.huawei.com (10.3.19.116) by
 dggemm754-chm.china.huawei.com (10.1.198.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Mon, 8 Feb 2021 19:46:30 +0800
Received: from dggeme770-chm.china.huawei.com ([10.8.68.58]) by
 dggeme770-chm.china.huawei.com ([10.8.68.58]) with mapi id 15.01.2106.006;
 Mon, 8 Feb 2021 19:46:30 +0800
From: gaojinhao <gaojinhao@huawei.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v3 3/3] vmstate: Fix memory leak in vmstate_handle_alloc()
Thread-Topic: [PATCH v3 3/3] vmstate: Fix memory leak in vmstate_handle_alloc()
Thread-Index: AQHW41SL6tbGdhjV5kaXhVPvQdcug6pNxDsAgACTigA=
Date: Mon, 8 Feb 2021 11:46:29 +0000
Message-ID: <7562293f0ee140b9b2a20b170c657207@huawei.com>
References: <20201231061020.828-1-gaojinhao@huawei.com>
 <20201231061020.828-4-gaojinhao@huawei.com> <20210105111818.GA2945@work-vm>
 <20210208105232.GA3033@work-vm>
In-Reply-To: <20210208105232.GA3033@work-vm>
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
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

SGksIERhdmUsDQpJIHdpbGwgY2hlY2sgdGhlIGNvZGUgYWJvdXQgdm1zdGF0ZV9zcGFwcl90Y2Vf
dGFibGUgdG8gZmlndXJlIG91dCB0aGUgcHJvYmxlbSBvZiBzZWcgZmF1bHQuDQpUaGFuayB5b3Ug
Zm9yIHlvdXIgY2hlY2suDQoNCkppbmhhbyBHYW8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgW21haWx0bzpkZ2lsYmVydEByZWRoYXQu
Y29tXSANClNlbnQ6IDIwMjHE6jLUwjjI1SAxODo1Mw0KVG86IGdhb2ppbmhhbyA8Z2FvamluaGFv
QGh1YXdlaS5jb20+DQpDYzogcWVtdS1wcGNAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUu
b3JnOyBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47IERhdmlkIEdpYnNvbiA8
ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PjsgR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz47
IE1hcmMtQW5kcqimIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPjsgU3RlZmFu
IEJlcmdlciA8c3RlZmFuYkBsaW51eC52bmV0LmlibS5jb20+OyBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPjsgSnVhbiBRdWludGVsYSA8cXVpbnRlbGFAcmVkaGF0LmNvbT47IFdhbmdo
YWliaW4gKEQpIDx3YW5naGFpYmluLndhbmdAaHVhd2VpLmNvbT47IHpodWtlcWlhbiA8emh1a2Vx
aWFuMUBodWF3ZWkuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyAzLzNdIHZtc3RhdGU6IEZp
eCBtZW1vcnkgbGVhayBpbiB2bXN0YXRlX2hhbmRsZV9hbGxvYygpDQoNCiogRHIuIERhdmlkIEFs
YW4gR2lsYmVydCAoZGdpbGJlcnRAcmVkaGF0LmNvbSkgd3JvdGU6DQo+ICogSmluaGFvIEdhbyAo
Z2FvamluaGFvQGh1YXdlaS5jb20pIHdyb3RlOg0KPiA+IFNvbWUgbWVtb3J5IGFsbG9jYXRlZCBm
b3IgZmllbGRzIGhhdmluZyBhIGZsYWcgb2YgVk1TX0FMTE9DIGluIA0KPiA+IFNhdmVTdGF0ZSBt
YXkgbm90IGZyZWUgYmVmb3JlIFZNIGxvYWQgdm1zZCBpbiBtaWdyYXRpb24uIFNvIHdlIA0KPiA+
IHByZS1mcmVlIG1lbW9yeSBiZWZvcmUgYWxsb2NhdGlvbiBpbiB2bXN0YXRlX2hhbmRsZV9hbGxv
YygpIHRvIGF2b2lkIG1lbWxlYWtzLg0KPiA+IA0KPiA+IFJlcG9ydGVkLWJ5OiBFdWxlciBSb2Jv
dCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaW5oYW8gR2Fv
IDxnYW9qaW5oYW9AaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRz
aXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiANCj4gWWVzLCBJIHRoaW5rIHRoYXQncyBPSzsgaXQn
cyBhY3R1YWxseSBwcmV0dHkgcmFyZSBmb3IgdGhpcyB0byBoYXBwZW47IA0KPiBub3JtYWxseSBp
bndhcmRzIG1pZ3JhdGlvbnMgZWl0aGVyIHN1Y2NlZWQgb3IgZmFpbCBhbmQgZXhpdDsgZG9pbmcg
DQo+IG11bHRpcGxlIGxvYWRzIGZyb20gc25hcHNob3RzIGlzIHZhbGlkIGFuZCBJIGd1ZXNzIENP
TE8gaGl0cyB0aGlzIGFzIHdlbGwuDQo+IA0KPiBSZXZpZXdlZC1ieTogRHIuIERhdmlkIEFsYW4g
R2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4NCg0KSSdtIGhhdmluZyB0byB1bnF1ZXVlIHRo
aXMgYmVjYXVzZSBpdCdzIHRyaWdnZXJpbmcgYSBzZWcgZmF1bHQgb24gUG93ZXIgaW4gaW90ZXN0
IDI2NyAoanVzdCBydW4gbWFrZSBjaGVjaykuDQoNCiMyICAweDAwMDAwMDAxMTZkMGQ0YzggaW4g
dm1zdGF0ZV9oYW5kbGVfYWxsb2MgKG9wYXF1ZT08b3B0aW1pemVkIG91dD4sIGZpZWxkPTB4MTE3
OTllMGM4IDxfX2NvbXBvdW5kX2xpdGVyYWwuMSszMTI+LCBwdHI9MHgxMDAxZjhmMTRiMCkgYXQg
Li4vcWVtdS9taWdyYXRpb24vdm1zdGF0ZS5jOjczDQojMyAgMHgwMDAwMDAwMTE2ZDBkNGM4IGlu
IHZtc3RhdGVfbG9hZF9zdGF0ZSAoZj0weDEwMDFmNmQwMDAwLCB2bXNkPTB4MTE3OTI4NzMwIDx2
bXN0YXRlX3NwYXByX3RjZV90YWJsZT4sIG9wYXF1ZT0weDEwMDFmOGYxNDAwLCB2ZXJzaW9uX2lk
PTxvcHRpbWl6ZWQgb3V0PikgYXQgLi4vcWVtdS9taWdyYXRpb24vdm1zdGF0ZS5jOjEyMg0KIzQg
IDB4MDAwMDAwMDExNmZiNGE0YyBpbiB2bXN0YXRlX2xvYWQgKGY9MHgxMDAxZjZkMDAwMCwgc2U9
MHgxMDAxZmM3YmM0MCkgYXQgLi4vcWVtdS9taWdyYXRpb24vc2F2ZXZtLmM6OTEwDQojNSAgMHgw
MDAwMDAwMTE2ZmI1MDEwIGluIHFlbXVfbG9hZHZtX3NlY3Rpb25fc3RhcnRfZnVsbCAoZj1mQGVu
dHJ5PTB4MTAwMWY2ZDAwMDAsIG1pcz08b3B0aW1pemVkIG91dD4pIGF0IC4uL3FlbXUvbWlncmF0
aW9uL3NhdmV2bS5jOjI0MzMNCg0KSXQncyB0aGUgbWlnX25iX3RhYmxlIHRoYXQgUG93ZXIgaXMg
ZG9pbmcgc29tZSBzcGVjaWFsIGhhbmRsaW5nIHdpdGg7IHNvIGl0IG5lZWRzIHNvbWUgbW9yZSBj
aGVja2luZyBiZWZvcmUgd2UgY2FuIGZpeCB0aGlzLg0KDQpEYXZlDQoNCj4gPiAtLS0NCj4gPiAg
bWlncmF0aW9uL3Ztc3RhdGUuYyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWlncmF0aW9uL3Ztc3RhdGUuYyBiL21pZ3Jh
dGlvbi92bXN0YXRlLmMgaW5kZXggDQo+ID4gZTlkMmFlZjY2Yi4uODczZjc2NzM5ZiAxMDA2NDQN
Cj4gPiAtLS0gYS9taWdyYXRpb24vdm1zdGF0ZS5jDQo+ID4gKysrIGIvbWlncmF0aW9uL3Ztc3Rh
dGUuYw0KPiA+IEBAIC03MCw2ICs3MCw3IEBAIHN0YXRpYyB2b2lkIHZtc3RhdGVfaGFuZGxlX2Fs
bG9jKHZvaWQgKnB0ciwgY29uc3QgVk1TdGF0ZUZpZWxkICpmaWVsZCwNCj4gPiAgICAgICAgICBn
c2l6ZSBzaXplID0gdm1zdGF0ZV9zaXplKG9wYXF1ZSwgZmllbGQpOw0KPiA+ICAgICAgICAgIHNp
emUgKj0gdm1zdGF0ZV9uX2VsZW1zKG9wYXF1ZSwgZmllbGQpOw0KPiA+ICAgICAgICAgIGlmIChz
aXplKSB7DQo+ID4gKyAgICAgICAgICAgIGdfZnJlZSgqKHZvaWQgKiopcHRyKTsNCj4gPiAgICAg
ICAgICAgICAgKih2b2lkICoqKXB0ciA9IGdfbWFsbG9jKHNpemUpOw0KPiA+ICAgICAgICAgIH0N
Cj4gPiAgICAgIH0NCj4gPiAtLQ0KPiA+IDIuMjMuMA0KPiA+IA0KPiAtLQ0KPiBEci4gRGF2aWQg
QWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0LmNvbSAvIE1hbmNoZXN0ZXIsIFVLDQotLQ0K
RHIuIERhdmlkIEFsYW4gR2lsYmVydCAvIGRnaWxiZXJ0QHJlZGhhdC5jb20gLyBNYW5jaGVzdGVy
LCBVSw0KDQo=

