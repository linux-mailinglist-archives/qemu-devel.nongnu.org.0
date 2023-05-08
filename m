Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2366FB085
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:46:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0Fm-0003Yo-Ba; Mon, 08 May 2023 08:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Fe-0003Rf-Ak
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:46:02 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0FY-00018n-Cm
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:46:02 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-192d5ab4d40so3372419fac.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549952; x=1686141952;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ja2uwFooUsrI2ya160q5tNSbN25WR2w2bxNLrrclCJk=;
 b=RCJAGpw+3+0/YhM8S4HknD0GhVS/8zCezcd5/F0nvUS+JL60gfU8j4MgpnmSjDnNhz
 H1I3tbmZWg9YWBPSj7BkRToGpXK9cd/XZ5sKKG1rVFgQCFXN8ybH5AK3HTHaY7mf51Au
 D2n6iu5H5RX4T7fnp95iX5WoNepERO4zMsH8VCpo1txUf6T3Krv4jTGIrYUAFBiU9Mey
 JiiIbay88lLvgbQnF6YUZU8faFTjknvqKwwdwg5HVbWd4TGquDs8XoNR8eXAs1Ru0KiJ
 7isCteL77P0g7hFdWY7pf5guDau6SK3qKIh1NRePqHf7pQBdIygQmdRVg0XGTIG00WMG
 XZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549952; x=1686141952;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ja2uwFooUsrI2ya160q5tNSbN25WR2w2bxNLrrclCJk=;
 b=TL81+a7QOixQxbfOmTcVRi3gN465QUWcazgAJV6tQawzGsYqNiz3Nq0CfxIuW919VD
 W0nZ+Zzr+0KFoCF5paOmiH18N4lC+AV3fPndXe+1n8N+qcosjE6fSL/p+5sJXlc3C7NI
 IfSjLnEiGE1wokfX8fVGGAMHrdxBtigKzIVZx0Ha3zKYyiGAxmqRAiUe7lNZg6KzBvtg
 YmrYLXvQekOQeUU5DtdtVxuzaNKxhuU7nWTrE7LYbxgW470gHZpRCji9Nel82tjZXFnO
 gXL035yWmZipsv50JsAKIxcTjDtrC91SuhfDijJpzAjnrS41gTpvmYcP0CmNSsVElThq
 vfaA==
X-Gm-Message-State: AC+VfDyaz0cf5TEoE1S9T3YNVHw5p0DGAjHQX2ulYlW1HY4k+s3Tu5bc
 5Cs8YVK+xH57344mybaZHVyZoA==
X-Google-Smtp-Source: ACHHUZ6TyWaLfz+DDiaOMSP+xFYlk/UzwVN09R56UPwmBPcrWZbXJK6hrvrJNnGh53uZxCd8jEkZ9w==
X-Received: by 2002:a05:6870:e281:b0:18e:fb6e:1ae5 with SMTP id
 v1-20020a056870e28100b0018efb6e1ae5mr5078243oad.53.1683549952158; 
 Mon, 08 May 2023 05:45:52 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 x19-20020a056870435300b001843c39b65esm4897010oah.21.2023.05.08.05.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:45:51 -0700 (PDT)
Message-ID: <ca88f81f-b816-2925-8152-476ae60c296e@ventanamicro.com>
Date: Mon, 8 May 2023 09:45:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/11] tcg/riscv: Support CPOP from Zbb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-9-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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

>   tcg/riscv/tcg-target.h     | 4 ++--
>   tcg/riscv/tcg-target.c.inc | 9 +++++++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 8e327afc3a..e0b23006c4 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -127,7 +127,7 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_nor_i32          0
>   #define TCG_TARGET_HAS_clz_i32          0
>   #define TCG_TARGET_HAS_ctz_i32          0
> -#define TCG_TARGET_HAS_ctpop_i32        0
> +#define TCG_TARGET_HAS_ctpop_i32        have_zbb
>   #define TCG_TARGET_HAS_brcond2          1
>   #define TCG_TARGET_HAS_setcond2         1
>   #define TCG_TARGET_HAS_qemu_st8_i32     0
> @@ -161,7 +161,7 @@ extern bool have_zbb;
>   #define TCG_TARGET_HAS_nor_i64          0
>   #define TCG_TARGET_HAS_clz_i64          0
>   #define TCG_TARGET_HAS_ctz_i64          0
> -#define TCG_TARGET_HAS_ctpop_i64        0
> +#define TCG_TARGET_HAS_ctpop_i64        have_zbb
>   #define TCG_TARGET_HAS_add2_i64         1
>   #define TCG_TARGET_HAS_sub2_i64         1
>   #define TCG_TARGET_HAS_mulu2_i64        0
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 9cbefb2833..044ddfb160 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1512,6 +1512,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           }
>           break;
>   
> +    case INDEX_op_ctpop_i32:
> +        tcg_out_opc_imm(s, OPC_CPOPW, a0, a1, 0);
> +        break;
> +    case INDEX_op_ctpop_i64:
> +        tcg_out_opc_imm(s, OPC_CPOP, a0, a1, 0);
> +        break;
> +
>       case INDEX_op_add2_i32:
>           tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
>                           const_args[4], const_args[5], false, true);
> @@ -1634,6 +1641,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_bswap16_i64:
>       case INDEX_op_bswap32_i64:
>       case INDEX_op_bswap64_i64:
> +    case INDEX_op_ctpop_i32:
> +    case INDEX_op_ctpop_i64:
>           return C_O1_I1(r, r);
>   
>       case INDEX_op_st8_i32:

