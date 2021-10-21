Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D26436D3A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:07:06 +0200 (CEST)
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgDJ-0004xn-Fr
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdg5H-0007B8-CX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:58:47 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdg5C-0001D2-QB
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:58:47 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q5so1501806pgr.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WWwN8kj/YmQwcsqZlO1R3TtfviUyu/WtfELuSubDSWo=;
 b=zKz0dFtvqMnyKdmPez2bS/IVAtxi3hrDUJJ0DMAUaewiQWyKhr2zmI5+hUY5fliXpZ
 i5SDJOQUdxk5FZhhQQumRi08zrzWw9vUCKCdDbPb1R5FedCBUKWwNwa74ZfaUCRnptiK
 TflE8CZOoefMxv0nG0fygQcBKekjsgznILvHO0LCSK9Ymel9JX/trYN9AsJlMpk19TWu
 gCXm3KoJaRsG/U1RG4IKkUeCx0b+iJL3LEckxDR6mXPBh/MH/OAh57Z/QCz+BAoJSyla
 oSlWPLLuYKd3hI1ez6vx1+Q4DW4pg1nvek74wzvbDaJ9J2zGUrqhxPs+dTqJTHevQb14
 OrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WWwN8kj/YmQwcsqZlO1R3TtfviUyu/WtfELuSubDSWo=;
 b=NLnACFfLevE4hCoU8FVl4957VPx5KZecXY/p204mF5oTqTRVtW1FN1SBvCeOYa6LUf
 4S5Q9eRkWeIrTabdFB6qqhgFjp1SkyVW5dJUC2+Et8mJ1rTtQwW4e9l8iYCkqwI7HWQ8
 Tt1k+w7Mr5m4gs12dQwnBPvzCoPeHLeLsougrHuKKtpMMpIkfrKbHMAeypGlWmY5UuLN
 dTjv8TKomrn2XjPZHdLOaWl9yst0j2+idsKSgH9VyQTj5LBWBGufxZCQ4ABoAblJTcgC
 /2rPNtFuFYLxDtofUUiK4BKkG2ZrabXx9wz8R6CjlH7d6PC5YgIStbVvb3bdMcMPgrZ+
 F9EQ==
X-Gm-Message-State: AOAM531too23Wfj3OiNtwEBqS5IiENYQzfHzx1A6NKjyv8ySKdg3dRNU
 k4Mvu/6PyRacpZe0qxFLp8MqKA==
X-Google-Smtp-Source: ABdhPJwNauCBXtTSJlAQBE7kK0LldY3D6CHCvgsaZRofOZ6NHgpQa6v5K7LzWScU/l0/nl6fir5Jpw==
X-Received: by 2002:a63:7743:: with SMTP id s64mr6478741pgc.184.1634853521093; 
 Thu, 21 Oct 2021 14:58:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm11600623pjb.2.2021.10.21.14.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 14:58:40 -0700 (PDT)
Subject: Re: [PATCH v3 16/22] target/ppc: Move dtstdc[q]/dtstdg[q] to
 decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-17-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a460a151-c1ad-36f4-b76c-ac34af0281db@linaro.org>
Date: Thu, 21 Oct 2021 14:58:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-17-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> +&Z22_bf_fra     bf fra dm
> +@Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf_fra
> +
> +%z22_frap       17:4 !function=times_2
> +@Z22_bf_frap    ...... bf:3 .. ....0 dm:6 ......... .           &Z22_bf_fra fra=%z22_frap

How confusing.  There's a typo in the manual for these insns, with the minor opcode (XO) 
field at the wrong location.  It's correct in the summary of instruction formats at the 
beginning of the manual.

> -#define GEN_DFP_BF_A_DCM(name)                    \
> -static void gen_##name(DisasContext *ctx)         \
> -{                                                 \
> -    TCGv_ptr ra;                                  \
> -    TCGv_i32 dcm;                                 \
> -    if (unlikely(!ctx->fpu_enabled)) {            \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);     \
> -        return;                                   \
> -    }                                             \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);   \
> -    ra = gen_fprp_ptr(rA(ctx->opcode));           \
> -    dcm = tcg_const_i32(DCM(ctx->opcode));        \
> -    gen_helper_##name(cpu_crf[crfD(ctx->opcode)], \
> -                      cpu_env, ra, dcm);          \
> -    tcg_temp_free_ptr(ra);                        \
> -    tcg_temp_free_i32(dcm);                       \
> +#define TRANS_DFP_BF_A_DCM(NAME)                             \
> +static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
> +{                                                            \
> +    TCGv_ptr ra;                                             \
> +    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
> +    REQUIRE_FPU(ctx);                                        \
> +    ra = gen_fprp_ptr(a->fra);                               \
> +    gen_helper_##NAME(cpu_crf[a->bf],                        \
> +                      cpu_env, ra, tcg_constant_i32(a->dm)); \
> +    tcg_temp_free_ptr(ra);                                   \
> +    return true;                                             \
>  }

Functional change: you're no longer storing nip.  It does seem wrong, but that fix should 
be broken out to a separate patch.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

