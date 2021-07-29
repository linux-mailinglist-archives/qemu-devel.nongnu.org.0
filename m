Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870953DA6E3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:53:08 +0200 (CEST)
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m97PH-0000Kh-53
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97OW-00085z-H9
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:52:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97OU-0000jG-Uc
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:52:20 -0400
Received: by mail-ej1-x632.google.com with SMTP id hs10so2511616ejc.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xqAbfq/KK30euInqGkNaG1lGBmeat1tqf1MvopSierY=;
 b=gxcxFR3hof8n6QSjdGOxAT00v0iXbI/lQz8JEGJH7tXz40SdT540SQarI81P7b8O/o
 AIZtFaxgM2NpNAb/rNh9BJUzkH5qcLpcoqVkQzMPSCrEWwmqR9JCVkyFg/MKoeH1Sxqh
 JbXFq1rc9ZpqgxIUPA3y1me8fon6IklQF8D9LhHwTPG4KqbQ2UOYXjeg4pf7L5c7tdBd
 5XsYP1tdW5aynHwb4/XcEoiDo5/lyweW2accyhmViA9lNAjBh0oIxOUb7GCnEgsOq2ge
 G3UklTMlY4KzEL94MgXxT/QucL82yxD/O0MAFeBVg6Ic5GyBpLHWiubZu+ELz6tRsNNn
 D6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqAbfq/KK30euInqGkNaG1lGBmeat1tqf1MvopSierY=;
 b=Ig6pPXsqfrKQ0Uc/0JDSkhLeuYrLrpeLRxOuRd/gTDaO10eBw477qU4pVvw4gid7Ly
 X0ARPWxdZUG9uxdATVv4QMML7PH0+cGbzKaDtJugCY4JZZ0M9abxUZKclRyhSfXTaAQq
 +Z4KNhdu19Ivr5jlmeXigHJyVwIhbEoScU925pzOJS7xSdUZYO7+1ppowEK+EfX8vByO
 LXh9pzvKdHLS1cL23EKtNnFeHETlWgD0x4Rcvqh3s/su+ACgaO5Ro+nFqXVZhOwmnRe7
 sU/qbPco0O419zHUkwgQHKOhraJYg0xgOlD9VW9WQnQJADTBJlc+eVSmrEpFwQKrpbXH
 p1Uw==
X-Gm-Message-State: AOAM530SoeNUX1kmtdMdKLN4/1l2K0dya1t9uQLR4N3B1SFQWndk6n8t
 LOvnrmmBFGZxYUW9GhZCn/i312fSKFMIusK5rzMDtA==
X-Google-Smtp-Source: ABdhPJznsIhfRbxS2HwuyLq4P1DhMCcKp7K/zrwiegWzHb507nvoKN4nPpV9TPyV2cAd2q1HtjCzqgbhXkhwty32oRY=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr4975769ejb.482.1627570337209; 
 Thu, 29 Jul 2021 07:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-15-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 15:51:34 +0100
Message-ID: <CAFEAcA8izWZrXSjQ5i-JB=YEtEYQODLi1fQdsf9GMrU7PyhHzw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 14/43] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 02:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We ought to have been recording the virtual address for reporting
> to the guest trap handler.  Mirror the SFSR FIXME from the sparc64
> version of get_physical_address_data.
>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/ldst_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index 974afea041..7367b48c8b 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -1963,6 +1963,14 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      SPARCCPU *cpu = SPARC_CPU(cs);
>      CPUSPARCState *env = &cpu->env;
>
> +#ifdef TARGET_SPARC64
> +    /* FIXME: ASI field in SFSR must be set */
> +    env->dmmu.sfsr = SFSR_VALID_BIT; /* Fault status register */
> +    env->dmmu.sfar = addr;           /* Fault address register */
> +#else
> +    env->mmuregs[4] = addr;
> +#endif
> +
>      cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
>  }
>  #endif

The architecture manual seems to be gratuitously opaque about
whether and where the fault address for an alignment fault gets
recorded, but Linux at least for 64-bit seems to pull it out of the
sfar, so I guess that's right.

We probably ought to have the "if SFSR_VALID_BIT already set,
set the OW bit". MMUAccessType and mmu_idx give us enough to
set the CT bits and the WRITE bit in the same way we do at
the start of get_physical_address_data().

-- PMM

