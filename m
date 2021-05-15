Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1A5381AD3
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:45:16 +0200 (CEST)
Received: from localhost ([::1]:54828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0Dr-00058Y-Ri
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li0Ao-0000Bl-GG
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:42:06 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1li0Al-0000gC-Cs
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:42:06 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0WwO-1lW7f22T5w-00wRDb; Sat, 15 May 2021 21:42:00 +0200
Subject: Re: [PATCH] linux-user: Add strace support for printing arguments of
 llseek
To: Kito Cheng <kito.cheng@sifive.com>, qemu-devel@nongnu.org,
 kito.cheng@gmail.com
References: <20210512101358.122781-1-kito.cheng@sifive.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ac991409-e950-18fc-62cb-2e4e47151f9d@vivier.eu>
Date: Sat, 15 May 2021 21:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512101358.122781-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qvUARMKdPieViHcUurhItjT4Oybn8nXKxAJwDw6V0fdjz79rJU/
 yhf/JhjT8/qbA7WZ7qUN1+qHr/ZZWC9KwaOO3K2o6p3XJHncOBHQuDtnl7ijKTo4V2PfR70
 7A7htpF1H/KlLPU3HguXV6EWp8Rap4clZe1Yvp1QKF9uDPK/O92IczH3tOyb8W7vMSm0LCG
 CHhfEYDnHOiU3N2UX1VYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LNUPb7xV+Is=:VfoQjLUuX5eX/7P5/OZLhx
 sxsNpiik6TCQAsoJR+IU1KH31MP85BnNmqBSOdQb2uE2WVt3JyBkQmP/PXum3H2FO1IVg81nu
 R0d5aSMFNXFUBZilGN+iN0U1VvYB4HyLOZoZDGbprXuDPJ52P9F3z8HJ/8pb7sk8Z0udPLB7b
 2tlHxVrHm2TOrarICju610uzzE60TsBCfuz0pe14elshWWfCTbGvr+UkvUhBcV8UynQfoxtiR
 WS1oEfapc2/U00vNXd54CHhAf0UKNn8WB4Ey5u3x4ENbC0gR7+PfUGjdGQ2uMYGyQvfPxhhxQ
 J9xLzbGWfZTDAB8ZrufQOvs5YX8BuWWA9t1e9893NDbNe5iwkdWyArsaSSNOZ+B3StEfuibdK
 12E4be64N9blejeEw6jY87gT1b8A9NQxmY55n0J+0WXPANCJcrUbSwPHRVj7sE16nV10n5igp
 PxZmwmD+scAPtoeiuTzGvi2R0pwNDW3xEp32DK6ruEx79tr91bxlAlj6qXdTet9KxubDUWpcY
 HVufi5aauvfuLTItZci4lo=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 12/05/2021 à 12:13, Kito Cheng a écrit :
> Some target are using llseek instead of _llseek like riscv,
> nios2, hexagon, and openrisc.
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  linux-user/strace.c    | 3 ++-
>  linux-user/strace.list | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index e969121b6c..4ebf85b063 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -2335,7 +2335,7 @@ print_linkat(void *cpu_env, const struct syscallname *name,
>  }
>  #endif
>  
> -#ifdef TARGET_NR__llseek
> +#if defined(TARGET_NR__llseek) || defined(TARGET_NR_llseek)
>  static void
>  print__llseek(void *cpu_env, const struct syscallname *name,
>                abi_long arg0, abi_long arg1, abi_long arg2,
> @@ -2355,6 +2355,7 @@ print__llseek(void *cpu_env, const struct syscallname *name,
>      qemu_log("%s", whence);
>      print_syscall_epilogue(name);
>  }
> +#define print_llseek print__llseek
>  #endif
>  
>  #ifdef TARGET_NR_lseek
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 084048ab96..46e1410836 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -511,6 +511,9 @@
>  #ifdef TARGET_NR__llseek
>  { TARGET_NR__llseek, "_llseek" , NULL, print__llseek, NULL },
>  #endif
> +#ifdef TARGET_NR_llseek
> +{ TARGET_NR_llseek, "llseek" , NULL, print_llseek, NULL },
> +#endif
>  #ifdef TARGET_NR_lock
>  { TARGET_NR_lock, "lock" , NULL, NULL, NULL },
>  #endif
> 


Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

