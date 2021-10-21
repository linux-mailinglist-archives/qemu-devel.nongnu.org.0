Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C55436BEC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:19:04 +0200 (CEST)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeWl-0001Ux-BB
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdePr-0003Kz-6U
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:11:57 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdePa-0006W1-S9
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:11:54 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso1414451pjb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mz+SV0vaVBPO/X3/I6futvUI1HCJGMEKurei7ey8CXc=;
 b=JNCWDeGzAjbIaVjKjFRik5Op/Htxa/AubDfypDWU+oEgtE/ACwx3509bZKb11OL7wo
 Ht/UGOEod9xczTim4Z4XdaLAoSdzAFs5DN9zFv4iFnRFLOOuQso3iMv6KnjuQ/I35uLm
 ViUr6RMJGcfaaU+aRkWbSGGSGA8dg6zpSgoC7PzuExTT1nCl1mRdA4PFNb5OxMQJ975c
 uVN5IB57TOE0MIiZjwRQNgkeS6r6KHDAwQiVQZ+P8sF9v4d7pm7XFw8Cd/S9kF6iDr2Y
 PAXEuWAjcH+XBrciWmTg5kPnwTlxyo59Zloi58Z/8RrEQXzhmWXCSmJtvVb3nPZBT7aF
 bgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mz+SV0vaVBPO/X3/I6futvUI1HCJGMEKurei7ey8CXc=;
 b=50kysIqW6YqQzuy8PibHDCMBooRAiZcX5nb+bGK7jxiWNJWkTx1g5XfgowUViczHSS
 8zNnKrdFqc1cwDbKHkghBeqXWBNpyyprZfdY2FHjXqXuGa2FRSQETzIXnOQw4e8Ywqvm
 CTUtqafxbzz4UquP58bN1vrzdj2YAkg+kv9WnVq6WHotDnw9EY6FQo72PI9af7qZvhFw
 QRaduUbf1X1GMDkRW7rqQ6HmtX3dq/kvPxxU9jlHT8URE32zamqgH0WIaPz+jEOCC9DQ
 v7VWQJqx5JZkmJHlDrMFPeuecGPnNLzG9sTyuDKEpQHsieCKSvkihOrGEHlT6iToOgqd
 KLgg==
X-Gm-Message-State: AOAM5318Z1CYDIukwa+h8f4Fuwsj229zopgzKYLLtTvPOVms5UjyfoGr
 KbP0Mb6+2mC7cWX5os12eoydzQ==
X-Google-Smtp-Source: ABdhPJykWES9y3IFAU7mE8Q2Np2kC+b4TVFCYWMETQiLacokalw22h0Rbfb/Lavc4u3TdabAHcXZiw==
X-Received: by 2002:a17:90a:af93:: with SMTP id
 w19mr9498468pjq.10.1634847097212; 
 Thu, 21 Oct 2021 13:11:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l11sm7671975pfu.55.2021.10.21.13.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:11:36 -0700 (PDT)
Subject: Re: [PATCH v3 05/22] host-utils: move checks out of divu128/divs128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-6-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4473ec3-aa7c-f4cc-fca5-91a44035b1bc@linaro.org>
Date: Thu, 21 Oct 2021 13:11:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-6-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> In preparation for changing the divu128/divs128 implementations
> to allow for quotients larger than 64 bits, move the div-by-zero
> and overflow checks to the callers.
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Frederic, I had forgotten about this work that Luis has done here and in the next 3 
patches.  This overlaps with what you were doing in the RV128 patch set wrt getting a 
proper 128-bit divide.


r~

> ---
>   include/hw/clock.h        |  5 +++--
>   include/qemu/host-utils.h | 36 +++++++++++++----------------------
>   target/ppc/int_helper.c   | 14 +++++++++-----
>   util/host-utils.c         | 40 ++++++++++++++++++---------------------
>   4 files changed, 43 insertions(+), 52 deletions(-)
> 
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index a7187eab95..5a40a076aa 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -320,8 +320,9 @@ static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
>           return 0;
>       }
>       /*
> -     * Ignore divu128() return value as we've caught div-by-zero and don't
> -     * need different behaviour for overflow.
> +     * BUG: when CONFIG_INT128 is not defined, the current implementation of
> +     * divu128 does not return a valid truncated quotient, so the result will
> +     * be wrong.
>        */
>       divu128(&lo, &hi, clk->period);
>       return lo;
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index ca9f3f021b..e82e6239af 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -52,36 +52,26 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
>       return (__int128_t)a * b / c;
>   }
>   
> -static inline int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
> -{
> -    if (divisor == 0) {
> -        return 1;
> -    } else {
> -        __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
> -        __uint128_t result = dividend / divisor;
> -        *plow = result;
> -        *phigh = dividend % divisor;
> -        return result > UINT64_MAX;
> -    }
> +static inline void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
> +{
> +    __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
> +    __uint128_t result = dividend / divisor;
> +    *plow = result;
> +    *phigh = dividend % divisor;
>   }
>   
> -static inline int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
> +static inline void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
>   {
> -    if (divisor == 0) {
> -        return 1;
> -    } else {
> -        __int128_t dividend = ((__int128_t)*phigh << 64) | (uint64_t)*plow;
> -        __int128_t result = dividend / divisor;
> -        *plow = result;
> -        *phigh = dividend % divisor;
> -        return result != *plow;
> -    }
> +    __int128_t dividend = ((__int128_t)*phigh << 64) | (uint64_t)*plow;
> +    __int128_t result = dividend / divisor;
> +    *plow = result;
> +    *phigh = dividend % divisor;
>   }
>   #else
>   void muls64(uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b);
>   void mulu64(uint64_t *plow, uint64_t *phigh, uint64_t a, uint64_t b);
> -int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
> -int divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
> +void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
> +void divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
>   
>   static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
>   {
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index f5dac3aa87..510faf24cf 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -104,10 +104,11 @@ uint64_t helper_divdeu(CPUPPCState *env, uint64_t ra, uint64_t rb, uint32_t oe)
>       uint64_t rt = 0;
>       int overflow = 0;
>   
> -    overflow = divu128(&rt, &ra, rb);
> -
> -    if (unlikely(overflow)) {
> +    if (unlikely(rb == 0 || ra >= rb)) {
> +        overflow = 1;
>           rt = 0; /* Undefined */
> +    } else {
> +        divu128(&rt, &ra, rb);
>       }
>   
>       if (oe) {
> @@ -122,10 +123,13 @@ uint64_t helper_divde(CPUPPCState *env, uint64_t rau, uint64_t rbu, uint32_t oe)
>       int64_t rt = 0;
>       int64_t ra = (int64_t)rau;
>       int64_t rb = (int64_t)rbu;
> -    int overflow = divs128(&rt, &ra, rb);
> +    int overflow = 0;
>   
> -    if (unlikely(overflow)) {
> +    if (unlikely(rb == 0 || uabs64(ra) >= uabs64(rb))) {
> +        overflow = 1;
>           rt = 0; /* Undefined */
> +    } else {
> +        divs128(&rt, &ra, rb);
>       }
>   
>       if (oe) {
> diff --git a/util/host-utils.c b/util/host-utils.c
> index a789a11b46..701a371843 100644
> --- a/util/host-utils.c
> +++ b/util/host-utils.c
> @@ -86,24 +86,23 @@ void muls64 (uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b)
>       *phigh = rh;
>   }
>   
> -/* Unsigned 128x64 division.  Returns 1 if overflow (divide by zero or */
> -/* quotient exceeds 64 bits).  Otherwise returns quotient via plow and */
> -/* remainder via phigh. */
> -int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
> +/*
> + * Unsigned 128-by-64 division. Returns quotient via plow and
> + * remainder via phigh.
> + * The result must fit in 64 bits (plow) - otherwise, the result
> + * is undefined.
> + * This function will cause a division by zero if passed a zero divisor.
> + */
> +void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
>   {
>       uint64_t dhi = *phigh;
>       uint64_t dlo = *plow;
>       unsigned i;
>       uint64_t carry = 0;
>   
> -    if (divisor == 0) {
> -        return 1;
> -    } else if (dhi == 0) {
> +    if (divisor == 0 || dhi == 0) {
>           *plow  = dlo / divisor;
>           *phigh = dlo % divisor;
> -        return 0;
> -    } else if (dhi >= divisor) {
> -        return 1;
>       } else {
>   
>           for (i = 0; i < 64; i++) {
> @@ -120,15 +119,20 @@ int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
>   
>           *plow = dlo;
>           *phigh = dhi;
> -        return 0;
>       }
>   }
>   
> -int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
> +/*
> + * Signed 128-by-64 division. Returns quotient via plow and
> + * remainder via phigh.
> + * The result must fit in 64 bits (plow) - otherwise, the result
> + * is undefined.
> + * This function will cause a division by zero if passed a zero divisor.
> + */
> +void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
>   {
>       int sgn_dvdnd = *phigh < 0;
>       int sgn_divsr = divisor < 0;
> -    int overflow = 0;
>   
>       if (sgn_dvdnd) {
>           *plow = ~(*plow);
> @@ -145,19 +149,11 @@ int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
>           divisor = 0 - divisor;
>       }
>   
> -    overflow = divu128((uint64_t *)plow, (uint64_t *)phigh, (uint64_t)divisor);
> +    divu128((uint64_t *)plow, (uint64_t *)phigh, (uint64_t)divisor);
>   
>       if (sgn_dvdnd  ^ sgn_divsr) {
>           *plow = 0 - *plow;
>       }
> -
> -    if (!overflow) {
> -        if ((*plow < 0) ^ (sgn_dvdnd ^ sgn_divsr)) {
> -            overflow = 1;
> -        }
> -    }
> -
> -    return overflow;
>   }
>   #endif
>   
> 


