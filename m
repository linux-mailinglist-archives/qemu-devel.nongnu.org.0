Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE69333DCE1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:50:38 +0100 (CET)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEm6-0005no-0J
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMET4-0004ji-Ce
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:30:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:32892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMESo-0004nN-Gm
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:30:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DBADAC24;
 Tue, 16 Mar 2021 18:30:37 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v27 00/20] i386 cleanup PART 2
Date: Tue, 16 Mar 2021 19:30:15 +0100
Message-Id: <20210316183035.9424-1-cfontana@suse.de>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v26 -> v27: rebased on latest master

v25 -> v26:
* i386: separate fpu_helper into user and sysemu parts
 - removed the splitting of the user mode into their own user/fpu_helper.c,
   seems not worth it.

v24 -> v25:

* i386: separate fpu_helper into user and sysemu parts

 - added 2 preliminary patches to the series (from Richard)
 - rebased on those

* i386: move TCG btp_helper into sysemu/

 - fixed title typo (Alex)
 - nested #ifdef more easily (Richard)

v23 -> v24:

* i386: gdbstub: only write CR0/CR2/CR3/EFER for sysemu                                                                                     
 - remove additional #ifdef TARGET_X86_64
 - split in two patches, so it is easier to understand.

v22 -> v23:

* i386: move TCG btp_helper into sysemu/
 - extended the #ifndef CONFIG_USER_ONLY to entire else of
   if (cpl != 0).

* i386: split misc helper into user and sysemu parts
 - added g_assert_not_reached() and changed user file name to -stubs.

* i386: separate fpu_helper into user and sysemu parts
 - removed unused return value
 - added comment abut issues with current cpu_x86_fsave.

* i386: split off sysemu part of cpu.c
 - rename cpu-softmmu.c to cpu-sysemu.c
 - fixed two mispelled comments, and add two comments
   in the headers of cpu.c and cpu-sysemu.c to describe them

* i386: gdbstub: only write CR0/CR2/CR3/EFER for sysemu
 - defined some aux functions to reduce repeated code

* i386: make cpu_load_efer sysemu-only
 - move the function to helper.c, remove "inline"

v21 -> v22: replace "softmmu" with "sysemu"

v20 -> v21:

* meson: add target_user_arch
  - add hexagon

v19 -> v20:

* add new patch to make gdbstub only write certain registers for softmmu.
  In particular, CR0, CR2, CR3 and EFER should not be changed under
  CONFIG_USER_ONLY. (Paolo)

* add new patch to make cpu_load_efer softmmu-only (Paolo)

* i386: split svm_helper into softmmu and stub-only user

  - fixed commit message spelling (Eric)

  - mention in commit message that this reproduces the existing stubs,
    but really everything that requires s->cpl == 0 should be impossible
    to trigger from user-mode, and we could find a way to assert that
    more consistently.

v18 -> v19:

* i386: split smm helper (softmmu)
  - add g_assert_not_reached and cpu_abort for invalid states in
    CONFIG_USER_ONLY (Paolo)

* i386: move TCG btp_helper into softmmu/
  - for CONFIG_USER_ONLY, assert that the hidden IOBPT flags are not set
    while attempting to generate io_bpt helpers.
    Theory to verify (Paolo)

* i386: slit svm_helper into softmmu and stub-only user
  - added XXX in the commit message to highlight the question about
    whether the same check should be done controlling access to
    cpu_load_efer() and state of the hidden SVME flag. (Paolo)

v17 -> v18:

* meson: add target_user_arch

 - add target_user_arch to all targets which build user.
   Otherwise meson complains about missing key for archs without it.
   (Paolo)

* wrap a few gen_helper_ calls around ifndef CONFIG_USER_ONLY.
  This would need a look from someone like Alex or Richard I think,
  as potentially we could remove even more code I think around the
  gen_helper_ calls for CONFIG_USER_ONLY.

  In the current master code, we have empty helpers for user mode,
  but still we generate the preamble code, temporary variables etc,
  just to then call a helper_() function that does nothing.

  In particular I am referring to patches:

  i386: split tcg btp_helper into softmmu and user parts
        DEF_HELPER_FLAGS_3(set_dr, TCG_CALL_NO_WG, void, env, int, tl)
        DEF_HELPER_FLAGS_4(bpt_io, TCG_CALL_NO_WG, void, env, i32, i32, tl)
        gen_bpt_io
        gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);

  i386: split smm helper (softmmu)
        DEF_HELPER_1(rsm, void, env)
	gen_helper_rsm(cpu_env);

  (Alex, Richard?)

* removed suffixes from user/ and softmmu/ modules
  (Alex, Philippe).
  Where possible, removed user stubs entirely.
  Renamed the leftover svm_helper stubs to user/svm_stubs.c

* cleaned up lefover unnecessary header files and squashed them.
 

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


Claudio Fontana (18):
  i386: split cpu accelerators from cpu.c, using AccelCPUClass
  cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
  accel: introduce new accessor functions
  target/i386: fix host_cpu_adjust_phys_bits error handling
  accel-cpu: make cpu_realizefn return a bool
  meson: add target_user_arch
  i386: split off sysemu-only functionality in tcg-cpu
  i386: split smm helper (sysemu)
  i386: split tcg excp_helper into sysemu and user parts
  i386: move TCG bpt_helper into sysemu/
  i386: split misc helper user stubs and sysemu part
  i386: separate fpu_helper sysemu-only parts
  i386: split svm_helper into sysemu and stub-only user
  i386: split seg_helper into user-only and sysemu parts
  i386: split off sysemu part of cpu.c
  target/i386: gdbstub: introduce aux functions to read/write CS64 regs
  target/i386: gdbstub: only write CR0/CR2/CR3/EFER for sysemu
  i386: make cpu_load_efer sysemu-only

Richard Henderson (2):
  target/i386: Rename helper_fldt, helper_fstt
  target/i386: Split out do_fsave, do_frstor, do_fxsave, do_fxrstor

 meson.build                               |   5 +
 include/hw/core/accel-cpu.h               |   2 +-
 include/qemu/accel.h                      |  13 +
 target/i386/cpu-internal.h                |  70 ++
 target/i386/cpu.h                         |  43 +-
 target/i386/helper.h                      |  11 +
 target/i386/host-cpu.h                    |  19 +
 target/i386/kvm/kvm-cpu.h                 |  41 ++
 target/i386/tcg/helper-tcg.h              |   8 +
 target/i386/tcg/seg_helper.h              |  66 ++
 target/i386/tcg/tcg-cpu.h                 |  21 +-
 accel/accel-common.c                      |  19 +
 cpu.c                                     |   5 +-
 hw/i386/pc_piix.c                         |   1 +
 target/i386/cpu-sysemu.c                  | 352 ++++++++++
 target/i386/cpu.c                         | 782 ++--------------------
 target/i386/gdbstub.c                     | 165 ++---
 target/i386/helper.c                      |  13 +
 target/i386/host-cpu.c                    | 204 ++++++
 target/i386/hvf/hvf-cpu.c                 |  68 ++
 target/i386/kvm/kvm-cpu.c                 | 151 +++++
 target/i386/kvm/kvm.c                     |   3 +-
 target/i386/tcg/bpt_helper.c              | 276 --------
 target/i386/tcg/excp_helper.c             | 572 ----------------
 target/i386/tcg/fpu_helper.c              | 122 ++--
 target/i386/tcg/misc_helper.c             | 463 -------------
 target/i386/tcg/seg_helper.c              | 237 +------
 target/i386/tcg/sysemu/bpt_helper.c       | 293 ++++++++
 target/i386/tcg/sysemu/excp_helper.c      | 581 ++++++++++++++++
 target/i386/tcg/sysemu/fpu_helper.c       |  57 ++
 target/i386/tcg/sysemu/misc_helper.c      | 438 ++++++++++++
 target/i386/tcg/sysemu/seg_helper.c       | 125 ++++
 target/i386/tcg/{ => sysemu}/smm_helper.c |  19 +-
 target/i386/tcg/{ => sysemu}/svm_helper.c |  62 +-
 target/i386/tcg/sysemu/tcg-cpu.c          |  83 +++
 target/i386/tcg/tcg-cpu.c                 |  50 +-
 target/i386/tcg/translate.c               |  13 +-
 target/i386/tcg/user/excp_helper.c        |  39 ++
 target/i386/tcg/user/misc_stubs.c         |  75 +++
 target/i386/tcg/user/seg_helper.c         | 109 +++
 target/i386/tcg/user/svm_stubs.c          |  76 +++
 MAINTAINERS                               |   2 +-
 target/alpha/meson.build                  |   3 +
 target/arm/meson.build                    |   2 +
 target/cris/meson.build                   |   3 +
 target/hexagon/meson.build                |   3 +
 target/hppa/meson.build                   |   3 +
 target/i386/hvf/meson.build               |   1 +
 target/i386/kvm/meson.build               |   7 +-
 target/i386/meson.build                   |   9 +-
 target/i386/tcg/meson.build               |   5 +-
 target/i386/tcg/sysemu/meson.build        |  10 +
 target/i386/tcg/user/meson.build          |   6 +
 target/m68k/meson.build                   |   3 +
 target/microblaze/meson.build             |   3 +
 target/mips/meson.build                   |   2 +
 target/nios2/meson.build                  |   3 +
 target/openrisc/meson.build               |   3 +
 target/ppc/meson.build                    |   3 +
 target/riscv/meson.build                  |   3 +
 target/s390x/meson.build                  |   3 +
 target/sh4/meson.build                    |   3 +
 target/sparc/meson.build                  |   3 +
 target/tricore/meson.build                |   3 +
 target/xtensa/meson.build                 |   3 +
 65 files changed, 3262 insertions(+), 2579 deletions(-)
 create mode 100644 target/i386/cpu-internal.h
 create mode 100644 target/i386/host-cpu.h
 create mode 100644 target/i386/kvm/kvm-cpu.h
 create mode 100644 target/i386/tcg/seg_helper.h
 create mode 100644 target/i386/cpu-sysemu.c
 create mode 100644 target/i386/host-cpu.c
 create mode 100644 target/i386/hvf/hvf-cpu.c
 create mode 100644 target/i386/kvm/kvm-cpu.c
 create mode 100644 target/i386/tcg/sysemu/bpt_helper.c
 create mode 100644 target/i386/tcg/sysemu/excp_helper.c
 create mode 100644 target/i386/tcg/sysemu/fpu_helper.c
 create mode 100644 target/i386/tcg/sysemu/misc_helper.c
 create mode 100644 target/i386/tcg/sysemu/seg_helper.c
 rename target/i386/tcg/{ => sysemu}/smm_helper.c (98%)
 rename target/i386/tcg/{ => sysemu}/svm_helper.c (96%)
 create mode 100644 target/i386/tcg/sysemu/tcg-cpu.c
 create mode 100644 target/i386/tcg/user/excp_helper.c
 create mode 100644 target/i386/tcg/user/misc_stubs.c
 create mode 100644 target/i386/tcg/user/seg_helper.c
 create mode 100644 target/i386/tcg/user/svm_stubs.c
 create mode 100644 target/i386/tcg/sysemu/meson.build
 create mode 100644 target/i386/tcg/user/meson.build

-- 
2.26.2


