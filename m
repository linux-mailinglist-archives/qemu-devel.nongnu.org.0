Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AF6BBA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:08:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcUaX-0000a8-3X; Wed, 15 Mar 2023 13:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUaV-0000Zm-HN
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:06:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUaT-0003Cy-VJ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:06:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso1737585wms.5
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678900012;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E31+8ikWHf/RWbeu2o+z3RuJrctFqIM2P9eILfJI2WE=;
 b=nST+a7r6JsJjLYY3RyOg31B4tb99DaCR1pouo7Um6pvCgdYs3SNNbicaHUWqiN34Fw
 cDxTiVWJhQdQUJyDGtd5Zkneo1LNIcz1UHRqLWpHjTO5qwEMlQhEa3ZVhyal29e/rU0w
 iUaUba7GO4zJLMfCZH/wGMd6aVBKwTl+merLUXNov57mK/32Spx60M9UrHAaEzKZ0wmm
 OT6ozzd2FbTsro0j7aw/NkIsWVfAnQ7CA6eXjgBgECMR9i64+90HjqzovIZ0BFAH/Eoe
 Dnkkrd+0CGMWiA8Cje33QlSGMEaI2JuBu7B20BSI7ir+cnjf3R/1Fmc+eltLaRdZxN1V
 UNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678900012;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E31+8ikWHf/RWbeu2o+z3RuJrctFqIM2P9eILfJI2WE=;
 b=SSbHqpauhpsiWH01mdx1KJAGTuBYiDyaeKo3FbFg0EmaxRDPy3PIiZ0inHqTL4EykE
 szLxcvoFZpvtio5yx6Ny+CITRwcwi6hqadGVPm0DnXb2V2/jKOWAXVJItyRkgWaTpmf7
 v7LBvApOat0c5rRo2TiHsQBvgFRwNqMonUFlVRKhkPBT3E7cYrFdzDP+uGoIa8xodR0m
 Elx/Kg/GoIH1hqwV5IdVuHO2cz0VKPIMDKLmuTHi9NRUjm0IIOcJ4wDqN5lH/IA+2uDf
 4iN1ShJZJGaCEH1JI2/iJ0pJBUAZhuiBUqgLocbQREjbWmfLCTesxKXN6I/6IOZXnK27
 MSLQ==
X-Gm-Message-State: AO0yUKVfEFEC79Ryd6MBaQ5otQMd1nDUpuYhoqjwztDcM1nVdUPSS5OC
 re+BS+BZKz0ZtLV4PdSmxUrdQA==
X-Google-Smtp-Source: AK7set9sJXwmKA3IA3doDkicKkJzG4zcHB6Jrb0xHPoPC9ZGtFy585i2pTjPM82Y2VTvQH0j9kr7Kg==
X-Received: by 2002:a05:600c:3151:b0:3eb:f664:b6e with SMTP id
 h17-20020a05600c315100b003ebf6640b6emr18223686wmo.24.1678900012096; 
 Wed, 15 Mar 2023 10:06:52 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b003ebf73acf9asm7448323wms.3.2023.03.15.10.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 10:06:51 -0700 (PDT)
Message-ID: <d497e26a-768c-50b9-c4a6-f116e612fcc7@linaro.org>
Date: Wed, 15 Mar 2023 18:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 14/30] tcg/i386: Add have_atomic16
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216025739.1211680-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/2/23 03:57, Richard Henderson wrote:
> Notice when Intel or AMD have guaranteed that vmovdqa is atomic.
> The new variable will also be used in generated code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/cpuid.h      | 18 ++++++++++++++++++
>   tcg/i386/tcg-target.h     |  1 +
>   tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>   3 files changed, 46 insertions(+)
> 
> diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h

> +/*
> + * Signatures for different CPU implementations as returned from Leaf 0.
> + */
> +
> +#ifndef signature_INTEL_ecx
> +/* "Genu" "ineI" "ntel" */
> +#define signature_INTEL_ebx     0x756e6547
> +#define signature_INTEL_edx     0x49656e69
> +#define signature_INTEL_ecx     0x6c65746e
> +#endif
> +
> +#ifndef signature_AMD_ecx
> +/* "Auth" "enti" "cAMD" */
> +#define signature_AMD_ebx       0x68747541
> +#define signature_AMD_edx       0x69746e65
> +#define signature_AMD_ecx       0x444d4163
> +#endif

Hmm, I see the "??? Irritating that we have the same information in
target/i386/." comment from commit 5dd8990841 ("util: Introduce
include/qemu/cpuid.h") :/

