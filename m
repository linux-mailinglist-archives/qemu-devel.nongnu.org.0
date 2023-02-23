Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01C6A1377
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKae-00033h-Ve; Thu, 23 Feb 2023 18:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVKaY-00032a-Nq
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:01:22 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVKaW-0002su-Up
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:01:22 -0500
Received: by mail-pf1-x442.google.com with SMTP id d7so6911671pfu.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OoEe3LAQIxkXdoYinbdEbIJsOrkhLH+r19qzP5aOP2Q=;
 b=iiCVzOZeuQ1MFJy3ci2et1wK9IJK+Y4aPgLThZ+4z9s/hEw9AxGtXDe0zy8JT5UUXc
 K5tBqqnns4L56gOkmT9AmP5lt7w7ymRth6o8OIQecA3lzHZYfpqZEAhbeEfEaGA83C3A
 ptchJchZDXWF8DA3w3XIF/X81Ku4p+YQfI7GQ3PNgXpcRWFtzBVCQeFb48mDS9rpTJHQ
 Vjix9PBYK8CJ4bP2spqF+9XdlBuQGenKb8nUe6YxFu0QsN1bbEfrjnCK5eO9MyK/pAh3
 bpmdSwWv6YR5Blhrez8AlCCeDxlj527zygX/JxmrqE6SZg/quY24u4AqPvdb2KKbzray
 HQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OoEe3LAQIxkXdoYinbdEbIJsOrkhLH+r19qzP5aOP2Q=;
 b=t1LqJgPyUyZ9rHXsNT5IMX15Cdf9yrUwzJ/p8ORggVmi1f9QhxFY06QLthEg6yWtC8
 BrXvNPaIbuFI6uSaF5++p/5wjbH+Qzih/InKRvbgUA6mUOz+KpbxO2CYH5LcUJ8QoAEw
 StZdKCVR6NFvf4q04dsQVLSwu6WLvAlyOm8fBCxoJRqtT2d8p2tAqGpwlOIL8ytbOLZr
 tkCAr8Is8vGg6wZnO/bGoeVmM345KtAA9sgBTjqSMHDo/rFLWPgpi+CpVkSjGU0AH0AR
 uz03rQZq4xAXyWxnWmvzhbTgNhy7ry4usDVtExlAspCWeBcQkY3kcJBWD9BSQtjIqzod
 9qcA==
X-Gm-Message-State: AO0yUKV6mMU7ve+tVMu5yZ34F0A7e0fJT5VdBlGIUSiS1n6OmeZuJ/gG
 YVGIGP45WIjySiMBGTMlnlli3A==
X-Google-Smtp-Source: AK7set/SgF9SDI9so6u+NTVcuutjfihPn9dak2Nuzlm9WCPOSwG0sSDGk9ZblcUlEsHW3tvofr8M7g==
X-Received: by 2002:a62:7bce:0:b0:5ce:ef1b:a80 with SMTP id
 w197-20020a627bce000000b005ceef1b0a80mr7842434pfc.32.1677193279034; 
 Thu, 23 Feb 2023 15:01:19 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v10-20020a62ac0a000000b005dea362ed18sm1435839pfe.27.2023.02.23.15.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:01:18 -0800 (PST)
Message-ID: <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
Date: Thu, 23 Feb 2023 13:01:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222110104.3996971-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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

On 2/22/23 01:01, Alex Bennée wrote:
> This is a mandatory feature for Armv8.1 architectures but we don't
> state the feature clearly in our emulation list. While checking verify
> our cortex-a76 model matches up with the current TRM by breaking out
> the long form isar into a more modern readable FIELD_DP code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>   target/arm/cpu_tcg.c          |  2 +-
>   3 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 2062d71261..2c4fde5eef 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -14,6 +14,7 @@ the following architecture extensions:
>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>   - FEAT_BTI (Branch Target Identification)
> +- FEAT_CRC32 (CRC32 instruction)
>   - FEAT_CSV2 (Cache speculation variant 2)
>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4066950da1..12e1a532ab 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>   static void aarch64_a76_initfn(Object *obj)
>   {
>       ARMCPU *cpu = ARM_CPU(obj);
> +    uint64_t t;
> +    uint32_t u;
>   
>       cpu->dtb_compatible = "arm,cortex-a76";
>       set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>       cpu->ctr = 0x8444C004;
>       cpu->dcz_blocksize = 4;
>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
> +
> +    /* per r4p1 of the Cryptographic Extension TRM */
> +    t = cpu->isar.id_aa64isar0;
> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
> +    cpu->isar.id_aa64isar0 = t;

Ok, so, this might be helpful for grepping, but it's not helpful for reading the 
documentation, which on page B2-137 uses hex.


r~

