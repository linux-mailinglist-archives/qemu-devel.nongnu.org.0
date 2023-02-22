Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D169F8A7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:10:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrg2-0004xI-Ku; Wed, 22 Feb 2023 11:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUrg0-0004ws-Aa
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:09:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUrfy-0004fZ-HL
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:09:04 -0500
Received: by mail-wm1-x330.google.com with SMTP id o14so6394239wms.1
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WdaVanGpemZ9IW+eTnkxkxGr850Iy1eF3GWgbKUeBGA=;
 b=wPeK/frq0JAEdDZIsp5/VuIYVL/g+NSOHqP1mB/zlrN7Q8gV3enBcZiW6YUyqlWCnl
 AuQDbopVvykgIniGrHkPJyzqcA8sTfFvFqj5U5Ww7V8iG9XZWwSRwm1FW0JPP187ggjA
 gwuFS0vuYaZVm5+Y/905ABz7EOENYgdGzPTvKv/R/87ezsHJxOX7pl4TkSAZQqzff2ok
 Q7Xj6JdvJVMOij2GIJJnTN5Tw1K7VnnWtD3lXbDfjfD5yVq/3pkqU4ouQiONeS2UUn5x
 svUPMnCZs/D1D9VQZlzotqLUrlkRMJGXpffSpqaCIrs1RbR5AXPamRTuJaXT6G5od4w+
 jI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WdaVanGpemZ9IW+eTnkxkxGr850Iy1eF3GWgbKUeBGA=;
 b=ivxqHqFYJRo9gc+5IyCIXg0wS34eFYObSV5jyWya6f+uYN7OuaS6hwnL3bZcoCp+v0
 rW8RAeJdRZMDxLLwfPxe45O+Ph3fQMJClPwwDvnF19Zc+pdGJSVgYvvjOmQ3ZM3yKu1G
 w35vjSvnWrGsDdJtqfh3tfgkSWmHt7LZXwHnghzuDmuI7efGLY6g4ioLKRB7rmZ3HHqN
 G8HKnTLUWfsbaAf2XtpdYEbzJ1ZXfvggQKNQVHWTaWM7KnkM4OJNU4haCAPD1lz2YrC9
 ZxAtOZCC8flQ05ZKK7n9uKpDqkPK8OvplPG+chlb1EFnhiv4L58ydeZI4LSRyPcMjjgk
 9n8g==
X-Gm-Message-State: AO0yUKWLx7EN0oJsVuQt2iwtPyOVXLt1nT/gjBZm+oFlxflxTAHpMVTY
 YtqASRp6f+zP68IKcDUcAqcXLw==
X-Google-Smtp-Source: AK7set+zAItLcRfd/WLoIQQdipxRO1kQG8w7GO3cT4Bn6TISTrDcIrR7MftN+NmlKQ96mxBxL1d5Fg==
X-Received: by 2002:a05:600c:328a:b0:3e2:acd:ac7a with SMTP id
 t10-20020a05600c328a00b003e20acdac7amr6088194wmp.27.1677082140567; 
 Wed, 22 Feb 2023 08:09:00 -0800 (PST)
Received: from ?IPV6:2a01:cb16:203d:61c1:1d6f:c826:249a:2f22?
 ([2a01:cb16:203d:61c1:1d6f:c826:249a:2f22])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b003e21f20b646sm9885371wmq.21.2023.02.22.08.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:09:00 -0800 (PST)
Message-ID: <8fc239ec-b01c-019a-9c8c-b276bbf3fd02@linaro.org>
Date: Wed, 22 Feb 2023 17:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-3-pierrick.bouvier@linaro.org>
 <5a61bdc2-1bc0-7147-8053-2ef1d2fbcb2f@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <5a61bdc2-1bc0-7147-8053-2ef1d2fbcb2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

T24gMi8yMS8yMyAyMzoyNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDIxLzIvMjMgMTY6MzAsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBXaW5kb3dzIGlt
cGxlbWVudGF0aW9uIG9mIHNldGptcC9sb25nam1wIGlzIGRvbmUgaW4NCj4+IEM6L1dJTkRP
V1Mvc3lzdGVtMzIvdWNydGJhc2UuZGxsLiBBbGFzLCBvbiBhcm02NCwgaXQgc2VlbXMgdG8g
KmFsd2F5cyoNCj4+IHBlcmZvcm0gc3RhY2sgdW53aW5kaW5nLCB3aGljaCBjcmFzaGVzIGZy
b20gZ2VuZXJhdGVkIGNvZGUuDQo+Pg0KPj4gQnkgdXNpbmcgYWx0ZXJuYXRpdmUgaW1wbGVt
ZW50YXRpb24gYnVpbHQgaW4gbWluZ3csIHdlIGF2b2lkIGRvaW5nIHN0YWNrDQo+PiB1bndp
bmRpbmcgYW5kIHRoaXMgZml4ZXMgY3Jhc2ggd2hlbiBjYWxsaW5nIGxvbmdqbXAuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBs
aW5hcm8ub3JnPg0KPj4gQWNrZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnPg0KPj4gLS0tDQo+PiAgICBpbmNsdWRlL3N5c2VtdS9vcy13
aW4zMi5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPj4gICAgbWVzb24u
YnVpbGQgICAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPj4gICAg
MiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gDQo+PiAtI2lmIGRlZmluZWQoX1dJTjY0KQ0KPj4gLS8qIE9uIHc2NCwgc2V0am1wIGlz
IGltcGxlbWVudGVkIGJ5IF9zZXRqbXAgd2hpY2ggbmVlZHMgYSBzZWNvbmQgcGFyYW1ldGVy
Lg0KPj4gKyNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPj4gKy8qDQo+PiArICogT24gd2lu
ZG93cy1hcm02NCwgc2V0am1wIGlzIGF2YWlsYWJsZSBpbiBvbmx5IG9uZSB2YXJpYW50LCBh
bmQgbG9uZ2ptcCBhbHdheXMNCj4+ICsgKiBkb2VzIHN0YWNrIHVud2luZGluZy4gVGhpcyBj
cmFzaCB3aXRoIGdlbmVyYXRlZCBjb2RlLg0KPj4gKyAqIFRodXMsIHdlIHVzZSBhbm90aGVy
IGltcGxlbWVudGF0aW9uIG9mIHNldGptcCAobm90IHdpbmRvd3Mgb25lKSwgY29taW5nIGZy
b20NCj4+ICsgKiBtaW5ndywgd2hpY2ggbmV2ZXIgcGVyZm9ybXMgc3RhY2sgdW53aW5kaW5n
Lg0KPj4gKyAqLw0KPj4gKyN1bmRlZiBzZXRqbXANCj4+ICsjdW5kZWYgbG9uZ2ptcA0KPj4g
Ky8qDQo+PiArICogVGhlc2UgZnVuY3Rpb25zIGFyZSBub3QgZGVjbGFyZWQgaW4gc2V0am1w
LmggYmVjYXVzZSBfX2FhcmNoNjRfXyBkZWZpbmVzDQo+PiArICogc2V0am1wIHRvIF9zZXRq
bXBleCBpbnN0ZWFkLiBIb3dldmVyLCB0aGV5IGFyZSBzdGlsbCBkZWZpbmVkIGluIGxpYm1p
bmd3ZXguYSwNCj4+ICsgKiB3aGljaCBnZXRzIGxpbmtlZCBhdXRvbWF0aWNhbGx5Lg0KPj4g
KyAqLw0KPj4gK2V4dGVybiBpbnQgX19taW5nd19zZXRqbXAoam1wX2J1Zik7DQo+PiArZXh0
ZXJuIHZvaWQgX19hdHRyaWJ1dGVfXygobm9yZXR1cm4pKSBfX21pbmd3X2xvbmdqbXAoam1w
X2J1ZiwgaW50KTsNCj4+ICsjZGVmaW5lIHNldGptcChlbnYpIF9fbWluZ3dfc2V0am1wKGVu
dikNCj4+ICsjZGVmaW5lIGxvbmdqbXAoZW52LCB2YWwpIF9fbWluZ3dfbG9uZ2ptcChlbnYs
IHZhbCkNCj4+ICsjZWxpZiBkZWZpbmVkKF9XSU42NCkNCj4+ICsvKg0KPj4gKyAqIE9uIHdp
bmRvd3MteDY0LCBzZXRqbXAgaXMgaW1wbGVtZW50ZWQgYnkgX3NldGptcCB3aGljaCBuZWVk
cyBhIHNlY29uZCBwYXJhbWV0ZXIuDQo+PiAgICAgKiBJZiB0aGlzIHBhcmFtZXRlciBpcyBO
VUxMLCBsb25nanVtcCBkb2VzIG5vIHN0YWNrIHVud2luZGluZy4NCj4+ICAgICAqIFRoYXQg
aXMgd2hhdCB3ZSBuZWVkIGZvciBRRU1VLiBQYXNzaW5nIHRoZSB2YWx1ZSBvZiByZWdpc3Rl
ciByc3AgKGRlZmF1bHQpDQo+PiAtICogbGV0cyBsb25nam1wIHRyeSBhIHN0YWNrIHVud2lu
ZGluZyB3aGljaCB3aWxsIGNyYXNoIHdpdGggZ2VuZXJhdGVkIGNvZGUuICovDQo+PiArICog
bGV0cyBsb25nam1wIHRyeSBhIHN0YWNrIHVud2luZGluZyB3aGljaCB3aWxsIGNyYXNoIHdp
dGggZ2VuZXJhdGVkIGNvZGUuDQo+PiArICovDQo+PiAgICAjIHVuZGVmIHNldGptcA0KPj4g
ICAgIyBkZWZpbmUgc2V0am1wKGVudikgX3NldGptcChlbnYsIE5VTEwpDQo+PiAtI2VuZGlm
DQo+PiArI2VuZGlmIC8qIF9fYWFyY2g2NF9fICovDQo+IA0KPiBUaGlzIGNvbW1lbnQgaXMg
Y29uZnVzaW5nLCB0aGUgcHJldmlvdXMgaWYgbGFkZGVyIGlzIGFib3V0IGk4Ni4gTWF5YmUN
Cj4gYmV0dGVyIG5vdCBhZGQgYW55IGNvbW1lbnQ/DQoNCklmIEkgYW0gbm90IG1pc3Rha2Vu
LCBiZWZvcmUgd2UgaGFkOg0KDQojaWYgeDY0DQpkZWZpbmUgc2V0am1wIGFzIF9zZXRqbXAo
ZW52LCAwKQ0KI2VuZGlmDQovLyBub3RoaW5nIGRvbmUgZm9yIHg4Ng0KDQphbmQgbm93IHdl
IGhhdmU6DQoNCiNpZiBhYXJjaDY0DQpkZWZpbmUgc2V0am1wIGFzIF9fbWluZ3dfc2V0am1w
DQpkZWZpbmUgbG9uZ2ptcCBhcyBfX21pbmd3X2xvbmdqbXANCiNlbGlmIHg2NA0KZGVmaW5l
IHNldGptcCBhcyBfc2V0am1wKGVudiwgMCkNCiNlbmRpZg0KLy8gbm90aGluZyBkb25lIGZv
ciB4ODYNCg0KTWF5YmUgdGhlIHBhdGNoIGZvcm1hdCBpcyBjb25mdXNpbmcsIG9yIEkgbWlz
c2VkIHdoYXQgeW91IHBvaW50ZWQuDQoNClBpZXJyaWNrDQoNCj4gDQo+IE90aGVyd2lzZSwN
Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJv
Lm9yZz4NCj4gDQo=

