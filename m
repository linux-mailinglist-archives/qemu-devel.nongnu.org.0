Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E983FD408
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 08:54:40 +0200 (CEST)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLK8t-0001u0-Tp
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 02:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mLK60-0007Fp-Sf; Wed, 01 Sep 2021 02:51:41 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:56961
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mLK5w-0006Xh-Dq; Wed, 01 Sep 2021 02:51:40 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1630479088; h=from:subject:to:date:message-id;
 bh=C/oiNZ+c3yUvQrSGM+P93XmA/Kq76qx4O9HadQyXkQ0=;
 b=d9/wX6Uzj8deixcDdigX5dPQV8uSnsL1f1wTpYSOisIAjPLHRIebgDnkvP2H0xHrHcqebEJAbC9
 Wva+RxsnERFc0cFVveesIZ8gt6PdW92sUNXpNUqBhTYIXdalCiQgKbcAMhiWJGlSytSdcOav4EslN
 swa33nkveu+XQY6hU9Y=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Wed, 1 Sep 2021 14:51:28 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, chunming
 <chunming_li1234@163.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: RE: [PATCH v5 3/4] hw/arm/virt: Update SMMU v3 creation to support
 non PCI/PCIe device connection
Thread-Topic: [PATCH v5 3/4] hw/arm/virt: Update SMMU v3 creation to support
 non PCI/PCIe device connection
Thread-Index: AQHXmYiJTSJzKuJUX0iuzYVh/sJn/KuNK4EAgAGbqsA=
Date: Wed, 1 Sep 2021 06:51:27 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B0114302B93@SHASXM03.verisilicon.com>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-4-git-send-email-chunming_li1234@163.com>
 <c98c4098-1553-51c0-8323-ad20626f9897@redhat.com>
In-Reply-To: <c98c4098-1553-51c0-8323-ad20626f9897@redhat.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.44.37]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--20.168900-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBBdWdlciBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDMxLCAy
MDIxIDEwOjEzIFBNDQo+IFRvOiBjaHVubWluZzsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnDQo+
IENjOiBxZW11LWFybUBub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7IFdlbiwgSmlh
bnhpYW47IExpdSwNCj4gUmVud2VpOyBMaSwgQ2h1bm1pbmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAzLzRdIGh3L2FybS92aXJ0OiBVcGRhdGUgU01NVSB2MyBjcmVhdGlvbiB0bw0KPiBzdXBw
b3J0IG5vbiBQQ0kvUENJZSBkZXZpY2UgY29ubmVjdGlvbg0KPiANCj4gSGkgQ2h1bm1pbmcsDQo+
IA0KPiBPbiA4LzI1LzIxIDEwOjA4IEFNLCBjaHVubWluZyB3cm90ZToNCj4gPiBGcm9tOiBjaHVu
bWluZyA8Y2h1bm1pbmcubGlAdmVyaXNpbGljb24uY29tPg0KPiA+DQo+ID4gICAuIEFkZCAic21t
dXYzX3NpZG1hcCIgdG8gc2V0IG5vbiBQQ0kvUENJZSBkZXZpY2VzIFNJRCB2YWx1ZQ0KPiA+ICAg
LiBQYXNzIG5vbiBQQ0kvUENJZSBkZXZpY2VzIFNJRCB2YWx1ZSB0byBTTU1VIHYzIG1vZGVsIGNy
ZWF0aW9uDQo+ID4gICAuIFN0b3JlIFNNTVUgdjMgZGV2aWNlIGluIHZpcnR1YWwgbWFjaGluZSB0
aGVuIG5vbiBQQ0kvUENJZSBjYW4gZ2V0DQo+IGl0cyBtZW1vcnkgcmVnaW9uIGxhdGVyDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBjaHVubWluZyA8Y2h1bm1pbmcubGlAdmVyaXNpbGljb24uY29t
Pg0KPiA+IC0tLQ0KPiA+ICBody9hcm0vdmlydC5jICAgICAgICAgfCAxOCArKysrKysrKysrKysr
KysrKy0NCj4gPiAgaW5jbHVkZS9ody9hcm0vdmlydC5oIHwgIDIgKysNCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvaHcvYXJtL3ZpcnQuYyBiL2h3L2FybS92aXJ0LmMNCj4gPiBpbmRleCA4MWVkYTQ2YjBi
Li5jM2ZkMzBlMDcxIDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gPiArKysgYi9o
dy9hcm0vdmlydC5jDQo+ID4gQEAgLTIwNCw2ICsyMDQsMTAgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KnZhbGlkX2NwdXNbXSA9IHsNCj4gPiAgICAgIEFSTV9DUFVfVFlQRV9OQU1FKCJtYXgiKSwNCj4g
PiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3QgdWludDE2X3Qgc21tdXYzX3NpZG1hcFtdID0g
ew0KPiA+ICsNCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBib29sIGNwdV90eXBlX3ZhbGlk
KGNvbnN0IGNoYXIgKmNwdSkNCj4gPiAgew0KPiA+ICAgICAgaW50IGk7DQo+ID4gQEAgLTEyMjMs
NyArMTIyNyw3IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9wY2llX2lycV9tYXAoY29uc3QNCj4gTWFj
aGluZVN0YXRlICptcywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg3ICAgICAg
ICAgICAvKiBQQ0kgaXJxICovKTsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyB2b2lkIGNyZWF0
ZV9zbW11KGNvbnN0IFZpcnRNYWNoaW5lU3RhdGUgKnZtcywNCj4gPiArc3RhdGljIHZvaWQgY3Jl
YXRlX3NtbXUoVmlydE1hY2hpbmVTdGF0ZSAqdm1zLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBQQ0lCdXMgKmJ1cykNCj4gPiAgew0KPiA+ICAgICAgY2hhciAqbm9kZTsNCj4gPiBAQCAt
MTI0NCw2ICsxMjQ4LDE2IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9zbW11KGNvbnN0IFZpcnRNYWNo
aW5lU3RhdGUNCj4gKnZtcywNCj4gPg0KPiA+ICAgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9saW5r
KE9CSkVDVChkZXYpLCAicHJpbWFyeS1idXMiLA0KPiBPQkpFQ1QoYnVzKSwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmZXJyb3JfYWJvcnQpOw0KPiA+ICsNCj4gPiArICAgIHZt
cy0+c21tdXYzID0gZGV2Ow0KPiA+ICsNCj4gPiArICAgIHFkZXZfcHJvcF9zZXRfdWludDMyKGRl
diwgImxlbi1zaWQtbWFwIiwNCj4gQVJSQVlfU0laRShzbW11djNfc2lkbWFwKSk7DQo+ID4gKw0K
PiA+ICsgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc21tdXYzX3NpZG1hcCk7IGkrKykg
ew0KPiA+ICsgICAgICAgIGdfYXV0b2ZyZWUgY2hhciAqcHJvcG5hbWUgPSBnX3N0cmR1cF9wcmlu
dGYoInNpZC1tYXBbJWRdIiwNCj4gaSk7DQo+ID4gKyAgICAgICAgcWRldl9wcm9wX3NldF91aW50
MTYoZGV2LCBwcm9wbmFtZSwgc21tdXYzX3NpZG1hcFtpXSk7DQo+ID4gKyAgICB9DQo+ID4gKw0K
PiA+ICAgICAgc3lzYnVzX3JlYWxpemVfYW5kX3VucmVmKFNZU19CVVNfREVWSUNFKGRldiksICZl
cnJvcl9mYXRhbCk7DQo+ID4gICAgICBzeXNidXNfbW1pb19tYXAoU1lTX0JVU19ERVZJQ0UoZGV2
KSwgMCwgYmFzZSk7DQo+ID4gICAgICBmb3IgKGkgPSAwOyBpIDwgTlVNX1NNTVVfSVJRUzsgaSsr
KSB7DQo+ID4gQEAgLTI3NjIsNiArMjc3Niw4IEBAIHN0YXRpYyB2b2lkIHZpcnRfaW5zdGFuY2Vf
aW5pdChPYmplY3QgKm9iaikNCj4gPg0KPiA+ICAgICAgdm1zLT5pcnFtYXAgPSBhMTVpcnFtYXA7
DQo+ID4NCj4gPiArICAgIHZtcy0+c2lkbWFwID0gc21tdXYzX3NpZG1hcDsNCj4gPiArDQo+ID4g
ICAgICB2aXJ0X2ZsYXNoX2NyZWF0ZSh2bXMpOw0KPiA+DQo+ID4gICAgICB2bXMtPm9lbV9pZCA9
IGdfc3RybmR1cChBQ1BJX0JVSUxEX0FQUE5BTUU2LCA2KTsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9ody9hcm0vdmlydC5oIGIvaW5jbHVkZS9ody9hcm0vdmlydC5oDQo+ID4gaW5kZXggOTY2
MWM0NjY5OS4uZDM0MDJhNDNkZCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2h3L2FybS92aXJ0
LmgNCj4gPiArKysgYi9pbmNsdWRlL2h3L2FybS92aXJ0LmgNCj4gPiBAQCAtMTY3LDYgKzE2Nyw4
IEBAIHN0cnVjdCBWaXJ0TWFjaGluZVN0YXRlIHsNCj4gPiAgICAgIFBDSUJ1cyAqYnVzOw0KPiA+
ICAgICAgY2hhciAqb2VtX2lkOw0KPiA+ICAgICAgY2hhciAqb2VtX3RhYmxlX2lkOw0KPiA+ICsg
ICAgRGV2aWNlU3RhdGUgKnNtbXV2MzsNCj4gYXQgdGhpcyBzdGFnZSBpdCBpcyBub3Qgb2J2aW91
cyB3aHkgeW91IG5lZWQgdGhlIHNtbXV2MyBEZXZpY2VTdGF0ZSBpbg0KPiB0aGUgVmlydE1hY2hp
bmVTdGF0ZSAodGhlcmUgaXMgbm8gdXNlcikuIFlvdSBtYXkgc3F1YXNoIHRoaXMgY2hhbmdlIGlu
DQo+IHN1YnNlcXVlbnQgcGF0Y2ggaW5zdGVhZA0KDQpHb3QgaXQuIE1vdmUgdGhpcyBjaGFuZ2Ug
aW4gc3Vic2VxdWVudCBwYXRjaCBpbnN0ZWFkIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gVGhh
bmtzDQo+IA0KPiBFcmljDQo+ID4gKyAgICBjb25zdCB1aW50MTZfdCAqc2lkbWFwOw0KPiA+ICB9
Ow0KPiA+DQo+ID4gICNkZWZpbmUgVklSVF9FQ0FNX0lEKGhpZ2gpIChoaWdoID8gVklSVF9ISUdI
X1BDSUVfRUNBTSA6DQo+IFZJUlRfUENJRV9FQ0FNKQ0KDQo=

