Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FA130A525
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:14:29 +0100 (CET)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WE0-0005dO-Rs
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:14:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8u-0008Vk-J3
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:55298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8p-0005mY-EI
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0318AC6E;
 Mon,  1 Feb 2021 10:09:05 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 00/23] i386 cleanup PART 2
Date: Mon,  1 Feb 2021 11:08:40 +0100
Message-Id: <20210201100903.17309-1-cfontana@suse.de>
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
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v14 -> v15:

* change the TcgCpuOperations so that all fields of the struct are
  defined unconditionally, as per original patch by Eduardo,
  before moving them to a separate struct referenced by a pointer
  (Richard, Eduardo).

* changed (c) year to 2021

* added a patch to make accel_cpu->cpu_realizefn return bool, and
  adapt host_cpu, kvm_cpu, hvf_cpu and tcg_cpu in i386 accordingly.
  Ultimately, consistently moving to a pattern of realize functions
  returning bool will require a rework of all devices.

v13 -> v14: rebased on latest master.
v12 -> v13: rebased on latest master.

v11 -> v12: reordered patches and improved tcg_ops

* reordered all TcgCpuOperations stuff so it is at the beginning

* added patches for ARM-specific tcg ops
  debug_check_watchpoint and adjust_watchpoint_address

* added a patch that puts a forward declared pointer in the struct,
  so as to reduce the change of misuse between common_ss and specific_ss code,
  and tidy up as a consequence all targets, by defining dedicated structs.

v10 -> v11: split off PART 2,

no further changes to PART 2 other than the split.

v9 -> v10: minor tweaks and fixes

* in "i386: split cpu accelerators from cpu.c",

use kvm/kvm-cpu.c, hvf/hvf-cpu.c, tcg/tcg-cpu.c.
Easier to understand compared to editing multiple cpu.c files,
and matches the header files if needed (kvm-cpu.h).

* in "accel: replace struct CpusAccel with AccelOpsClass",

make it a bit more consistent, by naming the files defining
the AccelOpsClass types "...-accel-ops.c" instead of the old
naming "...-cpus.c".

* in "cpu: move cc->transaction_failed to tcg_ops",

protect with CONFIG_TCG the use of tcg_ops for hw/misc/jazz.c,

 #include "exec/memattrs.h" (Philippe, Eduardo)

* in "cpu: Move synchronize_from_tb() to tcg_ops",

 #include "hw/core/cpu.h" (Philippe, Eduardo)

do not remove the comment about struct TcgCpuOperations (Philippe)

* in "accel/tcg: split TCG-only code from cpu_exec_realizefn",

invert tcg_target_initialized set order (Alex)

* in "i386: move TCG cpu class initialization out of helper.c",

extract helper-tcg.h, tcg-cpu.c, and tcg-cpu.h directly into
tcg/, avoiding the extra move later to tcg/ (Alex)



v8 -> v9: move additional methods to CPUClass->tcg_ops

do_unaligned_access, transaction_failed and do_interrupt.

do_interrupt is a bit tricky, as the same code is reused
(albeit not usually directly) for KVM under certain odd conditions.

Change arm, as the only user of do_interrupt callback for KVM,
to instead call the target function directly arm_do_interrupt.

v7 -> v8: add missing CONFIG_TCGs, fix bugs

* add the prerequisite patches for "3 tcg" at the beginning of the
  series for convenience (already reviewed, queued by RH).

* add CONFIG_TCG to TCGCpuOperations and tcg_ops variable use

* reduce the scope of the realizefn refactoring, do not
  introduce a separate cpu_accel_realize, and instead use the
  existing cpu_exec_realizefn, there is not enough benefit
  to introduce a new function.

* fix bugs in user mode due to attempt to move the tcg_region_init()
  early, so it could be done just once in tcg_init() for both
  softmmu and user mode. Unfortunately it needs to remain deferred
  for user mode, as it needs to be done after prologue init and
  after the GUEST_BASE has been set.

v6 -> v7: integrate TCGCpuOperations, refactored cpu_exec_realizefn

* integrate TCGCpuOperations (Eduardo)

Taken some refactoring from Eduardo for Tcg-only operations on
CPUClass.

* refactored cpu_exec_realizefn

The other main change is a refactoring of cpu_exec_realizefn,
directly linked to the effort of making many cpu_exec operations
TCG-only (Eduardo series above):

cpu_exec_realizefn is actually a TCG-only thing, with the
exception of a couple things that can be done in base cpu code.

This changes all targets realizefn, so I guess I have to Cc:
the Multiverse? (Universe was already CCed for all accelerators).


v5 -> v6: remove MODULE_INIT_ACCEL_CPU


instead, use a call to accel_init_interfaces().

* The class lookups are now general and performed in accel/

  new AccelCPUClass for new archs are supported as new
  ones appear in the class hierarchy, no need for stubs.

* Split the code a bit better


v4 -> v5: centralized and simplified initializations

I put in Cc: Emilio G. Cota, specifically because in patch 8
I (re)moved for user-mode the call to tcg_regions_init().

The call happens now inside the tcg AccelClass machine_init,
(so earlier). This seems to work fine, but thought to get the
author opinion on this.

Rebased on "tcg-cpus: split into 3 tcg variants" series
(queued by Richard), to avoid some code churn:


https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04356.html


* Extended AccelClass to user-mode.

user-mode now does not call tcg_exec_init directly,
instead it uses the tcg accel class, and its init_machine method.

Since user-mode does not define or use a machine state,
the machine is just passed as NULL.

The immediate advantage is that now we can call current_accel()
from both user mode and softmmu, so we can work out the correct
class to use for accelerator initializations.

* QOMification of CpusAccelOps

simple QOMification of CpusAccelOps abstract class.

* Centralized all accel_cpu_init, so only one per cpu-arch,
  plus one for all accels will remain.

  So we can expect accel_cpu_init() to be limited to:
  
  softmmu/cpus.c - initializes the chosen softmmu accel ops for the cpus module.
  target/ARCH/cpu.c - initializes the chosen arch-specific cpu accelerator.
  
These changes are meant to address concerns/issues (Paolo):

1) the use of if (tcg_enabled()) and similar in the module_init call path

2) the excessive number of accel_cpu_init() to hunt down in the codebase.


* Fixed wrong use of host_cpu_class_init (Eduardo)


v3 -> v4: QOMification of X86CPUAccelClass


In this version I basically QOMified X86CPUAccel, taking the
suggestions from Eduardo as the starting point,
but stopping just short of making it an actual QOM interface,
using a plain abstract class, and then subclasses for the
actual objects.

Initialization is still using the existing qemu initialization
framework (module_call_init), which is I still think is better
than the alternatives proposed, in the current state.

Possibly some improvements could be developed in the future here.
In this case, effort should be put in keeping things extendible,
in order not to be blocked once accelerators also become modules.

Motivation and higher level steps:

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html

Looking forward to your comments on this proposal,

Ciao,

Claudio


Claudio Fontana (18):
  target/riscv: remove CONFIG_TCG, as it is always TCG
  accel/tcg: split TCG-only code from cpu_exec_realizefn
  target/arm: do not use cc->do_interrupt for KVM directly
  cpu: move cc->do_interrupt to tcg_ops
  cpu: move cc->transaction_failed to tcg_ops
  cpu: move do_unaligned_access to tcg_ops
  physmem: make watchpoint checking code TCG-only
  cpu: move adjust_watchpoint_address to tcg_ops
  cpu: move debug_check_watchpoint to tcg_ops
  cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass
  accel: extend AccelState and AccelClass to user-mode
  accel: replace struct CpusAccel with AccelOpsClass
  accel: introduce AccelCPUClass extending CPUClass
  i386: split cpu accelerators from cpu.c, using AccelCPUClass
  cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
  hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn
  accel: introduce new accessor functions
  accel-cpu: make cpu_realizefn return a bool

Eduardo Habkost (5):
  cpu: Introduce TCGCpuOperations struct
  cpu: Move synchronize_from_tb() to tcg_ops
  cpu: Move cpu_exec_* to tcg_ops
  cpu: Move tlb_fill to tcg_ops
  cpu: Move debug_excp_handler to tcg_ops

 accel/accel-softmmu.h                         |  15 +
 accel/kvm/kvm-cpus.h                          |   2 -
 ...g-cpus-icount.h => tcg-accel-ops-icount.h} |   2 +
 accel/tcg/tcg-accel-ops-mttcg.h               |  19 +
 .../tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h} |   0
 accel/tcg/{tcg-cpus.h => tcg-accel-ops.h}     |   6 +-
 include/exec/cpu-all.h                        |  11 +-
 include/hw/boards.h                           |   2 +-
 include/hw/core/accel-cpu.h                   |  38 ++
 include/hw/core/cpu.h                         |  92 +---
 include/hw/core/tcg-cpu-ops.h                 |  95 +++++
 include/{sysemu => qemu}/accel.h              |  27 +-
 include/sysemu/accel-ops.h                    |  45 ++
 include/sysemu/cpus.h                         |  26 +-
 include/sysemu/hvf.h                          |   2 +-
 include/sysemu/kvm.h                          |   2 +-
 include/sysemu/kvm_int.h                      |   2 +-
 target/arm/internals.h                        |   6 +
 target/i386/cpu.h                             |  20 +-
 .../i386/hax/{hax-cpus.h => hax-accel-ops.h}  |   2 -
 target/i386/hax/hax-windows.h                 |   2 +-
 target/i386/host-cpu.h                        |  19 +
 .../i386/hvf/{hvf-cpus.h => hvf-accel-ops.h}  |   2 -
 target/i386/hvf/hvf-i386.h                    |   2 +-
 target/i386/kvm/kvm-cpu.h                     |  41 ++
 target/i386/tcg/tcg-cpu.h                     |  15 -
 .../whpx/{whpx-cpus.h => whpx-accel-ops.h}    |   2 -
 accel/accel-common.c                          | 124 ++++++
 accel/{accel.c => accel-softmmu.c}            |  60 ++-
 accel/accel-user.c                            |  24 ++
 accel/kvm/{kvm-cpus.c => kvm-accel-ops.c}     |  26 +-
 accel/kvm/kvm-all.c                           |   2 -
 accel/qtest/qtest.c                           |  25 +-
 accel/tcg/cpu-exec.c                          |  53 ++-
 accel/tcg/cputlb.c                            |  34 +-
 ...g-cpus-icount.c => tcg-accel-ops-icount.c} |  21 +-
 ...tcg-cpus-mttcg.c => tcg-accel-ops-mttcg.c} |  14 +-
 .../tcg/{tcg-cpus-rr.c => tcg-accel-ops-rr.c} |  13 +-
 accel/tcg/{tcg-cpus.c => tcg-accel-ops.c}     |  47 +-
 accel/tcg/tcg-all.c                           |  19 +-
 accel/tcg/user-exec.c                         |   8 +-
 accel/xen/xen-all.c                           |  24 +-
 bsd-user/main.c                               |  11 +-
 cpu.c                                         |  69 +--
 hw/core/cpu.c                                 |  23 +-
 hw/i386/pc_piix.c                             |   1 +
 hw/mips/jazz.c                                |  12 +-
 linux-user/main.c                             |   7 +-
 softmmu/cpus.c                                |  12 +-
 softmmu/memory.c                              |   2 +-
 softmmu/physmem.c                             | 149 ++++---
 softmmu/qtest.c                               |   2 +-
 softmmu/vl.c                                  |   9 +-
 target/alpha/cpu.c                            |  26 +-
 target/arm/cpu.c                              |  53 ++-
 target/arm/cpu64.c                            |   4 +-
 target/arm/cpu_tcg.c                          |  32 +-
 target/arm/helper.c                           |   4 +
 target/arm/kvm64.c                            |   6 +-
 target/avr/cpu.c                              |  22 +-
 target/avr/helper.c                           |   5 +-
 target/cris/cpu.c                             |  45 +-
 target/cris/helper.c                          |   5 +-
 target/hppa/cpu.c                             |  25 +-
 target/i386/cpu.c                             | 402 ++----------------
 .../i386/hax/{hax-cpus.c => hax-accel-ops.c}  |  31 +-
 target/i386/hax/hax-all.c                     |   7 +-
 target/i386/hax/hax-mem.c                     |   2 +-
 target/i386/hax/hax-posix.c                   |   2 +-
 target/i386/hax/hax-windows.c                 |   2 +-
 target/i386/host-cpu.c                        | 204 +++++++++
 .../i386/hvf/{hvf-cpus.c => hvf-accel-ops.c}  |  29 +-
 target/i386/hvf/hvf-cpu.c                     |  65 +++
 target/i386/hvf/hvf.c                         |   5 +-
 target/i386/hvf/x86_task.c                    |   2 +-
 target/i386/hvf/x86hvf.c                      |   2 +-
 target/i386/kvm/kvm-cpu.c                     | 151 +++++++
 target/i386/kvm/kvm.c                         |   3 +-
 target/i386/tcg/tcg-cpu.c                     | 141 +++++-
 .../whpx/{whpx-cpus.c => whpx-accel-ops.c}    |  31 +-
 target/i386/whpx/whpx-all.c                   |   9 +-
 target/lm32/cpu.c                             |  22 +-
 target/m68k/cpu.c                             |  21 +-
 target/microblaze/cpu.c                       |  34 +-
 target/mips/cpu.c                             |  37 +-
 target/moxie/cpu.c                            |  19 +-
 target/nios2/cpu.c                            |  22 +-
 target/openrisc/cpu.c                         |  21 +-
 target/riscv/cpu.c                            |  34 +-
 target/riscv/cpu_helper.c                     |   2 +-
 target/rx/cpu.c                               |  28 +-
 target/s390x/cpu.c                            |  36 +-
 target/s390x/excp_helper.c                    |   2 +-
 target/sh4/cpu.c                              |  23 +-
 target/sparc/cpu.c                            |  29 +-
 target/tilegx/cpu.c                           |  19 +-
 target/tricore/cpu.c                          |  14 +-
 target/unicore32/cpu.c                        |  23 +-
 target/xtensa/cpu.c                           |  25 +-
 target/xtensa/helper.c                        |   4 +-
 target/ppc/translate_init.c.inc               |  44 +-
 MAINTAINERS                                   |   9 +-
 accel/kvm/meson.build                         |   2 +-
 accel/meson.build                             |   4 +-
 accel/tcg/meson.build                         |  10 +-
 target/i386/hax/meson.build                   |   2 +-
 target/i386/hvf/meson.build                   |   3 +-
 target/i386/kvm/meson.build                   |   7 +-
 target/i386/meson.build                       |   6 +-
 target/i386/whpx/meson.build                  |   2 +-
 110 files changed, 2036 insertions(+), 1071 deletions(-)
 create mode 100644 accel/accel-softmmu.h
 rename accel/tcg/{tcg-cpus-icount.h => tcg-accel-ops-icount.h} (88%)
 create mode 100644 accel/tcg/tcg-accel-ops-mttcg.h
 rename accel/tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h} (100%)
 rename accel/tcg/{tcg-cpus.h => tcg-accel-ops.h} (72%)
 create mode 100644 include/hw/core/accel-cpu.h
 create mode 100644 include/hw/core/tcg-cpu-ops.h
 rename include/{sysemu => qemu}/accel.h (84%)
 create mode 100644 include/sysemu/accel-ops.h
 rename target/i386/hax/{hax-cpus.h => hax-accel-ops.h} (95%)
 create mode 100644 target/i386/host-cpu.h
 rename target/i386/hvf/{hvf-cpus.h => hvf-accel-ops.h} (94%)
 create mode 100644 target/i386/kvm/kvm-cpu.h
 delete mode 100644 target/i386/tcg/tcg-cpu.h
 rename target/i386/whpx/{whpx-cpus.h => whpx-accel-ops.h} (96%)
 create mode 100644 accel/accel-common.c
 rename accel/{accel.c => accel-softmmu.c} (64%)
 create mode 100644 accel/accel-user.c
 rename accel/kvm/{kvm-cpus.c => kvm-accel-ops.c} (72%)
 rename accel/tcg/{tcg-cpus-icount.c => tcg-accel-ops-icount.c} (89%)
 rename accel/tcg/{tcg-cpus-mttcg.c => tcg-accel-ops-mttcg.c} (92%)
 rename accel/tcg/{tcg-cpus-rr.c => tcg-accel-ops-rr.c} (97%)
 rename accel/tcg/{tcg-cpus.c => tcg-accel-ops.c} (63%)
 rename target/i386/hax/{hax-cpus.c => hax-accel-ops.c} (69%)
 create mode 100644 target/i386/host-cpu.c
 rename target/i386/hvf/{hvf-cpus.c => hvf-accel-ops.c} (84%)
 create mode 100644 target/i386/hvf/hvf-cpu.c
 create mode 100644 target/i386/kvm/kvm-cpu.c
 rename target/i386/whpx/{whpx-cpus.c => whpx-accel-ops.c} (71%)

-- 
2.26.2


