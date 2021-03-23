Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580B34684E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:00:11 +0100 (CET)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmGA-0001DI-Iz
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOm39-0001wr-S0
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:46:43 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOm36-00055k-3s
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:46:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id j3so24620440edp.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=A3qs+l4brFZzCEOacXQ9neXshvpRhYu7M1rtk261ObE=;
 b=FlHUQQXmPeq2nJeVV58p3Ty14+EuHdWBGQ5iUTga1MiVJe4wCCABrE0szPb92/0j3c
 W9hyUGnslGJHF8Lx2JYRH+wSDAUsSgJ1SD2gO2K5pOftG5UeZzS8ArESfQC0vO/Oh9CJ
 JvFWlk7PCl/zbBHaf1j0jxtS0SddB1Ob0m0hzWeQGrzi4dHASatHx+vmhptdUur5zFUB
 h72eP0MFbTTBzjWiKbnGVk9kZeQasXmJ6HkE/JVhlcRkL+Sd+Fuhy/Q/jlvfLlzbYBgv
 nIuNOF8rfdYmGpbUQ3ucYmfBAf20Edk0KfEwE82sgaZ2mxyq3u9AmmAKxxCsTqbxrSlh
 P3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=A3qs+l4brFZzCEOacXQ9neXshvpRhYu7M1rtk261ObE=;
 b=eaPJjoT1ylFOzrUNLbp/KEfvgV4jkSPRLVeiJG84E00u85XBo0b/nG+c6SWjIewirq
 duXx1Wom383GS4KlQnzySA2XqQLDzRrF/jJy6/o+s4x7o/S0Wv7vVBQFQmAmV+ES9q9t
 aJByUVR2sPvHy11npDeB8ABJZU1TLGNdrjhmSmgLx5DnPGWeWryMIAQWJ11IfRkSTFq7
 AJ2Aa2ug8cys1AdbEcM1vUHNLWXKFuQOrZ6/XQCx1HgEiWPBj0m+NMeZWakZ1Lw4oKbV
 zkoLjCpTZzt5xtHYWNIhVdquOeBx615kqyLPUrXWz53Er6QF6GYOoVgp9VGG9wlF8fPP
 orjw==
X-Gm-Message-State: AOAM533AFjHTOQSCPqY+UXGrz3VfKNiYwvRWEYJCDybrVsKwTXym8lZ5
 FdPlsZsipJuyldlII+XRZWn4acAh4UQ5EjFB
X-Google-Smtp-Source: ABdhPJzxwCuVXGK9FlVC0IKVDE8LfuyNSqDmKenm7Ebt7pVPwx+pAOFmvrFk+4UIroFNVAEQyvckhA==
X-Received: by 2002:a50:fd15:: with SMTP id i21mr5819999eds.384.1616525198112; 
 Tue, 23 Mar 2021 11:46:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id la15sm11489661ejb.46.2021.03.23.11.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:46:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 174AF1FF7E;
 Tue, 23 Mar 2021 18:46:36 +0000 (GMT)
References: <20210322140206.9513-1-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v10 00/49] arm cleanup experiment for kvm-only build
Date: Tue, 23 Mar 2021 18:35:20 +0000
In-reply-to: <20210322140206.9513-1-cfontana@suse.de>
Message-ID: <87k0pxiu7n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Here a new version of the series that enables kvm-only builds.
>
> The goal here is to enable the KVM-only build, but there is
> some additional cleanup too.

First the good news. With --disable-tcg on my AArch64 system I can
successfully run:

  make vm-boot-ssh-ubuntu.aarch64 QEMU_LOCAL=3D1

and get a shell on a KVM powered VM. Bravo ;-)

Also I did a number of different builds:

   fdfind -0 -t x qemu-system-aarch64 | xargs -0 ls -lh
  -rwxrwxr-x 1 alex alex 129M Mar 23 18:09 all/qemu-system-aarch64
  -rwxrwxr-x 1 alex alex  64M Mar 23 18:16 disable.all/qemu-system-aarch64
  -rwxrwxr-x 1 alex alex  81M Mar 23 18:20 disable.defaults/qemu-system-aar=
ch64
  -rwxrwxr-x 1 alex alex  94M Mar 23 18:12 disable.tcg/qemu-system-aarch64

Where the builds are:

  fdfind -0 -t f config.log | xargs -0 head -n 2
  =3D=3D> all/config.log <=3D=3D
  # QEMU configure log Tue 23 Mar 2021 06:08:19 PM UTC
  # Configured with: '../../configure' '--skip-meson'

  =3D=3D> disable.all/config.log <=3D=3D
  # QEMU configure log Tue 23 Mar 2021 06:15:26 PM UTC
  # Configured with: '../../configure' '--disable-docs' '--disable-tcg' '--=
without-default-features' '--without-default-devices'

  =3D=3D> disable.defaults/config.log <=3D=3D
  # QEMU configure log Tue 23 Mar 2021 06:19:05 PM UTC
  # Configured with: '../../configure' '--disable-docs' '--disable-tcg' '--=
without-default-features'

  =3D=3D> disable.tcg/config.log <=3D=3D
  # QEMU configure log Tue 23 Mar 2021 06:10:38 PM UTC
  # Configured with: '../../configure' '--disable-docs' '--disable-tcg'

And they all build OK and at least give a minimally viable binary. The
--without-default-devices build fails to boot a VM although that's
probably to be expected as we don't have any handling yet for a custom
device set (probably -M virt and the virtio devices in this case).
Unsurprisingly this gets the shortest distance in make check:

  Running test qtest-aarch64/qom-test
  qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
  Broken pipe
  ERROR qtest-aarch64/qom-test - too few tests run (expected 1, got 0)
  make: *** [Makefile.mtest:24: run-test-1] Error 1

However I see other more esoteric failures in the other builds.
disable.tcg/disable.defaults:

  Running test qtest-aarch64/cdrom-test
  **
  ERROR:../../qom/object.c:714:object_new_with_type: assertion failed: (typ=
e !=3D NULL)
  ERROR qtest-aarch64/cdrom-test - Bail out! ERROR:../../qom/object.c:714:o=
bject_new_with_type: assertion failed: (type !=3D NULL)
  Broken pipe
  make: *** [Makefile.mtest:832: run-test-102] Error 1

As well as a failure on the normal build:

  Running test qtest-aarch64/migration-test
  ERROR qtest-aarch64/migration-test - Bail out! ERROR:../../target/arm/tcg=
/tcg-cpu.c:233:tcg_arm_init_accel_cpu: assertion failed: (object_class_by_n=
ame(ACCEL_CPU_NAME("tcg")
  ) =3D=3D OBJECT_CLASS(accel_cpu))
  Broken pipe
  make: *** [Makefile.mtest:272: run-test-32] Error 1

I'll see if I can do some bisecting to find the culprits.

>
> In this iteration we rebase on the latest i386_cleanup series,
> we add reset_cpu to the accel cpu methods in tcg/ and kvm/,
> and add an experimental refactoring of the "max" cpu type.
>
> Comments welcome, thanks,
>
> Ciao, C
>
> v9 -> v10:
>
> * "target/arm: create kvm cpu accel class"
>  - add accel_cpu::cpu_reset to kvm-cpu
>
> * "target/arm: add tcg cpu accel class"
>  - add accel_cpu::cpu_reset to tcg-cpu
>
> * 'XXX target/arm: experiment refactoring cpu "max"'
>  - new tentative RFC for discussion
>
> v8 -> v9:
> * added: "make is_aa64 and arm_el_is_aa64 a macro for !TARGET_AARCH64"
> * added: "arch_dump: restrict ELFCLASS64 to AArch64"
> * added: "cpu-exceptions: new module"
> * added: "tcg: restrict ZCR cpregs to TARGET_AARCH64"
> * added: "cpu-pauth: new module for ARMv8.3 Pointer Authentication"
> * added: "refactor arm_cpu_finalize_features into cpu64"
>
> v7 -> v8:
> * added split of SVE CPU properties code from cpu into cpu-sve.
> * added split of cpu-sve into tcg/cpu-sve and kvm/cpu-sve.
>
> v6 -> v7:
> * added tcg accel-cpu, experiment with improving the setting of the
>   TCGOps, as discussed at:
>   https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04315.html
>
> v5 -> v6:
> * rebased on latest master, adapted to arm changes
>
> * needed to restore the cortex-a15 cpu,
>   moving it away from the TCG-only cpu file. This is a partial
>   revert of commit "target/arm: Restrict TCG cpus to TCG accel"
>
> * added first patches that create the kvm cpu accel class
>
> v4 -> v5:
> * fixed other remaining tests for kvm-only build
> * rebased on latest target/arm changes (painful)
> * reverted Philippe's IDAU v8m change
>
> v3 -> v4:
>
> * added style cleanup patches
>
> * added header cleanup
>
> * added basic move of simple KVM-only code to kvm/
>
> * fixed some qtest failures due to existing:
>
>   if (kvm_enabled) {
>=20=20=20
>   } else {
>
>   }
>
>   which needed explicit if qtest_enabled() in addition to tcg_enabled() c=
heck
>
> * include 32bit cpus for AArch64 too.
>
> v2 -> v3:
>
> * "target/arm: tcg: add sysemu and user subsirs"
>   - new standalone patch to create the empty tcg/sysemu and tcg/user subd=
irs.
>
> * "target/arm: only build psci for TCG"
>   - do not move psci inside tcg/ directory, because HVF might use it soon.
>     (Peter)
>
> * "target/arm: move physical address translation"
>   - change the module name from "get-phys-addr" to "cpu-mmu",
>     which includes aa64_va_parameter in this patch, and that
>     will also contain the get_mmu_idx* functions later in the series.
>     (Richard)
>
> * "target/arm: split cpregs from tcg/helper.c"
>   - moved raw_read and raw_write to cpregs.h (Richard)
>
> * "target/arm: only perform TCG cpu and machine inits if TCG enabled"
>   - add an explanatory comment before the kvm function for cpreg list init
>   - change the use of g_renew to g_new, since we do not do the double
>     initialization of cpreg list anymore.
>
> * "target/arm: add temporary stub for arm_rebuild_hflags"
>   - use a if (tcg_enabled()) instead of #ifdef (Richard)
>
> * "target/arm: split vfp state setting from tcg helpers"
>   - explain better what goes where in the commit (Richard)
>
> * "target/arm: move arm_mmu_idx*"
>   - move the functions to cpu-mmu instead of get-phys-addr (Richard)
>
> * "target/arm: move sve_zcr_len_for_el to common_cpu"
>
>  - add a comment about those functions being in theory
>    TARGET_AARCH64 specific, but making the change would spawn
>    a large number of additional #ifdefs. This state predates this
>    change (Richard).
>
> * "target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code"
>
>  - explain better why these functions are needed for KVM too (Richard)
>
> * "target/arm: move sve_exception_el out of TCG helpers"
>
>  - bring over the sve_exception_el code, making it available for KVM too.
>    (Richard)
>
> * "target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()"
>
>  - mention in the commit that this enables finally a build with
>    configure --enable-kvm --disable-tcg
>
>
> v1 -> v2: reworked of the whole series
>
> In this v2, only the first two patches remain, the rest is
> reworked.
>
> Main reasons for the rework were:
>
> 1) moving out cpregs to its own module, leave the tcg-only part in tcg/
>
> 2) split of arm cpu32, cpu64 and cpu models. This is still not perfect,
>    but I think it's an improvement.
>
> 3) import less stuff, that is actually unused or can be stubbed on KVM
>    (thanks to the precious feedback on the previous RFCv1).
>
> ...
>
> Main issues:
>
> 1) basically needs the "configure only machines compatible with KVM" from=
 Philippe,
>    so we can avoid some of the stubs.

Yeah this is basically --without-default-devices with a KVM only subset
of devices.

>
> 2) tests/ work fine building with tcg or with tcg + kvm,
>    but for making a kvm-only build pass the tests, more work is needed in=
 tests/
>    figuring out which tests are TCG-only and which need to be tweaked.
>
> Thanks a lot for your comments!
>
>
> . / . / . / . / . / . /
>
>
> Hi all,
>
> this is an experiment, a cleanup based on and requiring the series
> "i386 cleanup PART 2":
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html
>
> The goal is to split the code between TCG-only and non-TCG code,
> fixing the KVM-only build (configure --disable-tcg),
>
> and laying the ground for further cleanups and the use of the
> new accel objects in the hierarchy to specialize the cpu
> according to the accelerator.
>
> This is known to be an early state, with probably a lot of work
> still needed.
>
> I thought it could be useful to share early, especially in light
> of the combination of this with Philippe's work on building
> only the machines and devices compatible with KVM for arm.
>
> Comments welcome, thanks,
>
> Claudio
>
>
> Claudio Fontana (49):
>   target/arm: move translate modules to tcg/
>   target/arm: move helpers to tcg/
>   arm: tcg: only build under CONFIG_TCG
>   target/arm: tcg: add sysemu and user subsirs
>   target/arm: only build psci for TCG
>   target/arm: split off cpu-sysemu.c
>   target/arm: move physical address translation to cpu-mmu
>   target/arm: cpu-mmu: fix comment style
>   target/arm: split cpregs from tcg/helper.c
>   target/arm: cpregs: fix style (mostly just comments)
>   target/arm: move cpu definitions to common cpu module
>   target/arm: only perform TCG cpu and machine inits if TCG enabled
>   target/arm: kvm: add stubs for some helpers
>   target/arm: move cpsr_read, cpsr_write to cpu_common
>   target/arm: add temporary stub for arm_rebuild_hflags
>   target/arm: split vfp state setting from tcg helpers
>   target/arm: move arm_mmu_idx* to cpu-mmu
>   target/arm: move sve_zcr_len_for_el to common_cpu
>   target/arm: move arm_sctlr away from tcg helpers
>   target/arm: move arm_cpu_list to common_cpu
>   target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code
>   target/arm: split a15 cpu model and 32bit class functions to cpu32.c
>   target/arm: move sve_exception_el out of TCG helpers
>   target/arm: refactor exception and cpu code
>   target/arm: cpu: fix style
>   target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>   target/arm: remove kvm include file for PSCI and arm-powerctl
>   target/arm: move kvm-const.h, kvm.c, kvm64.c, kvm_arm.h to kvm/
>   target/arm: cleanup cpu includes
>   target/arm: remove broad "else" statements when checking accels
>   tests/qtest: skip bios-tables-test test_acpi_oem_fields_virt for KVM
>   tests: restrict TCG-only arm-cpu-features tests to TCG builds
>   tests: do not run test-hmp on all machines for ARM KVM-only
>   tests: device-introspect-test: cope with ARM TCG-only devices
>   tests: do not run qom-test on all machines for ARM KVM-only
>   Revert "target/arm: Restrict v8M IDAU to TCG"
>   target/arm: create kvm cpu accel class
>   target/arm: move kvm post init initialization to kvm cpu accel
>   target/arm: add tcg cpu accel class
>   target/arm: move TCG gt timer creation code in tcg/
>   target/arm: cpu-sve: new module
>   target/arm: cpu-sve: split TCG and KVM functionality
>   target/arm: make is_aa64 and arm_el_is_aa64 a macro for
>     !TARGET_AARCH64
>   target/arm: arch_dump: restrict ELFCLASS64 to AArch64
>   target/arm: cpu-exceptions: new module
>   target/arm: tcg: restrict ZCR cpregs to TARGET_AARCH64
>   target/arm: cpu-pauth: new module for ARMv8.3 Pointer Authentication
>   target/arm: refactor arm_cpu_finalize_features into cpu64
>   XXX target/arm: experiment refactoring cpu "max"
>
>  meson.build                                   |    3 +-
>  target/arm/arm-powerctl.h                     |    2 -
>  target/arm/cpregs.h                           |  274 +
>  target/arm/cpu-exceptions-aa64.h              |   32 +
>  target/arm/cpu-mmu.h                          |  119 +
>  target/arm/cpu-qom.h                          |    3 -
>  target/arm/cpu-sve.h                          |   40 +
>  target/arm/cpu-vfp.h                          |   29 +
>  target/arm/cpu.h                              |  323 +-
>  target/arm/cpu32.h                            |   29 +
>  target/arm/helper-a64.h                       |    2 +
>  target/arm/helper.h                           |    1 -
>  target/arm/internals.h                        |   46 +-
>  target/arm/kvm/cpu-sve.h                      |   30 +
>  target/arm/{ =3D> kvm}/kvm-consts.h             |    0
>  target/arm/{ =3D> kvm}/kvm_arm.h                |    5 +-
>  target/arm/kvm/trace.h                        |    1 +
>  target/arm/tcg/cpu-pauth.h                    |   38 +
>  target/arm/tcg/cpu-sve.h                      |   31 +
>  target/arm/{ =3D> tcg}/op_addsub.h              |    0
>  target/arm/tcg/tcg-cpu.h                      |   40 +
>  target/arm/tcg/trace.h                        |    1 +
>  target/arm/{ =3D> tcg}/translate-a64.h          |    0
>  target/arm/{ =3D> tcg}/translate.h              |    0
>  target/arm/{ =3D> tcg}/vec_internal.h           |    0
>  target/arm/trace.h                            |    1 -
>  target/arm/{ =3D> tcg}/a32-uncond.decode        |    0
>  target/arm/{ =3D> tcg}/a32.decode               |    0
>  target/arm/{ =3D> tcg}/m-nocp.decode            |    0
>  target/arm/{ =3D> tcg}/neon-dp.decode           |    0
>  target/arm/{ =3D> tcg}/neon-ls.decode           |    0
>  target/arm/{ =3D> tcg}/neon-shared.decode       |    0
>  target/arm/{ =3D> tcg}/sve.decode               |    0
>  target/arm/{ =3D> tcg}/t16.decode               |    0
>  target/arm/{ =3D> tcg}/t32.decode               |    0
>  target/arm/{ =3D> tcg}/vfp-uncond.decode        |    0
>  target/arm/{ =3D> tcg}/vfp.decode               |    0
>  hw/arm/boot.c                                 |    5 +-
>  hw/arm/pxa2xx.c                               |    1 +
>  hw/arm/pxa2xx_pic.c                           |    1 +
>  hw/arm/sbsa-ref.c                             |    2 +-
>  hw/arm/virt-acpi-build.c                      |    2 +-
>  hw/arm/virt.c                                 |    2 +-
>  hw/arm/xlnx-versal.c                          |    2 +-
>  hw/arm/xlnx-zynqmp.c                          |    2 +-
>  hw/cpu/a15mpcore.c                            |    2 +-
>  hw/intc/arm_gic_kvm.c                         |    2 +-
>  hw/intc/arm_gicv3_cpuif.c                     |    1 +
>  hw/intc/arm_gicv3_its_kvm.c                   |    2 +-
>  hw/intc/arm_gicv3_kvm.c                       |    3 +-
>  linux-user/syscall.c                          |    4 +
>  target/arm/arch_dump.c                        |   13 +-
>  target/arm/arm-powerctl.c                     |    8 +-
>  target/arm/cpregs.c                           |  377 +
>  target/arm/cpu-common.c                       |  329 +
>  target/arm/cpu-exceptions-aa64.c              |  553 ++
>  target/arm/cpu-exceptions.c                   |  481 ++
>  target/arm/cpu-mmu-sysemu.c                   | 2305 +++++++
>  target/arm/cpu-mmu.c                          |  219 +
>  target/arm/cpu-sve.c                          |  292 +
>  target/arm/cpu-sysemu.c                       |   80 +
>  target/arm/cpu-user.c                         |   41 +
>  target/arm/cpu-vfp.c                          |   92 +
>  target/arm/cpu.c                              |  785 +--
>  target/arm/cpu32.c                            |  260 +
>  target/arm/cpu64.c                            |  698 +-
>  target/arm/cpustate-list.c                    |  146 +
>  target/arm/gdbstub.c                          |    5 +-
>  target/arm/kvm-stub.c                         |   24 -
>  target/arm/kvm/cpu-sve.c                      |  118 +
>  target/arm/kvm/helper-stubs.c                 |   43 +
>  target/arm/kvm/kvm-cpu.c                      |  127 +
>  target/arm/{ =3D> kvm}/kvm.c                    |   18 +-
>  target/arm/{ =3D> kvm}/kvm64.c                  |    8 +-
>  target/arm/machine.c                          |   40 +-
>  target/arm/monitor.c                          |   10 +-
>  target/arm/psci.c                             |    1 -
>  target/arm/{helper.c =3D> tcg/cpregs.c}         | 6102 +----------------
>  target/arm/tcg/cpu-pauth.c                    |   66 +
>  target/arm/tcg/cpu-sve.c                      |   80 +
>  target/arm/tcg/cpu-vfp.c                      |  146 +
>  target/arm/{ =3D> tcg}/crypto_helper.c          |    0
>  target/arm/{ =3D> tcg}/debug_helper.c           |    0
>  target/arm/{ =3D> tcg}/helper-a64.c             |    2 +
>  target/arm/tcg/helper.c                       | 1532 +++++
>  target/arm/{ =3D> tcg}/iwmmxt_helper.c          |    0
>  target/arm/{ =3D> tcg}/m_helper.c               |    1 +
>  target/arm/{ =3D> tcg}/mte_helper.c             |    0
>  target/arm/{ =3D> tcg}/neon_helper.c            |    0
>  target/arm/{ =3D> tcg}/op_helper.c              |    1 +
>  target/arm/{ =3D> tcg}/pauth_helper.c           |    2 +-
>  target/arm/{ =3D> tcg}/sve_helper.c             |    0
>  target/arm/tcg/sysemu/tcg-cpu.c               |  120 +
>  .../arm/{cpu_tcg.c =3D> tcg/tcg-cpu-models.c}   |  164 +-
>  target/arm/tcg/tcg-cpu.c                      |  500 ++
>  target/arm/{ =3D> tcg}/tlb_helper.c             |    1 +
>  target/arm/{ =3D> tcg}/translate-a64.c          |    1 +
>  target/arm/{ =3D> tcg}/translate-sve.c          |    0
>  target/arm/{ =3D> tcg}/translate.c              |    1 +
>  target/arm/{ =3D> tcg}/vec_helper.c             |    0
>  target/arm/{ =3D> tcg}/vfp_helper.c             |  210 +-
>  tests/qtest/arm-cpu-features.c                |   15 +
>  tests/qtest/bios-tables-test.c                |    7 +
>  tests/qtest/device-introspect-test.c          |   18 +
>  tests/qtest/qom-test.c                        |   20 +
>  tests/qtest/test-hmp.c                        |   20 +
>  target/arm/{ =3D> tcg}/translate-neon.c.inc     |    0
>  target/arm/{ =3D> tcg}/translate-vfp.c.inc      |    0
>  MAINTAINERS                                   |    2 +-
>  target/arm/kvm/meson.build                    |   10 +
>  target/arm/kvm/trace-events                   |    4 +
>  target/arm/meson.build                        |   59 +-
>  target/arm/tcg/meson.build                    |   47 +
>  target/arm/tcg/sysemu/meson.build             |    4 +
>  target/arm/{ =3D> tcg}/trace-events             |    3 -
>  target/arm/tcg/user/meson.build               |    3 +
>  116 files changed, 9304 insertions(+), 7991 deletions(-)
>  create mode 100644 target/arm/cpregs.h
>  create mode 100644 target/arm/cpu-exceptions-aa64.h
>  create mode 100644 target/arm/cpu-mmu.h
>  create mode 100644 target/arm/cpu-sve.h
>  create mode 100644 target/arm/cpu-vfp.h
>  create mode 100644 target/arm/cpu32.h
>  create mode 100644 target/arm/kvm/cpu-sve.h
>  rename target/arm/{ =3D> kvm}/kvm-consts.h (100%)
>  rename target/arm/{ =3D> kvm}/kvm_arm.h (98%)
>  create mode 100644 target/arm/kvm/trace.h
>  create mode 100644 target/arm/tcg/cpu-pauth.h
>  create mode 100644 target/arm/tcg/cpu-sve.h
>  rename target/arm/{ =3D> tcg}/op_addsub.h (100%)
>  create mode 100644 target/arm/tcg/tcg-cpu.h
>  create mode 100644 target/arm/tcg/trace.h
>  rename target/arm/{ =3D> tcg}/translate-a64.h (100%)
>  rename target/arm/{ =3D> tcg}/translate.h (100%)
>  rename target/arm/{ =3D> tcg}/vec_internal.h (100%)
>  delete mode 100644 target/arm/trace.h
>  rename target/arm/{ =3D> tcg}/a32-uncond.decode (100%)
>  rename target/arm/{ =3D> tcg}/a32.decode (100%)
>  rename target/arm/{ =3D> tcg}/m-nocp.decode (100%)
>  rename target/arm/{ =3D> tcg}/neon-dp.decode (100%)
>  rename target/arm/{ =3D> tcg}/neon-ls.decode (100%)
>  rename target/arm/{ =3D> tcg}/neon-shared.decode (100%)
>  rename target/arm/{ =3D> tcg}/sve.decode (100%)
>  rename target/arm/{ =3D> tcg}/t16.decode (100%)
>  rename target/arm/{ =3D> tcg}/t32.decode (100%)
>  rename target/arm/{ =3D> tcg}/vfp-uncond.decode (100%)
>  rename target/arm/{ =3D> tcg}/vfp.decode (100%)
>  create mode 100644 target/arm/cpregs.c
>  create mode 100644 target/arm/cpu-common.c
>  create mode 100644 target/arm/cpu-exceptions-aa64.c
>  create mode 100644 target/arm/cpu-exceptions.c
>  create mode 100644 target/arm/cpu-mmu-sysemu.c
>  create mode 100644 target/arm/cpu-mmu.c
>  create mode 100644 target/arm/cpu-sve.c
>  create mode 100644 target/arm/cpu-sysemu.c
>  create mode 100644 target/arm/cpu-user.c
>  create mode 100644 target/arm/cpu-vfp.c
>  create mode 100644 target/arm/cpu32.c
>  create mode 100644 target/arm/cpustate-list.c
>  delete mode 100644 target/arm/kvm-stub.c
>  create mode 100644 target/arm/kvm/cpu-sve.c
>  create mode 100644 target/arm/kvm/helper-stubs.c
>  create mode 100644 target/arm/kvm/kvm-cpu.c
>  rename target/arm/{ =3D> kvm}/kvm.c (98%)
>  rename target/arm/{ =3D> kvm}/kvm64.c (99%)
>  rename target/arm/{helper.c =3D> tcg/cpregs.c} (59%)
>  create mode 100644 target/arm/tcg/cpu-pauth.c
>  create mode 100644 target/arm/tcg/cpu-sve.c
>  create mode 100644 target/arm/tcg/cpu-vfp.c
>  rename target/arm/{ =3D> tcg}/crypto_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/debug_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/helper-a64.c (99%)
>  create mode 100644 target/arm/tcg/helper.c
>  rename target/arm/{ =3D> tcg}/iwmmxt_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/m_helper.c (99%)
>  rename target/arm/{ =3D> tcg}/mte_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/neon_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/op_helper.c (99%)
>  rename target/arm/{ =3D> tcg}/pauth_helper.c (99%)
>  rename target/arm/{ =3D> tcg}/sve_helper.c (100%)
>  create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c
>  rename target/arm/{cpu_tcg.c =3D> tcg/tcg-cpu-models.c} (86%)
>  create mode 100644 target/arm/tcg/tcg-cpu.c
>  rename target/arm/{ =3D> tcg}/tlb_helper.c (99%)
>  rename target/arm/{ =3D> tcg}/translate-a64.c (99%)
>  rename target/arm/{ =3D> tcg}/translate-sve.c (100%)
>  rename target/arm/{ =3D> tcg}/translate.c (99%)
>  rename target/arm/{ =3D> tcg}/vec_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/vfp_helper.c (84%)
>  rename target/arm/{ =3D> tcg}/translate-neon.c.inc (100%)
>  rename target/arm/{ =3D> tcg}/translate-vfp.c.inc (100%)
>  create mode 100644 target/arm/kvm/meson.build
>  create mode 100644 target/arm/kvm/trace-events
>  create mode 100644 target/arm/tcg/meson.build
>  create mode 100644 target/arm/tcg/sysemu/meson.build
>  rename target/arm/{ =3D> tcg}/trace-events (85%)
>  create mode 100644 target/arm/tcg/user/meson.build


--=20
Alex Benn=C3=A9e

