Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43469C81D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:58:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2w6-0004eF-Ds; Mon, 20 Feb 2023 04:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU2w5-0004e1-06
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:58:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU2w3-0006hj-Bp
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:58:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id l1so201133wry.10
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0hniAnY0c5nw7GLbwxXcyk0EvMFXhjxnWVbcAxKMqO0=;
 b=ULbNqRyCmTjXuPHVA00ckeGGxsAByR8r4+p+WOQQTzGXGE1Pz2uxhMipsNCZNOHitt
 jOAGM5dWYYpwFZx8D89LRmDD7H6W1o8/F1IBmT3lkUGdlgZ6MwG39H4wNQ1k9HfNRYbb
 xXgjWCbveUGgyIMcxh5O/WYhyMkv+uMsvSZ8wIUohc+CT0ZZ0n9l0FpRwLjvDeS7Oa+C
 ZYT/shR5ptQeihqf/J96VqUWJlPKyWFxhXSeUkfN9qtINUzV7n+1YkkURuCa6bI8T7vW
 dNHA4rjPa2PMuvexDNULhZ8v26i3aWtUY3YUgn5cZSpNveGcHr6Rspy2RmIsMcec58XT
 A3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hniAnY0c5nw7GLbwxXcyk0EvMFXhjxnWVbcAxKMqO0=;
 b=5ixf0ftgbIsLfXwhEsVdmMX5shCRVQZxocVEc3yYh4qvqdMEK5+pweoPsqkf9kxn05
 tBdABIj4XKhRSMCzZV6G/eTk+zcbCxD2K+LbNwkRFpN8EL1ZLk/i7eqxUYnEPoLhxFuP
 Hc68vgin5N8Hug5gfp3lu83LoTOkuBHAtT5A79OcVp9LXHsRyIHZjk4KN2NnWFHs7TR7
 Vs6By2JHCzHAE+g6bC9eoWweXHUGqeCF6YkUjXe6fLmlALkOKUDCTMpxiL1uMyxyilv/
 gTAN4MCWCBAAEvxT4cZSLXvUFI5Vx62o9/1ExZOWQSMka/O8sYTd8dO5Fv175FJ/6jd/
 qRlA==
X-Gm-Message-State: AO0yUKU/0OYu3wTEMEw9ehYsOe1WWmSs7x1xktxgHeH0BRjDkje8HAOc
 Q3Epv4xwDRIIPKWZwaqwv0Imbw==
X-Google-Smtp-Source: AK7set9v4dOS1NQ1hsZUEHgk8PriPFdKOLq68FiPoB4TBkZSe5sPcnWmymiEqjXtT61YICPgl5OUvQ==
X-Received: by 2002:adf:eac6:0:b0:2c5:52fc:ed1a with SMTP id
 o6-20020adfeac6000000b002c552fced1amr1515772wrn.55.1676887093582; 
 Mon, 20 Feb 2023 01:58:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a5d4b92000000b002c6e8cb612fsm3156838wrt.92.2023.02.20.01.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:58:13 -0800 (PST)
Message-ID: <28cb8a94-39f4-0633-73c3-06ff4de85e9f@linaro.org>
Date: Mon, 20 Feb 2023 10:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/4] util/cacheflush: fix cache on windows-arm64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, 
 richard.henderson@linaro.org, alex.bennee@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-2-pierrick.bouvier@linaro.org>
 <CAFEAcA9yGESbN6GbX-mBL16gPkEacE+xGN6K3mF8nCLGuwJdQQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA9yGESbN6GbX-mBL16gPkEacE+xGN6K3mF8nCLGuwJdQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x436.google.com
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

T24gMi8xNy8yMyAxNjozMiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gT24gVGh1LCAxNiBG
ZWIgMjAyMyBhdCAxMzo0OSwgUGllcnJpY2sgQm91dmllcg0KPiA8cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+DQo+PiBjdHJfZWwwIGFjY2VzcyBpcyBwcml2aWxl
Z2VkIG9uIHRoaXMgcGxhdGZvcm0gYW5kIGZhaWxzIGFzIGFuIGlsbGVnYWwNCj4+IGluc3Ry
dWN0aW9uLg0KPj4NCj4+IFdpbmRvd3MgZG9lcyBub3Qgb2ZmZXIgYSB3YXkgdG8gZmx1c2gg
ZGF0YSBjYWNoZSBmcm9tIHVzZXJzcGFjZSwgYW5kDQo+PiBvbmx5IEZsdXNoSW5zdHJ1Y3Rp
b25DYWNoZSBpcyBhdmFpbGFibGUgaW4gV2luZG93cyBBUEkuDQo+Pg0KPj4gVGhlIGdlbmVy
aWMgaW1wbGVtZW50YXRpb24gb2YgZmx1c2hfaWRjYWNoZV9yYW5nZSB1c2VzLA0KPj4gX19i
dWlsdGluX19fY2xlYXJfY2FjaGUsIHdoaWNoIGFscmVhZHkgdXNlIHRoZSBGbHVzaEluc3Ry
dWN0aW9uQ2FjaGUNCj4+IGZ1bmN0aW9uLiBTbyB3ZSByZWx5IG9uIHRoYXQuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5h
cm8ub3JnPg0KPj4gLS0tDQo+PiAgIHV0aWwvY2FjaGVmbHVzaC5jIHwgMTAgKysrKysrKy0t
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS91dGlsL2NhY2hlZmx1c2guYyBiL3V0aWwvY2FjaGVm
bHVzaC5jDQo+PiBpbmRleCAyYzJjNzNlMDg1Li4wYTBhY2Q3MGZhIDEwMDY0NA0KPj4gLS0t
IGEvdXRpbC9jYWNoZWZsdXNoLmMNCj4+ICsrKyBiL3V0aWwvY2FjaGVmbHVzaC5jDQo+PiBA
QCAtMTIxLDggKzEyMSwxMCBAQCBzdGF0aWMgdm9pZCBzeXNfY2FjaGVfaW5mbyhpbnQgKmlz
aXplLCBpbnQgKmRzaXplKQ0KPj4gICBzdGF0aWMgYm9vbCBoYXZlX2NvaGVyZW50X2ljYWNo
ZTsNCj4+ICAgI2VuZGlmDQo+Pg0KPj4gLSNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKSAmJiAh
ZGVmaW5lZChDT05GSUdfREFSV0lOKQ0KPj4gLS8qIEFwcGxlIGRvZXMgbm90IGV4cG9zZSBD
VFJfRUwwLCBzbyB3ZSBtdXN0IHVzZSBzeXN0ZW0gaW50ZXJmYWNlcy4gKi8NCj4+ICsjaWYg
ZGVmaW5lZChfX2FhcmNoNjRfXykgJiYgIWRlZmluZWQoQ09ORklHX0RBUldJTikgJiYgIWRl
ZmluZWQoQ09ORklHX1dJTjMyKQ0KPj4gKy8qIEFwcGxlIGRvZXMgbm90IGV4cG9zZSBDVFJf
RUwwLCBzbyB3ZSBtdXN0IHVzZSBzeXN0ZW0gaW50ZXJmYWNlcy4NCj4+ICsgKiBXaW5kb3dz
IG5laXRoZXIsIGJ1dCB3ZSB1c2UgYSBnZW5lcmljIGltcGxlbWVudGF0aW9uIG9mIGZsdXNo
X2lkY2FjaGVfcmFuZ2UNCj4+ICsgKiBpbiB0aGlzIGNhc2UuICovDQo+IA0KPiBRRU1VIG11
bHRpbGluZSBjb21tZW50IHN5bnRheCByZXF1aXJlcyB0aGUgLyogYW5kICovIHRvIGJlDQo+
IG9uIGxpbmVzIG9mIHRoZWlyIG93biAoaGVyZSBhbmQgaW4geW91ciBvdGhlciBjb21tZW50
KS4NCj4gDQoNClNvcnJ5LCBJIG1pc3NlZCB0aGF0IHBvaW50IGluIFFFTVUgY29kaW5nIHN0
eWxlLg0KV2lsbCB1cGRhdGUgdGhpcyDwn5GNDQoNCj4gdGhhbmtzDQo+IC0tIFBNTQ0K

