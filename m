Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1E48E9C0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 13:18:13 +0100 (CET)
Received: from localhost ([::1]:49342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8LX2-0004cR-EO
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 07:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8LRU-0000ik-4D
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:12:28 -0500
Received: from [2a00:1450:4864:20::433] (port=36419
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8LRS-0007iW-HL
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:12:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id r28so15321194wrc.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 04:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sePHiHDkFuJ0KL1DS+I649ddNxgVmhAxvLCV7ryBuNo=;
 b=M2wdqOx4AI3kcn/ftLytEd/2g9qI4guE8zhs2t9w2q9NZiMwabRDSL07xY5pEYhcD3
 anYWyFUJ3AmTcltvZNWDdN6RHHRxcvpqTJ7SefiegnHACS6wR11h3N8ftV06NigotSir
 MOnb0xFmhQQMgT/jwchYNhnAsnMtAcxXsv8tK2eZt+v5d24V+PzGC+b/l769E8FddHot
 Tw2QMQfSAtPan1965EodhQ8f9Xza2wdWnkcW+o6+T3v5urRacr71vJVZXHhiOQJ4se8u
 N4po5/1I8uSs0l2Fe12aNWmT7qmqAuNMDm/y2CxUFNT5zfYmxEo6XImBKMxI808mlo8D
 /7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sePHiHDkFuJ0KL1DS+I649ddNxgVmhAxvLCV7ryBuNo=;
 b=SRK8HLZlgnPIiyfOao231npSS+VRNgTb2CR/t3AkdR6xIahQV8tyhek0nSjnrp5VnC
 kzoi73Z84iQ9L6wLJlE/p+wpkU3wgMzXZvLhhql56oFo8TGfC3WaaDb4q83DvvQtHcTJ
 KXjlR90c/dhj21r9JcV75upB6kDqgHOwqMtGvdcpcomvPaaXqElQvDwoyxomrG9xB2OC
 c5tSLQckjxkh+du88ZtHw5Bwt5fihaERBmTl91CbVXW1DSXPrc18fP8efa0MVB1Zt3Cm
 MicLLWV1DBOBRfhSg8KDWoP6WUBctCXlLf7TNFwqr09B6CwXweuQWGOmUUV7qKx7GLvN
 gy0g==
X-Gm-Message-State: AOAM530ey45p0XOjmFOilGVG9aG5iLwRtRbFPhLrHbo2nZmrhuEydLKR
 JmBCPO0k5LBKK/OV37YUORhMaXSMoHmp2NzIfbmJ4g==
X-Google-Smtp-Source: ABdhPJzTyowfMGn5hzR+9VnWtT78S2j64UQ2Rap1cPr1NBklekvlM6XDF0VI9AdYq82a1eFYoosrzESDEvgIvvq6WrA=
X-Received: by 2002:adf:e907:: with SMTP id f7mr8022425wrm.319.1642162345023; 
 Fri, 14 Jan 2022 04:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-29-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-29-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 12:12:14 +0000
Message-ID: <CAFEAcA8yNPRS-6U5fueOEANot3rix8of_sP3Nr+GoQPKYF-wqA@mail.gmail.com>
Subject: Re: [PATCH 28/30] bsd-user/signal.c: implement do_sigreturn
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

On Sun, 9 Jan 2022 at 17:00, Warner Losh <imp@bsdimp.com> wrote:
>
> Implements the meat of a sigreturn(2) system call via do_sigreturn, and
> helper reset_signal_mask. Fix the prototype of do_sigreturn in qemu.h
> and remove do_rt_sigreturn since it's linux only.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   |  3 +--
>  bsd-user/signal.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 011fdfebbaa..b8c64ca0e5b 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -219,14 +219,13 @@ extern int do_strace;
>  /* signal.c */
>  void process_pending_signals(CPUArchState *cpu_env);
>  void signal_init(void);
> -long do_sigreturn(CPUArchState *env);
> -long do_rt_sigreturn(CPUArchState *env);
>  void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>  int target_to_host_signal(int sig);
>  int host_to_target_signal(int sig);
>  void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
>  void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
> +long do_sigreturn(CPUArchState *regs, abi_ulong addr);

Please always call CPUArchState* arguments 'env'.

>  void QEMU_NORETURN force_sig(int target_sig);
>  int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right);
>
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 1dd6dbb4ee1..d11f5eddd7e 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -640,6 +640,62 @@ give_sigsegv:
>      force_sig(TARGET_SIGSEGV);
>  }
>
> +static int reset_signal_mask(target_ucontext_t *ucontext)
> +{
> +    int i;
> +    sigset_t blocked;
> +    target_sigset_t target_set;
> +    TaskState *ts = (TaskState *)thread_cpu->opaque;
> +
> +    for (i = 0; i < TARGET_NSIG_WORDS; i++)
> +        if (__get_user(target_set.__bits[i],
> +                    &ucontext->uc_sigmask.__bits[i])) {
> +            return -TARGET_EFAULT;
> +        }
> +    target_to_host_sigset_internal(&blocked, &target_set);
> +    ts->signal_mask = blocked;
> +    sigprocmask(SIG_SETMASK, &ts->signal_mask, NULL);

do_sigreturn() itself shouldn't be setting the active signal
mask, at least if you follow the linux-user design. It just
sets the thread's signal_mask field in the TaskState by
calling set_sigmask(), and then on our way out in the
main cpu loop we'll call process_pending_signals() which
sets the real thread signal mask to that value. (This, together
with do_sigreturn() calling block_signals() before it starts
work, avoids some race conditions where a host signal is delivered
as soon as we unblock, I think.)

-- PMM

