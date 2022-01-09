Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EE48887C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:33:52 +0100 (CET)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6UaF-0004qM-R4
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTc-0004dP-1n
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:00 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55714
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTZ-0006Kc-NK
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:59 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B5C4862E74;
 Sun,  9 Jan 2022 17:26:43 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720403; bh=pY7pJefvtVlTPU4hMXSEf8sneZVsr93QVUBrRydcuQE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=sbxWYxhWytUN9tsj+etjyWZNlN/0QS39bHlTgSDbiRzs2Iw7XAxTDF/9VlTolXmft
 NO4gATDIWowZpg/M7lqWSjvt+9Z4F0ppmNvzY1sEkmFHeG14BabTjsV8cJ0NQvIXUq
 KFPcJWxlUx26XiPRGyEqBTCpkhQ/lmQlmA7+1oIw=
Message-ID: <d1d84204-10b8-519d-d835-00759230f6cc@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 22/26] linux-user: Add LoongArch cpu_loop support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-23-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-23-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:41, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   configure                           |  3 +
>   linux-user/loongarch64/cpu_loop.c   | 94 +++++++++++++++++++++++++++++
>   linux-user/loongarch64/target_cpu.h | 34 +++++++++++
>   3 files changed, 131 insertions(+)
>   create mode 100644 linux-user/loongarch64/cpu_loop.c
>   create mode 100644 linux-user/loongarch64/target_cpu.h
>
> diff --git a/configure b/configure
> index 030728d11e..93c4e5bd92 100755
> --- a/configure
> +++ b/configure
> @@ -659,6 +659,9 @@ case "$cpu" in
>     mips*)
>       cpu="mips" ;;
>   
> +  loongarch)
> +    cpu="loongarch64" ;;
> +
Do you really need this? Looking at the part above setting initial value 
for $cpu, you can only get here if $cpu is given on command-line, or 
returned by uname on a presumably LoongArch system not defining 
__loongarch64. Either would be unlikely though, and we really don't want 
to turn on 64-bit code for 32-bit hosts (that don't exist at the 
moment), so this case seems useless.
>     ppc)
>       CPU_CFLAGS="-m32" ;;
>     ppc64)
> diff --git a/linux-user/loongarch64/cpu_loop.c b/linux-user/loongarch64/cpu_loop.c
> new file mode 100644
> index 0000000000..6628d215ca
> --- /dev/null
> +++ b/linux-user/loongarch64/cpu_loop.c
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch user cpu_loop.
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu.h"
> +#include "qemu-common.h"
> +#include "user-internals.h"
> +#include "cpu_loop-common.h"
> +#include "signal-common.h"
> +
> +void cpu_loop(CPULoongArchState *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +    int trapnr, si_code;
> +    abi_long ret;
> +
> +    for (;;) {
> +        cpu_exec_start(cs);
> +        trapnr = cpu_exec(cs);
> +        cpu_exec_end(cs);
> +        process_queued_cpu_work(cs);
> +
> +        switch (trapnr) {
> +        case EXCP_INTERRUPT:
> +            /* just indicate that signals should be handled asap */
> +            break;
> +        case EXCP_SYSCALL:
> +            env->pc += 4;
> +            ret = do_syscall(env, env->gpr[11],
> +                             env->gpr[4], env->gpr[5],
> +                             env->gpr[6], env->gpr[7],
> +                             env->gpr[8], env->gpr[9],
> +                             -1, -1);
> +            if (ret == -QEMU_ERESTARTSYS) {
> +                env->pc -= 4;
> +                break;
> +            }
> +            if (ret == -QEMU_ESIGRETURN) {
> +                /*
> +                 * Returning from a successful sigreturn syscall.
> +                 * Avoid clobbering register state.
> +                 */
> +                break;
> +            }
> +            env->gpr[4] = ret;
> +            break;
> +        case EXCP_INE:
> +            force_sig_fault(TARGET_SIGILL, 0, env->pc);
> +            break;
> +        case EXCP_FPE:
> +            si_code = TARGET_FPE_FLTUNK;
> +            if (GET_FP_CAUSE(env->fcsr0) & FP_INVALID) {
> +                si_code = TARGET_FPE_FLTINV;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_DIV0) {
> +                si_code = TARGET_FPE_FLTDIV;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_OVERFLOW) {
> +                si_code = TARGET_FPE_FLTOVF;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_UNDERFLOW) {
> +                si_code = TARGET_FPE_FLTUND;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_INEXACT) {
> +                si_code = TARGET_FPE_FLTRES;
> +            }
> +            force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
> +            break;
> +        case EXCP_DEBUG:
> +        case EXCP_BREAK:
> +            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
> +            break;
> +        case EXCP_ATOMIC:
> +            cpu_exec_step_atomic(cs);
> +            break;
> +        default:
> +            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n",
> +                      trapnr);
> +            exit(EXIT_FAILURE);
> +        }
> +        process_pending_signals(env);
> +    }
> +}
> +
> +void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
> +{
> +    int i;
> +
> +    for (i = 0; i < 32; i++) {
> +        env->gpr[i] = regs->regs[i];
> +    }
> +    env->pc = regs->csr.era;
> +
> +}
> diff --git a/linux-user/loongarch64/target_cpu.h b/linux-user/loongarch64/target_cpu.h
> new file mode 100644
> index 0000000000..a29af66156
> --- /dev/null
> +++ b/linux-user/loongarch64/target_cpu.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch specific CPU ABI and functions for linux-user
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef LOONGARCH_TARGET_CPU_H
> +#define LOONGARCH_TARGET_CPU_H
> +
> +static inline void cpu_clone_regs_child(CPULoongArchState *env,
> +                                        target_ulong newsp, unsigned flags)
> +{
> +    if (newsp) {
> +        env->gpr[3] = newsp;
> +    }
> +    env->gpr[4] = 0;
> +}
> +
> +static inline void cpu_clone_regs_parent(CPULoongArchState *env,
> +                                         unsigned flags)
> +{
> +}
> +
> +static inline void cpu_set_tls(CPULoongArchState *env, target_ulong newtls)
> +{
> +    env->gpr[2] = newtls;
> +}
> +
> +static inline abi_ulong get_sp_from_cpustate(CPULoongArchState *state)
> +{
> +    return state->gpr[3];
> +}
> +#endif

