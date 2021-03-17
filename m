Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8EA33F83F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:39:36 +0100 (CET)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMb4x-0004I2-M0
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMaw9-0003uT-Re
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:30:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:47452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMavy-0007Vg-5X
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:30:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CAF1AC1E;
 Wed, 17 Mar 2021 18:30:16 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 00/50] arm cleanup experiment for kvm-only build
Date: Wed, 17 Mar 2021 19:29:23 +0100
Message-Id: <20210317183013.25772-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here a new version of the series that enables kvm-only builds.

The goal here is to enable the KVM-only build, but there is
some additional cleanup too.

In this iteration we add more cleanups and refactoring:

restriction of ELFCLASS64 to TARGET_AARCH64,
split of exception code to its own module, and an aarch64 one,
ZCR cpregs restricted to TARGET_AARCH64,
a new module for CPU Pointer Authentication, TARGET_AARCH64-only.

Ciao, C

v8 -> v9:
* added: "make is_aa64 and arm_el_is_aa64 a macro for !TARGET_AARCH64"
* added: "arch_dump: restrict ELFCLASS64 to AArch64"
* added: "cpu-exceptions: new module"
* added: "tcg: restrict ZCR cpregs to TARGET_AARCH64"
* added: "cpu-pauth: new module for ARMv8.3 Pointer Authentication"
* added: "refactor arm_cpu_finalize_features into cpu64"

v7 -> v8:
* added split of SVE CPU properties code from cpu into cpu-sve.
* added split of cpu-sve into tcg/cpu-sve and kvm/cpu-sve.

v6 -> v7:
* added tcg accel-cpu, experiment with improving the setting of the
  TCGOps, as discussed at:
  https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04315.html

v5 -> v6:
* rebased on latest master, adapted to arm changes

* needed to restore the cortex-a15 cpu,
  moving it away from the TCG-only cpu file. This is a partial
  revert of commit "target/arm: Restrict TCG cpus to TCG accel"

* added first patches that create the kvm cpu accel class

v4 -> v5:
* fixed other remaining tests for kvm-only build
* rebased on latest target/arm changes (painful)
* reverted Philippe's IDAU v8m change

v3 -> v4:

* added style cleanup patches

* added header cleanup

* added basic move of simple KVM-only code to kvm/

* fixed some qtest failures due to existing:

  if (kvm_enabled) {
  
  } else {

  }

  which needed explicit if qtest_enabled() in addition to tcg_enabled() check

* include 32bit cpus for AArch64 too.

v2 -> v3:

* "target/arm: tcg: add sysemu and user subsirs"
  - new standalone patch to create the empty tcg/sysemu and tcg/user subdirs.

* "target/arm: only build psci for TCG"
  - do not move psci inside tcg/ directory, because HVF might use it soon.
    (Peter)

* "target/arm: move physical address translation"
  - change the module name from "get-phys-addr" to "cpu-mmu",
    which includes aa64_va_parameter in this patch, and that
    will also contain the get_mmu_idx* functions later in the series.
    (Richard)

* "target/arm: split cpregs from tcg/helper.c"
  - moved raw_read and raw_write to cpregs.h (Richard)

* "target/arm: only perform TCG cpu and machine inits if TCG enabled"
  - add an explanatory comment before the kvm function for cpreg list init
  - change the use of g_renew to g_new, since we do not do the double
    initialization of cpreg list anymore.

* "target/arm: add temporary stub for arm_rebuild_hflags"
  - use a if (tcg_enabled()) instead of #ifdef (Richard)

* "target/arm: split vfp state setting from tcg helpers"
  - explain better what goes where in the commit (Richard)

* "target/arm: move arm_mmu_idx*"
  - move the functions to cpu-mmu instead of get-phys-addr (Richard)

* "target/arm: move sve_zcr_len_for_el to common_cpu"

 - add a comment about those functions being in theory
   TARGET_AARCH64 specific, but making the change would spawn
   a large number of additional #ifdefs. This state predates this
   change (Richard).

* "target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code"

 - explain better why these functions are needed for KVM too (Richard)

* "target/arm: move sve_exception_el out of TCG helpers"

 - bring over the sve_exception_el code, making it available for KVM too.
   (Richard)

* "target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()"

 - mention in the commit that this enables finally a build with
   configure --enable-kvm --disable-tcg


v1 -> v2: reworked of the whole series

In this v2, only the first two patches remain, the rest is
reworked.

Main reasons for the rework were:

1) moving out cpregs to its own module, leave the tcg-only part in tcg/

2) split of arm cpu32, cpu64 and cpu models. This is still not perfect,
   but I think it's an improvement.

3) import less stuff, that is actually unused or can be stubbed on KVM
   (thanks to the precious feedback on the previous RFCv1).

...

Main issues:

1) basically needs the "configure only machines compatible with KVM" from Philippe,
   so we can avoid some of the stubs.

2) tests/ work fine building with tcg or with tcg + kvm,
   but for making a kvm-only build pass the tests, more work is needed in tests/
   figuring out which tests are TCG-only and which need to be tweaked.

Thanks a lot for your comments!


. / . / . / . / . / . /


Hi all,

this is an experiment, a cleanup based on and requiring the series
"i386 cleanup PART 2":

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html

The goal is to split the code between TCG-only and non-TCG code,
fixing the KVM-only build (configure --disable-tcg),

and laying the ground for further cleanups and the use of the
new accel objects in the hierarchy to specialize the cpu
according to the accelerator.

This is known to be an early state, with probably a lot of work
still needed.

I thought it could be useful to share early, especially in light
of the combination of this with Philippe's work on building
only the machines and devices compatible with KVM for arm.

Comments welcome, thanks,

Claudio


Claudio Fontana (50):
  target/arm: move translate modules to tcg/
  target/arm: move helpers to tcg/
  arm: tcg: only build under CONFIG_TCG
  target/arm: tcg: add sysemu and user subsirs
  target/arm: only build psci for TCG
  target/arm: split off cpu-sysemu.c
  target/arm: move physical address translation to cpu-mmu
  target/arm: cpu-mmu: fix comment style
  target/arm: split cpregs from tcg/helper.c
  target/arm: cpregs: fix style (mostly just comments)
  target/arm: move cpu definitions to common cpu module
  target/arm: only perform TCG cpu and machine inits if TCG enabled
  target/arm: kvm: add stubs for some helpers
  target/arm: move cpsr_read, cpsr_write to cpu_common
  target/arm: add temporary stub for arm_rebuild_hflags
  target/arm: split vfp state setting from tcg helpers
  target/arm: move arm_mmu_idx* to cpu-mmu
  target/arm: move sve_zcr_len_for_el to common_cpu
  target/arm: move arm_sctlr away from tcg helpers
  target/arm: move arm_cpu_list to common_cpu
  target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code
  target/arm: split a15 cpu model and 32bit class functions to cpu32.c
  target/arm: move sve_exception_el out of TCG helpers
  target/arm: refactor exception and cpu code
  target/arm: cpu: fix style
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: remove kvm include file for PSCI and arm-powerctl
  target/arm: move kvm-const.h, kvm.c, kvm64.c, kvm_arm.h to kvm/
  target/arm: cleanup cpu includes
  target/arm: remove broad "else" statements when checking accels
  tests/qtest: skip bios-tables-test test_acpi_oem_fields_virt for KVM
  tests: restrict TCG-only arm-cpu-features tests to TCG builds
  tests: do not run test-hmp on all machines for ARM KVM-only
  tests: device-introspect-test: cope with ARM TCG-only devices
  tests: do not run qom-test on all machines for ARM KVM-only
  Revert "target/arm: Restrict v8M IDAU to TCG"
  target/arm: create kvm cpu accel class
  target/arm: move kvm cpu properties setting to kvm-cpu
  accel: move call to accel_init_interfaces
  accel: add double dispatch mechanism for class initialization
  target/arm: add tcg cpu accel class
  target/arm: move TCG gt timer creation code in tcg/
  target/arm: cpu-sve: new module
  target/arm: cpu-sve: split TCG and KVM functionality
  target/arm: make is_aa64 and arm_el_is_aa64 a macro for
    !TARGET_AARCH64
  target/arm: arch_dump: restrict ELFCLASS64 to AArch64
  target/arm: cpu-exceptions: new module
  target/arm: tcg: restrict ZCR cpregs to TARGET_AARCH64
  target/arm: cpu-pauth: new module for ARMv8.3 Pointer Authentication
  target/arm: refactor arm_cpu_finalize_features into cpu64

 meson.build                                   |    3 +-
 include/hw/core/cpu.h                         |    6 +
 target/arm/arm-powerctl.h                     |    2 -
 target/arm/cpregs.h                           |  274 +
 target/arm/cpu-exceptions-aa64.h              |   32 +
 target/arm/cpu-mmu.h                          |  119 +
 target/arm/cpu-qom.h                          |    3 -
 target/arm/cpu-sve.h                          |   40 +
 target/arm/cpu-vfp.h                          |   29 +
 target/arm/cpu.h                              |  320 +-
 target/arm/cpu32.h                            |   29 +
 target/arm/helper-a64.h                       |    2 +
 target/arm/helper.h                           |    1 -
 target/arm/internals.h                        |   46 +-
 target/arm/kvm/cpu-sve.h                      |   30 +
 target/arm/{ => kvm}/kvm-consts.h             |    0
 target/arm/{ => kvm}/kvm_arm.h                |    5 +-
 target/arm/kvm/trace.h                        |    1 +
 target/arm/tcg/cpu-pauth.h                    |   38 +
 target/arm/tcg/cpu-sve.h                      |   31 +
 target/arm/{ => tcg}/op_addsub.h              |    0
 target/arm/tcg/tcg-cpu.h                      |   40 +
 target/arm/tcg/trace.h                        |    1 +
 target/arm/{ => tcg}/translate-a64.h          |    0
 target/arm/{ => tcg}/translate.h              |    0
 target/arm/{ => tcg}/vec_internal.h           |    0
 target/arm/trace.h                            |    1 -
 target/arm/{ => tcg}/a32-uncond.decode        |    0
 target/arm/{ => tcg}/a32.decode               |    0
 target/arm/{ => tcg}/m-nocp.decode            |    0
 target/arm/{ => tcg}/neon-dp.decode           |    0
 target/arm/{ => tcg}/neon-ls.decode           |    0
 target/arm/{ => tcg}/neon-shared.decode       |    0
 target/arm/{ => tcg}/sve.decode               |    0
 target/arm/{ => tcg}/t16.decode               |    0
 target/arm/{ => tcg}/t32.decode               |    0
 target/arm/{ => tcg}/vfp-uncond.decode        |    0
 target/arm/{ => tcg}/vfp.decode               |    0
 accel/accel-common.c                          |   12 +
 bsd-user/main.c                               |    2 +-
 hw/arm/boot.c                                 |    5 +-
 hw/arm/pxa2xx.c                               |    1 +
 hw/arm/pxa2xx_pic.c                           |    1 +
 hw/arm/sbsa-ref.c                             |    2 +-
 hw/arm/virt-acpi-build.c                      |    2 +-
 hw/arm/virt.c                                 |    2 +-
 hw/arm/xlnx-versal.c                          |    2 +-
 hw/arm/xlnx-zynqmp.c                          |    2 +-
 hw/core/machine.c                             |    1 +
 hw/cpu/a15mpcore.c                            |    2 +-
 hw/intc/arm_gic_kvm.c                         |    2 +-
 hw/intc/arm_gicv3_cpuif.c                     |    1 +
 hw/intc/arm_gicv3_its_kvm.c                   |    2 +-
 hw/intc/arm_gicv3_kvm.c                       |    3 +-
 linux-user/main.c                             |    2 +-
 linux-user/syscall.c                          |    4 +
 softmmu/vl.c                                  |    1 -
 target/arm/arch_dump.c                        |   13 +-
 target/arm/arm-powerctl.c                     |    8 +-
 target/arm/cpregs.c                           |  377 +
 target/arm/cpu-common.c                       |  329 +
 target/arm/cpu-exceptions-aa64.c              |  553 ++
 target/arm/cpu-exceptions.c                   |  481 ++
 target/arm/cpu-mmu-sysemu.c                   | 2305 +++++++
 target/arm/cpu-mmu.c                          |  219 +
 target/arm/cpu-sve.c                          |  292 +
 target/arm/cpu-sysemu.c                       |   80 +
 target/arm/cpu-user.c                         |   41 +
 target/arm/cpu-vfp.c                          |   92 +
 target/arm/cpu.c                              |  780 +--
 target/arm/cpu32.c                            |  260 +
 target/arm/cpu64.c                            |  539 +-
 target/arm/cpustate-list.c                    |  146 +
 target/arm/gdbstub.c                          |    5 +-
 target/arm/kvm-stub.c                         |   24 -
 target/arm/kvm/cpu-sve.c                      |  118 +
 target/arm/kvm/helper-stubs.c                 |   43 +
 target/arm/kvm/kvm-cpu.c                      |  123 +
 target/arm/{ => kvm}/kvm.c                    |   18 +-
 target/arm/{ => kvm}/kvm64.c                  |    8 +-
 target/arm/machine.c                          |   40 +-
 target/arm/monitor.c                          |   10 +-
 target/arm/psci.c                             |    1 -
 target/arm/{helper.c => tcg/cpregs.c}         | 6102 +----------------
 target/arm/tcg/cpu-pauth.c                    |   66 +
 target/arm/tcg/cpu-sve.c                      |   80 +
 target/arm/tcg/cpu-vfp.c                      |  146 +
 target/arm/{ => tcg}/crypto_helper.c          |    0
 target/arm/{ => tcg}/debug_helper.c           |    0
 target/arm/{ => tcg}/helper-a64.c             |    2 +
 target/arm/tcg/helper.c                       | 1532 +++++
 target/arm/{ => tcg}/iwmmxt_helper.c          |    0
 target/arm/{ => tcg}/m_helper.c               |    1 +
 target/arm/{ => tcg}/mte_helper.c             |    0
 target/arm/{ => tcg}/neon_helper.c            |    0
 target/arm/{ => tcg}/op_helper.c              |    1 +
 target/arm/{ => tcg}/pauth_helper.c           |    2 +-
 target/arm/{ => tcg}/sve_helper.c             |    0
 target/arm/tcg/sysemu/tcg-cpu.c               |  120 +
 .../arm/{cpu_tcg.c => tcg/tcg-cpu-models.c}   |  102 +-
 target/arm/tcg/tcg-cpu.c                      |  271 +
 target/arm/{ => tcg}/tlb_helper.c             |    1 +
 target/arm/{ => tcg}/translate-a64.c          |    1 +
 target/arm/{ => tcg}/translate-sve.c          |    0
 target/arm/{ => tcg}/translate.c              |    1 +
 target/arm/{ => tcg}/vec_helper.c             |    0
 target/arm/{ => tcg}/vfp_helper.c             |  210 +-
 target/i386/tcg/tcg-cpu.c                     |    8 +-
 tests/qtest/arm-cpu-features.c                |   15 +
 tests/qtest/bios-tables-test.c                |    7 +
 tests/qtest/device-introspect-test.c          |   18 +
 tests/qtest/qom-test.c                        |   20 +
 tests/qtest/test-hmp.c                        |   20 +
 target/arm/{ => tcg}/translate-neon.c.inc     |    0
 target/arm/{ => tcg}/translate-vfp.c.inc      |    0
 MAINTAINERS                                   |    2 +-
 roms/SLOF                                     |    2 +-
 target/arm/kvm/meson.build                    |   10 +
 target/arm/kvm/trace-events                   |    4 +
 target/arm/meson.build                        |   59 +-
 target/arm/tcg/meson.build                    |   47 +
 target/arm/tcg/sysemu/meson.build             |    4 +
 target/arm/{ => tcg}/trace-events             |    3 -
 target/arm/tcg/user/meson.build               |    3 +
 124 files changed, 9089 insertions(+), 7778 deletions(-)
 create mode 100644 target/arm/cpregs.h
 create mode 100644 target/arm/cpu-exceptions-aa64.h
 create mode 100644 target/arm/cpu-mmu.h
 create mode 100644 target/arm/cpu-sve.h
 create mode 100644 target/arm/cpu-vfp.h
 create mode 100644 target/arm/cpu32.h
 create mode 100644 target/arm/kvm/cpu-sve.h
 rename target/arm/{ => kvm}/kvm-consts.h (100%)
 rename target/arm/{ => kvm}/kvm_arm.h (98%)
 create mode 100644 target/arm/kvm/trace.h
 create mode 100644 target/arm/tcg/cpu-pauth.h
 create mode 100644 target/arm/tcg/cpu-sve.h
 rename target/arm/{ => tcg}/op_addsub.h (100%)
 create mode 100644 target/arm/tcg/tcg-cpu.h
 create mode 100644 target/arm/tcg/trace.h
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 delete mode 100644 target/arm/trace.h
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/cpu-common.c
 create mode 100644 target/arm/cpu-exceptions-aa64.c
 create mode 100644 target/arm/cpu-exceptions.c
 create mode 100644 target/arm/cpu-mmu-sysemu.c
 create mode 100644 target/arm/cpu-mmu.c
 create mode 100644 target/arm/cpu-sve.c
 create mode 100644 target/arm/cpu-sysemu.c
 create mode 100644 target/arm/cpu-user.c
 create mode 100644 target/arm/cpu-vfp.c
 create mode 100644 target/arm/cpu32.c
 create mode 100644 target/arm/cpustate-list.c
 delete mode 100644 target/arm/kvm-stub.c
 create mode 100644 target/arm/kvm/cpu-sve.c
 create mode 100644 target/arm/kvm/helper-stubs.c
 create mode 100644 target/arm/kvm/kvm-cpu.c
 rename target/arm/{ => kvm}/kvm.c (98%)
 rename target/arm/{ => kvm}/kvm64.c (99%)
 rename target/arm/{helper.c => tcg/cpregs.c} (59%)
 create mode 100644 target/arm/tcg/cpu-pauth.c
 create mode 100644 target/arm/tcg/cpu-sve.c
 create mode 100644 target/arm/tcg/cpu-vfp.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (100%)
 rename target/arm/{ => tcg}/helper-a64.c (99%)
 create mode 100644 target/arm/tcg/helper.c
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m_helper.c (99%)
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (99%)
 rename target/arm/{ => tcg}/pauth_helper.c (99%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c
 rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (91%)
 create mode 100644 target/arm/tcg/tcg-cpu.c
 rename target/arm/{ => tcg}/tlb_helper.c (99%)
 rename target/arm/{ => tcg}/translate-a64.c (99%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate.c (99%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vfp_helper.c (84%)
 rename target/arm/{ => tcg}/translate-neon.c.inc (100%)
 rename target/arm/{ => tcg}/translate-vfp.c.inc (100%)
 create mode 100644 target/arm/kvm/meson.build
 create mode 100644 target/arm/kvm/trace-events
 create mode 100644 target/arm/tcg/meson.build
 create mode 100644 target/arm/tcg/sysemu/meson.build
 rename target/arm/{ => tcg}/trace-events (85%)
 create mode 100644 target/arm/tcg/user/meson.build

-- 
2.26.2


