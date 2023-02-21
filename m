Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170F69DD52
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:52:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPF3-000085-PF; Tue, 21 Feb 2023 04:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUPEz-0008P9-BW
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:47:17 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUPEx-0005yo-Bi
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:47:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id z8so3435121wrm.8
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6vgQJ2IMbf8Cg24AkDytcc37VOez16xvemzd9oSoZTk=;
 b=PgfGfyvY4taVqjopSIp/FRkTlQo3iJ2HtrNxIB6NHBh/t+oWnloAs7nJPk1f1JbXNP
 fa63TZ3vIxrKW7UzVTQFvWHkALmFPf+TRWHDAWhjPyJiUBITnjUCk1oIL+4IvQSByT44
 I3kEPj8Gz6WP0tzeBpL/zNfppCpi7KBDFW1x5P9TiOK8+VFSJ6KHlYYFS/F76yKY1jxd
 XIeOuk736Dp1KuY7dgTrq3A13jVAV0+A9g0/CHAvhK4W7jgfbl4AtxUuvnmXmSmUPikk
 YO5+yQIq7e6XMsW4gwXCyblHyaSCjENEoWMtewvimxLuy77hM3wlw1gSSCUrr/NTZb2Q
 Lxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6vgQJ2IMbf8Cg24AkDytcc37VOez16xvemzd9oSoZTk=;
 b=ZcoFv+m3hlIHzJLKWKUXreoVsDalXZLxGFksdAl318mAku/COjZwhEzSZCFHQQldJI
 hH8nCWV53sYS6oVNlodU8bypLxe1Tv80umW54u1JVKdkDDI9USmIfl6ExqOTfMxxrtdj
 tPuCEk7pTrD9tyko+Cwv3WBmL6fWncTyuo6YoWtsVle0NOcy72L8HPevh5Aj3p7KlrP5
 leXLTCBdkJ5Y2m+IJhSaXTIcl/sLV4i1u0FGSIqT9QB5QepzueiDzZNpfO43pzQs0Iem
 czbyZnvwNXLo3ML22pgb2CKx5OZePHuI57l6ypCnnEv5M5Ob3dTQjpndX4tDUVbKaRdK
 ejxQ==
X-Gm-Message-State: AO0yUKUeKeMPOLFe9jrq263OiWTjj4Af5d84MxtboNy0zsu4PX+SLbsq
 omV5k75ykmEV7BW2b5fEKwidQIkOyrHDcvaptf0=
X-Google-Smtp-Source: AK7set+aHNLi2KB73d+wIv2Eo/1RwIXeJcqAhYnHV3w5Vubp5bGtU7BCabYQW3QCTQ3tcDiPHZd9BA==
X-Received: by 2002:a5d:6288:0:b0:2c5:7fdb:7c5 with SMTP id
 k8-20020a5d6288000000b002c57fdb07c5mr5062012wru.38.1676972833466; 
 Tue, 21 Feb 2023 01:47:13 -0800 (PST)
Received: from [192.168.10.97] ([31.32.81.187])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adff949000000b002c56a7872f4sm5394743wrr.82.2023.02.21.01.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 01:47:13 -0800 (PST)
Message-ID: <eb3116cf-dd6d-6a50-19cd-53614105e5de@linaro.org>
Date: Tue, 21 Feb 2023 10:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-3-pierrick.bouvier@linaro.org>
 <6de4e5b4-aeb1-3888-0979-01e4778eba93@linaro.org>
In-Reply-To: <6de4e5b4-aeb1-3888-0979-01e4778eba93@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpLCBpcyB0aGF0IHZlcnNpb24gc2F0aXNmeWluZyBm
b3IgeW91LCByZWdhcmRpbmcgDQp5b3VyIGluaXRpYWwgY29tbWVudHMgYWJvdXQgc2V0am1w
L2xvbmdqbXAgZGV0ZWN0aW9uIGluIG1lc29uPw0KDQpJIGNhbiBpbnRlZ3JhdGUgbW9yZSBj
aGFuZ2VzIGlmIG5lZWRlZC4NCg0KVGhhbmtzLA0KUGllcnJpY2sNCg0KT24gMi8yMC8yMyAx
NjoxNiwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4gQWNrZWQtYnk6IFJpY2hhcmQgSGVu
ZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiANCj4gT24gMi8yMC8y
MyAxMjoxMiwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+IFdpbmRvd3MgaW1wbGVtZW50
YXRpb24gb2Ygc2V0am1wL2xvbmdqbXAgaXMgZG9uZSBpbg0KPj4gQzovV0lORE9XUy9zeXN0
ZW0zMi91Y3J0YmFzZS5kbGwuIEFsYXMsIG9uIGFybTY0LCBpdCBzZWVtcyB0byAqYWx3YXlz
Kg0KPj4gcGVyZm9ybSBzdGFjayB1bndpbmRpbmcsIHdoaWNoIGNyYXNoZXMgZnJvbSBnZW5l
cmF0ZWQgY29kZS4NCj4+DQo+PiBCeSB1c2luZyBhbHRlcm5hdGl2ZSBpbXBsZW1lbnRhdGlv
biBidWlsdCBpbiBtaW5ndywgd2UgYXZvaWQgZG9pbmcgc3RhY2sNCj4+IHVud2luZGluZyBh
bmQgdGhpcyBmaXhlcyBjcmFzaCB3aGVuIGNhbGxpbmcgbG9uZ2ptcC4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5v
cmc+DQo+PiAtLS0NCj4+ICAgIGluY2x1ZGUvc3lzZW11L29zLXdpbjMyLmggfCAyNSArKysr
KysrKysrKysrKysrKysrKysrKy0tDQo+PiAgICBtZXNvbi5idWlsZCAgICAgICAgICAgICAg
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgICAyIGZpbGVzIGNoYW5nZWQs
IDQ3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvc3lzZW11L29zLXdpbjMyLmggYi9pbmNsdWRlL3N5c2VtdS9vcy13aW4zMi5o
DQo+PiBpbmRleCA1YjM4YzdiZDA0Li4xZjZjMTQxZDM5IDEwMDY0NA0KPj4gLS0tIGEvaW5j
bHVkZS9zeXNlbXUvb3Mtd2luMzIuaA0KPj4gKysrIGIvaW5jbHVkZS9zeXNlbXUvb3Mtd2lu
MzIuaA0KPj4gQEAgLTUxLDE0ICs1MSwzNSBAQCB0eXBlZGVmIHN0cnVjdCBzb2NrYWRkcl91
biB7DQo+PiAgICBleHRlcm4gIkMiIHsNCj4+ICAgICNlbmRpZg0KPj4gICAgDQo+PiAtI2lm
IGRlZmluZWQoX1dJTjY0KQ0KPj4gKyNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPj4gKyNp
Zm5kZWYgQ09ORklHX01JTkdXNjRfSEFTX1NFVEpNUF9MT05HSk1QDQo+PiArI2Vycm9yIG1p
bmd3IG11c3QgcHJvdmlkZSBzZXRqbXAvbG9uZ2ptcCBmb3Igd2luZG93cy1hcm02NA0KPj4g
KyNlbmRpZg0KPj4gKy8qDQo+PiArICogT24gd2luZG93cy1hcm02NCwgc2V0am1wIGlzIGF2
YWlsYWJsZSBpbiBvbmx5IG9uZSB2YXJpYW50LCBhbmQgbG9uZ2ptcCBhbHdheXMNCj4+ICsg
KiBkb2VzIHN0YWNrIHVud2luZGluZy4gVGhpcyBjcmFzaCB3aXRoIGdlbmVyYXRlZCBjb2Rl
Lg0KPj4gKyAqIFRodXMsIHdlIHVzZSBhbm90aGVyIGltcGxlbWVudGF0aW9uIG9mIHNldGpt
cCAobm90IHdpbmRvd3Mgb25lKSwgY29taW5nIGZyb20NCj4+ICsgKiBtaW5ndywgd2hpY2gg
bmV2ZXIgcGVyZm9ybXMgc3RhY2sgdW53aW5kaW5nLg0KPj4gKyAqLw0KPj4gKyN1bmRlZiBz
ZXRqbXANCj4+ICsjdW5kZWYgbG9uZ2ptcA0KPj4gKy8qDQo+PiArICogVGhlc2UgZnVuY3Rp
b25zIGFyZSBub3QgZGVjbGFyZWQgaW4gc2V0am1wLmggYmVjYXVzZSBfX2FhcmNoNjRfXyBk
ZWZpbmVzDQo+PiArICogc2V0am1wIHRvIF9zZXRqbXBleCBpbnN0ZWFkLiBIb3dldmVyLCB0
aGV5IGFyZSBzdGlsbCBkZWZpbmVkIGluIGxpYm1pbmd3ZXguYSwNCj4+ICsgKiB3aGljaCBn
ZXRzIGxpbmtlZCBhdXRvbWF0aWNhbGx5Lg0KPj4gKyAqLw0KPj4gK2V4dGVybiBpbnQgX19t
aW5nd19zZXRqbXAoam1wX2J1Zik7DQo+PiArZXh0ZXJuIHZvaWQgX19hdHRyaWJ1dGVfXygo
bm9yZXR1cm4pKSBfX21pbmd3X2xvbmdqbXAoam1wX2J1ZiwgaW50KTsNCj4+ICsjZGVmaW5l
IHNldGptcChlbnYpIF9fbWluZ3dfc2V0am1wKGVudikNCj4+ICsjZGVmaW5lIGxvbmdqbXAo
ZW52LCB2YWwpIF9fbWluZ3dfbG9uZ2ptcChlbnYsIHZhbCkNCj4+ICsjZWxpZiBkZWZpbmVk
KF9XSU42NCkNCj4+ICAgIC8qIE9uIHc2NCwgc2V0am1wIGlzIGltcGxlbWVudGVkIGJ5IF9z
ZXRqbXAgd2hpY2ggbmVlZHMgYSBzZWNvbmQgcGFyYW1ldGVyLg0KPj4gICAgICogSWYgdGhp
cyBwYXJhbWV0ZXIgaXMgTlVMTCwgbG9uZ2p1bXAgZG9lcyBubyBzdGFjayB1bndpbmRpbmcu
DQo+PiAgICAgKiBUaGF0IGlzIHdoYXQgd2UgbmVlZCBmb3IgUUVNVS4gUGFzc2luZyB0aGUg
dmFsdWUgb2YgcmVnaXN0ZXIgcnNwIChkZWZhdWx0KQ0KPj4gICAgICogbGV0cyBsb25nam1w
IHRyeSBhIHN0YWNrIHVud2luZGluZyB3aGljaCB3aWxsIGNyYXNoIHdpdGggZ2VuZXJhdGVk
IGNvZGUuICovDQo+PiAgICAjIHVuZGVmIHNldGptcA0KPj4gICAgIyBkZWZpbmUgc2V0am1w
KGVudikgX3NldGptcChlbnYsIE5VTEwpDQo+PiAtI2VuZGlmDQo+PiArI2VuZGlmIC8qIF9f
YWFyY2g2NF9fICovDQo+PiAgICAvKiBRRU1VIHVzZXMgc2lnc2V0am1wKCkvc2lnbG9uZ2pt
cCgpIGFzIHRoZSBwb3J0YWJsZSB3YXkgdG8gc3BlY2lmeQ0KPj4gICAgICogImxvbmdqbXAg
YW5kIGRvbid0IHRvdWNoIHRoZSBzaWduYWwgbWFza3MiLiBTaW5jZSB3ZSBrbm93IHRoYXQg
dGhlDQo+PiAgICAgKiBzYXZlbWFzayBwYXJhbWV0ZXIgd2lsbCBhbHdheXMgYmUgemVybyB3
ZSBjYW4gc2FmZWx5IGRlZmluZSB0aGVzZQ0KPj4gZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxk
IGIvbWVzb24uYnVpbGQNCj4+IGluZGV4IDRiYTNiZjM0MzEuLmU5NjhlZDllN2EgMTAwNjQ0
DQo+PiAtLS0gYS9tZXNvbi5idWlsZA0KPj4gKysrIGIvbWVzb24uYnVpbGQNCj4+IEBAIC0y
NDUwLDYgKzI0NTAsMzAgQEAgaWYgdGFyZ2V0b3MgPT0gJ3dpbmRvd3MnDQo+PiAgICAgICAg
fScnJywgbmFtZTogJ19sb2NrX2ZpbGUgYW5kIF91bmxvY2tfZmlsZScpKQ0KPj4gICAgZW5k
aWYNCj4+ICAgIA0KPj4gK2lmIHRhcmdldG9zID09ICd3aW5kb3dzJw0KPj4gKyAgbWluZ3df
aGFzX3NldGptcF9sb25nam1wID0gY2MubGlua3MoJycnDQo+PiArICAgICNpbmNsdWRlIDxz
ZXRqbXAuaD4NCj4+ICsgICAgaW50IG1haW4odm9pZCkgew0KPj4gKyAgICAgIC8qDQo+PiAr
ICAgICAgICogVGhlc2UgZnVuY3Rpb25zIGFyZSBub3QgYXZhaWxhYmxlIGluIHNldGptcCBo
ZWFkZXIsIGJ1dCBtYXkgYmUNCj4+ICsgICAgICAgKiBhdmFpbGFibGUgYXQgbGluayB0aW1l
LCBmcm9tIGxpYm1pbmd3ZXguYS4NCj4+ICsgICAgICAgKi8NCj4+ICsgICAgICBleHRlcm4g
aW50IF9fbWluZ3dfc2V0am1wKGptcF9idWYpOw0KPj4gKyAgICAgIGV4dGVybiB2b2lkIF9f
YXR0cmlidXRlX18oKG5vcmV0dXJuKSkgX19taW5nd19sb25nam1wKGptcF9idWYsIGludCk7
DQo+PiArICAgICAgam1wX2J1ZiBlbnY7DQo+PiArICAgICAgX19taW5nd19zZXRqbXAoZW52
KTsNCj4+ICsgICAgICBfX21pbmd3X2xvbmdqbXAoZW52LCAwKTsNCj4+ICsgICAgfQ0KPj4g
KyAgJycnLCBuYW1lOiAnbWluZ3cgc2V0am1wIGFuZCBsb25nam1wJykNCj4+ICsNCj4+ICsg
IGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdDT05GSUdfTUlOR1c2NF9IQVNfU0VUSk1QX0xPTkdK
TVAnLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWluZ3dfaGFzX3NldGptcF9sb25n
am1wKQ0KPj4gKw0KPj4gKyAgaWYgY3B1ID09ICdhYXJjaDY0JyBhbmQgbm90IG1pbmd3X2hh
c19zZXRqbXBfbG9uZ2ptcA0KPj4gKyAgICBlcnJvcignbWluZ3cgbXVzdCBwcm92aWRlIHNl
dGptcC9sb25nam1wIGZvciB3aW5kb3dzLWFybTY0JykNCj4+ICsgIGVuZGlmDQo+PiArZW5k
aWYNCj4+ICsNCj4+ICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPj4gICAgIyBUYXJn
ZXQgY29uZmlndXJhdGlvbiAjDQo+PiAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCg==


