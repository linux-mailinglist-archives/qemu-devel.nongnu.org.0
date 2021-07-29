Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C23DA70A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 17:04:18 +0200 (CEST)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m97a5-0000gn-JN
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 11:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97ZH-0008RW-H4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:03:27 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97ZF-0007vX-S5
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:03:27 -0400
Received: by mail-ej1-x632.google.com with SMTP id go31so11219392ejc.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bipTvjqgbnSeU+m9/WXKnxlUKLbtGHGnHI/Djq2nVu0=;
 b=zVN/Vz/+f2OKjvsG+M8uPYeAwGFQaKXtTqrd5PtUpzy07o5S/6W4OnT0aYZoz3S5Mo
 x3SnVtT64Xa/HXOWunAAKUek543d3nE0BLu8RkuzuuqMLVwpmMdUD33kkI48LfqokXxQ
 Y2yb19Jh9QKT/X2g5RgWApE+05W4yuNLqveSgZ1Rg4dUICw6cJlhRraFdFFAAKIpzavn
 lOzGdSivQRcAnkg6b7oaOswBCFJk3GGZwGtBiOtx6CrnrPD1QkUDdYuK4MHyaRrciVeu
 S5LJgr36WRh6NzWzrjgg0csIoFhlh9KTEPyxpsufQ4RHco7UaiKeAXKucbFQq/cwo2P/
 /A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bipTvjqgbnSeU+m9/WXKnxlUKLbtGHGnHI/Djq2nVu0=;
 b=P9ABqORmB8Q/xOT/ZsK2N2VFqVXcyIgUb+H1Ostx2Vpfns9bm8ZKN5e/Pj0TQH5eZD
 M+O36yk2i6CNxiK+xTpeY1x92M7t3R9k0o71MeF7Zj/Csh50ED0aGuemgB8wp4K+q9+R
 RGzjJvtPSi6p3zkPMo5CcCHrdqsFEPwL6Fz2KNsxPPTKUS2U9VHplp4AAybUEJofbkTY
 4nVPLmcVsQdKQSFrlEqxhwUduNaWknJyXbBBxin4k5on9dXHnaUI+eexArprGJHx+066
 YC3D4XJD/2RYXHineRoYMeYIOxCmJniS93Nw7UKFSfuoHiNcW36/xwXY3CbjQ1utopj0
 qJww==
X-Gm-Message-State: AOAM5322a/+OuiidBHUw6K0QttweWFbsUQ1Jx5IQMGrkRlHQwinsUJDU
 lbxbJVp/kV31QaFvwvzbgI+m/hswb9N6tCwZEWbS2A==
X-Google-Smtp-Source: ABdhPJygGOMZ9jKKM/4lCh8rSv2gOMAStSwHhR01P7bZYia9lWfMDmXokEB9mt5V5iL4p/JOp9ITClCmqnp93nG2jxM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr4973173ejy.407.1627571003009; 
 Thu, 29 Jul 2021 08:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-18-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 16:02:40 +0100
Message-ID: <CAFEAcA95v3bfjO23js8sf4wCsTkqeU2f0zCp8z-6wFLr6tqFcA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 17/43] accel/tcg: Report unaligned atomics for
 user-only
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 02:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the newly exposed do_unaligned_access hook from atomic_mmu_lookup,
> which has access to complete alignment info from the TCGMemOpIdx arg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-exec.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 90d1a2d327..dd77e90789 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -852,6 +852,16 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>
>  /* The softmmu versions of these helpers are in cputlb.c.  */
>
> +static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
> +                                 MMUAccessType access_type,
> +                                 int mmu_idx, uintptr_t ra)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, ra);
> +    g_assert_not_reached();
> +}

The softmmu version doesn't g_assert_not_reached(), I think
perhaps with the intent that a CPU implementation could
in some cases return without raising an exception to
mean "continue with the unaligned access". We should decide
whether we want the API to permit that, or else consistently
have both softmmu and useronly versions be marked noreturn
and with an assert, and we should document whichever we choose.


-- PMM

