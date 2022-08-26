Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA685A2B55
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:33:52 +0200 (CEST)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbLD-00086K-SL
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRb5w-0005BJ-SW
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:18:04 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRb5u-0006Fg-RY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:18:04 -0400
Received: by mail-pl1-x62c.google.com with SMTP id f12so1668528plb.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=pdvIuMXt7t3YVoINfj3/IU3XYpJXiEjWBSQZ/s795Ts=;
 b=WK4hqSI9VAsPxMlpu98392P1azzDVd3p+gsYUxR9RqNVFDSHcgLtPfCIkwZnWeirAL
 MpEgjOZvEvPeS1dNsmNO+f7UgmF4H8ELxh+5kLs5+FRtWsDnx97N9PzGD33p/Ou+amKM
 /T8YVglsV7t38Et4gBFHArypIa9p7ibTLT7ZQS4Eu+8kahl6nOQk9QBBN7QJs9+kbMnV
 9cVa8gUeR1qvBwA6OgpzdchCRroEve8nbUp6HSpLb7X2OT2cYDm9ood159g5CF8t70pq
 TnT+h25w0gQUop4BWt/jlFrPPDyzp29yNom4rg4eZU1cFrljI84Ue9EquTplpS6PCqsm
 ZrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=pdvIuMXt7t3YVoINfj3/IU3XYpJXiEjWBSQZ/s795Ts=;
 b=f8+5vo+3P9nizJC7/wGd7ZBJgZ8RrP8W5T5MtXm2hdFaqsbNEuys4/8gBmnzVYQM9Q
 S5U6oX9vaVb7lEFthSF9R0i5R313gXk6loVxbDMUPDE6XyC+MF9RSmwF3e8SqHCQFrEI
 DHTCQicy5R/qIxwu4wrg3LmwCaJpOjpxiqwQGC6eB9bCxWx7iPDc8+cOd+FD1cuPmk/v
 T/5lCQQ4dZihePqBFPtpC7qh0ZIgINKQPeJx2vgvzOgDoQaQfDi0VTM9p88FhvJgL7Ta
 Z4jle1q5U0BvZ0X5XI4hKZoWtIUchfLYpM3/yaKWER9iGqJm8r5t/D1UQr924JHjZPAQ
 Z9Og==
X-Gm-Message-State: ACgBeo2zyaR8TH09MiUy+77oT74YRqCy28XxwaB0Mn5lKMKErl1LzyQF
 pI2ORt35xN4KwdgVW2hoFuxfjTd62LloAg==
X-Google-Smtp-Source: AA6agR7tPZ8nMXsCbiO01R+qiSvHbWnLnZBIcR1b1Ik55xq9vnK3lmAGQKiAld7F/PySBEXTHziRog==
X-Received: by 2002:a17:90a:744c:b0:1fa:c029:7a24 with SMTP id
 o12-20020a17090a744c00b001fac0297a24mr4773856pjk.54.1661527081326; 
 Fri, 26 Aug 2022 08:18:01 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a634c08000000b0041c0c9c0072sm1526984pga.64.2022.08.26.08.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 08:18:00 -0700 (PDT)
Message-ID: <186a174e-e37e-c5b1-b02a-efe31efdba79@linaro.org>
Date: Fri, 26 Aug 2022 08:17:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/13] linux-user: Add faccessat2() syscall
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20220826141853.419564-1-deller@gmx.de>
 <20220826141853.419564-4-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826141853.419564-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/22 07:18, Helge Deller wrote:
> Add implementation and strace output for faccessat2().
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c    |  2 +-
>   linux-user/strace.list |  3 +++
>   linux-user/syscall.c   | 12 ++++++++++++
>   3 files changed, 16 insertions(+), 1 deletion(-)

I've done this one, and cleaned up the code a bit too:

https://lore.kernel.org/qemu-devel/20220729201414.29869-1-richard.henderson@linaro.org/


r~

> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 27309f1106..e8c63aa4c2 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1962,7 +1962,7 @@ print_execv(CPUArchState *cpu_env, const struct syscallname *name,
>   }
>   #endif
> 
> -#ifdef TARGET_NR_faccessat
> +#if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
>   static void
>   print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
>                   abi_long arg0, abi_long arg1, abi_long arg2,
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index a78cdf3cdf..6e88da7fad 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -177,6 +177,9 @@
>   #ifdef TARGET_NR_faccessat
>   { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL },
>   #endif
> +#ifdef TARGET_NR_faccessat2
> +{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
> +#endif
>   #ifdef TARGET_NR_fadvise64
>   { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f409121202..f51c4fbabd 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -399,6 +399,9 @@ _syscall3(int, ioprio_set, int, which, int, who, int, ioprio)
>   #if defined(TARGET_NR_getrandom) && defined(__NR_getrandom)
>   _syscall3(int, getrandom, void *, buf, size_t, buflen, unsigned int, flags)
>   #endif
> +#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
> +_syscall4(int, faccessat2, int, dirfd, char *, pathname, int, mode, int, flags)
> +#endif
> 
>   #if defined(TARGET_NR_kcmp) && defined(__NR_kcmp)
>   _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
> @@ -9098,6 +9101,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           unlock_user(p, arg2, 0);
>           return ret;
>   #endif
> +#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
> +    case TARGET_NR_faccessat2:
> +        if (!(p = lock_user_string(arg2))) {
> +            return -TARGET_EFAULT;
> +        }
> +        ret = get_errno(faccessat2(arg1, p, arg3, arg4));
> +        unlock_user(p, arg2, 0);
> +        return ret;
> +#endif
>   #ifdef TARGET_NR_nice /* not on alpha */
>       case TARGET_NR_nice:
>           return get_errno(nice(arg1));
> --
> 2.37.1
> 


