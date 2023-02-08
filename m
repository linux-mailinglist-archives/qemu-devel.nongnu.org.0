Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF4468F996
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:14:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrlz-0005QW-LZ; Wed, 08 Feb 2023 16:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPrls-0005M3-Nt
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:14:29 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPrlq-0008LC-Tn
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:14:28 -0500
Received: by mail-pg1-x52d.google.com with SMTP id u75so174603pgc.10
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+cHkCKk2j/7NYYpLejsZtHFs/f/KC/ZgO/F58TNtqj8=;
 b=Zm7zgBK5PrnirEFe04bbjVtWiC0x6XHLyKHHCPDiECEUw6bXZYpIuI4vAIjYJ6IPlW
 30mJ23iwNuyL4taIMKclNEkIeNHfvaOD4i2oFRFP//TaHHdXW/B7NK0Wo4Iu3jP2sINE
 WjVPeaW9oB/adg9aiJNHUbfIN3TFfWB3KgFrdu82G8rMhsb9UlCRkZqUFG/k9ecKAoDd
 g2KY/moAjAbwH4SQDluruAVp00X8uKxN2gC7CX9li/l38nJkhhuoJQUU1nT57a3lmQMn
 v3mLsK11Yx5Klj4M8vrdfBf+ehPVhAZUKhLRZcVgSyKSLEiRMECK5LlgU7Hiub5VI1IK
 3qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cHkCKk2j/7NYYpLejsZtHFs/f/KC/ZgO/F58TNtqj8=;
 b=ZAnLlyUAUZUKXXXK0UYi3ectcu0vuZUNwLCzgD5kswL4989cgj8lVTy6c9kWBGZhTS
 4/psgasinGYtoSTMWNctjrmcRHbN+N4eDKKmIuE5ILMvXqO5yUONQ8v+gKGydkp1vAjK
 aqT8rp3RtZ5z0ftgW/O22chPzN/Nt4mXV7UY9Kl3Ql6SxVu4rQ7ITXK1bEUw2AMgSn4y
 1+eD2RFVb83oxYkb0S8v2sCOW6Uelmdoc7+XO9O3Kmk+R1OPF6ZWXF3RG2JrthG8Sk0Y
 0nYOQWf646WU4OkefDwtuC3MnmtpFQSIlXtann70rCc6nibE52x3cPyNUGu9gJ/HL57j
 cgbA==
X-Gm-Message-State: AO0yUKXAaoTRyL1tJNHQDFaaUjdv5+j288h+qJLyVc5XQzXnpst4MLjo
 OIjcCGlTc/MHohhU00A4r20D7A==
X-Google-Smtp-Source: AK7set+8+WV143ux84Ml7U33iFfluqPQ76Vrf/bo9ehC5mGm4UHX1Q3gyGMD0WWPaQ4auc4DyFx1Sw==
X-Received: by 2002:a05:6a00:4f:b0:5a8:4dea:7014 with SMTP id
 i15-20020a056a00004f00b005a84dea7014mr1129262pfk.27.1675890864573; 
 Wed, 08 Feb 2023 13:14:24 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 f207-20020a6238d8000000b0058d9428e482sm11736789pfa.85.2023.02.08.13.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 13:14:23 -0800 (PST)
Message-ID: <e8aa5585-0e5a-de30-7fc6-669697a79cb0@linaro.org>
Date: Wed, 8 Feb 2023 11:14:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] Replace `TARGET_TB_PCREL` with `CF_PCREL`
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org
References: <20230207104352.11055-1-anjo@rev.ng>
 <20230207104352.11055-3-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230207104352.11055-3-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 00:43, Anton Johansson wrote:
> diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
> index b3f6e78835..083939b302 100644
> --- a/accel/tcg/tb-jmp-cache.h
> +++ b/accel/tcg/tb-jmp-cache.h
>   static inline TranslationBlock *
> -tb_jmp_cache_get_tb(CPUJumpCache *jc, uint32_t hash)
> +tb_jmp_cache_get_tb(CPUJumpCache *jc, uint32_t cflags, uint32_t hash)
>   {
> -#if TARGET_TB_PCREL
> -    /* Use acquire to ensure current load of pc from jc. */
> -    return qatomic_load_acquire(&jc->array[hash].tb);
> -#else
> -    /* Use rcu_read to ensure current load of pc from *tb. */
> -    return qatomic_rcu_read(&jc->array[hash].tb);
> -#endif
> +    if (cflags & CF_PCREL) {
> +        /* Use acquire to ensure current load of pc from jc. */
> +        return qatomic_load_acquire(&jc->array[hash].tb);
> +    } else {
> +        /* Use rcu_read to ensure current load of pc from *tb. */
> +        return qatomic_rcu_read(&jc->array[hash].tb);
> +    }
>   }
>   
>   static inline target_ulong
>   tb_jmp_cache_get_pc(CPUJumpCache *jc, uint32_t hash, TranslationBlock *tb)
>   {
> -#if TARGET_TB_PCREL
> -    return jc->array[hash].pc;
> -#else
> -    return tb_pc(tb);
> -#endif
> +    if (tb_cflags(tb) & CF_PCREL) {
> +        return jc->array[hash].pc;
> +    } else {
> +        return tb_pc(tb);
> +    }
>   }
>   
>   static inline void
>   tb_jmp_cache_set(CPUJumpCache *jc, uint32_t hash,
>                    TranslationBlock *tb, target_ulong pc)
>   {
> -#if TARGET_TB_PCREL
> -    jc->array[hash].pc = pc;
> -    /* Use store_release on tb to ensure pc is written first. */
> -    qatomic_store_release(&jc->array[hash].tb, tb);
> -#else
> -    /* Use the pc value already stored in tb->pc. */
> -    qatomic_set(&jc->array[hash].tb, tb);
> -#endif
> +    if (tb_cflags(tb) & CF_PCREL) {
> +        jc->array[hash].pc = pc;
> +        /* Use store_release on tb to ensure pc is written first. */
> +        qatomic_store_release(&jc->array[hash].tb, tb);
> +    } else{
> +        /* Use the pc value already stored in tb->pc. */
> +        qatomic_set(&jc->array[hash].tb, tb);
> +    }
>   }

These little functions made sense when they were isolating ifdefs.
When they protect a sequence of conditions,

     if (CF_PCREL) {
         a
     } else {
         b
     }
     if (CF_PCREL) {
         c
     } else {
         d
     }
     if (CF_PCREL) {
         e
     } else {
         f
     }

we probably want to hoist one check in the callers.

> +    return ((tb_cflags(a) & CF_PCREL || tb_pc(a) == tb_pc(b)) &&

Similarly things like this, where we have a PCREL test here, and also within tb_pc().

> -    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
> +    h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb_pc(tb)),

etc.

This does too much at once, and also disables TARGET_TB_PCREL for one patch, changing 
behaviour during bisection.


r~

