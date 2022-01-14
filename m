Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4644E48EA88
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:22:59 +0100 (CET)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8MXh-0005Hn-SI
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:22:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MOm-0000Pn-SF
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:13:44 -0500
Received: from [2a00:1450:4864:20::32c] (port=36774
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MOi-000124-AP
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:13:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so7314994wmk.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pgf2f1KhIv7PGgauBe1vm0ZI0BX6wRBEEaL30X3hHiw=;
 b=hPBDkD1QHK07Hb6AZ6EhKrmcGCpMuYcy/FshI8SDpPeFE39ipFUU1KZW6mcveycetZ
 9GqzEyVOIM7BPX6XIBzpSUmMU4hDD4mZ3KMHICLRIY2YdG+HRg35qsKZkZRnMc1Dsb1d
 jp3ySicWtPyElK42A++gwOT63175X60S7oaYmarSa4n5W2IBL9HCt3BzMG1dwKyzKKf4
 TtKbdy3hyko1g9c8x/hZMlSYcYP0/eCp4gnuCY2uhhlCCJDCica+Pe79Q5VYwTysTSUi
 oaxQChNVTk4qX9Q45HBK919lP9qoCo6K9iVTS5zzxNGxskzAsq9hfYw+UHs8jKr0oObf
 z1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pgf2f1KhIv7PGgauBe1vm0ZI0BX6wRBEEaL30X3hHiw=;
 b=OGHTDCqPyBLb3awRguiDK/1HzCWYFxyhp7O4dA2TS1e60lqMBaj/4YSAQyrYtZQ4Of
 lb4dTaQwTzDJQxw07CvTniuBm/IVUtojDaySktg/F5DzdhLFcU9MgYrNnixWYZTLyouQ
 qtqozIp4ou6cIygIWGg1FL0OHkvysy1x/ktUPZqA9DBBcpHv54uXFW1PNqDn751Jmmh7
 KEfO2Y+ieT8qj+Q8gzS3mLlLQTrhJ1uehOIwsmZSvouT3hc1As6kDuPdYr4wbjDA2szA
 5gIyI17XCqRnFZ7/TTs2x3+7MDVWqA9BJJ9vKs1S3a1yulwv++Ro0Ov3JINBkWvqncvp
 vPCw==
X-Gm-Message-State: AOAM5330Ls2eXDiOdVU6OSkO+nVBXX9aud+JQ3Ev6mVR1DR5AtQCU5Un
 CG2fW03Yw2jGf/HPWuKIqkjT2Vm9j4pB1NjY9DJo9w==
X-Google-Smtp-Source: ABdhPJwKQyiIRHBMOYadKXQ65quapS3XIpLAmyYg8KX/9VLqtdxIQDO9zGFTUwNy4HPYEvePMyicGKikxRl/c11Dp+s=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr15594049wmd.37.1642166018615; 
 Fri, 14 Jan 2022 05:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-30-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-30-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:13:27 +0000
Message-ID: <CAFEAcA-Rux0fbm26vGBaYrbwsV792m6cjVOKQSGhJpHMbka6hg@mail.gmail.com>
Subject: Re: [PATCH 29/30] bsd-user/signal.c: implement do_sigaction
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

On Sun, 9 Jan 2022 at 16:32, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement the meat of the sigaction(2) system call with do_sigaction and
> helper routiner block_signals (which is also used to implemement signal
> masking so it's global).
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   | 21 +++++++++++++
>  bsd-user/signal.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index b8c64ca0e5b..c643d6ba246 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -226,8 +226,29 @@ int host_to_target_signal(int sig);
>  void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
>  void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
>  long do_sigreturn(CPUArchState *regs, abi_ulong addr);
> +int do_sigaction(int sig, const struct target_sigaction *act,
> +                struct target_sigaction *oact);
>  void QEMU_NORETURN force_sig(int target_sig);
>  int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right);
> +/**
> + * block_signals: block all signals while handling this guest syscall
> + *
> + * Block all signals, and arrange that the signal mask is returned to
> + * its correct value for the guest before we resume execution of guest code.
> + * If this function returns non-zero, then the caller should immediately
> + * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
> + * signal and restart execution of the syscall.
> + * If block_signals() returns zero, then the caller can continue with
> + * emulation of the system call knowing that no signals can be taken
> + * (and therefore that no race conditions will result).
> + * This should only be called once, because if it is called a second time
> + * it will always return non-zero. (Think of it like a mutex that can't
> + * be recursively locked.)
> + * Signals will be unblocked again by process_pending_signals().
> + *
> + * Return value: non-zero if there was a pending signal, zero if not.
> + */
> +int block_signals(void); /* Returns non zero if signal pending */
>
>  /* mmap.c */
>  int target_mprotect(abi_ulong start, abi_ulong len, int prot);
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index d11f5eddd7e..f055d1db407 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -231,6 +231,22 @@ static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
>      }
>  }
>
> +int block_signals(void)
> +{
> +    TaskState *ts = (TaskState *)thread_cpu->opaque;
> +    sigset_t set;
> +
> +    /*
> +     * It's OK to block everything including SIGSEGV, because we won't run any
> +     * further guest code before unblocking signals in
> +     * process_pending_signals().
> +     */
> +    sigfillset(&set);
> +    sigprocmask(SIG_SETMASK, &set, 0);

For linux-user we rely on sigprocmask() in a multithreaded
program setting the signal mask for only the calling thread,
which isn't POSIX-mandated. (Arguably we should use
pthread_sigmask() instead, but we don't for basically
historical reasons since linux-user is host-OS-specific anyway.)
Does BSD have the same "this changes this thread's signal mask"
semantics for sigprocmask()?

> +
> +    return qatomic_xchg(&ts->signal_pending, 1);
> +}
> +
>  /* Returns 1 if given signal should dump core if not handled. */
>  static int core_dump_signal(int sig)
>  {
> @@ -534,6 +550,66 @@ static int fatal_signal(int sig)
>      }
>  }
>
> +/* do_sigaction() return host values and errnos */
> +int do_sigaction(int sig, const struct target_sigaction *act,
> +        struct target_sigaction *oact)
> +{
> +    struct target_sigaction *k;
> +    struct sigaction act1;
> +    int host_sig;
> +    int ret = 0;
> +
> +    if (sig < 1 || sig > TARGET_NSIG || TARGET_SIGKILL == sig ||
> +            TARGET_SIGSTOP == sig) {

Kernel seems to allow SIGKILL and SIGSTOP unless act is
non-NULL and act->sa_handler is SIG_DFL ?
https://github.com/freebsd/freebsd-src/blob/main/sys/kern/kern_sig.c#L747
(Compare linux-user commit ee3500d33a7431, a recent bugfix.)

> +        return -EINVAL;
> +    }
> +
> +    if (block_signals()) {
> +        return -TARGET_ERESTART;

Are we returning host errnos, or target errnos ?
(The linux-user version of this function has been a bit
confused about this in the past; I suspect you've picked up
fragments of it from different points in time.)

> +    }
> +
> +    k = &sigact_table[sig - 1];
> +    if (oact) {
> +        oact->_sa_handler = tswapal(k->_sa_handler);
> +        oact->sa_flags = tswap32(k->sa_flags);
> +        oact->sa_mask = k->sa_mask;
> +    }
> +    if (act) {
> +        /* XXX: this is most likely not threadsafe. */
> +        k->_sa_handler = tswapal(act->_sa_handler);
> +        k->sa_flags = tswap32(act->sa_flags);
> +        k->sa_mask = act->sa_mask;
> +
> +        /* Update the host signal state. */
> +        host_sig = target_to_host_signal(sig);
> +        if (host_sig != SIGSEGV && host_sig != SIGBUS) {
> +            memset(&act1, 0, sizeof(struct sigaction));
> +            sigfillset(&act1.sa_mask);
> +            act1.sa_flags = SA_SIGINFO;
> +            if (k->sa_flags & TARGET_SA_RESTART) {
> +                act1.sa_flags |= SA_RESTART;
> +            }
> +            /*
> +             *  Note: It is important to update the host kernel signal mask to
> +             *  avoid getting unexpected interrupted system calls.
> +             */
> +            if (k->_sa_handler == TARGET_SIG_IGN) {
> +                act1.sa_sigaction = (void *)SIG_IGN;
> +            } else if (k->_sa_handler == TARGET_SIG_DFL) {
> +                if (fatal_signal(sig)) {
> +                    act1.sa_sigaction = host_signal_handler;
> +                } else {
> +                    act1.sa_sigaction = (void *)SIG_DFL;
> +                }
> +            } else {
> +                act1.sa_sigaction = host_signal_handler;
> +            }
> +            ret = sigaction(host_sig, &act1, NULL);
> +        }
> +    }
> +    return ret;
> +}

-- PMM

