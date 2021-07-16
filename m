Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798D3CB4C0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:55:10 +0200 (CEST)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Jcj-0007sR-66
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Jbn-0006kk-53
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:54:11 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Jbl-00058u-I2
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:54:10 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hd33so14014883ejc.9
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vpSpKzYYBQIwAA+UOU1jEA9BQ3CBxboBve4d7oS3lLw=;
 b=WWY+hISo61UA3iK6zlJ/gP+4SeryNk1HBTMV2WWiIQXt0gtCeFez+NIeYbUWGLFnOJ
 lBuwOpdn158jp+OFo/ihV3PrZEyJ4YnCZjCAW7zCHr0Y5JqHHWMSCF4Pg4wr1dRbCNbk
 IPgDpo5n+0EJ9CdbdOFGZ8h6NwSEiPN5WZ48ojy3nmBEDJDW/LBusj3ZT60VaIfO1x3L
 6keHOfSwkR1N8Hri3w8R/eVKHEfPHp2ZZVR+1CkGp3mt7cunx6M02mnoeE9kjIPYrYMh
 uTbyOqXI5+fIfHWn65NUBTS7/Ho/SpI3+Bon6AcHlVi90qCW8Tnk1FrY28bexnyrVOkk
 9fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vpSpKzYYBQIwAA+UOU1jEA9BQ3CBxboBve4d7oS3lLw=;
 b=cEpE6fpGaegnuMAbpFVDChjWj7xLMNbFytESR/uVbXbDLJdjiwGfYNFxcyUkhm5jYH
 MHYJdF98dqYXE9ZSxTB0D1//COUIx6RR3/FX+hXwqe1GxlHbEvytabfhPHXbXD9BsJAL
 4WExzrG2LhwM/xeZL/6Y9mPYAwWTkZv+t9ELnx1/ASuadqamnXI9Qdtj7MEg6VBsTa01
 O2ccTuD9DxJUkMOCyrm5ljNoDYL7Bg086uj67rwQEISsq3A8zdFz1v2ctkXK3qFxYlBD
 cilKKMFKXuLWisBItJKTE1QTHJxm1ow0CCfJvZLYKZ6wvmFOHZQsguLwFtze3PFU5C/w
 zfQQ==
X-Gm-Message-State: AOAM530v3B8sMDNLH2sCOGgeno/cfDOGHADcDOBUhEKyFzATI7kxA+WM
 oRPFPsq+QeeE5uj10BOEJ806FuUJd6EiiCQeYFgz3A==
X-Google-Smtp-Source: ABdhPJyKzgndFPkqQgjQBKYqvKwpXwr+1wd4otHx1PqQaaPnfYxCKu2jg+K5Dda2dvmj71NlNpKxAE2ptyxtFgM8bNc=
X-Received: by 2002:a17:906:382:: with SMTP id b2mr3768540eja.85.1626425647708; 
 Fri, 16 Jul 2021 01:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210714180635.1648966-1-richard.henderson@linaro.org>
 <20210714180635.1648966-2-richard.henderson@linaro.org>
In-Reply-To: <20210714180635.1648966-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 09:53:27 +0100
Message-ID: <CAFEAcA9B8Pb6cjj3ArkrzqfCVtdY_fB4jSCK3kUGeAGQBVJw2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Export aarch64_sve_zcr_get_valid_len
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Wed, 14 Jul 2021 at 19:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from sve_zcr_get_valid_len and make accessible
> from outside of helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 2 ++
>  target/arm/helper.c | 8 +++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index be9a4dceae..52e99344c5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1060,6 +1060,8 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>  int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>                               int cpuid, void *opaque);
>
> +uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);

We only need this in cpu.c, I think, so I would favour putting it
in internals.h. A brief comment defining its purpose would also be good.

> +
>  #ifdef TARGET_AARCH64
>  int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 910ace4274..a49067c115 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6454,11 +6454,13 @@ int sve_exception_el(CPUARMState *env, int el)
>      return 0;
>  }
>
> -static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
> +uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
>  {
>      uint32_t end_len;
>
> -    end_len = start_len &= 0xf;
> +    start_len = MIN(start_len, ARM_MAX_VQ - 1);
> +    end_len = start_len;
> +

This seems to also be making a functional change? That should be
a separate patch.

>      if (!test_bit(start_len, cpu->sve_vq_map)) {
>          end_len = find_last_bit(cpu->sve_vq_map, start_len);
>          assert(end_len < start_len);
> @@ -6484,7 +6486,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
>          zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
>      }
>
> -    return sve_zcr_get_valid_len(cpu, zcr_len);
> +    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
>  }

thanks
-- PMM

