Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7A2FB9B6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:43:33 +0100 (CET)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sEG-0001vO-FL
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sDE-0000hU-OD
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:42:28 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sDD-0004xT-1C
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:42:28 -0500
Received: by mail-ed1-x534.google.com with SMTP id h16so21794950edt.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/iN7xLzgXKJPPm8eoR3TWJSVurUzEhxLRA/UGq415gs=;
 b=FmDLjkwWH2B3MnjNScPr0h0ZD8XubN2uk7DQTfKJp4uYLU0hrU28Ymyxu80nZB0PmB
 0aK330BjYWWwHouBroSTP24og3wF41QuFFT6rCERufBdU0xXtG8rR/Y3CpKD/tDPpSi1
 H7dzNfkTglzWOImw6sECjwPbNF2CPI0dn16HaQqT9XCsK0U+/Hr1lN82iBKMh9IvBr9T
 3mlwgbLwVqMQfj59SHAQyauMYDRGXz7tzlUo52scKDvT2QV8R7rc7r1Txh8P2fRSmRJa
 ywa6lYorbRW5iqukKzTd1wtzzqy0Ri/sLAesLyN8dg0YX6akt2rmDlXOFlr3MUd4oFHy
 A20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/iN7xLzgXKJPPm8eoR3TWJSVurUzEhxLRA/UGq415gs=;
 b=lZ+hR4Pi4cu4CpKeG+7+Qa/g7Oz1OpK9tn0E3y1+8mqmg1OyU7XIKEmXubc7W6FqM9
 GRyIVHcIidlhy75OBAJ+uD2MBSV7BAf+h0cPKp6wZExH5lKRKkRV/uTJzToayLIMwx3o
 1VxJqkJXvT2/K63A9Dd+XoMvYe37H9AoajfXl3tFDvR06brn/n+AAuEA1ZCsEngL0XFp
 HDAF8cqTPVCdrXSgNa6YoqFN+NBG5K5yh4Qyf/caKE4OOiF01ygjaJxJxg7pSGQQ1r0Y
 PNuBG1mCi2QoA1aXj7KX3a4MBvNplHGplzes3VBD7N1UWCdepUB7S2XZMkdpMsC/V9gI
 QXZA==
X-Gm-Message-State: AOAM530tGb2ZI65oXldJ3VQASfYq2AZZGIOzTeI0wEpJdgYu0Dh7LJ+J
 KR8HRgq61cSL0tMZ1Pqv9zP+1cMq09GoJDmakOKa72N3SI4=
X-Google-Smtp-Source: ABdhPJzygSYdC+m+8t+JeB9etm4sa6+ZPLvM6JkgpOEuctydY9/sV4d7srfPtznE7SN8cYOPsZE9CAnOfnw+r5B9eZQ=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr3633583eds.204.1611067345404; 
 Tue, 19 Jan 2021 06:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-5-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:42:14 +0000
Message-ID: <CAFEAcA-6Zs+CcV=xa6XK+8Upz4v6baFOrNUrg+dnZRFYL204VA@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] tcg/arm: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Fri, 15 Jan 2021 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target-con-str.h | 22 ++++++++++++
>  tcg/arm/tcg-target.h         |  1 +
>  tcg/arm/tcg-target.c.inc     | 69 +++++++-----------------------------
>  3 files changed, 36 insertions(+), 56 deletions(-)
>  create mode 100644 tcg/arm/tcg-target-con-str.h
>
> diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
> new file mode 100644
> index 0000000000..2451ec6c7f
> --- /dev/null
> +++ b/tcg/arm/tcg-target-con-str.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Define Arm target-specific operand constraint.

"constraints" (check if you copied-and-pasted this into
other headers).

> + * Copyright (c) 2021 Linaro
> + */
> +

> -    /* qemu_ld address */
> -    case 'l':
> -        ct->regs = 0xffff;
>  #ifdef CONFIG_SOFTMMU
> -        /* r0-r2,lr will be overwritten when reading the tlb entry,
> -           so don't use these. */
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R0);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R1);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R2);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R14);
> +#define ALL_QLOAD_REGS \
> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
> +                          (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
> +                          (1 << TCG_REG_R14)))
> +#define ALL_QSTORE_REGS \
> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
> +                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
> +                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
> +#else
> +#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
> +#define ALL_QSTORE_REGS \
> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
>  #endif
> -        break;
> -
> -    /* qemu_st address & data */
> -    case 's':
> -        ct->regs = 0xffff;
> -        /* r0-r2 will be overwritten when reading the tlb entry (softmmu only)
> -           and r0-r1 doing the byte swapping, so don't use these. */
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R0);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R1);
> -#if defined(CONFIG_SOFTMMU)
> -        /* Avoid clashes with registers being used for helper args */
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R2);
> -#if TARGET_LONG_BITS == 64
> -        /* Avoid clashes with registers being used for helper args */
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
> -#endif
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_R14);
> -#endif
> -        break;

Seems a bit of a shame to lose the commentary about why we
need to exclude some of the registers.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

