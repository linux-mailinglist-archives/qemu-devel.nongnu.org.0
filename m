Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD7F32124F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:52:17 +0100 (CET)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6wx-0007DE-Pt
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lE6vc-0006c5-AG
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:50:52 -0500
Received: from smtp2.axis.com ([195.60.68.18]:53090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lE6vZ-0000X6-In
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1613983849;
 x=1645519849; h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KmrxS6BdFkCAM54pzZJAs7k02fbOC5LvkEc2EErdrDQ=;
 b=OYD4i6+CJSqDxzUho9rfcCMqgwzg/fGwEEv2aHD8F0O5Db7W5B/P8oH+
 49astQEUbzLoAFqWrFo5f9rMA0/fFIlA2l26RjCHOWyMBPqQoctxDmMpi
 +HCUw3MuT3YI0/5F2hmfKoaxsomLThFevx6r5I8JWJmfWGoNXPJATMXsu
 U7UoOHgJixuEVe1BNSy5//TOGj8gp1hJmmwvTPqPv/pSByzkSmVGImiqf
 vJwnec6ksYln6viIc5y1gxFnEmFNwUiXIX/QU/sSnzA5sjtCUplZUAvG2
 vU9TYuiXGKZeucKYteR7UNyrFKgbF5xIP+/Rz2wCchl/pz+YUFTp8mIrV g==;
From: =?utf-8?B?U3RlZmFuIFNhbmRzdHLDtm0=?= <Stefan.Sandstrom@axis.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PULL v1 3/3] target/cris: Plug leakage of TCG temporaries
Thread-Topic: [PULL v1 3/3] target/cris: Plug leakage of TCG temporaries
Thread-Index: AQHXCPVm0hMTh2Oe5kakebpjOZhqRKpjykgAgAACp4A=
Date: Mon, 22 Feb 2021 08:50:46 +0000
Message-ID: <022FADE0-9DE7-4DA3-B864-2CE5B97F26F4@axis.com>
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
 <20210222083324.331908-4-edgar.iglesias@gmail.com>
 <39885acc-a692-cd6c-c0bf-46e3193a4d7b@amsat.org>
In-Reply-To: <39885acc-a692-cd6c-c0bf-46e3193a4d7b@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9D01A4A464E6449A46525341388ECC9@exhub.se.axis.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=195.60.68.18;
 envelope-from=Stefan.Sandstrom@axis.com; helo=smtp2.axis.com
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
Cc: "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksDQoNCj4gT24gMjIgRmViIDIwMjEsIGF0IDA5OjQxLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4gDQo+IEhpIEVkZ2FyLA0KPiANCj4gT24gMi8y
Mi8yMSA5OjMzIEFNLCBFZGdhciBFLiBJZ2xlc2lhcyB3cm90ZToNCj4+IEZyb206IFN0ZWZhbiBT
YW5kc3Ryb20gPHN0ZWZhbnNAYXhpcy5jb20+DQo+PiANCj4+IEFkZCBhbmQgZml4IGRlYWxsb2Nh
dGlvbiBvZiB0ZW1wb3JhcnkgVENHIHJlZ2lzdGVycyBpbiBDUklTIGNvZGUNCj4+IGdlbmVyYXRp
b24uDQo+PiANCj4+IFRlc3RlZC1ieTogRWRnYXIgRS4gSWdsZXNpYXMgPGVkZ2FyLmlnbGVzaWFz
QHhpbGlueC5jb20+DQo+PiBSZXZpZXdlZC1ieTogRWRnYXIgRS4gSWdsZXNpYXMgPGVkZ2FyLmln
bGVzaWFzQHhpbGlueC5jb20+DQo+PiBDaGFuZ2UtSWQ6IEkxN2ZjZTVkOTViZGM0NDE4MzM3YmE4
ODVkNTNiYTk3YWZiMWJhZmNjDQo+IE91dCBvZiBjdXJpb3NpdHksIHdoYXQgaXMgdGhpcyBDaGFu
Z2UtSWQ/DQoNCkl0IGlzIHVzZWQgYnkgdGhlIEdlcnJpdCBDb2RlIFJldmlldyB0b29sIChodHRw
czovL2dlcnJpdC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9Eb2N1bWVudGF0aW9uL3VzZXItY2hh
bmdlaWQuaHRtbCkuDQpXaGVuIHVzaW5nIEdlcnJpdCBhcyBhIGdpdC1zZXJ2ZXIsIHlvdSBpbnN0
YWxsIGEgZ2l0IGhvb2sgdGhhdCBhbHdheXMgYWRkcyB0aGlzLCBzbyBpdCBpcyBhbiBhcnRpZmFj
dCBmcm9tIHN0b3JpbmcgYSBjbG9uZSBvZiB0aGUgUUVNVSByZXBvcyBvbiBhIGdlcnJpdCBzZXJ2
ZXIuDQpJJ2xsIHRyeSB0byByZW1lbWJlciB0byByZW1vdmUgaXQgaWYgSSBlbmQgdXAgcG9zdGlu
ZyBtb3JlIHBhdGNoZXMuDQoNCkJlc3QgcmVnYXJkcywNCi1zdGVmYW4NCg0KPiANCj4+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbiBTYW5kc3Ryw7ZtIDxzdGVmYW5zQGF4aXMuY29tPg0KPj4gUmV2aWV3
ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0K
Pj4gTWVzc2FnZS1JZDogPDIwMjEwMjE5MTI0NDE2LjI4MTc4LTEtc3RlZmFuc0BheGlzLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEUuIElnbGVzaWFzIDxlZGdhci5pZ2xlc2lhc0B4aWxp
bnguY29tPg0KPj4gLS0tDQo+PiB0YXJnZXQvY3Jpcy90cmFuc2xhdGUuYyAgICAgICAgIHwgMTI0
ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+PiB0YXJnZXQvY3Jpcy90cmFuc2xh
dGVfdjEwLmMuaW5jIHwgIDcwICsrKysrKysrKysrKy0tLS0tLQ0KPj4gMiBmaWxlcyBjaGFuZ2Vk
LCAxMzUgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pDQoNCg==

