Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B43A7C93
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:59:35 +0200 (CEST)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6n8-000298-UZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6ku-0000Fu-Tq
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:57:16 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6ks-0000fo-HB
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:57:16 -0400
Received: by mail-ej1-x62d.google.com with SMTP id he7so21630719ejc.13
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/DZ5P/GbtwwSKTp1kawFHerPro8RELr7JTJWd5taZyk=;
 b=yF2qyfW4n2BwTN6l58I9H+NwolHFf+TgxgjkxqafulvJXPp9hp3HX/oUykpHGIJwUK
 tEk+fyVsj6EMJyayL83MF508f+wOymByaSgsfLCq+JhlXB+Csv4ZHeb3rqrX69pQ7zwX
 PPMe0anDvT42u/Rnnr0BBUUc8q0kqAJYkHszVrqNoRMLKgHCQbLX1rPVNivQI2qhwp+g
 nSz6JwDTz/KmP/JjCFAf2EIajJ1iarV+NydI2fVbZUauEkzhXxAdtNqaggqfCo3qAKr9
 +yNe13aEloft+VPAogMB+lrQzV7QDt2ZOgeC7uRqNlmIrgHX6oeZMzwIa+4EOO81azss
 92Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/DZ5P/GbtwwSKTp1kawFHerPro8RELr7JTJWd5taZyk=;
 b=l+wKoQUx89p6/O5r/p5Xr6dJhWNYJPkjVl7HQSMdux9SHdKhlzGtTL3vJlzbZP8KYE
 q1H45z+v8NK61/0RX45sx0O045AsCMS20Ubm8z4C2H0H/kpGRw1ffqTLb4ZyIHjOS7tv
 hYitRmKC8xVfNA67VhSKO4+wWzHbA2pKGG6cpVR5UK98+ubkj5fSGMuTRW7T8pnZ17Qq
 z7yY1GR4h5eaJIpHvUcGJ7uSzeNdLE5y5xIVV8ofpia+f5LqFq7oOLuqfakBfNr+Unxh
 1DtY7gwVXCqLxbY3AM+kAGlN9+lbE/pd3umi0USsCq5Gq4gxd/uNy2tcWyW1j7Bl1I50
 44KQ==
X-Gm-Message-State: AOAM531McBWFk08g7JWQ3ucN4C075g8syh4yI5vzi7jcrfSduB6lnew0
 mA7U2Yx1iEGD7Oec6JocIVAYFDbgFV61tRE0ywvmAQ==
X-Google-Smtp-Source: ABdhPJzyNTocXTEHVZGbDdNMoXpI5M2yjeXf8KbK9AEEMpkDGe+5bMe5PTRNHaILOmoXBmVxWQj/AZ4kQ6vK9ko2IjQ=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr19927315ejy.407.1623754632728; 
 Tue, 15 Jun 2021 03:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-16-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 11:56:37 +0100
Message-ID: <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
>
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>
> ---
>
> v6 -> v7:
>
>   - Move function define to own header
>   - Do not propagate SVE features for HVF
>   - Remove stray whitespace change
>   - Verify that EL0 and EL1 do not allow AArch32 mode
>   - Only probe host CPU features once

> +static void hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> +{
> +    ARMISARegisters host_isar;

Can you zero-initialize this (with "= { }"), please? That way we
know we have zeroes in the aarch32 ID fields rather than random junk later...

> +    const struct isar_regs {
> +        int reg;
> +        uint64_t *val;
> +    } regs[] = {
> +        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
> +        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
> +        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
> +        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
> +        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
> +        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> +        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
> +        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
> +        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
> +    };
> +    hv_vcpu_t fd;
> +    hv_vcpu_exit_t *exit;
> +    int i;
> +
> +    ahcf->dtb_compatible = "arm,arm-v8";
> +    ahcf->features = (1ULL << ARM_FEATURE_V8) |
> +                     (1ULL << ARM_FEATURE_NEON) |
> +                     (1ULL << ARM_FEATURE_AARCH64) |
> +                     (1ULL << ARM_FEATURE_PMU) |
> +                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
> +
> +    /* We set up a small vcpu to extract host registers */
> +
> +    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
> +        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
> +    }
> +    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr));
> +    assert_hvf_ok(hv_vcpu_destroy(fd));
> +
> +    ahcf->isar = host_isar;
> +    ahcf->reset_sctlr = 0x00c50078;

Why this value in particular? Could we just ask the scratch HVF CPU
for the value of SCTLR_EL1 rather than hardcoding something?

> +
> +    /* Make sure we don't advertise AArch32 support for EL0/EL1 */
> +    g_assert((host_isar.id_aa64pfr0 & 0xff) == 0x11);

This shouldn't really be an assert, I think. error_report() something
and return false, and then arm_cpu_realizefn() will fail, which should
cause us to exit.

> +}
> +
> +void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
> +{
> +    if (!arm_host_cpu_features.dtb_compatible) {
> +        if (!hvf_enabled()) {
> +            cpu->host_cpu_probe_failed = true;
> +            return;
> +        }
> +        hvf_arm_get_host_cpu_features(&arm_host_cpu_features);
> +    }
> +
> +    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
> +    cpu->isar = arm_host_cpu_features.isar;
> +    cpu->env.features = arm_host_cpu_features.features;
> +    cpu->midr = arm_host_cpu_features.midr;
> +    cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
> +}
> +
>  void hvf_arch_vcpu_destroy(CPUState *cpu)
>  {
>  }

thanks
-- PMM

