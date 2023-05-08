Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EF56FB040
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:38:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw07v-0006FG-Ra; Mon, 08 May 2023 08:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw07t-0006A5-N9
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:38:01 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw07r-00078A-Ru
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:38:01 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1928eee97f7so3686424fac.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549477; x=1686141477;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=INDf2UsLH8ceBMS1ZP/DC2IGtccTT7m+FZJ8Li471jA=;
 b=LCSZ5CgT/ukMY8v6uWgE3i+DtZLNkXCdoZIlIN8otqXjlLGYjiQRDwWmq6SIbUoSTv
 r351dIxrLPX6ZlzBoZ6groWElUwvzZtRp35F9w1rv3F6Oscg+E/XP0SmQcimjrdsNJvB
 bx6sUUli5LZyEpH1hKYNp2eRpc8USGbcMBKggGGUxZ7RBxWLq0q5AOHiUGtrZewZIGir
 zLlWhOZEVeBSbd2EPaTGHccZfH1GKQLvKkPOwY+T46B54ObATWn/TFlV2bp5YgEQmPwz
 5JV/vz9YvhWn0pZ06on9xnAOUlfWnJUws9cMwWSyP2tmlZBeUXA0nxwty5jnaa8Qp/vC
 sp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549477; x=1686141477;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INDf2UsLH8ceBMS1ZP/DC2IGtccTT7m+FZJ8Li471jA=;
 b=QebBwIMQzy2B+Wo9KHQE3h6MrAF3qNCVpgY3zZuEfw9UqKvOhq5Lp/e9QbxrGpELxY
 mcgQyoIdCiulRWmoJOLsGHORG8fc3FNDj8hKWE3Jd0T7EUrSmve85UPHROIjPmONbY9G
 ZF/a+dax6nvtDgIIUvh7wxYylj/5ixXXQVN+Yri1HZfzrNdSzf1IG4+nRoRikLb2tMKk
 QpCf8EQQGOMQNavSu0HJi+xRBDoqwndfJK00FW3eow7HalWhy/DqpYWMRRRVC5z5jx6N
 ti3pQZRFCXX0Z7gl4v/7ouxvq1Z4zqN6ffoB60tr9HSfisucKcS1FrYtWPdfPEWaXom0
 oOqg==
X-Gm-Message-State: AC+VfDxoOECXg/lqmzE7CUaQsC72YgExiS7V677pBDZ5wuyYINEO1LQu
 3TKGGsP+h0gsT1fxkbw/460Q3guYJs0AeBlJt14=
X-Google-Smtp-Source: ACHHUZ6F09bOSqzqaH0I689OCichh1glyd79Ilk6RVQoLfeQ/1EUgeb5ZrVajSdkLpdYv4qvhlWIJg==
X-Received: by 2002:a05:6870:4c4:b0:195:c537:14f1 with SMTP id
 u4-20020a05687004c400b00195c53714f1mr4419122oam.36.1683549477575; 
 Mon, 08 May 2023 05:37:57 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056870e50400b001762ce27f9asm4879867oag.23.2023.05.08.05.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:37:57 -0700 (PDT)
Message-ID: <73754ec0-baf2-64d4-6701-e452d437e902@ventanamicro.com>
Date: Mon, 8 May 2023 09:37:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/11] tcg/riscv: Support ANDN, ORN, XNOR from Zbb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-4-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target-con-set.h |  1 +
>   tcg/riscv/tcg-target-con-str.h |  1 +
>   tcg/riscv/tcg-target.h         | 12 +++++-----
>   tcg/riscv/tcg-target.c.inc     | 41 ++++++++++++++++++++++++++++++++++
>   4 files changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
> index d88888d3ac..1a33ece98f 100644
> --- a/tcg/riscv/tcg-target-con-set.h
> +++ b/tcg/riscv/tcg-target-con-set.h
> @@ -15,6 +15,7 @@ C_O0_I2(rZ, rZ)
>   C_O1_I1(r, r)
>   C_O1_I2(r, r, ri)
>   C_O1_I2(r, r, rI)
> +C_O1_I2(r, r, rJ)
>   C_O1_I2(r, rZ, rN)
>   C_O1_I2(r, rZ, rZ)
>   C_O2_I4(r, r, rZ, rZ, rM, rM)
> diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
> index 6f1cfb976c..d5c419dff1 100644
> --- a/tcg/riscv/tcg-target-con-str.h
> +++ b/tcg/riscv/tcg-target-con-str.h
> @@ -15,6 +15,7 @@ REGS('r', ALL_GENERAL_REGS)
>    * CONST(letter, TCG_CT_CONST_* bit set)
>    */
>   CONST('I', TCG_CT_CONST_S12)
> +CONST('J', TCG_CT_CONST_J12)
>   CONST('N', TCG_CT_CONST_N12)
>   CONST('M', TCG_CT_CONST_M12)
>   CONST('Z', TCG_CT_CONST_ZERO)
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 863ac8ba2f..9f58d46208 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -120,9 +120,9 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_bswap32_i32      0
>   #define TCG_TARGET_HAS_not_i32          1
>   #define TCG_TARGET_HAS_neg_i32          1
> -#define TCG_TARGET_HAS_andc_i32         0
> -#define TCG_TARGET_HAS_orc_i32          0
> -#define TCG_TARGET_HAS_eqv_i32          0
> +#define TCG_TARGET_HAS_andc_i32         have_zbb
> +#define TCG_TARGET_HAS_orc_i32          have_zbb
> +#define TCG_TARGET_HAS_eqv_i32          have_zbb
>   #define TCG_TARGET_HAS_nand_i32         0
>   #define TCG_TARGET_HAS_nor_i32          0
>   #define TCG_TARGET_HAS_clz_i32          0
> @@ -154,9 +154,9 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_bswap64_i64      0
>   #define TCG_TARGET_HAS_not_i64          1
>   #define TCG_TARGET_HAS_neg_i64          1
> -#define TCG_TARGET_HAS_andc_i64         0
> -#define TCG_TARGET_HAS_orc_i64          0
> -#define TCG_TARGET_HAS_eqv_i64          0
> +#define TCG_TARGET_HAS_andc_i64         have_zbb
> +#define TCG_TARGET_HAS_orc_i64          have_zbb
> +#define TCG_TARGET_HAS_eqv_i64          have_zbb
>   #define TCG_TARGET_HAS_nand_i64         0
>   #define TCG_TARGET_HAS_nor_i64          0
>   #define TCG_TARGET_HAS_clz_i64          0
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 49ff9c8b9d..c5b060023f 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -138,6 +138,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>   #define TCG_CT_CONST_S12   0x200
>   #define TCG_CT_CONST_N12   0x400
>   #define TCG_CT_CONST_M12   0x800
> +#define TCG_CT_CONST_J12  0x1000
>   
>   #define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
>   
> @@ -174,6 +175,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>       if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
>           return 1;
>       }
> +    /*
> +     * Inverse of sign extended from 12 bits: ~[-0x800, 0x7ff].
> +     * Used to map ANDN back to ANDI, etc.
> +     */
> +    if ((ct & TCG_CT_CONST_J12) && ~val >= -0x800 && ~val <= 0x7ff) {
> +        return 1;
> +    }
>       return 0;
>   }
>   
> @@ -1306,6 +1314,31 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           }
>           break;
>   
> +    case INDEX_op_andc_i32:
> +    case INDEX_op_andc_i64:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_ANDI, a0, a1, ~a2);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_ANDN, a0, a1, a2);
> +        }
> +        break;
> +    case INDEX_op_orc_i32:
> +    case INDEX_op_orc_i64:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_ORI, a0, a1, ~a2);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_ORN, a0, a1, a2);
> +        }
> +        break;
> +    case INDEX_op_eqv_i32:
> +    case INDEX_op_eqv_i64:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_XORI, a0, a1, ~a2);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_XNOR, a0, a1, a2);
> +        }
> +        break;
> +
>       case INDEX_op_not_i32:
>       case INDEX_op_not_i64:
>           tcg_out_opc_imm(s, OPC_XORI, a0, a1, -1);
> @@ -1536,6 +1569,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_xor_i64:
>           return C_O1_I2(r, r, rI);
>   
> +    case INDEX_op_andc_i32:
> +    case INDEX_op_andc_i64:
> +    case INDEX_op_orc_i32:
> +    case INDEX_op_orc_i64:
> +    case INDEX_op_eqv_i32:
> +    case INDEX_op_eqv_i64:
> +        return C_O1_I2(r, r, rJ);
> +
>       case INDEX_op_sub_i32:
>       case INDEX_op_sub_i64:
>           return C_O1_I2(r, rZ, rN);

