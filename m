Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB739AEBE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 01:36:40 +0200 (CEST)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lowtD-0008Rx-8L
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 19:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowsJ-00076g-Vu
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 19:35:44 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:36615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowsH-0001Aq-1S
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 19:35:43 -0400
Received: by mail-il1-x12c.google.com with SMTP id i13so1475018ilk.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 16:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WulIfimGkJQ0bA/CMM5he1pIhe7Kginn2jx/ecRxVqg=;
 b=gBvW3W/zSUB+RpHubWIyhAc0T+2ymEfyBMR7+0A+pxZmoa0TF5+fhB2aGUhj0NEnaK
 sksH0tV7RemHtepheLkCSja5eGkn/8YDCQTw5NoYLIHCQgQyLUyrzhPXEze2qXMwbUyM
 GXKDBVzTUBOH1vPIY9JuMV5p7ZM21BIt++CVHmtkx3cu5GdkjyVf2WJQR8w1xYelorch
 5um3aox5FG4u/abtMj6bwaofkFIsFnGi7HZ/AFwkS+T8IoUGtsmjHrUec8N7rPEXII6h
 4Dus7ST+BNUGZa/G7o+h3heJjoP8Cgud2mKN++Ig5EEu9ygiEnkS7FIePWXkMpvXrPLl
 aVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WulIfimGkJQ0bA/CMM5he1pIhe7Kginn2jx/ecRxVqg=;
 b=aabXmcIV+HZlnY2jvZTRv7LejFu/vNAW57I8nLA0sb7D4lBwactqFU8mW34Py6ty7r
 Ums+VKkwjESxovSozviGP7b2LEET+dXRaJTp0h6cNVtlhAkAWLojfJOhFIZUBDBWl+AF
 wBQ7KAB3Pf5IXgV+wBaoeP8J59rsm5bw+tNJNDnpmB8W/KhdK8gY/KTNW8HhdhsnnEMr
 NAUyLzgBhwPjFAUhs8muekfzZAQwVI9ajmZ3zzXlHeU5KraCoPfa1yIqcwELbji1amGZ
 hwQtXn6KNpQVy+8Go5Vd82y07SjIIj2OOWjD2rjL/zlBE/U1zF6AkNAcy14QtIbEEoWY
 8hwA==
X-Gm-Message-State: AOAM531jGzUtlClNLMjFN2eCEMQeW0vney06NnBIJTG/gs/eNuxNVqUW
 W1JJGCn+vIaN/qy4XFTKiy8xdVtGd620+edbBV0=
X-Google-Smtp-Source: ABdhPJyXECK3/TG6UKB7jEBwaoIFKSGOgwH7V278z7rtzrylPnw5z5lXQfU8NJSM6ufsl1l/tj6m/eHodQJ8qIv8fRc=
X-Received: by 2002:a92:c242:: with SMTP id k2mr1462166ilo.131.1622763340000; 
 Thu, 03 Jun 2021 16:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-3-f4bug@amsat.org>
In-Reply-To: <20210603090310.2749892-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 09:35:14 +1000
Message-ID: <CAKmqyKNLCfL6Rq+Tr3_YKNhfafNww-usMDUs6FisKh9LOtKbEQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/microblaze: Extract FPU helpers to fpu_helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 3, 2021 at 7:05 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Extract FPU helpers to their own file: fpu_helper.c,
> so it is easier to focus on the generic helpers in
> op_helper.c.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/fpu_helper.c | 308 +++++++++++++++++++++++++++++++++
>  target/microblaze/op_helper.c  | 287 +-----------------------------
>  target/microblaze/meson.build  |   1 +
>  3 files changed, 310 insertions(+), 286 deletions(-)
>  create mode 100644 target/microblaze/fpu_helper.c
>
> diff --git a/target/microblaze/fpu_helper.c b/target/microblaze/fpu_helpe=
r.c
> new file mode 100644
> index 00000000000..ce729947079
> --- /dev/null
> +++ b/target/microblaze/fpu_helper.c
> @@ -0,0 +1,308 @@
> +/*
> + *  Microblaze FPU helper routines.
> + *
> + *  Copyright (c) 2009 Edgar E. Iglesias <edgar.iglesias@gmail.com>.
> + *  Copyright (c) 2009-2012 PetaLogix Qld Pty Ltd.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/helper-proto.h"
> +#include "exec/exec-all.h"
> +#include "fpu/softfloat.h"
> +
> +static bool check_divz(CPUMBState *env, uint32_t a, uint32_t b, uintptr_=
t ra)
> +{
> +    if (unlikely(b =3D=3D 0)) {
> +        env->msr |=3D MSR_DZ;
> +
> +        if ((env->msr & MSR_EE) &&
> +            env_archcpu(env)->cfg.div_zero_exception) {
> +            CPUState *cs =3D env_cpu(env);
> +
> +            env->esr =3D ESR_EC_DIVZERO;
> +            cs->exception_index =3D EXCP_HW_EXCP;
> +            cpu_loop_exit_restore(cs, ra);
> +        }
> +        return false;
> +    }
> +    return true;
> +}
> +
> +uint32_t helper_divs(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    if (!check_divz(env, a, b, GETPC())) {
> +        return 0;
> +    }
> +    return (int32_t)a / (int32_t)b;
> +}
> +
> +uint32_t helper_divu(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    if (!check_divz(env, a, b, GETPC())) {
> +        return 0;
> +    }
> +    return a / b;
> +}
> +
> +/* raise FPU exception.  */
> +static void raise_fpu_exception(CPUMBState *env, uintptr_t ra)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +
> +    env->esr =3D ESR_EC_FPU;
> +    cs->exception_index =3D EXCP_HW_EXCP;
> +    cpu_loop_exit_restore(cs, ra);
> +}
> +
> +static void update_fpu_flags(CPUMBState *env, int flags, uintptr_t ra)
> +{
> +    int raise =3D 0;
> +
> +    if (flags & float_flag_invalid) {
> +        env->fsr |=3D FSR_IO;
> +        raise =3D 1;
> +    }
> +    if (flags & float_flag_divbyzero) {
> +        env->fsr |=3D FSR_DZ;
> +        raise =3D 1;
> +    }
> +    if (flags & float_flag_overflow) {
> +        env->fsr |=3D FSR_OF;
> +        raise =3D 1;
> +    }
> +    if (flags & float_flag_underflow) {
> +        env->fsr |=3D FSR_UF;
> +        raise =3D 1;
> +    }
> +    if (raise
> +        && (env_archcpu(env)->cfg.pvr_regs[2] & PVR2_FPU_EXC_MASK)
> +        && (env->msr & MSR_EE)) {
> +        raise_fpu_exception(env, ra);
> +    }
> +}
> +
> +uint32_t helper_fadd(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fd, fa, fb;
> +    int flags;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    fd.f =3D float32_add(fa.f, fb.f, &env->fp_status);
> +
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags, GETPC());
> +    return fd.l;
> +}
> +
> +uint32_t helper_frsub(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fd, fa, fb;
> +    int flags;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    fd.f =3D float32_sub(fb.f, fa.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags, GETPC());
> +    return fd.l;
> +}
> +
> +uint32_t helper_fmul(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fd, fa, fb;
> +    int flags;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    fd.f =3D float32_mul(fa.f, fb.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags, GETPC());
> +
> +    return fd.l;
> +}
> +
> +uint32_t helper_fdiv(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fd, fa, fb;
> +    int flags;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    fd.f =3D float32_div(fb.f, fa.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags, GETPC());
> +
> +    return fd.l;
> +}
> +
> +uint32_t helper_fcmp_un(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fa, fb;
> +    uint32_t r =3D 0;
> +
> +    fa.l =3D a;
> +    fb.l =3D b;
> +
> +    if (float32_is_signaling_nan(fa.f, &env->fp_status) ||
> +        float32_is_signaling_nan(fb.f, &env->fp_status)) {
> +        update_fpu_flags(env, float_flag_invalid, GETPC());
> +        r =3D 1;
> +    }
> +
> +    if (float32_is_quiet_nan(fa.f, &env->fp_status) ||
> +        float32_is_quiet_nan(fb.f, &env->fp_status)) {
> +        r =3D 1;
> +    }
> +
> +    return r;
> +}
> +
> +uint32_t helper_fcmp_lt(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fa, fb;
> +    int r;
> +    int flags;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    r =3D float32_lt(fb.f, fa.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> +
> +    return r;
> +}
> +
> +uint32_t helper_fcmp_eq(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fa, fb;
> +    int flags;
> +    int r;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    r =3D float32_eq_quiet(fa.f, fb.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> +
> +    return r;
> +}
> +
> +uint32_t helper_fcmp_le(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fa, fb;
> +    int flags;
> +    int r;
> +
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    set_float_exception_flags(0, &env->fp_status);
> +    r =3D float32_le(fa.f, fb.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> +
> +
> +    return r;
> +}
> +
> +uint32_t helper_fcmp_gt(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fa, fb;
> +    int flags, r;
> +
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    set_float_exception_flags(0, &env->fp_status);
> +    r =3D float32_lt(fa.f, fb.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> +    return r;
> +}
> +
> +uint32_t helper_fcmp_ne(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fa, fb;
> +    int flags, r;
> +
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    set_float_exception_flags(0, &env->fp_status);
> +    r =3D !float32_eq_quiet(fa.f, fb.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> +
> +    return r;
> +}
> +
> +uint32_t helper_fcmp_ge(CPUMBState *env, uint32_t a, uint32_t b)
> +{
> +    CPU_FloatU fa, fb;
> +    int flags, r;
> +
> +    fa.l =3D a;
> +    fb.l =3D b;
> +    set_float_exception_flags(0, &env->fp_status);
> +    r =3D !float32_lt(fa.f, fb.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> +
> +    return r;
> +}
> +
> +uint32_t helper_flt(CPUMBState *env, uint32_t a)
> +{
> +    CPU_FloatU fd, fa;
> +
> +    fa.l =3D a;
> +    fd.f =3D int32_to_float32(fa.l, &env->fp_status);
> +    return fd.l;
> +}
> +
> +uint32_t helper_fint(CPUMBState *env, uint32_t a)
> +{
> +    CPU_FloatU fa;
> +    uint32_t r;
> +    int flags;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    r =3D float32_to_int32(fa.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags, GETPC());
> +
> +    return r;
> +}
> +
> +uint32_t helper_fsqrt(CPUMBState *env, uint32_t a)
> +{
> +    CPU_FloatU fd, fa;
> +    int flags;
> +
> +    set_float_exception_flags(0, &env->fp_status);
> +    fa.l =3D a;
> +    fd.l =3D float32_sqrt(fa.f, &env->fp_status);
> +    flags =3D get_float_exception_flags(&env->fp_status);
> +    update_fpu_flags(env, flags, GETPC());
> +
> +    return fd.l;
> +}
> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.=
c
> index 58d633584d3..8d20522ee88 100644
> --- a/target/microblaze/op_helper.c
> +++ b/target/microblaze/op_helper.c
> @@ -21,10 +21,8 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/helper-proto.h"
> -#include "qemu/host-utils.h"
> +#include "qemu/log.h"
>  #include "exec/exec-all.h"
> -#include "exec/cpu_ldst.h"
> -#include "fpu/softfloat.h"
>
>  void helper_put(uint32_t id, uint32_t ctrl, uint32_t data)
>  {
> @@ -69,289 +67,6 @@ void helper_raise_exception(CPUMBState *env, uint32_t=
 index)
>      cpu_loop_exit(cs);
>  }
>
> -static bool check_divz(CPUMBState *env, uint32_t a, uint32_t b, uintptr_=
t ra)
> -{
> -    if (unlikely(b =3D=3D 0)) {
> -        env->msr |=3D MSR_DZ;
> -
> -        if ((env->msr & MSR_EE) &&
> -            env_archcpu(env)->cfg.div_zero_exception) {
> -            CPUState *cs =3D env_cpu(env);
> -
> -            env->esr =3D ESR_EC_DIVZERO;
> -            cs->exception_index =3D EXCP_HW_EXCP;
> -            cpu_loop_exit_restore(cs, ra);
> -        }
> -        return false;
> -    }
> -    return true;
> -}
> -
> -uint32_t helper_divs(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    if (!check_divz(env, a, b, GETPC())) {
> -        return 0;
> -    }
> -    return (int32_t)a / (int32_t)b;
> -}
> -
> -uint32_t helper_divu(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    if (!check_divz(env, a, b, GETPC())) {
> -        return 0;
> -    }
> -    return a / b;
> -}
> -
> -/* raise FPU exception.  */
> -static void raise_fpu_exception(CPUMBState *env, uintptr_t ra)
> -{
> -    CPUState *cs =3D env_cpu(env);
> -
> -    env->esr =3D ESR_EC_FPU;
> -    cs->exception_index =3D EXCP_HW_EXCP;
> -    cpu_loop_exit_restore(cs, ra);
> -}
> -
> -static void update_fpu_flags(CPUMBState *env, int flags, uintptr_t ra)
> -{
> -    int raise =3D 0;
> -
> -    if (flags & float_flag_invalid) {
> -        env->fsr |=3D FSR_IO;
> -        raise =3D 1;
> -    }
> -    if (flags & float_flag_divbyzero) {
> -        env->fsr |=3D FSR_DZ;
> -        raise =3D 1;
> -    }
> -    if (flags & float_flag_overflow) {
> -        env->fsr |=3D FSR_OF;
> -        raise =3D 1;
> -    }
> -    if (flags & float_flag_underflow) {
> -        env->fsr |=3D FSR_UF;
> -        raise =3D 1;
> -    }
> -    if (raise
> -        && (env_archcpu(env)->cfg.pvr_regs[2] & PVR2_FPU_EXC_MASK)
> -        && (env->msr & MSR_EE)) {
> -        raise_fpu_exception(env, ra);
> -    }
> -}
> -
> -uint32_t helper_fadd(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fd, fa, fb;
> -    int flags;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    fd.f =3D float32_add(fa.f, fb.f, &env->fp_status);
> -
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags, GETPC());
> -    return fd.l;
> -}
> -
> -uint32_t helper_frsub(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fd, fa, fb;
> -    int flags;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    fd.f =3D float32_sub(fb.f, fa.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags, GETPC());
> -    return fd.l;
> -}
> -
> -uint32_t helper_fmul(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fd, fa, fb;
> -    int flags;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    fd.f =3D float32_mul(fa.f, fb.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags, GETPC());
> -
> -    return fd.l;
> -}
> -
> -uint32_t helper_fdiv(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fd, fa, fb;
> -    int flags;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    fd.f =3D float32_div(fb.f, fa.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags, GETPC());
> -
> -    return fd.l;
> -}
> -
> -uint32_t helper_fcmp_un(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fa, fb;
> -    uint32_t r =3D 0;
> -
> -    fa.l =3D a;
> -    fb.l =3D b;
> -
> -    if (float32_is_signaling_nan(fa.f, &env->fp_status) ||
> -        float32_is_signaling_nan(fb.f, &env->fp_status)) {
> -        update_fpu_flags(env, float_flag_invalid, GETPC());
> -        r =3D 1;
> -    }
> -
> -    if (float32_is_quiet_nan(fa.f, &env->fp_status) ||
> -        float32_is_quiet_nan(fb.f, &env->fp_status)) {
> -        r =3D 1;
> -    }
> -
> -    return r;
> -}
> -
> -uint32_t helper_fcmp_lt(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fa, fb;
> -    int r;
> -    int flags;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    r =3D float32_lt(fb.f, fa.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> -
> -    return r;
> -}
> -
> -uint32_t helper_fcmp_eq(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fa, fb;
> -    int flags;
> -    int r;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    r =3D float32_eq_quiet(fa.f, fb.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> -
> -    return r;
> -}
> -
> -uint32_t helper_fcmp_le(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fa, fb;
> -    int flags;
> -    int r;
> -
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    set_float_exception_flags(0, &env->fp_status);
> -    r =3D float32_le(fa.f, fb.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> -
> -
> -    return r;
> -}
> -
> -uint32_t helper_fcmp_gt(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fa, fb;
> -    int flags, r;
> -
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    set_float_exception_flags(0, &env->fp_status);
> -    r =3D float32_lt(fa.f, fb.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> -    return r;
> -}
> -
> -uint32_t helper_fcmp_ne(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fa, fb;
> -    int flags, r;
> -
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    set_float_exception_flags(0, &env->fp_status);
> -    r =3D !float32_eq_quiet(fa.f, fb.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> -
> -    return r;
> -}
> -
> -uint32_t helper_fcmp_ge(CPUMBState *env, uint32_t a, uint32_t b)
> -{
> -    CPU_FloatU fa, fb;
> -    int flags, r;
> -
> -    fa.l =3D a;
> -    fb.l =3D b;
> -    set_float_exception_flags(0, &env->fp_status);
> -    r =3D !float32_lt(fa.f, fb.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
> -
> -    return r;
> -}
> -
> -uint32_t helper_flt(CPUMBState *env, uint32_t a)
> -{
> -    CPU_FloatU fd, fa;
> -
> -    fa.l =3D a;
> -    fd.f =3D int32_to_float32(fa.l, &env->fp_status);
> -    return fd.l;
> -}
> -
> -uint32_t helper_fint(CPUMBState *env, uint32_t a)
> -{
> -    CPU_FloatU fa;
> -    uint32_t r;
> -    int flags;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    r =3D float32_to_int32(fa.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags, GETPC());
> -
> -    return r;
> -}
> -
> -uint32_t helper_fsqrt(CPUMBState *env, uint32_t a)
> -{
> -    CPU_FloatU fd, fa;
> -    int flags;
> -
> -    set_float_exception_flags(0, &env->fp_status);
> -    fa.l =3D a;
> -    fd.l =3D float32_sqrt(fa.f, &env->fp_status);
> -    flags =3D get_float_exception_flags(&env->fp_status);
> -    update_fpu_flags(env, flags, GETPC());
> -
> -    return fd.l;
> -}
> -
>  uint32_t helper_pcmpbf(uint32_t a, uint32_t b)
>  {
>      unsigned int i;
> diff --git a/target/microblaze/meson.build b/target/microblaze/meson.buil=
d
> index 05ee0ec1635..0a5e46027af 100644
> --- a/target/microblaze/meson.build
> +++ b/target/microblaze/meson.build
> @@ -4,6 +4,7 @@
>  microblaze_ss.add(gen)
>  microblaze_ss.add(files(
>    'cpu.c',
> +  'fpu_helper.c',
>    'gdbstub.c',
>    'helper.c',
>    'op_helper.c',
> --
> 2.26.3
>
>

