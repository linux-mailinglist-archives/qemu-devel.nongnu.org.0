Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3E6DFF8E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:20:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmgxL-0008S5-FP; Wed, 12 Apr 2023 16:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgxJ-0008Mf-AM
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:20:37 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgxH-0005rD-I9
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:20:36 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1842df7cb53so15210313fac.10
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681330834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/+5Y31DzLoltDr5BDRmGw2yTc5HJ9pHuhMLv6VWPNHM=;
 b=INu58I0NorIcKoatAYT9+P4pl2LJzxAjtoGuTQ542yiSsBHBpMnHjq/37bZBWwSBXy
 SZMsKdZJ0Z8FoErctictKinXFTX6hRQXXI8W/O2/s4ZzYeUJFx5IiT5W8TOX9IROaQSz
 GhBGGQ5/TOxhA1kh8k3rRsg61DDZ8MLqhx6raQeCEwOhZ4jGpXv4UmJhBiv1dSf7sOmo
 i27ZpmMUVXFp9pvbnaHi+rN3XEI7jUmBLoYItlZTZOuBnr2gbxzVIwxKL8SKl65y2uVz
 3ONNk+XYUkW/199CBnH9OXhFnXGTdhiZwovZhoBHWnw5cuiFfRsTExQHBKYTOmDJhSDa
 xkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681330834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/+5Y31DzLoltDr5BDRmGw2yTc5HJ9pHuhMLv6VWPNHM=;
 b=QwdIf29H3s0FBjJunxelMXlDCvWGqkc5O58UAqypKPwPmm+Uwly9Zl64Vu4ExoQhPG
 6/NanWoOfNcsbrg75npkTj2OMJDSO/7sFMdPq/kGpY15Hvj1wTQlpCeAn2kMOF0hnk5x
 gmZdMzQZN4w33TKO+DwX/XPbxPI7FMqttWFenOO5AYF3nscXiGoscK9mWTrOlji+mlLH
 3DzZbfA9gztaexYo82dTwg2U9c4w91HtLSo77DXZ5Hny5nu3aR0Ybdf3lvrD1xF5P9ZW
 NwUktEwwtm2f3Wep9Q9z3q1KLg4u/FbQjG1qcJBStVGmiBOUjvOVcOrP2963CYmy47vg
 KdCw==
X-Gm-Message-State: AAQBX9doa1MXm0lOuZoakJNW62QFeznjEfHFMNKO069OZB+VO4QbKfEX
 Y9NR+QBDh7RX/BRK8VnRbXA5KA==
X-Google-Smtp-Source: AKy350Yvvxf1a2SQNCSkseFgH9EL8zVx2Zg43mErSqeUnkb/uq1pC3C73pEGq/UR2Hrp92vKE+isOw==
X-Received: by 2002:a05:6870:638d:b0:177:81bb:1b30 with SMTP id
 t13-20020a056870638d00b0017781bb1b30mr83678oap.31.1681330834435; 
 Wed, 12 Apr 2023 13:20:34 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a4a8c4f000000b0052a77e38722sm7417046ooj.26.2023.04.12.13.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:20:34 -0700 (PDT)
Message-ID: <6afd45ad-d11c-860f-6ba6-a8cc73683447@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:20:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 52/54] tcg/riscv: Simplify constraints on qemu_ld/st
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-53-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230411010512.5375-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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



On 4/10/23 22:05, Richard Henderson wrote:
> The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
> registers.  Now that we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target-con-set.h |  2 --
>   tcg/riscv/tcg-target-con-str.h |  1 -
>   tcg/riscv/tcg-target.c.inc     | 16 +++-------------
>   3 files changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
> index c11710d117..1a8b8e9f2b 100644
> --- a/tcg/riscv/tcg-target-con-set.h
> +++ b/tcg/riscv/tcg-target-con-set.h
> @@ -10,11 +10,9 @@
>    * tcg-target-con-str.h; the constraint combination is inclusive or.
>    */
>   C_O0_I1(r)
> -C_O0_I2(LZ, L)
>   C_O0_I2(rZ, r)
>   C_O0_I2(rZ, rZ)
>   C_O0_I4(rZ, rZ, rZ, rZ)
> -C_O1_I1(r, L)
>   C_O1_I1(r, r)
>   C_O1_I2(r, r, ri)
>   C_O1_I2(r, r, rI)
> diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
> index 8d8afaee53..6f1cfb976c 100644
> --- a/tcg/riscv/tcg-target-con-str.h
> +++ b/tcg/riscv/tcg-target-con-str.h
> @@ -9,7 +9,6 @@
>    * REGS(letter, register_mask)
>    */
>   REGS('r', ALL_GENERAL_REGS)
> -REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
>   
>   /*
>    * Define constraint letters for constants:
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 425ea8902e..35f04ddda9 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -125,17 +125,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>   #define TCG_CT_CONST_N12   0x400
>   #define TCG_CT_CONST_M12   0x800
>   
> -#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
> -/*
> - * For softmmu, we need to avoid conflicts with the first 5
> - * argument registers to call the helper.  Some of these are
> - * also used for the tlb lookup.
> - */
> -#ifdef CONFIG_SOFTMMU
> -#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
> -#else
> -#define SOFTMMU_RESERVE_REGS  0
> -#endif
> +#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
>   
>   #define sextreg  sextract64
>   
> @@ -1653,10 +1643,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>   
>       case INDEX_op_qemu_ld_i32:
>       case INDEX_op_qemu_ld_i64:
> -        return C_O1_I1(r, L);
> +        return C_O1_I1(r, r);
>       case INDEX_op_qemu_st_i32:
>       case INDEX_op_qemu_st_i64:
> -        return C_O0_I2(LZ, L);
> +        return C_O0_I2(rZ, r);
>   
>       default:
>           g_assert_not_reached();

