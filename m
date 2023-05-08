Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8B6FB07E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:45:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0F8-0002lA-SP; Mon, 08 May 2023 08:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Et-0002gl-0A
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:45:17 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Er-0000qk-AU
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:45:14 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-54f9729f469so119293eaf.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549912; x=1686141912;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MfZvPa7DgSuM13FwZVV0zoD6xDNAEJ/A/3VkJ4Ne+8E=;
 b=J3dT4VfYNHW4A2qpvbOJYqAuAGh77d5W3E72ovXp2/Ce3iVqdGWcD3Qg36drDIovgf
 cz6kO96cYE7g9JStuGJtA/0zmKnZK053IgCxLATXTot2dw0m+hrs86/2/vo4x7jHjput
 tVkBS8rxZpPgwVSJ33kLcgrYaXTZWIkhl8mCwp42/do+7EMbqg6ot6llBUlqpEq+SkFF
 fgPv2MVe4dGDlhU+sCSd+6WIcIIfWMSqSgs+cFKeKpU1HERVl8qJPQOjsHmIwULnbv2q
 2T7LJjnq9idqk29w6Jz4p/wqNrMbEdEXCgKgc9RPsTGZF8pc89Du6T3D/PWI8xq76zOD
 WxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549912; x=1686141912;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MfZvPa7DgSuM13FwZVV0zoD6xDNAEJ/A/3VkJ4Ne+8E=;
 b=TyUTU8r88ZRRurDfX4031tzYwudki4FqpS7HPFuy4F3p9FO/Jrm3ZTFiR+3W1h0ZhJ
 lEH1kaNw26EQdiETeLfugqNx/VmLtzgJxhJ0kF2RE+9Xr7IvtFDysjSYz1qhm2EgFA4h
 /BrqxiWsn42fI/QZBEVD33H7O0lFJ8fBcNW1Y96UojwyodfxqcOESo6u7MLnRQ1CGTM6
 Ma4HR1KmUC8bDJrtPiNJXeDqQgHrA2trEqvYagUi7wiyxfvCQ3GQBbv3e7DAu7qMDDP0
 WQR1/O28Wg1IwzPyxnPg++fnUVM18/9E3Jy6RYfJwpvekhmJCgA8wcQFg5x4O+nnxvnZ
 lgdQ==
X-Gm-Message-State: AC+VfDz0XYRmxe1bvDkZsxs1uLz43tALZXsNvhYPAtXJYreCmHserfgm
 Y7WYs8Y9fSvxhr8AJEQ2UWQ6wFHlp7A5nHfilkU=
X-Google-Smtp-Source: ACHHUZ6/71iw/FFGdZ//vi4e7rocw8UyQxOCTxkaNYAot5BUThcVvls3KQA9OhIP9Cfn8ZdhqvICiw==
X-Received: by 2002:a4a:2755:0:b0:54f:83c7:d4cc with SMTP id
 w21-20020a4a2755000000b0054f83c7d4ccmr1262268oow.8.1683549912016; 
 Mon, 08 May 2023 05:45:12 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 v1-20020a4ac901000000b0054c9382b871sm4014087ooq.12.2023.05.08.05.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:45:11 -0700 (PDT)
Message-ID: <d4d83f1d-538c-eecc-9fd6-a38be72a85f0@ventanamicro.com>
Date: Mon, 8 May 2023 09:45:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/11] tcg/riscv: Support REV8 from Zbb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-8-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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

>   tcg/riscv/tcg-target.h     | 10 +++++-----
>   tcg/riscv/tcg-target.c.inc | 29 +++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 317d385924..8e327afc3a 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -116,8 +116,8 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_ext16s_i32       1
>   #define TCG_TARGET_HAS_ext8u_i32        1
>   #define TCG_TARGET_HAS_ext16u_i32       1
> -#define TCG_TARGET_HAS_bswap16_i32      0
> -#define TCG_TARGET_HAS_bswap32_i32      0
> +#define TCG_TARGET_HAS_bswap16_i32      have_zbb
> +#define TCG_TARGET_HAS_bswap32_i32      have_zbb
>   #define TCG_TARGET_HAS_not_i32          1
>   #define TCG_TARGET_HAS_neg_i32          1
>   #define TCG_TARGET_HAS_andc_i32         have_zbb
> @@ -149,9 +149,9 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_ext8u_i64        1
>   #define TCG_TARGET_HAS_ext16u_i64       1
>   #define TCG_TARGET_HAS_ext32u_i64       1
> -#define TCG_TARGET_HAS_bswap16_i64      0
> -#define TCG_TARGET_HAS_bswap32_i64      0
> -#define TCG_TARGET_HAS_bswap64_i64      0
> +#define TCG_TARGET_HAS_bswap16_i64      have_zbb
> +#define TCG_TARGET_HAS_bswap32_i64      have_zbb
> +#define TCG_TARGET_HAS_bswap64_i64      have_zbb
>   #define TCG_TARGET_HAS_not_i64          1
>   #define TCG_TARGET_HAS_neg_i64          1
>   #define TCG_TARGET_HAS_andc_i64         have_zbb
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 58f969b4fe..9cbefb2833 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1488,6 +1488,30 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           }
>           break;
>   
> +    case INDEX_op_bswap64_i64:
> +        tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
> +        break;
> +    case INDEX_op_bswap32_i32:
> +        a2 = 0;
> +        /* fall through */
> +    case INDEX_op_bswap32_i64:
> +        tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
> +        if (a2 & TCG_BSWAP_OZ) {
> +            tcg_out_opc_imm(s, OPC_SRLI, a0, a0, 32);
> +        } else {
> +            tcg_out_opc_imm(s, OPC_SRAI, a0, a0, 32);
> +        }
> +        break;
> +    case INDEX_op_bswap16_i64:
> +    case INDEX_op_bswap16_i32:
> +        tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
> +        if (a2 & TCG_BSWAP_OZ) {
> +            tcg_out_opc_imm(s, OPC_SRLI, a0, a0, 48);
> +        } else {
> +            tcg_out_opc_imm(s, OPC_SRAI, a0, a0, 48);
> +        }
> +        break;
> +
>       case INDEX_op_add2_i32:
>           tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
>                           const_args[4], const_args[5], false, true);
> @@ -1605,6 +1629,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_extrl_i64_i32:
>       case INDEX_op_extrh_i64_i32:
>       case INDEX_op_ext_i32_i64:
> +    case INDEX_op_bswap16_i32:
> +    case INDEX_op_bswap32_i32:
> +    case INDEX_op_bswap16_i64:
> +    case INDEX_op_bswap32_i64:
> +    case INDEX_op_bswap64_i64:
>           return C_O1_I1(r, r);
>   
>       case INDEX_op_st8_i32:

