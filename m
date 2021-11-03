Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1BA4449A1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:37:16 +0100 (CET)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miN0V-0000pP-QL
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1miMyR-0007kb-Nm
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:35:07 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1miMyP-0002e0-Uv
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:35:07 -0400
Received: by mail-pf1-x431.google.com with SMTP id k2so3574950pff.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cA/fKGE/3stnu4kssxdK5TA/DvKfUqIkUftgcl0v5x8=;
 b=NxabTcALf3aH4wlJ8gjkL+6JY74wIRq9NB/wdN/4CeaLgGYjm7y43j/e2l12RHJ8e9
 BWxPwHuWuv8uAQgl79ZskziickvEfzOYyrQl3ardw5/MyqsLGyWuHHCjOK0//6JMjWpX
 ref2ALY6h2niPReFSybZbpViptawNBcxbLq6C3yqc3z1Hxabx1/OB/EH1opgoRCzFcEo
 7gQg8P/dgJ94LhP52BDGbjPk+IS5wkR2E5iVgi8KGAoQMO8aasdbEuersDzJKcQg/ktk
 SzFnWQ9hgqTSXwOgS98Cvl3Ske6Lba4pb/GGFdv2eMp+F7/2fjtqrOpEmPhnaDaOZ92R
 p+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cA/fKGE/3stnu4kssxdK5TA/DvKfUqIkUftgcl0v5x8=;
 b=0BWJ5RtOTWULZTw3VoIXok15jX6sQb5r13G1KqQtFgUYFCyE77kEKWEoI9FbFKnQB6
 8rGBBiyrTwIhdIhnGcBsKoV7oLc5lUe7RfAWT8LiNUtQFBECafkKdkh1F3JGCs6BnEbZ
 94AFu69WxtJOQlyFF1tP5EWYchodnpqLd4nPykaIFexqFHEnZYuXKOoNwnp33G3mx5Oh
 rUC9cnUfm1dPPbXeT+71jSDd/oIQXSsu0BCeh4py2p7CHrajI53L8a95Cncqqr7Scy8D
 po2MIN6j0Murb9LVd6KqxgtvBuOcWM3knwndiSsm2uGoc5G58SQ5z9rIkE+DaoFRm0L3
 MFcQ==
X-Gm-Message-State: AOAM532wOj/185dpvW/+S1qSupj3OnCL8rBol5+lNgO8PQrLr/O3VGqw
 LdEd4+U9zhdKZ3U8wcPFXyk=
X-Google-Smtp-Source: ABdhPJza1Ex6pHajeCKyDxbOdlWG2QmEZwyEaIdiVa6KVAI9VUw6NgfvWSt1pJpd0s5T+49+VsipFw==
X-Received: by 2002:a63:d00c:: with SMTP id z12mr34192524pgf.334.1635971702894; 
 Wed, 03 Nov 2021 13:35:02 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id x13sm2574056pgt.80.2021.11.03.13.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:35:02 -0700 (PDT)
Date: Thu, 4 Nov 2021 05:35:00 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 17/23] linux-user/openrisc: Use force_sig_fault
Message-ID: <YYLydENWr/JMZZS8@antec>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
 <20211103140847.454070-18-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103140847.454070-18-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 10:08:41AM -0400, Richard Henderson wrote:
> Use the new function instead of setting up a target_siginfo_t
> and calling queue_signal. Fill in the missing PC for SIGTRAP.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/openrisc/cpu_loop.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
> index 3cfdbbf037..9b3d6743d2 100644
> --- a/linux-user/openrisc/cpu_loop.c
> +++ b/linux-user/openrisc/cpu_loop.c
> @@ -29,7 +29,6 @@ void cpu_loop(CPUOpenRISCState *env)
>      CPUState *cs = env_cpu(env);
>      int trapnr;
>      abi_long ret;
> -    target_siginfo_t info;
>  
>      for (;;) {
>          cpu_exec_start(cs);
> @@ -55,27 +54,16 @@ void cpu_loop(CPUOpenRISCState *env)
>              }
>              break;
>          case EXCP_ALIGN:
> -            info.si_signo = TARGET_SIGBUS;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_BUS_ADRALN;
> -            info._sifields._sigfault._addr = env->pc;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->eear);
>              break;
>          case EXCP_ILLEGAL:
> -            info.si_signo = TARGET_SIGILL;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_ILL_ILLOPC;
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

This looks ok to me.

Reviewed-by: Stafford Horne <shorne@gmail.com>

