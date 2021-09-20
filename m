Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B825C411B54
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:56:59 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMbC-0004lf-Pg
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSMI7-0004Nb-Ur
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:37:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSMI4-00075P-CG
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:37:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id x6so31425687wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+qDEMZERjc1bc50zbCleIPrusptHpC1G+0+9jqs38Ko=;
 b=RjCwgjlU84m7KCwiQeTqjrx9Hfk8D05awEC5Wodzm4GL8Dq3GHjUFFU0bECTJxz6+2
 EF+LboJfQnv99vHlyiuH+do6M98Gx3wlqQrJ/LIvKzw6t9PQcw1ncBG2y8YYRAlBu9iG
 FzPLRmMPYukb0NkmqkN9V7C1le8VF7GSUFRSHADG2dvU7oO6hhDGgW978YLdtjVM3FQM
 VB5j5aDEQkuXcqlwMY0yc1xun/y9uwrTnmbRsBDXMSwPK2BQhCP1Fp77Z0KTbWDQGuse
 iascNgHkAryYiVxwwSkJW/xXvgEuyMdy64ZacMpmPOHloUVbs5BSn/1EmxC4pKakuYmB
 eKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+qDEMZERjc1bc50zbCleIPrusptHpC1G+0+9jqs38Ko=;
 b=ZRb3Tz8tA4C5B9xFF3JCA8Kb00iS5pR52360lY5G26uCZQZvHoSIbqdIhJtmQkLwID
 i7cfBjpUlRi8gdRRIx4bxsnP9k/7l77m55kw8wOzjZ/g7jA38mVCrhEr4hVAbwDjmT5Z
 lVnqEYUTA7LJYWVoB7W2bJs52GawZSoMNQ2yuKBuVSh/1F5FurNCB5Ra8YZtMkRBsbPM
 2zMEQs1vKikHMJ3hd5C8Fcm3AglXbFv+Vgb7pXOMrYQAKyPgvnttT+6vn2+4M87J1TBR
 eVFTAdxcFUuxZ/9jAOlOGlXrcZ1FSeJHPdL6my/6n4cBpD61L0U/+P4/IoYo/wNzvqWz
 85VQ==
X-Gm-Message-State: AOAM532mxb6m6Xq6ApVSYUsaxtn/z2TGVcWWRVfpHYI7n2OQjrQPmxli
 feyEoYl5rDnNWkiJ/yov3fL3aA==
X-Google-Smtp-Source: ABdhPJzFvqa+8qe9JyZrvGAgVc0qsRS60XtjDa6E1e+wE+H+ALo8OqmO4Oc0TfTdilTuCdhLAYLp3A==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr29940839wre.85.1632155829820; 
 Mon, 20 Sep 2021 09:37:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm16594392wrj.96.2021.09.20.09.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 09:37:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EDC01FF96;
 Mon, 20 Sep 2021 17:37:07 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <c17683ce-507e-cd7b-e36b-b511e8ccd15a@suse.de>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Liang Yan <lyan@suse.de>
Subject: Re: [PATCH v16 00/99] arm tcg/kvm refactor and split with kvm only
 support
Date: Mon, 20 Sep 2021 17:27:03 +0100
In-reply-to: <c17683ce-507e-cd7b-e36b-b511e8ccd15a@suse.de>
Message-ID: <877dfbp5jh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Liang Yan <lyan@suse.de> writes:

> Hi Alex,
>
> I am wondering the current status on this patch series.

The current state of my tree is:

  https://github.com/stsquad/qemu/tree/arm/refactor-tcg-accel-split-v17

I haven't had a chance to look at it in the last few months but some
bits and pieces have been merged including a few Kconfig tweaks and the
--with-default-FOO patches.

> I have been working on it recently, I am wondering f you have a wip-git-r=
epo,=C2=A0 I can send my patches there if not duplicated,
>
> otherwise I can resend the series here with a=C2=A0 new rebase and some
> fixes based on the comments.

Whichever works for you. You can either apply your patches to my WIP
branch and re-base and post the lot or you can apply my last post and
fix up from there. The former may save you some conflict resolutions as
that it more or less what I've been doing.

When you post the series please CC me so I can keep in the loop. A lot
of the earlier patches are already reviewed so hopefully the
non-controversial stuff can get merged into target-arm.next fairly
quickly now we have 6.1 out of the door.

>
> Let me know what you think, thanks.
>
>
> Regards,
>
> Liang
>
>
> On 6/4/21 11:51, Alex Benn=C3=A9e wrote:
>> Hi,
>>
>> I have picked up the baton from Claudio to try and get the ARM
>> re-factoring across the line. Most of the patches from Claudio remain
>> unchanged and have just had minor fixups from re-basing against the
>> moving target. I've done my best to make sure any fixes that have been
>> made in the meantime weren't lost.
>>
>> I've included Phillipe's qtest_has_accel v7 patches (I had problems
>> with v8) to aid in my aarch64 testing. I'm expecting them to be
>> up-streamed by Phillipe in due course. I've also nabbed one of
>> Phillipe's Kconfig tweaks to allow for target specific expression of
>> some config variables.
>>
>> The main thing that enables the --disable-tcg build is the addition of
>> --with-devices-FOO configure option which is a mechanism to override
>> the existing default device configurations. The two that I've been
>> testing are a 64 bit only build on x86:
>>
>>    '../../configure' '--without-default-features' \
>>       '--target-list=3Darm-softmmu,aarch64-softmmu' \
>>       '--with-devices-aarch64=3D../../configs/aarch64-softmmu/64bit-only=
.mak'
>>
>> which results in the aarch64-softmmu build only supporting sbsa-ref,
>> virt and xlnx-versal-virt.
>>
>> The second is a KVM only cross build:
>>
>>    '../../configure' '--disable-docs' \
>>      '--target-list=3Daarch64-softmmu' \
>>      '--enable-kvm' '--disable-tcg' \
>>      '--cross-prefix=3Daarch64-linux-gnu-' \
>>      '--with-devices-aarch64=3D../../configs/aarch64-softmmu/virt-only.m=
ak'
>>
>> Finally I've made a few minor Kconfig and testing tweaks before adding
>> some gitlab coverage. As a result I was able to drop the Revert: idau
>> patch because I can properly build an image without stray devices in
>> the qtree.
>>
>> The following need review:
>>
>>   - gitlab: defend the new stripped down arm64 configs
>>   - tests/qtest: make xlnx-can-test conditional on being configured
>>   - tests/qtest: split the cdrom-test into arm/aarch64
>>   - hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
>>   - target/arm: move CONFIG_V7M out of default-devices
>>
>> Alex Benn=C3=A9e (6):
>>    target/arm: move CONFIG_V7M out of default-devices
>>    hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
>>    tests/qtest: split the cdrom-test into arm/aarch64
>>    tests/qtest: make xlnx-can-test conditional on being configured
>>    configure: allow the overriding of default-config in the build
>>    gitlab: defend the new stripped down arm64 configs
>>
>> Claudio Fontana (80):
>>    meson: add target_user_arch
>>    accel: add cpu_reset
>>    target/arm: move translate modules to tcg/
>>    target/arm: move helpers to tcg/
>>    arm: tcg: only build under CONFIG_TCG
>>    target/arm: tcg: add sysemu and user subdirs
>>    target/arm: tcg: split mte_helper user-only and sysemu code
>>    target/arm: tcg: move sysemu-only parts of debug_helper
>>    target/arm: tcg: split tlb_helper user-only and sysemu-only parts
>>    target/arm: tcg: split m_helper user-only and sysemu-only parts
>>    target/arm: only build psci for TCG
>>    target/arm: split off cpu-sysemu.c
>>    target/arm: tcg: fix comment style before move to cpu-mmu
>>    target/arm: move physical address translation to cpu-mmu
>>    target/arm: fix style in preparation of new cpregs module
>>    target/arm: split cpregs from tcg/helper.c
>>    target/arm: move cpu definitions to common cpu module
>>    target/arm: only perform TCG cpu and machine inits if TCG enabled
>>    target/arm: tcg: add stubs for some helpers for non-tcg builds
>>    target/arm: move cpsr_read, cpsr_write to cpu_common
>>    target/arm: add temporary stub for arm_rebuild_hflags
>>    target/arm: move arm_hcr_el2_eff from tcg/ to common_cpu
>>    target/arm: split vfp state setting from tcg helpers
>>    target/arm: move arm_mmu_idx* to cpu-mmu
>>    target/arm: move sve_zcr_len_for_el to common_cpu
>>    target/arm: move arm_sctlr away from tcg helpers
>>    target/arm: move arm_cpu_list to common_cpu
>>    target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code
>>    target/arm: new cpu32 ARM 32 bit CPU Class
>>    target/arm: split 32bit and 64bit arm dump state
>>    target/arm: move a15 cpu model away from the TCG-only models
>>    target/arm: fixup sve_exception_el code style before move
>>    target/arm: move sve_exception_el out of TCG helpers
>>    target/arm: fix comments style of fp_exception_el before moving it
>>    target/arm: move fp_exception_el out of TCG helpers
>>    target/arm: remove now useless ifndef from fp_exception_el
>>    target/arm: make further preparation for the exception code to move
>>    target/arm: fix style of arm_cpu_do_interrupt functions before move
>>    target/arm: move exception code out of tcg/helper.c
>>    target/arm: rename handle_semihosting to tcg_handle_semihosting
>>    target/arm: replace CONFIG_TCG with tcg_enabled
>>    target/arm: move TCGCPUOps to tcg/tcg-cpu.c
>>    target/arm: move cpu_tcg to tcg/tcg-cpu-models.c
>>    target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>>    target/arm: remove kvm include file for PSCI and arm-powerctl
>>    target/arm: move kvm-const.h, kvm.c, kvm64.c, kvm_arm.h to kvm/
>>    MAINTAINERS: update arm kvm maintained files to all in target/arm/kvm/
>>    target/arm: cleanup cpu includes
>>    target/arm: remove broad "else" statements when checking accels
>>    target/arm: remove kvm-stub.c
>>    tests/qtest: skip bios-tables-test test_acpi_oem_fields_virt for KVM
>>    tests: do not run test-hmp on all machines for ARM KVM-only
>>    tests: device-introspect-test: cope with ARM TCG-only devices
>>    tests: do not run qom-test on all machines for ARM KVM-only
>>    target/arm: create kvm cpu accel class
>>    target/arm: move kvm post init initialization to kvm cpu accel
>>    target/arm: add tcg cpu accel class
>>    target/arm: move TCG gt timer creation code in tcg/
>>    target/arm: cpu-sve: new module
>>    target/arm: cpu-sve: rename functions according to module prefix
>>    target/arm: cpu-sve: split TCG and KVM functionality
>>    target/arm: cpu-sve: make cpu_sve_finalize_features return bool
>>    target/arm: make is_aa64 and arm_el_is_aa64 a macro for
>>      !TARGET_AARCH64
>>    target/arm: restrict rebuild_hflags_a64 to TARGET_AARCH64
>>    target/arm: arch_dump: restrict ELFCLASS64 to AArch64
>>    target/arm: cpu-exceptions, cpu-exceptions-aa64: new modules
>>    target/arm: tcg: restrict ZCR cpregs to TARGET_AARCH64
>>    target/arm: tcg-sve: import narrow_vq and change_el functions
>>    target/arm: tcg-sve: rename the narrow_vq and change_el functions
>>    target/arm: move sve_zcr_len_for_el to TARGET_AARCH64-only cpu-sve
>>    cpu-sve: rename sve_zcr_len_for_el to cpu_sve_get_zcr_len_for_el
>>    target/arm: cpu-common: wrap a64-only check with is_a64
>>    target/arm: cpu-pauth: new module for ARMv8.3 Pointer Authentication
>>    target/arm: cpu-pauth: change arm_cpu_pauth_finalize name and sig
>>    target/arm: move arm_cpu_finalize_features into cpu64
>>    target/arm: cpu64: rename arm_cpu_finalize_features
>>    target/arm: cpu64: some final cleanup on aarch64_cpu_finalize_features
>>    XXX target/arm: experiment refactoring cpu "max"
>>    target/arm: tcg: remove superfluous CONFIG_TCG check
>>    target/arm: remove v7m stub function for !CONFIG_TCG
>>
>> Philippe Mathieu-Daud=C3=A9 (13):
>>    MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section
>>    accel: Introduce 'query-accels' QMP command
>>    qtest: Add qtest_has_accel() method
>>    qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
>>    qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
>>    qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
>>    qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
>>    qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64
>>    qtest/bios-tables-test: Rename tests not TCG specific
>>    qtest/bios-tables-test: Rename TCG specific tests
>>    qtest/bios-tables-test: Make test build-independent from accelerator
>>    qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore
>>    meson: Introduce target-specific Kconfig
>>
>>   configure                                     |   20 +
>>   configs/aarch64-softmmu/64bit-only.mak        |   10 +
>>   configs/aarch64-softmmu/virt-only.mak         |    8 +
>>   default-configs/devices/arm-softmmu.mak       |    3 -
>>   meson.build                                   |    9 +-
>>   qapi/machine.json                             |   47 +
>>   include/hw/core/accel-cpu.h                   |    2 +
>>   include/qemu/accel.h                          |    6 +
>>   target/arm/arm-powerctl.h                     |    2 -
>>   target/arm/cpregs.h                           |  515 ++
>>   target/arm/cpu-exceptions-aa64.h              |   28 +
>>   target/arm/cpu-mmu.h                          |  119 +
>>   target/arm/cpu-qom.h                          |    3 -
>>   target/arm/cpu-sve.h                          |   40 +
>>   target/arm/cpu-vfp.h                          |   29 +
>>   target/arm/cpu.h                              |  534 +-
>>   target/arm/cpu32.h                            |   32 +
>>   target/arm/helper-a64.h                       |    2 +
>>   target/arm/helper.h                           |    1 -
>>   target/arm/internals.h                        |   46 +-
>>   target/arm/{ =3D> kvm}/kvm-consts.h             |    0
>>   target/arm/kvm/kvm-sve.h                      |   28 +
>>   target/arm/{ =3D> kvm}/kvm_arm.h                |    0
>>   target/arm/kvm/trace.h                        |    1 +
>>   target/arm/tcg/cpu-pauth.h                    |   34 +
>>   target/arm/tcg/m_helper.h                     |   21 +
>>   target/arm/tcg/mte_helper.h                   |   53 +
>>   target/arm/{ =3D> tcg}/op_addsub.h              |    0
>>   target/arm/tcg/tcg-cpu.h                      |   40 +
>>   target/arm/tcg/tcg-sve.h                      |   29 +
>>   target/arm/tcg/tlb_helper.h                   |   17 +
>>   target/arm/tcg/trace.h                        |    1 +
>>   target/arm/{ =3D> tcg}/translate-a64.h          |    0
>>   target/arm/{ =3D> tcg}/translate.h              |    0
>>   target/arm/{ =3D> tcg}/vec_internal.h           |    0
>>   target/arm/trace.h                            |    1 -
>>   tests/qtest/libqos/libqtest.h                 |    8 +
>>   target/arm/{ =3D> tcg}/a32-uncond.decode        |    0
>>   target/arm/{ =3D> tcg}/a32.decode               |    0
>>   target/arm/{ =3D> tcg}/m-nocp.decode            |    0
>>   target/arm/{ =3D> tcg}/neon-dp.decode           |    0
>>   target/arm/{ =3D> tcg}/neon-ls.decode           |    0
>>   target/arm/{ =3D> tcg}/neon-shared.decode       |    0
>>   target/arm/{ =3D> tcg}/sve.decode               |    0
>>   target/arm/{ =3D> tcg}/t16.decode               |    0
>>   target/arm/{ =3D> tcg}/t32.decode               |    0
>>   target/arm/{ =3D> tcg}/vfp-uncond.decode        |    0
>>   target/arm/{ =3D> tcg}/vfp.decode               |    0
>>   accel/accel-common.c                          |    9 +
>>   accel/accel-qmp.c                             |   49 +
>>   hw/arm/boot.c                                 |    5 +-
>>   hw/arm/pxa2xx.c                               |    1 +
>>   hw/arm/pxa2xx_pic.c                           |    1 +
>>   hw/arm/sbsa-ref.c                             |    2 +-
>>   hw/arm/virt-acpi-build.c                      |    2 +-
>>   hw/arm/virt.c                                 |    2 +-
>>   hw/arm/xlnx-versal.c                          |    2 +-
>>   hw/arm/xlnx-zynqmp.c                          |    2 +-
>>   hw/core/cpu-common.c                          |    3 +-
>>   hw/cpu/a15mpcore.c                            |    2 +-
>>   hw/intc/arm_gic_kvm.c                         |    2 +-
>>   hw/intc/arm_gicv3_cpuif.c                     |    1 +
>>   hw/intc/arm_gicv3_its_kvm.c                   |    2 +-
>>   hw/intc/arm_gicv3_kvm.c                       |    3 +-
>>   linux-user/syscall.c                          |    6 +-
>>   target/arm/arch_dump.c                        |   15 +-
>>   target/arm/arm-powerctl.c                     |    8 +-
>>   target/arm/cpregs.c                           |  380 +
>>   target/arm/cpu-common.c                       |  358 +
>>   target/arm/cpu-exceptions-aa64.c              |  277 +
>>   target/arm/cpu-exceptions.c                   |  445 ++
>>   target/arm/cpu-mmu-sysemu.c                   | 2307 ++++++
>>   target/arm/cpu-mmu.c                          |  215 +
>>   target/arm/cpu-sve.c                          |  323 +
>>   target/arm/cpu-sysemu.c                       |  482 ++
>>   target/arm/cpu-user.c                         |   46 +
>>   target/arm/cpu-vfp.c                          |   97 +
>>   target/arm/cpu.c                              |  759 +-
>>   target/arm/cpu32.c                            |  260 +
>>   target/arm/cpu64.c                            |  723 +-
>>   target/arm/cpustate-list.c                    |  146 +
>>   target/arm/gdbstub.c                          |    1 +
>>   target/arm/kvm-stub.c                         |   24 -
>>   target/arm/kvm/kvm-cpu.c                      |  128 +
>>   target/arm/kvm/kvm-sve.c                      |  118 +
>>   target/arm/{ =3D> kvm}/kvm.c                    |   18 +-
>>   target/arm/{ =3D> kvm}/kvm64.c                  |    0
>>   target/arm/machine.c                          |   39 +-
>>   target/arm/monitor.c                          |   10 +-
>>   target/arm/psci.c                             |    1 -
>>   target/arm/{helper.c =3D> tcg/cpregs.c}         | 6557 +--------------=
--
>>   target/arm/tcg/cpu-pauth.c                    |   66 +
>>   target/arm/tcg/cpu-vfp.c                      |  146 +
>>   target/arm/{ =3D> tcg}/crypto_helper.c          |    0
>>   target/arm/{ =3D> tcg}/debug_helper.c           |   27 -
>>   target/arm/{ =3D> tcg}/helper-a64.c             |    3 +-
>>   target/arm/tcg/helper.c                       | 1300 ++++
>>   target/arm/{ =3D> tcg}/iwmmxt_helper.c          |    0
>>   target/arm/tcg/m_helper.c                     |   93 +
>>   target/arm/{ =3D> tcg}/mte_helper.c             |  191 +-
>>   target/arm/{ =3D> tcg}/neon_helper.c            |    0
>>   target/arm/{ =3D> tcg}/op_helper.c              |    1 +
>>   target/arm/{ =3D> tcg}/pauth_helper.c           |    2 +-
>>   target/arm/{ =3D> tcg}/sve_helper.c             |    0
>>   target/arm/tcg/sysemu/debug_helper.c          |   33 +
>>   target/arm/{ =3D> tcg/sysemu}/m_helper.c        |  203 +-
>>   target/arm/tcg/sysemu/mte_helper.c            |  159 +
>>   target/arm/tcg/sysemu/tcg-cpu.c               |  119 +
>>   target/arm/tcg/sysemu/tlb_helper.c            |   84 +
>>   .../arm/{cpu_tcg.c =3D> tcg/tcg-cpu-models.c}   |  153 +-
>>   target/arm/tcg/tcg-cpu.c                      |  502 ++
>>   target/arm/tcg/tcg-stubs.c                    |   21 +
>>   target/arm/tcg/tcg-sve.c                      |  167 +
>>   target/arm/{ =3D> tcg}/tlb_helper.c             |   97 +-
>>   target/arm/{ =3D> tcg}/translate-a64.c          |    1 +
>>   target/arm/{ =3D> tcg}/translate-m-nocp.c       |    0
>>   target/arm/{ =3D> tcg}/translate-neon.c         |    0
>>   target/arm/{ =3D> tcg}/translate-sve.c          |    0
>>   target/arm/{ =3D> tcg}/translate-vfp.c          |    0
>>   target/arm/{ =3D> tcg}/translate.c              |    1 +
>>   target/arm/tcg/user/m_helper.c                |   97 +
>>   target/arm/tcg/user/mte_helper.c              |   57 +
>>   target/arm/tcg/user/tlb_helper.c              |   32 +
>>   target/arm/{ =3D> tcg}/vec_helper.c             |    0
>>   target/arm/{ =3D> tcg}/vfp_helper.c             |  216 +-
>>   target/i386/cpu.c                             |    4 -
>>   target/i386/kvm/kvm-cpu.c                     |    6 +
>>   tests/qtest/arm-cpu-features.c                |   47 +-
>>   tests/qtest/bios-tables-test.c                |  163 +-
>>   tests/qtest/cdrom-test.c                      |    5 +-
>>   tests/qtest/device-introspect-test.c          |   32 +-
>>   tests/qtest/libqtest.c                        |   29 +
>>   tests/qtest/migration-test.c                  |    4 +-
>>   tests/qtest/qom-test.c                        |   20 +
>>   tests/qtest/test-hmp.c                        |   20 +
>>   .gitlab-ci.d/buildtest.yml                    |   10 +
>>   .gitlab-ci.d/crossbuilds.yml                  |    9 +
>>   Kconfig                                       |    1 +
>>   MAINTAINERS                                   |    3 +-
>>   accel/meson.build                             |    2 +-
>>   hw/arm/Kconfig                                |    4 +
>>   roms/u-boot                                   |    2 +-
>>   target/Kconfig                                |   23 +
>>   target/alpha/Kconfig                          |    2 +
>>   target/alpha/meson.build                      |    3 +
>>   target/arm/Kconfig                            |    6 +
>>   target/arm/kvm/meson.build                    |    6 +
>>   target/arm/kvm/trace-events                   |    4 +
>>   target/arm/meson.build                        |   64 +-
>>   target/arm/tcg/meson.build                    |   53 +
>>   target/arm/tcg/sysemu/meson.build             |   10 +
>>   target/arm/{ =3D> tcg}/trace-events             |    5 +-
>>   target/arm/tcg/user/meson.build               |    5 +
>>   target/avr/Kconfig                            |    2 +
>>   target/cris/Kconfig                           |    2 +
>>   target/cris/meson.build                       |    3 +
>>   target/hexagon/meson.build                    |    3 +
>>   target/hppa/Kconfig                           |    2 +
>>   target/hppa/meson.build                       |    3 +
>>   target/i386/Kconfig                           |    5 +
>>   target/lm32/Kconfig                           |    2 +
>>   target/m68k/Kconfig                           |    2 +
>>   target/m68k/meson.build                       |    3 +
>>   target/microblaze/Kconfig                     |    2 +
>>   target/microblaze/meson.build                 |    3 +
>>   target/mips/Kconfig                           |    6 +
>>   target/moxie/Kconfig                          |    2 +
>>   target/nios2/Kconfig                          |    2 +
>>   target/nios2/meson.build                      |    3 +
>>   target/openrisc/Kconfig                       |    2 +
>>   target/openrisc/meson.build                   |    3 +
>>   target/ppc/Kconfig                            |    5 +
>>   target/ppc/meson.build                        |    3 +
>>   target/riscv/Kconfig                          |    5 +
>>   target/riscv/meson.build                      |    3 +
>>   target/rx/Kconfig                             |    2 +
>>   target/s390x/Kconfig                          |    2 +
>>   target/s390x/meson.build                      |    3 +
>>   target/sh4/Kconfig                            |    2 +
>>   target/sh4/meson.build                        |    3 +
>>   target/sparc/Kconfig                          |    5 +
>>   target/sparc/meson.build                      |    3 +
>>   target/tilegx/Kconfig                         |    2 +
>>   target/tricore/Kconfig                        |    2 +
>>   target/tricore/meson.build                    |    3 +
>>   target/unicore32/Kconfig                      |    2 +
>>   target/xtensa/Kconfig                         |    2 +
>>   target/xtensa/meson.build                     |    3 +
>>   tests/qtest/meson.build                       |    5 +-
>>   189 files changed, 10701 insertions(+), 9237 deletions(-)
>>   create mode 100644 configs/aarch64-softmmu/64bit-only.mak
>>   create mode 100644 configs/aarch64-softmmu/virt-only.mak
>>   create mode 100644 target/arm/cpregs.h
>>   create mode 100644 target/arm/cpu-exceptions-aa64.h
>>   create mode 100644 target/arm/cpu-mmu.h
>>   create mode 100644 target/arm/cpu-sve.h
>>   create mode 100644 target/arm/cpu-vfp.h
>>   create mode 100644 target/arm/cpu32.h
>>   rename target/arm/{ =3D> kvm}/kvm-consts.h (100%)
>>   create mode 100644 target/arm/kvm/kvm-sve.h
>>   rename target/arm/{ =3D> kvm}/kvm_arm.h (100%)
>>   create mode 100644 target/arm/kvm/trace.h
>>   create mode 100644 target/arm/tcg/cpu-pauth.h
>>   create mode 100644 target/arm/tcg/m_helper.h
>>   create mode 100644 target/arm/tcg/mte_helper.h
>>   rename target/arm/{ =3D> tcg}/op_addsub.h (100%)
>>   create mode 100644 target/arm/tcg/tcg-cpu.h
>>   create mode 100644 target/arm/tcg/tcg-sve.h
>>   create mode 100644 target/arm/tcg/tlb_helper.h
>>   create mode 100644 target/arm/tcg/trace.h
>>   rename target/arm/{ =3D> tcg}/translate-a64.h (100%)
>>   rename target/arm/{ =3D> tcg}/translate.h (100%)
>>   rename target/arm/{ =3D> tcg}/vec_internal.h (100%)
>>   delete mode 100644 target/arm/trace.h
>>   rename target/arm/{ =3D> tcg}/a32-uncond.decode (100%)
>>   rename target/arm/{ =3D> tcg}/a32.decode (100%)
>>   rename target/arm/{ =3D> tcg}/m-nocp.decode (100%)
>>   rename target/arm/{ =3D> tcg}/neon-dp.decode (100%)
>>   rename target/arm/{ =3D> tcg}/neon-ls.decode (100%)
>>   rename target/arm/{ =3D> tcg}/neon-shared.decode (100%)
>>   rename target/arm/{ =3D> tcg}/sve.decode (100%)
>>   rename target/arm/{ =3D> tcg}/t16.decode (100%)
>>   rename target/arm/{ =3D> tcg}/t32.decode (100%)
>>   rename target/arm/{ =3D> tcg}/vfp-uncond.decode (100%)
>>   rename target/arm/{ =3D> tcg}/vfp.decode (100%)
>>   create mode 100644 accel/accel-qmp.c
>>   create mode 100644 target/arm/cpregs.c
>>   create mode 100644 target/arm/cpu-common.c
>>   create mode 100644 target/arm/cpu-exceptions-aa64.c
>>   create mode 100644 target/arm/cpu-exceptions.c
>>   create mode 100644 target/arm/cpu-mmu-sysemu.c
>>   create mode 100644 target/arm/cpu-mmu.c
>>   create mode 100644 target/arm/cpu-sve.c
>>   create mode 100644 target/arm/cpu-sysemu.c
>>   create mode 100644 target/arm/cpu-user.c
>>   create mode 100644 target/arm/cpu-vfp.c
>>   create mode 100644 target/arm/cpu32.c
>>   create mode 100644 target/arm/cpustate-list.c
>>   delete mode 100644 target/arm/kvm-stub.c
>>   create mode 100644 target/arm/kvm/kvm-cpu.c
>>   create mode 100644 target/arm/kvm/kvm-sve.c
>>   rename target/arm/{ =3D> kvm}/kvm.c (98%)
>>   rename target/arm/{ =3D> kvm}/kvm64.c (100%)
>>   rename target/arm/{helper.c =3D> tcg/cpregs.c} (57%)
>>   create mode 100644 target/arm/tcg/cpu-pauth.c
>>   create mode 100644 target/arm/tcg/cpu-vfp.c
>>   rename target/arm/{ =3D> tcg}/crypto_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/debug_helper.c (92%)
>>   rename target/arm/{ =3D> tcg}/helper-a64.c (99%)
>>   create mode 100644 target/arm/tcg/helper.c
>>   rename target/arm/{ =3D> tcg}/iwmmxt_helper.c (100%)
>>   create mode 100644 target/arm/tcg/m_helper.c
>>   rename target/arm/{ =3D> tcg}/mte_helper.c (76%)
>>   rename target/arm/{ =3D> tcg}/neon_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/op_helper.c (99%)
>>   rename target/arm/{ =3D> tcg}/pauth_helper.c (99%)
>>   rename target/arm/{ =3D> tcg}/sve_helper.c (100%)
>>   create mode 100644 target/arm/tcg/sysemu/debug_helper.c
>>   rename target/arm/{ =3D> tcg/sysemu}/m_helper.c (94%)
>>   create mode 100644 target/arm/tcg/sysemu/mte_helper.c
>>   create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c
>>   create mode 100644 target/arm/tcg/sysemu/tlb_helper.c
>>   rename target/arm/{cpu_tcg.c =3D> tcg/tcg-cpu-models.c} (86%)
>>   create mode 100644 target/arm/tcg/tcg-cpu.c
>>   create mode 100644 target/arm/tcg/tcg-stubs.c
>>   create mode 100644 target/arm/tcg/tcg-sve.c
>>   rename target/arm/{ =3D> tcg}/tlb_helper.c (56%)
>>   rename target/arm/{ =3D> tcg}/translate-a64.c (99%)
>>   rename target/arm/{ =3D> tcg}/translate-m-nocp.c (100%)
>>   rename target/arm/{ =3D> tcg}/translate-neon.c (100%)
>>   rename target/arm/{ =3D> tcg}/translate-sve.c (100%)
>>   rename target/arm/{ =3D> tcg}/translate-vfp.c (100%)
>>   rename target/arm/{ =3D> tcg}/translate.c (99%)
>>   create mode 100644 target/arm/tcg/user/m_helper.c
>>   create mode 100644 target/arm/tcg/user/mte_helper.c
>>   create mode 100644 target/arm/tcg/user/tlb_helper.c
>>   rename target/arm/{ =3D> tcg}/vec_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/vfp_helper.c (84%)
>>   create mode 100644 target/Kconfig
>>   create mode 100644 target/alpha/Kconfig
>>   create mode 100644 target/arm/Kconfig
>>   create mode 100644 target/arm/kvm/meson.build
>>   create mode 100644 target/arm/kvm/trace-events
>>   create mode 100644 target/arm/tcg/meson.build
>>   create mode 100644 target/arm/tcg/sysemu/meson.build
>>   rename target/arm/{ =3D> tcg}/trace-events (78%)
>>   create mode 100644 target/arm/tcg/user/meson.build
>>   create mode 100644 target/avr/Kconfig
>>   create mode 100644 target/cris/Kconfig
>>   create mode 100644 target/hppa/Kconfig
>>   create mode 100644 target/i386/Kconfig
>>   create mode 100644 target/lm32/Kconfig
>>   create mode 100644 target/m68k/Kconfig
>>   create mode 100644 target/microblaze/Kconfig
>>   create mode 100644 target/mips/Kconfig
>>   create mode 100644 target/moxie/Kconfig
>>   create mode 100644 target/nios2/Kconfig
>>   create mode 100644 target/openrisc/Kconfig
>>   create mode 100644 target/ppc/Kconfig
>>   create mode 100644 target/riscv/Kconfig
>>   create mode 100644 target/rx/Kconfig
>>   create mode 100644 target/s390x/Kconfig
>>   create mode 100644 target/sh4/Kconfig
>>   create mode 100644 target/sparc/Kconfig
>>   create mode 100644 target/tilegx/Kconfig
>>   create mode 100644 target/tricore/Kconfig
>>   create mode 100644 target/unicore32/Kconfig
>>   create mode 100644 target/xtensa/Kconfig
>>


--=20
Alex Benn=C3=A9e

