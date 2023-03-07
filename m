Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2806AF1C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcKE-0008CC-DY; Tue, 07 Mar 2023 13:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZcKB-0008BU-Rn
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:46:11 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZcK9-0001D7-UM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:46:11 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M9nhF-1pcejD31oD-005si7; Tue, 07 Mar 2023 19:45:58 +0100
Message-ID: <56f36a12-0672-e57f-6a6f-42e074d82611@vivier.eu>
Date: Tue, 7 Mar 2023 19:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: fix bug about incorrect base addresss of gdt
 on i386 and x86_64
Content-Language: fr
To: fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
References: <4172b90.58b08.18631b77860.Coremail.fanwj@mail.ustc.edu.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <4172b90.58b08.18631b77860.Coremail.fanwj@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n/q+H1HnhHC8ViVRMwMdwJQldYRNkABMBjVQpklF5QFDgnTvD3o
 Ba3AyRXcYCngCPD191cJmtq8nAi/zWoOcZ4Rfqh36FmkFoG4MHVDwR7RLFsA/aSAFpNZhXE
 qFkKm9koO3RL3xs2JAjF+9gG2FGiB4oCEnx02TMofAMuNXK9JhqWdS0/Zosr3uPT3r2RvfZ
 ro0cZ7GXOPEGb252W0fXg==
UI-OutboundReport: notjunk:1;M01:P0:6/Rwywv0IoI=;IZB6pD90sKmfL1MxwoNA2sO0UpZ
 RycfbbxAlqm6cDZD46+khBX2cqskdnfWNqNWHyCBhn0CevZVZ6XdB0XXRjBaHrGiOsqm7HbIc
 kCEUJcg2xh/kNc5ILfz5ZqJucHKcqIo4GaiHLFCLOPxq3Us+lGgpJNnvSzTKHuSQJ8LEJNCIJ
 ywwvqxzNqPAQC/9akKVqcznQ0y8NxieqUw8CdId9CiwdwMT6eWkcZ1mjnDOCtSAsuhwBpvZXO
 cdwZ14Q0jSZ4FCOgAR9RXw47hei14xQF9gJ3SBAxr4NkphOEyfCshlz5gKmIM+BueSceo7U5Q
 mLIjhycSNr/Rpu780ATyZMaf0HC6B99voOTRhrkobhioHo6Wv3fBLcf+eQfGgLbQ/N/Wf2BEE
 14UFiFlSNZfqnEdM3dWjya0Qb+8y3XOPfpQr60+uNfVSHO+2JQvt/VjOgSmd7hlvpjNY7x15c
 L/JacbKk+geB1WeRjctqOmeEESOMr+iOCZDIZUa3wRjonknHwJtar3zjHyvxX/MLzsWUJSBnX
 M6wkitZF7cbY8y2enkX1YN0Q9Ah7VZw3qObOHHaG7NntXvfWISBbHz33V9qHfe/WfMGQoDCIo
 74r1JwqRGdhwsJdqN8pl/fWiNsBs4pkPeATQBvLfVElPU0lR6G3vrWBp0ylLvnquttIYbSUwx
 YAPYrN7ypvgui9osRmPf0ggPH81Y4GmQSTngZN/2KQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


