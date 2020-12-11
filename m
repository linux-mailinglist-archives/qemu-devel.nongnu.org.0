Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA32D7383
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 11:10:48 +0100 (CET)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knfNs-0007mn-W0
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 05:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knfMQ-0006cK-Vq
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:09:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:49464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knfMO-0007a9-Dd
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:09:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C3C2B13A;
 Fri, 11 Dec 2020 10:09:10 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v11 0/7] i386 cleanup PART 2
Date: Fri, 11 Dec 2020 11:09:01 +0100
Message-Id: <20201211100908.19696-1-cfontana@suse.de>
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

Hello, this is version 11 of the cleanup, PART 2.

The series has been split into two separate parts;
to find PART 1, see the series "i386 cleanup PART 1"

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


Claudio Fontana (7):
  accel: extend AccelState and AccelClass to user-mode
  accel: replace struct CpusAccel with AccelOpsClass
  accel: introduce AccelCPUClass extending CPUClass
  i386: split cpu accelerators from cpu.c, using AccelCPUClass
  cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
  hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn
  cpu: introduce cpu_accel_instance_init

 accel/accel-softmmu.h                         |  15 +
 accel/kvm/kvm-cpus.h                          |   2 -
 ...g-cpus-icount.h => tcg-accel-ops-icount.h} |   2 +
 accel/tcg/tcg-accel-ops-mttcg.h               |  19 +
 .../tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h} |   0
 accel/tcg/{tcg-cpus.h => tcg-accel-ops.h}     |   6 +-
 include/hw/boards.h                           |   2 +-
 include/hw/core/accel-cpu.h                   |  25 ++
 include/hw/core/cpu.h                         |  19 +
 include/{sysemu => qemu}/accel.h              |  16 +-
 include/sysemu/accel-ops.h                    |  45 ++
 include/sysemu/cpus.h                         |  26 +-
 include/sysemu/hvf.h                          |   2 +-
 include/sysemu/kvm.h                          |   2 +-
 include/sysemu/kvm_int.h                      |   2 +-
 target/i386/cpu.h                             |  20 +-
 .../i386/hax/{hax-cpus.h => hax-accel-ops.h}  |   2 -
 target/i386/hax/hax-windows.h                 |   2 +-
 target/i386/host-cpu.h                        |  19 +
 .../i386/hvf/{hvf-cpus.h => hvf-accel-ops.h}  |   2 -
 target/i386/hvf/hvf-i386.h                    |   2 +-
 target/i386/kvm/kvm-cpu.h                     |  41 ++
 target/i386/tcg/tcg-cpu.h                     |  15 -
 .../whpx/{whpx-cpus.h => whpx-accel-ops.h}    |   2 -
 accel/accel-common.c                          | 105 +++++
 accel/{accel.c => accel-softmmu.c}            |  60 ++-
 accel/accel-user.c                            |  24 ++
 accel/kvm/{kvm-cpus.c => kvm-accel-ops.c}     |  26 +-
 accel/kvm/kvm-all.c                           |   2 -
 accel/qtest/qtest.c                           |  25 +-
 ...g-cpus-icount.c => tcg-accel-ops-icount.c} |  21 +-
 ...tcg-cpus-mttcg.c => tcg-accel-ops-mttcg.c} |  14 +-
 .../tcg/{tcg-cpus-rr.c => tcg-accel-ops-rr.c} |  13 +-
 accel/tcg/{tcg-cpus.c => tcg-accel-ops.c}     |  47 ++-
 accel/tcg/tcg-all.c                           |  17 +-
 accel/xen/xen-all.c                           |  24 +-
 bsd-user/main.c                               |  11 +-
 cpu.c                                         |   5 +
 hw/core/cpu.c                                 |  11 +
 hw/i386/pc_piix.c                             |   1 +
 linux-user/main.c                             |   7 +-
 softmmu/cpus.c                                |  12 +-
 softmmu/memory.c                              |   2 +-
 softmmu/qtest.c                               |   2 +-
 softmmu/vl.c                                  |   8 +-
 target/alpha/cpu.c                            |   5 +-
 target/arm/cpu.c                              |   4 +-
 target/avr/cpu.c                              |   3 +-
 target/cris/cpu.c                             |   2 -
 target/hppa/cpu.c                             |   1 -
 target/i386/cpu.c                             | 393 ++----------------
 .../i386/hax/{hax-cpus.c => hax-accel-ops.c}  |  31 +-
 target/i386/hax/hax-all.c                     |   7 +-
 target/i386/hax/hax-mem.c                     |   2 +-
 target/i386/hax/hax-posix.c                   |   2 +-
 target/i386/hax/hax-windows.c                 |   2 +-
 target/i386/host-cpu.c                        | 198 +++++++++
 .../i386/hvf/{hvf-cpus.c => hvf-accel-ops.c}  |  29 +-
 target/i386/hvf/hvf-cpu.c                     |  65 +++
 target/i386/hvf/hvf.c                         |   5 +-
 target/i386/hvf/x86_task.c                    |   2 +-
 target/i386/hvf/x86hvf.c                      |   2 +-
 target/i386/kvm/kvm-cpu.c                     | 148 +++++++
 target/i386/kvm/kvm.c                         |   3 +-
 target/i386/tcg/tcg-cpu.c                     | 116 +++++-
 .../whpx/{whpx-cpus.c => whpx-accel-ops.c}    |  31 +-
 target/i386/whpx/whpx-all.c                   |   6 +-
 target/lm32/cpu.c                             |   3 -
 target/m68k/cpu.c                             |   2 -
 target/microblaze/cpu.c                       |   9 +-
 target/mips/cpu.c                             |   2 -
 target/moxie/cpu.c                            |   4 +-
 target/nios2/cpu.c                            |   4 +-
 target/openrisc/cpu.c                         |   4 +-
 target/riscv/cpu.c                            |   8 +-
 target/rx/cpu.c                               |   8 +-
 target/s390x/cpu.c                            |   3 +-
 target/sh4/cpu.c                              |   2 -
 target/sparc/cpu.c                            |   4 +-
 target/tilegx/cpu.c                           |   2 -
 target/tricore/cpu.c                          |   2 -
 target/unicore32/cpu.c                        |   6 +-
 target/xtensa/cpu.c                           |   2 -
 MAINTAINERS                                   |   8 +-
 accel/kvm/meson.build                         |   2 +-
 accel/meson.build                             |   4 +-
 accel/tcg/meson.build                         |  10 +-
 target/i386/hax/meson.build                   |   2 +-
 target/i386/hvf/meson.build                   |   3 +-
 target/i386/kvm/meson.build                   |   7 +-
 target/i386/meson.build                       |   6 +-
 target/i386/whpx/meson.build                  |   2 +-
 target/ppc/translate_init.c.inc               |   5 +-
 93 files changed, 1230 insertions(+), 666 deletions(-)
 create mode 100644 accel/accel-softmmu.h
 rename accel/tcg/{tcg-cpus-icount.h => tcg-accel-ops-icount.h} (88%)
 create mode 100644 accel/tcg/tcg-accel-ops-mttcg.h
 rename accel/tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h} (100%)
 rename accel/tcg/{tcg-cpus.h => tcg-accel-ops.h} (72%)
 create mode 100644 include/hw/core/accel-cpu.h
 rename include/{sysemu => qemu}/accel.h (94%)
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
 rename target/i386/whpx/{whpx-cpus.c => whpx-accel-ops.c} (72%)

-- 
2.26.2


