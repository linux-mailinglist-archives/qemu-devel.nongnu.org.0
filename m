Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AA32C5DE9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:37:59 +0100 (CET)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPtm-0007Qu-1g
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiPoW-0001Nv-1S
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:32:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:44268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiPoP-0003Eh-OT
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:32:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CF68ADE1;
 Thu, 26 Nov 2020 22:32:23 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v6 00/11] i386 cleanup
Date: Thu, 26 Nov 2020 23:32:07 +0100
Message-Id: <20201126223218.31480-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all, this is v6 of the i386 cleanup,
with the most interesting patches at the end.

v5 -> v6: remove MODULE_INIT_ACCEL_CPU

instead, use a call to accel_init_interfaces().

* The class lookups are now general and performed in accel/

  new AccelCPUClass for new archs are supported as new
  ones appear in the class hierarchy, no need for stubs.

* Split the code a bit better

Thanks,

Claudio


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

Claudio Fontana (11):
  i386: move kvm accel files into kvm/
  i386: move whpx accel files into whpx/
  i386: move hax accel files into hax/
  i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
  i386: move TCG accel files into tcg/
  i386: move cpu dump out of helper.c into cpu-dump.c
  i386: move TCG cpu class initialization out of helper.c
  accel: extend AccelState and AccelClass to user-mode
  accel: replace struct CpusAccel with AccelOpsClass
  accel: introduce AccelCPUClass extending CPUClass
  i386: split cpu accelerators from cpu.c, using AccelCPUClass

 MAINTAINERS                           |  18 +-
 accel/accel-common.c                  | 104 +++++
 accel/{accel.c => accel-softmmu.c}    |  60 +--
 accel/accel-softmmu.h                 |  15 +
 accel/accel-user.c                    |  24 ++
 accel/kvm/kvm-all.c                   |   2 -
 accel/kvm/kvm-cpus.c                  |  26 +-
 accel/kvm/kvm-cpus.h                  |   2 -
 accel/meson.build                     |   4 +-
 accel/qtest/qtest.c                   |  25 +-
 accel/tcg/meson.build                 |   2 +-
 accel/tcg/tcg-all.c                   |  11 +-
 accel/tcg/tcg-cpus-icount.c           |  11 +-
 accel/tcg/tcg-cpus-icount.h           |   2 +
 accel/tcg/tcg-cpus-mttcg.c            |  12 +-
 accel/tcg/tcg-cpus-mttcg.h            |  19 +
 accel/tcg/tcg-cpus-rr.c               |   7 -
 accel/tcg/tcg-cpus.c                  |  43 ++
 accel/tcg/tcg-cpus.h                  |   4 -
 accel/xen/xen-all.c                   |  24 +-
 bsd-user/main.c                       |  12 +-
 hw/i386/fw_cfg.c                      |   2 +-
 hw/i386/intel_iommu.c                 |   2 +-
 hw/i386/kvm/apic.c                    |   2 +-
 hw/i386/kvm/clock.c                   |   2 +-
 hw/i386/microvm.c                     |   2 +-
 hw/i386/pc.c                          |   2 +-
 hw/i386/pc_piix.c                     |   1 +
 hw/i386/x86.c                         |   2 +-
 include/hw/boards.h                   |   2 +-
 include/hw/core/accel-cpu.h           |  28 ++
 include/hw/core/cpu.h                 |   4 +
 include/{sysemu => qemu}/accel.h      |  16 +-
 include/sysemu/accel-ops.h            |  45 +++
 include/sysemu/cpus.h                 |  26 +-
 include/sysemu/hvf.h                  |   2 +-
 include/sysemu/kvm.h                  |   2 +-
 include/sysemu/kvm_int.h              |   2 +-
 linux-user/main.c                     |   8 +-
 meson.build                           |   1 +
 softmmu/cpus.c                        |  12 +-
 softmmu/memory.c                      |   2 +-
 softmmu/qtest.c                       |   2 +-
 softmmu/vl.c                          |  10 +-
 target/i386/cpu-dump.c                | 538 +++++++++++++++++++++++++
 target/i386/cpu.c                     | 411 +++-----------------
 target/i386/cpu.h                     | 120 +-----
 target/i386/{ => hax}/hax-all.c       |   5 +-
 target/i386/{ => hax}/hax-cpus.c      |  29 +-
 target/i386/{ => hax}/hax-cpus.h      |   2 -
 target/i386/{ => hax}/hax-i386.h      |   6 +-
 target/i386/{ => hax}/hax-interface.h |   0
 target/i386/{ => hax}/hax-mem.c       |   0
 target/i386/{ => hax}/hax-posix.c     |   0
 target/i386/{ => hax}/hax-posix.h     |   0
 target/i386/{ => hax}/hax-windows.c   |   0
 target/i386/{ => hax}/hax-windows.h   |   0
 target/i386/hax/meson.build           |   7 +
 target/i386/helper-tcg.h              | 112 ++++++
 target/i386/helper.c                  | 539 +-------------------------
 target/i386/host-cpu.c                | 198 ++++++++++
 target/i386/host-cpu.h                |  19 +
 target/i386/hvf/cpu.c                 |  65 ++++
 target/i386/hvf/hvf-cpus.c            |  27 +-
 target/i386/hvf/hvf-cpus.h            |   2 -
 target/i386/hvf/hvf-i386.h            |   2 +-
 target/i386/hvf/hvf.c                 |   3 +-
 target/i386/hvf/meson.build           |   1 +
 target/i386/hvf/x86_task.c            |   2 +-
 target/i386/kvm/cpu.c                 | 148 +++++++
 target/i386/{ => kvm}/hyperv-proto.h  |   0
 target/i386/{ => kvm}/hyperv-stub.c   |   0
 target/i386/{ => kvm}/hyperv.c        |   0
 target/i386/{ => kvm}/hyperv.h        |   0
 target/i386/kvm/kvm-cpu.h             |  41 ++
 target/i386/{ => kvm}/kvm-stub.c      |   0
 target/i386/{ => kvm}/kvm.c           |   3 +-
 target/i386/{ => kvm}/kvm_i386.h      |   0
 target/i386/kvm/meson.build           |   8 +
 target/i386/kvm/trace-events          |   7 +
 target/i386/kvm/trace.h               |   1 +
 target/i386/machine.c                 |   4 +-
 target/i386/meson.build               |  39 +-
 target/i386/{ => tcg}/bpt_helper.c    |   1 +
 target/i386/{ => tcg}/cc_helper.c     |   1 +
 target/i386/tcg/cpu.c                 | 173 +++++++++
 target/i386/{ => tcg}/excp_helper.c   |   1 +
 target/i386/{ => tcg}/fpu_helper.c    |  33 +-
 target/i386/{ => tcg}/int_helper.c    |   1 +
 target/i386/{ => tcg}/mem_helper.c    |   1 +
 target/i386/tcg/meson.build           |  14 +
 target/i386/{ => tcg}/misc_helper.c   |   1 +
 target/i386/{ => tcg}/mpx_helper.c    |   1 +
 target/i386/{ => tcg}/seg_helper.c    |   1 +
 target/i386/{ => tcg}/smm_helper.c    |   2 +
 target/i386/{ => tcg}/svm_helper.c    |   1 +
 target/i386/{ => tcg}/tcg-stub.c      |   0
 target/i386/{ => tcg}/translate.c     |   1 +
 target/i386/trace-events              |   6 -
 target/i386/whpx/meson.build          |   4 +
 target/i386/{ => whpx}/whp-dispatch.h |   0
 target/i386/{ => whpx}/whpx-all.c     |   4 +-
 target/i386/{ => whpx}/whpx-cpus.c    |  29 +-
 target/i386/{ => whpx}/whpx-cpus.h    |   2 -
 104 files changed, 1965 insertions(+), 1255 deletions(-)
 create mode 100644 accel/accel-common.c
 rename accel/{accel.c => accel-softmmu.c} (64%)
 create mode 100644 accel/accel-softmmu.h
 create mode 100644 accel/accel-user.c
 create mode 100644 accel/tcg/tcg-cpus-mttcg.h
 create mode 100644 include/hw/core/accel-cpu.h
 rename include/{sysemu => qemu}/accel.h (93%)
 create mode 100644 include/sysemu/accel-ops.h
 create mode 100644 target/i386/cpu-dump.c
 rename target/i386/{ => hax}/hax-all.c (99%)
 rename target/i386/{ => hax}/hax-cpus.c (71%)
 rename target/i386/{ => hax}/hax-cpus.h (95%)
 rename target/i386/{ => hax}/hax-i386.h (95%)
 rename target/i386/{ => hax}/hax-interface.h (100%)
 rename target/i386/{ => hax}/hax-mem.c (100%)
 rename target/i386/{ => hax}/hax-posix.c (100%)
 rename target/i386/{ => hax}/hax-posix.h (100%)
 rename target/i386/{ => hax}/hax-windows.c (100%)
 rename target/i386/{ => hax}/hax-windows.h (100%)
 create mode 100644 target/i386/hax/meson.build
 create mode 100644 target/i386/helper-tcg.h
 create mode 100644 target/i386/host-cpu.c
 create mode 100644 target/i386/host-cpu.h
 create mode 100644 target/i386/hvf/cpu.c
 create mode 100644 target/i386/kvm/cpu.c
 rename target/i386/{ => kvm}/hyperv-proto.h (100%)
 rename target/i386/{ => kvm}/hyperv-stub.c (100%)
 rename target/i386/{ => kvm}/hyperv.c (100%)
 rename target/i386/{ => kvm}/hyperv.h (100%)
 create mode 100644 target/i386/kvm/kvm-cpu.h
 rename target/i386/{ => kvm}/kvm-stub.c (100%)
 rename target/i386/{ => kvm}/kvm.c (99%)
 rename target/i386/{ => kvm}/kvm_i386.h (100%)
 create mode 100644 target/i386/kvm/meson.build
 create mode 100644 target/i386/kvm/trace-events
 create mode 100644 target/i386/kvm/trace.h
 rename target/i386/{ => tcg}/bpt_helper.c (99%)
 rename target/i386/{ => tcg}/cc_helper.c (99%)
 create mode 100644 target/i386/tcg/cpu.c
 rename target/i386/{ => tcg}/excp_helper.c (99%)
 rename target/i386/{ => tcg}/fpu_helper.c (99%)
 rename target/i386/{ => tcg}/int_helper.c (99%)
 rename target/i386/{ => tcg}/mem_helper.c (99%)
 create mode 100644 target/i386/tcg/meson.build
 rename target/i386/{ => tcg}/misc_helper.c (99%)
 rename target/i386/{ => tcg}/mpx_helper.c (99%)
 rename target/i386/{ => tcg}/seg_helper.c (99%)
 rename target/i386/{ => tcg}/smm_helper.c (99%)
 rename target/i386/{ => tcg}/svm_helper.c (99%)
 rename target/i386/{ => tcg}/tcg-stub.c (100%)
 rename target/i386/{ => tcg}/translate.c (99%)
 create mode 100644 target/i386/whpx/meson.build
 rename target/i386/{ => whpx}/whp-dispatch.h (100%)
 rename target/i386/{ => whpx}/whpx-all.c (99%)
 rename target/i386/{ => whpx}/whpx-cpus.c (73%)
 rename target/i386/{ => whpx}/whpx-cpus.h (96%)

-- 
2.26.2


