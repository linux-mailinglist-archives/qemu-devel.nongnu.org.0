Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B34ECBB5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:19:36 +0200 (CEST)
Received: from localhost ([::1]:42220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcut-0000It-R3
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:19:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcjC-000261-BU
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:07:30 -0400
Received: from [2001:4860:4864:20::2a] (port=46919
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcj9-00063U-5i
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:07:28 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-d39f741ba0so22845224fac.13
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wtxcEHuCe2wOtEKyvknxbnt2GWp+81fqTy9QWmc8A+8=;
 b=SS7T5bT/4SqWerwWSUEPWOdRRUf6euzi0OJ1+pz5Hkj4LLR2CdSLZvZpeh0+XJlyA3
 3e7wXV8fnHxNJpNqJMBr9WmTQv87AWlw+230calP0VWarRfrJSiPj2GaC15fnxNp32PU
 DunS219AkgEosGoS4wrngk2lshX7aDWBHT/a8rggqpv+mPUFMe49yUmw2lwfFiZcM8aC
 k9M0cvpZA6OIrtILrFzkEr43zHI2LRJyi2lTpy48E4/zcLAn4RSufR3BCk6drzmMlUQf
 hzatnlsHarCljq/qKgGUsOGLLiazCclKJeX+pDbqZzmleWi6XzJAN9BjlRMAP6BsER7C
 bMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wtxcEHuCe2wOtEKyvknxbnt2GWp+81fqTy9QWmc8A+8=;
 b=p3Np3oDRkSpmWtG1vIVALDZy6G8+wJDAKZMo6J+hO8jb4oVn8mqW5KGuIDmBoMzn2x
 OBgkQaZF64f9gLbmybRNUcC+fTqAYnSglc2EZPHJMYyjyTzAhxTfJcrMX8a44zXoZnJZ
 i7A7AqhSqLCT2mNKikfhCo33zIO+RYKCe1teGdN6iTaDQEQZRQhQZUOiMjLySpRTGjQr
 cRwOETHydcOj3ibvg5neAH+t2FagOxHjmgWXW7XtZDPfYjk1vYPlat8s18roScuQqJ8x
 HSTjSeEvEzFhFYCoLkRUMgzMrqfFV+oJGUJ5z9dXMk1X4HhyQl39/cr5Ekq9taHuKxq/
 WwuQ==
X-Gm-Message-State: AOAM533x0ILVaOqK+gTT56W7M8ByzovfgeqJL/E2sp89niwj494B8HEA
 MZvZVguWU0s3zRh69mC/Lt8TLw==
X-Google-Smtp-Source: ABdhPJwtMmTVjoH2aPXEgAybuP/hHnozE35VX0sLPO5Vt5W7n05cTruk3Pv6wGQc1KA3PFyb4R/mYQ==
X-Received: by 2002:a05:6870:2425:b0:de:2fb0:1caa with SMTP id
 n37-20020a056870242500b000de2fb01caamr474743oap.115.1648663645894; 
 Wed, 30 Mar 2022 11:07:25 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 r18-20020a056830081200b005ad10dfcf60sm10521325ots.67.2022.03.30.11.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:07:25 -0700 (PDT)
Message-ID: <66820e62-ab8a-b9da-aed0-cbe1f9d07934@linaro.org>
Date: Wed, 30 Mar 2022 12:07:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/8] qemu/int128: avoid undefined behavior in
 int128_lshift
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 11:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Avoid the left shift of negative values in int128_lshift by casting
> a/a.hi to unsigned.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Eh, maybe.  We do this all over qemu, and I think any undefinedness you're thinking of in 
the base C standard is removed by the -fwrapv with which all files are compiled.


r~

> ---
>   include/qemu/int128.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
> index 2c4064256c..2a19558ac6 100644
> --- a/include/qemu/int128.h
> +++ b/include/qemu/int128.h
> @@ -85,7 +85,7 @@ static inline Int128 int128_rshift(Int128 a, int n)
>   
>   static inline Int128 int128_lshift(Int128 a, int n)
>   {
> -    return a << n;
> +    return (__uint128_t)a << n;
>   }
>   
>   static inline Int128 int128_add(Int128 a, Int128 b)
> @@ -305,7 +305,7 @@ static inline Int128 int128_lshift(Int128 a, int n)
>       if (n >= 64) {
>           return int128_make128(0, l);
>       } else if (n > 0) {
> -        return int128_make128(l, (a.hi << n) | (a.lo >> (64 - n)));
> +        return int128_make128(l, ((uint64_t)a.hi << n) | (a.lo >> (64 - n)));
>       }
>       return a;
>   }


