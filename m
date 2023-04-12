Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B56DFF86
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:20:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmgw3-0006N7-Ld; Wed, 12 Apr 2023 16:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgw0-0006HY-FI
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:19:16 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgvy-0005Im-Dy
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:19:16 -0400
Received: by mail-oi1-x233.google.com with SMTP id f14so27020413oiw.10
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681330753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EGLc23ktv947yeHYEmBJK9HvJwxoEA9+2w1Nbr4C3xQ=;
 b=V+RmTPtI+deY7qk2cmPmDKKK+0Dr4ydzXGbY/tsBBbR3BJp1NgJX1O5Q3qi/w/9Bw9
 eCKusyfUo+jpqRP6X2K0GfMyBV2fhtWGsUGpZNIE45EtaaNpt3rWU8KeDUGM/onIeosb
 F1vQVueNr2+Jwf7hMf60PpRGDhThnkVus66/qRQS3S2qjdUflRxSmT5liL0cTtRqBH/k
 7PTN/LuFpHhFroAL7Cu63Cv5IXlQBliHkBUU9eVL7U/hRPcc7AUjd2lDZyyNMoIggj00
 DEBJo0hZOUzmftHzbCj8hJh7Bh4H1X0t/46EddzE9ZXIB0zjB2ME6toIEi3L1gHqvG/s
 c9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681330753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGLc23ktv947yeHYEmBJK9HvJwxoEA9+2w1Nbr4C3xQ=;
 b=O7PGQpLsMLHy/52tbOj0wFImsQgm9K1MQLoaQiSH0yhA0h/4SjzQZeK7GChMLNzcgq
 R25DWm104CdOUetJj5PGWXOrnlJ9z+c8w6WXMInhYC2pBYJ7US9SkSeM7nEjtMYvPMx9
 H2hnjbblKuoChOpbbywsoUhfH6zxRIuKt3gtzpg0RdvIQqP5KHceGN5R0K06pCafqafK
 Vrahsl5at4ps6WVm652eg4p57cQIudboTfFm6MZvQ2gHzv99UNX4TKrRBQrJNGJQQZSH
 9Dqpc812ksKWcbNQKCV6YSLVxUYg59ZOKLf7OxcFj7E4nxnTxzNO+BV1+MKw8y4KVMpu
 b5tw==
X-Gm-Message-State: AAQBX9eR/vqLWIF/MjQpbswgm/lOmz7mVMsH+YrjPLOPaOodemLltiFg
 SvMuEL0/gUDzLQ9tSeyD69VjpQ==
X-Google-Smtp-Source: AKy350bmIPfbdi+NbMdNwIIIY/6PNGKlnSX8/oP1FUa2ucCO0Q6nRkwLhpdNO2Z4hNIJuW1cG+HujA==
X-Received: by 2002:a05:6808:f03:b0:38b:bced:3c2f with SMTP id
 m3-20020a0568080f0300b0038bbced3c2fmr6293792oiw.30.1681330753331; 
 Wed, 12 Apr 2023 13:19:13 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 q5-20020acaf205000000b0038c0630f95fsm589281oih.22.2023.04.12.13.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:19:12 -0700 (PDT)
Message-ID: <d935f6f3-d075-c68d-76d7-eb241ea2f38c@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:19:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 28/54] tcg/riscv: Rationalize args to
 tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-29-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230411010512.5375-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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



On 4/10/23 22:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument registers const, because they must be passed to
> add_qemu_ldst_label unmodified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target.c.inc | 68 +++++++++++++++-----------------------
>   1 file changed, 26 insertions(+), 42 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 1edc3b1c4d..d4134bc86f 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1101,7 +1101,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>   #endif /* CONFIG_SOFTMMU */
>   
>   static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
> -                                   TCGReg base, MemOp opc, bool is_64)
> +                                   TCGReg base, MemOp opc, TCGType type)
>   {
>       /* Byte swapping is left to middle-end expansion. */
>       tcg_debug_assert((opc & MO_BSWAP) == 0);
> @@ -1120,7 +1120,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
>           tcg_out_opc_imm(s, OPC_LH, val, base, 0);
>           break;
>       case MO_UL:
> -        if (is_64) {
> +        if (type == TCG_TYPE_I64) {
>               tcg_out_opc_imm(s, OPC_LWU, val, base, 0);
>               break;
>           }
> @@ -1136,30 +1136,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
>       }
>   }
>   
> -static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
> +static void tcg_out_qemu_ld(TCGContext *s, const TCGReg data_reg,
> +                            const TCGReg addr_reg, const MemOpIdx oi,
> +                            TCGType data_type)
>   {
> -    TCGReg addr_reg, data_reg;
> -    MemOpIdx oi;
> -    MemOp opc;
> -#if defined(CONFIG_SOFTMMU)
> -    tcg_insn_unit *label_ptr[1];
> -#else
> -    unsigned a_bits;
> -#endif
> +    MemOp opc = get_memop(oi);
>       TCGReg base;
>   
> -    data_reg = *args++;
> -    addr_reg = *args++;
> -    oi = *args++;
> -    opc = get_memop(oi);
> -
>   #if defined(CONFIG_SOFTMMU)
> +    tcg_insn_unit *label_ptr[1];
> +
>       base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
> -    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
> -    add_qemu_ldst_label(s, 1, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
> -                        data_reg, addr_reg, s->code_ptr, label_ptr);
> +    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
> +    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
> +                        s->code_ptr, label_ptr);
>   #else
> -    a_bits = get_alignment_bits(opc);
> +    unsigned a_bits = get_alignment_bits(opc);
>       if (a_bits) {
>           tcg_out_test_alignment(s, true, addr_reg, a_bits);
>       }
> @@ -1172,7 +1164,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>           tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
>           base = TCG_REG_TMP0;
>       }
> -    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
> +    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
>   #endif
>   }
>   
> @@ -1200,30 +1192,22 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
>       }
>   }
>   
> -static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
> +static void tcg_out_qemu_st(TCGContext *s, const TCGReg data_reg,
> +                            const TCGReg addr_reg, const MemOpIdx oi,
> +                            TCGType data_type)
>   {
> -    TCGReg addr_reg, data_reg;
> -    MemOpIdx oi;
> -    MemOp opc;
> -#if defined(CONFIG_SOFTMMU)
> -    tcg_insn_unit *label_ptr[1];
> -#else
> -    unsigned a_bits;
> -#endif
> +    MemOp opc = get_memop(oi);
>       TCGReg base;
>   
> -    data_reg = *args++;
> -    addr_reg = *args++;
> -    oi = *args++;
> -    opc = get_memop(oi);
> -
>   #if defined(CONFIG_SOFTMMU)
> +    tcg_insn_unit *label_ptr[1];
> +
>       base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
>       tcg_out_qemu_st_direct(s, data_reg, base, opc);
> -    add_qemu_ldst_label(s, 0, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
> -                        data_reg, addr_reg, s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
> +                        s->code_ptr, label_ptr);
>   #else
> -    a_bits = get_alignment_bits(opc);
> +    unsigned a_bits = get_alignment_bits(opc);
>       if (a_bits) {
>           tcg_out_test_alignment(s, false, addr_reg, a_bits);
>       }
> @@ -1528,16 +1512,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           break;
>   
>       case INDEX_op_qemu_ld_i32:
> -        tcg_out_qemu_ld(s, args, false);
> +        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
>           break;
>       case INDEX_op_qemu_ld_i64:
> -        tcg_out_qemu_ld(s, args, true);
> +        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
>           break;
>       case INDEX_op_qemu_st_i32:
> -        tcg_out_qemu_st(s, args, false);
> +        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
>           break;
>       case INDEX_op_qemu_st_i64:
> -        tcg_out_qemu_st(s, args, true);
> +        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
>           break;
>   
>       case INDEX_op_extrh_i64_i32:

