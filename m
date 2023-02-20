Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39A69D067
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:17:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7tx-0002xQ-GJ; Mon, 20 Feb 2023 10:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7ts-0002wk-TU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:16:22 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU7tq-0002J3-LK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:16:20 -0500
Received: by mail-wm1-x334.google.com with SMTP id m23so1150042wms.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pZ2XVjOdnVyIndVJd4ST9KZZL5xpOni2m9pT3X4cDOY=;
 b=o8X+aus+glD0O92aXmNRA3iZCAUHIy0OIO8rxKyFfqfs2HyToHMRJoT6fAnRP9ERfZ
 Ai7s8b5GJ+c7dOcm+YrmIzl5x7chtvEoCpIsPtul431Z9Ym3vGG3PMXhlp2wCtzVBcoP
 MeaxZIOk3BTrG4AZ3X6D5VUPSQ828DeU6lN++E/rz5lofGxhoeMV2T2ZObRCYk3AhD9G
 bEaVEW9IOWgQ0J2fWahYyJH1uO8JWvO+hE5rTuoRlAgA7ITrEyHo67sWeZOs0PZSwvGs
 eDct7UfCJxV99L/QSHIVCUlhsyCXomFps78Jbz/kD4BmetqmFWnC/yLnZyZvV3il3S8x
 rbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pZ2XVjOdnVyIndVJd4ST9KZZL5xpOni2m9pT3X4cDOY=;
 b=ZIJj5XC8Htb0dmIDk5barro0GGDzq40k+eDO8fxa0nBg3GqfRpEft6/hXGPGZa+c+I
 chDWYetC/JiVcUA9F1zP7OM9b4V9JmuQAdAl61IlrkML3BRNRK97n07vicXvzAC+sI64
 gia+vYJvX4jQyKhlE0ME+fvhq4hM4Gfb7Ht+Qj207R58YY/zR/hIFpma/LDw0UCduXae
 gR+X2xDELtlGoXXEu2q/z31M7hozj4RtOrE+Jg4DoHDmH2scg7KcPF19I6UAlzrTfh/5
 x6OlscS+1ARo7LDfkFqTbjhUw+nHx35Lq8KMTcMxvI1XECJlKA4mnzoFtU/DK9BoLu3L
 oxrw==
X-Gm-Message-State: AO0yUKVgzE5QyU3IXgIVyPjA+9hwrlJELrD+ZBF1fM1vF5e/RS4dKCgo
 r3r2qFQ62ZR/wlZwG6kiLeC2N04t1+BH0NJ9Wbc=
X-Google-Smtp-Source: AK7set89ra/5R4R/oI60VdbUqBieaTYgJlAfhwBmyQW49/EVwp/MXc2VHPlaPqjgMG5WMZbkrzJjCg==
X-Received: by 2002:a05:600c:1605:b0:3e2:1532:bb47 with SMTP id
 m5-20020a05600c160500b003e21532bb47mr9859983wmn.27.1676906174349; 
 Mon, 20 Feb 2023 07:16:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b003e204158ac7sm12113993wms.47.2023.02.20.07.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 07:16:13 -0800 (PST)
Message-ID: <d81fee02-9d2c-d62c-b9cb-5a0691c4e1f2@linaro.org>
Date: Mon, 20 Feb 2023 16:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 1/4] util/cacheflush: fix cache on windows-arm64
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-2-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20230220111215.27471-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

On 2/20/23 12:12, Pierrick Bouvier wrote:
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
> ---
>   util/cacheflush.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/util/cacheflush.c b/util/cacheflush.c
> index 2c2c73e085..06c2333a60 100644
> --- a/util/cacheflush.c
> +++ b/util/cacheflush.c
> @@ -121,8 +121,12 @@ static void sys_cache_info(int *isize, int *dsize)
>   static bool have_coherent_icache;
>   #endif
>   
> -#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
> -/* Apple does not expose CTR_EL0, so we must use system interfaces. */
> +#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
> +/*
> + * Apple does not expose CTR_EL0, so we must use system interfaces.
> + * Windows neither, but we use a generic implementation of flush_idcache_range
> + * in this case.
> + */
>   static uint64_t save_ctr_el0;
>   static void arch_cache_info(int *isize, int *dsize)
>   {
> @@ -225,7 +229,11 @@ static void __attribute__((constructor)) init_cache_info(void)
>   
>   /* Caches are coherent and do not require flushing; symbol inline. */
>   
> -#elif defined(__aarch64__)
> +#elif defined(__aarch64__) && !defined(CONFIG_WIN32)
> +/*
> + * For Windows, we use generic implementation of flush_idcache_range, that
> + * performs a call to FlushInstructionCache, through __builtin___clear_cache.
> + */
>   
>   #ifdef CONFIG_DARWIN
>   /* Apple does not expose CTR_EL0, so we must use system interfaces. */

