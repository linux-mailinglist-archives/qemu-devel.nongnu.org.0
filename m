Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6E48512D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:33:52 +0100 (CET)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53c7-0007sl-Pu
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53SP-0000FI-8f
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:23:49 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:49813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53SM-0007Sb-Qo
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:23:48 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MO9vD-1mku2c3XWj-00OZO1; Wed, 05 Jan 2022 11:23:40 +0100
Message-ID: <9f55e1fa-805d-783c-919a-a7091a5dab29@vivier.eu>
Date: Wed, 5 Jan 2022 11:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/7] linux-user/nios2: Properly emulate EXCP_TRAP
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RWw+N07lkQ0Fd/xvilGCbaaDkSV6DLAeAIimQvVPTBEedlAy+PB
 LzqE1KQcpPgoeIU2tnM6NINhXGwFUPJ5UGyXN5jaCpe7hvhnoD7mFDjfYo2M1lN4MyH959F
 UDeg0WnnpSKY2BIoYXYDJlwiPJgrUv+ycFcTDkICoq1Q4raVQoHnjRbjrxLmuz6dauPX6NQ
 kHLrahmhoPISuBMEKCl/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:urdvJjyJGcE=:YJufHWGkYQkadWpPczFfRS
 s+mozpe02ks7StANiefmeY7fI7r7kADTFg72NvTVy7YhgBYLXlpeeVhG0OhsVvdFQWncFxNOl
 uwHqvrdyWADOB5C/Odd8lUBJDmtMIC7/N77Ep6M3aHlIUK2IX2+jaMN9FM5zp/cg4ymTbEBEN
 ZdScon2kHDjKSQx8golIXcOeFMq9VO5k4fDg6V8XUIurUi65TI7PSqVZlIikah5Q+/A/LYfoI
 Yi3ylALfKpyPVg1ypdREF9Mh21rsuOuPmup0v7gBKKGh4kbAxS/JOgcxS1hukDdTG7EdUhyem
 Uu9u+zqYb7krNKChfHqEVAmSuXPHmktNHBnddHSm3cpu023iBThGie/jI7+kmc5q5BPP/v4x9
 JxEJ8jG0PpxwztxPOJIKeBuZ9Zxsk7x8NB8PlUlaByzwItJCYAi7PRHaVbi5OFSuLH0Np8OOP
 HLEY4s2gKJHzdJQOROtjGkYc9tW9sEY71eRqmrWMh+su2az27zHF1TZvfP9IeVyj75i6lxx4G
 BHxNuu/pes1AqIP9ck2j1BeiiYFyTAq4+kO/A0olwim1X8/OErDibH+Z4hFXFJx0zQ1ALA9O+
 eJEdCaM73Qi3EEV3TonsPwpHAyzLwJPNApp9ocr2WKOKbPuziewSaO1PRxn160OESSIP6v5x5
 h6CxU+mPbw9JmFnPiV1QX3JPKX0G2XovKcIxp5z5n+v8BU7aqn6xa+hwWm4POQHS/X1c=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> The real kernel has to load the instruction and extract
> the imm5 field; for qemu, modify the translator to do this.
> 
> The use of R_AT for this in cpu_loop was a bug.  Handle
> the other trap numbers as per the kernel's trap_table.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/cpu.h          |  2 +-
>   linux-user/nios2/cpu_loop.c | 40 ++++++++++++++++++++-----------------
>   target/nios2/translate.c    | 17 +++++++++++++++-
>   3 files changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 1a69ed7a49..d2ba0c5bbd 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -160,9 +160,9 @@ struct CPUNios2State {
>   
>   #if !defined(CONFIG_USER_ONLY)
>       Nios2MMU mmu;
> -
>       uint32_t irq_pending;
>   #endif
> +    int error_code;
>   };
>   
>   /**
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index 34290fb3b5..5c3d01d22d 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -26,7 +26,6 @@
>   void cpu_loop(CPUNios2State *env)
>   {
>       CPUState *cs = env_cpu(env);
> -    Nios2CPU *cpu = NIOS2_CPU(cs);
>       target_siginfo_t info;
>       int trapnr, ret;
>   
> @@ -39,9 +38,10 @@ void cpu_loop(CPUNios2State *env)
>           case EXCP_INTERRUPT:
>               /* just indicate that signals should be handled asap */
>               break;
> +
>           case EXCP_TRAP:
> -            if (env->regs[R_AT] == 0) {
> -                abi_long ret;
> +            switch (env->error_code) {
> +            case 0:
>                   qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
>   
>                   ret = do_syscall(env, env->regs[2],
> @@ -55,26 +55,30 @@ void cpu_loop(CPUNios2State *env)
>   
>                   env->regs[2] = abs(ret);
>                   /* Return value is 0..4096 */
> -                env->regs[7] = (ret > 0xfffffffffffff000ULL);
> -                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
> -                env->regs[CR_STATUS] &= ~0x3;
> -                env->regs[R_EA] = env->regs[R_PC] + 4;
> +                env->regs[7] = ret > 0xfffff000u;
>                   env->regs[R_PC] += 4;
>                   break;
> -            } else {
> -                qemu_log_mask(CPU_LOG_INT, "\nTrap\n");
>   
> -                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
> -                env->regs[CR_STATUS] &= ~0x3;
> -                env->regs[R_EA] = env->regs[R_PC] + 4;
> -                env->regs[R_PC] = cpu->exception_addr;
> -
> -                info.si_signo = TARGET_SIGTRAP;
> -                info.si_errno = 0;
> -                info.si_code = TARGET_TRAP_BRKPT;
> -                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            case 1:
> +                qemu_log_mask(CPU_LOG_INT, "\nTrap 1\n");
> +                force_sig_fault(TARGET_SIGUSR1, 0, env->regs[R_PC]);
> +                break;
> +            case 2:
> +                qemu_log_mask(CPU_LOG_INT, "\nTrap 2\n");
> +                force_sig_fault(TARGET_SIGUSR2, 0, env->regs[R_PC]);
> +                break;
> +            case 31:
> +                qemu_log_mask(CPU_LOG_INT, "\nTrap 31\n");
> +                force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
> +                break;
> +            default:
> +                qemu_log_mask(CPU_LOG_INT, "\nTrap %d\n", env->error_code);
> +                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
> +                                env->regs[R_PC]);
>                   break;
>               }
> +            break;
> +
>           case EXCP_DEBUG:
>               info.si_signo = TARGET_SIGTRAP;
>               info.si_errno = 0;
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 08d7ac5398..a759877519 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -636,6 +636,21 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
>       tcg_temp_free(t0);
>   }
>   
> +static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * The imm5 field is not stored anywhere on real hw; the kernel
> +     * has to load the insn and extract the field.  But we can make
> +     * things easier for cpu_loop if we pop this into env->error_code.
> +     */
> +    R_TYPE(instr, code);
> +    tcg_gen_st_i32(tcg_constant_i32(instr.imm5), cpu_env,
> +                   offsetof(CPUNios2State, error_code));
> +#endif
> +    t_gen_helper_raise_exception(dc, EXCP_TRAP);
> +}
> +
>   static const Nios2Instruction r_type_instructions[] = {
>       INSTRUCTION_ILLEGAL(),
>       INSTRUCTION(eret),                                /* eret */
> @@ -682,7 +697,7 @@ static const Nios2Instruction r_type_instructions[] = {
>       INSTRUCTION_ILLEGAL(),
>       INSTRUCTION_ILLEGAL(),
>       INSTRUCTION_ILLEGAL(),
> -    INSTRUCTION_FLG(gen_excp, EXCP_TRAP),             /* trap */
> +    INSTRUCTION(trap),                                /* trap */
>       INSTRUCTION(wrctl),                               /* wrctl */
>       INSTRUCTION_ILLEGAL(),
>       INSTRUCTION_FLG(gen_cmpxx, TCG_COND_LTU),         /* cmpltu */

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

