Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B16AE275
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:31:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYLU-0006n7-RU; Tue, 07 Mar 2023 09:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYLN-0006kE-Ts
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:31:10 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYLL-0007Q7-HC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:31:09 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MuVOM-1qPrkG2Ykc-00rUs9; Tue, 07 Mar 2023 15:30:58 +0100
Message-ID: <86533769-fecb-974e-765e-c1210cb36d4f@vivier.eu>
Date: Tue, 7 Mar 2023 15:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: fix bug about incorrect base addresss of gdt
 on i386 and x86_64
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
References: <4172b90.58b08.18631b77860.Coremail.fanwj@mail.ustc.edu.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <4172b90.58b08.18631b77860.Coremail.fanwj@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b0SEjvG4mwXsng/w2e8c88M/6IUydOXjjAX354ph6gqS+ZmfthV
 nP9ort3TIrhwc8CP1BbC94pNy6RLdzWVEkXYnyrJFGpd5CfCP7dQdLIG/yXE+rIdbNeYc1a
 brHu6DTtmrGGYFmjWYMpf4H1VB5Af3FWW0XHHyoOI6fNf33WQCcz2ayjmyugGSOGZ94vcN7
 h9oJFWgTBlZYmSSikxy1A==
UI-OutboundReport: notjunk:1;M01:P0:Im9n+1SIUps=;J6wRfcTErZP3qx/mFXJnL/jQ7EF
 jWmreDFsFWLaFNQhfUnoRwWEQrYg6QUdZgSX6lw2xpS+DoSxdJUyYMLWshCa3+EhW3vWdaNSR
 7WBvxCWg7R2Px65yaxaNrlZA9MgOxuPITAeJ8OW0uNrMWNvEIKqTqMBqUuZLfg9DrSxEux+U9
 2nDm5HkaexbG4EJAG10hSDxLOWVS9W81eXTJxJh1FgqHZgGFEF7xE4Yg92A/oLdM9dBZ32mz3
 714ADiS9d9HzqJXMAujsXRhJmEqwoWidaP95Kl12/tWE135DnX2BakhqoarLOyV7kHkqlFsYT
 9vPwNE3W8Jw1N129utG+NgU1WAkQx4yBrYU3Vd8q5Dqd+aVVhWjFgJ0zE0s++1fJBuDoT3/HR
 GxEaqkYe5WYPmpkWwFbzxImS2+ImS5n2ZBEKgdxKVJtq2dFiaZk6IY9etReXw655VXuIJD+ro
 vdgeYPGesbLK8WLQ/WRDXp4Ivf2BxPVQ/hZibCiWhtofQV/4yPwFvJg8T2hP0PawGuq8t0QFH
 pXRXSwEbgtrsDxO/jnGCxH8Dux+7fEBk6za4/t09QXvjiUkJFnd0D3bwnPopaw0ZOQo3HEjSQ
 zz7VdUmLr950KFRARSjRIiht3Y+Yz2udHjkoiYmqEw5K3mVY7eADu4sZLFbqaGM21ZhC+4Vz7
 ftueA6DsyHNS5GlvBi99eY5aRo48o8zycjg3eNZQLQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Richard,

do you think it's correct?

Thanks,
Laurent

Le 08/02/2023 à 16:49, fanwj@mail.ustc.edu.cn a écrit :
> On linux user mode, CPUX86State::gdt::base from Different CPUX86State Objects have same value, It is incorrect! Every CPUX86State::gdt::base Must points to independent memory space.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1405
> Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
> ---
>   linux-user/i386/cpu_loop.c | 9 +++++++++
>   linux-user/main.c          | 7 +++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index 865413c..48511cd 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -314,8 +314,17 @@ void cpu_loop(CPUX86State *env)
>       }
>   }
>   
> +static void target_cpu_free(void *obj)
> +{
> +    CPUArchState* env = ((CPUState*)obj)->env_ptr;
> +    target_munmap(env->gdt.base, sizeof(uint64_t) * TARGET_GDT_ENTRIES);
> +    g_free(obj);
> +}
> +
>   void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>   {
> +    CPUState* cpu = env_cpu(env);
> +    OBJECT(cpu)->free = target_cpu_free;
>       env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
>       env->hflags |= HF_PE_MASK | HF_CPL_MASK;
>       if (env->features[FEAT_1_EDX] & CPUID_SSE) {
> diff --git a/linux-user/main.c b/linux-user/main.c
> index a17fed0..3acd9b4 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -234,6 +234,13 @@ CPUArchState *cpu_copy(CPUArchState *env)
>   
>       new_cpu->tcg_cflags = cpu->tcg_cflags;
>       memcpy(new_env, env, sizeof(CPUArchState));
> +#if defined(TARGET_I386) || defined(TARGET_X86_64)
> +    new_env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
> +                                    PROT_READ|PROT_WRITE,
> +                                    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +    memcpy((void*)g2h_untagged(new_env->gdt.base), (void*)g2h_untagged(env->gdt.base), sizeof(uint64_t) * TARGET_GDT_ENTRIES);
> +    OBJECT(new_cpu)->free = OBJECT(cpu)->free;
> +#endif
>   
>       /* Clone all break/watchpoints.
>          Note: Once we support ptrace with hw-debug register access, make sure


