Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40753FE747
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 03:49:28 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLbr5-0002oB-Ay
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 21:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Renwei.Liu@verisilicon.com>)
 id 1mLbpU-0001wf-S6; Wed, 01 Sep 2021 21:47:48 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:29110
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Renwei.Liu@verisilicon.com>)
 id 1mLbpQ-0003eY-Pk; Wed, 01 Sep 2021 21:47:48 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1630547238; h=from:subject:to:date:message-id;
 bh=0F5JijoFy6UYfdDR9Nz9FDqUFBBW2Pv6jjSh7/I7gwI=;
 b=WoVNWxcAsj1JfaQF3I+to7g+QgVahRHplkdjv3zGQhxFhWSBkId96WabqKmF7haJlSjU7a9Vm3t
 14FsYFAZ0cHO/pqBpddY2HF/kaSeFvwqs4rDuZSaeEQN5QDqbmBYgEfCfByWsC3cRWZj6H7fV26M+
 neAetpHQ7usOMAFm4FI=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Thu, 2 Sep 2021 09:47:17 +0800
From: "Liu, Renwei" <Renwei.Liu@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: RE: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
Thread-Topic: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
Thread-Index: AdeX84o6Zl+vD6dIRwucF0VY/o+mnwGQGLuAACkW3AAABfl5AAAqZjiA
Date: Thu, 2 Sep 2021 01:47:16 +0000
Message-ID: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6EA2EF@SHASXM03.verisilicon.com>
References: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
 <1805dcb3-6f99-0bf1-2d73-be0537c98512@redhat.com>
 <4FA89A717CD8094DBA0FE20FA5F98EAA010E6EA1E0@SHASXM03.verisilicon.com>
 <48a545f5-d21c-85b1-20dd-b5449b88e993@redhat.com>
In-Reply-To: <48a545f5-d21c-85b1-20dd-b5449b88e993@redhat.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.48]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--18.079200-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Renwei.Liu@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEF1Z2VyIFttYWlsdG86
ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAwMSwg
MjAyMSA5OjE0IFBNDQo+IFRvOiBMaXUsIFJlbndlaTsgUGV0ZXIgTWF5ZGVsbA0KPiBDYzogcWVt
dS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBMaSwgQ2h1bm1pbmc7IFdl
biwNCj4gSmlhbnhpYW4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gaHcvYXJtL3NtbXV2Mzog
U2ltcGxpZnkgcmFuZ2UgaW52YWxpZGF0aW9uDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDkvMS8yMSA4
OjMzIEFNLCBMaXUsIFJlbndlaSB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogRXJpYyBBdWdlciBbbWFpbHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0N
Cj4gPj4gU2VudDogVHVlc2RheSwgQXVndXN0IDMxLCAyMDIxIDEwOjQ2IFBNDQo+ID4+IFRvOiBM
aXUsIFJlbndlaTsgUGV0ZXIgTWF5ZGVsbA0KPiA+PiBDYzogcWVtdS1hcm1Abm9uZ251Lm9yZzsg
cWVtdS1kZXZlbEBub25nbnUub3JnOyBMaSwgQ2h1bm1pbmc7IFdlbiwNCj4gPj4gSmlhbnhpYW4N
Cj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gaHcvYXJtL3NtbXV2MzogU2ltcGxpZnkgcmFu
Z2UgaW52YWxpZGF0aW9uDQo+ID4+DQo+ID4+IEhpIExpdSwNCj4gPj4NCj4gPj4gT24gOC8yMy8y
MSA5OjUwIEFNLCBMaXUsIFJlbndlaSB3cm90ZToNCj4gPj4+IFNpbXBsaWZ5IHJhbmdlIGludmFs
aWRhdGlvbiB3aGljaCBjYW4gYXZvaWQgdG8gaXRlcmF0ZSBvdmVyIGFsbA0KPiA+Pj4gaW90bGIg
ZW50cmllcyBtdWx0aS10aW1lcy4gRm9yIGluc3RhbmNlIGludmFsaWRhdGlvbnMgcGF0dGVybnMg
bGlrZQ0KPiA+Pj4gImludmFsaWRhdGUgMzIgNGtCIHBhZ2VzIHN0YXJ0aW5nIGZyb20gMHhmZmFj
ZDAwMCIgbmVlZCB0byBpdGVyYXRlDQo+ID4+IG92ZXINCj4gPj4+IGFsbCBpb3RsYiBlbnRyaWVz
IDYgdGltZXMgKG51bV9wYWdlczogMSwgMiwgMTYsIDgsIDQsIDEpLiBJdCBvbmx5DQo+ID4+IG5l
ZWRzDQo+ID4+PiB0byBpdGVyYXRlIG92ZXIgYWxsIGlvdGxiIGVudHJpZXMgb25jZSB3aXRoIG5l
dyBpbXBsZW1lbnRhdGlvbi4NCj4gPj4gVGhpcyB3b3VsZG4ndCB3b3JrLiBUaGlzIHJldmVydHMg
Y29tbWl0DQo+ID4+IDZkOWNkMTE1YjlkZiAoImh3L2FybS9zbW11djM6IEVuZm9yY2UgaW52YWxp
ZGF0aW9uIG9uIGEgcG93ZXIgb2YgdHdvDQo+ID4+IHJhbmdlIikNCj4gPj4gd2hpY2ggaXMgbWFu
ZGF0ZWQgZm9yIFZGSU8gYW5kIHZpcnRpbyB0byB3b3JrLiBJT1RMQiBpbnZhbGlkYXRpb25zDQo+
IG11c3QNCj4gPj4gYmUgbmF0dXJhbGx5IGFsaWduZWQgYW5kIHdpdGggYSBwb3dlciBvZiAyIHJh
bmdlLCBoZW5jZSB0aGlzDQo+IGl0ZXJhdGlvbi4NCj4gPj4NCj4gPj4gVGhhbmtzDQo+ID4+DQo+
ID4+IEVyaWMNCj4gPiBIaSBFcmljLA0KPiA+DQo+ID4gQ291bGQgeW91IHRyeSB0aGUgcGF0Y2gg
Zmlyc3RseT8gSSB3YW50IHRvIGtub3cgd2hldGhlciBpdCdzIGZhaWxlZA0KPiA+IGluIHlvdXIg
YXBwbGljYXRpb24gc2NlbmFyaW8gd2l0aCB0aGlzIGltcGxlbWVudGF0aW9uLg0KPiBUaGVyZSBh
cmUgbWFueSB0ZXN0IGNhc2VzLCB2aXJ0aW8tcGNpLCB2aG9zdCwgVkZJTywgLi4uDQo+ID4gSSBh
Z3JlZSB3aXRoIHlvdSB0aGF0IElPVExCIGVudHJ5IG11c3QgYmUgbmF0dXJhbGx5IGFsaWduZWQg
YW5kDQo+ID4gd2l0aCBhIHBvd2VyIG9mIDIgcmFuZ2UuIEJ1dCB3ZSBjYW4gaW52YWxpZGF0ZSBt
dWx0aSBJT1RMQiBlbnRyaWVzDQo+ID4gaW4gb25lIGl0ZXJhdGlvbi4gV2UgY2hlY2sgdGhlIG92
ZXJsYXAgYmV0d2VlbiBpbnZhbGlkYXRpb24gcmFuZ2UNCj4gPiBhbmQgSU9UTEIgcmFuZ2UsIG5v
dCBjaGVjayBtYXNrLg0KPiBUaGlzIHNtbXVfaGFzaF9yZW1vdmVfYnlfYXNpZF9pb3ZhKCkgY2hh
bmdlIG9ubHkgYWZmZWN0cyB0aGUgaW50ZXJuYWwNCj4gU01NVXYzIElPVExCIGhhc2ggdGFibGUg
bG9va3VwLiBIb3dldmVyIHRoZXJlIGFyZSBhbHNvIElPVExCDQo+IGludmFsaWRhdGlvbiBub3Rp
ZmljYXRpb25zIHNlbnQgdG8gY29tcG9uZW50cyB3aG8gcmVnaXN0ZXJlZCBub3RpZmllcnMsDQo+
IGllLiBzbW11djNfbm90aWZ5X2lvdmEgcGF0aC4NCj4gPiAgVGhlIGZpbmFsIHJlc3VsdCBpcyBz
YW1lIHdpdGgNCj4gPiB5b3VyIGltcGxlbWVudGF0aW9uIChzcGxpdCB0byBtdWx0aSB0aW1lcyB3
aXRoIGEgcG93ZXIgb2YgMiByYW5nZSkuDQo+ID4gSSB3b25kZXIgd2h5IHdlIGNhbid0IGltcGxl
bWVudCBpdCBkaXJlY3RseSB3aGVuIHRoZSBhcHBsaWNhdGlvbiBjYW4NCj4gPiBzZW5kIGFuIGlu
dmFsaWRhdGlvbiBjb21tYW5kIHdpdGggYSBub24gcG93ZXIgb2YgMiByYW5nZS4NCj4gPiBXZSBo
YXZlIHRlc3RlZCBpdCBpbiBvdXIgYXBwbGljYXRpb24gc2NlbmFyaW8gYW5kIG5vdCBmaW5kIGFu
eSBmYWlsLg0KPiBBc3N1bWUgdGhlIGRyaXZlciBpbnZhbGlkYXRlcyA1ICogNGtCIHBhZ2VzID0w
eDUwMDAgcmFuZ2UuwqAgV2l0aG91dCB0aGUNCj4gbG9vcCB5b3UgcmVtb3ZlZA0KPiANCj4gaW4g
c21tdXYzX25vdGlmeV9pb3ZhKCnCoCBldmVudC5lbnRyeS5hZGRyX21hc2sgPSBudW1fcGFnZXMg
KiAoMSA8PA0KPiBncmFudWxlKSAtIDEgPSAweDRGRkYuIFRoaXMgYWRkcl9tYXNrwqAgaXMgYW4g
aW52YWxpZCBtYXNrDQo+IHRoaXMgZW50cnkgaXMgcGFzc2VkIHRvIGNvbXBvbmVudHMgd2hvIHJl
Z2lzdGVyZWQgaW52YWxpZGF0aW9uDQo+IG5vdGlmaWVycw0KPiBzdWNoIGFzIHZob3N0IG9yIHZm
aW8uIGZvciBpbnN0YW5jZSBpbiBWRklPIHlvdSBoYXZlICcmJyBvcHMgb24gdGhlDQo+IGFkZHJf
bWFzay4NCj4gYWRkcl9tYXNrIGlzIGV4cGVjdGVkIHRvIGJlIGEgbWFzayBvZiBhIHBvd2VyIG9m
IDIgcmFuZ2UuDQo+IA0KPiBEb2VzIGl0IGNsYXJpZnk/DQo+IA0KPiBUaGFua3MNCj4gDQo+IEVy
aWMNCkhpIEVyaWMNCg0KR290IGl0LCB0aGFua3MgYSBsb3QgZm9yIHlvdXIgY2xhcmlmaWNhdGlv
bi4NCkkgZG9uJ3QgY29uc2lkZXIgdGhlIGZ1cnRoZXIgbm90aWZpZXIgZnJvbSB2aG9zdCBvciB2
ZmlvIGluZGVlZCwNCmJlY2F1c2UgdGhleSBhcmUgbm90IHJlZ2lzdGVyZWQgaW4gb3VyIGFwcGxp
Y2F0aW9uIHNjZW5hcmlvLg0KTGV0J3Mga2VlcCB0aGUgcHJldmlvdXMgaW1wbGVtZW50YXRpb24g
YW5kIGlnbm9yZSB0aGlzIHBhdGNoLg0KDQpUaGFua3MNClJlbndlaSBMaXUNCg0KPiA+DQo+ID4g
SW4gYWRkaXRpb24sIGZyb20gdGhlIGNvZGUgaW1wbGVtZW50YXRpb24sIHNtbXVfaW90bGJfaW52
X2lvdmEoKQ0KPiA+IHNob3VsZCBiZSBPSy4gSW4gYW5vdGhlciBjYWxsIHNtbXV2M19pbnZfbm90
aWZpZXJzX2lvdmEoKSAtPg0KPiA+IHNtbXV2M19ub3RpZnlfaW92YSgpIC0+IG1lbW9yeV9yZWdp
b25fbm90aWZ5X2lvbW11X29uZSgpLA0KPiA+IGl0IGFsc28gY2hlY2tzIHJhbmdlIG92ZXJsYXAu
IFNvIGl0IHNob3VsZCBiZSBPSyBpZiB0aGUgcmFuZ2UNCj4gPiBpcyBub3QgYSBwb3dlciBvZiAy
Lg0KPiA+DQo+ID4gQ291bGQgeW91IHRha2UgYSBsb29rIGF0IGl0IGFnYWluPw0KPiA+DQo+ID4g
VGhhbmtzDQo+ID4gUmVud2VpIExpdQ0KDQo=

