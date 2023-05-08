Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27876FB088
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:47:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0GN-0003zv-AJ; Mon, 08 May 2023 08:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0GK-0003wD-NS
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:46:44 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0GI-0001Rp-BW
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:46:44 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so31124198fac.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549997; x=1686141997;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aF3NjoIgWNfRDos/vqey+/aZd65tzfxrnWqGO1caqzc=;
 b=WEXvOO9/FddKbFuo2c4W5Vrxig4PyyovKWIfg2JjYIR9ElrtzkrfGWXZpXiReKlur1
 GSXL6OkXZi8YmOg2A/yMPNxTOTDUjUrKEhKueuIMjx6SIKDopYyvZWfOb64mAuwgMfaZ
 JzGl5mcvl4pDD9NmpO9sKg+hc5gaz671tMvE02pgpbApdGMALREfjN2Ph1BevF2S4FZU
 qIv7wFG4QZrTY4jseubN4uluh7LMiK/R7a6dBuuruG73W+/LL0N5S/IGBqqdNSl+6VNn
 i6BiXpZwFCvVvCJ1Yg6r/Aw52Hwq6PF7amOI0Ql6+BA3kJdh02923C9xNexv2E77neZT
 xWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549997; x=1686141997;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aF3NjoIgWNfRDos/vqey+/aZd65tzfxrnWqGO1caqzc=;
 b=MxDNKiehoDN3a+YCfkgp1+LHWGo9ZT26Ma9BqNFHBaGG/FbKBim/FtBikFhxw4KSYV
 38pHHck2wbdoWeDIyG4vhoI4lMuTVW3ZVL/YJ2/+Ts0pX0XeELEjdT4syq3fi7V/oSV1
 j6WacX15LmPzEGa6DhVxyOllOb7hlqNk6hePD0nHg7KDpoT+EdcKR4YTx31zZtocGue6
 3lQHpVtkZptCTSEBTFyUF5rsAHLRDJG5xpK4Nh6CIoTdkhb/hot10+coEcRFzkLzpZW4
 LtLC6OcRtcaGZ2U0MVcMgquhukEz1LgxT/ltELf2UlWZyE52PPfgFTTdKY/RQeLYFi+J
 OTow==
X-Gm-Message-State: AC+VfDzTDrcYQ5nIOH9ho+hwe2O86nGHUDCg6FBY8os1L+LBVqBI0hsm
 AcEceUfBmI3TVGmFwIj0sfIJ8Q==
X-Google-Smtp-Source: ACHHUZ4TBtieVXVWkPAsTRE4P8LrOjC1ULvwqQ87ftyxRwf1AoUM710dFajIToo7iETFt27H7YS5ww==
X-Received: by 2002:a05:6870:1fcf:b0:184:54b2:72f8 with SMTP id
 gp15-20020a0568701fcf00b0018454b272f8mr7672821oac.8.1683549997087; 
 Mon, 08 May 2023 05:46:37 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 dv46-20020a056870d8ae00b0018459cc0f52sm2859139oab.24.2023.05.08.05.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:46:36 -0700 (PDT)
Message-ID: <0d0fb4b6-de91-d560-a28d-c56798228c4d@ventanamicro.com>
Date: Mon, 8 May 2023 09:46:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 09/11] tcg/riscv: Improve setcond expansion
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-10-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Split out a helper function, tcg_out_setcond_int, which does not
> always produce the complete boolean result, but returns a set of
> flags to do so.
> 
> Based on 21af16198425, the same improvement for loongarch64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target.c.inc | 164 +++++++++++++++++++++++++++----------
>   1 file changed, 121 insertions(+), 43 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 044ddfb160..84b646105c 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -812,50 +812,128 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
>       tcg_out_opc_branch(s, op, arg1, arg2, 0);
>   }
>   
> -static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
> -                            TCGReg arg1, TCGReg arg2)
> +#define SETCOND_INV    TCG_TARGET_NB_REGS
> +#define SETCOND_NEZ    (SETCOND_INV << 1)
> +#define SETCOND_FLAGS  (SETCOND_INV | SETCOND_NEZ)
> +
> +static int tcg_out_setcond_int(TCGContext *s, TCGCond cond, TCGReg ret,
> +                               TCGReg arg1, tcg_target_long arg2, bool c2)
>   {
> +    int flags = 0;
> +
>       switch (cond) {
> -    case TCG_COND_EQ:
> -        tcg_out_opc_reg(s, OPC_SUB, ret, arg1, arg2);
> -        tcg_out_opc_imm(s, OPC_SLTIU, ret, ret, 1);
> -        break;
> -    case TCG_COND_NE:
> -        tcg_out_opc_reg(s, OPC_SUB, ret, arg1, arg2);
> -        tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, ret);
> -        break;
> -    case TCG_COND_LT:
> -        tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
> -        break;
> -    case TCG_COND_GE:
> -        tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
> -        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
> -        break;
> -    case TCG_COND_LE:
> -        tcg_out_opc_reg(s, OPC_SLT, ret, arg2, arg1);
> -        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
> -        break;
> -    case TCG_COND_GT:
> -        tcg_out_opc_reg(s, OPC_SLT, ret, arg2, arg1);
> -        break;
> -    case TCG_COND_LTU:
> -        tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
> -        break;
> -    case TCG_COND_GEU:
> -        tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
> -        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
> -        break;
> -    case TCG_COND_LEU:
> -        tcg_out_opc_reg(s, OPC_SLTU, ret, arg2, arg1);
> -        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
> -        break;
> -    case TCG_COND_GTU:
> -        tcg_out_opc_reg(s, OPC_SLTU, ret, arg2, arg1);
> +    case TCG_COND_EQ:    /* -> NE  */
> +    case TCG_COND_GE:    /* -> LT  */
> +    case TCG_COND_GEU:   /* -> LTU */
> +    case TCG_COND_GT:    /* -> LE  */
> +    case TCG_COND_GTU:   /* -> LEU */
> +        cond = tcg_invert_cond(cond);
> +        flags ^= SETCOND_INV;
>           break;
>       default:
> -         g_assert_not_reached();
> -         break;
> -     }
> +        break;
> +    }
> +
> +    switch (cond) {
> +    case TCG_COND_LE:
> +    case TCG_COND_LEU:
> +        /*
> +         * If we have a constant input, the most efficient way to implement
> +         * LE is by adding 1 and using LT.  Watch out for wrap around for LEU.
> +         * We don't need to care for this for LE because the constant input
> +         * is constrained to signed 12-bit, and 0x800 is representable in the
> +         * temporary register.
> +         */
> +        if (c2) {
> +            if (cond == TCG_COND_LEU) {
> +                /* unsigned <= -1 is true */
> +                if (arg2 == -1) {
> +                    tcg_out_movi(s, TCG_TYPE_REG, ret, !(flags & SETCOND_INV));
> +                    return ret;
> +                }
> +                cond = TCG_COND_LTU;
> +            } else {
> +                cond = TCG_COND_LT;
> +            }
> +            tcg_debug_assert(arg2 <= 0x7ff);
> +            if (++arg2 == 0x800) {
> +                tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP0, arg2);
> +                arg2 = TCG_REG_TMP0;
> +                c2 = false;
> +            }
> +        } else {
> +            TCGReg tmp = arg2;
> +            arg2 = arg1;
> +            arg1 = tmp;
> +            cond = tcg_swap_cond(cond);    /* LE -> GE */
> +            cond = tcg_invert_cond(cond);  /* GE -> LT */
> +            flags ^= SETCOND_INV;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    switch (cond) {
> +    case TCG_COND_NE:
> +        flags |= SETCOND_NEZ;
> +        if (!c2) {
> +            tcg_out_opc_reg(s, OPC_XOR, ret, arg1, arg2);
> +        } else if (arg2 == 0) {
> +            ret = arg1;
> +        } else {
> +            tcg_out_opc_reg(s, OPC_XORI, ret, arg1, arg2);
> +        }
> +        break;
> +
> +    case TCG_COND_LT:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_SLTI, ret, arg1, arg2);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
> +        }
> +        break;
> +
> +    case TCG_COND_LTU:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_SLTIU, ret, arg1, arg2);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
> +        }
> +        break;
> +
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return ret | flags;
> +}
> +
> +static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
> +                            TCGReg arg1, tcg_target_long arg2, bool c2)
> +{
> +    int tmpflags = tcg_out_setcond_int(s, cond, ret, arg1, arg2, c2);
> +
> +    if (tmpflags != ret) {
> +        TCGReg tmp = tmpflags & ~SETCOND_FLAGS;
> +
> +        switch (tmpflags & SETCOND_FLAGS) {
> +        case SETCOND_INV:
> +            /* Intermediate result is boolean: simply invert. */
> +            tcg_out_opc_imm(s, OPC_XORI, ret, tmp, 1);
> +            break;
> +        case SETCOND_NEZ:
> +            /* Intermediate result is zero/non-zero: test != 0. */
> +            tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, tmp);
> +            break;
> +        case SETCOND_NEZ | SETCOND_INV:
> +            /* Intermediate result is zero/non-zero: test == 0. */
> +            tcg_out_opc_imm(s, OPC_SLTIU, ret, tmp, 1);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
>   }
>   
>   static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
> @@ -1543,7 +1621,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>   
>       case INDEX_op_setcond_i32:
>       case INDEX_op_setcond_i64:
> -        tcg_out_setcond(s, args[3], a0, a1, a2);
> +        tcg_out_setcond(s, args[3], a0, a1, a2, c2);
>           break;
>   
>       case INDEX_op_qemu_ld_i32:
> @@ -1662,6 +1740,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_and_i64:
>       case INDEX_op_or_i64:
>       case INDEX_op_xor_i64:
> +    case INDEX_op_setcond_i32:
> +    case INDEX_op_setcond_i64:
>           return C_O1_I2(r, r, rI);
>   
>       case INDEX_op_andc_i32:
> @@ -1683,7 +1763,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_divu_i32:
>       case INDEX_op_rem_i32:
>       case INDEX_op_remu_i32:
> -    case INDEX_op_setcond_i32:
>       case INDEX_op_mul_i64:
>       case INDEX_op_mulsh_i64:
>       case INDEX_op_muluh_i64:
> @@ -1691,7 +1770,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_divu_i64:
>       case INDEX_op_rem_i64:
>       case INDEX_op_remu_i64:
> -    case INDEX_op_setcond_i64:
>           return C_O1_I2(r, rZ, rZ);
>   
>       case INDEX_op_shl_i32:

