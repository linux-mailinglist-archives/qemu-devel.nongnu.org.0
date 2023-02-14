Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470C695CB7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:18:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqUv-0003x7-F4; Tue, 14 Feb 2023 03:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRqUt-0003wj-Fl
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:17:07 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRqUn-0000YK-M3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:17:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so10901075wms.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 00:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Fjjqd/ojKal2KcqcUmnxUeRl0He9X9ZD+ILL/Fahmg=;
 b=wiZOPelTSr45itCF3Bwu5X6xMb5Q/FY2TVmd5PWRyh2rF+Xr/g4Ve8tv8nQiHE/Xfm
 eS8Qrt8CKFu180yu12mxK3CD4xlynu4q8PGCAt344n36S9jKE/0DsY6eQFiOPoseFFW9
 4gZ5Ob9biPgMg1GhGEUxnFzy+KszvlLTJ3o5Cb7vkdkyHvm1dvXYvJ3GtbqISb9rAeOf
 CILqNg/h211iGIt9RkZICML7hq+PEz7Qsdb0qg8NUY7yfcoNf2reQdEVUeSyi0g6VTf/
 ygQiulVWmWK5XU1GeLodysD85kgCUhMW8PidxOtRHjsS9E4TSTcW5qonYpIQRWKCZ0py
 87rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Fjjqd/ojKal2KcqcUmnxUeRl0He9X9ZD+ILL/Fahmg=;
 b=HIste1WgfRmkHcE6JcGYiVDOuKxG9Y4ukhMkfnIeQV2JzF6MdbndfEY20bThGLSaEb
 J0LQF3nefh9lPtWuaUKREMEcVdPkzQjvufo93sbsjrCrDmX7smytYUzq5IoUCKCZTcjo
 nSGR+Rpk/64uxZCjpN0+CxbjGWMpWBGXHjeWOoMBfAWREp+rWTmGlVosnev4nXhCfD7U
 AsoS6iz8U8pq1RRtJ+z0j+Tgr9DPqAAVWfVJw064AlpzK35fN5s/ZkUf6E2u83pp3gl9
 M+v6fIUfy7971qCiBKlhwLrNcdCVxkUHC7+qDPPHUjay4G7Va9mKNAdvzswGlmvnSe/b
 L58Q==
X-Gm-Message-State: AO0yUKX0Jp+AqkNR+jeXFwxXKSnU1X4NfP1Hj9keOH2u9ALeAXw/kU1M
 xgFJQSgZ/V5KAzBp5qFJu645xA==
X-Google-Smtp-Source: AK7set+Z6kiryoh75nLIzJk1rdiEkAi11kLDamQoxPDUEKk1Pz0sbpN808/AWJ7jMOhqhl3/twIVsQ==
X-Received: by 2002:a05:600c:18a2:b0:3d9:e5d3:bf with SMTP id
 x34-20020a05600c18a200b003d9e5d300bfmr1271905wmp.32.1676362620001; 
 Tue, 14 Feb 2023 00:17:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:59b6:5cf7:7f59:1fb4?
 ([2a01:e0a:5cc:caa0:59b6:5cf7:7f59:1fb4])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003db12112fcfsm18019228wmo.4.2023.02.14.00.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 00:16:59 -0800 (PST)
Message-ID: <a577e67a-d86b-86e9-8844-82a3814f83d4@linaro.org>
Date: Tue, 14 Feb 2023 09:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/4] sysemu/os-win32: fix setjmp/longjmp on windows-arm64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-3-pierrick.bouvier@linaro.org>
 <70e1b283-ac58-9df4-7e19-2ead4c680424@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <70e1b283-ac58-9df4-7e19-2ead4c680424@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

T24gMi8xNC8yMyAwODoxMSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IEhp
IFBpZXJyaWNrLA0KPiANCj4gT24gMTMvMi8yMyAxNzoxMywgUGllcnJpY2sgQm91dmllciB3
cm90ZToNCj4+IFdpbmRvd3MgaW1wbGVtZW50YXRpb24gb2Ygc2V0am1wL2xvbmdqbXAgaXMg
ZG9uZSBpbg0KPj4gQzovV0lORE9XUy9zeXN0ZW0zMi91Y3J0YmFzZS5kbGwuIEFsYXMsIG9u
IGFybTY0LCBpdCBzZWVtcyB0byAqYWx3YXlzKg0KPj4gcGVyZm9ybSBzdGFjayB1bndpbmRp
bmcsIHdoaWNoIGNyYXNoZXMgZnJvbSBnZW5lcmF0ZWQgY29kZS4NCj4+DQo+PiBCeSB1c2lu
ZyBhbHRlcm5hdGl2ZSBpbXBsZW1lbnRhdGlvbiBidWlsdCBpbiBtaW5ndywgd2UgYXZvaWQg
ZG9pbmcgc3RhY2sNCj4+IHVud2luZGluZyBhbmQgdGhpcyBmaXhlcyBjcmFzaCB3aGVuIGNh
bGxpbmcgbG9uZ2ptcC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+PiAtLS0NCj4+ICAgIGluY2x1ZGUv
c3lzZW11L29zLXdpbjMyLmggfCAxOCArKysrKysrKysrKysrKysrLS0NCj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3N5c2VtdS9vcy13aW4zMi5oIGIvaW5jbHVkZS9zeXNlbXUv
b3Mtd2luMzIuaA0KPj4gaW5kZXggNWIzOGM3YmQwNC4uODRmNjJkMGExNyAxMDA2NDQNCj4+
IC0tLSBhL2luY2x1ZGUvc3lzZW11L29zLXdpbjMyLmgNCj4+ICsrKyBiL2luY2x1ZGUvc3lz
ZW11L29zLXdpbjMyLmgNCj4+IEBAIC01MSwxNCArNTEsMjggQEAgdHlwZWRlZiBzdHJ1Y3Qg
c29ja2FkZHJfdW4gew0KPj4gICAgZXh0ZXJuICJDIiB7DQo+PiAgICAjZW5kaWYNCj4+ICAg
IA0KPj4gLSNpZiBkZWZpbmVkKF9XSU42NCkNCj4+ICsjaWYgZGVmaW5lZChfX2FhcmNoNjRf
XykNCj4gDQo+IFNob3VsZG4ndCB3ZSBjaGVjayBmb3IgX19NSU5HVzY0X18/DQo+IA0KPiAg
ICAgICNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKSAmJiBkZWZpbmVkKF9fTUlOR1c2NF9fKQ0K
Pg0KDQpJIHRob3VnaHQgUUVNVSB3YXMgb25seSBjb21waWxlZCB1c2luZyBNaW5HVyB1bmRl
ciBXaW5kb3dzLCAoZnJvbSBDSSwgDQp0aGF0J3MgdGhlIGNhc2UsIFsxXSwgWzJdKSwgYnV0
IG1heWJlIHRoYXQncyBhIHdyb25nIGFzc3VtcHRpb24uDQoNClsxXSANCmh0dHBzOi8vZ2l0
bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2Jsb2IvbWFzdGVyLy5naXRsYWItY2kuZC93
aW5kb3dzLnltbA0KWzJdIA0KaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11
Ly0vYmxvYi9tYXN0ZXIvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2ZlZG9yYS13aW42NC1j
cm9zcy5kb2NrZXINCg0KRm9yIHdpbmRvd3MtYXJtNjQsIHdlIG5lZWQgYW4gYWx0ZXJuYXRp
dmUgc2V0am1wL2xvbmdqbXAgaW1wbGVtZW50YXRpb24gDQooX19idWlsdGluX3NldGptcCBh
bmQgX19idWlsdGluX2xvbmdqbXAgaW4gY2xhbmcgYXJlIG5vdCBhdmFpbGFibGUpLCANCnRo
dXMsIHRoYXQgbWFrZXMgTWluR1cgbWFuZGF0b3J5LCBhdCBsZWFzdCBmb3IgdGhpcyBwbGF0
Zm9ybS4NCg0KV291bGQgYWRkaW5nIHRoaXMgYmUgc2F0aXNmeWluZz8gT3IgYmV0dGVyIHRv
IGFkZCB0aGlzIGNoZWNrIGluIE1lc29uPw0KI2lmbmRlZiBfX01JTkdXNjRfXw0KI2Vycm9y
IE1pbkdXIG11c3QgYmUgYXZhaWxhYmxlIGZvciB0aGlzIHBsYXRmb3JtDQojZW5kaWYNCg0K
Pj4gKy8qIE9uIHdpbmRvd3MtYXJtNjQsIHNldGptcCBpcyBhdmFpbGFibGUgaW4gb25seSBv
bmUgdmFyaWFudCwgYW5kIGxvbmdqbXAgYWx3YXlzDQo+PiArICogZG9lcyBzdGFjayB1bndp
bmRpbmcuIFRoaXMgY3Jhc2ggd2l0aCBnZW5lcmF0ZWQgY29kZS4NCj4+ICsgKiBUaHVzLCB3
ZSB1c2UgYW5vdGhlciBpbXBsZW1lbnRhdGlvbiBvZiBzZXRqbXAgKG5vdCB3aW5kb3dzIG9u
ZSksIGNvbWluZyBmcm9tDQo+PiArICogbWluZ3csIHdoaWNoIG5ldmVyIHBlcmZvcm1zIHN0
YWNrIHVud2luZGluZy4gKi8NCj4+ICsjdW5kZWYgc2V0am1wDQo+PiArI3VuZGVmIGxvbmdq
bXANCj4+ICsvKiBUaGVzZSBmdW5jdGlvbnMgYXJlIG5vdCBkZWNsYXJlZCBpbiBzZXRqbXAu
aCBiZWNhdXNlIF9fYWFyY2g2NF9fIGRlZmluZXMNCj4+ICsgKiBzZXRqbXAgdG8gX3NldGpt
cGV4IGluc3RlYWQuIEhvd2V2ZXIsIHRoZXkgYXJlIHN0aWxsIGRlZmluZWQgaW4gbGlibWlu
Z3dleC5hLA0KPj4gKyAqIHdoaWNoIGdldHMgbGlua2VkIGF1dG9tYXRpY2FsbHkuICovDQo+
IA0KPiBTbyB0aGlzIGlzIG5vdCBzdGFibGUuIEJldHRlciB3b3VsZCBiZSB0byBjaGVjayB0
aGUgc3ltYm9scyBhdmFpbGFiaWxpdHkNCj4gYXQgbGluay10aW1lIHZpYSBtZXNvbjsgc2Vl
IGZvciBleGFtcGxlIGdsdXN0ZXJmc19mdHJ1bmNhdGVfaGFzX3N0YXQNCj4gd2hpY2ggZGVm
aW5lcyBDT05GSUdfR0xVU1RFUkZTX0ZUUlVOQ0FURV9IQVNfU1RBVC4NCj4gDQo+IEEgc2lt
aWxhciBjaGVjayBjb3VsZCBkZWZpbmUgQ09ORklHX01JTkdXNjRfSEFTX1NFVEpNUF9MT05H
Sk1QLg0KPiANCg0KWW91J3JlIHJpZ2h0LCBpdCdzIG5vdCBzdGFibGUuIENoZWNraW5nIHRo
aXMgdXNpbmcgbWVzb24gc291bmRzIGEgZ29vZCANCmFwcHJvYWNoLg0KDQo+PiArZXh0ZXJu
IGludCBfX21pbmd3X3NldGptcChqbXBfYnVmKTsNCj4+ICtleHRlcm4gdm9pZCBfX2F0dHJp
YnV0ZV9fKChub3JldHVybikpIF9fbWluZ3dfbG9uZ2ptcChqbXBfYnVmLCBpbnQpOw0KPj4g
KyNkZWZpbmUgc2V0am1wKGVudikgX19taW5nd19zZXRqbXAoZW52KQ0KPj4gKyNkZWZpbmUg
bG9uZ2ptcChlbnYsIHZhbCkgX19taW5nd19sb25nam1wKGVudiwgdmFsKQ0KPj4gKyNlbGlm
IGRlZmluZWQoX1dJTjY0KQ0KPj4gICAgLyogT24gdzY0LCBzZXRqbXAgaXMgaW1wbGVtZW50
ZWQgYnkgX3NldGptcCB3aGljaCBuZWVkcyBhIHNlY29uZCBwYXJhbWV0ZXIuDQo+PiAgICAg
KiBJZiB0aGlzIHBhcmFtZXRlciBpcyBOVUxMLCBsb25nanVtcCBkb2VzIG5vIHN0YWNrIHVu
d2luZGluZy4NCj4+ICAgICAqIFRoYXQgaXMgd2hhdCB3ZSBuZWVkIGZvciBRRU1VLiBQYXNz
aW5nIHRoZSB2YWx1ZSBvZiByZWdpc3RlciByc3AgKGRlZmF1bHQpDQo+PiAgICAgKiBsZXRz
IGxvbmdqbXAgdHJ5IGEgc3RhY2sgdW53aW5kaW5nIHdoaWNoIHdpbGwgY3Jhc2ggd2l0aCBn
ZW5lcmF0ZWQgY29kZS4gKi8NCj4+ICAgICMgdW5kZWYgc2V0am1wDQo+PiAgICAjIGRlZmlu
ZSBzZXRqbXAoZW52KSBfc2V0am1wKGVudiwgTlVMTCkNCj4+IC0jZW5kaWYNCj4+ICsjZW5k
aWYgLyogX19hYXJjaDY0X18gKi8NCj4+ICAgIC8qIFFFTVUgdXNlcyBzaWdzZXRqbXAoKS9z
aWdsb25nam1wKCkgYXMgdGhlIHBvcnRhYmxlIHdheSB0byBzcGVjaWZ5DQo+PiAgICAgKiAi
bG9uZ2ptcCBhbmQgZG9uJ3QgdG91Y2ggdGhlIHNpZ25hbCBtYXNrcyIuIFNpbmNlIHdlIGtu
b3cgdGhhdCB0aGUNCj4+ICAgICAqIHNhdmVtYXNrIHBhcmFtZXRlciB3aWxsIGFsd2F5cyBi
ZSB6ZXJvIHdlIGNhbiBzYWZlbHkgZGVmaW5lIHRoZXNlDQo+IA0KPiBSZWdhcmRzLA0KPiAN
Cj4gUGhpbC4NCg==

