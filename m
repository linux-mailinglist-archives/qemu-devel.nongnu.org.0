Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC0D3DA075
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:41:20 +0200 (CEST)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92XW-0001WL-PL
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m92Wf-0000o6-JY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:40:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m92Wd-0000td-Vd
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:40:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id z4so6094000wrv.11
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6l5lwfwQID9sp0TXTvG+elCxkSjwlCRQv1ptEZXCu6s=;
 b=iDrH9RHro96KW3OzRpEbrOFRWnA9yB6n1w8soyVI3q6tE9WMID92KrRfLiiNYAwgWv
 IhKDnTsrSeruxghHTxezjVF4POBcBjQuUrK++SXWPYlQoYINoovRz5LvBPElQsW5BlGm
 d8JT04c8DXOn7BuTnDXCCfnDG9ZAtxUTMO6tFDtfmTa4p5gcEpub0Kd11JfNxMhWiNV8
 eCyu3SFZKi4DEaMgPm3WG4xPimBoPWPLbp9LETjdF1Zn8BqTI5Rp+vc9VkwFDjpqSPEo
 qeWHvJWKj8GAtLla+hwHKsgL+v7TO8VO+Ck+UE8g0WLpWMVrxwkKFkP5u/e6BysmM6WO
 quqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6l5lwfwQID9sp0TXTvG+elCxkSjwlCRQv1ptEZXCu6s=;
 b=Uh5UXIcPjkRpjT8bXjoy6PvalXHcLQDkcOsG+2j7T0qPIiMn3HLsVDKzKWHLwZkDce
 P4Gl91qd2l2hq8hIYbC+gFDi5jq69l8o88dimyIYTIiiikMpN4UvETVbfk7FUlBm44v6
 9gaaKFKEGrBejQKw2N0ns3i6PMq1sJN+s1Pn722U+biVilwZ8WlPh1G02FkljK+XEdqG
 uQ7aWZHrjpqaDxbNcyj6g7z+NeNjC5u63NDrQ8ZvPDXW8V5vXQp+koCjeb6iI4uOpMql
 vdal7YMIZAZCoAAJWuMOmXzZSa4oQt0PpEhWpeGcupv+uYlMUgNcg2x32OWmb5eHH1Kb
 c2ew==
X-Gm-Message-State: AOAM532LMwbwiizkuwu7d+PoAQKSbc04VIpFXd5R+htU+jk6lgch9bjY
 DOqStgJY1l4qqg4pCZYnY60=
X-Google-Smtp-Source: ABdhPJyA9rErbRoHC38jT0DWoFhhyy8RBFXVoYQupAJ4YlLXNsA7Qr1Vmz5/1SreXBhX+moUpwbayg==
X-Received: by 2002:a5d:5645:: with SMTP id j5mr3771158wrw.426.1627551622551; 
 Thu, 29 Jul 2021 02:40:22 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id t17sm2342039wmq.17.2021.07.29.02.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 02:40:21 -0700 (PDT)
Subject: Re: [PATCH for-6.2 15/43] target/sparc: Implement do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <68561c03-5cc0-700f-2e64-fd348fb85a78@amsat.org>
Date: Thu, 29 Jul 2021 11:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sparc/cpu_loop.c | 11 +++++++++++
>  target/sparc/cpu.c          |  2 +-
>  target/sparc/ldst_helper.c  |  2 --
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index 02532f198d..612e77807e 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -272,6 +272,17 @@ void cpu_loop (CPUSPARCState *env)
>                  queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              }
>              break;
> +        case TT_UNALIGNED:
> +            info.si_signo = TARGET_SIGBUS;
> +            info.si_errno = 0;
> +            info.si_code = TARGET_BUS_ADRALN;
> +#ifdef TARGET_SPARC64
> +            info._sifields._sigfault._addr = env->dmmu.sfar;
> +#else
> +            info._sifields._sigfault._addr = env->mmuregs[4];
> +#endif
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            break;
>          case EXCP_DEBUG:
>              info.si_signo = TARGET_SIGTRAP;
>              info.si_errno = 0;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec74..d33d41e837 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -865,11 +865,11 @@ static const struct TCGCPUOps sparc_tcg_ops = {
>      .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
>      .tlb_fill = sparc_cpu_tlb_fill,
> +    .do_unaligned_access = sparc_cpu_do_unaligned_access,
>  
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = sparc_cpu_do_interrupt,
>      .do_transaction_failed = sparc_cpu_do_transaction_failed,
> -    .do_unaligned_access = sparc_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>  #endif /* CONFIG_TCG */
> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index 7367b48c8b..69b812e68c 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -1954,7 +1954,6 @@ void sparc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>  }
>  #endif
>  
> -#if !defined(CONFIG_USER_ONLY)
>  void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                                   MMUAccessType access_type,
>                                                   int mmu_idx,
> @@ -1973,4 +1972,3 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>  
>      cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
>  }
> -#endif
> 

Somewhere around this patch I get:

  SKIPPED signals on sparc64 because BROKEN awaiting sigframe clean-ups
and vdso support
  TEST    test-mmap (default) on sparc64
timeout: the monitored command dumped core
Bus error
make[2]: *** [tests/tcg/multiarch/Makefile.target:49: run-test-mmap]
Error 135
make[1]: *** [tests/tcg/Makefile.qemu:102: run-guest-tests] Error 2
make: *** [tests/Makefile.include:63: run-tcg-tests-sparc64-linux-user]
Error 2

