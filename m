Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539895E85CB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:22:35 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obr46-0001Bg-Fg
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqaV-0000U8-99
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:51:59 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:38355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqaN-0007EY-4g
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:51:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MOzjW-1oucxE0Ebk-00PQxN; Fri, 23 Sep 2022 23:51:40 +0200
Message-ID: <e6d46424-04f8-1553-8092-47ad8e70222a@vivier.eu>
Date: Fri, 23 Sep 2022 23:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 3/5] linux-user: Implement stracing madvise()
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220906000839.1672934-1-iii@linux.ibm.com>
 <20220906000839.1672934-4-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220906000839.1672934-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oirRfGmscjKAlHlhe4ug0HDKFmYVW5SOEyXjT2tfTzjYd7nvoDE
 v41H7NpxoW3oQaFWJp2fNyrcNLCeuJuKhziccfQWT4bCcQoaEvSaFTNbF54PNdIx8wRJO21
 d42CQIVhDtkSWFGzRH4fKeaACl/T3sVAZRNJNyfphRBM4q1c1tNp7D5ngZKcpeyM9GM8dYb
 U3HGoGwllOLy/6QgT0TGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FHp9JoZnU+Y=:wA2Jcgxya++9MOG/WYusKL
 C+Rb1TQt69xTtxw96YenRaMpFK9wM9L14mGnEPIvl1776I3m18E7q8OhfyF9XXx1w4Hvc7ta2
 bEuzdY/a5zYMeBdjGwrMF5QNVRPQPpA/TSZuNPk1SMERxLTJ+WLzrI0FhqNnqo6XsEUiOlm4X
 Ku5yNyfzz+KWM5QQ071ipSfKF6YeZPcB6CRUZi8yamBRsHEUt06x2vqXKxYw5Bu0C1b7tvbBW
 iwGu5VKfJWMDz4lQQtrOtJrNJUMKrgdLx0m50wspS0uN7AMJ6+K7shezNlGKtf3jnNKDAE3JS
 PXkx6luoj/cqpWoSAhnf+6dJxrkWIH610Z0S6RAVprbagUFHbxxtv7+TXmdxIbSNqRtVaUE/x
 MXAVaAXbf3YxRP7LMMeQ5rqUrTH8MO8zXeGgoDeUx1jjbodfx+p5XecCNFw1JiHaZtgO+ag0p
 0leij3HeNskq7mrIAqrkTN2z9N+aW280Dku+L0pZnYbmVWmW9LNx7QaBSbfh1VTN/F2y0uEae
 jlK0dNt2hWMYc6hrT2WOyPkL5UNFDH/GLXKDf/82lwgoe4ZTvDy/DE0/2i+mFAOEZXkoBuDRY
 ezymqSLBcS7QP2GhkJJJlzX2cW0ADmGwqUFBw1rsfBIxfQ8+RVlafj/fy5du2VgdlhRtkLQQD
 4b9mbKIVbDop9eLL6Lbro92H73Yi1NM6xybYYYmqOr0h9c7zEWSWUle6Pe0y9NabDEEocHGAQ
 Z9Ba7YbVYgEW7UcmUiJPUZqCBEebZN+VUZkfZ9l8x4lJe4thy7yR8LndvC0kY+HC/r+W53sAX
 mWwBcrc
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 06/09/2022 à 02:08, Ilya Leoshkevich a écrit :
> The default implementation has several problems: the first argument is
> not displayed as a pointer, making it harder to grep; the third
> argument is not symbolized; and there are several extra unused
> arguments.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/strace.c    | 41 +++++++++++++++++++++++++++++++++++++++++
>   linux-user/strace.list |  2 +-
>   2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 7d882526da..c262c0c9b6 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -17,6 +17,7 @@
>   #include "qemu.h"
>   #include "user-internals.h"
>   #include "strace.h"
> +#include "target_mman.h"
>   
>   struct syscallname {
>       int nr;
> @@ -2969,6 +2970,46 @@ print_stat(CPUArchState *cpu_env, const struct syscallname *name,
>   #define print_lstat64   print_stat
>   #endif
>   
> +#if defined(TARGET_NR_madvise)
> +static struct enums madvise_advice[] = {
> +    ENUM_TARGET(MADV_NORMAL),
> +    ENUM_TARGET(MADV_RANDOM),
> +    ENUM_TARGET(MADV_SEQUENTIAL),
> +    ENUM_TARGET(MADV_WILLNEED),
> +    ENUM_TARGET(MADV_DONTNEED),
> +    ENUM_TARGET(MADV_FREE),
> +    ENUM_TARGET(MADV_REMOVE),
> +    ENUM_TARGET(MADV_DONTFORK),
> +    ENUM_TARGET(MADV_DOFORK),
> +    ENUM_TARGET(MADV_MERGEABLE),
> +    ENUM_TARGET(MADV_UNMERGEABLE),
> +    ENUM_TARGET(MADV_HUGEPAGE),
> +    ENUM_TARGET(MADV_NOHUGEPAGE),
> +    ENUM_TARGET(MADV_DONTDUMP),
> +    ENUM_TARGET(MADV_DODUMP),
> +    ENUM_TARGET(MADV_WIPEONFORK),
> +    ENUM_TARGET(MADV_KEEPONFORK),
> +    ENUM_TARGET(MADV_COLD),
> +    ENUM_TARGET(MADV_PAGEOUT),
> +    ENUM_TARGET(MADV_POPULATE_READ),
> +    ENUM_TARGET(MADV_POPULATE_WRITE),
> +    ENUM_TARGET(MADV_DONTNEED_LOCKED),
> +    ENUM_END,
> +};
> +
> +static void
> +print_madvise(CPUArchState *cpu_env, const struct syscallname *name,
> +              abi_long arg0, abi_long arg1, abi_long arg2,
> +              abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    print_syscall_prologue(name);
> +    print_pointer(arg0, 0);
> +    print_raw_param("%d", arg1, 0);
> +    print_enums(madvise_advice, arg2, 1);
> +    print_syscall_epilogue(name);
> +}
> +#endif
> +
>   #if defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64)
>   static void
>   print_fstat(CPUArchState *cpu_env, const struct syscallname *name,
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 72e17b1acf..c93effdbc8 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -541,7 +541,7 @@
>   { TARGET_NR_lstat64, "lstat64" , NULL, print_lstat64, NULL },
>   #endif
>   #ifdef TARGET_NR_madvise
> -{ TARGET_NR_madvise, "madvise" , NULL, NULL, NULL },
> +{ TARGET_NR_madvise, "madvise" , NULL, print_madvise, NULL },
>   #endif
>   #ifdef TARGET_NR_madvise1
>   { TARGET_NR_madvise1, "madvise1" , NULL, NULL, NULL },
Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


