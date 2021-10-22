Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F58438084
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 01:18:24 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me3nr-0006KY-3I
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 19:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me3lq-0005Yk-Am
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 19:16:19 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me3ln-0005Pu-Cf
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 19:16:18 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso4054355pjw.2
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 16:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K9WovcyhSPFHjZiBlwUcjPfB5VLTk/PY8ovIdTZ3aCg=;
 b=Jb+y+9IQQcMv5K6JaSWhPy62GkatdTeOJmdxlybeVzT8pn/0W/enlQmWwRN10z5MtF
 OM2xbOu8VcETpAOWimeTsmzFD+869nDhhDVr/EyeE0f97Q3/JHqpnnr/6dm+IH8yz1by
 TWArw1I0FK0I2LuVWVvfhvo0Ge/joH9fZ8DD5s5TOGQwTTHVd8eVfIaHm1x+950jdr/0
 /ROVWQgAzfuKArPJOpY7+RpZ5OAncK1217RHv/oeBekAljKSsgfoG5AW2ELpSHV9uiPq
 0d7/UaJmomubJkL6szIhRJVHsNKBEiUKHrPGNmq6XYIXrsWFolOQ0FD3y/uQrZ1D0EFS
 aj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K9WovcyhSPFHjZiBlwUcjPfB5VLTk/PY8ovIdTZ3aCg=;
 b=uhp/j2ogOfip1TmJ6zzrVG6D0uEua0jvz4gZOFTl6QW0MIW2fVDj6j6chwsfPOWCaj
 a6GLJPEaEpCf7VbI2xdCTP4+EDunOIF3nS3pRvnhQPNtIadj3j4NXK5x/KbkXY1dxOL3
 eKdc8GJAzGabcVGzeHH4Iwr2PuMlw0NHHNWnieE1gP3oAYqVWKTW/zbIBsd58PiJsYAB
 B81dy4LCT+Q7KC5H64QH9xeloNcZAW3nx85uewDwL0NqLXH6k/RMXt5cK5ZO2pkLLlJO
 JJT65qLSzWyROdh09tAIqSjZ/4ZBLB8bi5BFhWuJt1nsfWdemZBTnU6hKGXZqplPFGug
 A6tw==
X-Gm-Message-State: AOAM5312AW/YlOxpR7hNp/wGmI9Mwt8gDQyCf2TJjbCW5Elitgd4/sC3
 Z5MsXjWXAi5/gjh5XLC3WkgW2g==
X-Google-Smtp-Source: ABdhPJy1h5PBTwADpqjXtSmRkmChdNCQiV4SZTYxaXwb7DHle+AI6D/jPoGK+P/idex86L3yzjoMcg==
X-Received: by 2002:a17:902:7043:b0:13e:1007:3d6d with SMTP id
 h3-20020a170902704300b0013e10073d6dmr2284024plt.79.1634944573226; 
 Fri, 22 Oct 2021 16:16:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v19sm7076952pfu.179.2021.10.22.16.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 16:16:12 -0700 (PDT)
Subject: Re: [PATCH 07/33] target/ppc: Implement cntlzdm
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-8-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b46ddf0b-d8fa-ab15-4f6f-aa8a24ff7e45@linaro.org>
Date: Fri, 22 Oct 2021 16:16:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-8-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +uint64_t helper_CNTLZDM(uint64_t src, uint64_t mask)
> +{
> +    uint64_t sel_bit, count = 0;
> +
> +    while (mask != 0) {
> +        sel_bit = 0x8000000000000000ULL >> clz64(mask);
> +
> +        if (src & sel_bit) {
> +            break;
> +        }

We need to count how many mask are set left of mask & src.
How about

     sh = clz64(src & mask);
     if (sh == 0) {
         return 0;
     }
     return ctpop64(mask >> (64 - sh));

which could probably be implemented inline relatively easy.

> +static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +#if defined(TARGET_PPC64)
> +    gen_helper_CNTLZDM(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
> +#else
> +    qemu_build_not_reached();
> +#endif
> +    return true;
> +}

Why the ifdef here?  Oh, I see. You could just use target_long in the helper to avoid 
that.  And if not, you should move the helper into an ifdef too.


r~

