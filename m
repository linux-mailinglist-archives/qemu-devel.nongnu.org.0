Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5E473673
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:15:31 +0100 (CET)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwsfR-0007Ap-To
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:15:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwse2-0006Cj-7D
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:14:02 -0500
Received: from [2a00:1450:4864:20::32d] (port=34684
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwse0-0007si-9k
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:14:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so11600567wmi.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 13:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m6aT+nELM2RmnFN2KZJvrrhmk3Eg5DQ/H4JOelMCzKg=;
 b=hT2xjPn3/UGYUT67H0f3FzdvQkWnfcAvTnzlHypY6R2f/gSsuohXX5JrRPZBmqlY8T
 B8ue8hDgK9awNH4iwfnGGgCXV5F+0yiheNG6fHcUL3wb9TtHBjog4z/PlY5dt49qQZcK
 Clq5JUNKlZMMtnHHTJitn3UMnv37XXoZKGbwR9yXOtZSoXRUxDOpSCoJJry7SmRlmmee
 aswyQmz6dQ4uWzmP+nzWJyzuuHgmO9YhLqT2NdWHewAeeBFHgd07F+2NhGCxjI8c0Hbg
 NlU8RTs87CaJ5r3p/KaNM4jtk7+MdlRuZcqEyq0Dunhk5iLp4YeX6us1E7Fj1m7xXpEd
 jZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m6aT+nELM2RmnFN2KZJvrrhmk3Eg5DQ/H4JOelMCzKg=;
 b=pffK76TzatvUhU6fuSF3/UIXis1PxGs0DEfGX47GMSXU84IVSeTnJdsv2EvAcvO2hH
 KuCkwJhzMo9CrGxEaNA6Jp2LR6C+1xp82D065zbO5vweICHsmChy+JbyCymaEciFB0Yc
 tHRx2jvvfBGNj69jlf2z+TdcpHqjHbGPnakifipZe8kuxGbeZOIILgfl5VP7bt4rLowN
 x8ZsCJcqzKIG5hbyhe8c2filwdwPOXj4lKq2hs4A75PDPvlE34wQ7a4tv2XsY89KZfby
 Zo8biRt4wXBhoa3QTpc1gbbkmab+bokCGsYmeNidYptVQ+KxhXFE9qIuMPZzF6Dr3muy
 bsBg==
X-Gm-Message-State: AOAM532Fy0CI6iLyS5kSeaht7Ex2NE1wy26BruC8AogYjx1LTnYbJH4a
 JPriacF1ve+VLF4m7UFl2fT+Jg==
X-Google-Smtp-Source: ABdhPJwqFs/y74lEt1Qc5uOkAhvGj8mrwCNN5QO8E910lN+TEUtmD9fs2TrC4V+IDQhpzQbDW5tIEw==
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr1435291wms.144.1639430038644; 
 Mon, 13 Dec 2021 13:13:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g18sm12324566wrv.42.2021.12.13.13.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 13:13:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B27421FF96;
 Mon, 13 Dec 2021 21:13:56 +0000 (GMT)
References: <20211213182449.7068-1-bslathi19@gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Byron Lathi <bslathi19@gmail.com>
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
Date: Mon, 13 Dec 2021 21:02:07 +0000
In-reply-to: <20211213182449.7068-1-bslathi19@gmail.com>
Message-ID: <87wnk8i4x7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Byron Lathi <bslathi19@gmail.com> writes:

> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 init functions, using the appropriate values from the technical
> reference manual for the A5.
>
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  target/arm/cpu_tcg.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 13d0e9b195..38f0fc3977 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -304,6 +304,42 @@ static void cortex_a8_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>  }
>=20=20
> +static void cortex_a5_initfn(Object *obj)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(obj);
> +
> +    cpu->dtb_compatible =3D "arm,cortex-a5";
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr =3D 0x410fc0f1;

hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) but
I can't find the actual value in the TRM.

> +    cpu->reset_fpsid =3D 0x41023051;

I think for the a5 the FPU is optional so maybe we need a cpu option
here? Or maybe just assume it's enabled on QEMUs version?

> +    cpu->isar.mvfr0 =3D 0x10110221;
> +    cpu->isar.mvfr1 =3D 0x11000011;
> +    cpu->ctr =3D 0x83338003;
> +    cpu->reset_sctlr =3D 0x00c50078;
> +    cpu->isar.id_pfr0 =3D 0x00001231;
> +    cpu->isar.id_pfr1 =3D 0x00000011;
> +    cpu->isar.id_dfr0 =3D 0x02010444;
> +    cpu->id_afr0 =3D 0x00000000;
> +    cpu->isar.id_mmfr0 =3D 0x00100103;

the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not suppo=
rted.

> +    cpu->isar.id_mmfr1 =3D 0x40000000;
> +    cpu->isar.id_mmfr2 =3D 0x01230000;
> +    cpu->isar.id_mmfr3 =3D 0x00102211;
> +    cpu->isar.id_isar0 =3D 0x00101111;
> +    cpu->isar.id_isar1 =3D 0x13112111;
> +    cpu->isar.id_isar2 =3D 0x21232041;
> +    cpu->isar.id_isar3 =3D 0x11112131;
> +    cpu->isar.id_isar4 =3D 0x00011142;
> +    cpu->isar.dbgdidr =3D 0x1203f001;
> +    cpu->clidr =3D 0x09200003;

I'm fairly sure these depend on the part as well although it makes no
difference to our emulation.

> +    cpu->ccsidr[0] =3D 0x701fe00a;
> +    cpu->ccsidr[1] =3D 0x203fe00a;
> +}
> +
>  static const ARMCPRegInfo cortexa9_cp_reginfo[] =3D {
>      /*
>       * power_control should be set to maximum latency. Again,
> @@ -1019,6 +1055,7 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {
>      { .name =3D "arm1136",     .initfn =3D arm1136_initfn },
>      { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
>      { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
> +    { .name =3D "cortext-a5",  .initfn =3D cortex_a5_initfn },

Extra 't'

>      { .name =3D "cortex-a7",   .initfn =3D cortex_a7_initfn },
>      { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
>      { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },


--=20
Alex Benn=C3=A9e

