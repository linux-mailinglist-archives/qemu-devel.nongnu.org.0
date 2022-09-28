Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDD35EE35C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:43:35 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odb5q-0000V5-A2
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZdO-0004m4-H2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:10:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZdL-0001Ok-R8
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:10:05 -0400
Received: by mail-pl1-x629.google.com with SMTP id d24so12158266pls.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DaxdwRCWmSfO4poLabWu1Fq4OT79tTiCKgFc2vQUNSA=;
 b=pdbFCtn1mIk0KzkPFcpj61lHP5KArXtzQyprxjWpHA2nAVeEWK3nLthtDAVDR25feZ
 hVToliv/PN3QYoir0e7ooQyM6BnSurXKEvHEo5QK3gYD3I3X3K5JUxb+nomsN4pIDiE5
 KwGpufC5MIiqfpsBla4eEcC/2z0OL/aTjyL2j06VGnyvFIoLbzxd6orH4wwEq+tdE9GJ
 P6TdqAQtvHZ1Zedb5jZASeAVGtx1uWjYzvq9EkDM7qqf4tP57uJEHPoYn5yGfvjOI/Ef
 kSyiRR747oHH1YR0gNYg4MLUM44U6KlRFd5V7hR7s73LfEI22n4i2M4lLLC9E3wNtz63
 7zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DaxdwRCWmSfO4poLabWu1Fq4OT79tTiCKgFc2vQUNSA=;
 b=vRme1bDHFObuL7WzLuVwFkevbM2joyEjWvxoltEYYVfCEEokLMjhGW5ddBP9cBb4Mt
 sBrHimOkPNcKh2Lx2qCIN2+cVuyEsmx7K3c1oRmSmfqwIrZ1IGRZj5jM3gcAHAUjS5FZ
 h4p5mbjM/N5vPuAlLemj6RN679aW7p1/DSDGErh+BuT8sFVHJVYN6B6CinoSe2pq5mLu
 IkInoIMuH7dTYHaP/05P5N+UXjrmSTxrbRuQDj7aAiboFM/SmJGV0Vl82dmIS56AjZ+r
 3Si/DxbLx8mgO8Pvrru9D8QKX/1OZaAvOHW85qDvL7MpNqWuWVvTK1eC81OiI3SKqNmP
 Hieg==
X-Gm-Message-State: ACrzQf1YASiDMTqWpultBRZPQDi3uTNnHFq78TSHDd943qmZKdj3GSQr
 eW/KOEndqDzm2qMwIbsCZCSNVg==
X-Google-Smtp-Source: AMsMyM4pAwYYlqGKNfU6JiCCO4+8kcRcfHwKKseCOwVUyRe2FJPHFeaTMZsMC25abTRmX1evqMxytA==
X-Received: by 2002:a17:90a:f3d5:b0:206:dc:7433 with SMTP id
 ha21-20020a17090af3d500b0020600dc7433mr316651pjb.162.1664381402261; 
 Wed, 28 Sep 2022 09:10:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a63da58000000b00434abd19eeasm3721574pgj.78.2022.09.28.09.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:10:01 -0700 (PDT)
Message-ID: <35637659-a83b-2c92-c027-f45ee7d63b19@linaro.org>
Date: Wed, 28 Sep 2022 09:09:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] Hexagon (target/hexagon) move store size tracking to
 translation
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220920080746.26791-1-tsimpson@quicinc.com>
 <20220920080746.26791-3-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920080746.26791-3-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 01:07, Taylor Simpson wrote:
> The store width is needed for packet commit, so it is stored in
> ctx->store_width.  Currently, it is set when a store has a TCG
> override instead of a QEMU helper.  In the QEMU helper case, the
> ctx->store_width is not set, we invoke a helper during packet commit
> that uses the runtime store width.
> 
> This patch ensures ctx->store_width is set for all store instructions,
> so performance is improved because packet commit can generate the proper
> TCG store rather than the generic helper.
> 
> We do this by
> - Use the attributes from the instructions during translation to
>    set ctx->store_width
> - Remove setting of ctx->store_width from genptr.c
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h    |  8 ++++----
>   target/hexagon/genptr.c    | 36 ++++++++++++------------------------
>   target/hexagon/translate.c | 26 ++++++++++++++++++++++++++
>   3 files changed, 42 insertions(+), 28 deletions(-)
> 
> diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
> index 92eb8bbf05..c8805bdaeb 100644
> --- a/target/hexagon/macros.h
> +++ b/target/hexagon/macros.h
> @@ -156,7 +156,7 @@
>           __builtin_choose_expr(TYPE_TCGV(X), \
>               gen_store1, (void)0))
>   #define MEM_STORE1(VA, DATA, SLOT) \
> -    MEM_STORE1_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> +    MEM_STORE1_FUNC(DATA)(cpu_env, VA, DATA, SLOT)
>   
>   #define MEM_STORE2_FUNC(X) \
>       __builtin_choose_expr(TYPE_INT(X), \
> @@ -164,7 +164,7 @@
>           __builtin_choose_expr(TYPE_TCGV(X), \
>               gen_store2, (void)0))
>   #define MEM_STORE2(VA, DATA, SLOT) \
> -    MEM_STORE2_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> +    MEM_STORE2_FUNC(DATA)(cpu_env, VA, DATA, SLOT)
>   
>   #define MEM_STORE4_FUNC(X) \
>       __builtin_choose_expr(TYPE_INT(X), \
> @@ -172,7 +172,7 @@
>           __builtin_choose_expr(TYPE_TCGV(X), \
>               gen_store4, (void)0))
>   #define MEM_STORE4(VA, DATA, SLOT) \
> -    MEM_STORE4_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> +    MEM_STORE4_FUNC(DATA)(cpu_env, VA, DATA, SLOT)
>   
>   #define MEM_STORE8_FUNC(X) \
>       __builtin_choose_expr(TYPE_INT(X), \
> @@ -180,7 +180,7 @@
>           __builtin_choose_expr(TYPE_TCGV_I64(X), \
>               gen_store8, (void)0))
>   #define MEM_STORE8(VA, DATA, SLOT) \
> -    MEM_STORE8_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> +    MEM_STORE8_FUNC(DATA)(cpu_env, VA, DATA, SLOT)
>   #else
>   #define MEM_LOAD1s(VA) ((int8_t)mem_load1(env, slot, VA))
>   #define MEM_LOAD1u(VA) ((uint8_t)mem_load1(env, slot, VA))
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 8a334ba07b..806d0974ff 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -401,62 +401,50 @@ static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
>       tcg_gen_mov_tl(hex_store_val32[slot], src);
>   }
>   
> -static inline void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src,
> -                              DisasContext *ctx, int slot)
> +static inline void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, int slot)
>   {
>       gen_store32(vaddr, src, 1, slot);
> -    ctx->store_width[slot] = 1;
>   }
>   
> -static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
> -                               DisasContext *ctx, int slot)
> +static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src, int slot)
>   {
>       TCGv tmp = tcg_constant_tl(src);
> -    gen_store1(cpu_env, vaddr, tmp, ctx, slot);
> +    gen_store1(cpu_env, vaddr, tmp, slot);
>   }
>   
> -static inline void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src,
> -                              DisasContext *ctx, int slot)
> +static inline void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, int slot)
>   {
>       gen_store32(vaddr, src, 2, slot);
> -    ctx->store_width[slot] = 2;
>   }
>   
> -static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
> -                               DisasContext *ctx, int slot)
> +static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src, int slot)
>   {
>       TCGv tmp = tcg_constant_tl(src);
> -    gen_store2(cpu_env, vaddr, tmp, ctx, slot);
> +    gen_store2(cpu_env, vaddr, tmp, slot);
>   }
>   
> -static inline void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src,
> -                              DisasContext *ctx, int slot)
> +static inline void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, int slot)
>   {
>       gen_store32(vaddr, src, 4, slot);
> -    ctx->store_width[slot] = 4;
>   }
>   
> -static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
> -                               DisasContext *ctx, int slot)
> +static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src, int slot)
>   {
>       TCGv tmp = tcg_constant_tl(src);
> -    gen_store4(cpu_env, vaddr, tmp, ctx, slot);
> +    gen_store4(cpu_env, vaddr, tmp, slot);
>   }
>   
> -static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
> -                              DisasContext *ctx, int slot)
> +static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src, int slot)
>   {
>       tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
>       tcg_gen_movi_tl(hex_store_width[slot], 8);
>       tcg_gen_mov_i64(hex_store_val64[slot], src);
> -    ctx->store_width[slot] = 8;
>   }
>   
> -static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,
> -                               DisasContext *ctx, int slot)
> +static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src, int slot)
>   {
>       TCGv_i64 tmp = tcg_constant_i64(src);
> -    gen_store8(cpu_env, vaddr, tmp, ctx, slot);
> +    gen_store8(cpu_env, vaddr, tmp, slot);
>   }
>   
>   static TCGv gen_8bitsof(TCGv result, TCGv value)
> diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
> index 0e8a0772f7..bc02870b9f 100644
> --- a/target/hexagon/translate.c
> +++ b/target/hexagon/translate.c
> @@ -327,6 +327,31 @@ static void mark_implicit_pred_writes(DisasContext *ctx, Insn *insn)
>       mark_implicit_pred_write(ctx, insn, A_IMPLICIT_WRITES_P3, 3);
>   }
>   
> +static void mark_store_width(DisasContext *ctx, Insn *insn)
> +{
> +    uint16_t opcode = insn->opcode;
> +    uint32_t slot = insn->slot;
> +
> +    if (GET_ATTRIB(opcode, A_STORE)) {
> +        if (GET_ATTRIB(opcode, A_MEMSIZE_1B)) {
> +            ctx->store_width[slot] = 1;
> +            return;
> +        }
> +        if (GET_ATTRIB(opcode, A_MEMSIZE_2B)) {
> +            ctx->store_width[slot] = 2;
> +            return;
> +        }
> +        if (GET_ATTRIB(opcode, A_MEMSIZE_4B)) {
> +            ctx->store_width[slot] = 4;
> +            return;
> +        }
> +        if (GET_ATTRIB(opcode, A_MEMSIZE_8B)) {
> +            ctx->store_width[slot] = 8;
> +            return;
> +        }

Hmm.  Perhaps

     int size = 0;
     if (GET_ATTRIB(opcode, A_MEMSIZE_1B)) {
         size |= 1;
     }
     ...
     tcg_debug_assert(is_power_of_2(size));
     ctx->store_width[slot] = size;

just to make sure you get exactly one of the above cases.

Otherwise, LGTM,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

