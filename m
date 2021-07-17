Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649153CC4DB
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:32:59 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oBN-0000bM-Uo
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oA4-0007RS-H3
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:31:36 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oA2-0003KM-Pi
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:31:36 -0400
Received: by mail-ed1-x531.google.com with SMTP id h8so17256346eds.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9EWeR1Q8LnUWeICswn1HvpqwY/yx6O6fd4hjlKy++Y=;
 b=DV7XS3lHrk2gT6snv1Hyg9quPudbIph3B6aktGmVViyZbO7LmPMmzHowKnqdoELuQ9
 klw6Con8nYom6gTtnJ7qarJswSd51bVgJOSCrCCHEimHPfQHM7LXzAtddS0sAZdqSFvk
 QLB5m9fHqdMIVvlIHqV365wfg0uwld2+35FiKyZ2Qfsz9T1EFBPZoooD6IMPQTu0poJ/
 wRr6YvK/8kJfoccLG7ytBG0W6MrONwfJpZULenQ40oZ7CPaToZnAqVC7kBdvYJcxo9Ed
 5YfOYeRIzk/vCG+G3iQmok/UFrXsPZqBDQZRIeBxu2fsKj+HvZrkUQqnz55tm3NFIaND
 eL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9EWeR1Q8LnUWeICswn1HvpqwY/yx6O6fd4hjlKy++Y=;
 b=nRTJl1dd+nmADdpQ+ahFH6zQiJaLr63crZBK1p6FUznRlPofPDxBzM3Wd+49Lnl50V
 d/9sDXGS8mZj8vRMkBr57Cq1P7MxACBu5HhqTv8VnjiFVtXCH9ohIH3Opyh+zfhcNkG8
 N872fma7dYLd4nuTZSvTV3KhyZpoNDAImxK1+BIwoG7B20Rzvl/pZyOhNm94YnfeVsQG
 ybX9nQoL2q9++8PmE1Y9LixeKtWO/pEfbowXkfbhtsyIikJF+aYuS+f/HYoGfOn2tU54
 E3t02Ol4zJdVi+joG1vhlhhyP6mOxWC/jZk2oo9iWYakYKcVoHedqYweLzD2jJrmUEyp
 XDCg==
X-Gm-Message-State: AOAM532EmTSVSCpzJ10DtxZMkBGLIyT+2Tzc9jYjM1r/ThzSVlP3qe4C
 pE/HNSSq12cLeiwpQxjknS6Pad1QN0xaiCtzJMf9zQ==
X-Google-Smtp-Source: ABdhPJyf7FbmVZAVq3Bhz5k1mRS4/Up0NQCJ43NbigwihbuCtQ0ZDD5zMANMu92/849rVhFqHicW9mLBvT2Sj+uaPmQ=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr22775639eds.204.1626543092653; 
 Sat, 17 Jul 2021 10:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-2-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:30:52 +0100
Message-ID: <CAFEAcA_iPBPUUP-pjM6jkLHCjftgeKeSWMT6s_QHes0mPU7PNg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The space reserved for CF_COUNT_MASK was overly large.
> Reduce to free up cflags bits and eliminate an extra test.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h   | 4 +++-
>  accel/tcg/translate-all.c | 5 ++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 754f4130c9..dfe82ed19c 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -492,7 +492,9 @@ struct TranslationBlock {
>      target_ulong cs_base; /* CS base for this block */
>      uint32_t flags; /* flags defining in which context the code was generated */
>      uint32_t cflags;    /* compile flags */
> -#define CF_COUNT_MASK  0x00007fff
> +
> +/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
> +#define CF_COUNT_MASK  0x000001ff
>  #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
>  #define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
>  #define CF_USE_ICOUNT  0x00020000
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 4df26de858..997e44c73b 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1430,9 +1430,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      if (max_insns == 0) {
>          max_insns = CF_COUNT_MASK;
>      }
> -    if (max_insns > TCG_MAX_INSNS) {
> -        max_insns = TCG_MAX_INSNS;
> -    }
> +    QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
> +

Previously we would allow max_insns = TCG_MAX_INSNS (512).
Now we only allow it to be 511...

-- PMM

