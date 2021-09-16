Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14340D528
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:54:13 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn9o-0007R9-M7
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQn7c-0004hH-FG
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:51:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQn7a-0004pE-9F
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:51:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t8so1218324wri.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cugmDjD8c26jybPrFiBC4p74U0ksnoQL6/ZS0DXCGio=;
 b=oAeir/zXsRUgtqmrEybJMAiY/ZjOpDeXUqzJ9N8tyLuwxqr+OLEcVx3Yew/sZMq4LE
 X1qeue1Epl3D4Cw18kxr1z3Y3FWSrydIdA1/ThYbaNEGijisC9k4EzBMui488DHLsZfB
 j+5mUczP/8n1DEqjYuBeOyPa2h1UJlL+kl8sG3aas/zKjT9QNyiGnTK01E0rUm2n/AWs
 TX01BicQUuAqzkoH2ak4hkqQrq1iqWUmPgrxMnf5UBaO/GgVzjHRxw5cSJGD34/xQZ0d
 glLc1uNEU612p64MTC3n2ZIaj+cFVTwYSdk/2AQyML4k0MMHEQB6Dw8WKbF6PFNN93JG
 cd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cugmDjD8c26jybPrFiBC4p74U0ksnoQL6/ZS0DXCGio=;
 b=oSgARQ2bh5isQ0ejRZ3gftJcxlP8CBWNrIMihDo5rdNLHi+eBZRJ4Ol+Uhr4rCn1v9
 6omJgwfPQrNRYsM90JisOvv/Aoq7hrq9PeuYaeu6w26ltWoPjhx9UuAt36GTf6CNM040
 J8fk/cmscu52WXiGZfjtzu9RAm2H3Uj5/sI7DaaA7np8IOqgXMQGZeSfIRoEsOlI6Twe
 OdA/CK8j6IKH/G+tMpP0NNGMNr/l+c1RAK7NV13mPkgofObMqNxvxnxrK+xXEv3n74f1
 SvouvW73snJJ1xKcrbS7ujU/5jJ/I9SIjELLhuhTloV3wBEu3TPLsutSkmOccgLk26iR
 EHeg==
X-Gm-Message-State: AOAM532Kq+YP/7F1DPnoSqQ6R42uMkdrTIWfLrucABftYR1cnccJe1oB
 8W96mwJoqtaQG8kUSu3ytzc=
X-Google-Smtp-Source: ABdhPJx+nxXWGzNw3hEXwf8dsRymZMZWX6fkaOq90vogo9XO468dOLVVTuHaCWHBKsvRgO/Dql+Dpg==
X-Received: by 2002:adf:e408:: with SMTP id g8mr4810337wrm.138.1631782312695; 
 Thu, 16 Sep 2021 01:51:52 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id k22sm2851621wrd.59.2021.09.16.01.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 01:51:52 -0700 (PDT)
Subject: Re: [RFC PATCH 7/7] linux-user: Reorg cpu_signal_handler
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <454870cf-e18e-16a5-bc75-84cf055a5e54@amsat.org>
Date: Thu, 16 Sep 2021 10:51:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913220552.604064-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/14/21 12:05 AM, Richard Henderson wrote:
> Split out two functions into linux-user/host/arch/host-signal.h.
> Since linux-user requires a linux host, drop all of the BSD and
> Solaris ifdefs.  These should be recreated under bsd-user/ when
> the current blanks there are filled.
> 
> Fold the remnants of handle_cpu_signal into host_signal_handler.
> 
> Drop the call to cc->tcg_ops->tlb_fill.  This was simply an indirect
> method to raise SIGSEGV; it is far easier to pass the host siginfo_t
> along to the guest.  This fixes all of the guest cpu_loop code that
> currently fails to properly fill in SEGV_MAPERR vs SEGV_ACCERR.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h               |  12 -
>  linux-user/host/aarch64/host-signal.h |  73 +++
>  linux-user/host/alpha/host-signal.h   |  41 ++
>  linux-user/host/arm/host-signal.h     |  30 ++
>  linux-user/host/i386/host-signal.h    |  24 +
>  linux-user/host/mips/host-signal.h    |  61 +++
>  linux-user/host/ppc/host-signal.h     |  24 +
>  linux-user/host/ppc64/host-signal.h   |   1 +
>  linux-user/host/riscv32/host-signal.h |  57 +++
>  linux-user/host/riscv64/host-signal.h |   1 +
>  linux-user/host/s390/host-signal.h    |  92 ++++
>  linux-user/host/s390x/host-signal.h   |   1 +
>  linux-user/host/sparc/host-signal.h   |  53 ++
>  linux-user/host/sparc64/host-signal.h |   1 +
>  linux-user/host/x86_64/host-signal.h  |  24 +
>  accel/tcg/user-exec.c                 | 712 --------------------------
>  linux-user/signal.c                   |  93 ++--
>  17 files changed, 543 insertions(+), 757 deletions(-)
>  create mode 100644 linux-user/host/aarch64/host-signal.h
>  create mode 100644 linux-user/host/alpha/host-signal.h
>  create mode 100644 linux-user/host/arm/host-signal.h
>  create mode 100644 linux-user/host/i386/host-signal.h
>  create mode 100644 linux-user/host/mips/host-signal.h
>  create mode 100644 linux-user/host/ppc/host-signal.h
>  create mode 100644 linux-user/host/ppc64/host-signal.h
>  create mode 100644 linux-user/host/riscv32/host-signal.h
>  create mode 100644 linux-user/host/riscv64/host-signal.h
>  create mode 100644 linux-user/host/s390/host-signal.h
>  create mode 100644 linux-user/host/s390x/host-signal.h
>  create mode 100644 linux-user/host/sparc/host-signal.h
>  create mode 100644 linux-user/host/sparc64/host-signal.h
>  create mode 100644 linux-user/host/x86_64/host-signal.h

> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 73c0f9066b..509dad7850 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c

> -static void host_signal_handler(int host_signum, siginfo_t *info,
> -                                void *puc)
> +static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>  {
>      CPUArchState *env = thread_cpu->env_ptr;
>      CPUState *cpu = env_cpu(env);
>      TaskState *ts = cpu->opaque;
> -
> -    int sig;
> +    bool sync_sig = false;
>      target_siginfo_t tinfo;
>      ucontext_t *uc = puc;
>      struct emulated_sigtable *k;
> +    uintptr_t pc = 0;
> +    int guest_sig;
>  
> -    /* the CPU emulator uses some host signals to detect exceptions,
> -       we forward to it some signals */
> -    if ((host_signum == SIGSEGV || host_signum == SIGBUS)
> -        && info->si_code > 0) {
> -        if (cpu_signal_handler(host_signum, info, puc))
> +    /*
> +     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
> +     * handling wrt signal blocking and unwinding.  SIGSEGV may need to
> +     * remove write-protection and restart the instruction.
> +     */
> +    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code > 0) {
> +        pc = adjust_signal_pc(host_signal_pc(uc));
> +        if (host_sig == SIGSEGV &&
> +            info->si_code == SEGV_ACCERR &&
> +            host_sigsegv_write(info, uc) &&
> +            handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask, pc,
> +                                        (uintptr_t)info->si_addr)) {
>              return;
> +        }
> +        sync_sig = true;
> +    } else {
> +        rewind_if_in_safe_syscall(puc);
> +
> +        /*
> +         * Block host signals until target signal handler entered.
> +         * We can't block SIGSEGV or SIGBUS while we're executing
> +         * guest code in case the guest code provokes one in the
> +         * window between now and it getting out to the main loop.
> +         * Signals will be unblocked again in process_pending_signals().
> +         *
> +         * WARNING: we cannot use sigfillset() here because the uc_sigmask
> +         * field is a kernel sigset_t, which is much smaller than the
> +         * libc sigset_t which sigfillset() operates on. Using sigfillset()
> +         * would write 0xff bytes off the end of the structure and trash
> +         * data on the struct.
> +         * We can't use sizeof(uc->uc_sigmask) either, because the libc
> +         * headers define the struct field with the wrong (too large) type.
> +         */
> +        memset(&uc->uc_sigmask, 0xff, SIGSET_T_SIZE);
> +        sigdelset(&uc->uc_sigmask, SIGSEGV);
> +        sigdelset(&uc->uc_sigmask, SIGBUS);
>      }
>  
>      /* get target signal number */
> -    sig = host_to_target_signal(host_signum);
> -    if (sig < 1 || sig > TARGET_NSIG)
> +    guest_sig = host_to_target_signal(host_sig);
> +    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
>          return;
> -    trace_user_host_signal(env, host_signum, sig);
> -
> -    rewind_if_in_safe_syscall(puc);
> +    }
> +    trace_user_host_signal(env, host_sig, guest_sig);
>  
>      host_to_target_siginfo_noswap(&tinfo, info);
> -    k = &ts->sigtab[sig - 1];
> +    k = &ts->sigtab[guest_sig - 1];
>      k->info = tinfo;
> -    k->pending = sig;
> +    k->pending = guest_sig;
>      ts->signal_pending = 1;
>  
> -    /* Block host signals until target signal handler entered. We
> -     * can't block SIGSEGV or SIGBUS while we're executing guest
> -     * code in case the guest code provokes one in the window between
> -     * now and it getting out to the main loop. Signals will be
> -     * unblocked again in process_pending_signals().
> -     *
> -     * WARNING: we cannot use sigfillset() here because the uc_sigmask
> -     * field is a kernel sigset_t, which is much smaller than the
> -     * libc sigset_t which sigfillset() operates on. Using sigfillset()
> -     * would write 0xff bytes off the end of the structure and trash
> -     * data on the struct.
> -     * We can't use sizeof(uc->uc_sigmask) either, because the libc
> -     * headers define the struct field with the wrong (too large) type.
> +    /*
> +     * For synchronous signals, unwind the cpu state to the faulting
> +     * insn and then exit back to the main loop so that the signal
> +     * is delivered immediately.
>       */
> -    memset(&uc->uc_sigmask, 0xff, SIGSET_T_SIZE);
> -    sigdelset(&uc->uc_sigmask, SIGSEGV);
> -    sigdelset(&uc->uc_sigmask, SIGBUS);
> +    if (sync_sig) {
> +        clear_helper_retaddr();
> +        sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +        cpu->exception_index = EXCP_INTERRUPT;
> +        cpu_loop_exit_restore(cpu, pc);
> +    }
>  
> -    /* interrupt the virtual CPU as soon as possible */
> +    /*
> +     * Interrupt the virtual CPU as soon as possible, but for now
> +     * return to continue with the current TB.
> +     */
>      cpu_exit(thread_cpu);
>  }

Is it possible to split this patch per architectures,
doing for the first arch:

  #if ARCH1

  new host_signal_handler() {}

  #else

  old unmodified host_signal_handler() {}

  #endif

Then for the second:

  #if ARCH1 || ARCH2

  new host_signal_handler() {}

  #else

  old unmodified host_signal_handler() {}

  #endif

Last patch being cleaning the transition:

- #if ARCH1 || ARCH2 || ...

  new host_signal_handler() {}

- #else
-
- old unmodified host_signal_handler() {}
-
- #endif

?

