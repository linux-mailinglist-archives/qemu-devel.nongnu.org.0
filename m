Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE56ADC00
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:32:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUcS-0006Pz-2W; Tue, 07 Mar 2023 05:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZUcP-0006LJ-2e
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:32:30 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZUcN-0004q7-1C
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:32:28 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJEMt-1psXjk1LOl-00Khsf; Tue, 07 Mar 2023 11:32:19 +0100
Message-ID: <30a2b08f-f9a9-e549-28c2-78ef32ce51f2@vivier.eu>
Date: Tue, 7 Mar 2023 11:32:18 +0100
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
X-Provags-ID: V03:K1:tXjU89LilqjN/RGxK0ffBH5keQ7NsqhvN35xWN+k/VpOkqdJgu3
 Na08f6bZOErkLlLRazZvVB6fhUI/BwW9TvDva/HBsc40XIO9V5f6tBrLg6GRqKna+a0iKKK
 d0lA6WDu8NOoAIVryT/xUrx6oIREuxByEwGmBANEfzukYPkDo8z+puX87P2T4xu/M1Dqlz/
 5fgC3A/F2I+K50sR4kX1g==
UI-OutboundReport: notjunk:1;M01:P0:ipuqlaLgh40=;Y2lC96wwVoFR/HdXXIGVxFU1IYH
 7mwUeGdIc2ZvaUblnYee2XCUUT3jkUahYIT82UDAIEW3MKpNDjOmLNq5QYajX0zoykvfEtyY/
 ZE9k+Bo0sJ5ca1XC3/9ky+oVvAOYjPuThgDD0LucBun+KM8+ow5lsXmiLBxy3B/guGzshCqeo
 JUBxGfKCXtft0IgDq1oWQY3oyEgqwq9dTuGBya7ARbdSY8lLIORNz2DIoShSUOJipDbdFtggW
 3T21J6RSBdZXoBFoxKOcHfgJ+x5zbtkApe8OPn8vWKS/OBZ/w0jjX1bsckYaOTKoUio+fWX+z
 DTDSiP6R9fNxNUeM8j5mbN9qMxed8/ZUCOm/Qmy9EPN3egvhW9wP6O8XkglW0jI+akuNxkAee
 Q68PA11zNhO9LYcn0j8n5tiQGva3gDS/8eDGt+qJ7cS6+uY5x7YMA80/CgU7dluim2iWeyv7i
 I/C111CJy8wVpW38Dy7LxrfL1jhSaEGTi0EUeyX1Z55y5u1HGfK/0id4SDbflwYPD0f2n8jL0
 1yChMgPv4/9cgLQr8COBYfJDulIg76UvuP1nGPtOpjz3Z4dD/MqLXc3cRX7sLsfc4h3hKxq+I
 p13znit4AJmH9sVjGKF7I7yxpuDZz+FP/ETlT4JyfUIegiLb0k6hz+9AstTdgjXAbhbTht6Le
 BGzC9xSPrFXuWa3ncIv7gyuAiZU+yKjLWyAWsQ/hTg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


