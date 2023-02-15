Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D88697C3C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHEL-0007Jd-F6; Wed, 15 Feb 2023 07:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSHEB-0007JH-R7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:49:39 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSHEA-0003ll-19
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:49:39 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso1530752wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QeOytmHTDkNCb2mXdKxTJy40RSS5mTcARwwdE0p9bGc=;
 b=mBvXHZUvDyZGe0lpfIf0esbkVtRwiKgA2bDT8UGwUMtmPBwvqWacGpaU3w5AOx1ofZ
 hZUTcRft+rJylv8g7oWCOqSW6WSYloROaXLKiwLR28Hqqp5+MEP8oJpSDJvgZrwzoR1V
 vJdjKpLgHpYFPsULV90ofPWqWOHjJKaJnK5zsoVTJjZkRbuuQGy9qLBrGrrhy/J40e5K
 wEwi5u0caCDRzUrCfn09b1pipbt8IwlvoHJmIKNKD7VRc+iCAHFvdsEkGb63WhndO7vT
 kOkG4v0sWpX4Q4kURdprRHVAU/pXx6I1wNGTh0qVzH/UGSJ2SjE3G+j8KfOQSzd8KExy
 OwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QeOytmHTDkNCb2mXdKxTJy40RSS5mTcARwwdE0p9bGc=;
 b=AxyyJFyrd0Lt29j/ijpsGG6KutMwH7xPDdGxgWf95jFJRvXgqCvtgz65S5MCVhsCQ3
 mCEpn4Ir/DR45kcL4RiwtKqcqm/ryaO7pPWiizK9RBWLPLhH6DisW/6shSwK1czmrU8L
 O9UbAfPaC0eqpmg0+0rwSqJ7ZXg3aMXwyLS2jGpKwEDfDYcomLH+ud0W57SzF1hOljMV
 r0WLkLNmJBQKyaV+o1ATkIeZTUoX9fG3NRYUBbx7VL9h0PjYpgtNv+LCOBw6+qRBhWYJ
 Sphp4NtY8jSh8OssuB+XzOLBUOJxTX+B01qU0jduaay50Imi4O/jqv+9M5tr0k6tNi1O
 MJeA==
X-Gm-Message-State: AO0yUKU8om7B9ZqwGLeA6jGQWeW1GlCbR7scm1c0Ay9GJEOvO27frRMv
 37vtfND/YvudJdmxkxsMKuTP7A==
X-Google-Smtp-Source: AK7set/DpjONV4OcvyaWk08QiCKOR3DgVmAOwy8fH//PgZYuA2QNPsZiPkHeUXBzLX0JjWAJMaLaqQ==
X-Received: by 2002:a05:600c:991:b0:3dc:c05:9db6 with SMTP id
 w17-20020a05600c099100b003dc0c059db6mr1811356wmp.33.1676465375650; 
 Wed, 15 Feb 2023 04:49:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:29a7:806a:58e3:c738?
 ([2a01:e0a:5cc:caa0:29a7:806a:58e3:c738])
 by smtp.gmail.com with ESMTPSA id
 az7-20020a05600c600700b003dfe659f9b1sm6176575wmb.3.2023.02.15.04.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 04:49:35 -0800 (PST)
Message-ID: <01e0e1f1-96ea-2294-f8ea-8a36320021e5@linaro.org>
Date: Wed, 15 Feb 2023 13:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/4] util/cacheflush: fix illegal instruction on
 windows-arm64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, 
 richard.henderson@linaro.org, alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-2-pierrick.bouvier@linaro.org>
 <CAFEAcA--p8kRsbTy4vg83fEap_MO--HEMcOGGnnXzcxJYZW6Mw@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA--p8kRsbTy4vg83fEap_MO--HEMcOGGnnXzcxJYZW6Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

T24gMi8xNC8yMyAxNzo0NCwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gT24gTW9uLCAxMyBG
ZWIgMjAyMyBhdCAyMDo1MCwgUGllcnJpY2sgQm91dmllcg0KPiA8cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+DQo+PiBtcnMgaW5zdHJ1Y3Rpb24gZmFpbHMgYXMg
YW4gaWxsZWdhbCBpbnN0cnVjdGlvbi4NCj4+IEZvciBub3csIG5vIGNhY2hlIGluZm9ybWF0
aW9uIGlzIHJldHJpZXZlZCBmb3IgdGhpcyBwbGF0Zm9ybS4NCj4+IEl0IGNvdWxkIGJlIHNw
ZWNpYWxpemVkIGxhdGVyLCB1c2luZyBXaW5kb3dzIEFQSS4NCj4gDQo+IFVubGVzcyBJJ20g
bWlzcmVhZGluZyB0aGUgY29kZSwgdGhlcmUncyBhIHN5c19jYWNoZV9pbmZvKCkNCj4gaW1w
bGVtZW50YXRpb24gdGhhdCdzIG9ubHkgZ3VhcmRlZCBieSBpZiBkZWZpbmVkKF9XSU4zMiks
IHNvDQo+IHByZXN1bWFibHkgd2UncmUgdXNpbmcgdGhhdCBvbiBBQXJjaDY0IGFsc28uIERv
ZXMgaXQgcmV0dXJuDQo+IHNlbnNpYmxlIHZhbHVlcyA/DQo+IA0KDQpZZXMsIGl0IHdvcmtz
IG9uIGFybTY0LCBhbmQgSSBjaGVja2VkIGl0IHdhcyByZXR1cm5lZCBieSB0aGUgZXhwZWN0
ZWQgDQoid2luZG93cyB2ZXJzaW9uIiBmdW5jdGlvbiBzeXNfY2FjaGVfaW5mby4NCk9uIG15
IG1hY2hpbmUsIGhhdmluZyBhIHNuYXBkcmFnb24gOGN4IGdlbjMgcHJvY2Vzc29yLCBpdCBy
ZXR1cm5zICg2NCwgNjQpLg0KDQpJdCdzIG9uIHBhciB3aXRoIHdoYXQgSSBjYW4gc2VlIGZy
b20gYSBXU0wxIGVudmlyb25tZW50IChMaW51eCwgd2l0aG91dCANClZNKSBvbiB0aGUgc2Ft
ZSBtYWNoaW5lOg0KJCBnZXRjb25mIExFVkVMMV9EQ0FDSEVfTElORVNJWkUNCjY0DQokIGdl
dGNvbmYgTEVWRUwxX0lDQUNIRV9MSU5FU0laRQ0KNjQNCg0KPj4gU2lnbmVkLW9mZi1ieTog
UGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPj4gLS0t
DQo+PiAgIHV0aWwvY2FjaGVmbHVzaC5jIHwgNSArKystLQ0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS91dGlsL2NhY2hlZmx1c2guYyBiL3V0aWwvY2FjaGVmbHVzaC5jDQo+PiBpbmRleCAyYzJj
NzNlMDg1Li4xNDlmMTAzZDMyIDEwMDY0NA0KPj4gLS0tIGEvdXRpbC9jYWNoZWZsdXNoLmMN
Cj4+ICsrKyBiL3V0aWwvY2FjaGVmbHVzaC5jDQo+PiBAQCAtMTIxLDggKzEyMSw5IEBAIHN0
YXRpYyB2b2lkIHN5c19jYWNoZV9pbmZvKGludCAqaXNpemUsIGludCAqZHNpemUpDQo+PiAg
IHN0YXRpYyBib29sIGhhdmVfY29oZXJlbnRfaWNhY2hlOw0KPj4gICAjZW5kaWYNCj4+DQo+
PiAtI2lmIGRlZmluZWQoX19hYXJjaDY0X18pICYmICFkZWZpbmVkKENPTkZJR19EQVJXSU4p
DQo+PiArI2lmIGRlZmluZWQoX19hYXJjaDY0X18pICYmICFkZWZpbmVkKENPTkZJR19EQVJX
SU4pICYmICFkZWZpbmVkKENPTkZJR19XSU4zMikNCj4+ICAgLyogQXBwbGUgZG9lcyBub3Qg
ZXhwb3NlIENUUl9FTDAsIHNvIHdlIG11c3QgdXNlIHN5c3RlbSBpbnRlcmZhY2VzLiAqLw0K
Pj4gKy8qIERvZXMgbm90IHdvcmsgb24gd2luZG93cy1hcm02NCwgaWxsZWdhbCBpbnN0cnVj
dGlvbiB1c2luZyBtcnMgKi8NCj4gDQo+IFRoaXMgY29tbWVudCBzaG91bGQgYmUgYmV0dGVy
IGludGVncmF0ZWQgd2l0aCB0aGUgcHJldmlvdXMsIGJlY2F1c2UNCj4gdGhlIHJlYXNvbiBm
b3IgdGhlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uIG9uIFdpbmRvd3MgaXMgdGhl
DQo+IHNhbWUgYXMgZm9yIG1hY29zIC0tIHRoZSBPUyBkb2Vzbid0IGV4cG9zZSBDVFJfRUww
IHRvIHVzZXJzcGFjZS4NCj4gDQoNCkknbGwgdXBkYXRlIHRoZSBjb21tZW50IPCfkY0NCg0K
Pj4gICBzdGF0aWMgdWludDY0X3Qgc2F2ZV9jdHJfZWwwOw0KPj4gICBzdGF0aWMgdm9pZCBh
cmNoX2NhY2hlX2luZm8oaW50ICppc2l6ZSwgaW50ICpkc2l6ZSkNCj4+ICAgew0KPj4gQEAg
LTIyNSw3ICsyMjYsNyBAQCBzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChjb25zdHJ1Y3Rv
cikpIGluaXRfY2FjaGVfaW5mbyh2b2lkKQ0KPj4NCj4+ICAgLyogQ2FjaGVzIGFyZSBjb2hl
cmVudCBhbmQgZG8gbm90IHJlcXVpcmUgZmx1c2hpbmc7IHN5bWJvbCBpbmxpbmUuICovDQo+
Pg0KPj4gLSNlbGlmIGRlZmluZWQoX19hYXJjaDY0X18pDQo+PiArI2VsaWYgZGVmaW5lZChf
X2FhcmNoNjRfXykgJiYgIWRlZmluZWQoQ09ORklHX1dJTjMyKQ0KPiANCj4gVGhpcyB3aWxs
IGNhdXNlIHVzIHRvIG5vdCB1c2UgdGhlIGdlbmVyaWMgYWFyY2g2NCBmbHVzaF9pZGNhY2hl
X3JhbmdlKCksDQo+IHdoaWNoIHVzZXMgREMgQ1ZBVSBhbmQgSUMgSVZBVS4gRG9lcyB0aGF0
IG5vdCB3b3JrIG9uIFdpbmRvd3M/DQo+IA0KPiBJZiBpdCBkb2Vzbid0IHRoZW4gSSB0aGlu
ayB0aGUgaWZkZWZmZXJ5IHdvdWxkIGJlIG1vcmUgY2xlYXJseQ0KPiBzdHJ1Y3R1cmVkIGFz
DQo+IA0KPiAjZWxpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPiANCj4gaWZkZWYgQ09ORklH
X0RBUldJTg0KPiBbbWFjb3MgaW1wbGVtZW50YXRpb24gb2YgZmx1c2hfaWRjYWNoZV9yYW5n
ZV0NCj4gI2VsaWYgZGVmaW5lZChDT05GSUdfV0lOMzIpDQo+IC8qIEV4cGxhbmF0aW9uIGhl
cmUgb2Ygd2h5IHRoZSBnZW5lcmljIHZlcnNpb24gZG9lc24ndCB3b3JrICovDQo+ICNlbHNl
DQo+IC8qIGdlbmVyaWMgdmVyc2lvbiAqLw0KPiAjZW5kaWYNCj4gDQo+ICNlbGlmIGRlZmlu
ZWQoX19taXBzX18pDQo+IA0KPiBldGMNCj4NCg0KRm9yIG5vdywgdGhlIGdlbmVyaWMgZmx1
c2hfaWRjYWNoZV9yYW5nZSwgdXNpbmcgX19idWlsdGluX19fY2xlYXJfY2FjaGUgDQppcyB1
c2VkLiBSaWNoYXJkIG1lbnRpb25lZCAndGhlcmUgKm11c3QqIGJlIGEgcmVwbGFjZW1lbnQs
IG9yIFRDRyB3aWxsIA0Kbm90IHdvcmsnLg0KDQpBcyBzYWlkIGluIHRoZSBjb3ZlciBsZXR0
ZXIsIEkgY291bGQgc3VjY2Vzc2Z1bGx5IGluc3RhbGwgYW5kIGJvb3QgYW4gDQphcm02NCBh
bmQgeDY0IHZtLg0KDQpJJ20gbm90IGFuIGV4cGVydCBvbiB0aGlzIGFyZWEsIGJ1dCBJIGlt
YWdpbmUgdGhhdCBib290aW5nIGEgZnVsbCBWTSANCndpbGwgZm9yY2UgVENHIHRvIGVtaXQg
Y29kZSBhdCB0aGUgc2FtZSBhZGRyZXNzIHR3aWNlIChhZnRlciBoYXZpbmcgDQpnZW5lcmF0
ZWQgZW5vdWdoIHRyYW5zbGF0ZWQgYmxvY2tzKSwgd2hpY2ggc2hvd3MgdGhhdCBnZW5lcmlj
IA0KZmx1c2hfaWRjYWNoZV9yYW5nZSB3b3Jrcy4gSXMgdGhhdCByZWFzb25pbmcgY29ycmVj
dD8NCg0KRG8geW91IHRoaW5rIHdlIHN0aWxsIG5lZWQgYSBzcGVjaWFsaXplZCB2ZXJzaW9u
IGZvciB3aW5kb3dzLWFybTY0Pw0KDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==

