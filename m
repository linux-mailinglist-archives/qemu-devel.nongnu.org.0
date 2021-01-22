Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFFE3004B6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:02:01 +0100 (CET)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2x0i-0005SO-PY
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2wyc-0004k9-3l
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:59:50 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2wyY-0001C2-S3
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:59:49 -0500
Received: by mail-ed1-x536.google.com with SMTP id h16so6649091edt.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avzrptPOJ9pgDyMN2OCjX1Y5GkkZ4pXRJNWy+8IWXbE=;
 b=dR9lxxpjEsubN6nd4IqwAhNCehatGst/oAI2rtWgvY+AEFstBBC7Ci6ctLIBx7DNIc
 oZVtmsVY/zZnC+dIbmr473dmF6Q6+NEIqsVCIdIjKhXWAau3wFazEhEAN29KAUunQGcl
 o/KQWopwWXniyD8L3gpsTBTWMclojVp8B4OjK+HPuVinxiq8Lql3ml6ieYdhgKdyLcv2
 7ERXkG1joHYQboxMeEarLKsMAOSrs9I5dQFlJpyzk1poWIsgMuRNj/MhtIkZ/SynHDIh
 7s6X4y7yyeQ1Fqw2/JHRZskwL9d48qtAjoo12cKZJ40q3+X8w9OGZYHRq50T2LFEZdne
 Q75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avzrptPOJ9pgDyMN2OCjX1Y5GkkZ4pXRJNWy+8IWXbE=;
 b=SkKErM7HSa3hRyRvhwMoJa51wZO+/Y6ZFIOTfOCHPxg0BKnV4QmnixMvNd2VeO7Ftz
 X2gORkOLTB0Oow5+WrmlK71mshYSJPbjTxoboMTddSo4TPdHlc5kBaeh+MLTlBIJYUMH
 JRnw7TNHre3RfjAKbLYjm2ii7/fyj+R7gJqy0Zjcrc4rqlfYJQBWP8v6Alw156jzUnHZ
 yK++piciFzpQJY7f3LGHaT+VatrZ2rCAGYIeT/61alvXCAVQHu615d6lpenRUPSbAQaL
 B807idXzC+GUhgpAQJxdJJDDpil4LyyNK8C6lcCNL/5WzvZFNUSAl47aUTLb2sBlI+Mt
 dQqw==
X-Gm-Message-State: AOAM5317wOyvIMvaK9Yu7CcxwRC6RmKLM3Hwl4A6F/sE7omQGfwIq3V1
 oN0THOQc9Ywfu+cwhTFpm7g72I1epvfK4szRhZmlb+O1KKs=
X-Google-Smtp-Source: ABdhPJyhUVv6OJcolVzJdjL+VtbuagdM86d33CUryyFoBL3CDq6sUzm+FkLMoJoYALBs07SOVvedFNqFDO8zdP7qJBA=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr3253164edb.44.1611323985331; 
 Fri, 22 Jan 2021 05:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-19-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 13:59:33 +0000
Message-ID: <CAFEAcA8rXQ76AVpqHwum_XGh13u+vwkZw_yOxRKvfyqbV3_GBQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/21] linux-user/aarch64: Signal SEGV_MTEAERR for
 async tag check error
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

So when does the real kernel report async MTE exceptions to userspace?
The commit message would be a good place to briefly describe the
kernel's strategy and where QEMU differs from it (if anywhere)...

> ---
>  linux-user/aarch64/target_signal.h |  1 +
>  linux-user/aarch64/cpu_loop.c      | 34 +++++++++++++++++++++---------
>  target/arm/mte_helper.c            | 10 +++++++++
>  3 files changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
> index 777fb667fe..18013e1b23 100644
> --- a/linux-user/aarch64/target_signal.h
> +++ b/linux-user/aarch64/target_signal.h
> @@ -21,6 +21,7 @@ typedef struct target_sigaltstack {
>
>  #include "../generic/signal.h"
>
> +#define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
>  #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
>
>  #define TARGET_ARCH_HAS_SETUP_FRAME
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 6867f0db2b..6160a401bd 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -72,6 +72,21 @@
>          put_user_u16(__x, (gaddr));                     \
>      })
>
> +static bool check_mte_async_fault(CPUARMState *env, target_siginfo_t *info)
> +{
> +    if (likely(env->cp15.tfsr_el[0] == 0)) {
> +        return false;
> +    }
> +
> +    env->cp15.tfsr_el[0] = 0;
> +    info->si_signo = TARGET_SIGSEGV;
> +    info->si_errno = 0;
> +    info->_sifields._sigfault._addr = 0;
> +    info->si_code = TARGET_SEGV_MTEAERR;
> +    queue_signal(env, info->si_signo, QEMU_SI_FAULT, info);
> +    return true;
> +}
> +
>  /* AArch64 main loop */
>  void cpu_loop(CPUARMState *env)
>  {
> @@ -88,15 +103,13 @@ void cpu_loop(CPUARMState *env)
>
>          switch (trapnr) {
>          case EXCP_SWI:
> -            ret = do_syscall(env,
> -                             env->xregs[8],
> -                             env->xregs[0],
> -                             env->xregs[1],
> -                             env->xregs[2],
> -                             env->xregs[3],
> -                             env->xregs[4],
> -                             env->xregs[5],
> -                             0, 0);
> +            if (check_mte_async_fault(env, &info)) {
> +                ret = -TARGET_ERESTARTSYS;
> +            } else {
> +                ret = do_syscall(env, env->xregs[8], env->xregs[0],
> +                                 env->xregs[1], env->xregs[2], env->xregs[3],
> +                                 env->xregs[4], env->xregs[5], 0, 0);
> +            }
>              if (ret == -TARGET_ERESTARTSYS) {
>                  env->pc -= 4;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> @@ -104,7 +117,8 @@ void cpu_loop(CPUARMState *env)
>              }
>              break;
>          case EXCP_INTERRUPT:
> -            /* just indicate that signals should be handled asap */
> +            /* Just indicate that signals should be handled asap. */
> +            check_mte_async_fault(env, &info);
>              break;
>          case EXCP_UDEF:
>              info.si_signo = TARGET_SIGILL;

So this doesn't guarantee to check the async-fault status on
every exit from cpu_exec(), which means we might miss things.
For instance I think this slightly contrived example would not
ever take the SEGV:
    STR x0, [x1]   # with a bad tag
    YIELD
l:  B l

because the STR and YIELD go into the same TB, the YIELD causes us
to leave the TB with EXCP_YIELD, we don't check for an async fault
in that code path, and then we'll go into the infinite loop and
have nothing to prompt us to come out and look at the async fault flags.

Does it work if we just always queue the SEGV on exit from cpu_exec()
and let the signal handling machinery prioritize if we also pend
some other signal because this was an EXCP_UDEF or whatever?
It would be neater if we could keep the fault-check outside the
switch (trapnr) somehow.

> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 153bd1e9df..d55f8d1e1e 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -565,6 +565,16 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
>              select = 0;
>          }
>          env->cp15.tfsr_el[el] |= 1 << select;
> +#ifdef CONFIG_USER_ONLY
> +        /*
> +         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
> +         * which then sends a SIGSEGV when the thread is next scheduled.
> +         * This cpu will return to the main loop at the end of the TB,
> +         * which is rather sooner than "normal".  But the alternative
> +         * is waiting until the next syscall.
> +         */
> +        qemu_cpu_kick(env_cpu(env));
> +#endif
>          break;

This does the right thing, but qemu_cpu_kick() is one of those
functions that's in a category of "not used much at all in the
codebase" and which always make me wonder if there's a reason.
(In particular there's exactly one use in the whole of target/
right now.) I suppose the case of "helper function wants to cause
us to leave the TB loop but not to abort the current insn" is
an unusual one...

thanks
-- PMM

