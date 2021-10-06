Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD056424856
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 22:54:11 +0200 (CEST)
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYDvW-0002sa-IN
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 16:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1mYDtv-0001cD-BW
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:52:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1mYDtr-0000p7-Kg
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:52:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id kk10so3169802pjb.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PyUE378PcRMZf4T0rftRxlOmT9d1r8mAiNORpnFSduA=;
 b=GTfh81bQmW9yw6KuseFKae42+5hyoC2B0F5hztEv0axO3FJgIXfWeZoG/yRd4HeJ9E
 spMnhPAtopNw+LyLLuX+MD9sbgVlRLp2xUuclAyq64tO5Hin3aJB2bSySSORwhVC9Xll
 II/QqP1TQ9JGN7ZCqYtu9ZMACX+uPhCFq5mhCapwM1rjoDa3OtPNv3qx4BclGGdYCsjr
 ZYm3KnUlaYzxEV3pkn9WP2+D7xIQvo7R22GDVIIRByuWBIVEcsZxMSZevDXaJ1xulfJk
 8UtmuMhZBa0SlJVwtsgm3a7PTdlde6wk3C4PzpZxFUlX0rzrBHzhLzQAcjaYT2X+DnBP
 XZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PyUE378PcRMZf4T0rftRxlOmT9d1r8mAiNORpnFSduA=;
 b=R7c42KayTYGERlgWRK5ord6zJirt7F5vbLJ9Gf02r4Kok0lFyXAMbZNKR1NH+AeT5G
 aIR17LfDGF2e5VgMEHG0UAe3d0Y4S6SwXhtAtcjBWQAEka7WnnsEqj2jxGV+jwYnIIn6
 uCZNkfWa641LIRGOcFic68/t9qbhdy9c9lpvukambif3eCTkkta0pmWsS23kPxw2+shm
 pY0Hf5t313xiqqYSbVd7TO6AImaOebno4zcKrjkgZxrVlAY3oV7AkAh6rOrJd3+NrpA8
 PcDstOMqSY+QQ+CuYWONtiJB3YfxeOISvHZEhrX+YFDJmKIeYjQHPFcjLd9Y72xDlNwC
 0zrg==
X-Gm-Message-State: AOAM531fzzKlkVEzL6N+6ap1k6Iur8fusPE7pyZ0ySg2xPx9a7kDJQgm
 KAX/SSTmXtUEnSrzvvmifLA=
X-Google-Smtp-Source: ABdhPJz+ymZBcUkFagGe2sQT8Jvc9lMPyvqSm6/nKd6cMOVq/KPDq1o5lv7V8ia4JZawWPlEXZAoJA==
X-Received: by 2002:a17:90a:e453:: with SMTP id
 jp19mr975406pjb.11.1633553543989; 
 Wed, 06 Oct 2021 13:52:23 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id g19sm5997594pjl.25.2021.10.06.13.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:52:23 -0700 (PDT)
Date: Thu, 7 Oct 2021 05:52:21 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 32/41] linux-user/openrisc: Adjust signal for
 EXCP_RANGE, EXCP_FPE
Message-ID: <YV4Mhaa3RbPl8O3o@antec>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
 <20211006172307.780893-33-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006172307.780893-33-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 10:22:58AM -0700, Richard Henderson wrote:
> The kernel vectors both of these through unhandled_exception, which
> results in force_sig(SIGSEGV).  This isn't very useful for userland
> when enabling overflow traps or fpu traps, but c'est la vie.

Thanks for looking into it.  I am happy to accept kernel patches ;), otherwise
these are now on my todo list.  The FPU support is already something I am
looking to take care of as mentioned before, but that is after I finish getting
the glibc port upstreamed.

That said,

Reviewed-by: Stafford Horne <shorne@gmail.com>

> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/openrisc/cpu_loop.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
> index f6360db47c..de5417a262 100644
> --- a/linux-user/openrisc/cpu_loop.c
> +++ b/linux-user/openrisc/cpu_loop.c
> @@ -56,13 +56,17 @@ void cpu_loop(CPUOpenRISCState *env)
>              break;
>          case EXCP_DPF:
>          case EXCP_IPF:
> -        case EXCP_RANGE:
>              info.si_signo = TARGET_SIGSEGV;
>              info.si_errno = 0;
>              info.si_code = TARGET_SEGV_MAPERR;
>              info._sifields._sigfault._addr = env->pc;
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
> +        case EXCP_RANGE:
> +        case EXCP_FPE:
> +            /* ??? The kernel vectors both of these to unhandled_exception. */
> +            force_sig(TARGET_SIGSEGV);
> +            break;
>          case EXCP_ALIGN:
>              info.si_signo = TARGET_SIGBUS;
>              info.si_errno = 0;
> @@ -77,13 +81,6 @@ void cpu_loop(CPUOpenRISCState *env)
>              info._sifields._sigfault._addr = env->pc;
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
> -        case EXCP_FPE:
> -            info.si_signo = TARGET_SIGFPE;
> -            info.si_errno = 0;
> -            info.si_code = 0;
> -            info._sifields._sigfault._addr = env->pc;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            break;
>          case EXCP_INTERRUPT:
>              /* We processed the pending cpu work above.  */
>              break;
> -- 
> 2.25.1
> 

