Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B652164EAE6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69Dp-0000sA-Bm; Fri, 16 Dec 2022 06:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69Dn-0000rX-0z
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:49:47 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69Dk-000533-Qh
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:49:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id v7so1723881wmn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wwI2rU0UsupqzGA6Yp2uW8lBtTIYnkSVtZ/TIjnOVv8=;
 b=LjlwDpeEUTtsjVBL4kwhHW5M3iF5U254nQLCiCWCPgjNks4yDFf4EapUv6rikQeoQK
 WGe+eT26tf8UnW0tDSN3YItRXD4MYRpEnRW+XM10kAQ4uiHX/nVeFjdcqob1IgJwUl1G
 BmfVVbNlyg9pJv5aMlGiwy/zfJnNhdheSXFfZ2SHpBgFw3RgiQnDWKgUPJuh8fxhYTA6
 rPnglEucNbQCu5jArmU5rgiDDcxlFQklb4eNiCWakly38sniBHkbXIWy5sZek2G7Ri9s
 TB+2a5/DEHsPr8B6QDrYivsoJFaYG+ENL25KAPWrWLdp7H1rWoXTyMNRk1k5Y5sX6Uhw
 XmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wwI2rU0UsupqzGA6Yp2uW8lBtTIYnkSVtZ/TIjnOVv8=;
 b=nGoLd2hvCsAngpeaemCLI5i1OhXKBJtruI5CEwUL/e/D5fuRu2ZatU5yQJ/XQah7B1
 NgXXlV3IvL21dzVKJcMdQaAIdbaX39Qn/hcxt0e98aeMjai/yZA4zI3G647fHqjOLHZq
 MslrOnjhe++sQ09HG3QTkZaNoJDO0PNdTVKf801+kyDWl47T2Ck9nkI1afGvaus5ljxu
 S+IX6pKQPcgvucUJBaW/G0yup57kGd+6V+uNdBHMsTWAC6XZ1GyRBXmWQpFd8S0mXIQz
 flO/w6QE4RSXWRBj1SogQsOO+kXrLz1UAWXleVzYhigv7guMPI0zcDRbMtl+oOGtd+9V
 BX+A==
X-Gm-Message-State: AFqh2kry+AHpYuGUfDhNR0Lm/F2xL27JgsR3A/JeL5EG6Pk60RO2bJXK
 06nc2tj/JALOoBAueqh/l4RveA==
X-Google-Smtp-Source: AMrXdXsrvg6nGT9J5jrUoX21dmoieiKZTuwnh4FHp/7vLEj/IvRZHt/uZcQIt5eK429f+mN+GAjSpw==
X-Received: by 2002:a1c:7418:0:b0:3d3:3deb:d916 with SMTP id
 p24-20020a1c7418000000b003d33debd916mr3101320wmc.4.1671191382859; 
 Fri, 16 Dec 2022 03:49:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c358200b003d1f2c3e571sm10478222wmq.33.2022.12.16.03.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:49:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A5691FFB7;
 Fri, 16 Dec 2022 11:49:42 +0000 (GMT)
References: <20221215174013.1003508-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/28] target-arm queue
Date: Fri, 16 Dec 2022 11:47:16 +0000
In-reply-to: <20221215174013.1003508-1-peter.maydell@linaro.org>
Message-ID: <87ilibin55.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> drop the sysregs patch as the tcg sysregs test fails
> (probably a bug in the test)

Well I assume because it complains about extra bits leaking into
userspace:

  =E2=9E=9C  ./qemu-aarch64 ./tests/tcg/aarch64-linux-user/sysregs
  Checking Counter registers
  ctr_el0             : 0x0000000080038003
  cntvct_el0          : 0x017314376c668b73
  cntfrq_el0          : 0x0000000003b9aca0
  Checking CPUID registers
  id_aa64isar0_el1    : 0x1021111110212120
    !!extra bits!!    : 0x1000000000000000
  id_aa64isar1_el1    : 0x0011101101211012
    !!extra bits!!    : 0x0011100100000000
  id_aa64mmfr0_el1    : 0xffffffffff000000
    !!extra bits!!    : 0xffffffff00000000
  id_aa64pfr0_el1     : 0x0001000100110011
  id_aa64pfr1_el1     : 0x0000000001000321
    !!extra bits!!    : 0x0000000001000301
  id_aa64dfr0_el1     : 0x0000000000000006
  id_aa64zfr0_el1     : 0x0110110100110021 (not RAZ!)
  midr_el1            : 0x00000000000f0510
  mpidr_el1           : 0x0000000080000000
  Remaining registers should fail
  id_mmfr0_el1        : 0x00000000deadbeef
  id_mmfr1_el1        : 0x00000000deadbeef
  id_mmfr2_el1        : 0x00000000deadbeef
  id_mmfr3_el1        : 0x00000000deadbeef
  mvfr0_el1           : 0x00000000deadbeef
  mvfr1_el1           : 0x00000000deadbeef
  Extra information leaked to user-space!

So it should have been updated when the API was changed.

>
> -- PMM
>
> The following changes since commit ae2b87341b5ddb0dcb1b3f2d4f586ef18de758=
73:
>
>   Merge tag 'pull-qapi-2022-12-14-v2' of https://repo.or.cz/qemu/armbru i=
nto staging (2022-12-14 22:42:14 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-ar=
m-20221215-1
>
> for you to fetch changes up to 9e406eea309bbe44c7fb17f6af112d2b756854ad:
>
>   target/arm: Restrict arm_cpu_exec_interrupt() to TCG accelerator (2022-=
12-15 17:37:48 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
> =C2=A0* hw/arm/virt: Add properties to allow more granular
>    configuration of use of highmem space
> =C2=A0* target/arm: Add Cortex-A55 CPU
> =C2=A0* hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber advertisement
> =C2=A0* Implement FEAT_EVT
> =C2=A0* Some 3-phase-reset conversions for Arm GIC, SMMU
> =C2=A0* hw/arm/boot: set initrd with #address-cells type in fdt
> =C2=A0* hw/misc: Move some arm-related files from specific_ss into softmm=
u_ss
> =C2=A0* Restrict arm_cpu_exec_interrupt() to TCG accelerator
>
> ----------------------------------------------------------------
> Gavin Shan (7):
>       hw/arm/virt: Introduce virt_set_high_memmap() helper
>       hw/arm/virt: Rename variable size to region_size in virt_set_high_m=
emmap()
>       hw/arm/virt: Introduce variable region_base in virt_set_high_memmap=
()
>       hw/arm/virt: Introduce virt_get_high_memmap_enabled() helper
>       hw/arm/virt: Improve high memory region address assignment
>       hw/arm/virt: Add 'compact-highmem' property
>       hw/arm/virt: Add properties to disable high memory regions
>
> Luke Starrett (1):
>       hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber advertisement
>
> Mihai Carabas (1):
>       hw/arm/virt: build SMBIOS 19 table
>
> Peter Maydell (15):
>       target/arm: Allow relevant HCR bits to be written for FEAT_EVT
>       target/arm: Implement HCR_EL2.TTLBIS traps
>       target/arm: Implement HCR_EL2.TTLBOS traps
>       target/arm: Implement HCR_EL2.TICAB,TOCU traps
>       target/arm: Implement HCR_EL2.TID4 traps
>       target/arm: Report FEAT_EVT for TCG '-cpu max'
>       hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
>       hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase reset
>       hw/intc: Convert TYPE_ARM_GIC_COMMON to 3-phase reset
>       hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase reset
>       hw/intc: Convert TYPE_ARM_GICV3_COMMON to 3-phase reset
>       hw/intc: Convert TYPE_KVM_ARM_GICV3 to 3-phase reset
>       hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to 3-phase reset
>       hw/intc: Convert TYPE_ARM_GICV3_ITS to 3-phase reset
>       hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase reset
>
> Philippe Mathieu-Daud=C3=A9 (1):
>       target/arm: Restrict arm_cpu_exec_interrupt() to TCG accelerator
>
> Schspa Shi (1):
>       hw/arm/boot: set initrd with #address-cells type in fdt
>
> Thomas Huth (1):
>       hw/misc: Move some arm-related files from specific_ss into softmmu_=
ss
>
> Timofey Kutergin (1):
>       target/arm: Add Cortex-A55 CPU
>
>  docs/system/arm/emulation.rst          |   1 +
>  docs/system/arm/virt.rst               |  18 +++
>  include/hw/arm/smmuv3.h                |   2 +-
>  include/hw/arm/virt.h                  |   2 +
>  include/hw/misc/xlnx-zynqmp-apu-ctrl.h |   2 +-
>  target/arm/cpu.h                       |  30 +++++
>  target/arm/kvm-consts.h                |   8 +-
>  hw/arm/boot.c                          |  10 +-
>  hw/arm/smmu-common.c                   |   7 +-
>  hw/arm/smmuv3.c                        |  12 +-
>  hw/arm/virt.c                          | 202 +++++++++++++++++++++++++++=
------
>  hw/intc/arm_gic_common.c               |   7 +-
>  hw/intc/arm_gic_kvm.c                  |  14 ++-
>  hw/intc/arm_gicv3_common.c             |   7 +-
>  hw/intc/arm_gicv3_dist.c               |   4 +-
>  hw/intc/arm_gicv3_its.c                |  14 ++-
>  hw/intc/arm_gicv3_its_common.c         |   7 +-
>  hw/intc/arm_gicv3_its_kvm.c            |  14 ++-
>  hw/intc/arm_gicv3_kvm.c                |  14 ++-
>  hw/misc/imx6_src.c                     |   2 +-
>  hw/misc/iotkit-sysctl.c                |   1 -
>  target/arm/cpu.c                       |   5 +-
>  target/arm/cpu64.c                     |  70 ++++++++++++
>  target/arm/cpu_tcg.c                   |   1 +
>  target/arm/helper.c                    | 135 ++++++++++++++--------
>  hw/misc/meson.build                    |  11 +-
>  26 files changed, 459 insertions(+), 141 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

