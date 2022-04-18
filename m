Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE774505EE2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 22:24:08 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngXup-0003sw-I0
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 16:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ngXtk-0002tl-N6
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 16:23:00 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:51059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ngXtg-0005Aj-Uq
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 16:22:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 91755F7E725C;
 Mon, 18 Apr 2022 22:22:44 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 18 Apr
 2022 22:22:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a65ebdc5-707e-496e-b076-8a7242cf3715,
 3C3EC69A9BBCF5E3F551F02F0EFEFD6AB1600A8C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
Date: Mon, 18 Apr 2022 22:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>, 
 <qemu-ppc@nongnu.org>
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3b29eea5-e264-4c51-8dd7-67efcd39046b
X-Ovh-Tracer-Id: 14452614156605033394
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtuddgudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekfeeiudekhfeujeetffevtdfhhfekheehhfdtjeekfeehieefjedvgfffgfeifeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Nicholas Piggin <npiggin@gmail.com>, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 21:10, Leandro Lupori wrote:
> Add semihosting support for PPC64. This implementation is
> based on the standard for ARM semihosting version 2.0, as
> implemented by QEMU and documented in
> 
>      https://github.com/ARM-software/abi-aa/releases
> 
> The PPC64 specific differences are the following:
> 
> Semihosting Trap Instruction: sc 7
> Operation Number Register: r3
> Parameter Register: r4
> Return Register: r3
> Data block field size: 64 bits

'sc' is a good way to implement semi hosting but we should make sure
that it is not colliding with future extensions, at least with the
next POWERPC processor. Is that the case ? if not, then the lev could
be reserved.

I think the part adding POWERPC_EXCP_SEMIHOST should be proposed in a
separate patch.

> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   configs/devices/ppc64-softmmu/default.mak |  3 +++
>   qemu-options.hx                           | 18 ++++++++-----
>   semihosting/arm-compat-semi.c             | 33 +++++++++++++++++++++++
>   target/ppc/cpu.h                          |  3 ++-
>   target/ppc/excp_helper.c                  |  9 +++++++
>   target/ppc/translate.c                    | 14 ++++++++++
>   6 files changed, 72 insertions(+), 8 deletions(-)
> 
> diff --git a/configs/devices/ppc64-softmmu/default.mak b/configs/devices/ppc64-softmmu/default.mak
> index b90e5bf455..43b618fa32 100644
> --- a/configs/devices/ppc64-softmmu/default.mak
> +++ b/configs/devices/ppc64-softmmu/default.mak
> @@ -8,3 +8,6 @@ CONFIG_POWERNV=y
>   
>   # For pSeries
>   CONFIG_PSERIES=y
> +
> +CONFIG_SEMIHOSTING=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 34e9b32a5c..6e76f7de96 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4527,11 +4527,12 @@ SRST
>   ERST
>   DEF("semihosting", 0, QEMU_OPTION_semihosting,
>       "-semihosting    semihosting mode\n",
> -    QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
> -    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
> +    QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_MIPS |
> +    QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV | QEMU_ARCH_PPC)
>   SRST
>   ``-semihosting``
> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
> +    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V and
> +    PPC only).
>   
>       Note that this allows guest direct access to the host filesystem, so
>       should only be used with a trusted guest OS.
> @@ -4542,12 +4543,12 @@ ERST
>   DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
>       "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
>       "                semihosting configuration\n",
> -QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
> -QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
> +QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_MIPS |
> +QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV | QEMU_ARCH_PPC)
>   SRST
>   ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
> -    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
> -    only).
> +    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II,
> +    RISC-V, PPC only).
>   
>       Note that this allows guest direct access to the host filesystem, so
>       should only be used with a trusted guest OS.
> @@ -4563,6 +4564,9 @@ SRST
>   
>       On RISC-V this implements the standard semihosting API, version 0.2.
>   
> +    On PPC this implements the standard Arm semihosting API, version 2.0,
> +    with only the trap instruction and register definitions changed.
> +
>       ``target=native|gdb|auto``
>           Defines where the semihosting calls will be addressed, to QEMU
>           (``native``) or to GDB (``gdb``). The default is ``auto``, which
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 7a51fd0737..e1279c316c 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -268,6 +268,31 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
>   
>   #endif
>   
> +#ifdef TARGET_PPC64

This PPC ifdef in an ARM file seems wrong.

The rest looks OK.

Thanks,

C.


> +static inline target_ulong
> +common_semi_arg(CPUState *cs, int argno)
> +{
> +    PowerPCCPU *cpu = POWERPC_CPU(cs);
> +    CPUPPCState *env = &cpu->env;
> +    return env->gpr[3 + argno];
> +}
> +
> +static inline void
> +common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    PowerPCCPU *cpu = POWERPC_CPU(cs);
> +    CPUPPCState *env = &cpu->env;
> +    env->gpr[3] = ret;
> +}
> +
> +static inline bool
> +common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
> +}
> +
> +#endif
> +
>   /*
>    * Allocate a new guest file descriptor and return it; if we
>    * couldn't allocate a new fd then return -1.
> @@ -450,6 +475,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
>   
>       sp = env->gpr[xSP];
>   #endif
> +#ifdef TARGET_PPC64
> +    PowerPCCPU *cpu = POWERPC_CPU(cs);
> +    CPUPPCState *env = &cpu->env;
> +
> +    sp = env->gpr[1];
> +#endif
>   
>       return sp - 64;
>   }
> @@ -780,6 +811,8 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
>       return is_a64(env);
>   #elif defined(TARGET_RISCV)
>       return riscv_cpu_mxl(env) != MXL_RV32;
> +#elif defined(TARGET_PPC64)
> +    return true;
>   #else
>   #error un-handled architecture
>   #endif
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 047b24ba50..349104ad79 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -129,8 +129,9 @@ enum {
>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
>       POWERPC_EXCP_PERFM_EBB = 103,    /* Performance Monitor EBB Exception    */
>       POWERPC_EXCP_EXTERNAL_EBB = 104, /* External EBB Exception               */
> +    POWERPC_EXCP_SEMIHOST = 105,     /* Semihosting Exception                */
>       /* EOL                                                                   */
> -    POWERPC_EXCP_NB       = 105,
> +    POWERPC_EXCP_NB       = 106,
>       /* QEMU exceptions: special cases we want to stop translation            */
>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>   };
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index d3e2cfcd71..af34a57082 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -25,6 +25,7 @@
>   #include "helper_regs.h"
>   
>   #include "trace.h"
> +#include "semihosting/common-semi.h"
>   
>   #ifdef CONFIG_TCG
>   #include "exec/helper-proto.h"
> @@ -100,6 +101,7 @@ static const char *powerpc_excp_name(int excp)
>       case POWERPC_EXCP_SDOOR_HV: return "SDOOR_HV";
>       case POWERPC_EXCP_HVIRT:    return "HVIRT";
>       case POWERPC_EXCP_SYSCALL_VECTORED: return "SYSCALL_VECTORED";
> +    case POWERPC_EXCP_SEMIHOST: return "SEMIHOST";
>       default:
>           g_assert_not_reached();
>       }
> @@ -1327,6 +1329,13 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>       target_ulong msr, new_msr, vector;
>       int srr0, srr1, lev = -1;
>   
> +    /* Handle semihost exceptions first */
> +    if (excp == POWERPC_EXCP_SEMIHOST) {
> +        env->gpr[3] = do_common_semihosting(cs);
> +        env->nip += 4;
> +        return;
> +    }
> +
>       /* new srr1 value excluding must-be-zero bits */
>       msr = env->msr & ~0x783f0000ULL;
>   
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 408ae26173..c013889a84 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4520,6 +4520,20 @@ static void gen_sc(DisasContext *ctx)
>       uint32_t lev;
>   
>       lev = (ctx->opcode >> 5) & 0x7F;
> +
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +    /*
> +     * PowerPC semihosting uses the following
> +     * instruction to flag a semihosting call:
> +     *
> +     *      sc 7            0x440000e2
> +     */
> +    if (lev == 7) {
> +        gen_exception(ctx, POWERPC_EXCP_SEMIHOST);
> +        return;
> +    }
> +#endif
> +
>       gen_exception_err(ctx, POWERPC_SYSCALL, lev);
>   }
>   


