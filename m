Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E6D6FB077
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:44:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0E0-0001aD-G3; Mon, 08 May 2023 08:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Dv-0001Zu-Mj
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:44:16 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Dh-0000OH-MX
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:44:15 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ab0a942f46so350626a34.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549840; x=1686141840;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MG81CA4XOMOYowHEHs1CaKU3cUVqWan2GOaz58Z6/6k=;
 b=FtTHa8bZeMoZ7BfEEhT0UVBoBaxucG/WsambTudDAtTeFCp+7T7zQblovZQ19mAmPP
 wM2Uvgnkp+zE1fiDbfcLumSb0psYdD4EZzDwklM8qWJLe3BkmWMnciSFlB/yzsb+BNjI
 dX7jiR3dSKWsl1FNI5XeycF9MSGI4UueoZ9toPv7KQAZS0KJJyChHJSibH6n115Zr/Rr
 uG0+rFILr49uIzN6NpqeUXou80uCtxaHr/ma9VUq3HYmI570NgxxwQc3gxoE9fmPZMXZ
 SGhOThz8bNICu07Ii/ud2B9hvAVr9cj/SNI8aD7fN6+FTDkaO8ZO/thPPU8JF5UbjkBQ
 7Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549840; x=1686141840;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MG81CA4XOMOYowHEHs1CaKU3cUVqWan2GOaz58Z6/6k=;
 b=aSK4mEb7naEKfJkT8wFfpnW4m+a5PPs0GF9SqpGLgzYMoiDp96ENs7gXB2h9e8dTIT
 idG3v9IK3sqBzifm2lkv6lPU5KODfX6P+feVmi643UZK9jP2tdNKLWEIyZFzj1qh8yEd
 VgwEoMiSWw7wxJ2MidDYhoBB+OoioRv3BDZsNVzcKnm3m6Ww5zv1PriipmsECCnLpFjF
 zKEUTQaebs167tAiH2tCdgo8h4KkqfIbmge0cf7Z9F7EiD4tgtDSaoJy/iDjY2IZbjQs
 DTzJCAVAnYZKJUFaFlUHvge72mhAQze471y/YqYaL7fJsrWQE/oMCH57xWnF9dwQfBG0
 SGmw==
X-Gm-Message-State: AC+VfDyTwvGLbeZZ88NEz0XMLhnIB/WFN8AxddvHw6M72wIIsYumds2B
 TW/UNovyLBfztWz6Y9+i5WjjBA==
X-Google-Smtp-Source: ACHHUZ7gYWe7etaC9h4kfRR+amRnakpN9OrG6DQCe4dwDr21gAjQw2Y10G1Tni25lxVgc1F5RxUQjQ==
X-Received: by 2002:a05:6870:a247:b0:184:57fb:6183 with SMTP id
 g7-20020a056870a24700b0018457fb6183mr4138573oai.17.1683549840362; 
 Mon, 08 May 2023 05:44:00 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056870a24600b0017e0c13b29asm4906067oai.36.2023.05.08.05.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:44:00 -0700 (PDT)
Message-ID: <7eb28e24-700d-caad-d059-7a59b1a655a1@ventanamicro.com>
Date: Mon, 8 May 2023 09:43:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/11] tcg/riscv: Use ADD.UW for guest address generation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-6-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/3/23 05:56, Richard Henderson wrote:
> The instruction is a combined zero-extend and add.
> Use it for exactly that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target.c.inc | 33 ++++++++++++++++++++++-----------
>   1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 53a7f97b29..f64eaa8515 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1039,14 +1039,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>       tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
>   
>       /* TLB Hit - translate address using addend.  */
> -    addr_adj = addr_reg;
> -    if (TARGET_LONG_BITS == 32) {
> -        addr_adj = TCG_REG_TMP0;
> -        tcg_out_ext32u(s, addr_adj, addr_reg);
> +    if (TARGET_LONG_BITS == 64) {
> +        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, addr_reg, TCG_REG_TMP2);
> +    } else if (have_zba) {
> +        tcg_out_opc_reg(s, OPC_ADD_UW, TCG_REG_TMP0, addr_reg, TCG_REG_TMP2);
> +    } else {
> +        tcg_out_ext32u(s, TCG_REG_TMP0, addr_reg);
> +        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP0, TCG_REG_TMP2);
>       }
> -    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_adj);
>       *pbase = TCG_REG_TMP0;
>   #else
> +    TCGReg base;
> +
>       if (a_mask) {
>           ldst = new_ldst_label(s);
>           ldst->is_ld = is_ld;
> @@ -1061,14 +1065,21 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>           tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
>       }
>   
> -    TCGReg base = addr_reg;
> -    if (TARGET_LONG_BITS == 32) {
> -        tcg_out_ext32u(s, TCG_REG_TMP0, base);
> -        base = TCG_REG_TMP0;
> -    }
>       if (guest_base != 0) {
> -        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
>           base = TCG_REG_TMP0;
> +        if (TARGET_LONG_BITS == 64) {
> +            tcg_out_opc_reg(s, OPC_ADD, base, addr_reg, TCG_GUEST_BASE_REG);
> +        } else if (have_zba) {
> +            tcg_out_opc_reg(s, OPC_ADD_UW, base, addr_reg, TCG_GUEST_BASE_REG);
> +        } else {
> +            tcg_out_ext32u(s, base, addr_reg);
> +            tcg_out_opc_reg(s, OPC_ADD, base, base, TCG_GUEST_BASE_REG);
> +        }
> +    } else if (TARGET_LONG_BITS == 64) {
> +        base = addr_reg;
> +    } else {
> +        base = TCG_REG_TMP0;
> +        tcg_out_ext32u(s, base, addr_reg);

I tried to find a way to remove some of these IFs but all my alternatives weren't
much better.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>       }
>       *pbase = base;
>   #endif

