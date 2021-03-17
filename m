Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2CF33F0EC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:15:18 +0100 (CET)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMW17-0000mJ-N2
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMVzU-0008IA-CM; Wed, 17 Mar 2021 09:13:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMVzS-000745-Gw; Wed, 17 Mar 2021 09:13:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso1301230wmi.0; 
 Wed, 17 Mar 2021 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tyfdIrrUU149tMTriiYqnAsdO45BM9HjBqKRU975yP8=;
 b=nrRxNVpqGYCAmVN+nZR9r+A4kZ9kh5AYlNVRtLXO121mCnZGzE9guGMKam7qzhuKtk
 btvu4iVM6b0ULXSUwn0fddrZShFTLZPi3/gVZzL7eOWNrV2o/bBBDLQSOBFkMl9qJbIn
 /BeU+2ygcSo+7E8xN83381Ga1jHVpMubTGRgg6fi3Aet6f/rH7rnmNx1UnN4Xyr3Ans/
 P+WefXHHwkCh7I9PGmD2xGVAIO0UVHCnE1y0b9XN1DPZxUFYZaeb3Mb8oE7VDxM8VAF9
 DGuM+7aTEG0aqY0LGsYiIsj0Bm8MkknGM36OiTn6JLMeHFqKsmibJbmqR0ujfZsE06Z8
 apqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tyfdIrrUU149tMTriiYqnAsdO45BM9HjBqKRU975yP8=;
 b=r1qM3jRPs1MzMT3DSkUdYClWvx6v6tYYuhcfL5ZIiYv0UfmrYTuHkj9FQTEdBGH6Eq
 Hnx8ay+e2UFXESqSMrDv0OvL42U3rWQHpyd4kUdLE/8E6Sf4/36qqukV+ABMvSFvaRDm
 RoL1wMEciAh213EuCseD0KdwXgW2S6royzY756azKTs24T82rUTjGY9I5IbRZxmgnKYX
 VioyuSoyxN5HxhBJKrRuhkfaAiphjLhKB4aRd3ylnQY4v9Mo5IQhvL7KEFC4E3Vn2Z0L
 4eyVihcFW6ynXyhJYXrH5s5kwz+u18ulGQYhaQlE4OP/0FSF4gy8F+S2eU6w1wAjILE2
 UN2g==
X-Gm-Message-State: AOAM53319SC/X1OS4+rj5BaXbKl17E1G1hhFxiY2EYd9SqdhB3iA9+Bt
 /6YJwGta22Qhbp+nQvB9Yi4=
X-Google-Smtp-Source: ABdhPJzvfDpcHFoUdM2SVhy9tZCHOXp38x4Q/Gg/uNkZweaJOEvWViE/+xreM1tE7GdCqhkB/e9Ilw==
X-Received: by 2002:a1c:1d14:: with SMTP id d20mr3716390wmd.36.1615986812492; 
 Wed, 17 Mar 2021 06:13:32 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j136sm2422973wmj.35.2021.03.17.06.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:13:31 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-2-joel@jms.id.au>
 <d2969a4a-abaf-b4e5-1cdb-5fdac85fa388@amsat.org>
 <6fcc0cc8-e09d-5390-dc3b-593612e404e6@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bc22a53d-f21d-e34e-f075-f8c97fba164d@amsat.org>
Date: Wed, 17 Mar 2021 14:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6fcc0cc8-e09d-5390-dc3b-593612e404e6@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/17/21 1:36 PM, Cédric Le Goater wrote:
> On 3/17/21 12:47 PM, Philippe Mathieu-Daudé wrote:
>> On 3/12/21 11:57 AM, Joel Stanley wrote:
>>> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
>>> SHA2, RSA and other cryptographic algorithms.
>>>
>>> This initial model implements a subset of the device's functionality;
>>> currently only direct access (non-scatter gather) hashing.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>> v3:
>>>  - rebase on upstream to fix meson.build conflict
>>> v2:
>>>  - reorder register defines
>>>  - mask src/dest/len registers according to hardware
>>> ---
>>>  include/hw/misc/aspeed_hace.h |  33 ++++
>>>  hw/misc/aspeed_hace.c         | 312 ++++++++++++++++++++++++++++++++++
>>>  hw/misc/meson.build           |   1 +
>>>  3 files changed, 346 insertions(+)
>>>  create mode 100644 include/hw/misc/aspeed_hace.h
>>>  create mode 100644 hw/misc/aspeed_hace.c

>>> +static int do_hash_operation(AspeedHACEState *s, int algo)
>>> +{
>>> +    hwaddr src, len, dest;
>>> +    uint8_t *digest_buf = NULL;
>>> +    size_t digest_len = 0;
>>> +    char *src_buf;
>>> +    int rc;
>>> +
>>> +    src = 0x80000000 | s->regs[R_HASH_SRC];
>>> +    len = s->regs[R_HASH_SRC_LEN];
>>> +    dest = 0x80000000 | s->regs[R_HASH_DEST];
>>> +
>>> +    src_buf = address_space_map(&s->dram_as, src, &len, false,
>>> +                                MEMTXATTRS_UNSPECIFIED);
>>
>> It seems the Aspeed machines aren't using correctly the AS API...
>> This device shouldn't worry about where it is physically mapped.
>> IOW its AS is too wide.
>>
>> I'm trying to fix this in a series:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg791085.html
> 
> The buffers can be anywhere in DRAM

Exactly. This device only requires direct access to DRAM, not the
full bus. Regardless the amount of DRAM available, only the bus
aperture to the DRAM should be passed to this device (MR link),
then this device use an AS view on it, zero-based.

Your device becomes independent to where the DRAM is physically
mapped on the SoC.

> which is mapped at 0x80000000
> on the AST2600. This is correct and very similar to what we do 
> in the Aspeed SMC DMA models.
> 
> I would prefer if we did loads though.
> 
> Cheers,
> 
> C.
> 
> 

