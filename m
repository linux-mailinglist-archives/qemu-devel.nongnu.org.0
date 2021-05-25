Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C205390A6B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:22:54 +0200 (CEST)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldZl-0001MN-8c
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lldYC-0000cz-BV
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:21:16 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:50143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lldYA-0002g0-Hx
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:21:16 -0400
Received: from [192.168.100.1] ([82.142.6.50]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjgfT-1l1sjN1ZPP-00lEyT; Tue, 25 May 2021 22:21:10 +0200
Subject: Re: [PATCH 5/5] linux-user: Implement pivot_root
To: YAMAMOTO Takashi <yamamoto@midokura.com>, qemu-devel@nongnu.org
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <20210524045412.15152-6-yamamoto@midokura.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7e603e70-00f6-2a73-48cc-ea70212a531f@vivier.eu>
Date: Tue, 25 May 2021 22:21:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210524045412.15152-6-yamamoto@midokura.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EUtG1ZN1xPHoRPzz+BVrAamVXvScsYjKBQQ18pJa8EnrDpHTVHG
 LzT4jIeiu1cSqhwWBKGuUm+HNkpShAMP1BNvcHsfVFoS4FPPCPBEqXKvtPYPIWbYuZgsgJn
 cyN9+9VyW6rl1VP9E81U5n1dmUMgOwZpuWMz8LmEqcBYS8fU314zlv1g4kd4fMeijyO47t3
 KJt7NZ7ALDb87kPihS6lQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9dmgn7w0avE=:fJeWU0iPUWR6jNnALdJqys
 pJwNZ2A9ydxlK+wX24WCGp045sOJq9+Rf3nwa9jUIubg31Amg9v8jcwkogrhiN0K3YMQDXVwZ
 FSSSthGkILl+kqp8eYI1mpG5EvSMKQXEq2suWnOpeR4/9SmswIJofj29iOcAMmh+5mJkCiFlQ
 KHh3lo1vr0bzrjOojrXbMiKjMo8KB11RtaiQ+Sjm7kf24JVfvCGKqgvfMusSPfDlxJf1XqEPl
 Fs1XX376RLfyM58EQz0xX5dJAkfudIdwm0NT7rso0doyy4763y9jLGKmNi571boRO3nUTQM7P
 b8mNMowApvnCTLi1X9we1Y7xJz2L12bT0RE/BMo0wQr+2iKLB2gSCk/xKtT/tokRLbZs0O969
 DtL8NW7+Yv3Wz/5AH+0JeltrfZRlrusJ2lquUkEhyB4L0FMsxanxMT4SHr+d34MN7QQCzI2VU
 mxgP7Ya2J1ODZTDEykuclyPBA7XpAn/U8icuoxoQlqjdq0uVVopuMX6W40WrGBpwbMF47jZAR
 UqSl4gOiP5wCsS62te8aac=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/05/2021 à 06:54, YAMAMOTO Takashi a écrit :
> Used by runc.
> 
> Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> ---
>  linux-user/syscall.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2947e79dc0..e739921e86 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -35,6 +35,7 @@
>  #include <sys/prctl.h>
>  #include <sys/resource.h>
>  #include <sys/swap.h>
> +#include <sys/syscall.h>

we don't need that include, see below

>  #include <linux/capability.h>
>  #include <sched.h>
>  #include <sys/timex.h>
> @@ -8254,6 +8255,11 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
>      return 0;
>  }
>  
> +static int pivot_root(const char *new_root, const char *put_old)
> +{
> +    return syscall(SYS_pivot_root, new_root, put_old);
> +}

Better to use:

#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
_syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
#endif

> +
>  /* This is an internal helper for do_syscall so that it is easier
>   * to have a single return point, so that actions, such as logging
>   * of syscall results, can be performed.
> @@ -13222,6 +13228,23 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return ret;
>  #endif
>  
> +#if defined(TARGET_NR_pivot_root)
> +    case TARGET_NR_pivot_root:
> +        {
> +            void *p2;
> +            p = lock_user_string(arg1); /* new_root */
> +            p2 = lock_user_string(arg2); /* put_old */
> +            if (!p || !p2) {
> +                ret = -TARGET_EFAULT;
> +            } else {
> +                ret = get_errno(pivot_root(p, p2));
> +            }
> +            unlock_user(p2, arg2, 0);
> +            unlock_user(p, arg1, 0);
> +        }
> +        return ret;
> +#endif
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>          return -TARGET_ENOSYS;
> 

Thanks,
Laurent

