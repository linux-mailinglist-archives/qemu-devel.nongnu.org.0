Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152C48E96D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:48:32 +0100 (CET)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8L4I-0000yM-V3
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:48:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Kwv-00032o-00
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:40:53 -0500
Received: from [2a00:1450:4864:20::32c] (port=35739
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Kws-00018c-UB
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:40:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso6543683wmj.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3/ehzhyBrwNnweZuoZd3ivYavkHvsr8HCs8yzgvUlQ=;
 b=gA64zjQHZwrMQ9+q2N+rQxi7qfFzG1fg17zJ6+Q2RYcoKzrX2luM90Wyz8nPtLA6f4
 5kPer6ybCfnABIgiHFR6K8QC3PSrHcvn8EZdmHEpZfw3qAfvla5axyjUAusVkePTGqfi
 Ra5gmyE5xgYrsdEeeFFGSNX1LZ5M7V+S0zsFJM/rFfEgOwCmsN6cG1OjpoF3gtzYaeD8
 /w0kjW8xGX7mGh+lr9cLI4iFMgEeQVZrTUnazqb3wGMpynFgOB2UD/x2vpT6UvH7zhB2
 ANoN+DgN2cpPlwoWBCJsighpV97+TXZ4EJruzALecCahM+o2IBiKGojbxDJIz3rT+VXV
 Pirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3/ehzhyBrwNnweZuoZd3ivYavkHvsr8HCs8yzgvUlQ=;
 b=njDpJPP392HYzUei7dYHGW4AlYMZc426NONuU6EVzYCEfzzW1yVKog7x27RJJ+EPw6
 8cuHVji6ZA8AXYf2jC1c5q6eJyq07Ko2ZrHq9V6iMw0RP1A2BfyBX0piUSr1V8hV4DDQ
 PW+w9PUsU0pj3RbcdX8oyodx9U7kJ3jftSly7Cwu9DghKRt31ea/GSC0P8VG8rl5GwST
 el7N5eE58gX0UcFlnxiFsblEeRNyAwNk+CDQzlY4XVIZ9njTJVe0fHtR+W6hnDUJop5v
 oauyux0XJYmatHal8vDMHeYBKzRbEk2gfmfO6xnBf/kcIkFYl2Wkp168zKTvlUJ1uH23
 IoAQ==
X-Gm-Message-State: AOAM5305oOT9I/QpQA7QqRQvxS1N+4zC7sKVD8SNkEmuF0KBclcs1Z7R
 wRu1MX09sSl9MJiaM4u4AAABNfF6r2W7C6yGkyjdog==
X-Google-Smtp-Source: ABdhPJxOfmV9khk809yA2Uvt5oAmhQthWoKjYnTilog+k3FjoL2Sq+dZtLNEkRp8gI6GtO5Xv8iHkFq3nJuOtmJhp8w=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr8004977wms.32.1642160448833; 
 Fri, 14 Jan 2022 03:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-25-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-25-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 11:40:37 +0000
Message-ID: <CAFEAcA95+ufTnr1PQRHTFttai=9LVv4dXznPTAobSUAueg_QSA@mail.gmail.com>
Subject: Re: [PATCH 24/30] bsd-user/signal.c: setup_frame
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:36, Warner Losh <imp@bsdimp.com> wrote:
>
> setup_frame sets up a signalled stack frame. Associated routines to
> extract the pointer to the stack frame and to support alternate stacks.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/signal.c | 166 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 144 insertions(+), 22 deletions(-)
>
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 8dadc9a39a7..8e1427553da 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -30,11 +30,27 @@
>   * fork.
>   */
>
> +static target_stack_t target_sigaltstack_used = {
> +    .ss_sp = 0,
> +    .ss_size = 0,
> +    .ss_flags = TARGET_SS_DISABLE,
> +};

sigaltstacks are per-thread, so this needs to be in the TaskState,
not global. (We fixed this in linux-user in commit 5bfce0b74fbd5d5
in 2019: the change is relatively small.)

> +
>  static struct target_sigaction sigact_table[TARGET_NSIG];
>  static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
>  static void target_to_host_sigset_internal(sigset_t *d,
>          const target_sigset_t *s);
>
> +static inline int on_sig_stack(unsigned long sp)
> +{
> +    return sp - target_sigaltstack_used.ss_sp < target_sigaltstack_used.ss_size;
> +}
> +
> +static inline int sas_ss_flags(unsigned long sp)
> +{
> +    return target_sigaltstack_used.ss_size == 0 ? SS_DISABLE : on_sig_stack(sp)
> +        ? SS_ONSTACK : 0;
> +}
>
>  int host_to_target_signal(int sig)
>  {
> @@ -336,28 +352,6 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
>      return;
>  }
>
> -static int fatal_signal(int sig)
> -{
> -
> -    switch (sig) {
> -    case TARGET_SIGCHLD:
> -    case TARGET_SIGURG:
> -    case TARGET_SIGWINCH:
> -    case TARGET_SIGINFO:
> -        /* Ignored by default. */
> -        return 0;
> -    case TARGET_SIGCONT:
> -    case TARGET_SIGSTOP:
> -    case TARGET_SIGTSTP:
> -    case TARGET_SIGTTIN:
> -    case TARGET_SIGTTOU:
> -        /* Job control signals.  */
> -        return 0;
> -    default:
> -        return 1;
> -    }
> -}

There wasn't any need to move this function, I think ?

> -
>  /*
>   * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
>   * 'force' part is handled in process_pending_signals().
> @@ -484,6 +478,134 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>      cpu_exit(thread_cpu);
>  }
>
> +static int fatal_signal(int sig)
> +{
> +
> +    switch (sig) {
> +    case TARGET_SIGCHLD:
> +    case TARGET_SIGURG:
> +    case TARGET_SIGWINCH:
> +    case TARGET_SIGINFO:
> +        /* Ignored by default. */
> +        return 0;
> +    case TARGET_SIGCONT:
> +    case TARGET_SIGSTOP:
> +    case TARGET_SIGTSTP:
> +    case TARGET_SIGTTIN:
> +    case TARGET_SIGTTOU:
> +        /* Job control signals.  */
> +        return 0;
> +    default:
> +        return 1;
> +    }
> +}
> +
> +static inline abi_ulong get_sigframe(struct target_sigaction *ka,
> +        CPUArchState *regs, size_t frame_size)
> +{
> +    abi_ulong sp;
> +
> +    /* Use default user stack */
> +    sp = get_sp_from_cpustate(regs);
> +
> +    if ((ka->sa_flags & TARGET_SA_ONSTACK) && (sas_ss_flags(sp) == 0)) {
> +        sp = target_sigaltstack_used.ss_sp +
> +            target_sigaltstack_used.ss_size;
> +    }
> +
> +#if defined(TARGET_MIPS) || defined(TARGET_ARM)
> +    return (sp - frame_size) & ~7;
> +#elif defined(TARGET_AARCH64)
> +    return (sp - frame_size) & ~15;
> +#else
> +    return sp - frame_size;
> +#endif

We don't need to do it in this patchseries, but you should strongly
consider pulling the architecture-specifics out in a way that
avoids this kind of ifdef ladder.

> +}
> +
> +/* compare to mips/mips/pm_machdep.c and sparc64/sparc64/machdep.c sendsig() */
> +static void setup_frame(int sig, int code, struct target_sigaction *ka,
> +    target_sigset_t *set, target_siginfo_t *tinfo, CPUArchState *regs)
> +{
> +    struct target_sigframe *frame;
> +    abi_ulong frame_addr;
> +    int i;
> +
> +    frame_addr = get_sigframe(ka, regs, sizeof(*frame));
> +    trace_user_setup_frame(regs, frame_addr);
> +    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> +        goto give_sigsegv;

FreeBSD for Arm (haven't checked other BSDs or other archs)
gives a SIGILL for the "can't write signal frame to stack"
case, I think:
https://github.com/freebsd/freebsd-src/blob/main/sys/arm/arm/exec_machdep.c#L316
I don't understand why they picked SIGILL, SIGSEGV seems much more
logical to me, but we should follow the kernel behaviour.

> +    }
> +
> +    memset(frame, 0, sizeof(*frame));
> +#if defined(TARGET_MIPS)
> +    int mflags = on_sig_stack(frame_addr) ? TARGET_MC_ADD_MAGIC :
> +        TARGET_MC_SET_ONSTACK | TARGET_MC_ADD_MAGIC;
> +#else
> +    int mflags = 0;
> +#endif
> +    if (get_mcontext(regs, &frame->sf_uc.uc_mcontext, mflags)) {
> +        goto give_sigsegv;

The FreeBSD kernel get_mcontext() can't fail -- why can ours ?
(This matters because SIGSEGV may not be the right response to
whatever the failure case is.)

> +    }
> +
> +    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
> +        if (__put_user(set->__bits[i], &frame->sf_uc.uc_sigmask.__bits[i])) {
> +            goto give_sigsegv;

__get_user() and __put_user() in QEMU can't fail, so you don't
need to check for errors here, unlike the non-double-underscore
versions. At some point you might want to take the current linux-user
versions of these user-access functions/macros: it looks like bsd-user
has an older version which doesn't handle the case where the guest
has looser alignment restrictions than the host. The new ones
actually expand to do { ... } while(0) statements which won't
be valid inside an if() condition.

(Historical note: the reason QEMU's __put_user/__get_user ever had
return values at all is that the linux-user code was copy-and-pasted
from the Linux kernel. In the Linux kernel handling of writing
data to userspace is/was error-checked on every write, whereas
QEMU does the "is this writable" test once with the lock_user
function and then can assume all the writes to that area succeed.
But we still started with a lot of copy-pasted code that was doing
unnecessary checks on __put_user and __get_user return values.
FreeBSD seems to handle write-checking in yet a third way, by
assembling the struct in kernel-space and checking for writability
once at the end when it copies the whole block out to userspace.)

> +        }
> +    }
> +
> +    if (tinfo) {
> +        frame->sf_si.si_signo = tinfo->si_signo;
> +        frame->sf_si.si_errno = tinfo->si_errno;
> +        frame->sf_si.si_code = tinfo->si_code;
> +        frame->sf_si.si_pid = tinfo->si_pid;
> +        frame->sf_si.si_uid = tinfo->si_uid;
> +        frame->sf_si.si_status = tinfo->si_status;
> +        frame->sf_si.si_addr = tinfo->si_addr;
> +
> +        if (TARGET_SIGILL == sig || TARGET_SIGFPE == sig ||
> +                TARGET_SIGSEGV == sig || TARGET_SIGBUS == sig ||
> +                TARGET_SIGTRAP == sig) {
> +            frame->sf_si._reason._fault._trapno = tinfo->_reason._fault._trapno;
> +        }
> +
> +        /*
> +         * If si_code is one of SI_QUEUE, SI_TIMER, SI_ASYNCIO, or
> +         * SI_MESGQ, then si_value contains the application-specified
> +         * signal value. Otherwise, the contents of si_value are
> +         * undefined.
> +         */
> +        if (SI_QUEUE == code || SI_TIMER == code || SI_ASYNCIO == code ||
> +                SI_MESGQ == code) {
> +            frame->sf_si.si_value.sival_int = tinfo->si_value.sival_int;
> +        }
> +
> +        if (SI_TIMER == code) {
> +            frame->sf_si._reason._timer._timerid =
> +                tinfo->_reason._timer._timerid;
> +            frame->sf_si._reason._timer._overrun =
> +                tinfo->_reason._timer._overrun;
> +        }
> +
> +#ifdef SIGPOLL
> +        if (SIGPOLL == sig) {
> +            frame->sf_si._reason._band = tinfo->_reason._band;
> +        }
> +#endif

This seems to be yet a third set of the logic for handling
target_siginfo_t's union, to go along with tswap_siginfo() and
host_to_target_siginfo_noswap(), except that the logic here is
different. linux-user calls tswap_siginfo() in its signal-frame
setup code.

> +
> +    }
> +
> +    if (set_sigtramp_args(regs, sig, frame, frame_addr, ka)) {
> +        goto give_sigsegv;
> +    }

set_sigtramp_args() can't fail. (Not sure why it has a non-void
return type.)

> +
> +    unlock_user_struct(frame, frame_addr, 1);
> +    return;
> +
> +give_sigsegv:
> +    unlock_user_struct(frame, frame_addr, 1);
> +    force_sig(TARGET_SIGSEGV);
> +}
> +
>  void signal_init(void)
>  {
>      TaskState *ts = (TaskState *)thread_cpu->opaque;
> --
> 2.33.1

thanks
-- PMM

