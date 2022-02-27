Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA864C58D4
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:57:52 +0100 (CET)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7sl-000674-Eg
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7rf-0004nR-H0
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:56:43 -0500
Received: from [2607:f8b0:4864:20::531] (port=45995
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7rd-0005kS-Nj
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:56:43 -0500
Received: by mail-pg1-x531.google.com with SMTP id z4so8244569pgh.12
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OiX6nhExOdyKL5bsqa+cYLiT53LIbh4asWMub34TuAU=;
 b=CHkg8btX64kUAyhR8CSGEnlHo1ZH9J20YYPMvq13xuwro37u7nOn2eB1A/PIC+yvXX
 sKiUrrRzxTINffbfqco3SPF6n6ruFV9qLnsBaPts0Ru5zitD2Mi0bf7IgaUFXyzqNNVx
 j+kcdbxSuAlasF5ecGMcHyUBtlOndPzkbDtwSqUBjbw5hZP0tlQzpu3NfbrnGUr05UBR
 DDhLgGUccHjVTmqJAi90tJWUcIgl44Ig82TMgRryEtnPB/efwYj5SA95SVQ6QoDHNFs5
 rL1yR/koRIMpBaIc35oLpH7B41tqcire99dnxUq2qUzgCPqamFmZKUFomUki2DZEMtH2
 otjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OiX6nhExOdyKL5bsqa+cYLiT53LIbh4asWMub34TuAU=;
 b=pJ9/R6Aw2OfmW27XpJxPfRoHOt3kNerBZ4Fg8piTE0oKzPWQlJwrKwcHZI0iTpZpur
 rdPK3/OJK2Unt9X+q3dh/hTclfae+H1CzAqy+mDgM9WnTPFxHBc7QqsB3C/D7IsyYrCG
 tzT9TyAh8ZBhSZc0je0MSWcVJsXh6UHEAl1QkxCBOdtOcRyuKo+haGhRAanITVZB4wH1
 hMd6cYKCVpvbOPJE/ef6mxzh1tcUF1qX6ILM7KdsFXN24BYkHbDigGFFHaf9X/fs4yNT
 h0sJ/NDbcJl/PwzMCQiHrjFh4J4tvCigPB9rmQdV1uTEwtqeZfBsZDTdRpEhzuk5ISAe
 mmBQ==
X-Gm-Message-State: AOAM532QNBxRplb3fAmTU8ESqVwInhylq4KZOd2POrn2ATtSlRaUxcJB
 XFessN81+5poKvUfvFg0scHJyQ==
X-Google-Smtp-Source: ABdhPJyd2Ih51tZP6vXQoPOAbxHUeUJmcdN4zlxf1SrrNF77y9MrEK3KwPjYL1Oq5qHHUlzyHN4svQ==
X-Received: by 2002:a05:6a00:124a:b0:4e1:7cfb:634c with SMTP id
 u10-20020a056a00124a00b004e17cfb634cmr14766912pfi.12.1645923400330; 
 Sat, 26 Feb 2022 16:56:40 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a056a0007d600b004f3ba7c23e2sm8100947pfu.37.2022.02.26.16.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:56:39 -0800 (PST)
Message-ID: <71304530-f1d7-13a9-c80e-f41a68a344c8@linaro.org>
Date: Sat, 26 Feb 2022 14:56:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign()
 with zero size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 08:07, Peter Maydell wrote:
> Currently if qemu_try_memalign() is asked to allocate 0 bytes, we assert.
> Instead return NULL; this is in line with the posix_memalign() API,
> and is valid to pass to _aligned_free() (which will do nothing).
> 
> This change is a preparation for sharing the qemu_try_memalign()
> code between Windows and POSIX -- at the moment only the Windows
> version has the assert that size != 0.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   util/oslib-win32.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 05857414695..8c1c64719d7 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -48,13 +48,16 @@ void *qemu_try_memalign(size_t alignment, size_t size)
>   {
>       void *ptr;
>   
> -    g_assert(size != 0);
>       if (alignment < sizeof(void *)) {
>           alignment = sizeof(void *);
>       } else {
>           g_assert(is_power_of_2(alignment));
>       }
> -    ptr = _aligned_malloc(size, alignment);
> +    if (size) {
> +        ptr = _aligned_malloc(size, alignment);
> +    } else {
> +        ptr = NULL;
> +    }

Oh, should we set errno to something here?
Otherwise a random value will be used by qemu_memalign.


r~

>       trace_qemu_memalign(alignment, size, ptr);
>       return ptr;
>   }


