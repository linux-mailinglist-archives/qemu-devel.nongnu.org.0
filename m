Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE16FB078
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:44:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0EL-0001ke-Pr; Mon, 08 May 2023 08:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0EF-0001fr-Hy
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:44:39 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0EC-0000VG-6V
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:44:35 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-187df75c901so1738475fac.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549870; x=1686141870;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xyw/g1J8cOeOlRcD05E7uP2KR33Gsc6I8vPLzTdVcdc=;
 b=YJzoZg1acA5GAFS4N9W45663OazWIKnhWAxRjgm6u9xi8dHD2KJzdA0rnGxANa9odU
 mOcn7cNddlpMlLN7xjAvQ2njIhxkJUSWe6RK+tBKwZxup+F+cps64ES0/zf6CIkQJl1I
 p1sy0QdJBKdKTk4jONY+sYvF/INg87oD/xtIWUka4fVVjny2eXqJ/LJY6ZRkHrFvXiEK
 q7hBQu6d/ufigZH066IoGtC2ViSPcOQqdJH/XLPM8+JYJyzqKXpcKZgmxp16f1SjvbWy
 sMhqAHik/ccnFkM6U5nZzAH/+uMBjyI8gB7ftc9aIO5e6YLwGLFVYT6WNaFgrZwQjYQ0
 F3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549870; x=1686141870;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xyw/g1J8cOeOlRcD05E7uP2KR33Gsc6I8vPLzTdVcdc=;
 b=MgTrCTbU0xgefmyt+UQNn6QEY53GkrQdL5FzMk/CvXSQ17ZqmfsYmSvBoPePNyrSK4
 fcn+bYOySQqQvuK8clsjqGliXVeEcgYqw8u96FVyXIYgxaDMyIg+DZhlxyr/j3xXfmIu
 iu3UI9482rouKIowwaweyyRp1wXZGkaccmDBn57IkkDgSzRBWYwSZT3CR+BVDMl7QA51
 6Q2iqkfCepMasdOZXNlETyS00spwRrWbOcjAcQvASsuu1CENEh4jTdGsIsyvfenVxwZ+
 i0hD7vPH9p+I2MP2gyDtaL02rcibIdfrIT2S4E750n3d7MP/wd6Hd8lgT5h/uZyQ03Ml
 fRyA==
X-Gm-Message-State: AC+VfDzybG3bNC6R1SnodXe8IRQUlG4AsLdyitaK7SogMRAkiQkCfbFm
 Fw6PjDiUOUUosjJJ78CRremgvgqeqgIgZ5XhHtY=
X-Google-Smtp-Source: ACHHUZ41KDymztOKMrreLbxpvHu1MOu/LpsjtzPnkcOVeQoJkO2j7YUQagRbpr5WQgkTqVEJ8Dqoyg==
X-Received: by 2002:a05:6870:3747:b0:192:4f29:7cae with SMTP id
 a7-20020a056870374700b001924f297caemr5277971oak.13.1683549870467; 
 Mon, 08 May 2023 05:44:30 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056870e14c00b0016e8726f0d4sm4903995oaa.3.2023.05.08.05.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:44:30 -0700 (PDT)
Message-ID: <27f0bafe-2a17-d64c-e749-047c0a12d083@ventanamicro.com>
Date: Mon, 8 May 2023 09:44:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/11] tcg/riscv: Support rotates from Zbb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-7-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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

>   tcg/riscv/tcg-target.h     |  4 ++--
>   tcg/riscv/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
>   2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 9f58d46208..317d385924 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -101,7 +101,7 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_div_i32          1
>   #define TCG_TARGET_HAS_rem_i32          1
>   #define TCG_TARGET_HAS_div2_i32         0
> -#define TCG_TARGET_HAS_rot_i32          0
> +#define TCG_TARGET_HAS_rot_i32          have_zbb
>   #define TCG_TARGET_HAS_deposit_i32      0
>   #define TCG_TARGET_HAS_extract_i32      0
>   #define TCG_TARGET_HAS_sextract_i32     0
> @@ -136,7 +136,7 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_div_i64          1
>   #define TCG_TARGET_HAS_rem_i64          1
>   #define TCG_TARGET_HAS_div2_i64         0
> -#define TCG_TARGET_HAS_rot_i64          0
> +#define TCG_TARGET_HAS_rot_i64          have_zbb
>   #define TCG_TARGET_HAS_deposit_i64      0
>   #define TCG_TARGET_HAS_extract_i64      0
>   #define TCG_TARGET_HAS_sextract_i64     0
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index f64eaa8515..58f969b4fe 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1458,6 +1458,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           }
>           break;
>   
> +    case INDEX_op_rotl_i32:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_RORIW, a0, a1, -a2 & 0x1f);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_ROLW, a0, a1, a2);
> +        }
> +        break;
> +    case INDEX_op_rotl_i64:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_RORI, a0, a1, -a2 & 0x3f);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_ROL, a0, a1, a2);
> +        }
> +        break;
> +
> +    case INDEX_op_rotr_i32:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_RORIW, a0, a1, a2 & 0x1f);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_RORW, a0, a1, a2);
> +        }
> +        break;
> +    case INDEX_op_rotr_i64:
> +        if (c2) {
> +            tcg_out_opc_imm(s, OPC_RORI, a0, a1, a2 & 0x3f);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_ROR, a0, a1, a2);
> +        }
> +        break;
> +
>       case INDEX_op_add2_i32:
>           tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
>                           const_args[4], const_args[5], false, true);
> @@ -1629,9 +1659,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_shl_i32:
>       case INDEX_op_shr_i32:
>       case INDEX_op_sar_i32:
> +    case INDEX_op_rotl_i32:
> +    case INDEX_op_rotr_i32:
>       case INDEX_op_shl_i64:
>       case INDEX_op_shr_i64:
>       case INDEX_op_sar_i64:
> +    case INDEX_op_rotl_i64:
> +    case INDEX_op_rotr_i64:
>           return C_O1_I2(r, r, ri);
>   
>       case INDEX_op_brcond_i32:

