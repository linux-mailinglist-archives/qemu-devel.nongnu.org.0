Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D706430BB56
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:48:14 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6sI9-0005Xu-TB
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6sH2-000574-Gw
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:47:04 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6sGw-00011m-Rp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:47:04 -0500
Received: by mail-wm1-x335.google.com with SMTP id j11so932167wmi.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 01:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Z0KGZF2lNgKFUQtJtFppOWwYoPzX8GNaMC7b1HU0b80=;
 b=QvLOoIuhdvNudV9osOUKsoqUp/+x8/nQgC9U5NurIETfOLGIEqw5P8UkheqCyd22hr
 DGYMR91ybF8tqqCm+4cLm1GqNf1ddS9AMm7duSNKGOyCIlFlpHS9hhwRRMBhG/w+hXrt
 Hn8zli6gIseQEKmsHaVv4IwtClhHKRjxkuzYmmqld5E7JDg6Cla+e8ce2oKB5mwDT/Xj
 McvA3orHpxBKyaKoRnRFHCSptWbXuRoxXT+ps3/ZO/zg4GJQ62XQ00sSxXN6qlCuITyi
 iS/XKdto1wlgpJAIYOj80EssZYQHQWSy+SIx1+3lKrnHxIcpDoNIZ+0dx1b6MYA6dEQE
 K9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Z0KGZF2lNgKFUQtJtFppOWwYoPzX8GNaMC7b1HU0b80=;
 b=eiU7VkoKlVnsLiPQ0OBb1jhMrvTDaqr18JWt9hQ7Bo341Mq/rRUUnavcF6li1ys5kG
 JpRndJcUN632agRCwAxRf7bU0UrREljHvmADse+GKAPQbki38yQQQ5hsn0fp367Wi+ja
 Yb6xqW02Yb1TwqAB8HDndM9TWD2M5zRND4t6gArqydwEbWDmjqi4YSRKOgIgUK8bxddu
 ydyuyg8ATeWV67GlW2fm7jxmeFb0A+wLPXy4t6x3X57Uo55rHQQfJ+Hy5GRkZK5RNu8r
 o9EBSQecy5ogI53R/noF70gNH9NF8ta0qq1hQTm77y565X6o0zi2I6/h2ZaBr+QX28HJ
 SoQg==
X-Gm-Message-State: AOAM532aWQTgca9hCuvrLclzm2/tKeECrRsrJ3/DjCA6yxm0ymE2LSaS
 Tl1fpwTXF/29d2rVRtET4B/RJbtpDYVahFx7E6c=
X-Google-Smtp-Source: ABdhPJwxSknbSt2NhI/t6Cj0NP4O4oSzo7LO/zsC7i/jcGyLobQhrTOe/30Y/9m38Xeyb5OT/0RNNA==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr2738164wmf.67.1612259216903; 
 Tue, 02 Feb 2021 01:46:56 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id 67sm2035162wmz.46.2021.02.02.01.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 01:46:56 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 8d11781d;
 Tue, 2 Feb 2021 09:46:55 +0000 (UTC)
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 2/4] target/i386: define CPU models to model x86-64
 ABI levels
In-Reply-To: <20210201153606.4158076-3-berrange@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-3-berrange@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Peter Gabriel - Up: Sky Blue
Date: Tue, 02 Feb 2021 09:46:55 +0000
Message-ID: <cunsg6els34.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::335;
 envelope-from=dme@dme.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-02-01 at 15:36:04 GMT, Daniel P. Berrang=C3=A9 wrote:

> To paraphrase:
>
>   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterpri=
se-linux-9-for-the-x86-64-v2-microarchitecture-level/
>
> In 2020, AMD, Intel, Red Hat, and SUSE worked together to define
> three microarchitecture levels on top of the historical x86-64
> baseline:
>
>   * x86-64:    original x86_64 baseline instruction set
>   * x86-64-v2: vector instructions up to Streaming SIMD
>                Extensions 4.2 (SSE4.2)  and Supplemental
> 	       Streaming SIMD Extensions 3 (SSSE3), the
> 	       POPCNT instruction, and CMPXCHG16B
>   * x86-64-v3: vector instructions up to AVX2, MOVBE,
>                and additional bit-manipulation instructions.
>   * x86-64-v4: vector instructions from some of the
>                AVX-512 variants.
>
> This list of features is defined in the doc at:
>
>   https://gitlab.com/x86-psABIs/x86-64-ABI/
>
> QEMU has historically defaulted to the "qemu64" CPU model on
> x86_64 targets, which is approximately the x86-64 baseline
> ABI, with 'SVM' added.
>
> It is thought it might be desirable if QEMU could provide CPU models
> that closely correspond to the ABI levels, while offering portability
> across the maximum number of physical CPUs.
>
> Historically we've found that defining CPU models with an arbitrary
> combination of CPU features can be problematic, as some guest OS
> will not check all features they use, and instead assume that if
> they see feature "XX", then "YY" will always exist. This is reasonable
> in bare metal, but subject to breakage in virtualization.
>
> Thus in defining the CPI models for the ABI levels, this patch attempted

s/CPI/CPU/

> to base them off an existing CPU model.
>
> While each x86-64-abiNNN has a designated vendor, they are designed
> to be vendor agnostic models. ie they are capable of running on any
> AMD or Intel physical CPU model that satisfies the ABI level. eg

Only AMD or Intel? (You mention the Hugon chips elsewhere.)

> althgouh the x86-64-abi2 model is based on Nehalem, it should be
> able to run guests on an Opteron_G4/G5/EPYC host, since those CPUs
> support the features required by the x86-64 v2 ABI.
>
> More precisely the models were defined as:
>
>  * x86-64-abi1: close match for Opteron_G1, minus
>                 vme
>  * x86-64-abi2: perfect match for Nehalem
>  * x86-64-abi3: close match of Haswell-noTSX, minus
>                 aes pcid erms invpcid tsc-deadline
> 		x2apic pclmulqdq
>  * x86-64-abi4: close match of Skylake-Server-noTSX-IBRS, minus
>                 spec-ctrl
>
> None of the CPU models declare any VMX/SVM features. This would
> make them unable to support nested virtualization with live
> migration.

How about "Unable to support hardware accelerated nested
virtualization." ?

Is live migration relevant?

> Given their vendor agnostic design, these CPU models are primarily
> though to useful as the default CPU model for machine types. QEMU
> upstream is quite conservative in mandating new hardware features,
> but a downstream vendor may choose to mandate a newer x86-64 ABI
> level for downstream only machine types.
>
> Note that TCG is not capable of supporting the 2 newest ABI levels
> currently:
>
> * x86-64-abi3:
>
>   CPUID.01H:ECX.fma [bit 12]
>   CPUID.01H:ECX.avx [bit 28]
>   CPUID.01H:ECX.f16c [bit 29]
>   CPUID.07H:EBX.avx2 [bit 5]
>
> * x86-64-abi4:
>
>   CPUID.01H:ECX.pcid [bit 17]
>   CPUID.01H:ECX.x2apic [bit 21]
>   CPUID.01H:ECX.tsc-deadline [bit 24]
>   CPUID.07H:EBX.invpcid [bit 10]
>   CPUID.07H:EBX.avx512f [bit 16]
>   CPUID.07H:EBX.avx512dq [bit 17]
>   CPUID.07H:EBX.rdseed [bit 18]
>   CPUID.07H:EBX.avx512cd [bit 28]
>   CPUID.07H:EBX.avx512bw [bit 30]
>   CPUID.07H:EBX.avx512vl [bit 31]
>   CPUID.80000001H:ECX.3dnowprefetch [bit 8]
>   CPUID.0DH:EAX.xsavec [bit 1]
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/system/cpu-models-x86-abi.csv |   8 ++
>  target/i386/cpu.c                  | 156 +++++++++++++++++++++++++++++
>  2 files changed, 164 insertions(+)
>
> diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-=
x86-abi.csv
> index 4565e6a535..d34d95d485 100644
> --- a/docs/system/cpu-models-x86-abi.csv
> +++ b/docs/system/cpu-models-x86-abi.csv
> @@ -119,3 +119,11 @@ qemu32,,,,
>  qemu32-v1,,,,
>  qemu64,=E2=9C=85,,,
>  qemu64-v1,=E2=9C=85,,,
> +x86-64-abi1,=E2=9C=85,,,
> +x86-64-abi1-v1,=E2=9C=85,,,
> +x86-64-abi2,=E2=9C=85,=E2=9C=85,,
> +x86-64-abi2-v1,=E2=9C=85,=E2=9C=85,,
> +x86-64-abi3,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +x86-64-abi3-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +x86-64-abi4,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +x86-64-abi4-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ae89024d36..87a775a5eb 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1827,6 +1827,162 @@ static CPUCaches epyc_rome_cache_info =3D {
>   */
>=20=20
>  static X86CPUDefinition builtin_x86_defs[] =3D {
> +    /*
> +     * These first few CPU models are designed to satisfy the
> +     * x86_64 ABI levels defined in:
> +     *
> +     *   https://gitlab.com/x86-psABIs/x86-64-ABI/
> +     *
> +     * They were constructed as follows:
> +     *
> +     *   - Find all the CPU models which can satisfy the ABI
> +     *   - Calculate the lowest common denominator (LCD) of these
> +     *     models' features
> +     *   - Find the named model most closely matching the LCD
> +     *   - Strip its features back to the LCD
> +     *
> +     * The above spec uses the "x86-64-vNN" naming convention.
> +     * This clashes with the "vNN" suffix QEMU uses for versioning.
> +     * Thus we use "abiNNN" as a suffix.
> +     */
> +    {
> +        /*
> +         * Derived from Opteron_G1, minus
> +         *   vme
> +         */
> +        .name =3D "x86-64-abi1",
> +        .level =3D 5,
> +        .vendor =3D CPUID_VENDOR_AMD,
> +        .family =3D 15,
> +        .model =3D 6,
> +        .stepping =3D 1,
> +        .features[FEAT_1_EDX] =3D
> +            CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
> +            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID=
_MCA |
> +            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
> +            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
> +            CPUID_DE | CPUID_FP87,
> +        .features[FEAT_1_ECX] =3D
> +            CPUID_EXT_SSE3,
> +        .features[FEAT_8000_0001_EDX] =3D
> +            CPUID_EXT2_LM | CPUID_EXT2_NX | CPUID_EXT2_SYSCALL,
> +        .xlevel =3D 0x80000008,
> +        .model_id =3D "QEMU x86-64 baseline ABI",
> +    },
> +    {
> +        /* Derived from Nehalem */
> +        .name =3D "x86-64-abi2",
> +        .level =3D 11,
> +        .vendor =3D CPUID_VENDOR_INTEL,
> +        .family =3D 6,
> +        .model =3D 26,
> +        .stepping =3D 3,
> +        .features[FEAT_1_EDX] =3D
> +            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
> +            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID=
_MCA |
> +            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
> +            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
> +            CPUID_DE | CPUID_FP87,
> +        .features[FEAT_1_ECX] =3D
> +            CPUID_EXT_POPCNT | CPUID_EXT_SSE42 | CPUID_EXT_SSE41 |
> +            CPUID_EXT_CX16 | CPUID_EXT_SSSE3 | CPUID_EXT_SSE3,
> +        .features[FEAT_8000_0001_EDX] =3D
> +            CPUID_EXT2_LM | CPUID_EXT2_SYSCALL | CPUID_EXT2_NX,
> +        .features[FEAT_8000_0001_ECX] =3D
> +            CPUID_EXT3_LAHF_LM,
> +        .xlevel =3D 0x80000008,
> +        .model_id =3D "QEMU x86-64-v2 ABI",
> +    },
> +    {
> +        /*
> +         * Derived from Haswell-noTSX, minus
> +         *   aes pcid erms invpcid tsc-deadline x2apic pclmulqdq
> +         */
> +        .name =3D "x86-64-abi3",
> +        .level =3D 0xd,
> +        .vendor =3D CPUID_VENDOR_INTEL,
> +        .family =3D 6,
> +        .model =3D 60,
> +        .stepping =3D 1,
> +        .features[FEAT_1_EDX] =3D
> +            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
> +            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID=
_MCA |
> +            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
> +            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
> +            CPUID_DE | CPUID_FP87,
> +        .features[FEAT_1_ECX] =3D
> +            CPUID_EXT_AVX | CPUID_EXT_XSAVE |
> +            CPUID_EXT_POPCNT | CPUID_EXT_SSE42 |
> +            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
> +            CPUID_EXT_SSE3 |
> +            CPUID_EXT_FMA | CPUID_EXT_MOVBE |
> +            CPUID_EXT_F16C | CPUID_EXT_RDRAND,
> +        .features[FEAT_8000_0001_EDX] =3D
> +            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX |
> +            CPUID_EXT2_SYSCALL,
> +        .features[FEAT_8000_0001_ECX] =3D
> +            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM,
> +        .features[FEAT_7_0_EBX] =3D
> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
> +            CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
> +            CPUID_7_0_EBX_BMI2,
> +        .features[FEAT_XSAVE] =3D
> +            CPUID_XSAVE_XSAVEOPT,
> +        .features[FEAT_6_EAX] =3D
> +            CPUID_6_EAX_ARAT,
> +        .xlevel =3D 0x80000008,
> +        .model_id =3D "QEMU x86-64-v3 ABI",
> +    },
> +
> +    {
> +        /*
> +         * Derived from Skylake-Server-noTSX-IBRS, minus:
> +         *  spec-ctrl
> +         */
> +        .name =3D "x86-64-abi4",
> +        .level =3D 0xd,
> +        .vendor =3D CPUID_VENDOR_INTEL,
> +        .family =3D 6,
> +        .model =3D 85,
> +        .stepping =3D 4,
> +        .features[FEAT_1_EDX] =3D
> +            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
> +            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID=
_MCA |
> +            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
> +            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
> +            CPUID_DE | CPUID_FP87,
> +        .features[FEAT_1_ECX] =3D
> +            CPUID_EXT_AVX | CPUID_EXT_XSAVE | CPUID_EXT_AES |
> +            CPUID_EXT_POPCNT | CPUID_EXT_X2APIC | CPUID_EXT_SSE42 |
> +            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
> +            CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
> +            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_FMA | CPUID_EXT_MOV=
BE |
> +            CPUID_EXT_PCID | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
> +        .features[FEAT_8000_0001_EDX] =3D
> +            CPUID_EXT2_LM | CPUID_EXT2_PDPE1GB | CPUID_EXT2_RDTSCP |
> +            CPUID_EXT2_NX | CPUID_EXT2_SYSCALL,
> +        .features[FEAT_8000_0001_ECX] =3D
> +            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM | CPUID_EXT3_3DNOWPREFET=
CH,
> +        .features[FEAT_7_0_EBX] =3D
> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
> +            CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
> +            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVP=
CID |
> +            CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX |
> +            CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLWB |
> +            CPUID_7_0_EBX_AVX512F | CPUID_7_0_EBX_AVX512DQ |
> +            CPUID_7_0_EBX_AVX512BW | CPUID_7_0_EBX_AVX512CD |
> +            CPUID_7_0_EBX_AVX512VL,
> +        .features[FEAT_7_0_ECX] =3D
> +            CPUID_7_0_ECX_PKU,
> +        .features[FEAT_XSAVE] =3D
> +            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> +            CPUID_XSAVE_XGETBV1,
> +        .features[FEAT_6_EAX] =3D
> +            CPUID_6_EAX_ARAT,
> +        .xlevel =3D 0x80000008,
> +        .model_id =3D "QEMU x86-64-v4 ABI",
> +    },
> +
>      {
>          .name =3D "qemu64",
>          .level =3D 0xd,
> --=20
> 2.29.2

dme.
--=20
All those lines and circles, to me, a mystery.

