Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE547B203
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:20:36 +0100 (CET)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMKw-000777-Ub
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:20:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mzKrQ-0002KY-V3; Mon, 20 Dec 2021 10:46:00 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mzKrI-0002II-U7; Mon, 20 Dec 2021 10:45:59 -0500
Received: from dggeme708-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JHfm84fWmz8vyZ;
 Mon, 20 Dec 2021 20:58:48 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggeme708-chm.china.huawei.com (10.1.199.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Mon, 20 Dec 2021 21:01:06 +0800
Received: from kwepemm600017.china.huawei.com ([7.193.23.234]) by
 kwepemm600017.china.huawei.com ([7.193.23.234]) with mapi id 15.01.2308.020;
 Mon, 20 Dec 2021 21:01:06 +0800
To: Anup Patel <anup@brainfault.org>
CC: QEMU Developers <qemu-devel@nongnu.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, "kvm-riscv@lists.infradead.org"
 <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, Anup Patel
 <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, "Fanliang
 (EulerOS)" <fanliang@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>,
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, "wanbo (G)"
 <wanbo13@huawei.com>, "limingwang (A)" <limingwang@huawei.com>
Subject: RE: [PATCH v2 07/12] target/riscv: Support setting external interrupt
 by KVM
Thread-Topic: [PATCH v2 07/12] target/riscv: Support setting external
 interrupt by KVM
Thread-Index: AQHX7a3KOWeb/sw9+Uez4pombBEDMKwvU3IAgAwUFmA=
Date: Mon, 20 Dec 2021 13:01:06 +0000
Message-ID: <96124a6ed69f4cf8b905826218359bc3@huawei.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-8-jiangyifei@huawei.com>
 <CAAhSdy0q3iuURMcW9+wV4oyB1O=Mj19UaT9P31fLHAYZ_wU3pg@mail.gmail.com>
In-Reply-To: <CAAhSdy0q3iuURMcW9+wV4oyB1O=Mj19UaT9P31fLHAYZ_wU3pg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangyifei@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jiangyifei <jiangyifei@huawei.com>
From:  Jiangyifei via <qemu-devel@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFudXAgUGF0ZWwgW21haWx0
bzphbnVwQGJyYWluZmF1bHQub3JnXQ0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDEzLCAyMDIx
IDEyOjMzIFBNDQo+IFRvOiBKaWFuZ3lpZmVpIDxqaWFuZ3lpZmVpQGh1YXdlaS5jb20+DQo+IENj
OiBRRU1VIERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IG9wZW4gbGlzdDpSSVND
LVYNCj4gPHFlbXUtcmlzY3ZAbm9uZ251Lm9yZz47IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBLVk0gR2VuZXJhbA0KPiA8a3ZtQHZnZXIua2VybmVsLm9yZz47IGxpYnZpci1saXN0QHJl
ZGhhdC5jb207IEFudXAgUGF0ZWwNCj4gPGFudXAucGF0ZWxAd2RjLmNvbT47IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+OyBBbGlzdGFpcg0KPiBGcmFuY2lzIDxBbGlzdGFpci5G
cmFuY2lzQHdkYy5jb20+OyBCaW4gTWVuZyA8YmluLm1lbmdAd2luZHJpdmVyLmNvbT47DQo+IEZh
bmxpYW5nIChFdWxlck9TKSA8ZmFubGlhbmdAaHVhd2VpLmNvbT47IFd1YmluIChIKQ0KPiA8d3Uu
d3ViaW5AaHVhd2VpLmNvbT47IFdhbmdoYWliaW4gKEQpIDx3YW5naGFpYmluLndhbmdAaHVhd2Vp
LmNvbT47DQo+IHdhbmJvIChHKSA8d2FuYm8xM0BodWF3ZWkuY29tPjsgbGltaW5nd2FuZyAoQSkN
Cj4gPGxpbWluZ3dhbmdAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNy8x
Ml0gdGFyZ2V0L3Jpc2N2OiBTdXBwb3J0IHNldHRpbmcgZXh0ZXJuYWwgaW50ZXJydXB0DQo+IGJ5
IEtWTQ0KPiANCj4gT24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgMzozNyBQTSBZaWZlaSBKaWFuZyA8
amlhbmd5aWZlaUBodWF3ZWkuY29tPiB3cm90ZToNCj4gPg0KPiA+IFdoZW4gS1ZNIGlzIGVuYWJs
ZWQsIHNldCB0aGUgUy1tb2RlIGV4dGVybmFsIGludGVycnVwdCB0aHJvdWdoDQo+ID4ga3ZtX3Jp
c2N2X3NldF9pcnEgZnVuY3Rpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZaWZlaSBKaWFu
ZyA8amlhbmd5aWZlaUBodWF3ZWkuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pbmd3YW5nIExp
IDxsaW1pbmd3YW5nQGh1YXdlaS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEFsaXN0YWlyIEZyYW5j
aXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGFyZ2V0L3Jpc2N2
L2NwdS5jICAgICAgIHwgIDYgKysrKystDQo+ID4gIHRhcmdldC9yaXNjdi9rdm0tc3R1Yi5jICB8
ICA1ICsrKysrDQo+ID4gIHRhcmdldC9yaXNjdi9rdm0uYyAgICAgICB8IDE3ICsrKysrKysrKysr
KysrKysrDQo+ID4gIHRhcmdldC9yaXNjdi9rdm1fcmlzY3YuaCB8ICAxICsNCj4gPiAgNCBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2NwdS5jIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jIGluZGV4DQo+
ID4gMWM5NDQ4NzJhMy4uNzFhN2FjNjgzMSAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvcmlzY3Yv
Y3B1LmMNCj4gPiArKysgYi90YXJnZXQvcmlzY3YvY3B1LmMNCj4gPiBAQCAtNjAzLDcgKzYwMywx
MSBAQCBzdGF0aWMgdm9pZCByaXNjdl9jcHVfc2V0X2lycSh2b2lkICpvcGFxdWUsIGludCBpcnEs
DQo+IGludCBsZXZlbCkNCj4gPiAgICAgIGNhc2UgSVJRX1NfRVhUOg0KPiA+ICAgICAgY2FzZSBJ
UlFfVlNfRVhUOg0KPiA+ICAgICAgY2FzZSBJUlFfTV9FWFQ6DQo+ID4gLSAgICAgICAgcmlzY3Zf
Y3B1X3VwZGF0ZV9taXAoY3B1LCAxIDw8IGlycSwgQk9PTF9UT19NQVNLKGxldmVsKSk7DQo+ID4g
KyAgICAgICAgaWYgKGt2bV9lbmFibGVkKCkgJiYgKGlycSAmIElSUV9NX0VYVCkgKSB7DQo+ID4g
KyAgICAgICAgICAgIGt2bV9yaXNjdl9zZXRfaXJxKGNwdSwgSVJRX1NfRVhULCBsZXZlbCk7DQo+
ID4gKyAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgcmlzY3ZfY3B1X3VwZGF0ZV9t
aXAoY3B1LCAxIDw8IGlycSwgQk9PTF9UT19NQVNLKGxldmVsKSk7DQo+ID4gKyAgICAgICAgfQ0K
PiANCj4gVGhpcyBkb2VzIG5vdCBsb29rIHJpZ2h0Lg0KPiANCj4gSSBzdWdnZXN0IHRoZSBmb2xs
b3dpbmc6DQo+IA0KPiBpZiAoa3ZtX2VuYWJsZWQoKSkgew0KPiAgICAga3ZtX3Jpc2N2X3NldF9p
cnEoY3B1LCBpcnEsIGxldmVsKTsNCj4gfSBlbHNlIHsNCj4gICAgcmlzY3ZfY3B1X3VwZGF0ZV9t
aXAoY3B1LCAxIDw8IGlycSwgQk9PTF9UT19NQVNLKGxldmVsKSk7IH0NCj4gDQoNClRoZSBNLW1v
ZGUgUExJQyBjb250ZXh0IGlzIG5vdCBkZWxldGVkLiBUaGVyZWZvcmUsIElSUV9NX0VYVCBuZWVk
cyB0bw0KYmUgY29udmVydGVkIHRvIElSUV9TX0VYVC4gVGhlIE0tbW9kZSBQTElDIGNvbnRleHRz
IHdpbGwgYmUgcmVtb3ZlZCBpbg0KdGhlIG5leHQgc2VyaWVzLCBzbyBpdCB3aWxsIGJlIG1vZGlm
aWVkIGFzIHN1Z2dlc3RlZC4NCg0KWWlmZWkNCg0KPiA+ICAgICAgICAgIGJyZWFrOw0KPiA+ICAg
ICAgZGVmYXVsdDoNCj4gPiAgICAgICAgICBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOw0KPiA+IGRp
ZmYgLS1naXQgYS90YXJnZXQvcmlzY3Yva3ZtLXN0dWIuYyBiL3RhcmdldC9yaXNjdi9rdm0tc3R1
Yi5jIGluZGV4DQo+ID4gMzliOTZmZTNmNC4uNGU4ZmMzMWEyMSAxMDA2NDQNCj4gPiAtLS0gYS90
YXJnZXQvcmlzY3Yva3ZtLXN0dWIuYw0KPiA+ICsrKyBiL3RhcmdldC9yaXNjdi9rdm0tc3R1Yi5j
DQo+ID4gQEAgLTIzLDMgKzIzLDggQEAgdm9pZCBrdm1fcmlzY3ZfcmVzZXRfdmNwdShSSVNDVkNQ
VSAqY3B1KSAgew0KPiA+ICAgICAgYWJvcnQoKTsNCj4gPiAgfQ0KPiA+ICsNCj4gPiArdm9pZCBr
dm1fcmlzY3Zfc2V0X2lycShSSVNDVkNQVSAqY3B1LCBpbnQgaXJxLCBpbnQgbGV2ZWwpIHsNCj4g
PiArICAgIGFib3J0KCk7DQo+ID4gK30NCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2t2
bS5jIGIvdGFyZ2V0L3Jpc2N2L2t2bS5jIGluZGV4DQo+ID4gZGI2ZDhhNWI2ZS4uMDAyN2YxMWY0
NSAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvcmlzY3Yva3ZtLmMNCj4gPiArKysgYi90YXJnZXQv
cmlzY3Yva3ZtLmMNCj4gPiBAQCAtMzgzLDYgKzM4MywyMyBAQCB2b2lkIGt2bV9yaXNjdl9yZXNl
dF92Y3B1KFJJU0NWQ1BVICpjcHUpDQo+ID4gICAgICBlbnYtPnNhdHAgPSAwOw0KPiA+ICB9DQo+
ID4NCj4gPiArdm9pZCBrdm1fcmlzY3Zfc2V0X2lycShSSVNDVkNQVSAqY3B1LCBpbnQgaXJxLCBp
bnQgbGV2ZWwpIHsNCj4gPiArICAgIGludCByZXQ7DQo+ID4gKyAgICB1bnNpZ25lZCB2aXJxID0g
bGV2ZWwgPyBLVk1fSU5URVJSVVBUX1NFVCA6DQo+IEtWTV9JTlRFUlJVUFRfVU5TRVQ7DQo+ID4g
Kw0KPiA+ICsgICAgaWYgKGlycSAhPSBJUlFfU19FWFQpIHsNCj4gPiArICAgICAgICBwZXJyb3Io
Imt2bSByaXNjdiBzZXQgaXJxICE9IElSUV9TX0VYVFxuIik7DQo+ID4gKyAgICAgICAgYWJvcnQo
KTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICByZXQgPSBrdm1fdmNwdV9pb2N0bChDUFUo
Y3B1KSwgS1ZNX0lOVEVSUlVQVCwgJnZpcnEpOw0KPiA+ICsgICAgaWYgKHJldCA8IDApIHsNCj4g
PiArICAgICAgICBwZXJyb3IoIlNldCBpcnEgZmFpbGVkIik7DQo+ID4gKyAgICAgICAgYWJvcnQo
KTsNCj4gPiArICAgIH0NCj4gPiArfQ0KPiA+ICsNCj4gPiAgYm9vbCBrdm1fYXJjaF9jcHVfY2hl
Y2tfYXJlX3Jlc2V0dGFibGUodm9pZCkNCj4gPiAgew0KPiA+ICAgICAgcmV0dXJuIHRydWU7DQo+
ID4gZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9rdm1fcmlzY3YuaCBiL3RhcmdldC9yaXNjdi9r
dm1fcmlzY3YuaCBpbmRleA0KPiA+IGYzOGM4MmJmNTkuLmVkMjgxYmRjZTAgMTAwNjQ0DQo+ID4g
LS0tIGEvdGFyZ2V0L3Jpc2N2L2t2bV9yaXNjdi5oDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2t2
bV9yaXNjdi5oDQo+ID4gQEAgLTIwLDUgKzIwLDYgQEANCj4gPiAgI2RlZmluZSBRRU1VX0tWTV9S
SVNDVl9IDQo+ID4NCj4gPiAgdm9pZCBrdm1fcmlzY3ZfcmVzZXRfdmNwdShSSVNDVkNQVSAqY3B1
KTsNCj4gPiArdm9pZCBrdm1fcmlzY3Zfc2V0X2lycShSSVNDVkNQVSAqY3B1LCBpbnQgaXJxLCBp
bnQgbGV2ZWwpOw0KPiA+DQo+ID4gICNlbmRpZg0KPiA+IC0tDQo+ID4gMi4xOS4xDQo+ID4NCj4g
DQo+IFJlZ2FyZHMsDQo+IEFudXANCg==

