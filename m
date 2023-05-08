Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C966FB08F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:47:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0H7-0004xk-PB; Mon, 08 May 2023 08:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0H0-0004v1-Jb
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:47:26 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Gu-0001f7-HY
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:47:26 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-38e04d1b2b4so2296630b6e.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683550039; x=1686142039;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mk5lY4ewbhFAW4parIdGfNHqhVQDnbKtRK7IhaVXMyQ=;
 b=JkdIiO5DSrm6zhodp3HBbZ45iuoiJr3H5/TocrAvTM6pUD/qAJ5NXgRlDa3bby1HKv
 UvDoy/ItXVlDPY+1sf93IQtKpLwleEXbxW4ALT12Fqf5BFLc+q4PH9AkNIX/8x7Tq3VL
 Uo1t7pNITQJSg5DBW8SugIaB3g9n+ws7JKP363EV1GQ0BLv+PVN6TElgRWOYY5uYXsJD
 hdtLr+ef/lIe4d53uSyM/zozbOhvCWpfBVmL/jYq/B3SiTqKjeP90XZZbNyWLgwB2aJR
 JlDxDL62NWquJyzkFELU7d+pRhW1dHEn/W07760mftYxFos1hAHA2sFMwZn2PBZXACke
 C4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683550039; x=1686142039;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mk5lY4ewbhFAW4parIdGfNHqhVQDnbKtRK7IhaVXMyQ=;
 b=OiuFJu/+e5HlM6MgSSFJBxm3pvs36xYFhX+hgJFUAo2bgIUvenudIkHZINI6BnjRU6
 4OYFdqQ7m3tp7E2UO6bQHO9SZROwL3Sap5r33obTHQGsXZqhZH4GscIgZTKf0Fb8HsZp
 qoAOsaSOXh4p2uZkgVNSZW3z780gF8YN3g4T4mkG0kAJhLPfVNgX0KC2fPBE4t8rx5Uy
 7/CzP3JgYZnWygtsyn5Oh5YEULzK+dFo47eas0TZ2S3fstM52X8wFpm/EEYlh3vPf9P7
 DsCfWJOxqKEJde6+i4oBhGt6vgsut7KeBKUg4Qg53DvScv9/4n9quLl0lJ50hk4HRlpk
 WCRA==
X-Gm-Message-State: AC+VfDy94qKZdQ4Evi6/BKdTVatKtZXFZ+OyGA5q+Wou0ZZh3B+/tso2
 df12/ZKcqlxtWewmdYdhZDWHDc9APK1f6LzVvEo=
X-Google-Smtp-Source: ACHHUZ6ns8op9bP6w8V/Fo4fEQo5mXePt+3IznLxpEiKGSJj7EVs0AwNpc5m0C7fsdUZFvrblFW0Ew==
X-Received: by 2002:a05:6808:2906:b0:38d:f794:26c with SMTP id
 ev6-20020a056808290600b0038df794026cmr4374322oib.56.1683550038920; 
 Mon, 08 May 2023 05:47:18 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 h4-20020a4a4204000000b005470d574224sm3964400ooj.25.2023.05.08.05.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:47:18 -0700 (PDT)
Message-ID: <f786d787-eb4c-f38a-ee79-62cef512af2e@ventanamicro.com>
Date: Mon, 8 May 2023 09:47:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/11] tcg/riscv: Implement movcond
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-11-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Implement with and without Zicond.  Without Zicond, we were letting
> the middle-end expand to a 5 insn sequence; better to use a branch
> over a single insn.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target-con-set.h |   1 +
>   tcg/riscv/tcg-target.h         |   4 +-
>   tcg/riscv/tcg-target.c.inc     | 139 ++++++++++++++++++++++++++++++++-
>   3 files changed, 141 insertions(+), 3 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
> index 1a33ece98f..a5cadd303f 100644
> --- a/tcg/riscv/tcg-target-con-set.h
> +++ b/tcg/riscv/tcg-target-con-set.h
> @@ -18,4 +18,5 @@ C_O1_I2(r, r, rI)
>   C_O1_I2(r, r, rJ)
>   C_O1_I2(r, rZ, rN)
>   C_O1_I2(r, rZ, rZ)
> +C_O1_I4(r, r, rI, rM, rM)
>   C_O2_I4(r, r, rZ, rZ, rM, rM)
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index e0b23006c4..e9e84be9a5 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -97,7 +97,7 @@ extern bool have_zbb;
>   #endif
>   
>   /* optional instructions */
> -#define TCG_TARGET_HAS_movcond_i32      0
> +#define TCG_TARGET_HAS_movcond_i32      1
>   #define TCG_TARGET_HAS_div_i32          1
>   #define TCG_TARGET_HAS_rem_i32          1
>   #define TCG_TARGET_HAS_div2_i32         0
> @@ -132,7 +132,7 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_setcond2         1
>   #define TCG_TARGET_HAS_qemu_st8_i32     0
>   
> -#define TCG_TARGET_HAS_movcond_i64      0
> +#define TCG_TARGET_HAS_movcond_i64      1
>   #define TCG_TARGET_HAS_div_i64          1
>   #define TCG_TARGET_HAS_rem_i64          1
>   #define TCG_TARGET_HAS_div2_i64         0
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 84b646105c..1c57b64182 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -169,7 +169,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>       }
>       /*
>        * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
> -     * Used by addsub2, which may need the negative operation,
> +     * Used by addsub2 and movcond, which may need the negative value,
>        * and requires the modified constant to be representable.
>        */
>       if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
> @@ -936,6 +936,133 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
>       }
>   }
>   
> +static void tcg_out_movcond_zicond(TCGContext *s, TCGReg ret, TCGReg test_ne,
> +                                   int val1, bool c_val1,
> +                                   int val2, bool c_val2)
> +{
> +    if (val1 == 0) {
> +        if (c_val2) {
> +            tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, val2);
> +            val2 = TCG_REG_TMP1;
> +        }
> +        tcg_out_opc_reg(s, OPC_CZERO_NEZ, ret, val2, test_ne);
> +        return;
> +    }
> +
> +    if (val2 == 0) {
> +        if (c_val1) {
> +            tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, val1);
> +            val1 = TCG_REG_TMP1;
> +        }
> +        tcg_out_opc_reg(s, OPC_CZERO_EQZ, ret, val1, test_ne);
> +        return;
> +    }
> +
> +    if (c_val2) {
> +        if (c_val1) {
> +            tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, val1 - val2);
> +        } else {
> +            tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_TMP1, val1, -val2);
> +        }
> +        tcg_out_opc_reg(s, OPC_CZERO_EQZ, ret, TCG_REG_TMP1, test_ne);
> +        tcg_out_opc_imm(s, OPC_ADDI, ret, ret, val2);
> +        return;
> +    }
> +
> +    if (c_val1) {
> +        tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_TMP1, val2, -val1);
> +        tcg_out_opc_reg(s, OPC_CZERO_NEZ, ret, TCG_REG_TMP1, test_ne);
> +        tcg_out_opc_imm(s, OPC_ADDI, ret, ret, val1);
> +        return;
> +    }
> +
> +    tcg_out_opc_reg(s, OPC_CZERO_NEZ, TCG_REG_TMP1, val2, test_ne);
> +    tcg_out_opc_reg(s, OPC_CZERO_EQZ, TCG_REG_TMP0, val1, test_ne);
> +    tcg_out_opc_reg(s, OPC_OR, ret, TCG_REG_TMP0, TCG_REG_TMP1);
> +}
> +
> +static void tcg_out_movcond_br1(TCGContext *s, TCGCond cond, TCGReg ret,
> +                                TCGReg cmp1, TCGReg cmp2,
> +                                int val, bool c_val)
> +{
> +    RISCVInsn op;
> +    int disp = 8;
> +
> +    tcg_debug_assert((unsigned)cond < ARRAY_SIZE(tcg_brcond_to_riscv));
> +    op = tcg_brcond_to_riscv[cond].op;
> +    tcg_debug_assert(op != 0);
> +
> +    if (tcg_brcond_to_riscv[cond].swap) {
> +        tcg_out_opc_branch(s, op, cmp2, cmp1, disp);
> +    } else {
> +        tcg_out_opc_branch(s, op, cmp1, cmp2, disp);
> +    }
> +    if (c_val) {
> +        tcg_out_opc_imm(s, OPC_ADDI, ret, TCG_REG_ZERO, val);
> +    } else {
> +        tcg_out_opc_imm(s, OPC_ADDI, ret, val, 0);
> +    }
> +}
> +
> +static void tcg_out_movcond_br2(TCGContext *s, TCGCond cond, TCGReg ret,
> +                                TCGReg cmp1, TCGReg cmp2,
> +                                int val1, bool c_val1,
> +                                int val2, bool c_val2)
> +{
> +    TCGReg tmp;
> +
> +    /* TCG optimizer reorders to prefer ret matching val2. */
> +    if (!c_val2 && ret == val2) {
> +        cond = tcg_invert_cond(cond);
> +        tcg_out_movcond_br1(s, cond, ret, cmp1, cmp2, val1, c_val1);
> +        return;
> +    }
> +
> +    if (!c_val1 && ret == val1) {
> +        tcg_out_movcond_br1(s, cond, ret, cmp1, cmp2, val2, c_val2);
> +        return;
> +    }
> +
> +    tmp = (ret == cmp1 || ret == cmp2 ? TCG_REG_TMP1 : ret);
> +    if (c_val1) {
> +        tcg_out_movi(s, TCG_TYPE_REG, tmp, val1);
> +    } else {
> +        tcg_out_mov(s, TCG_TYPE_REG, tmp, val1);
> +    }
> +    tcg_out_movcond_br1(s, cond, tmp, cmp1, cmp2, val2, c_val2);
> +    tcg_out_mov(s, TCG_TYPE_REG, ret, tmp);
> +}
> +
> +static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
> +                            TCGReg cmp1, int cmp2, bool c_cmp2,
> +                            TCGReg val1, bool c_val1,
> +                            TCGReg val2, bool c_val2)
> +{
> +    int tmpflags;
> +    TCGReg t;
> +
> +    if (!have_zicond && (!c_cmp2 || cmp2 == 0)) {
> +        tcg_out_movcond_br2(s, cond, ret, cmp1, cmp2,
> +                            val1, c_val1, val2, c_val2);
> +        return;
> +    }
> +
> +    tmpflags = tcg_out_setcond_int(s, cond, TCG_REG_TMP0, cmp1, cmp2, c_cmp2);
> +    t = tmpflags & ~SETCOND_FLAGS;
> +
> +    if (have_zicond) {
> +        if (tmpflags & SETCOND_INV) {
> +            tcg_out_movcond_zicond(s, ret, t, val2, c_val2, val1, c_val1);
> +        } else {
> +            tcg_out_movcond_zicond(s, ret, t, val1, c_val1, val2, c_val2);
> +        }
> +    } else {
> +        cond = tmpflags & SETCOND_INV ? TCG_COND_EQ : TCG_COND_NE;
> +        tcg_out_movcond_br2(s, cond, ret, t, TCG_REG_ZERO,
> +                            val1, c_val1, val2, c_val2);
> +    }
> +}
> +
>   static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
>   {
>       TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
> @@ -1624,6 +1751,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           tcg_out_setcond(s, args[3], a0, a1, a2, c2);
>           break;
>   
> +    case INDEX_op_movcond_i32:
> +    case INDEX_op_movcond_i64:
> +        tcg_out_movcond(s, args[5], a0, a1, a2, c2,
> +                        args[3], const_args[3], args[4], const_args[4]);
> +        break;
> +
>       case INDEX_op_qemu_ld_i32:
>           tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
>           break;
> @@ -1788,6 +1921,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_brcond_i64:
>           return C_O0_I2(rZ, rZ);
>   
> +    case INDEX_op_movcond_i32:
> +    case INDEX_op_movcond_i64:
> +        return C_O1_I4(r, r, rI, rM, rM);
> +
>       case INDEX_op_add2_i32:
>       case INDEX_op_add2_i64:
>       case INDEX_op_sub2_i32:

