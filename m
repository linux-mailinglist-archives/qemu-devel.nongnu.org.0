Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0516C3BF9DD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:09:46 +0200 (CEST)
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Sqf-0000P2-2m
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SnV-0006Pd-CT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:06:29 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SnQ-00051d-Lf
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:06:29 -0400
Received: by mail-ej1-x629.google.com with SMTP id i20so9198923ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30GVWM/8KrSc2VI2c4MSiCczIiOAR7zEQlc3w70Ez4Y=;
 b=TGRx81HnHL+iSdrt57C1/GJY7+1eYMM+IoG6lQfPBxJSmDiu4E+M0x9eM+yoe95BF+
 /P0wgNkRRnlEQUpQ2IP//iyD54Rh8XqaJzulCEqC+ISPmdpUHrroLTfYFJwoecUAbX+W
 vOdr5e9bjnlVxU00M+EokmKpb86mZiBVdDQ/Vb6DWNG02+oENfJaJpDJ+D/sE08T0wdg
 JlDuFY+mgtiDq6LLqIqoLDbQVVpGGLzUgcXMDXBRedyRY6RG8H7TPBp1p/NHn4AgnrAf
 XfbKr966Iu8xCzm43kDCCT4r0XMyNZaRIEQAqpwhRfO/eUncFxpJvi3a9x9ymS0o2xOg
 dzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30GVWM/8KrSc2VI2c4MSiCczIiOAR7zEQlc3w70Ez4Y=;
 b=qhZB7bwZS1+lp1LXUMjG/VH0XF95o4RsPU19eamMfVdVPK91t09cgwiv3Vsw3vKM4t
 itGH5sBwf7VS0wjRb3RczIC7d5XOalAHZ3e8eBAVhuuR8BfBjPr9KSdoSiMP8QaG7pBR
 Z4JdIhCsKal3nKg8Kik3x9Zm/3Od99eTmHhorVMsDIDqCkseIxNTpjkEwR6ejbR7NMT3
 y6czgdcfUDhGPmT6sEL3qIMdPVBR3gPf6SIJhc8P9LaieBXGwuGSakpGIh9Ct8lN2qvl
 yRKAzKM48X/fHr9tEGq7Vn5trYu3WvlFrt3+9SdoEBZEgQ2SSF058/hAMhyiO1YkJK//
 9iMg==
X-Gm-Message-State: AOAM533KAMl18DBNsk/llDeLxHjY0ZxAd1ezR7JOiSXS4S5du5n0zTMH
 dpdF33rR0VCkmbJhCKpOmglRMYKgx8rBCJeAnCaS9A==
X-Google-Smtp-Source: ABdhPJx7jiCsZ/MinkUB/xB25otFhPjUxnxk+VR1GM0pJdsUZ8cowujV+zmiFUxkG0Swh7S/gTcq5gKcB4ixVNkzeU0=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr9313806ejb.482.1625745982824; 
 Thu, 08 Jul 2021 05:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:05:44 +0100
Message-ID: <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Wed, 30 Jun 2021 at 19:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using gen_goto_tb directly misses the single-step check.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a0c6cfa902..8cd31feeaa 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8582,7 +8582,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
>       * self-modifying code correctly and also to take
>       * any pending interrupts immediately.
>       */
> -    gen_goto_tb(s, 0, s->base.pc_next);
> +    gen_jmp(s, s->base.pc_next);
>      return true;
>  }
>
> @@ -8596,7 +8596,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
>       * for TCG; MB and end the TB instead.
>       */
>      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> -    gen_goto_tb(s, 0, s->base.pc_next);
> +    gen_jmp(s, s->base.pc_next);
>      return true;

Why isn't it enough here just to set is_jmp to DISAS_NEXT ?

thanks
-- PMM

