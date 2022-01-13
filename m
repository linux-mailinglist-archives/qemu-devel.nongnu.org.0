Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27D48DF01
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:33:58 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86nF-000731-7M
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86jC-0005dA-En
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:29:46 -0500
Received: from [2a00:1450:4864:20::435] (port=45047
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86j9-0005Nl-Rf
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:29:46 -0500
Received: by mail-wr1-x435.google.com with SMTP id k18so12206188wrg.11
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PARjI4optfbS7JbOIbMPrddfHmCPNF8pgeHjW5BVE7M=;
 b=j2DVeFSkFe8EHvGpVLhlRDFx7ybmjzZKbhG1pglHKFdgAtjqp+LGmEGrdt1IeKI7HQ
 pzqhYECOQbe9QwFbY+peTh1JkDsW4nNdcgQmooMsZOkl91FkLBVVyZzknRRJzZWGtFYn
 ClPg4iFTqqnJgYvZuWu8vKQcmEjZbMDEjZk0h1YojJZPLTwl4p54ZJSpwZ86R2O9WCul
 03UEvzA8NdRTAOS3DcfyAU9yxzpLO4MkZNM7AnMi7pdmLcngih5/XYQNVTC3XqokfyhP
 4DPFGstKiMYAGT18XerGJe6YjaacMAhfEm2R3EqUJRdzJcCEWqJ/WOU+tuj9hXFDAQSK
 lKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PARjI4optfbS7JbOIbMPrddfHmCPNF8pgeHjW5BVE7M=;
 b=Q8hQJuibPCnBbt79RgjJ5nR46Q3ZMyrXb2ViwJSO+xQpE59RMkdc5hIsSvPKHOPNOJ
 OVMj6bORVad+1ySVM+Hb6bpfD6C3RadjbKuPsFs8zBpj0PoJl+6Zqhj4XY2u4iz2syl+
 pIzRM6ANygrY0KcPGAGRV6ZfQDkbLN3kpxitwWcInzWHCG7raX4M3/4NT2vmyL7Y5Bae
 q6r8LmYRc7BG/CPaQK/sWdUjQTivMe+YRS0Snou/Cg5LEOHuupoqmf3FG+Cg9VnM9NIC
 7Rpxk6eLWxczMU942hbW1RXhIBRV2IQnoiEDyTqqRWad6d7HEqeh46fW8m0NZ/FbZG35
 Tc7A==
X-Gm-Message-State: AOAM532+dVruCpGHEIvecxBkp3MJV2/P/vyrG+ZIoEfO25vwES+cwczm
 3QOy5Q6MlhHUtAf7lAI+k55AZNnJQJETBngJVlTvLA==
X-Google-Smtp-Source: ABdhPJyahBp15M8huaJH/BrLIXGB4SA0TWqJ4aK96KqTQO4Ib9AzSORLJMGS3Yf2VHrS2TA+yJaiHzZv06q7O5yrb5I=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr5730461wrw.2.1642105781606;
 Thu, 13 Jan 2022 12:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-22-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-22-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:29:30 +0000
Message-ID: <CAFEAcA9xbOCjc7ZLULuyWNYi5jHtS=N8_HWiob_gaAE+3vxZAA@mail.gmail.com>
Subject: Re: [PATCH 21/30] bsd-user/signal.c: force_sig
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, 9 Jan 2022 at 16:44, Warner Losh <imp@bsdimp.com> wrote:
>
> Force delivering a signal and generating a core file.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h         |  1 +
>  bsd-user/signal.c       | 59 +++++++++++++++++++++++++++++++++++++++++
>  bsd-user/syscall_defs.h |  1 +
>  3 files changed, 61 insertions(+)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 7c54a933eb8..e12617f5d69 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -223,6 +223,7 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>  int target_to_host_signal(int sig);
>  int host_to_target_signal(int sig);
> +void QEMU_NORETURN force_sig(int target_sig);
>
>  /* mmap.c */
>  int target_mprotect(abi_ulong start, abi_ulong len, int prot);
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 824535be8b8..97f42f9c45e 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -109,6 +109,65 @@ static int core_dump_signal(int sig)
>      }
>  }
>
> +/* Abort execution with signal. */
> +void QEMU_NORETURN force_sig(int target_sig)

In linux-user we call this dump_core_and_abort(), which is
a name that better describes what it's actually doing.

(Today's linux-user's force_sig() does what the Linux kernel's
function of that name does -- it's a wrapper around
queue_signal() which delivers a signal to the guest with
.si_code = SI_KERNEL , si_pid = si_uid = 0.
Whether you want one of those or not depends on what BSD
kernels do in that kind of "we have to kill this process"
situation.)

> +{
> +    CPUArchState *env = thread_cpu->env_ptr;
> +    CPUState *cpu = env_cpu(env);
> +    TaskState *ts = cpu->opaque;
> +    int core_dumped = 0;
> +    int host_sig;
> +    struct sigaction act;
> +
> +    host_sig = target_to_host_signal(target_sig);
> +    gdb_signalled(env, target_sig);
> +
> +    /* Dump core if supported by target binary format */
> +    if (core_dump_signal(target_sig) && (ts->bprm->core_dump != NULL)) {
> +        stop_all_tasks();
> +        core_dumped =
> +            ((*ts->bprm->core_dump)(target_sig, env) == 0);
> +    }
> +    if (core_dumped) {
> +        struct rlimit nodump;
> +
> +        /*
> +         * We already dumped the core of target process, we don't want
> +         * a coredump of qemu itself.
> +         */
> +         getrlimit(RLIMIT_CORE, &nodump);
> +         nodump.rlim_cur = 0;
> +         setrlimit(RLIMIT_CORE, &nodump);
> +         (void) fprintf(stderr, "qemu: uncaught target signal %d (%s) "
> +             "- %s\n", target_sig, strsignal(host_sig), "core dumped");
> +    }
> +
> +    /*
> +     * The proper exit code for dying from an uncaught signal is
> +     * -<signal>.  The kernel doesn't allow exit() or _exit() to pass
> +     * a negative value.  To get the proper exit code we need to
> +     * actually die from an uncaught signal.  Here the default signal
> +     * handler is installed, we send ourself a signal and we wait for
> +     * it to arrive.
> +     */
> +    memset(&act, 0, sizeof(act));
> +    sigfillset(&act.sa_mask);
> +    act.sa_handler = SIG_DFL;
> +    sigaction(host_sig, &act, NULL);
> +
> +    kill(getpid(), host_sig);
> +
> +    /*
> +     * Make sure the signal isn't masked (just reuse the mask inside
> +     * of act).
> +     */
> +    sigdelset(&act.sa_mask, host_sig);
> +    sigsuspend(&act.sa_mask);
> +
> +    /* unreachable */
> +    abort();
> +}
> +
>  /*
>   * Queue a signal so that it will be send to the virtual CPU as soon as
>   * possible.
> diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
> index 04a1a886d7b..62b472b990b 100644
> --- a/bsd-user/syscall_defs.h
> +++ b/bsd-user/syscall_defs.h
> @@ -21,6 +21,7 @@
>  #define _SYSCALL_DEFS_H_
>
>  #include <sys/syscall.h>
> +#include <sys/resource.h>
>
>  #include "errno_defs.h"
>

-- PMM

