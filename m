Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5955B8D0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:58:07 +0200 (CEST)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kZK-0000uT-E2
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kRh-0008QC-GN
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:50:13 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kRf-0004nY-Cc
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:50:13 -0400
Received: by mail-ej1-x62c.google.com with SMTP id mf9so17747986ejb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=G1NP9pF6eQiQmWQjXw0mEjIqckkVit02uEa8c5JDpg0=;
 b=a7mZDTy6rI5HS0kl+WsuNeaQWFkr84Ji16lE7y8uBPUsgy2+OvQ5Augx16RQz62deg
 Wylfnuz1CnjsH3gL6HOQtrQeTafbWzKx2HbuY3nYcrRiEaDJ66WZJDyN+ZNi+HeQSuAz
 Ihl7NRMoVwVwPGbwASdv2xlOB+P/cW/U5zXDUkpomE/JHJteJEUdG4g2WyeSlA5bNaqq
 zYhLPAdFqGPJbUnFxh1Kw84Ci/Kw3v0Lhf22M3HSCF6NFMW9Lx2YPqypx+2tmMbPHQSl
 w6PzGMZEr+nJcr6jmmpVpMvf5Mop5l6j3mTNWUvPmcZ50luqMXnehCkV1uGjtkxNm/gQ
 F5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=G1NP9pF6eQiQmWQjXw0mEjIqckkVit02uEa8c5JDpg0=;
 b=OHYKTMBNbHP+DqY1NJ4qJ/YBcr+GaW3H5m/w2lDy0OfSCoils8kyiZx2Rs11JvE7yh
 8/OfEyrurill9MFzcmuhk6LA0CmLajnka28WA4b0OZvG2SLYEwnmNd5RxEqyg68U7FVP
 qQrQClPLIMKetPBF6UtfmPBrd4tPL9PexuS9h7mjFC49j9WC5ykRrOgoOTasbFyywOyp
 SU6sOxJf9D862NuOZDp8jqIEnibAOLaPRLyiSIgQJGvUrxIGungIbbjEyT5HHca1BfEP
 /NHFx16ApT4nhsTYUeIIwtSvVKmjgls+R8da33D17m/ZTFrLBDRaKuQjaifj0r3feNkC
 z9dg==
X-Gm-Message-State: AJIora8BhVFDeY9/229LIIi+YuuoO9Wh5oMDkp11o2i6BgLF3HUWtUOY
 MlOcxpFE7ROZNwPa2VLHZymGfQ==
X-Google-Smtp-Source: AGRyM1sskMFyMRDOR6zAVGszbyQsdK43aylE2hcZn8GtPMSnSYJiujdg4E7+N6o3Op7p6QYuiz56aQ==
X-Received: by 2002:a17:906:478e:b0:722:f84d:159f with SMTP id
 cw14-20020a170906478e00b00722f84d159fmr11769396ejc.182.1656319808455; 
 Mon, 27 Jun 2022 01:50:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a170906815500b00722e7e26d22sm4766336ejw.58.2022.06.27.01.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 01:50:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74EBC1FFB7;
 Mon, 27 Jun 2022 09:50:06 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-25-richard.henderson@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 24/53] semihosting: Split out common-semi-target.h
Date: Mon, 27 Jun 2022 09:48:21 +0100
In-reply-to: <20220607204557.658541-25-richard.henderson@linaro.org>
Message-ID: <87sfnqlcch.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Move the ARM and RISCV specific helpers into
> their own header file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/common-semi-target.h   | 62 ++++++++++++++++++++
>  target/riscv/common-semi-target.h | 50 ++++++++++++++++
>  semihosting/arm-compat-semi.c     | 94 +------------------------------
>  3 files changed, 113 insertions(+), 93 deletions(-)
>  create mode 100644 target/arm/common-semi-target.h
>  create mode 100644 target/riscv/common-semi-target.h
>
> diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-tar=
get.h
> new file mode 100644
> index 0000000000..629d75ca5a
> --- /dev/null
> +++ b/target/arm/common-semi-target.h
> @@ -0,0 +1,62 @@
> +/*
> + * Target-specific parts of semihosting/arm-compat-semi.c.
> + *
> + * Copyright (c) 2005, 2007 CodeSourcery.
> + * Copyright (c) 2019, 2022 Linaro
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_ARM_COMMON_SEMI_TARGET_H
> +#define TARGET_ARM_COMMON_SEMI_TARGET_H
> +
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/arm/boot.h"
> +#endif
> +
> +static inline target_ulong common_semi_arg(CPUState *cs, int argno)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +    if (is_a64(env)) {
> +        return env->xregs[argno];
> +    } else {
> +        return env->regs[argno];
> +    }
> +}
> +
> +static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +    if (is_a64(env)) {
> +        env->xregs[0] =3D ret;
> +    } else {
> +        env->regs[0] =3D ret;
> +    }
> +}
> +
> +static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
> +}
> +
> +static inline bool is_64bit_semihosting(CPUArchState *env)
> +{
> +    return is_a64(env);
> +}
> +
> +static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +    return is_a64(env) ? env->xregs[31] : env->regs[13];
> +}
> +
> +static inline bool common_semi_has_synccache(CPUArchState *env)
> +{
> +    /* Ok for A64, invalid for A32/T32 */
> +    return is_a64(env);
> +}
> +
> +#endif
> diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi=
-target.h
> new file mode 100644
> index 0000000000..7c8a59e0cc
> --- /dev/null
> +++ b/target/riscv/common-semi-target.h
> @@ -0,0 +1,50 @@
> +/*
> + * Target-specific parts of semihosting/arm-compat-semi.c.
> + *
> + * Copyright (c) 2005, 2007 CodeSourcery.
> + * Copyright (c) 2019, 2022 Linaro
> + * Copyright =C2=A9 2020 by Keith Packard <keithp@keithp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
> +#define TARGET_RISCV_COMMON_SEMI_TARGET_H
> +
> +static inline target_ulong common_semi_arg(CPUState *cs, int argno)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    return env->gpr[xA0 + argno];
> +}
> +
> +static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    env->gpr[xA0] =3D ret;
> +}
> +
> +static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) =
=3D=3D 8);
> +}
> +
> +static inline bool is_64bit_semihosting(CPUArchState *env)
> +{
> +    return riscv_cpu_mxl(env) !=3D MXL_RV32;
> +}
> +
> +static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    return env->gpr[xSP];
> +}
> +
> +static inline bool common_semi_has_synccache(CPUArchState *env)
> +{
> +    return true;
> +}
> +
> +#endif
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 50f40a2a1a..5e442e549d 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -46,9 +46,6 @@
>  #else
>  #include "qemu/cutils.h"
>  #include "hw/loader.h"
> -#ifdef TARGET_ARM
> -#include "hw/arm/boot.h"
> -#endif
>  #include "hw/boards.h"
>  #endif
>=20=20
> @@ -182,96 +179,7 @@ static LayoutInfo common_semi_find_bases(CPUState *c=
s)
>=20=20
>  #endif
>=20=20
> -#ifdef TARGET_ARM
> -static inline target_ulong
> -common_semi_arg(CPUState *cs, int argno)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -    CPUARMState *env =3D &cpu->env;
> -    if (is_a64(env)) {
> -        return env->xregs[argno];
> -    } else {
> -        return env->regs[argno];
> -    }
> -}
> -
> -static inline void
> -common_semi_set_ret(CPUState *cs, target_ulong ret)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -    CPUARMState *env =3D &cpu->env;
> -    if (is_a64(env)) {
> -        env->xregs[0] =3D ret;
> -    } else {
> -        env->regs[0] =3D ret;
> -    }
> -}
> -
> -static inline bool
> -common_semi_sys_exit_extended(CPUState *cs, int nr)
> -{
> -    return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
> -}
> -
> -static inline bool is_64bit_semihosting(CPUArchState *env)
> -{
> -    return is_a64(env);
> -}
> -
> -static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -    CPUARMState *env =3D &cpu->env;
> -    return is_a64(env) ? env->xregs[31] : env->regs[13];
> -}
> -
> -static inline bool common_semi_has_synccache(CPUArchState *env)
> -{
> -    /* Ok for A64, invalid for A32/T32. */
> -    return is_a64(env);
> -}
> -#endif /* TARGET_ARM */
> -
> -#ifdef TARGET_RISCV
> -static inline target_ulong
> -common_semi_arg(CPUState *cs, int argno)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    return env->gpr[xA0 + argno];
> -}
> -
> -static inline void
> -common_semi_set_ret(CPUState *cs, target_ulong ret)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    env->gpr[xA0] =3D ret;
> -}
> -
> -static inline bool
> -common_semi_sys_exit_extended(CPUState *cs, int nr)
> -{
> -    return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) =
=3D=3D 8);
> -}
> -
> -static inline bool is_64bit_semihosting(CPUArchState *env)
> -{
> -    return riscv_cpu_mxl(env) !=3D MXL_RV32;
> -}
> -
> -static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    return env->gpr[xSP];
> -}
> -
> -static inline bool common_semi_has_synccache(CPUArchState *env)
> -{
> -    return true;
> -}
> -#endif
> +#include "common-semi-target.h"
>=20=20
>  /*
>   * The semihosting API has no concept of its errno being thread-safe,


--=20
Alex Benn=C3=A9e

