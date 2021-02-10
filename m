Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969D2316A40
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:33:20 +0100 (CET)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rUV-000849-KR
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQR-0003d0-LA
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:54308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQN-0008S3-W2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52003AC97;
 Wed, 10 Feb 2021 15:29:01 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 00/14] i386 cleanup PART 2
Date: Wed, 10 Feb 2021 16:28:45 +0100
Message-Id: <20210210152859.25920-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all, looking for feedback (changed to RFC)
for the next step, here I am introducing target-specific
user-mode specific meson variables, and show their application
to i386/tcg as a starting point. The idea would be to use this
in order the cleanup more the code, applying it to arm,
and then proceed to apply the tcg/kvm split to arm.

This is truly RFC, so let me know what you think about this
"detour";

thanks,

Claudio

v16 -> v17: changed to RFC

* tcg_ops are already in master, removed from the series

* i386: split cpu accelerators from cpu.c, using AccelCPUClass:
  removed spurious ; and added spacing before/after functions (Richard)

* added new patches as RFC for the next steps, introducing target-specific
  user-mode specific meson variables, and applied to i386/tcg as an
  example, in order to gather feedback.

v15 -> v16:

* cpu: Move synchronize_from_tb() to tcg_ops:
  - adjusted comments (Alex)

* cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass:
  - remove forward decl. of AccelCPUClass, should be in a later patch. (Alex)
  - simplified comment about tcg_ops in struct CPUClass (Alex)
  - remove obsolete comment about ARM blocking TCGCPUOps from being const.
    (Alex)

* accel: replace struct CpusAccel with AccelOpsClass:
  - reworded commit message to be clearer about the objective (Alex)

* accel: introduce AccelCPUClass extending CPUClass
  - reworded commit message to be clearer about the objective (Alex)

* hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn:
  - dropped this patch (Alex, Philippe)

  will try again later, also in the context of:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg686480.html

* accel: introduce new accessor functions
  - squashed comments in previous patch introducing accel-cpu.h. (Philippe)

* accel-cpu: make cpu_realizefn return a bool
  - split in two patches, separating the change to the phys_bits check
    (Philippe)

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


Claudio Fontana (14):
  i386: split cpu accelerators from cpu.c, using AccelCPUClass
  cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
  accel: introduce new accessor functions
  target/i386: fix host_cpu_adjust_phys_bits error handling
  accel-cpu: make cpu_realizefn return a bool
  meson: add target_user_arch
  i386: split user and softmmu functionality in tcg-cpu
  i386: split smm helper (softmmu)
  i386: split tcg excp_helper into softmmu and user parts
  i386: split tcg btp_helper into softmmu and user parts
  i386: split misc helper into user and softmmu parts
  i386: separate fpu_helper into user and softmmu parts
  i386: slit svm_helper into softmmu and stub-only user
  i386: split seg_helper into user-only and softmmu parts

 meson.build                                   |   5 +
 include/hw/core/accel-cpu.h                   |   2 +-
 include/qemu/accel.h                          |  13 +
 target/i386/cpu.h                             |  23 +-
 target/i386/host-cpu.h                        |  19 +
 target/i386/kvm/kvm-cpu.h                     |  41 ++
 target/i386/tcg/helper-tcg.h                  |   8 +
 target/i386/tcg/seg_helper.h                  |  66 ++
 target/i386/tcg/tcg-cpu.h                     |  21 +-
 accel/accel-common.c                          |  19 +
 cpu.c                                         |   5 +-
 hw/i386/pc_piix.c                             |   1 +
 target/i386/cpu.c                             | 397 ++----------
 target/i386/host-cpu.c                        | 204 +++++++
 target/i386/hvf/hvf-cpu.c                     |  68 +++
 target/i386/kvm/kvm-cpu.c                     | 151 +++++
 target/i386/kvm/kvm.c                         |   3 +-
 target/i386/tcg/bpt_helper.c                  | 275 ---------
 target/i386/tcg/excp_helper.c                 | 572 ------------------
 target/i386/tcg/fpu_helper.c                  |  58 +-
 target/i386/tcg/misc_helper.c                 | 460 --------------
 target/i386/tcg/seg_helper.c                  | 233 +------
 target/i386/tcg/softmmu/bpt_helper_softmmu.c  | 293 +++++++++
 target/i386/tcg/softmmu/excp_helper_softmmu.c | 566 +++++++++++++++++
 target/i386/tcg/softmmu/fpu_helper_softmmu.c  |  67 ++
 target/i386/tcg/softmmu/misc_helper_softmmu.c | 439 ++++++++++++++
 target/i386/tcg/softmmu/seg_helper_softmmu.c  | 129 ++++
 target/i386/tcg/{ => softmmu}/smm_helper.c    |  18 +-
 target/i386/tcg/{ => softmmu}/svm_helper.c    |  62 +-
 target/i386/tcg/softmmu/tcg-cpu-softmmu.c     |  84 +++
 target/i386/tcg/tcg-cpu.c                     |  47 +-
 target/i386/tcg/user/bpt_helper_user.c        |  33 +
 target/i386/tcg/user/excp_helper_user.c       |  42 ++
 target/i386/tcg/user/fpu_helper_user.c        |  49 ++
 target/i386/tcg/user/misc_helper_user.c       |  77 +++
 target/i386/tcg/user/seg_helper_user.c        | 111 ++++
 target/i386/tcg/user/smm_helper_user.c        |  31 +
 target/i386/tcg/user/svm_helper_user.c        |  76 +++
 target/i386/tcg/user/tcg-cpu-user.c           |  27 +
 MAINTAINERS                                   |   2 +-
 target/i386/hvf/meson.build                   |   1 +
 target/i386/kvm/meson.build                   |   7 +-
 target/i386/meson.build                       |   8 +-
 target/i386/tcg/meson.build                   |   5 +-
 target/i386/tcg/softmmu/meson.build           |  10 +
 target/i386/tcg/user/meson.build              |  10 +
 46 files changed, 2778 insertions(+), 2060 deletions(-)
 create mode 100644 target/i386/host-cpu.h
 create mode 100644 target/i386/kvm/kvm-cpu.h
 create mode 100644 target/i386/tcg/seg_helper.h
 create mode 100644 target/i386/host-cpu.c
 create mode 100644 target/i386/hvf/hvf-cpu.c
 create mode 100644 target/i386/kvm/kvm-cpu.c
 create mode 100644 target/i386/tcg/softmmu/bpt_helper_softmmu.c
 create mode 100644 target/i386/tcg/softmmu/excp_helper_softmmu.c
 create mode 100644 target/i386/tcg/softmmu/fpu_helper_softmmu.c
 create mode 100644 target/i386/tcg/softmmu/misc_helper_softmmu.c
 create mode 100644 target/i386/tcg/softmmu/seg_helper_softmmu.c
 rename target/i386/tcg/{ => softmmu}/smm_helper.c (98%)
 rename target/i386/tcg/{ => softmmu}/svm_helper.c (96%)
 create mode 100644 target/i386/tcg/softmmu/tcg-cpu-softmmu.c
 create mode 100644 target/i386/tcg/user/bpt_helper_user.c
 create mode 100644 target/i386/tcg/user/excp_helper_user.c
 create mode 100644 target/i386/tcg/user/fpu_helper_user.c
 create mode 100644 target/i386/tcg/user/misc_helper_user.c
 create mode 100644 target/i386/tcg/user/seg_helper_user.c
 create mode 100644 target/i386/tcg/user/smm_helper_user.c
 create mode 100644 target/i386/tcg/user/svm_helper_user.c
 create mode 100644 target/i386/tcg/user/tcg-cpu-user.c
 create mode 100644 target/i386/tcg/softmmu/meson.build
 create mode 100644 target/i386/tcg/user/meson.build

-- 
2.26.2


