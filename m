Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582E3F005A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 11:23:17 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHn2-0003fL-Di
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 05:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHlO-0001fD-8a
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:21:34 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHlM-0005Nw-7I
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:21:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1329674wml.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=38jauFOST4ZVyHVGJE+ro1HgZRaSu+He00z4fjeTxiI=;
 b=AFrDRHLpjHVh7CR/TWFvrP17RlTKJku70yNE3JqBWrZctDoFs4r2095G/TcrxW4mEI
 v9Osg9gsg3RQr3ZTijrmCeRM1UL0tjzqovCw/92GXphCj4CcVivaCieLB26RLFNzUWUj
 2N/8JaDvr+/bt3W5WbvnrA1EgYSKBgEwAuPn0Wr5qaFXl0864GFzEdUsZgaW6DhaU/VW
 dexWUmOY8AUPOYgaEPzp4IoyU73ubR+7XQVfcVsljl3uOYcgxHYqyUstOZxXeGEqzcUa
 0HKERIjT/q6F/8SfLfniqPkwXFf7M/uBkD/l2VjGSy91i0yS1/xqDkp9Oxob2lD2ZLOT
 rnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=38jauFOST4ZVyHVGJE+ro1HgZRaSu+He00z4fjeTxiI=;
 b=Eq8nptXr/NRLKYki9V/KJaC6sLhPLCk3qMXBuFSO3aIOMICpRIPSPdK8J31x7xIGpq
 dmBqrfuNd4bkXu2LUtuJ9h+SS1YSmxki+mcZIl9OvZL/WmPcLZO8BynkhH5Cc0FwaEO0
 dAA3wmtG+tU5nzsOBj14hpZ2/73NzarFbSTYQwRveXXKXYlFenOYd0D38TTgsv+9LqyF
 UonKceCchqe0iYHpguSbWA3ymiLL4gBzbVFQOmI0XLkthg8n/scLw561KsC9abgwmcun
 9+P3KEII4af5HLhJZ5vExvANkAANQiojrIhHve3V/CIvl6uoUT79oM4pclktT/OAzYIa
 Y51g==
X-Gm-Message-State: AOAM530Pg+u7Dlv6ECw7LfOSO6wKMsSGV8zoyx2Bb/qZHL0KeMRK9yBS
 DiZgNts+B+a9j5T93KjHGYalFcSPHeI=
X-Google-Smtp-Source: ABdhPJwZ//X92Q38XC2nLvCsrlgQ1vzjZiIM/tT8HVGVigftanmn/33BA2SMiwmAcGUGrxBuxtg2NA==
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr7480800wmk.164.1629278490354; 
 Wed, 18 Aug 2021 02:21:30 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g11sm5333801wrd.97.2021.08.18.02.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 02:21:29 -0700 (PDT)
Subject: Re: [PATCH v2 37/55] target/mips: Use 8-byte memory ops for msa
 load/store
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-38-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e346410a-3257-d9a4-b320-c3f4b1765a4e@amsat.org>
Date: Wed, 18 Aug 2021 11:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 6:14 AM, Richard Henderson wrote:
> Rather than use 4-16 separate operations, use 2 operations
> plus some byte reordering as necessary.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/msa_helper.c | 201 +++++++++++++----------------------
>  1 file changed, 71 insertions(+), 130 deletions(-)
> 
> diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
> index a8880ce81c..e40c1b7057 100644
> --- a/target/mips/tcg/msa_helper.c
> +++ b/target/mips/tcg/msa_helper.c
> @@ -8218,47 +8218,31 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
>  #define MEMOP_IDX(DF)
>  #endif
>  
> +#ifdef TARGET_WORDS_BIGENDIAN
> +static inline uint64_t bswap16x4(uint64_t x)
> +{
> +    uint64_t m = 0x00ff00ff00ff00ffull;
> +    return ((x & m) << 8) | ((x >> 8) & m);
> +}
> +
> +static inline uint64_t bswap32x2(uint64_t x)
> +{
> +    return ror64(bswap64(x), 32);
> +}
> +#endif

I'm trying to remove TARGET_WORDS_BIGENDIAN uses,
so this would become:

static inline bool is_cpu_bigendian(CPUMIPSState *)
{
    return extract32(env->CP0_Config0, CP0C0_BE, 1);
}

static inline uint64_t bswap16x4(CPUMIPSState *env, uint64_t x)
{
    if (is_cpu_bigendian(env)) {
        uint64_t m = 0x00ff00ff00ff00ffull;
        return ((x & m) << 8) | ((x >> 8) & m);
    } else {
        return x;
    }
}

static inline uint64_t bswap32x2(CPUMIPSState *env, uint64_t x)
{
    if (is_cpu_bigendian(env)) {
        return ror64(bswap64(x), 32);
    } else {
        return x;
    }
}

And we can remove the other TARGET_WORDS_BIGENDIAN uses:

>  void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
> @@ -8293,18 +8271,20 @@ void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
>  {
>      wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
>      uintptr_t ra = GETPC();
> +    uint64_t d0, d1;
>  
> -#if !defined(HOST_WORDS_BIGENDIAN)
> -    pwd->w[0] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
> -    pwd->w[1] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
> -    pwd->w[2] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
> -    pwd->w[3] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
> -#else
> -    pwd->w[0] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
> -    pwd->w[1] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
> -    pwd->w[2] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
> -    pwd->w[3] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
> +    /*
> +     * Load 8 bytes at a time.  Use little-endian load, then for
> +     * big-endian target, we must then bswap the two words.
> +     */
> +    d0 = cpu_ldq_le_data_ra(env, addr + 0, ra);
> +    d1 = cpu_ldq_le_data_ra(env, addr + 8, ra);
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    d0 = bswap32x2(d0);
> +    d1 = bswap32x2(d1);
>  #endif
> +    pwd->d[0] = d0;
> +    pwd->d[1] = d1;
>  }

But can be done later, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

(nice simplification BTW!).

