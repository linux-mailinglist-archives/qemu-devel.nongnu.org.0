Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5364E3DCC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:49:09 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWd0e-0005vX-A3
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:49:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWcxt-0004fj-J7; Tue, 22 Mar 2022 07:46:17 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWcxr-0002rU-Ft; Tue, 22 Mar 2022 07:46:16 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MspyA-1oLAHk1KUy-00tDIu; Tue, 22 Mar 2022 12:46:12 +0100
Message-ID: <cc944a5a-d7a9-8b56-a92b-c663f5bd59da@vivier.eu>
Date: Tue, 22 Mar 2022 12:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] linux-user/arm: Implement __kernel_memory_barrier
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220314044305.138794-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DlqovrN/PmhqbdZ1O/YH/RbXj4DmmqAxUyr7WcofXNxLirhW4Bo
 LtfgbMeMjV2zioO56ZwsNuon7G+msuKrxTeAQkN3PGhOLWAQptC4ya1ru2spHTfvjble6VP
 mmMi4ojbhywCJBOZOWcyCWiuUeN4aw431ZqXb8eA4rLl4pEepCe8+nTgt1lwxTJWkLXkQ4S
 bSlhwW7NgVH/xqzgu74QQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7bRP0u3xIVM=:6bvqehE75gU1eaWv7uXjAb
 /xXl5s686qdqxwRU+5BibySTMUn9RGH7aPKwIrK0/sryu1eEHi7qZZXkC6/TwjDdDxUFXOWgU
 i25f2aSOxrPFzAc1yzmSOgfsMuDxQZs28bhk3rCgU46X/XhbNHZlHODVh5VPteC2btNQVMj51
 kWGu27Gs3Vrh2qQVWzoaxR+MI1O0OfH8cpcW564Jvk0YT1FgW0k6Hf8hAJ/LhK90ghNifiIAr
 9OD1xeZpvJSkGwwl6L/oUnoAgih67eRNkr2slP6kiKu+xfp0Q0+HP5LE2kK78Q3QpdQnDVEmc
 3U7WeeNsUGWCQl56fAkiJc8gvDzXAi3qnDB5N/2obDw80HJls4qnVvZfH81WnINTEXOL6JfUx
 o/GMhLdYogjdUSUJ6an/zF39Jx8IHF26k9a1JmHXuePMlzzifuEunMZEE27e6qE17/DpvCIz4
 7yQOpHX0adN0SoeBgBvjaGKUWxRl8Etda2BGEJynNMIEgtVnPbGHbtRBDSsOEjZsInujyIOR9
 oFzuFxhystW2JwAlekZhPUPCz8FPBoHcNnnJ35H5BjyeDl5KYsxMc6Ak/BwHzQsDPjmun/Tzk
 b1GJsFz+j3jEbNhaj2hag8wZ1E/U8e91n0yGAAdNLWd+kh2VaXlrK5kxiRp+Lx949K90Xvnes
 3i2ODs47YwwZcSJXc9JOjm61RiAn2nxSFKW4RWqsQE1hnxIOW6AU6Qno03wHie6zNSzI=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/03/2022 à 05:43, Richard Henderson a écrit :
> This fallback syscall was stubbed out.
> It would only matter for emulating pre-armv6.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 032e1ffddf..a0e43b261c 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -158,7 +158,7 @@ do_kernel_trap(CPUARMState *env)
>   
>       switch (env->regs[15]) {
>       case 0xffff0fa0: /* __kernel_memory_barrier */
> -        /* ??? No-op. Will need to do better for SMP.  */
> +        smp_mb();
>           break;
>       case 0xffff0fc0: /* __kernel_cmpxchg */
>            /* XXX: This only works between threads, not between processes.


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

