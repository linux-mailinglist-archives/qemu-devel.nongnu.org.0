Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B560F411
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:53:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzVO-0006qA-5r; Thu, 27 Oct 2022 05:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzVL-0006jF-GB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:48:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzVI-0001lS-A5
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:48:51 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so941294pjd.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F1pGFEZwYTkhIQ0W3VPj4mIpPMu01nFKiW3yxeNxJ3Y=;
 b=ZdF6qufcuk594RKqIMDG1dzOTd/QuXbnuz9laXK+cPirAqA/10rRjuX3JW0uGcV84P
 ZxPwja/mAWXnGEwtwIUz75zB+fk3VKEWb9lKLxYxKLA/b70ZuxVcVD4uUoILiFXKCSLx
 v5UO6UDqLazBGG6jIoEujwu55brhqpPpK9SM01osA6rTMHFQ1kKXULkIoaUj6188T+HR
 ut5bB2Gl1mCYiKMSqI0K7xYP7DNUbOAFaAJSatXsnCqyvRSR+OKrVhLyFSuZMGl8Hyqy
 KKYCVtAjb4GMaTDjpiRfsF6OnW4c3S1HVI1kMGbX4JUtSiw2Ofa4d09v+yp4Y7gpyfxp
 irog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1pGFEZwYTkhIQ0W3VPj4mIpPMu01nFKiW3yxeNxJ3Y=;
 b=dhJAkVOL9x5npCHaGey2mmJ7G9hwtWjJhDvil7/CaPn6pVQSRFOERkWtfRfrxYsnfD
 LcODeS1wB8LDljOEkFAOxJkOIsNn/5AG4101KXYDrpG4Qb0wpBHvJs872HpDChwMfLBr
 vrBMV4TMJ64EZyKEAWifBjCdLGHZGXy8z0pHoOKlOlA3fPyeQn+Cg0gCtujyRuXR00dG
 5H6uX2rAr8b4wa9jSwI+LZStoyLuEwgjmRvp08vTFOGT9xYadCtRIrgNFf+haEPpTtDw
 zmhlgKHo9HJTe55Z5TnSLxgYlDbtZKHIrZBE9vQdffry86ADluwUdKRl4Lo4oe8FlCSV
 4Wlw==
X-Gm-Message-State: ACrzQf1aFOc+2cNae//KIAi6jEtKU80G2cnVYpCSDPZbFopGdlWowYmT
 7NlIfQ3fhKuUBITiDaCWTd0Qkg==
X-Google-Smtp-Source: AMsMyM4v6F/hCzETEA21Ff0HVSe+X4Mn4gtL73M/vxidBRpqJ/dggfWmh6oyNDkhE4gP0iOLhuOp6A==
X-Received: by 2002:a17:90a:4216:b0:20d:2891:157 with SMTP id
 o22-20020a17090a421600b0020d28910157mr9303547pjg.47.1666864125316; 
 Thu, 27 Oct 2022 02:48:45 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:3a91:9408:3918:55a?
 ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 x142-20020a633194000000b00462255f5aeasm716391pgx.40.2022.10.27.02.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 02:48:44 -0700 (PDT)
Message-ID: <c7d806c1-3f3b-f29b-0578-0b562ca9d3bf@linaro.org>
Date: Thu, 27 Oct 2022 19:48:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/hppa: Fix fid instruction emulation
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <Y1ol0OCotNwb6ccV@p100>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y1ol0OCotNwb6ccV@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 16:31, Helge Deller wrote:
> The fid instruction (Floating-Point Identify) puts the FPU model and
> revision into the Status Register. Since those values shouldn't be 0,
> store values there which a PCX-L2 (for 32-bit) or a PCX-W2 (for 64-bit)
> would return.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
> index c7a7e997f9..3ba5f9885a 100644
> --- a/target/hppa/insns.decode
> +++ b/target/hppa/insns.decode
> @@ -388,10 +388,8 @@ fmpyfadd_d      101110 rm1:5 rm2:5 ... 0 1 ..0 0 0 neg:1 t:5    ra3=%rc32
> 
>   # Floating point class 0
> 
> -# FID.  With r = t = 0, which via fcpy puts 0 into fr0.
> -# This is machine/revision = 0, which is reserved for simulator.

Is there something in particular for which this is failing?
Per the manual, 0 means simulator, which we are.
So far we haven't identified as a particular cpu, have we?


> +static bool trans_fid_f(DisasContext *ctx, arg_fid_f *a)
> +{
> +    nullify_over(ctx);
> +#if TARGET_REGISTER_BITS == 64
> +    save_frd(0, tcg_const_i64(0x13080000000000)); /* PA8700 (PCX-W2) */
> +#else
> +    save_frd(0, tcg_const_i64(0x0f080000000000)); /* PA7300LC (PCX-L2) */
> +#endif
> +    return nullify_end(ctx);
> +}

Missing ULL suffix.


r~

