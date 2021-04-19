Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3913648CC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:12:27 +0200 (CEST)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXRi-0003Sc-HJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNA-0007V7-Qe
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:07:44 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXN2-0005ZI-Jh
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:07:44 -0400
Received: by mail-ej1-x633.google.com with SMTP id u21so54083379ejo.13
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oAn9amGfCH83/LG4t5Tb6rivYO6zkUaCgSw8hnnqvxs=;
 b=L4A7nczM8upmsFsVmZoN7bDaV1lILmMMl4YMXCWusj6+rgLwG5nvVCqfuiFhwi8UPi
 k6wGLaNnv38nfzPgVJQyT2PpniOBTVkWIz4Mxl6wb1sH/r3C6eNx5e70Ab0E4eOWMcw9
 QOA/U2jSiFuCo5gPwCSC743+OS6MCpaxKONmZqEuaqWqtWr6MRQnQMdVCZDhVGjjdV4p
 KlZe/fx4wbLK210ZG/g+h55RVZwkIaAKRO8RMG43A/BD4FiCW5IOn13MJ5/jwiJxUMwV
 PZOk/tFuxCwGVYbzkF6t8CNzm5BrP7EdAHrQ9ruWaVhsEtSzSC4hx90APBRAjXjEBflO
 VN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oAn9amGfCH83/LG4t5Tb6rivYO6zkUaCgSw8hnnqvxs=;
 b=VRlz4JmkYERS474ms+S9ik1RTXVRWljD5Ol1L9vgaRb2gHvTBQ+Tez16nia3wlTlyv
 P1t5WsEwVRCwXDWLzx8Wrr+uhULOKHQ4u5dNwL8mPijDzOxql6OxM015eqK3bkYL1ma9
 3gLcIAvnd1CHoFa8Bt2zeBwbV/GOomazUsD7+P+G2p06KSCPJy9MdrP68WHB5To9MYY3
 RqWjyri082MGUE2h55atjAb4//LOy8vcY9AP4Hx6sVbvVRmh8llb8NlXYMbPfCtaRMeJ
 HzJxgcdJKlTJxGHWQAzu31Yub820dwSy/cLUgRQEvGMcgqssV8aJtbWFLt+Pmp3lAO76
 NHMw==
X-Gm-Message-State: AOAM533FIN3wG3eTEjTLl9Db8M8elu7V51rRgltY8NV0IrrgwCDDKDLN
 g6edrilW2f5Bf1yhGHc3HMHPve6yfkMGDfrQT8iZkA==
X-Google-Smtp-Source: ABdhPJzoJrwortod0H77Kygcp3gSi9OabYAjFJnsQuLl6W5M5ToPsfvKRzxmwBh9PgJQESf+s3JuejSWAcUEXckkPQU=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr23050887ejh.4.1618852053982; 
 Mon, 19 Apr 2021 10:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-6-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:06:42 +0100
Message-ID: <CAFEAcA9x_bZw5KfSOjgwqV0my5gbSUOtO4yVgA3ruykaDqdHiw@mail.gmail.com>
Subject: Re: [PATCH v4 05/30] target/arm: Introduce CPUARMTBFlags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, 16 Apr 2021 at 20:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for splitting tb->flags across multiple
> fields, introduce a structure to hold the value(s).
> So far this only migrates the one uint32_t and fixes
> all of the places that require adjustment to match.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 26 +++++++++++---------
>  target/arm/translate.h     | 11 +++++++++
>  target/arm/helper.c        | 50 +++++++++++++++++++++-----------------
>  target/arm/translate-a64.c |  2 +-
>  target/arm/translate.c     |  7 +++---
>  5 files changed, 59 insertions(+), 37 deletions(-)

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2769e6fd35..9070b773a9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12984,8 +12984,9 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
>  }
>  #endif
>
> -static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
> -                                      ARMMMUIdx mmu_idx, uint32_t flags)
> +static CPUARMTBFlags
> +rebuild_hflags_common(CPUARMState *env, int fp_el,
> +                      ARMMMUIdx mmu_idx, CPUARMTBFlags flags)

QEMU coding style doesn't generally put a newline before the function
name (here and below).

>  {
>      DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
>      DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));

> @@ -13228,6 +13232,7 @@ void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
>      int el = arm_current_el(env);
>      int fp_el = fp_exception_el(env, el);
>      ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
> +
>      env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
>  }
>

Stray whitespace change.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

