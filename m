Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF6410DB6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 01:03:16 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS5q7-0007Pg-TK
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 19:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5ol-0006fv-Uv
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 19:01:51 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:46762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5oi-0000iu-0P
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 19:01:51 -0400
Received: by mail-io1-xd2b.google.com with SMTP id d18so7342060iof.13
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 16:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMJfBcnxy7YuBsi872b1ZIVvUYz3aMtxr/EuFa0JM8s=;
 b=FME1k8ujs0bxAA0pubuZvcU5f65BHBySCff+NCO+6/eZG1q29t+Rkw+8Lvhqm/S6HU
 fnvdCACLTIhOr5KeWf7xoeTgo9iv1ZCZkRoPuWTmLFq+9qt2rsO6BGDA9shdBbXmnWzA
 9LfW0eloCRsdRrR27TTeFdPMsZzoZTmJA/B9TlRXTKE4BTPDAfxyarKiFjkoX2S+Z7lv
 20HYEOoPQl3njGu/czN6hQdB6tiD/FwHHJrYclIxMYyVP+MxiE5kXGJgFsJCZ8NSeZdf
 T21d6S3HdwVacsecxopessRFWx2hT17XINKaMuQN4Ks47rwl1LUM8BxdDARXUapZ8Lbu
 +aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMJfBcnxy7YuBsi872b1ZIVvUYz3aMtxr/EuFa0JM8s=;
 b=UkyLPcdyQNbCT1h+zhwIboQR5Gp3K/k38/VQzWHpe/q1If+aZ6d5qW98/vOP6qf19R
 SNHZE1v5AWsUdXmrx0Bap+M4+XEgekcQPsAGUzzHM0Lm4L2iZC0SHHBJ1KMPNzzMKqUj
 BLhQl1SpRGiORNxpCXX2LE70pQXfdqdqXrnke92rR++FUOA2+iAF3rHUiDUA9yxbBoE7
 1r9QDitPLM+a9dW7AhwdjxcWl4sYVBCMe2j23cf3L4xsoYJWeFMB+mrJILSXHhDrZzqB
 3rRPcCwuU3DN2Xh8JWNMmMPvMWjNi52gfsqp5c7ztiAnJfhEEQOSQqDE1U79PK+JmIqt
 EKAA==
X-Gm-Message-State: AOAM533w9XkOruL+jP3jEho37vUG5eMmyStKvPn+L8rOcTzsAr/3LYNR
 R5UOpIxQNr8FulZNjyFnU7/sCqlyczakwpNLMPJJiL9I0QM=
X-Google-Smtp-Source: ABdhPJxKXsw84dx9QYu/fKqbI7//J0kXV/ksa/QifitoGYMr+l2MWFLa2xeyDYv6JatoS0pLuBaxM21F/X+RjnokKx0=
X-Received: by 2002:a6b:5913:: with SMTP id n19mr6887294iob.91.1632092506934; 
 Sun, 19 Sep 2021 16:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-7-richard.henderson@linaro.org>
In-Reply-To: <20210918184527.408540-7-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Sep 2021 09:01:21 +1000
Message-ID: <CAKmqyKMa9BTVdrVvDUO59zLdK9RbGKUW3d2haNsO00apH3eCsQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/41] linux-user: Reorg handling for SIGSEGV
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 19, 2021 at 4:55 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add stub host-signal.h for all linux-user hosts.
> Add new code replacing cpu_signal_handler.
> Full migration will happen one host at a time.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/host/aarch64/host-signal.h |   1 +
>  linux-user/host/arm/host-signal.h     |   1 +
>  linux-user/host/i386/host-signal.h    |   1 +
>  linux-user/host/mips/host-signal.h    |   1 +
>  linux-user/host/ppc/host-signal.h     |   1 +
>  linux-user/host/ppc64/host-signal.h   |   1 +
>  linux-user/host/riscv/host-signal.h   |   1 +
>  linux-user/host/s390/host-signal.h    |   1 +
>  linux-user/host/s390x/host-signal.h   |   1 +
>  linux-user/host/sparc/host-signal.h   |   1 +
>  linux-user/host/sparc64/host-signal.h |   1 +
>  linux-user/host/x32/host-signal.h     |   1 +
>  linux-user/host/x86_64/host-signal.h  |   1 +
>  linux-user/signal.c                   | 109 ++++++++++++++++++++++----
>  14 files changed, 106 insertions(+), 16 deletions(-)
>  create mode 100644 linux-user/host/aarch64/host-signal.h
>  create mode 100644 linux-user/host/arm/host-signal.h
>  create mode 100644 linux-user/host/i386/host-signal.h
>  create mode 100644 linux-user/host/mips/host-signal.h
>  create mode 100644 linux-user/host/ppc/host-signal.h
>  create mode 100644 linux-user/host/ppc64/host-signal.h
>  create mode 100644 linux-user/host/riscv/host-signal.h
>  create mode 100644 linux-user/host/s390/host-signal.h
>  create mode 100644 linux-user/host/s390x/host-signal.h
>  create mode 100644 linux-user/host/sparc/host-signal.h
>  create mode 100644 linux-user/host/sparc64/host-signal.h
>  create mode 100644 linux-user/host/x32/host-signal.h
>  create mode 100644 linux-user/host/x86_64/host-signal.h
>
> diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/aarch64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/arm/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/i386/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/mips/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/ppc/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/ppc64/host-signal.h b/linux-user/host/ppc64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/ppc64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/riscv/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/s390/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/s390x/host-signal.h b/linux-user/host/s390x/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/s390x/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/sparc/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/sparc64/host-signal.h b/linux-user/host/sparc64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/sparc64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/x32/host-signal.h b/linux-user/host/x32/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/x32/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/host-signal.h
> new file mode 100644
> index 0000000000..f4b4d65031
> --- /dev/null
> +++ b/linux-user/host/x86_64/host-signal.h
> @@ -0,0 +1 @@
> +#define HOST_SIGNAL_PLACEHOLDER
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 5ea8e4584a..6f953f10d4 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -18,12 +18,15 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qemu/bitops.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +
>  #include <sys/ucontext.h>
>  #include <sys/resource.h>
>
>  #include "qemu.h"
>  #include "trace.h"
>  #include "signal-common.h"
> +#include "host-signal.h"
>
>  static struct target_sigaction sigact_table[TARGET_NSIG];
>
> @@ -761,41 +764,115 @@ static inline void rewind_if_in_safe_syscall(void *puc)
>  }
>  #endif
>
> -static void host_signal_handler(int host_signum, siginfo_t *info,
> -                                void *puc)
> +static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>  {
>      CPUArchState *env = thread_cpu->env_ptr;
>      CPUState *cpu = env_cpu(env);
>      TaskState *ts = cpu->opaque;
> -
> -    int sig;
>      target_siginfo_t tinfo;
>      ucontext_t *uc = puc;
>      struct emulated_sigtable *k;
> +    int guest_sig;
>
> +#ifdef HOST_SIGNAL_PLACEHOLDER
>      /* the CPU emulator uses some host signals to detect exceptions,
>         we forward to it some signals */
> -    if ((host_signum == SIGSEGV || host_signum == SIGBUS)
> +    if ((host_sig == SIGSEGV || host_sig == SIGBUS)
>          && info->si_code > 0) {
> -        if (cpu_signal_handler(host_signum, info, puc))
> +        if (cpu_signal_handler(host_sig, info, puc))
>              return;
>      }
> +#else
> +    uintptr_t pc = 0;
> +    bool sync_sig = false;
> +
> +    /*
> +     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
> +     * handling wrt signal blocking and unwinding.
> +     */
> +    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code > 0) {
> +        MMUAccessType access_type;
> +        uintptr_t host_addr;
> +        abi_ptr guest_addr;
> +        bool is_write;
> +
> +        host_addr = (uintptr_t)info->si_addr;
> +
> +        /*
> +         * Convert forcefully to guest address space: addresses outside
> +         * reserved_va are still valid to report via SEGV_MAPERR.
> +         */
> +        guest_addr = h2g_nocheck(host_addr);
> +
> +        pc = host_signal_pc(uc);
> +        is_write = host_signal_write(info, uc);
> +        access_type = adjust_signal_pc(&pc, is_write);
> +
> +        if (host_sig == SIGSEGV) {
> +            const struct TCGCPUOps *tcg_ops;
> +
> +            if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
> +                /* If this was a write to a TB protected page, restart. */
> +                if (is_write &&
> +                    handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask,
> +                                                pc, guest_addr)) {
> +                    return;
> +                }
> +
> +                /*
> +                 * With reserved_va, the whole address space is PROT_NONE,
> +                 * which means that we may get ACCERR when we want MAPERR.
> +                 */
> +                if (page_get_flags(guest_addr) & PAGE_VALID) {
> +                    /* maperr = false; */
> +                } else {
> +                    info->si_code = SEGV_MAPERR;
> +                }
> +            }
> +
> +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +
> +            tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
> +            tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
> +                              MMU_USER_IDX, false, pc);
> +            g_assert_not_reached();
> +        } else {
> +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +        }
> +
> +        sync_sig = true;
> +    }
> +#endif
>
>      /* get target signal number */
> -    sig = host_to_target_signal(host_signum);
> -    if (sig < 1 || sig > TARGET_NSIG)
> +    guest_sig = host_to_target_signal(host_sig);
> +    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
>          return;
> -    trace_user_host_signal(env, host_signum, sig);
> +    }
> +    trace_user_host_signal(env, host_sig, guest_sig);
> +
> +    host_to_target_siginfo_noswap(&tinfo, info);
> +    k = &ts->sigtab[guest_sig - 1];
> +    k->info = tinfo;
> +    k->pending = guest_sig;
> +    ts->signal_pending = 1;
> +
> +#ifndef HOST_SIGNAL_PLACEHOLDER
> +    /*
> +     * For synchronous signals, unwind the cpu state to the faulting
> +     * insn and then exit back to the main loop so that the signal
> +     * is delivered immediately.
> +     */
> +    if (sync_sig) {
> +        cpu->exception_index = EXCP_INTERRUPT;
> +        cpu_loop_exit_restore(cpu, pc);
> +    }
> +#endif
>
>      rewind_if_in_safe_syscall(puc);
>
> -    host_to_target_siginfo_noswap(&tinfo, info);
> -    k = &ts->sigtab[sig - 1];
> -    k->info = tinfo;
> -    k->pending = sig;
> -    ts->signal_pending = 1;
> -
> -    /* Block host signals until target signal handler entered. We
> +    /*
> +     * Block host signals until target signal handler entered. We
>       * can't block SIGSEGV or SIGBUS while we're executing guest
>       * code in case the guest code provokes one in the window between
>       * now and it getting out to the main loop. Signals will be
> --
> 2.25.1
>
>

