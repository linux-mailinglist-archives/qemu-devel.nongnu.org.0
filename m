Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C331F0D8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:13:30 +0100 (CET)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpg1-0001Yb-Av
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lCpdW-0008L2-JA
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:10:54 -0500
Received: from smtp1.axis.com ([195.60.68.17]:63218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lCpdT-0006JC-TQ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1613679052;
 x=1645215052; h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BeIPA5eup6fAzeHMcBDc6ezQRnsfyR4p+CT7LoAHFMc=;
 b=NDcrM4q3zsI0cHpx/dF4tY7GsIaRSBagAhs57IGi033FeAdhv1hDvUPv
 YVjr4BmqVXFdZp0dPix2WrMRV0Zc/woOwF3kSDppliZrQf5TlTKrtte6j
 JkiQkW4ZJ6Imbwb+g/1NOkDxkRLImOdVXD0xs97YPdhQmd8EnG4lCSi1d
 kMM3d9ZTdxhBsBh16Rrl6UPwHfQfoj43X5a4oVFE7U6b+kVP8D/2xsnnU
 714/XkH03LBduB1BH5EIJ2Ci9d3+MtPx8Ws5rAN0dgh7dhjdFTgRkuspZ
 LZ+YwNNLowYYtEI/q9Vg8t8m1GCuyc4v+wozcQ0dhMoLLTs9OyGF71GGI A==;
From: =?utf-8?B?U3RlZmFuIFNhbmRzdHLDtm0=?= <Stefan.Sandstrom@axis.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] Correct CRIS TCG register lifetime management
Thread-Topic: [PATCH v2] Correct CRIS TCG register lifetime management
Thread-Index: AQHXBiXsaEPzzLR6yUiER3hr5a8RBqpeQ/GAgAAUDkc=
Date: Thu, 18 Feb 2021 20:10:48 +0000
Message-ID: <1BD4E981-C339-495D-ABC1-74B0112CBC3E@axis.com>
References: <20210218184302.34984-1-stefans@axis.com>,
 <2fe233c0-dfa8-763d-b122-fdef8145ea06@amsat.org>
In-Reply-To: <2fe233c0-dfa8-763d-b122-fdef8145ea06@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gMTggRmViIDIwMjEsIGF0IDIwOjU5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4gDQo+IO+7v0hpIFN0ZWZhbiwNCj4gDQo+PiBPbiAy
LzE4LzIxIDc6NDMgUE0sIFN0ZWZhbiBTYW5kc3Ryw7ZtIHdyb3RlOg0KPj4gRnJvbTogU3RlZmFu
IFNhbmRzdHJvbSA8c3RlZmFuc0BheGlzLmNvbT4NCj4+IA0KPj4gQWRkIGFuZCBmaXggZGVhbGxv
Y2F0aW9uIG9mIHRlbXBvcmFyeSBUQ0cgcmVnaXN0ZXJzIGluIENSSVMgY29kZQ0KPj4gZ2VuZXJh
dGlvbi4NCj4gDQo+IFdoYXQgZGlkIHlvdSBydW4gdG8gZmlndXJlIHRoaXMgb3V0Pw0KDQpIaSBQ
aGlsaXBwZSwNCg0KV2Ugd2VyZSBsb29raW5nIGF0IHRoZSBjb2RlIGluIHNlYXJjaCBmb3IgYW4g
aXNzdWUgdGhhdCBzaG93ZWQgdXAgd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgdmVyc2lvbiBvZiBH
Q0MuIA0KSXQgbG9va2VkIGxpa2UgUUVNVSBleGVjdXRlZCB0aGUgQ1JJUyBjb2RlIHdyb25nLCBz
byB3ZSB0b29rIGEgbG9vayBhdCB0aGUgY29kZS4gVGhlIHByb2JsZW0gdHVybmVkIG91dCB0byBi
ZSBvdXRzaWRlIFFFTVUuIFRoZXNlIHBvdGVudGlhbCBpc3N1ZXMgd2VyZSBzcG90dGVkIGluIHRo
ZSBwcm9jZXNzLg0KDQo+IA0KPj4gQ2hhbmdlLUlkOiBJMTdmY2U1ZDk1YmRjNDQxODMzN2JhODg1
ZDUzYmE5N2FmYjFiYWZjYw0KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIFNhbmRzdHJvbSA8c3Rl
ZmFuc0BheGlzLmNvbT4NCj4+IC0tLQ0KPj4gdGFyZ2V0L2NyaXMvdHJhbnNsYXRlLmMgICAgICAg
ICB8IDEzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+PiB0YXJn
ZXQvY3Jpcy90cmFuc2xhdGVfdjEwLmMuaW5jIHwgIDcwICsrKysrKysrKysrKysrLS0tLS0tLQ0K
Pj4gMiBmaWxlcyBjaGFuZ2VkLCAxNDEgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pDQo=

