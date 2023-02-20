Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD5369D051
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:10:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7oD-0008Eu-Bq; Mon, 20 Feb 2023 10:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7o8-0008Ce-JK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:10:25 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7o6-00013r-Jl
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:10:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m23so1136614wms.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UE18z/QlrJCnZUm8DT8pzvbuA7yMHV5h7O5mu2sRt4A=;
 b=jHpcuWzuPxZFKHtYq2fpgLeeGXRI0o+Nw6+3WeufR757R0pMnXTI7vp2DoHLj6rj+4
 XFFUqTDpEum9vk7u9Me/dP5mAobYH6wYOfW28nrhFew54TRhIckdbcVf/M8kMw41qPLk
 zvUXjU4Olg5KYgv0U77EyagvDP/VzMvjremJrko2C0BV36zXNSmnJqErJwgMtP9cTk0V
 QwBaTXkS7hS3OLXeQGgUir5BWqrPUDX1qBg8SwTfh36oXThvI74J4RuIPv2jOGBZdOlY
 aDZ94RbI4oKUajvq30a31uOiN0VWL2Ys500F9vR/ke6SxIc8u51C6tP8MIXiIHHnp1Al
 1RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UE18z/QlrJCnZUm8DT8pzvbuA7yMHV5h7O5mu2sRt4A=;
 b=Ta4ON9xYyibYTx1qIepUnmND94KAATqyAF5beQR8tO7VB5jhNcBj/uKX4myZ9o+8XI
 RYeB7hhMXcluXCmlhu3wJJLvJ3XqDIAcqeYBxm17c6qFKECGb5Q/GwY8WmFpotN4poln
 Z9KspmQTIb5z2biF4zZPND0GKj0y8Og0rWnx/kFgrm6Wec4uV/moAlLQySNVeAHqd0f6
 KRZHaIREJyS+JtubsTvAsBptl3GwqpsZA3AEWvHkmOUaJAarLTL6IOlCYyX4bHuYgufh
 DWhaQgEXxk/NHo2ABYxRG+ibjKCbl+tCQ2ElbKnRc1WNiIZAdopGr1bMBFK5cO7HQxff
 tklQ==
X-Gm-Message-State: AO0yUKXzHVp09O3vSfBM7bipWDIlsyvIsn4kQy4By208rLpFzU6D0gTo
 x5q+JF1jXooEPOFB1YYnRuLheA==
X-Google-Smtp-Source: AK7set+u/2kTkgsWNMgYY2fR98PScm19V3jNlZDoXfiY7lhwTyODvFZVepUQmsw0Lb5SLXQ3S/dQRw==
X-Received: by 2002:a05:600c:2e86:b0:3dc:55e6:fffd with SMTP id
 p6-20020a05600c2e8600b003dc55e6fffdmr625621wmn.15.1676905821026; 
 Mon, 20 Feb 2023 07:10:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 az17-20020a05600c601100b003dd1bd0b915sm11639072wmb.22.2023.02.20.07.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 07:10:20 -0800 (PST)
Message-ID: <e11a2ec2-fecf-48b5-1a28-a2dd6669ae9d@linaro.org>
Date: Mon, 20 Feb 2023 16:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 0/4] Adds support for running QEMU natively on
 windows-arm64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <bcf0b85d-edbf-335f-ac74-c27a4cecdcb8@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <bcf0b85d-edbf-335f-ac74-c27a4cecdcb8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32f.google.com
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

T24gMi8yMC8yMyAxMjozMywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IEhp
IFBpZXJyaWNrLA0KPiANCj4gT24gMjAvMi8yMyAxMjoxMiwgUGllcnJpY2sgQm91dmllciB3
cm90ZToNCj4+IFNpbmNlIHYyOg0KPj4NCj4+IC0gRGVsZXRlIHN1cGVyZmx1b3VzIGNvbW1l
bnQgb24gdW5yZWFjaGFibGUgY29kZQ0KPj4gLSBGaXggc3R5bGUgZm9yIG11bHRpbGluZSBj
b21tZW50cw0KPj4NCj4+IFNpbmNlIHYxOg0KPj4NCj4+IC0gQ29tbWVudCB3aHkgd2UgdXNl
IGdlbmVyaWMgdmVyc2lvbiBvZiBmbHVzaF9pZGNhY2hlX3JhbmdlDQo+PiAtIEVuc3VyZSBf
X21pbmd3X3NldGptcC9sb25nam1wIGFyZSBhdmFpbGFibGUgdXNpbmcgbWVzb24NCj4+IC0g
Rml4IGEgd2FybmluZyBieSBjYWxsaW5nIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkgaW5zdGVh
ZCBvZiBpbml0aWFsaXppbmcgYQ0KPj4gICAgIHZhcmlhYmxlDQo+Pg0KPj4gQXMgYmVmb3Jl
IHRoaXMgd2FzIHRlc3RlZCB3aXRoOg0KPj4gLSBtYWtlIGNoZWNrDQo+PiAtIGJvb3QgYW4g
eDY0IGRlYmlhbiBidWxsc2V5ZSB2bQ0KPj4gLSBib290IGFuIGFybTY0IHVidW50dSAyMi4x
MCB2bQ0KPj4NCj4+IFRoYW5rcw0KPj4NCj4+IFBpZXJyaWNrIEJvdXZpZXIgKDQpOg0KPj4g
ICAgIHV0aWwvY2FjaGVmbHVzaDogZml4IGNhY2hlIG9uIHdpbmRvd3MtYXJtNjQNCj4+ICAg
ICBzeXNlbXUvb3Mtd2luMzI6IGZpeCBzZXRqbXAvbG9uZ2ptcCBvbiB3aW5kb3dzLWFybTY0
DQo+PiAgICAgcWdhL3Zzcy13aW4zMjogZml4IHdhcm5pbmcgZm9yIGNsYW5nKystMTUNCj4+
ICAgICB0YXJnZXQvcHBjOiBmaXggd2FybmluZyB3aXRoIGNsYW5nLTE1DQo+IA0KPiBZb3Ug
Zm9yZ290IHRvIGluY2x1ZGUgdGhlICdSZXZpZXdlZC1ieS9BY2tlZC1ieScgdGFncyBmcm9t
IHlvdXIgcHJldmlvdXMNCj4gdmVyc2lvbnMuIFNlZSBmcm9tIHRoZXNlIGd1aWRlbGluZXM6
DQo+IGh0dHBzOi8vd3d3LnFlbXUub3JnL2RvY3MvbWFzdGVyL2RldmVsL3N1Ym1pdHRpbmct
YS1wYXRjaC5odG1sI3Byb3Blci11c2Utb2YtcmV2aWV3ZWQtYnktdGFncy1jYW4tYWlkLXJl
dmlldw0KPiANCj4gICAgIFdoZW4gcmV2aWV3aW5nIGEgbGFyZ2Ugc2VyaWVzLCBhIHJldmll
d2VyIGNhbiByZXBseSB0byBzb21lIG9mIHRoZQ0KPiAgICAgcGF0Y2hlcyB3aXRoIGEgUmV2
aWV3ZWQtYnkgdGFnLCBzdGF0aW5nIHRoYXQgdGhleSBhcmUgaGFwcHkgd2l0aA0KPiAgICAg
dGhhdCBwYXRjaCBpbiBpc29sYXRpb24gWy4uLl0uIFlvdSBzaG91bGQgdGhlbiB1cGRhdGUg
dGhvc2UgY29tbWl0DQo+ICAgICBtZXNzYWdlcyBieSBoYW5kIHRvIGluY2x1ZGUgdGhlIFJl
dmlld2VkLWJ5IHRhZywgc28gdGhhdCBpbiB0aGUgbmV4dA0KPiAgICAgcmV2aXNpb24sIHJl
dmlld2VycyBjYW4gc3BvdCB3aGljaCBwYXRjaGVzIHdlcmUgYWxyZWFkeSBjbGVhbiBmcm9t
DQo+ICAgICB0aGUgcHJldmlvdXMgcm91bmQuDQo+IA0KPiBObyBuZWVkIGZvciBhIHY0LCB5
b3UgY2FuIHJlcGx5IHRvIGVhY2ggcGF0Y2ggd2l0aCB0aGUgbWlzc2VkIHRhZ3MuDQoNClRo
YW5rcyBmb3IgeW91ciBraW5kIGd1aWRhbmNlLiBJIHdhcyBub3Qgc3VyZSBpZiBJIG9yIGEg
bWFpbnRhaW5lciB3YXMgDQoiYWxsb3dlZCIgdG8gYWRkIHRob3NlIHRhZ3MgaW4gY29tbWl0
IG1lc3NhZ2UuDQoNCkknbGwgZG8gaXQgKGluIGNhc2UgYSB2NCBpcyBuZWVkZWQpLCBhbmQg
Zm9yIG5vdywganVzdCByZXBseSB3aXRoIA0KcHJldmlvdXMgb25lcy4NCg==

