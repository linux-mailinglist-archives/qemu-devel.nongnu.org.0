Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D740A68F997
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:16:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrnS-0006PY-AJ; Wed, 08 Feb 2023 16:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPrnI-0006Of-0e
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:16:03 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPrnG-0000cY-DW
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:15:55 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so152935pjw.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kWVWkbGuD9bNyS02qwfyDGnF+6H5mm/unN3iTZqS3ss=;
 b=JFS2/LQT9YUAE7YEzyMcvVDEmDZaRjtIlmmXrbGMMKkgRXPHHznv5bm+07OW0P0YZu
 Bsj2JRi2kzkkFO5WsepeCNRMqWV+9sHfLnkPEqlwXM/hhhWV+CYqGTo62GbkSodHamU1
 sKbqd8D0d+/LC7ZNgKmVvdb+l3Avwwsj75BnsFcC3W4NyQN7lZ132hWwNvQov3XYq27H
 t5rcVuzgWlcmw9O5j+aTnxWQOfH1bfmUyRBEpVVHK/JPXqLxyLCu2xflxAKapW8wSnal
 hUg4EpKoJY+ZtUaTrixMVVEkwYQR/rVD7ikQZDNHsYywHbYkagS13ANbE0xQAPx9zMX4
 SoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWVWkbGuD9bNyS02qwfyDGnF+6H5mm/unN3iTZqS3ss=;
 b=1FMebuHuEtmFW6vYpkgKrw/yHiZjndXFIwBITJMMVTi8yu/qBsjLy1uhd0WKex+qii
 bOUqOb5VnzC8BPQja6NC2Ks4l2vLPGoiIFEWTac8KcOw7zQPJ4HQ9OUxBGhLAJj1dMPf
 uF3xt+P4RaxuRx19+QM0C4qPNfaJvbHaooCG7N7o728Mjp+eB/TP3RG2qfUkG8HjHFJv
 cl75luYgiTMFvC6/O3xq7H4hjnZXVoOasSG16aUzWaDmc2X1hCOBk82+hp8Ehfa2HsUb
 9ajZMOYDDvLw7tnezO7jVNmB3C45MaxxMlS63jXoLIvRhlIGtKM7Li4v0DhY0sHq2gsW
 9yeg==
X-Gm-Message-State: AO0yUKW6GJCodOJXM570ZnQamnjMuR7LcMSaVI2fiOg7NMK188PDpe/j
 +Kif0Rd6z/qBbaKEveo82ZBgkw==
X-Google-Smtp-Source: AK7set8uMsu6Y0KRJYsymhpS2hv0wqSWWpnq4gSiWTvRjyg4f7IHu8ZqHkVi+yJuOw9s44S2xSH9cg==
X-Received: by 2002:a05:6a20:3b25:b0:be:982b:ed86 with SMTP id
 c37-20020a056a203b2500b000be982bed86mr7752126pzh.29.1675890952837; 
 Wed, 08 Feb 2023 13:15:52 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 u24-20020a62ed18000000b005a84ef49c63sm292866pfh.214.2023.02.08.13.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 13:15:52 -0800 (PST)
Message-ID: <a3d7199d-d245-d576-4866-d701159f9249@linaro.org>
Date: Wed, 8 Feb 2023 11:15:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] target: Set `CF_PCREL` for arm and i386 frontends
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org
References: <20230207104352.11055-1-anjo@rev.ng>
 <20230207104352.11055-4-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230207104352.11055-4-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 00:43, Anton Johansson wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/arm/cpu-param.h  | 2 --
>   target/arm/cpu.c        | 5 +++++
>   target/i386/cpu-param.h | 4 ----
>   target/i386/cpu.c       | 5 +++++
>   4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 53cac9c89b..b7bde18986 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -31,8 +31,6 @@
>   # define TARGET_PAGE_BITS_VARY
>   # define TARGET_PAGE_BITS_MIN  10
>   
> -# define TARGET_TB_PCREL 1
> -
>   /*
>    * Cache the attrs and shareability fields from the page table entry.
>    *
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 31dc595e11..62b876e0f0 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1551,6 +1551,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>       Error *local_err = NULL;
>       bool no_aa32 = false;
>   
> +    /* Use pc-relative instructions in system-mode */
> +#ifndef CONFIG_USER_ONLY
> +    cs->tcg_cflags |= CF_PCREL;
> +#endif

To fix bisection problems, the hunks setting CF_PCREL need to precede removal of the 
TARGET_TB_PCREL tests.  The removal of TARGET_TB_PCREL can happen all at once at the end.


r~

