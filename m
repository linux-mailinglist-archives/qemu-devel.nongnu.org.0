Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7521231F9EF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:32:31 +0100 (CET)
Received: from localhost ([::1]:35190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5tW-0001e9-Gn
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lD5ex-0006jj-SH
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:17:29 -0500
Received: from smtp1.axis.com ([195.60.68.17]:23853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lD5eu-0007rh-1v
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1613740644;
 x=1645276644; h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x0A5uLhNfzE2PV+NQbYLM+6w3mpYzcv8ADAqPOHSkFw=;
 b=ECEJSzXYln/HzpQ6vemYYLuYXO8ML0UDUux0Xk24WA/o0KuJiKOMNMUS
 GI0/0dFqdwt7uiBWg2sMBdM3181Kj/jhc4Kt6xQVwe65sP/mM+rSUBbeI
 c3chc5TlS6rYZ2Xy8hnbSNMzFtHsHD8CwJlePO64zLx92bAS2NM/CINPt
 HUMrgFFNKIYFcBaNVnLYpMbdtan+qi0vpHoTa4dbRU1tDP4MeMGS+sz3N
 O/BAbRHRu2oDLdH3x+wDS6OJLROXp1Ii8MHkQn//sMWL8MBtBgBgn0hwE
 FAfACq/T2BJsBcQUjkKX5fZvU6UoH18QeAvZe73T89/YiBoFsw3VEPARz Q==;
From: =?utf-8?B?U3RlZmFuIFNhbmRzdHLDtm0=?= <Stefan.Sandstrom@axis.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v3] Correct CRIS TCG register lifetime management
Thread-Topic: [PATCH v3] Correct CRIS TCG register lifetime management
Thread-Index: AQHXBq2DxXJ7jOW0ZkyXnteGzLL7GapfRAqAgAAg8IA=
Date: Fri, 19 Feb 2021 13:17:21 +0000
Message-ID: <3E5348BB-6E59-4E6B-8626-EFDCA6CFED1B@axis.com>
References: <20210219105349.11582-1-stefans@axis.com>
 <20210219111925.GQ477672@toto>
In-Reply-To: <20210219111925.GQ477672@toto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-ID: <151BEB5AD3E57F49A2E216FFFC861B3B@exhub.se.axis.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=195.60.68.17;
 envelope-from=Stefan.Sandstrom@axis.com; helo=smtp1.axis.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgRWRnYXIsDQoNCj4gT24gMTkgRmViIDIwMjEsIGF0IDEyOjE5LCBFZGdhciBFLiBJZ2xlc2lh
cyA8ZWRnYXIuaWdsZXNpYXNAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgRmViIDE5
LCAyMDIxIGF0IDExOjUzOjQ4QU0gKzAxMDAsIFN0ZWZhbiBTYW5kc3Ryw7ZtIHdyb3RlOg0KPj4g
RnJvbTogU3RlZmFuIFNhbmRzdHJvbSA8c3RlZmFuc0BheGlzLmNvbT4NCj4+IA0KPj4gQWRkIGFu
ZCBmaXggZGVhbGxvY2F0aW9uIG9mIHRlbXBvcmFyeSBUQ0cgcmVnaXN0ZXJzIGluIENSSVMgY29k
ZQ0KPj4gZ2VuZXJhdGlvbi4NCj4gDQo+IFRoYW5rcyBTdGVmYW4sDQo+IA0KPiBUaGVyZSdzIHN0
aWxsIGEgY291cGxlIG9mIG1pbm9yIHN0eWxpc3RpYyBpc3N1ZXMuDQo+IA0KPiBUaGUgU3ViamVj
dC9TdW1tYXJ5IHNob3VsZCBiZSBwcmVmaXhlZCB3aXRoIHRoZSBjb2RlIGFyZWEgeW91J3JlDQo+
IGNoYW5naW5nLiBJJ2Qgc3VnZ2VzdCBjaGFuZ2luZyBpdA0KPiANCj4gZnJvbToNCj4gQ29ycmVj
dCBDUklTIFRDRyByZWdpc3RlciBsaWZldGltZSBtYW5hZ2VtZW50DQo+IHRvOg0KPiB0YXJnZXQv
Y3JpczogUGx1ZyBsZWFrYWdlIG9mIFRDRyB0ZW1wb3Jhcmllcw0KDQpPSywgbWFrZXMgc2Vuc2Uu
DQoNCj4gDQo+IFdlIGFsc28gdHJ5IHRvIGF2b2lkIHVucmVsYXRlZCB3aGl0ZXNwYWNlIGNoYW5n
ZXMuDQo+IEkndmUgY29tbWVudGVkIG9uIHRoZSAyIEkgZm91bmQgaW5saW5lLg0KPiBXb3VsZCBi
ZSBnb29kIGlmIHlvdSBjb3VsZCByZW1vdmUgdGhvc2UgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0K
T29wcywgc29ycnkgYWJvdXQgdGhhdC4NCkkndmUgcG9zdGVkIHY0IG9mIHRoZSBwYXRjaCB0aGF0
IGZpeGVzIHRoZSBzdWJqZWN0IGFuZCB3aGl0ZS1zcGFjZXMuDQoNClRoYW5rcywNCi1zdGVmYW4N
Cg0KPiANCj4gT3RoZXIgdGhhbiB0aGF0LCB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4NCj4g
U28sIHdpdGggdGhvc2UgaXNzdWVzIGZpeGVkLCBmZWVsIGZyZWUgdG8gYWRkIHRoZSBmb2xsb3dp
bmcgdGFnczoNCj4gDQo+IFRlc3RlZC1ieTogRWRnYXIgRS4gSWdsZXNpYXMgPGVkZ2FyLmlnbGVz
aWFzQHhpbGlueC5jb20+DQo+IFJldmlld2VkLWJ5OiBFZGdhciBFLiBJZ2xlc2lhcyA8ZWRnYXIu
aWdsZXNpYXNAeGlsaW54LmNvbT4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gRWRnYXINCj4gDQo+
PiANCj4+IENoYW5nZS1JZDogSTE3ZmNlNWQ5NWJkYzQ0MTgzMzdiYTg4NWQ1M2JhOTdhZmIxYmFm
Y2MNCj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBTYW5kc3Ryw7ZtIDxzdGVmYW5zQGF4aXMuY29t
Pg0KPj4gLS0tDQo+PiB0YXJnZXQvY3Jpcy90cmFuc2xhdGUuYyAgICAgICAgIHwgMTI3ICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+PiB0YXJnZXQvY3Jpcy90cmFuc2xhdGVfdjEw
LmMuaW5jIHwgIDcwICsrKysrKysrKysrKy0tLS0tLQ0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAxMzgg
aW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS90YXJn
ZXQvY3Jpcy90cmFuc2xhdGUuYyBiL3RhcmdldC9jcmlzL3RyYW5zbGF0ZS5jDQo+PiBpbmRleCBj
ODkzZjg3N2FiLi4yYjM1ZDgxOGRkIDEwMDY0NA0KPj4gLS0tIGEvdGFyZ2V0L2NyaXMvdHJhbnNs
YXRlLmMNCj4+ICsrKyBiL3RhcmdldC9jcmlzL3RyYW5zbGF0ZS5jDQo+PiBAQCAtMTcyLDE0ICsx
NzIsMjEgQEAgc3RhdGljIGludCBwcmVnX3NpemVzW10gPSB7DQo+PiAgICAgdGNnX2dlbl9sZF90
bCh0biwgY3B1X2Vudiwgb2Zmc2V0b2YoQ1BVQ1JJU1N0YXRlLCBtZW1iZXIpKQ0KPj4gI2RlZmlu
ZSB0X2dlbl9tb3ZfZW52X1ROKG1lbWJlciwgdG4pIFwNCj4+ICAgICB0Y2dfZ2VuX3N0X3RsKHRu
LCBjcHVfZW52LCBvZmZzZXRvZihDUFVDUklTU3RhdGUsIG1lbWJlcikpDQo+PiArI2RlZmluZSB0
X2dlbl9tb3ZpX2Vudl9UTihtZW1iZXIsIGMpIFwNCj4+ICsgICAgZG8geyBcDQo+PiArICAgICAg
ICBUQ0d2IHRjID0gdGNnX2NvbnN0X3RsKGMpOyBcDQo+PiArICAgICAgICB0X2dlbl9tb3ZfZW52
X1ROKG1lbWJlciwgdGMpOyBcDQo+PiArICAgICAgICB0Y2dfdGVtcF9mcmVlKHRjKTsgXA0KPj4g
KyAgICB9IHdoaWxlICgwKQ0KPj4gKw0KPiANCj4gUmVtb3ZlIHRoaXMgZXh0cmEgYmxhbmsgbGlu
ZS4NCj4gDQo+IA0KPj4gDQo+PiBzdGF0aWMgaW5saW5lIHZvaWQgdF9nZW5fbW92X1ROX3ByZWco
VENHdiB0biwgaW50IHIpDQo+PiB7DQo+PiAgICAgYXNzZXJ0KHIgPj0gMCAmJiByIDw9IDE1KTsN
Cj4+ICAgICBpZiAociA9PSBQUl9CWiB8fCByID09IFBSX1daIHx8IHIgPT0gUFJfRFopIHsNCj4+
IC0gICAgICAgIHRjZ19nZW5fbW92X3RsKHRuLCB0Y2dfY29uc3RfdGwoMCkpOw0KPj4gKyAgICAg
ICAgdGNnX2dlbl9tb3ZpX3RsKHRuLCAwKTsNCj4+ICAgICB9IGVsc2UgaWYgKHIgPT0gUFJfVlIp
IHsNCj4+IC0gICAgICAgIHRjZ19nZW5fbW92X3RsKHRuLCB0Y2dfY29uc3RfdGwoMzIpKTsNCj4+
ICsgICAgICAgIHRjZ19nZW5fbW92aV90bCh0biwgMzIpOw0KPj4gICAgIH0gZWxzZSB7DQo+PiAg
ICAgICAgIHRjZ19nZW5fbW92X3RsKHRuLCBjcHVfUFJbcl0pOw0KPj4gICAgIH0NCj4+IEBAIC0y
MDQsNiArMjExLDggQEAgc3RhdGljIGlubGluZSB2b2lkIHRfZ2VuX21vdl9wcmVnX1ROKERpc2Fz
Q29udGV4dCAqZGMsIGludCByLCBUQ0d2IHRuKQ0KPj4gICAgIH0NCj4+IH0NCj4+IA0KPj4gKw0K
Pj4gKw0KPiANCj4gUmVtb3ZlIHRoaXMgdW5yZWxhdGVkIGJsYW5rIGxpbmVzLg0KPiANCj4gQ2hl
ZXJzLA0KPiBFZGdhcg0KDQo=

