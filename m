Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFE3AF9A4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:41:35 +0200 (CEST)
Received: from localhost ([::1]:38244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTXq-00041P-TI
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvTVl-0002Y5-Sd
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:39:26 -0400
Received: from mx2.tachyum.com ([50.229.46.110]:14893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvTVk-0001L7-5d
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:39:25 -0400
Received: by mx2.tachyum.com (Postfix, from userid 1000)
 id 66E8210055F6; Mon, 21 Jun 2021 16:39:23 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (thq-ex1.tachyum.com [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx2.tachyum.com (Postfix) with ESMTPS id AF12C10055F3;
 Mon, 21 Jun 2021 16:39:17 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 21 Jun
 2021 16:39:16 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Mon, 21 Jun 2021 16:39:16 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: Denormal input handling
Thread-Topic: Denormal input handling
Thread-Index: AddSVLVuQ70cTMk8SjeoZZpZvpdwcwUnLwIAAA+pMgAADokY4A==
Date: Mon, 21 Jun 2021 23:39:16 +0000
Message-ID: <996a3dabba094d9781a4c798d88306ff@tachyum.com>
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
 <c021f386dcfb49aca2ab0c01f66bccc2@tachyum.com>
 <08ba29ee-d5c0-8c61-0efc-4c03fe9da944@linaro.org>
In-Reply-To: <08ba29ee-d5c0-8c61-0efc-4c03fe9da944@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.100.197]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=50.229.46.110; envelope-from=mmorrell@tachyum.com;
 helo=mx2.tachyum.com
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

VGhhbmtzIGZvciBwb2ludGluZyBtZSB0byB2ZnBfZXhjZXB0Yml0c19mcm9tX2hvc3QuICBJIHNl
ZSBpdCBzZXR0aW5nIGJpdCA3IGlmIGZsYWdfaW5wdXRfZGVub3JtYWwgaXMgc2V0LCBidXQgaXQg
ZG9lcyBub3Qgc2VlbSB0byB3b3JrLiAgIEkgbmV2ZXIgc2VlIHRoYXQgYml0IHNldC4NCg0KQXMg
Zm9yIHRoZSBzcGVjaWFsaXphdGlvbiwgcGVyaGFwcyB3ZSBkb24ndCBuZWVkIGl0IGlmIGFsbCBh
cmNoaXRlY3R1cmVzIGFyZSB0aGUgc2FtZSwgYnV0IHRoZSBjdXJyZW50IGNvZGUgZG9lc24ndCBt
YXRjaCBhbnkgYXJjaGl0ZWN0dXJlIEknbSBhd2FyZSBvZi4gIEkgZ2F2ZSB0aGUgZXhhbXBsZSBv
ZiAic05hTiArIGRlbm9ybSIuICAgVGhlIEhXIHdpbGwgbm90IHNldCB0aGUgImlucHV0IGRlbm9y
bWFsIiBmbGFnLCBidXQgcWVtdSB3aWxsLg0KDQpJZiB5b3Ugd2FudCB0byBzZWUgbXkgdGVzdCBj
b2RlLCBJIGNhbiBzZW5kIHRoYXQuDQoNCiAgIE1pY2hhZWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPiANClNlbnQ6IE1vbmRheSwgSnVuZSAyMSwgMjAyMSA0OjMwIFBNDQpUbzogTWljaGFl
bCBNb3JyZWxsIDxtbW9ycmVsbEB0YWNoeXVtLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0K
U3ViamVjdDogUmU6IERlbm9ybWFsIGlucHV0IGhhbmRsaW5nDQoNCk9uIDYvMjEvMjEgNDoxMyBQ
TSwgTWljaGFlbCBNb3JyZWxsIHdyb3RlOg0KPiBJIGhhdmUgYW5vdGhlciBjb3VwbGUgb2YgdGhv
dWdodHMgYXJvdW5kIGlucHV0IGRlbm9ybWFsIGhhbmRsaW5nLg0KPiANCj4gVGhlIGZpcnN0IGlz
IHN0cmFpZ2h0Zm9yd2FyZC7CoCBJIG5vdGljZWQgdGhhdCB0aGUgQWFyY2g2NCBwb3J0IGRvZXNu
J3QgDQo+IHJlcG9ydCBpbnB1dCBkZW5vcm1hbHMgKEkgY291bGQgbm90IGZpbmQgYW55IGNvZGUg
d2hpY2ggc2V0cyB0aGUgSURDIA0KPiBiaXQgaW4gdGhlIEZQU1IpLsKgIEkgZm91bmQgY29kZSBp
biB0aGUgYXJtIChub3QgYWFyY2g2NCkgcG9ydCB0aGF0IA0KPiBzZXRzIG90aGVyIGJpdHMgbGlr
ZSBJWEMsIGJ1dCBub3RoaW5nIGZvciBJREMuwqDCoCBJcyB0aGF0IHNpbXBseSBiZWNhdXNlIG5v
IG9uZSBoYXMgYm90aGVyZWQgdG8gYWRkIHRoaXMgc3VwcG9ydD8NCg0KSXQncyBiZWNhdXNlIHdl
IGZhaWxlZCB0byB1c2Ugc3ltYm9saWMgY29uc3RhbnRzLiAgU2VlIHZmcF9leGNlcHRiaXRzX2Zy
b21faG9zdC4gIFdoaWNoDQoqaXMqIHVzZWQgZm9yIGJvdGggYWFyY2g2NCBhbmQgYXJtLg0KDQoN
Cj4gVGhlIHNlY29uZCBjb25jZXJucyBzdXBwb3J0IGZvciBjYXNlcyB3aGVyZSBtdWx0aXBsZSBl
eGNlcHRpb24gY29uZGl0aW9ucyBvY2N1ci7CoMKgIEkgaGFkIA0KPiBvcmlnaW5hbGx5IHRob3Vn
aHQgdGhhdCBkZW5vcm1hbCBpbnB1dCBoYW5kbGluZyB3b3VsZCBiZSBvcnRob2dvbmFsIHRvIGV2
ZXJ5dGhpbmcgZWxzZSBhbmQgDQo+IHNvIGEgY2FzZSBsaWtlICJzTmFOIMKgKyBkZW5vcm0iIHdv
dWxkIHNldCBib3RoIHRoZSBpbnZhbGlkIGFuZCBpbnB1dCBkZW5vcm1hbCBmbGFncyBvciANCj4g
ImRlbm9ybSAvIDAiIHdvdWxkIHNldCBib3RoIGlkaXZkZSBieSB6ZXJvIGFuZCBpbnB1dCBkZW5v
cm1hbCwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyANCj4gdHJ1ZSBmb3IgYXQgbGVhc3Qgc29t
ZSBhcmNoaXRlY3R1cmVzLsKgIFBlcmhhcHMgc29tZSBzcGVjaWFsaXphdGlvbiBpcyBuZWVkZWQg
aGVyZT8NCg0KSWYgeW91J3ZlIGdvdCBhIHNwZWNpZmljIGV4YW1wbGUsIHdlIGNhbiBsb29rIGF0
IGl0LiAgVGhlcmUncyBubyBwb2ludCBhZGRpbmcgDQpzcGVjaWFsaXphdGlvbiB0aGF0IGlzbid0
IGdvaW5nIHRvIGJlIHVzZWQuDQoNCg0Kcn4NCg==

