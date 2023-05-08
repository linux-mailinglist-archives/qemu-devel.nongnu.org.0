Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755C6FB090
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:48:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0HZ-0005k3-Dg; Mon, 08 May 2023 08:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0HV-0005fI-Mz
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:47:58 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0HO-0001y4-86
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:47:57 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-192a0aab7dfso3557096fac.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683550069; x=1686142069;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MTSCktqlM5DlsvDFTnKG+XVaGsF2Zh5JKGn8AcyIels=;
 b=Ee7rpfbEmdnCm/IsU+50HJIyhcRZ0SpHNjALERMVg9SMUhigSOppRvWipuOaDZ7dNP
 HTXc2XgHEkhA+R0lfPLqK2tB4telxzECqwL0ko/+JWCSdnGHwjqRZpKRSLD2hZ8XX7Yd
 I5aZdJ4dLGwl6klss1eRCl0BmoZYoPJMsHaJKLl8U+AtKwy3sFo/sWp8H4jUSF9oqE7e
 SeFjDcBr69edohINj2dKN6cJO3bdKWXJlvwTIltX1emwLH7BMRhYuJ6CgCYs6tlnObUV
 1v9yP9q03lvGOvUnuWOJqCOpR6JwDzkVTiAQ/z78HDbU+6oXWxmygqA3Ut8PaeLmSfYY
 zhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683550069; x=1686142069;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MTSCktqlM5DlsvDFTnKG+XVaGsF2Zh5JKGn8AcyIels=;
 b=KxwJVKW7PR86h1jUv+bG2Gfr5urv8Otjp8H3+VXDZSciYt1HQo1zilE466DGegYsFW
 j9ZkaDFLDGVC+xkUhkM7AFPcGTR10iK8wg+Om5a9h9mWDnSY3CpTTt3vb8+Oay1XDk7c
 Mar1WjSb3rcrB+2BEx94kpgIYm3cRgjaVnVB1lW62PihfRj6QR2fFtiQRfs0wBEmHhTR
 WlUwbyAhHru4A6jXbuwwlyORXnSaLIPC+06s/yrsieOmwJ/+zSDWWvPGa6BqNRdXcIp+
 nr+WxWIdJP2BdlMQ1i+MG7HjoqFR0D+iHDtAGRrW3fUL0jJvXJE87iCf8jHu5zR9I9oV
 xoCA==
X-Gm-Message-State: AC+VfDz7NCGPIS1mdxugYksKzaU5OPEAmPxlbvzQKMQPnTN113PQrsnX
 u75RhBG/GK5WKItk9Yg6Ro5oKw==
X-Google-Smtp-Source: ACHHUZ5RiB5GOHf3FZ5T7eYcymDthVH0E6SpOFvOEDeBZ6BfEfGBoX6WEEIlmwbPL6iaGCFVWyJdRQ==
X-Received: by 2002:a05:6870:771d:b0:192:89f3:837c with SMTP id
 dw29-20020a056870771d00b0019289f3837cmr5215844oab.7.1683550068891; 
 Mon, 08 May 2023 05:47:48 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056870530200b0017f647294f5sm4923314oan.16.2023.05.08.05.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:47:48 -0700 (PDT)
Message-ID: <18123960-0668-31e3-4f4e-7d542515ac3f@ventanamicro.com>
Date: Mon, 8 May 2023 09:47:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 11/11] tcg/riscv: Support CTZ, CLZ from Zbb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-12-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
>   tcg/riscv/tcg-target.h         |  8 ++++----
>   tcg/riscv/tcg-target.c.inc     | 35 ++++++++++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
> index a5cadd303f..aac5ceee2b 100644
> --- a/tcg/riscv/tcg-target-con-set.h
> +++ b/tcg/riscv/tcg-target-con-set.h
> @@ -18,5 +18,6 @@ C_O1_I2(r, r, rI)
>   C_O1_I2(r, r, rJ)
>   C_O1_I2(r, rZ, rN)
>   C_O1_I2(r, rZ, rZ)
> +C_N1_I2(r, r, rM)
>   C_O1_I4(r, r, rI, rM, rM)
>   C_O2_I4(r, r, rZ, rZ, rM, rM)
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index e9e84be9a5..cff5de5c9e 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -125,8 +125,8 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_eqv_i32          have_zbb
>   #define TCG_TARGET_HAS_nand_i32         0
>   #define TCG_TARGET_HAS_nor_i32          0
> -#define TCG_TARGET_HAS_clz_i32          0
> -#define TCG_TARGET_HAS_ctz_i32          0
> +#define TCG_TARGET_HAS_clz_i32          1
> +#define TCG_TARGET_HAS_ctz_i32          1
>   #define TCG_TARGET_HAS_ctpop_i32        have_zbb
>   #define TCG_TARGET_HAS_brcond2          1
>   #define TCG_TARGET_HAS_setcond2         1
> @@ -159,8 +159,8 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_eqv_i64          have_zbb
>   #define TCG_TARGET_HAS_nand_i64         0
>   #define TCG_TARGET_HAS_nor_i64          0
> -#define TCG_TARGET_HAS_clz_i64          0
> -#define TCG_TARGET_HAS_ctz_i64          0
> +#define TCG_TARGET_HAS_clz_i64          1
> +#define TCG_TARGET_HAS_ctz_i64          1
>   #define TCG_TARGET_HAS_ctpop_i64        have_zbb
>   #define TCG_TARGET_HAS_add2_i64         1
>   #define TCG_TARGET_HAS_sub2_i64         1
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 1c57b64182..a1c92b0603 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1063,6 +1063,22 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
>       }
>   }
>   
> +static void tcg_out_cltz(TCGContext *s, TCGType type, RISCVInsn insn,
> +                         TCGReg ret, TCGReg src1, int src2, bool c_src2)
> +{
> +    tcg_out_opc_imm(s, insn, ret, src1, 0);
> +
> +    if (!c_src2 || src2 != (type == TCG_TYPE_I32 ? 32 : 64)) {
> +        /*
> +         * The requested zero result does not match the insn, so adjust.
> +         * Note that constraints put 'ret' in a new register, so the
> +         * computation above did not clobber either 'src1' or 'src2'.
> +         */
> +        tcg_out_movcond(s, TCG_COND_EQ, ret, src1, 0, true,
> +                        src2, c_src2, ret, false);
> +    }
> +}
> +
>   static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
>   {
>       TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
> @@ -1724,6 +1740,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           tcg_out_opc_imm(s, OPC_CPOP, a0, a1, 0);
>           break;
>   
> +    case INDEX_op_clz_i32:
> +        tcg_out_cltz(s, TCG_TYPE_I32, OPC_CLZW, a0, a1, a2, c2);
> +        break;
> +    case INDEX_op_clz_i64:
> +        tcg_out_cltz(s, TCG_TYPE_I64, OPC_CLZ, a0, a1, a2, c2);
> +        break;
> +    case INDEX_op_ctz_i32:
> +        tcg_out_cltz(s, TCG_TYPE_I32, OPC_CTZW, a0, a1, a2, c2);
> +        break;
> +    case INDEX_op_ctz_i64:
> +        tcg_out_cltz(s, TCG_TYPE_I64, OPC_CTZ, a0, a1, a2, c2);
> +        break;
> +
>       case INDEX_op_add2_i32:
>           tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
>                           const_args[4], const_args[5], false, true);
> @@ -1917,6 +1946,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_rotr_i64:
>           return C_O1_I2(r, r, ri);
>   
> +    case INDEX_op_clz_i32:
> +    case INDEX_op_clz_i64:
> +    case INDEX_op_ctz_i32:
> +    case INDEX_op_ctz_i64:
> +        return C_N1_I2(r, r, rM);
> +
>       case INDEX_op_brcond_i32:
>       case INDEX_op_brcond_i64:
>           return C_O0_I2(rZ, rZ);

