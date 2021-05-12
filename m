Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E037C763
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:13:46 +0200 (CEST)
Received: from localhost ([::1]:34726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrUX-0008Rj-3S
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrOQ-0006IQ-St
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:07:26 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:44568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrOO-0004jd-FS
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:07:26 -0400
Received: by mail-qt1-x82a.google.com with SMTP id y12so17569793qtx.11
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rhx/vEPkUE5wAJhRa9puML+p8F5Gzc4gc+uQHKDiogk=;
 b=Mef7YJzCBYuctaK+Nb+A74j/5Lyun1498jBPRhBliSB22pkjTqKpbD2r2ZuVm98PXN
 EswqeTntOR7gfKCP5x6zdRrh0MMsPpYxQfUj1IVe9u0Bkb9rL18jov4MP32aXCGbRbWw
 LLqKHBj2K6SRyJu1m0lY9rJXGnlt7qu0rwgcEzZQaA+V02pnvS+O0pvx4W6BUmnR446S
 HcevYG6DFS7+ii4cjcgSd8es2yYxzkOhJ1XUEvCoUxyo2Gr8UNZEM788raPg0qJEgSMj
 OExKkRg6ObDb/YAIT2x4qRDAPUhZfq40peXF53XUfzgfCZoGYvoNgBFdU09f6PmDTURu
 qJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rhx/vEPkUE5wAJhRa9puML+p8F5Gzc4gc+uQHKDiogk=;
 b=fQIlp0+GvOWPDOsuIRCmhaR4bYq/AcYTlE0AT2S0wkWAxV1U8g6yULIF4NLfGf+dmK
 OKdKjL1LT4KsGCO1D2bzIZrzPbHMAF+SF/dz5ZGHVnsLZiccj5A1XXFAGsIawqu9eclW
 jd/N0d+NAjkGFlW4nhAVAIk6+r3w1QUCIZw24xsHaWSPu2kkBN5snzzVbnEnSjj0vKnw
 iGV61Aq2Dxy/YywGcjrT17lWvihqhLyoYWa3Gg1e5jJ4CZod2YGyWcCTLCrzYVnP/Wta
 JsCQhSchGOZ+6YPo1qqh0NaTo/C74FM8oar2Ya2dek9QPKJsMpNrPmzw2eiDNhWOGlvj
 2sIQ==
X-Gm-Message-State: AOAM532ZrRISv2GJyety7wG+AeRka9wIdXMhOPOhzpRNEqqguO+JKP2m
 ICDJds/D0j2GHNPf+SQCoH7Yyg==
X-Google-Smtp-Source: ABdhPJzrbZf8/NV3rXIeCYrAMx6Il/cqFFXJMnLDXDyuzTMiZGDZAafR6PcuTlvJHaxny8dEA96UHg==
X-Received: by 2002:ac8:5dcc:: with SMTP id e12mr22394488qtx.70.1620835643371; 
 Wed, 12 May 2021 09:07:23 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id z11sm285525qto.95.2021.05.12.09.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:07:23 -0700 (PDT)
Subject: Re: [PATCH v6 26/82] target/arm: Implement SVE2 SHRN, RSHRN
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-27-richard.henderson@linaro.org>
 <CAFEAcA_OknopgKOtwAoiLrKEXmtNDYpQ5EycnkzBuNbc7WLWag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2aaae8fa-a3d9-a88e-53f8-eba2c789e55c@linaro.org>
Date: Wed, 12 May 2021 11:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_OknopgKOtwAoiLrKEXmtNDYpQ5EycnkzBuNbc7WLWag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 3:52 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 21:49, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v2: Fix typo in gen_shrnb_vec (laurent desnogues)
>> v3: Replace DO_RSHR with an inline function
>> ---
>>   target/arm/helper-sve.h    |  16 ++++
>>   target/arm/sve.decode      |   8 ++
>>   target/arm/sve_helper.c    |  54 ++++++++++++-
>>   target/arm/translate-sve.c | 160 +++++++++++++++++++++++++++++++++++++
>>   4 files changed, 236 insertions(+), 2 deletions(-)
> 
>> -#undef DO_SHR
>> -#undef DO_SHL
> 
> Did we want to move the #undef DO_SHR/DO_SHL rather than just deleting them ?
> (I have to admit I'm not sure to what extent undeffing all of these macros is
> worth the effort -- I ran into similar minor awkwardness in the MVE
> helper .c file.)

Yeah, I'm not sure.  I've vaguely been thinking that the "operation" defines, 
such as this one, should stay defined
but that the expansion ones, such as...

> 
>>   #undef DO_ASRD
>>   #undef DO_ZPZI
>>   #undef DO_ZPZI_D

... these should only stay for their "scope".  But even that could be 
considered pointless.

AFAIR, DO_SHR/DO_SHL are pre-existing from the SVE1 work?

>> +#define DO_SHRNB(NAME, TYPEW, TYPEN, OP) \
>> +void HELPER(NAME)(void *vd, void *vn, uint32_t desc)         \
>> +{                                                            \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                   \
>> +    int shift = simd_data(desc);                             \
>> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {            \
>> +        TYPEW nn = *(TYPEW *)(vn + i);                       \
>> +        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, shift);           \
>> +    }                                                        \
>> +}
> 
> Doesn't this need some H() macros, the way the T version does ?

No.  In the "B" version, we're manipulating strict columns (TYPEW in both VN 
and VD), and do not care in which order the columns are processed.

The "T" version reads TYPEW and writes TYPEN, which makes us have to care more 
about addressing.


r~

