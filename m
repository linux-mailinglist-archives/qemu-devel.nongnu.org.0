Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29F6AD085
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:34:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZITR-00077D-JS; Mon, 06 Mar 2023 16:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZITL-0006vc-UP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:34:19 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZITK-0001Vw-7A
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:34:19 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4hex-1qXcX63hQ7-011fRP; Mon, 06 Mar 2023 22:34:12 +0100
Message-ID: <e78f9e07-96a8-d9ab-c2ad-dd1129101936@vivier.eu>
Date: Mon, 6 Mar 2023 22:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] linux-user: Fix unaligned memory access in
 prlimit64 syscall
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>
References: <20230224003907.263914-1-iii@linux.ibm.com>
 <20230224003907.263914-2-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230224003907.263914-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wPI6wSA0TWLlsThZXYnJq7h3kUo4AeXSvWsz70AKREzrScp3Nxn
 R+VEU0sl3YHOSDsWvnld6Go8ug70ACYyGhoZDKNsVTKhDoY3ZnmWXzNXvrAnsxZQ9HZiaEA
 ptMEhvS5heGBrNr7Aw5fZ/9G0DHhppDGa/3b87/t2TvqkQLnRJm+7MUEzFwVHfNAGFOo/Cr
 okRfq9vJ02kscfL5WUCNg==
UI-OutboundReport: notjunk:1;M01:P0:eJZwDLnwWaE=;AG0c4NifUdbk3lvpsP1UXX9efhO
 iOerWL1+2A7hso4ZAmrZCH47URarvbuCApQ+uL25YnCoTgIMz3+pDOKNPTYqm75b90Px03Ys4
 pSKAKU75Z1Kpmck4U13JwjBoshh7Lv53T/Wy3XLiviM3UdPw1LbaPF+jD37xudbLEeDUtQ+R/
 lIy6/Di1zNsuZM0as77KscnwYqyDobTfN1UmFwL46UVUzB8Sphitux2bbAQQiqVTDU1zVOrUv
 R7I8dQBvDlG/Angvp00CNE6l3+Eavm0Zu6XKJT+MDMKbM+5k7lCcpAU1Hr3n3hl8TK7ZiSu2n
 SBmhfnZFkC+IT/UOYUmi+1Ucagp3Mg95m+1NEPLE800qKYr3oantTl7ssjO3kGKePHunerU0c
 2mvty/sqzk3NLwolldJFJQ0Lyp8yt9b7YRGXscxme2aKlw+BdulKcz114Hzn/QpjfoOmf1wG6
 txk1/DFRdU+8uyBaFzVIwE+BME8eqWZK6ys8WfYEHfQ/eG7K2zuO4m8JVbUAXaMxCvjsr48Kf
 D8Mij4n7gekL1Ewj1e2O8WJSeqTr6kRn5Bkf+IQ7KVKGoNy9TZtqGjFMZoAeBCBUdHgGeWHdn
 t7GNbqHGVd2f+7wnRAg6z/vY7UhelTussvJ521MvKNSUPnY376wU9A+F3juBo8DzGcrNK3GBj
 WjCO+KFj8ZhtrwQ3QpAB7VwjlyxAKH1I/A05th7Pog==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 24/02/2023 à 01:39, Ilya Leoshkevich a écrit :
> target_rlimit64 contains uint64_t fields, so it's 8-byte aligned on
> some hosts, while some guests may align their respective type on a
> 4-byte boundary. This may lead to an unaligned access, which is an UB.
> 
> Fix by defining the fields as abi_ullong. This makes the host alignment
> match that of the guest, and lets the compiler know that it should emit
> code that can deal with the guest alignment.
> 
> While at it, also use __get_user() and __put_user() instead of
> tswap64().
> 
> Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/generic/target_resource.h | 4 ++--
>   linux-user/syscall.c                 | 8 ++++----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
> index 539d8c46772..37d3eb09b3b 100644
> --- a/linux-user/generic/target_resource.h
> +++ b/linux-user/generic/target_resource.h
> @@ -12,8 +12,8 @@ struct target_rlimit {
>   };
>   
>   struct target_rlimit64 {
> -    uint64_t rlim_cur;
> -    uint64_t rlim_max;
> +    abi_ullong rlim_cur;
> +    abi_ullong rlim_max;
>   };
>   
>   #define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a6c426d73cf..73082531ffc 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -12886,8 +12886,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               if (!lock_user_struct(VERIFY_READ, target_rnew, arg3, 1)) {
>                   return -TARGET_EFAULT;
>               }
> -            rnew.rlim_cur = tswap64(target_rnew->rlim_cur);
> -            rnew.rlim_max = tswap64(target_rnew->rlim_max);
> +            __get_user(rnew.rlim_cur, &target_rnew->rlim_cur);
> +            __get_user(rnew.rlim_max, &target_rnew->rlim_max);
>               unlock_user_struct(target_rnew, arg3, 0);
>               rnewp = &rnew;
>           }
> @@ -12897,8 +12897,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               if (!lock_user_struct(VERIFY_WRITE, target_rold, arg4, 1)) {
>                   return -TARGET_EFAULT;
>               }
> -            target_rold->rlim_cur = tswap64(rold.rlim_cur);
> -            target_rold->rlim_max = tswap64(rold.rlim_max);
> +            __put_user(rold.rlim_cur, &target_rold->rlim_cur);
> +            __put_user(rold.rlim_max, &target_rold->rlim_max);
>               unlock_user_struct(target_rold, arg4, 1);
>           }
>           return ret;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

