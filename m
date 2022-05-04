Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A786B519B0E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:02:18 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAtk-0000kL-2t
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmAqy-0008IO-DB
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:59:24 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmAqw-0006vX-Pm
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:59:24 -0400
Received: by mail-il1-x136.google.com with SMTP id l15so487474ilh.3
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AgzBIu2MkfwJXHL+jQOIW/WWRLv7bJA+qAqIlqGEgYk=;
 b=qP+/GMPB6iMAUiSESHszpsljd5qEbXWc8BVSHJ20UrOVVZG/Ov13E1ipSvE4PXNv0c
 QPWhCxGWSeQNFl3cPhSi3ng+LROIXxcosUhA+4+ErWI85HZytl7awKs0l0clJziPpSqV
 VUl8SMlAZsYuiDKJ1H5oPhegv7NJuv3hpsjLG5GXXFwndkTpmouTmHBhpWouu7yEjE0u
 hJTRp9iGINTwomEvfpG/Zcqk3eK4jGL35Fc8FDaQ0zTJ+LBdtYlpmOBi+K+kP5ujsACv
 w6ufCub5nuJXoa/BLJfZmPiLbyZ49bk5AtkW5KaJGgLKoVBZJr+l1thpa1S4skI0PPzL
 +lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AgzBIu2MkfwJXHL+jQOIW/WWRLv7bJA+qAqIlqGEgYk=;
 b=flJ1ro3HWvK473fjfPxOkPCmjuuxtUBnKv20dMcqCqa84gu7jl9WA3r1zBwDBgCNrl
 1Kya+qS9rdRzn4AiQ2dYv78iBTEym5010Px2ADI8O9pz2iMmwf9/7WhPEqPJevfS4hCj
 NhZJjA76QNPr8W+mkZEJwMTeCiGAuNR3kLfHpNfQQhHa2zkcqdzd5Q1PzdZCQSHd2u7Y
 PYE79ovzotzpie3Z0C6QJ6Z5+CWieeG8cO/KS5djMf7PIY6xaLMS4Mu5CFsIzB87+dD3
 0dE5Kj7KiegXHrdJGTBNNr5j9xSCbXGvK0i1DOyHD/Qz4HTFb3n9shaw0IJSJIUtMFF4
 6YWw==
X-Gm-Message-State: AOAM532y22zwKy82bRQylfeQBUUbVRr5oG6bGmDRbw3xE3ntQO7BbuWn
 mc4AB6n2ZrDbUt4yxcsH98XVgYaYEv1JcffDALk=
X-Google-Smtp-Source: ABdhPJxGz/21+opvfu7AXka3XA3RKfrBAYhWoPbueY8VuLmq0UsyT9IDMm5iypaBDSwVbXJo93GMCa2vZuQYpFalVXI=
X-Received: by 2002:a92:db0e:0:b0:2cc:2590:767b with SMTP id
 b14-20020a92db0e000000b002cc2590767bmr8790239iln.260.1651654759587; Wed, 04
 May 2022 01:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-17-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-17-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 May 2022 18:58:53 +1000
Message-ID: <CAKmqyKNL6G05im5_vohX8r5Rikt_kBww-vMG17NAOq+-euqChw@mail.gmail.com>
Subject: Re: [PATCH v2 16/74] semihosting: Split is_64bit_semihosting per
 target
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 4, 2022 at 6:11 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have some larger ifdef blocks for ARM and RISCV;
> split the function into multiple implementations per arch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  semihosting/arm-compat-semi.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index a6c6e5baf6..7fc60e223a 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -213,6 +213,10 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
>      return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
>  }
>
> +static inline bool is_64bit_semihosting(CPUArchState *env)
> +{
> +    return is_a64(env);
> +}
>  #endif /* TARGET_ARM */
>
>  #ifdef TARGET_RISCV
> @@ -238,6 +242,10 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
>      return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
>  }
>
> +static inline bool is_64bit_semihosting(CPUArchState *env)
> +{
> +    return riscv_cpu_mxl(env) != MXL_RV32;
> +}
>  #endif
>
>  /*
> @@ -586,17 +594,6 @@ static const GuestFDFunctions guestfd_fns[] = {
>   * call if the memory read fails. Eventually we could use a generic
>   * CPUState helper function here.
>   */
> -static inline bool is_64bit_semihosting(CPUArchState *env)
> -{
> -#if defined(TARGET_ARM)
> -    return is_a64(env);
> -#elif defined(TARGET_RISCV)
> -    return riscv_cpu_mxl(env) != MXL_RV32;
> -#else
> -#error un-handled architecture
> -#endif
> -}
> -
>
>  #define GET_ARG(n) do {                                 \
>      if (is_64bit_semihosting(env)) {                    \
> --
> 2.34.1
>
>

