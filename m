Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444183B0D38
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 20:51:59 +0200 (CEST)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvlV7-0003XH-PX
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 14:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvlTk-0002nw-0d
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 14:50:32 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:16028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvlTi-0005ay-5C
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 14:50:31 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id CC0D01005691; Tue, 22 Jun 2021 11:50:27 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (unknown [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.tachyum.com (Postfix) with ESMTPS id 8C4C61005283;
 Tue, 22 Jun 2021 11:50:26 -0700 (PDT)
Received: from THQ-EX3.tachyum.com (10.7.1.26) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 22 Jun
 2021 11:50:27 -0700
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX3.tachyum.com
 (10.7.1.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 22 Jun
 2021 11:50:26 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Tue, 22 Jun 2021 11:50:26 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: Denormal input handling
Thread-Topic: Denormal input handling
Thread-Index: AddSVLVuQ70cTMk8SjeoZZpZvpdwcwUnLwIAAA+pMgAAC7w14AAN56Pg
Date: Tue, 22 Jun 2021 18:50:26 +0000
Message-ID: <12642a513386433f8697de0be358e6e4@tachyum.com>
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
 <c021f386dcfb49aca2ab0c01f66bccc2@tachyum.com>
 <08ba29ee-d5c0-8c61-0efc-4c03fe9da944@linaro.org>
 <c1b992e063414da88b686e8f6e9642f2@tachyum.com>
In-Reply-To: <c1b992e063414da88b686e8f6e9642f2@tachyum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.100.197]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mmorrell@tachyum.com;
 helo=mx1.tachyum.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T0ssIEkndmUgZG9uZSBtb3JlIHRlc3RpbmcuICBJJ20gbm90IHN1cmUgaWYgd2UgbmVlZCBhbnkg
c3BlY2lhbGl6YXRpb24sIGJ1dCB0aGUgc2V0dGluZyBmb3IgZmxvYXRfZmxhZ19pbm9ybV9kZW5v
cm1hbCBpc24ndCByaWdodCBmb3IgeDg2Lg0KDQpJdCBpcyBzZXQgdW5jb25kaXRpb25hbGx5IHdo
ZW4gZmx1c2hfaW5wdXRzX3RvX3plcm8gaXMgZmFsc2UsIGJ1dCBpdCBuZWVkcyB0byB0YWtlIGlu
dG8gYWNjb3VudCB0aGUgb3RoZXIgb3BlcmFuZChzKS4gICBHaXZlbiAiZGVub3JtIC8gMCIgb3Ig
YW55IGluc3RydWN0aW9uIHdpdGggYSBOYU4gb3BlcmFuZCwgZmxvYXRfZmxhZ19pbm9ybV9kZW5v
cm1hbCBzaG91bGQgbm90IGJlIHNldCAoYW5kIHRoYXQgd2F5LCB0aGUgREUgYml0IGluIE1YQ1NS
IHdvbid0IGJlIHNldCB3aGVuIGl0IHNob3VsZG4ndCBiZSkuDQoNCiAgIE1pY2hhZWwNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1pY2hhZWwgTW9ycmVsbCANClNlbnQ6IE1v
bmRheSwgSnVuZSAyMSwgMjAyMSA1OjU3IFBNDQpUbzogJ1JpY2hhcmQgSGVuZGVyc29uJyA8cmlj
aGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KU3ViamVj
dDogUkU6IERlbm9ybWFsIGlucHV0IGhhbmRsaW5nDQoNClJpY2hhcmQsDQoNCkkgd2FzIHVuZGVy
IHRoZSBtaXN0YWtlbiBpbXByZXNzaW9uIHRoYXQgeW91ciBjaGFuZ2VzIGluIHRoaXMgYXJlYSAo
c3BsaXR0aW5nIGZsb2F0X2ZsYWdfaW5wdXRfZGVub3JtYWwgaW50byAyIGZsYWdzKSB3ZXJlIGFs
cmVhZHkgY2hlY2tlZCBpbiwgYnV0IEkgc2VlIG5vdyB0aGF0IGlzIG5vdCB0aGUgY2FzZS4gIEkg
c2hvdWxkIHByb2JhYmx5IHdhaXQgdW50aWwgdGhhdCBpcyBkb25lIGJlZm9yZSBJIHRyeSB0byBj
bGFpbSB0aGVyZSBhcmUgYWRkaXRpb25hbCBpc3N1ZXMgaGVyZS4NCg0KICAgIE1pY2hhZWwNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KU2VudDogTW9uZGF5LCBKdW5lIDIxLCAyMDIxIDQ6
MzAgUE0NClRvOiBNaWNoYWVsIE1vcnJlbGwgPG1tb3JyZWxsQHRhY2h5dW0uY29tPjsgcWVtdS1k
ZXZlbEBub25nbnUub3JnDQpTdWJqZWN0OiBSZTogRGVub3JtYWwgaW5wdXQgaGFuZGxpbmcNCg0K
T24gNi8yMS8yMSA0OjEzIFBNLCBNaWNoYWVsIE1vcnJlbGwgd3JvdGU6DQo+IEkgaGF2ZSBhbm90
aGVyIGNvdXBsZSBvZiB0aG91Z2h0cyBhcm91bmQgaW5wdXQgZGVub3JtYWwgaGFuZGxpbmcuDQo+
IA0KPiBUaGUgZmlyc3QgaXMgc3RyYWlnaHRmb3J3YXJkLsKgIEkgbm90aWNlZCB0aGF0IHRoZSBB
YXJjaDY0IHBvcnQgZG9lc24ndCANCj4gcmVwb3J0IGlucHV0IGRlbm9ybWFscyAoSSBjb3VsZCBu
b3QgZmluZCBhbnkgY29kZSB3aGljaCBzZXRzIHRoZSBJREMgDQo+IGJpdCBpbiB0aGUgRlBTUiku
wqAgSSBmb3VuZCBjb2RlIGluIHRoZSBhcm0gKG5vdCBhYXJjaDY0KSBwb3J0IHRoYXQgDQo+IHNl
dHMgb3RoZXIgYml0cyBsaWtlIElYQywgYnV0IG5vdGhpbmcgZm9yIElEQy7CoMKgIElzIHRoYXQg
c2ltcGx5IGJlY2F1c2Ugbm8gb25lIGhhcyBib3RoZXJlZCB0byBhZGQgdGhpcyBzdXBwb3J0Pw0K
DQpJdCdzIGJlY2F1c2Ugd2UgZmFpbGVkIHRvIHVzZSBzeW1ib2xpYyBjb25zdGFudHMuICBTZWUg
dmZwX2V4Y2VwdGJpdHNfZnJvbV9ob3N0LiAgV2hpY2gNCippcyogdXNlZCBmb3IgYm90aCBhYXJj
aDY0IGFuZCBhcm0uDQoNCg0KPiBUaGUgc2Vjb25kIGNvbmNlcm5zIHN1cHBvcnQgZm9yIGNhc2Vz
IHdoZXJlIG11bHRpcGxlIGV4Y2VwdGlvbiANCj4gY29uZGl0aW9ucyBvY2N1ci7CoMKgIEkgaGFk
IG9yaWdpbmFsbHkgdGhvdWdodCB0aGF0IGRlbm9ybWFsIGlucHV0IA0KPiBoYW5kbGluZyB3b3Vs
ZCBiZSBvcnRob2dvbmFsIHRvIGV2ZXJ5dGhpbmcgZWxzZSBhbmQgc28gYSBjYXNlIGxpa2UgDQo+
ICJzTmFOIMKgKyBkZW5vcm0iIHdvdWxkIHNldCBib3RoIHRoZSBpbnZhbGlkIGFuZCBpbnB1dCBk
ZW5vcm1hbCBmbGFncyANCj4gb3IgImRlbm9ybSAvIDAiIHdvdWxkIHNldCBib3RoIGlkaXZkZSBi
eSB6ZXJvIGFuZCBpbnB1dCBkZW5vcm1hbCwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyB0cnVl
IGZvciBhdCBsZWFzdCBzb21lIGFyY2hpdGVjdHVyZXMuwqAgUGVyaGFwcyBzb21lIHNwZWNpYWxp
emF0aW9uIGlzIG5lZWRlZCBoZXJlPw0KDQpJZiB5b3UndmUgZ290IGEgc3BlY2lmaWMgZXhhbXBs
ZSwgd2UgY2FuIGxvb2sgYXQgaXQuICBUaGVyZSdzIG5vIHBvaW50IGFkZGluZyBzcGVjaWFsaXph
dGlvbiB0aGF0IGlzbid0IGdvaW5nIHRvIGJlIHVzZWQuDQoNCg0Kcn4NCg==

