Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D538699D1A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 20:43:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSk9d-0003wq-DQ; Thu, 16 Feb 2023 14:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSk9R-0003uk-9m
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:42:42 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSk9P-0006AQ-Bt
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:42:40 -0500
Received: by mail-pg1-x531.google.com with SMTP id 7so1957518pga.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 11:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pDcp5WhssHtNHzB5mwwq5Dt8iMCNv/D5OnYirDbpf6I=;
 b=DygV0LGj0ySB8xgSz/Fc0nCy7QSJffyNtmtis4IhlcsP0Rw0+Cb6G8ZiyOj6zaUwOr
 D/GGXzembIUA1CpY+aQ9FwhFFH4gyNxCvFnuB8EPtHL+gIIG0AZmiS9jq12KXv/etR2v
 w4Go0mmkYxw/ZBZYOfBlf3hbm3qPlfH2NOkq3DDChG9eX+2cm2e7GF9QDAMqOiMmTaf/
 fPwJRRG7yFOWK+Glhq0/NawRf/SDT7oBEHJEjOTzNJc0bw9tqYFnwP0/ntsf0QfvZ+5B
 3rrX91NgUkeKF5IjfLvvcfyfaR1KPcWyikgeviQCh0yp0Pc3RRK/GeiS2z7nARqQjwwZ
 knmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDcp5WhssHtNHzB5mwwq5Dt8iMCNv/D5OnYirDbpf6I=;
 b=s7/PO1RSsEmcwPcQFNgSa/8niEQdhHQbvkOdy5LEk+c7Qx7uhnEZIeb/9Ld6OWue+v
 q7lokasmwY6woID/HqxECvqaR2Y8A9arbX4wOIzmwxXNFYGPN7ALPojb46SzXv/3rjqy
 jXpUuM0YyCw1Yql6DD+JAv2WuBTL/2coE5teET8X6QKgw8YBVcpvddIJP9HcH4C1fF/K
 KFkJXJIYvZbJY8oeD1J9DxENnDiQ17gYSWTdJ99ueTXX9Ni83mDZArp96deYWXpseUjm
 7lCJSgPY29asVP9a0Rs0kNQjGXIyIbGVhA32QXaCzGNPyWe2dkFu/tue0ysH7HK5ifS0
 yDLw==
X-Gm-Message-State: AO0yUKVBC5rNR3Qu7pGSwt1VfUNOO2dHeNFYWhQ11NnP5qXryFGbo3Kj
 MEd8cSZx3L8nK9SZfZBRJFTSDw==
X-Google-Smtp-Source: AK7set/kB47bYn6trpVqmw4/wIpZpCo0PotklCuWFg2uS23P0FcHxrIAK3ZLH+1ok1uOAJZLRNosGw==
X-Received: by 2002:aa7:9e1a:0:b0:58d:d546:8012 with SMTP id
 y26-20020aa79e1a000000b0058dd5468012mr5698286pfq.0.1676576557769; 
 Thu, 16 Feb 2023 11:42:37 -0800 (PST)
Received: from ?IPV6:2607:fb90:8f62:8652:bed9:812b:5b9e:e49a?
 ([2607:fb90:8f62:8652:bed9:812b:5b9e:e49a])
 by smtp.gmail.com with ESMTPSA id
 s26-20020aa78d5a000000b0058dbb5c5038sm1623448pfe.182.2023.02.16.11.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 11:42:37 -0800 (PST)
Message-ID: <c9bb01bb-4763-0ab4-11ab-34025c586004@linaro.org>
Date: Thu, 16 Feb 2023 09:42:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] util/cacheflush: fix cache on windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-2-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230216134911.6803-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 2/16/23 03:49, Pierrick Bouvier wrote:
> ctr_el0 access is privileged on this platform and fails as an illegal
> instruction.
> 
> Windows does not offer a way to flush data cache from userspace, and
> only FlushInstructionCache is available in Windows API.
> 
> The generic implementation of flush_idcache_range uses,
> __builtin___clear_cache, which already use the FlushInstructionCache
> function. So we rely on that.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This is reasonable for now.  I'll note that gcc does not yet support windows for aarch64, 
and I would guess this would be fixed for libgcc at such time as.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> ---
>   util/cacheflush.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/util/cacheflush.c b/util/cacheflush.c
> index 2c2c73e085..0a0acd70fa 100644
> --- a/util/cacheflush.c
> +++ b/util/cacheflush.c
> @@ -121,8 +121,10 @@ static void sys_cache_info(int *isize, int *dsize)
>   static bool have_coherent_icache;
>   #endif
>   
> -#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
> -/* Apple does not expose CTR_EL0, so we must use system interfaces. */
> +#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
> +/* Apple does not expose CTR_EL0, so we must use system interfaces.
> + * Windows neither, but we use a generic implementation of flush_idcache_range
> + * in this case. */
>   static uint64_t save_ctr_el0;
>   static void arch_cache_info(int *isize, int *dsize)
>   {
> @@ -225,7 +227,9 @@ static void __attribute__((constructor)) init_cache_info(void)
>   
>   /* Caches are coherent and do not require flushing; symbol inline. */
>   
> -#elif defined(__aarch64__)
> +#elif defined(__aarch64__) && !defined(CONFIG_WIN32)
> +/* For Windows, we use generic implementation of flush_idcache_range, that
> + * performs a call to FlushInstructionCache, through __builtin___clear_cache */
>   
>   #ifdef CONFIG_DARWIN
>   /* Apple does not expose CTR_EL0, so we must use system interfaces. */


