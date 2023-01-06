Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2F6603CC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 16:59:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDp5t-00005X-IB; Fri, 06 Jan 2023 10:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDp5r-0008WC-3W
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:57:19 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDp5p-0006HO-I4
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:57:18 -0500
Received: by mail-pj1-x102b.google.com with SMTP id q64so1858317pjq.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 07:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uABkwrjQG1uQC5MGnlRIuDgLsfk5VsI53U4v0q4LUM=;
 b=ONhjOKpdjSiwDuv37Sf/dRioeBEqN9tAYj6G9OE+8/3efLIR4s0+b3X2SJOLM2H2bd
 eE749o6zezdiuxAjWsvWlpqFsCIUCa0lDXA4DNEUoBvgAFo0f50aboUmgNI1xvHqg2Ip
 DrW8Yn08dThY3W1bjLBts0Uou+olN+Pu1Odk4NSnmoOJ+UFPbLDvqxd3d/xXACp6EdTY
 gniBt31UudZGdieLovTbfuD2jdZKba2lf8U9A7ZMOsuvaSSSc6zzBZBFtueQ9LJ4w3cH
 S8IVF+fSuKLIkHTgXG1eewXG8ZLcc5Qzst9NrhcCMdrO9SKhx+YHwGUmDGGFPPs1mj+T
 syhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9uABkwrjQG1uQC5MGnlRIuDgLsfk5VsI53U4v0q4LUM=;
 b=OdTXHG0aSwg6i7zX4YB8qOr//jValEEKkngXUcVy9dQlKraYVKPJngzK7AHJjDnXfy
 kx9N8vHA/qb89MQL+/wzDRWy6oB8acDGL3SXlknS3PWEb7T/oDJ+025nAjPge+R8q2a9
 UML17hPbr9yBUDTmZ+k03JgZiaaByruZWiOqA/SySmxmkIcVh9XRs6GbeLhAQw+D18t9
 SudYkMS+gB8J37NqbW93gvtOr8dYXl0nvcDi5lErk5K2rodkMU1XRttgqVvqYde+rvgX
 /N3UvVFyDqpRRDXY9OQUGZXpYpcRFIPeMBTw7gyo/43UAl+BH3sMm9GHr4WTDxo800fj
 vPEw==
X-Gm-Message-State: AFqh2kp54p4PwvPbhuRzHk+WOrYoR7BK3AU305sbbhZqct2VkSLHtCqq
 NzVCi5bM2fOwCL5Dv+702c50boojNapgS1bYb0OwzKRm8Owj6A==
X-Google-Smtp-Source: AMrXdXtk91u32O8on87FAzO06cDh3p/FeAm1HZGjVcVKqSN8JrOAhM4mYJASlkSto2TEFHxM5LpHeDPlzSTpduEn/As=
X-Received: by 2002:a17:90a:b010:b0:226:b783:67f with SMTP id
 x16-20020a17090ab01000b00226b783067fmr710502pjq.215.1673020636045; Fri, 06
 Jan 2023 07:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20230102175245.1895037-1-clg@kaod.org>
In-Reply-To: <20230102175245.1895037-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 15:57:04 +0000
Message-ID: <CAFEAcA_m59FxCGFu1aF8j1nfib=W49e59w4LNYx3Cj5NOmYufw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow users to set the number of VFP registers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2 Jan 2023 at 17:52, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
> have 16 64-bit FPU registers and not 32 registers. Let users set the
> number of VFP registers with a CPU property.
>
> The primary use case of this property is for the Cortex A7 of the
> Aspeed AST2600 SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2fa022f62b..27af57ea9a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1258,6 +1258,9 @@ static Property arm_cpu_cfgend_property =3D
>  static Property arm_cpu_has_vfp_property =3D
>              DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
>
> +static Property arm_cpu_has_vfp_d32_property =3D
> +            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
> +
>  static Property arm_cpu_has_neon_property =3D
>              DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
>
> @@ -1384,8 +1387,11 @@ void arm_cpu_post_init(Object *obj)
>          ? cpu_isar_feature(aa64_fp_simd, cpu)
>          : cpu_isar_feature(aa32_vfp, cpu)) {
>          cpu->has_vfp =3D true;
> +        cpu->has_vfp_d32 =3D true;

We shouldn't default to true if the CPU default is D16 already.
You should be able to use cpu_isar_feature(aa32_simd_r32, cpu)
to check this.

The setup of the property should probably be in its own if(),
rather than tucked into the has_vfp if(), so

   if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
       cpu->has_vfp_d32 =3D true;
       add property;
   }

This would mean that if the CPU is D16-only then the user can't
make it D32, which I think is OK. You could write it to
allow that if you wanted I guess, but then you'd need to
special-case M-profile, which doesn't permit D32 at all.

>          if (!kvm_enabled()) {
>              qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_prope=
rty);
> +            qdev_property_add_static(DEVICE(obj),
> +                                     &arm_cpu_has_vfp_d32_property);
>          }
>      }
>
> @@ -1650,6 +1656,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
>
> +    if (!cpu->has_vfp_d32) {
> +        uint32_t u;
> +
> +        u =3D cpu->isar.mvfr0;
> +        u =3D FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
> +        cpu->isar.mvfr0 =3D u;
> +    }
> +
>      if (!cpu->has_vfp) {
>          uint64_t t;
>          uint32_t u;

There should be a check so the user can't both disable D32 and enable Neon
(Neon always has 32 dregs).

Armv8A doesn't permit D16, so we shouldn't allow that combination either
(but note that v8R, support for which just landed, *does* permit it).

thanks
-- PMM

