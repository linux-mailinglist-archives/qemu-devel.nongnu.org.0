Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EB3F6600
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:20:14 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIa5s-0001NL-UE
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIa46-0000ak-Jk
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:18:22 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIa44-0006I2-Ph
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:18:22 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u3so45885731ejz.1
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DGWXXEpUYxkMEg0qU6x5OWjCGcSUuemFlIyhGnum15I=;
 b=qSm/oiszdb5hQXN01HEaTuSXwEcMeI23AF7t9T8WzELJ62Qo1rYCkjVQFnPxy2VDvL
 eN5djZvN+S374pMSkS+a2lyp3YF/NgSIEVtbcjJvpg3UuyLX+mFGCBR9bQ7TIzTspP7a
 uvds9HcWvTNV617xxBz11NMmKqAO9ZatUtSwoAAIhW+ixxEoW1CLHSvr/ol6KlUnWL+J
 NpHP/RHOcQPxWaqSb7SjgKQlAHoET6Wse2JXWZ8KGfa6HT08D71MWXMXfPnxCiibNNXY
 jnYJT9B5cwwdIe/aaV5Vb5R915zXsonVaO6c6jrGZXpz6Zm3festNm9+lWedPGoc6EWK
 B84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGWXXEpUYxkMEg0qU6x5OWjCGcSUuemFlIyhGnum15I=;
 b=VAwfaGh3OpuMinGLa7WAxcuzs6yNRPIvLFrN/wztXklEG0Ph8A20DREhi1kxfQF8Iz
 C49qa1nUqEChLqBjWZEYadjcpu5b9vG7xwZAINDg1oEM08wOWLznu3xaeX4rB60v07fr
 5vG1SCo/qTY1UoF3OoP9qAJVXgBvl7yh7+DoOn6KZeCMmhRxtCCVQIwvXjAkoDXbTxQM
 /TX0D7TEJCRZR7grZZGBx/PjWagdJ7wzxBIKhA6BL8Ti3sDoWXsy/d4/NzIXxTuqYFoL
 bigpbPdIhtP3zUxRphOMNWrQBbiPY1dxzgE2w5FOW4vVyhxZOtAZ+zx7ln7zRkoLfCPP
 cl8w==
X-Gm-Message-State: AOAM531cllCrIIdMss3OO5cpZeBLdugqFU2/3UjtM1nimbVH4YGUy1zr
 CSNwhjr63oF//4e/u5Xz5a07vWSVhAhiQ6RDsUfubw==
X-Google-Smtp-Source: ABdhPJy6OfSBS+o/4RZxDXjy+FhZPMHDT3ZyTj9AOZiqIicNf1OKeuH29rcXyfteAuW5TJrUPzzpu7zgY2eaOSv1v1I=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr1204617ejc.4.1629825499075; 
 Tue, 24 Aug 2021 10:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-25-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:17:31 +0100
Message-ID: <CAFEAcA-C_xwxZo2fGsk5Bc36DyFPwOKH_pJgLt8OkSyV=iYZhg@mail.gmail.com>
Subject: Re: [PATCH v2 24/30] linux-user/openrisc: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/openrisc/cpu_loop.c | 37 +++++++++-------------------------
>  1 file changed, 10 insertions(+), 27 deletions(-)
>
> diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
> index b33fa77718..d2632ce6a3 100644
> --- a/linux-user/openrisc/cpu_loop.c
> +++ b/linux-user/openrisc/cpu_loop.c
> @@ -21,13 +21,14 @@
>  #include "qemu-common.h"
>  #include "qemu.h"
>  #include "cpu_loop-common.h"
> +#include "signal-common.h"
> +
>
>  void cpu_loop(CPUOpenRISCState *env)
>  {
>      CPUState *cs = env_cpu(env);
>      int trapnr;
>      abi_long ret;
> -    target_siginfo_t info;
>
>      for (;;) {
>          cpu_exec_start(cs);
> @@ -54,42 +55,24 @@ void cpu_loop(CPUOpenRISCState *env)
>              break;
>          case EXCP_DPF:
>          case EXCP_IPF:
> +            force_sigsegv_for_addr(env->eear);
> +            break;
>          case EXCP_RANGE:
> -            info.si_signo = TARGET_SIGSEGV;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_SEGV_MAPERR;
> -            info._sifields._sigfault._addr = env->pc;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +        case EXCP_FPE:
> +            /* ??? The kernel vectors both of these to unhandled_exception. */

I think that EXCP_RANGE should for us be unreachable in user-only
mode (because it can only happen if the relevant bits in SR are
set, and SR is writeable only in supervisor mode, and its starting
value doesn't set these bits). So we could just delete the EXCP_RANGE
handling and let it hit the default g_assert_not_reached() case.

EXCP_FPE is more tricky -- this happens for FP exceptions, where
the enabling bit is in the FPCSR, which does appear to be writeable
from user mode. So either:
 * our mtspr is wrong and should either be not allowing writes
   to FPCSR in usermode (or at least sanitizing them)
 * the Linux kernel for openrisc is wrong, because a userspace
   program that sets FPCSR.FPEE can make it run into unhandled_exception()
   and die(), and it should be doing something else, like delivering
   a suitable SIGFPE

> +            force_sig(TARGET_SIGSEGV);
>              break;
>          case EXCP_ALIGN:
> -            info.si_signo = TARGET_SIGBUS;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_BUS_ADRALN;
> -            info._sifields._sigfault._addr = env->pc;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->eear);

So we were reporting completely the wrong address previously ?

>              break;
>          case EXCP_ILLEGAL:
> -            info.si_signo = TARGET_SIGILL;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_ILL_ILLOPC;
> -            info._sifields._sigfault._addr = env->pc;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            break;
> -        case EXCP_FPE:
> -            info.si_signo = TARGET_SIGFPE;
> -            info.si_errno = 0;
> -            info.si_code = 0;
> -            info._sifields._sigfault._addr = env->pc;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
>              break;
>          case EXCP_INTERRUPT:
>              /* We processed the pending cpu work above.  */
>              break;
>          case EXCP_DEBUG:
> -            info.si_signo = TARGET_SIGTRAP;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_TRAP_BRKPT;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
>              break;
>          case EXCP_ATOMIC:
>              cpu_exec_step_atomic(cs);
> --
> 2.25.1

thanks
-- PMM

