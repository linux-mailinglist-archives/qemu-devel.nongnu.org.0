Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06137392283
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 00:07:23 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1gQ-0004a5-3b
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 18:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lm1Yp-0007JF-WC
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:59:32 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:17130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lm1Yn-0005i0-Bt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:59:31 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id C12D41005283; Wed, 26 May 2021 14:59:27 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (unknown [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.tachyum.com (Postfix) with ESMTPS id 69D651005283;
 Wed, 26 May 2021 14:59:26 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 26 May
 2021 14:59:26 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Wed, 26 May 2021 14:59:25 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: Denormal input handling
Thread-Topic: Denormal input handling
Thread-Index: AddSVLVuQ70cTMk8SjeoZZpZvpdwcwAUkiOAAAtci4A=
Date: Wed, 26 May 2021 21:59:25 +0000
Message-ID: <217fbb53d6764b4a9b63726c1344f7d9@tachyum.com>
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
 <CAFEAcA-BnxgejNgo0XFU_aegdXfN2mFr9E6xa5BPRxHLdfSt_A@mail.gmail.com>
In-Reply-To: <CAFEAcA-BnxgejNgo0XFU_aegdXfN2mFr9E6xa5BPRxHLdfSt_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.252.4]
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rmlyc3QsIEkgYXBvbG9naXplIGZvciB0aGUgZHVwbGljYXRlIHRocmVhZC4gIEkgdGhvdWdodCB0
aGUgZmlyc3QgYXR0ZW1wdCBkaWRuJ3QgZ28gdGhyb3VnaC4NCg0KSSBhZ3JlZSB3aXRoIFJpY2hh
cmQgdGhhdCB3ZSBuZWVkIGFuIGV4dHJhIGZsYWcgYml0LiAgVGhlIGN1cnJlbnQgYmVoYXZpb3Ig
aXMgbm90IHJpZ2h0IGZvciBTU0Ugb24geDg2IChpdCBsb3BscyBsaWtlIHg4NyBtaWdodCBiZSBk
aWZmZXJlbnQgc3RpbGwpLiAgIEZvciBBUk0sIHNldHRpbmcgRlBDUi5GWiB0byAxIHdpbGwgcmVz
dWx0IGluIEZQU1IuSURDIGJlaW5nIHNldCBmb3IgYSBkZW5vcm1hbCBpbnB1dCAoYW5kIHRoYXQg
aW5wdXQgd2lsbCBiZSBmbHVzaGVkIHRvIDApLCB3aGVyZWFzIGZvciB4ODYvU1NFLCBzZXR0aW5n
IE1YQ1NSLkRBWiB0byAwIHdpbGwgcmVzdWx0IGluIE1YQ1NSLkRFIGJlaW5nIHNldCBmb3IgYSBk
ZW5vcm1hbCBpbnB1dCAoYW5kIE1YQ1NSLkRBWiA9IDEgZmx1c2hlcyB0aGF0IGlucHV0IHRvIDAp
Lg0KDQpJJ20gYSBsaXR0bGUgc3VycHJpc2VkIHRoZXJlIGFyZSBubyB4ODYgdGVzdCBjYXNlcyB0
aGF0IGNvdmVyIHRoaXMuDQoNClJpY2hhcmQsIGFyZSB5b3Ugd2lsbGluZyB0byBtYWtlIHRoZSBj
aGFuZ2Ugb3IgZG8geW91IHdhbnQgbWUgdG8gdHJ5Pw0KDQpUaGFua3MsDQoNCiAgIE1pY2hhZWwN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBldGVyIE1heWRlbGwgPHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZz4gDQpTZW50OiBXZWRuZXNkYXksIE1heSAyNiwgMjAyMSAxOjE5
IFBNDQpUbzogTWljaGFlbCBNb3JyZWxsIDxtbW9ycmVsbEB0YWNoeXVtLmNvbT4NCkNjOiBxZW11
LWRldmVsQG5vbmdudS5vcmc7IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnPg0KU3ViamVjdDogUmU6IERlbm9ybWFsIGlucHV0IGhhbmRsaW5nDQoNCk9uIFdl
ZCwgMjYgTWF5IDIwMjEgYXQgMjA6MDcsIE1pY2hhZWwgTW9ycmVsbCA8bW1vcnJlbGxAdGFjaHl1
bS5jb20+IHdyb3RlOg0KPiBJIHNlZSBzdXBwb3J0IGluIFFFTVUgZm9yIGFyY2hpdGVjdHVyZXMg
d2hpY2ggaGF2ZSBhIGRlbm9ybWFsIGlucHV0IA0KPiBmbGFnIGJpdCBhbmQgdGhvc2UgdGhhdCBo
YXZlIGEgImZsdXNoIGlucHV0cyB0byB6ZXJvIiBjb250cm9sIGJpdCwgYnV0IA0KPiB0aGUgaW1w
bGVtZW50YXRpb24gaXMgbm90IHNwZWNpYWxpemFibGUgYW5kIHNlZW1zIHdyb25nIGZvciB4ODYg
YXQgDQo+IGxlYXN0Lg0KDQo+IEZvciBleGFtcGxlLCBpbiBzZl9jYW5vbmljYWxpemUsIGlmIHRo
ZSBpbnB1dCBpcyBkZW5vcm1hbCBhbmQgDQo+ICJmbHVzaF9pbnB1dHNfdG9femVybyIgaXMgdHJ1
ZSwgdGhlICJpbnB1dCBkZW5vcm1hbCIgZmxhZyBpcyBzZXQgYW5kIA0KPiB0aGVuIHRoZSB2YWx1
ZSBpcyBzZXQgdG8gYSB6ZXJvIHZhbHVlLCBhbmQgaWYgdGhlIGlucHV0IGlzIGRlbm9ybWFsIA0K
PiBhbmQgImZsdXNoX2lucHV0c190b196ZXJvIiBpcyBmYWxzZSwgdGhlbiB0aGUgaW5wdXQgaXMg
c2ltcGx5IA0KPiBub3JtYWxpemVkLg0KDQpUaGlzIGlzIHRoZSBpbnRlbmRlZCBiZWhhdmlvdXIg
LS0gaWYgYSB0YXJnZXQgYXJjaCBuZWVkcyAiZGVub3JtYWxpemVkIGlucHV0cyBzaG91bGQgYmUg
Zmx1c2hlZCB0byB6ZXJvIiwgaXQgc2V0cyB0aGUgZmxvYXRfc3RhdHVzIGZsdXNoX2lucHV0c190
b196ZXJvIGZsYWcuIElmIGl0IGFsc28gd2FudHMgdG8gYmUgYWJsZSB0byBkZXRlY3Qgd2hlbiB0
aGlzIGhhcyBoYXBwZW5lZCwgaXQgY2FuIHRoZW4gbG9vayBhdCB0aGUgaW5wdXRfZGVub3JtYWwg
ZmxhZy4gVGhpcyBtYXRjaGVzIHRoZSBiZWhhdmlvdXIgdGhhdCBBcm0gbmVlZHMsIGFuZCBpdCBp
cyBmb3IgQXJtIHRoYXQgdGhlIGZsdXNoX2lucHV0c190b196ZXJvIGFuZCBpbnB1dF9kZW5vcm1h
bCBmbGFncyB3ZXJlIGludHJvZHVjZWQuDQoNCj4gSSB0aGluayB0aGUgYmVoYXZpb3Igc2hvdWxk
IGJlIGZvciBkZW5vcm1hbCBpbnB1dHMgdGhhdCBpZiANCj4gImZsdXNoX2lucHV0c190b196ZXJv
IiBpcyB0cnVlLCB0aGVuIHRoZSB2YWx1ZSBpcyBzZXQgdG8gemVybzsgYW5kIGlmIA0KPiAiZmx1
c2hfaW5wdXRzX3RvX3plcm8iIGlzIGZhbHNlLCBzZXQgdGhlICJpbnB1dCBkZW5vcm1hbCINCj4g
ZmxhZyBhbmQgbm9ybWFsaXplIHRoZSBpbnB1dC4NCg0KPiBUaGlzIG1hdGNoZXMgd2hhdCB4ODYg
ZG9lcyAoSSdtIG5vdCBzdXJlIGFib3V0IG90aGVyIGFyY2hpdGVjdHVyZXMpLg0KDQpXaGF0IGlu
IHBhcnRpY3VsYXIgZG9lcyB4ODYgd2FudCB0aGF0IGl0IGlzbid0IGdldHRpbmcgYXQgdGhlIG1v
bWVudD8gSWYgaXQgbmVlZHMgc29tZSBhZGRpdGlvbmFsIHZhcmlhdGlvbiBvZiBiZWhhdmlvdXIg
d2UgY2FuIGxvb2sgYXQgYWRkaW5nIGEgbmV3IHN0YXR1cyBmbGFnIHRvIGNvbnRyb2wgdGhhdC4N
Cg0KdGhhbmtzDQotLSBQTU0NCg==

