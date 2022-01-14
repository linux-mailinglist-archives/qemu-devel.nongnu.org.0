Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135448E97C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:53:39 +0100 (CET)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8L9F-0007SS-Rm
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8L6M-0004dl-9i
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:50:41 -0500
Received: from [2a00:1450:4864:20::42b] (port=38679
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8L6J-00031p-9T
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:50:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a5so15189892wrh.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7RvrfG8u3XOxcIpkAtybFM5yz3s+5wDK+Cb2BJpIHQ=;
 b=kXvm1ThSVzoy+n8SJshzOvzdvROLhFMxR5wRKmjsKmNdny9x+zUAD6NFSUspXmHh/2
 CAOCE9692aMDAqUErj0pFQWcXD8+PqpNSLFxjJ+Qp+ok6LzjVXP6WZtkAr+bXKM+4zvh
 OMA/lYQB+g2iq1V3JAeReXrz/LoDZlkQ/PH0DUUrT760PtOoFwpzr8K3zXcH7pE1lH4V
 Z3eGYShXRQ57ipIPm6fGNpeIzAgDEdvaiJOVViAJaf8uyXAACOmIJEGuWhiQDXSuD2Sx
 TP/RU5Z9WYkDshcl7GG7UlEtA6Bo3F9CY0/ws9c2uyjl3jKjBocm6vIQmNvVkHCOB5qY
 t9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7RvrfG8u3XOxcIpkAtybFM5yz3s+5wDK+Cb2BJpIHQ=;
 b=Zer5GDsfF1ytx0FiW7KhKD8LjtBcxBcgmEq9JD280Mol3nijXeOGG/rfsmi8e9vZSA
 +3j3IpZdMeCWZeZzNZHFwguJ/OYWkpsZM36nvPwDVCB86Xhuw0DLXQ9VteKQZvxnlEie
 SuBgnadwyzVEJCcoHkPLu19cXVMsNjcELswwbB1RVJdHFYqHbKWB+UK88b0AKMnWsQCk
 vJojS0ViKLKNrFV/QiYOaeIht9/FO75SxTJzJeBztn0rTIo3+Mp788v/60+LqY+5P7EN
 G8qBBZ53D3grgpV4Gi0iUEVJWFQlE1/JXzjrWQ6jmywdR2C5QdDbCR/U7nGCpOJ24dMq
 zADw==
X-Gm-Message-State: AOAM532ZDnimMIunM8pRNwFNWm3DC+2iDW1UJzu6cdvVaeh4DKD0xsI4
 IflB6IT0rTg0DwpZbLMM3vrqbKLPp+OkKZD/bmX696lBd6zbug==
X-Google-Smtp-Source: ABdhPJzNBFYsZN9xgS2pig7ZaCoItTvlesPQy32qcqCXAk6MRZrEDqYTG6KyTKfxOAE+/0MqHGQYy1Iae3prwFwhwz8=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr8202014wrn.172.1642161033229; 
 Fri, 14 Jan 2022 03:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-26-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-26-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 11:50:22 +0000
Message-ID: <CAFEAcA9_saH9MgsU5G6R=N6guZNx9YQ3vJfyD-CXZB3CY04GbA@mail.gmail.com>
Subject: Re: [PATCH 25/30] bsd-user/signal.c: handle_pending_signal
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Sun, 9 Jan 2022 at 16:47, Warner Losh <imp@bsdimp.com> wrote:
>
> Handle a queued signal.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>


> +static void handle_pending_signal(CPUArchState *cpu_env, int sig,
> +                                  struct emulated_sigtable *k)
> +{
> +    CPUState *cpu = env_cpu(cpu_env);
> +    TaskState *ts = cpu->opaque;
> +    struct qemu_sigqueue *q;
> +    struct target_sigaction *sa;
> +    int code;
> +    sigset_t set;
> +    abi_ulong handler;
> +    target_siginfo_t tinfo;
> +    target_sigset_t target_old_set;
> +
> +    trace_user_handle_signal(cpu_env, sig);
> +
> +    /* Dequeue signal. */
> +    q = k->first;
> +    k->first = q->next;
> +    if (!k->first) {
> +        k->pending = 0;
> +    }

(The dequeue simplifies if you follow linux-user's way of handling
"queueing" a signal.)

> +
> +    sig = gdb_handlesig(cpu, sig);
> +    if (!sig) {
> +        sa = NULL;
> +        handler = TARGET_SIG_IGN;
> +    } else {
> +        sa = &sigact_table[sig - 1];
> +        handler = sa->_sa_handler;
> +    }
> +
> +    if (do_strace) {
> +        print_taken_signal(sig, &q->info);
> +    }
> +
> +    if (handler == TARGET_SIG_DFL) {
> +        /*
> +         * default handler : ignore some signal. The other are job
> +         * control or fatal.
> +         */
> +        if (TARGET_SIGTSTP == sig || TARGET_SIGTTIN == sig ||
> +                TARGET_SIGTTOU == sig) {
> +            kill(getpid(), SIGSTOP);
> +        } else if (TARGET_SIGCHLD != sig && TARGET_SIGURG != sig &&
> +            TARGET_SIGINFO != sig &&
> +            TARGET_SIGWINCH != sig && TARGET_SIGCONT != sig) {
> +            force_sig(sig);
> +        }
> +    } else if (TARGET_SIG_IGN == handler) {

Avoid the yoda-conditionals, please.

> +        /* ignore sig */
> +    } else if (TARGET_SIG_ERR == handler) {
> +        force_sig(sig);

Note that if you follow linux-user and my suggestion on
patch 21, these force_sig() calls become calls to
dump_core_and_abort(), unlike the one in setup_frame(),
which should be a "queue this signal". (The difference is
that here we know the process is definitely going to die,
because it has no valid handler for a fatal signal. In
setup_frame() the process might be able to continue, if it
has a signal handler for the SIGILL or SIGSEGV or whatever.)

> +    } else {
> +        /* compute the blocked signals during the handler execution */
> +        sigset_t *blocked_set;
> +
> +        target_to_host_sigset(&set, &sa->sa_mask);
> +        /*
> +         * SA_NODEFER indicates that the current signal should not be
> +         * blocked during the handler.
> +         */
> +        if (!(sa->sa_flags & TARGET_SA_NODEFER)) {
> +            sigaddset(&set, target_to_host_signal(sig));
> +        }
> +
> +        /*
> +         * Save the previous blocked signal state to restore it at the
> +         * end of the signal execution (see do_sigreturn).
> +         */
> +        host_to_target_sigset_internal(&target_old_set, &ts->signal_mask);
> +
> +        blocked_set = ts->in_sigsuspend ?
> +            &ts->sigsuspend_mask : &ts->signal_mask;
> +        qemu_sigorset(&ts->signal_mask, blocked_set, &set);
> +        ts->in_sigsuspend = false;
> +        sigprocmask(SIG_SETMASK, &ts->signal_mask, NULL);
> +
> +        /* XXX VM86 on x86 ??? */
> +
> +        code = q->info.si_code;
> +        /* prepare the stack frame of the virtual CPU */
> +        if (sa->sa_flags & TARGET_SA_SIGINFO) {
> +            tswap_siginfo(&tinfo, &q->info);

Oh, you're doing the tswap_siginfo() here. If you really want to
do that, then the setup_frame() should be able to do a simple
structure-copy I think and doesn't need the logic to figure out
which union fields are relevant. But putting the tswap_siginfo()
inside setup_frame() would match where linux-user does it.

> +            setup_frame(sig, code, sa, &target_old_set, &tinfo, cpu_env);
> +        } else {
> +            setup_frame(sig, code, sa, &target_old_set, NULL, cpu_env);
> +        }
> +        if (sa->sa_flags & TARGET_SA_RESETHAND) {
> +            sa->_sa_handler = TARGET_SIG_DFL;
> +        }
> +    }
> +    if (q != &k->info) {
> +        free_sigqueue(cpu_env, q);
> +    }
> +}
> +
>  void process_pending_signals(CPUArchState *cpu_env)
>  {
>  }
> --
> 2.33.1

thanks
-- PMM

