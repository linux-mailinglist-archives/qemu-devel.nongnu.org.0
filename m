Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC614419570
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:52:54 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUr3t-0001WR-QY
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqbx-0005Sm-PP
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:24:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqbv-0006Dn-Lc
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:24:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id s21so11914583wra.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRHC57HmmT81uRLXNxx+ZiZHtYgUTzD9dmM8AaavJ04=;
 b=j9FmfBS+/x1u/Z447FtUd2Nt4vrxjpomEZBx3K7Ej4BRr3SSJsNBLpr0dpDHsUFCb6
 4VHsSSWEu9rTYJeFAivjBui4pBgoCQxy7UeXzT2hrDTaib2D8rtnvSqVWUZz3FIJqjCl
 kA06RJo5u0FDR+qxU2T+/nK6ZyLJUWbyUCHUrVPhPyeML77yvLYg8qeqxtUWPihjd4Kb
 6FslMvgADZE3V+13ChgPXPaaOLWEzqVXrew0suIsZ2GGsFIsDMZfH7VfPKOmk21mUbDX
 vxQ8dbQlwXZcKW4SmEeeEmE3dTCWmookJNyTyfjbD1pTwesoDPqIXj+OjaChKr2pUyAb
 iNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRHC57HmmT81uRLXNxx+ZiZHtYgUTzD9dmM8AaavJ04=;
 b=Zm88KyQEMJA45sfuLZowAoc1upsO3pZWY5AtbOfi6uSqcEGAnbScSsqenKyGgVBhHH
 5+FNiVK2M2wrE/U9B9oaiEhtUkAQliz3K6E0TuqptrweZqRuvDgYt7/t+aBlZqXUlW+x
 PeAvJmN6h4F5XExFcSpNDygyfMHRqJ3DlJPNFuUlJ6pA9fbeCIVFZT/2ZN22UDF3j2Cz
 76gmvyXsFDNLSoiHFu6fYTJOlur2jpFEAKfxJoEf7OhnXo7N8dpqvSnpa/Rf70cBNmEE
 PGk/15Kubdd7qo0EvM6TRrtn3bW4Y+KVYlHjk3Xh0Hj7V78g2rXOEH/J9QNOyImpv4h1
 VYog==
X-Gm-Message-State: AOAM531n7OGE3ZJRFPirtLxIIiUNpZFnMj/7uwguu+yFg476lYJTnWP7
 aLCn55LH67H7pBRtmBOcbIe+gyebwWE1+0PLv4ixDg==
X-Google-Smtp-Source: ABdhPJzHGG4E26MmXZLQFhLIPiF11GsPqQ/BtKk//Dxy7TQSiKJ+AAXWW3W3WFy11B757LkbxS0lM4/lQwnyXJRznOg=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr27374070wrw.376.1632749038188; 
 Mon, 27 Sep 2021 06:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-17-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 14:23:05 +0100
Message-ID: <CAFEAcA_=DA267T6BAz+yxbtCjVEUkZ-YpjQCbnXCt0UntD4EYQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/27] linux-user/nios2: Properly emulate EXCP_TRAP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The real kernel has to load the instruction and extract
> the imm5 field; for qemu, modify the translator to do this.
>
> The use of R_AT for this in cpu_loop was a bug.  Handle
> the other trap numbers as per the kernel's trap_table.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h          |  5 +++--
>  linux-user/nios2/cpu_loop.c | 35 ++++++++++++++++++-----------------
>  target/nios2/translate.c    | 17 ++++++++++++++++-
>  3 files changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 2ab82fdc71..395e4d3281 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -158,9 +158,10 @@ struct Nios2CPUClass {
>  struct CPUNios2State {
>      uint32_t regs[NUM_CORE_REGS];
>
> -#if !defined(CONFIG_USER_ONLY)
> +#ifdef CONFIG_USER_ONLY
> +    int trap_code;
> +#else
>      Nios2MMU mmu;
> -
>      uint32_t irq_pending;
>  #endif
>  };

Loading the insn and fishing out the imm5 field is about 2
lines of code, isn't it ? It's how we handle similar cases
for other targets. I think I prefer that over putting
linux-user specific fields and handling into the target/nios2
code.

> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index 34290fb3b5..246293a501 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -39,9 +39,10 @@ void cpu_loop(CPUNios2State *env)
>          case EXCP_INTERRUPT:
>              /* just indicate that signals should be handled asap */
>              break;
> +
>          case EXCP_TRAP:
> -            if (env->regs[R_AT] == 0) {
> -                abi_long ret;
> +            switch (env->trap_code) {
> +            case 0:
>                  qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
>
>                  ret = do_syscall(env, env->regs[2],
> @@ -55,26 +56,26 @@ void cpu_loop(CPUNios2State *env)
>
>                  env->regs[2] = abs(ret);
>                  /* Return value is 0..4096 */
> -                env->regs[7] = (ret > 0xfffffffffffff000ULL);
> -                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
> -                env->regs[CR_STATUS] &= ~0x3;
> -                env->regs[R_EA] = env->regs[R_PC] + 4;
> +                env->regs[7] = ret > 0xfffff000u;
>                  env->regs[R_PC] += 4;
>                  break;
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
> +            default:
> +                qemu_log_mask(CPU_LOG_INT, "\nTrap %d\n", env->trap_code);
> +                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
> +                                env->regs[R_PC]);
>                  break;
>              }

The kernel also defines:
 * trap 31 ("breakpoint"), which should wind PC back by 4 and
   send a SIGTRAP/TRAP_BRKPT
 * trap 30 ("KGDB breakpoint"), which we should treat the same
   as the "default" case since we should be acting like "kernel
   with CONFIG_KGDB not defined"

Side note: the kernel code for the "CONFIG_KGDB not defined" case
of trap 30 seems buggy to me. It points the trap at 'instruction_trap',
but that is the "emulate multiply and divide insns" entry point, and
that emulation code assumes that it really is getting a mul or div,
not a trap, so I think it will do something bogus. This seems to
be an error introduced in kernel commit  baa54ab93c2e1, which refactored
trap handling and changed the reserved-trap-number handling from
"instruction_trap" to "handle_trap_reserved" but forgot this one entry.

> +            break;
> +
>          case EXCP_DEBUG:
>              info.si_signo = TARGET_SIGTRAP;
>              info.si_errno = 0;

thanks
-- PMM

