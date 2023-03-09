Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F46B20F2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 11:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paDD0-0000Fs-Os; Thu, 09 Mar 2023 05:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paDCx-0008U7-1K
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:09:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paDCv-0007iG-H9
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:09:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso874762wmo.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 02:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678356547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vS2IVQAK/lSrGSlMQTTrbU3WWS+NGPrImq360fC7Tlw=;
 b=KXnhd7bW705yt1pVgZSfSmp2eC8Tgl/npcrqQK/lSY3/9j8dFpVOWRTElGJOwAVAoW
 wG3c+yDWSPC8xkmBowXVefQC0mZIUbcBZ9++6pK0/57q5cZzxsQ+HEPgvVOBPa/tfSHW
 kKOQ7LbvoUICFwrF8JMM0Ll2PBbaCd2aUigPPHrlOXuU0fBQCeAYGwDCJF6/T4XPx3XL
 LZXtHVqV/qqMRZTsRUbZ8E8alNQnC4ZuT+6qXb8U7yBIILMiAR8Pi3HSPcUNBMj2m3A9
 PvTk7bAZfzCIQMH01PSqxd2xYzkrdPC1bgRWIDxJ8z8MRUJu8hhRmjg34GZUC9d19KPr
 e31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678356547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vS2IVQAK/lSrGSlMQTTrbU3WWS+NGPrImq360fC7Tlw=;
 b=YSoEl/UT90Z9Sd8ldb3FeBnKgH41aTleahwMLtpAezNQMoykpE8X9ZBfT3znL1YtKG
 Mnuzlc4mFu7Ji7NuSVojnCcXcqLgWUy7wtu4GPE+HS0r4nU0V9kzFQhZqp1vtxUP+k4T
 P4UM2HpV1lw+YgdBCoYBnO1xavxHs+ZPoRAXZFOqML8gmw2RqSMlmqNKG0XelQ3bUU6h
 Y84ZdPtIk2dnUFRVwqu12Eq+s3LzqoiiOTSyFOCOKW6IX88iproI17VYiy2XNi8KjJS3
 +AivyT3NbT+fC4m1Tbn0XBsoHbAHVSwfV+4IsDEJYLg+ewOK5wJLuFLkeTtZ25K66zWB
 sOug==
X-Gm-Message-State: AO0yUKXy2ZOQwrjiS24Np+YUpDxdcByGxj9LO5BgwAp9cOHMDGsmLaVI
 meK9s8wAAwWPjyFHELW6QVuwdA==
X-Google-Smtp-Source: AK7set/oz6g814ULJ8eWBS+EwiVRCz6pEQtq3/jJKYfVuTC5OMEnF0nAuUXkWcz4JKyXAV8OQUxd2A==
X-Received: by 2002:a05:600c:3b10:b0:3eb:399d:ab18 with SMTP id
 m16-20020a05600c3b1000b003eb399dab18mr19831790wms.35.1678356547395; 
 Thu, 09 Mar 2023 02:09:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003e209186c07sm1990014wmi.19.2023.03.09.02.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 02:09:06 -0800 (PST)
Message-ID: <a5f91afa-a47a-3f88-0277-e60ce9ead8d0@linaro.org>
Date: Thu, 9 Mar 2023 11:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 23/25] target/tricore: Use min/max for saturate
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/3/23 19:35, Richard Henderson wrote:
> Use tcg_constant_i32 for the bounds.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>   target/tricore/translate.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)

>   static void gen_saturate(TCGv ret, TCGv arg, int32_t up, int32_t low)
>   {
> -    TCGv sat_neg = tcg_const_i32(low);
> -    TCGv temp = tcg_const_i32(up);
> -
> -    /* sat_neg = (arg < low ) ? low : arg; */
> -    tcg_gen_movcond_tl(TCG_COND_LT, sat_neg, arg, sat_neg, sat_neg, arg);
> -
> -    /* ret = (sat_neg > up ) ? up  : sat_neg; */
> -    tcg_gen_movcond_tl(TCG_COND_GT, ret, sat_neg, temp, temp, sat_neg);
> +    tcg_gen_smax_tl(ret, arg, tcg_constant_i32(low));

This one is trivial when looking at tcg_gen_smax implementation.

> +    tcg_gen_smin_tl(ret, ret, tcg_constant_i32(up));

OK, when changing TCG_COND_GT -> TCG_COND_LT and inverting the args,
then this becomes obvious this is tcg_gen_smin.

>   }
>   
>   static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
>   {
> -    TCGv temp = tcg_const_i32(up);
> -    /* sat_neg = (arg > up ) ? up : arg; */
> -    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
> +    tcg_gen_umin_tl(ret, arg, tcg_constant_i32(up));

Inverting args for TCG_COND_GTU -> TCG_COND_LTU, this is indeed
tcg_gen_umin.

>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


