Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A865B98FE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 12:42:01 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYmJk-0007y5-BR
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 06:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYmGw-0006CT-7u
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 06:39:07 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYmGu-0001YC-6f
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 06:39:06 -0400
Received: by mail-io1-xd2d.google.com with SMTP id d8so11479377iof.11
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 03:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=symw+DbjQ2zBAiOG7Ww9pzYo/lv3yb1KnWrm0Ez+2VI=;
 b=zb3NyZhEV+AM04vVpExLOOq6yd3lPTRBDdRhWlXfglsSKwNKo3Hk9SC9UbYerouv4v
 1wCSGIosRJekYpC+TbmcpLEOoMx7W+twYQZ9mbVL0fcKCYLC2cqFQs1blFKi75tDYzmS
 o+7GYbe6WPT8yyLVgn6LvzEzlBf92/qWVphHne2Gq+iHwYfvtjfmw4bMRiUOw0QD9eSb
 l5p+kqFugX5UQQEUMc7Rla/HYvFs3R3NhDYv+ZOEU39q5gfEAorHtmnsaEh3xk6uBtJl
 QqwBeObh/6NRJaxUl0R7oc5hj3d3XcAWOQF/Ai0TbSC9epIzlCvBk8gMGQFxk4LEW4JO
 BcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=symw+DbjQ2zBAiOG7Ww9pzYo/lv3yb1KnWrm0Ez+2VI=;
 b=0PZAYYmUmzotAtN+Ia0rBeFwc05EObF4Ql3KA2hqF4x+px5G/kU3wIs/SM0ipq5U0g
 MPI28cc9Yx60w1BG17VMIQ5NtdxdB569n3JNGPS14/oTEuYKRbVeh8fL0utzVqwEThQH
 NEDtc8MtBmzMmrOGlfZjYAF9PWnGdS/jwWY6bWWLKMjZKIOtv2Y6ltn64N9h5GEyVfsw
 HITWsrYCeSELM2ALE6y+YnI3tdAzVkNhvQI/YbD2LI4zMQRw/LFKecoYnxWGAfR4JHjc
 sqT6px4LDMbDEjeoFTgY6xnjswra1YVqbSyexMfiRgcc49FwulLy+tMVpt68OrsKlFac
 GNVQ==
X-Gm-Message-State: ACgBeo35n0fgbxm4PlJl4r6E/Xgxey90E4Lkps9CIA2P0k+Q5JYpXN/l
 c6gFQOfJ6Jagwk0tPcyHmZ4WPQ==
X-Google-Smtp-Source: AA6agR56hM/q745ii87sJ8+FUp1ccUqwvVSnPnn0L1dpca9qZyV6rkTRvVbSFSCZKm/CEUOCg2jOaA==
X-Received: by 2002:a05:6638:2491:b0:35a:53dd:f98e with SMTP id
 x17-20020a056638249100b0035a53ddf98emr7024489jat.261.1663238342711; 
 Thu, 15 Sep 2022 03:39:02 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:d1ab:c31:b1bd:80dd?
 ([2605:ef80:80c3:3064:d1ab:c31:b1bd:80dd])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a026d56000000b003583d27d258sm956972jaf.105.2022.09.15.03.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 03:39:02 -0700 (PDT)
Message-ID: <a10e64ab-2636-fa82-6a72-e175c921044f@linaro.org>
Date: Thu, 15 Sep 2022 11:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] tcg/ppc: Optimize 26-bit jumps
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: npiggin@gmail.com
References: <20220914184141.35423-1-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914184141.35423-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 19:41, Leandro Lupori wrote:
> PowerPC64 processors handle direct branches better than indirect
> ones, resulting in less stalled cycles and branch misses.
> 
> However, PPC's tb_target_set_jmp_target() was only using direct
> branches for 16-bit jumps, while PowerPC64's unconditional branch
> instructions are able to handle displacements of up to 26 bits.
> To take advantage of this, now jumps whose displacements fit in
> between 17 and 26 bits are also converted to direct branches.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
> v2: use stq to replace all instructions atomically

The only error here is failure to align to 16 bytes, here:

     case INDEX_op_goto_tb:

         if (s->tb_jmp_insn_offset) {

             /* Direct jump. */

             if (TCG_TARGET_REG_BITS == 64) {

                 /* Ensure the next insns are 8-byte aligned. */

                 if ((uintptr_t)s->code_ptr & 7) {

                     tcg_out32(s, NOP);

                 }


The rest are minor code cleanup:

> +#if TCG_TARGET_REG_BITS == 64

Not needed, I think.

> +static inline uint64_t make_pair(tcg_insn_unit i1, tcg_insn_unit i2)
> +{
> +#if HOST_BIG_ENDIAN
> +    return (uint64_t)i1 << 32 | i2;
> +#else
> +    return (uint64_t)i2 << 32 | i1;
> +#endif
> +}

This is code movement, but we can now use a C if instead.

> +static inline void ppc64_stq(uintptr_t dst, uint64_t src0, uint64_t src1)
> +{
> +    asm volatile (
> +        "mr  %%r6, %0\n\t"
> +        "mr  %%r7, %1\n\t"
> +        "stq %%r6, 0(%2)"
> +        : : "r" (src0), "r" (src1), "r" (dst) : "r6", "r7", "memory");
> +}
> +
> +#endif
> +
> +static inline void ppc64_replace_insns(uintptr_t rx, uintptr_t rw,
> +    tcg_insn_unit *insn)
> +{
> +#if TCG_TARGET_REG_BITS == 64
> +    uint64_t pair[2];
> +
> +    pair[0] = make_pair(insn[0], insn[1]);
> +    if (have_isa_2_07) {
> +        pair[1] = make_pair(insn[2], insn[3]);
> +#if HOST_BIG_ENDIAN
> +        ppc64_stq(rw, pair[0], pair[1]);
> +#else
> +        ppc64_stq(rw, pair[1], pair[0]);
> +#endif
> +        flush_idcache_range(rx, rw, 16);
> +    } else {
> +        qatomic_set((uint64_t *)rw, pair[0]);
> +        flush_idcache_range(rx, rw, 8);
> +    }
> +#endif
> +}

I think this would be cleaner as

static inline void ppc64_replace2(
     uintptr_t rx, uintptr_t rw,
     tcg_insn_unit i0, i1)
{
#if TCG_TARGET_REG_BITS == 64
     qatomic_set((uint64_t *)rw, make_pair(i0, i1));
     flush_idcache_range(rx, rw, 8);
#else
     qemu_build_not_reached();
#endif
}

static inline void ppc64_replace4(
     uintptr_t rx, uintptr_t rw,
     tcg_insn_unit i0, i2, i3, i4)
{
     uint64_t p[2];

     p[HOST_BIG_ENDIAN] = make_pair(i0, i1);
     p[!HOST_BIG_ENDIAN] = make_pair(i2, i3);

     asm("mr %%r6,%1\n\t"
         "mr %%r7,%2\n\t"
         "stq %%r6,%0"
         : "=Q"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]));
     flush_idcache_range(rx, rw, 16);
}

>   void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>                                 uintptr_t jmp_rw, uintptr_t addr)
>   {
>       if (TCG_TARGET_REG_BITS == 64) {
> -        tcg_insn_unit i1, i2;
> +        tcg_insn_unit i[4];
>           intptr_t tb_diff = addr - tc_ptr;
>           intptr_t br_diff = addr - (jmp_rx + 4);
> -        uint64_t pair;

Now that 64-bit is getting more complicated, let's reverse
this first IF and eliminate ppc32 first:

     if (TCG_TARGET_REG_BITS == 32) {
         stuff;
         return;
     }

     if (tb_diff == (int16_t)tb_diff) {
         i0 = ADDI...
         i1 = B...
         ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
         return;
     }

     i0 = ADDIS...
     i1 = ADDI...
     if (!have_isa_2_07) {
         ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
         return;
     }

     if (in_range) {
         i2 = B...
         i3 = NOP;
     } else {
         i2 = MTSPR...
         i3 = BCCTR...
     }
     ppc64_replace4(jmp_rx, jmp_rw, i0, i1, i2, i3);


r~

