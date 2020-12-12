Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C82D8940
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:27:54 +0100 (CET)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9cW-0003gn-RO
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko9PL-0004rZ-W1
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:14:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:36596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko9P9-0000Ky-Lt
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:14:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 610FDAB91;
 Sat, 12 Dec 2020 15:55:33 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v12 00/23] i386 cleanup PART 1
Date: Sat, 12 Dec 2020 16:55:07 +0100
Message-Id: <20201212155530.23098-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, this is version 12 of the cleanup (PART 1)

The series has been split into two separate parts,
and this is PART 1.

v11 -> v12:

* "cpu: Move synchronize_from_tb() to tcg_ops":
  removed review tags, as there is currently a bunch of conflicting
  requirements (Eduardo, Richard, Philippe).

  in this iteration, tcg-cpu-ops.h is renamed to tcg-cpu-ops.h.inc,
  and it is not expected to be included standalone as a header file,
  instead it is just a split of cpu.h for the TCG-specific ops.

* "i386: move whpx accel files into whpx/" rebased on master
  (trivial change) -> added whpx/apic.c

* "i386: move kvm accel files into kvm/" rebased on master
  (trivial change) -> added some code and a default kvm parameter
  to kvm/kvm-cpu.c

* "i386: move TCG accel files into tcg/":
  (trivial change) -> moved cc_helper_template.h to tcg/ as well.

* "i386: move TCG cpu class initialization to tcg/":

  comment better the additional moves of TCG specific defines
  from cpu.h to helper-tcg.h.

  cpu.h: do not touch CC_SRC and friends,
  move FT0 and friends to tcg/fpu_helper.c.

  create a new patch
  "i386: tcg: remove inline from cpu_load_eflags".
  (Richard)

* "cpu: Move tlb_fill to tcg_ops":
  (trivial change) -> break line longer than 80 char

* "cpu: move cc->transaction_failed to tcg_ops:
  (trivial change) -> break line longer than 80 char


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


Claudio Fontana (14):
  i386: move kvm accel files into kvm/
  i386: move whpx accel files into whpx/
  i386: move hax accel files into hax/
  i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
  i386: move TCG accel files into tcg/
  i386: move cpu dump out of helper.c into cpu-dump.c
  i386: move TCG cpu class initialization to tcg/
  i386: tcg: remove inline from cpu_load_eflags
  target/riscv: remove CONFIG_TCG, as it is always TCG
  accel/tcg: split TCG-only code from cpu_exec_realizefn
  target/arm: do not use cc->do_interrupt for KVM directly
  cpu: move cc->do_interrupt to tcg_ops
  cpu: move cc->transaction_failed to tcg_ops
  cpu: move do_unaligned_access to tcg_ops

Eduardo Habkost (9):
  tcg: cpu_exec_{enter,exit} helpers
  tcg: make CPUClass.cpu_exec_* optional
  tcg: Make CPUClass.debug_excp_handler optional
  cpu: Remove unnecessary noop methods
  cpu: Introduce TCGCpuOperations struct
  cpu: Move synchronize_from_tb() to tcg_ops
  cpu: Move cpu_exec_* to tcg_ops
  cpu: Move tlb_fill to tcg_ops
  cpu: Move debug_excp_handler to tcg_ops

 meson.build                                |   1 +
 include/hw/core/cpu.h                      |  73 +--
 target/i386/cpu.h                          |  89 +---
 target/i386/{ => hax}/hax-cpus.h           |   0
 target/i386/{ => hax}/hax-i386.h           |   6 +-
 target/i386/{ => hax}/hax-interface.h      |   0
 target/i386/{ => hax}/hax-posix.h          |   0
 target/i386/{ => hax}/hax-windows.h        |   0
 target/i386/{ => kvm}/hyperv-proto.h       |   0
 target/i386/{ => kvm}/hyperv.h             |   0
 target/i386/{ => kvm}/kvm_i386.h           |   0
 target/i386/kvm/trace.h                    |   1 +
 target/i386/{ => tcg}/cc_helper_template.h |   0
 target/i386/tcg/helper-tcg.h               |  95 ++++
 target/i386/tcg/tcg-cpu.h                  |  15 +
 target/i386/{ => whpx}/whp-dispatch.h      |   0
 target/i386/{ => whpx}/whpx-cpus.h         |   0
 accel/tcg/cpu-exec.c                       |  70 ++-
 accel/tcg/cputlb.c                         |   7 +-
 accel/tcg/user-exec.c                      |   6 +-
 cpu.c                                      |  66 +--
 hw/core/cpu.c                              |  19 +-
 hw/i386/fw_cfg.c                           |   2 +-
 hw/i386/intel_iommu.c                      |   2 +-
 hw/i386/kvm/apic.c                         |   2 +-
 hw/i386/kvm/clock.c                        |   2 +-
 hw/i386/microvm.c                          |   2 +-
 hw/i386/pc.c                               |   2 +-
 hw/i386/x86.c                              |   2 +-
 hw/mips/jazz.c                             |   9 +-
 target/alpha/cpu.c                         |  12 +-
 target/arm/cpu.c                           |  22 +-
 target/arm/cpu64.c                         |   5 +-
 target/arm/cpu_tcg.c                       |  10 +-
 target/arm/helper.c                        |   4 +
 target/arm/kvm64.c                         |   6 +-
 target/avr/cpu.c                           |  10 +-
 target/avr/helper.c                        |   4 +-
 target/cris/cpu.c                          |  28 +-
 target/cris/helper.c                       |   4 +-
 target/hppa/cpu.c                          |  14 +-
 target/i386/cpu-dump.c                     | 537 ++++++++++++++++++++
 target/i386/cpu.c                          |  35 +-
 target/i386/{ => hax}/hax-all.c            |   0
 target/i386/{ => hax}/hax-cpus.c           |   0
 target/i386/{ => hax}/hax-mem.c            |   0
 target/i386/{ => hax}/hax-posix.c          |   0
 target/i386/{ => hax}/hax-windows.c        |   0
 target/i386/helper.c                       | 539 +--------------------
 target/i386/{ => kvm}/hyperv-stub.c        |   0
 target/i386/{ => kvm}/hyperv.c             |   0
 target/i386/{ => kvm}/kvm-stub.c           |   0
 target/i386/{ => kvm}/kvm.c                |   0
 target/i386/machine.c                      |   4 +-
 target/i386/{ => tcg}/bpt_helper.c         |   1 +
 target/i386/{ => tcg}/cc_helper.c          |   1 +
 target/i386/{ => tcg}/excp_helper.c        |   1 +
 target/i386/{ => tcg}/fpu_helper.c         |  39 +-
 target/i386/{ => tcg}/int_helper.c         |   1 +
 target/i386/{ => tcg}/mem_helper.c         |   1 +
 target/i386/{ => tcg}/misc_helper.c        |  14 +
 target/i386/{ => tcg}/mpx_helper.c         |   1 +
 target/i386/{ => tcg}/seg_helper.c         |   1 +
 target/i386/{ => tcg}/smm_helper.c         |   2 +
 target/i386/{ => tcg}/svm_helper.c         |   1 +
 target/i386/tcg/tcg-cpu.c                  |  71 +++
 target/i386/{ => tcg}/tcg-stub.c           |   0
 target/i386/{ => tcg}/translate.c          |   1 +
 target/i386/{ => whpx}/whpx-all.c          |   0
 target/i386/{ => whpx}/whpx-apic.c         |   0
 target/i386/{ => whpx}/whpx-cpus.c         |   0
 target/lm32/cpu.c                          |  10 +-
 target/m68k/cpu.c                          |  10 +-
 target/microblaze/cpu.c                    |  14 +-
 target/mips/cpu.c                          |  21 +-
 target/moxie/cpu.c                         |   6 +-
 target/nios2/cpu.c                         |  10 +-
 target/openrisc/cpu.c                      |   8 +-
 target/riscv/cpu.c                         |  17 +-
 target/riscv/cpu_helper.c                  |   2 +-
 target/rx/cpu.c                            |  10 +-
 target/s390x/cpu.c                         |  12 +-
 target/s390x/excp_helper.c                 |   2 +-
 target/sh4/cpu.c                           |  12 +-
 target/sparc/cpu.c                         |  14 +-
 target/tilegx/cpu.c                        |   8 +-
 target/tricore/cpu.c                       |   6 +-
 target/unicore32/cpu.c                     |   8 +-
 target/xtensa/cpu.c                        |  14 +-
 target/xtensa/helper.c                     |   4 +-
 MAINTAINERS                                |  12 +-
 include/hw/core/tcg-cpu-ops.h.inc          |  77 +++
 target/i386/hax/meson.build                |   7 +
 target/i386/kvm/meson.build                |   3 +
 target/i386/kvm/trace-events               |   7 +
 target/i386/meson.build                    |  33 +-
 target/i386/tcg/meson.build                |  14 +
 target/i386/trace-events                   |   6 -
 target/i386/whpx/meson.build               |   5 +
 target/ppc/translate_init.c.inc            |  24 +-
 100 files changed, 1227 insertions(+), 989 deletions(-)
 rename target/i386/{ => hax}/hax-cpus.h (100%)
 rename target/i386/{ => hax}/hax-i386.h (95%)
 rename target/i386/{ => hax}/hax-interface.h (100%)
 rename target/i386/{ => hax}/hax-posix.h (100%)
 rename target/i386/{ => hax}/hax-windows.h (100%)
 rename target/i386/{ => kvm}/hyperv-proto.h (100%)
 rename target/i386/{ => kvm}/hyperv.h (100%)
 rename target/i386/{ => kvm}/kvm_i386.h (100%)
 create mode 100644 target/i386/kvm/trace.h
 rename target/i386/{ => tcg}/cc_helper_template.h (100%)
 create mode 100644 target/i386/tcg/helper-tcg.h
 create mode 100644 target/i386/tcg/tcg-cpu.h
 rename target/i386/{ => whpx}/whp-dispatch.h (100%)
 rename target/i386/{ => whpx}/whpx-cpus.h (100%)
 create mode 100644 target/i386/cpu-dump.c
 rename target/i386/{ => hax}/hax-all.c (100%)
 rename target/i386/{ => hax}/hax-cpus.c (100%)
 rename target/i386/{ => hax}/hax-mem.c (100%)
 rename target/i386/{ => hax}/hax-posix.c (100%)
 rename target/i386/{ => hax}/hax-windows.c (100%)
 rename target/i386/{ => kvm}/hyperv-stub.c (100%)
 rename target/i386/{ => kvm}/hyperv.c (100%)
 rename target/i386/{ => kvm}/kvm-stub.c (100%)
 rename target/i386/{ => kvm}/kvm.c (100%)
 rename target/i386/{ => tcg}/bpt_helper.c (99%)
 rename target/i386/{ => tcg}/cc_helper.c (99%)
 rename target/i386/{ => tcg}/excp_helper.c (99%)
 rename target/i386/{ => tcg}/fpu_helper.c (99%)
 rename target/i386/{ => tcg}/int_helper.c (99%)
 rename target/i386/{ => tcg}/mem_helper.c (99%)
 rename target/i386/{ => tcg}/misc_helper.c (97%)
 rename target/i386/{ => tcg}/mpx_helper.c (99%)
 rename target/i386/{ => tcg}/seg_helper.c (99%)
 rename target/i386/{ => tcg}/smm_helper.c (99%)
 rename target/i386/{ => tcg}/svm_helper.c (99%)
 create mode 100644 target/i386/tcg/tcg-cpu.c
 rename target/i386/{ => tcg}/tcg-stub.c (100%)
 rename target/i386/{ => tcg}/translate.c (99%)
 rename target/i386/{ => whpx}/whpx-all.c (100%)
 rename target/i386/{ => whpx}/whpx-apic.c (100%)
 rename target/i386/{ => whpx}/whpx-cpus.c (100%)
 create mode 100644 include/hw/core/tcg-cpu-ops.h.inc
 create mode 100644 target/i386/hax/meson.build
 create mode 100644 target/i386/kvm/meson.build
 create mode 100644 target/i386/kvm/trace-events
 create mode 100644 target/i386/tcg/meson.build
 create mode 100644 target/i386/whpx/meson.build

-- 
2.26.2


