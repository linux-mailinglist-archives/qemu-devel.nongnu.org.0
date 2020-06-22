Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CC1203994
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 16:32:49 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnNVA-0005lg-VX
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 10:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jnNOt-0005Bu-3j
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 10:26:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:47422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jnNOq-0004pC-IE
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 10:26:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DB39C1C7;
 Mon, 22 Jun 2020 14:26:13 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC v7 0/4] QEMU cpus.c refactoring
Date: Mon, 22 Jun 2020 12:11:06 +0200
Message-Id: <20200622101110.3263-1-cfontana@suse.de>
X-Mailer: git-send-email 2.16.4
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 06:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Motivation and higher level steps:

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html

MAIN OPEN POINTS:

* confirmation on hvf state (Roman).

* missing reviewed-by for patch 4 in the series

OTHER DISCUSSIONS:

* naming of "cpus.c" and functions, more cpus_ prefix use? (Roman)

* should we accept the addional clunkyness and overhead for each call of
  the kick and CPU sync state for all archs/accels of putting CpusAccel
  inside AccelClass? I would tend towards no here, but welcome further
  opinions or data if any. (Roman)

* should we reorder patches or moves inside patches to avoid code going
  from cpus.c to softmmu/cpus.c and then again to softmmu/somethingelse.c ?
  (Philippe)

* some questions about headers in include/softmmu (Philippe)

----

v6 -> v7:

* rebased changes on top of Pavel Dovgalyuk changes to dma-helpers.c
  "icount: make dma reads deterministic"

----

v5 -> v6:

* rebased changes on top of Emilio G. Cota changes to cpus.c
  "cpu: convert queued work to a QSIMPLEQ"

* keep a pointer in cpus.c instead of a copy of CpusAccel
  (Alex)

----


v4 -> v5: rebase on latest master

* rebased changes on top of roman series to remove one of the extra states for hvf.
  (Is the result now functional for HVF?)

* rebased changes on top of icount changes and fixes to icount_configure and
  the new shift vmstate. (Markus)

v3 -> v4:

* overall: added copyright headers to all files that were missing them
  (used copyright and license of the module the stuff was extracted from).
  For the new interface files, added SUSE LLC.

* 1/4 (move softmmu only files from root):

  MAINTAINERS: moved softmmu/cpus.c to its final location (from patch 2)

* 2/4 (cpu-throttle):

  MAINTAINERS (to patch 1),
  copyright Fabrice Bellard and license from cpus.c

* 3/4 (cpu-timers, icount):

  - MAINTAINERS: add cpu-timers.c and icount.c to Paolo

  - break very long lines (patchew)

  - add copyright SUSE LLC, GPLv2 to cpu-timers.h

  - add copyright Fabrice Bellard and license from cpus.c to timers-state.h
    as it is lifted from cpus.c

  - vl.c: in configure_accelerators bail out if icount_enabled()
    and !tcg_enabled() as qtest does not enable icount anymore.

* 4/4 (accel stuff to accel):

  - add copyright SUSE LLC to files that mostly only consist of the
    new interface. Add whatever copyright was in the accelerator code
    if instead they mostly consist of accelerator code.

  - change a comment to mention the result of the AccelClass experiment

  - moved qtest accelerator into accel/qtest/ , make it like the others.

  - rename xxx-cpus-interface to xxx-cpus (remove "interface" from names)

  - rename accel_int to cpus_accel

  - rename CpusAccel functions from cpu_synchronize_* to synchronize_*


--------

v2 -> v3:

* turned into a 4 patch series, adding a first patch moving
  softmmu code currently in top_srcdir to softmmu/

* cpu-throttle: moved to softmmu/

* cpu-timers, icount:

  - moved to softmmu/

  - fixed assumption of qtest_enabled() => icount_enabled()
  causing the failure of check-qtest-arm goal, in test-arm-mptimer.c

  Fix is in hw/core/ptimer.c,

  where the artificial timeout rate limit should not be applied
  under qtest_enabled(), in a similar way to how it is not applied
  for icount_enabled().

* CpuAccelInterface: no change.


--------


v1 -> v2:

* 1/3 (cpu-throttle): provide a description in the commit message

* 2/3 (cpu-timers, icount): in this v2 separate icount from cpu-timers,
  as icount is actually TCG-specific. Only build it under CONFIG_TCG.

  To do this, qtest had to be detached from icount. To this end, a
  trivial global counter for qtest has been introduced.

* 3/3 (CpuAccelInterface): provided a description.

This is point 8) in that plan. The idea is to extract the unrelated parts
in cpus, and register interfaces from each single accelerator to the main
cpus module (cpus.c).

While doing this RFC, I noticed some assumptions about Windows being
either TCG or HAX (not considering WHPX) that might need to be revisited.
I added a comment there.

The thing builds successfully based on Linux cross-compilations for
windows/hax, windows/whpx, and I got a good build on Darwin/hvf.

Tests run successully for tcg and kvm configurations, but did not test on
windows or darwin.

Welcome your feedback and help on this,

Claudio

Claudio Fontana (4):
  softmmu: move softmmu only files from root
  cpu-throttle: new module, extracted from cpus.c
  cpu-timers, icount: new modules
  cpus: extract out accel-specific code to each accel

 MAINTAINERS                                  |   14 +-
 Makefile.target                              |    7 +-
 accel/kvm/Makefile.objs                      |    2 +
 accel/kvm/kvm-all.c                          |   15 +-
 accel/kvm/kvm-cpus-interface.c               |   94 ++
 accel/kvm/kvm-cpus-interface.h               |    8 +
 accel/qtest.c                                |   88 +-
 accel/stubs/kvm-stub.c                       |    3 +-
 accel/tcg/Makefile.objs                      |    1 +
 accel/tcg/cpu-exec.c                         |   43 +-
 accel/tcg/tcg-all.c                          |   19 +-
 accel/tcg/tcg-cpus-interface.c               |  523 ++++++
 accel/tcg/tcg-cpus-interface.h               |    8 +
 accel/tcg/translate-all.c                    |    3 +-
 cpus.c                                       | 2290 --------------------------
 docs/replay.txt                              |    6 +-
 exec.c                                       |    4 -
 hw/core/cpu.c                                |    1 +
 hw/core/ptimer.c                             |    6 +-
 hw/i386/x86.c                                |    1 +
 include/exec/cpu-all.h                       |    4 +
 include/exec/exec-all.h                      |    4 +-
 include/hw/core/cpu.h                        |   37 -
 include/qemu/main-loop.h                     |    5 +
 include/qemu/timer.h                         |   22 +-
 include/sysemu/cpu-throttle.h                |   50 +
 include/sysemu/cpu-timers.h                  |   72 +
 include/sysemu/cpus.h                        |   44 +-
 include/sysemu/hvf.h                         |    1 -
 include/sysemu/hw_accel.h                    |   57 +-
 include/sysemu/kvm.h                         |    2 +-
 include/sysemu/qtest.h                       |    2 +
 include/sysemu/replay.h                      |    4 +-
 migration/migration.c                        |    1 +
 migration/ram.c                              |    1 +
 replay/replay.c                              |    6 +-
 softmmu/Makefile.objs                        |   13 +
 arch_init.c => softmmu/arch_init.c           |    0
 balloon.c => softmmu/balloon.c               |    0
 softmmu/cpu-throttle.c                       |  122 ++
 softmmu/cpu-timers.c                         |  267 +++
 softmmu/cpus.c                               |  741 +++++++++
 softmmu/icount.c                             |  496 ++++++
 ioport.c => softmmu/ioport.c                 |    0
 memory.c => softmmu/memory.c                 |    0
 memory_mapping.c => softmmu/memory_mapping.c |    0
 qtest.c => softmmu/qtest.c                   |   34 +-
 softmmu/timers-state.h                       |   45 +
 softmmu/vl.c                                 |    8 +-
 stubs/Makefile.objs                          |    4 +-
 stubs/clock-warp.c                           |    4 +-
 stubs/cpu-get-clock.c                        |    3 +-
 stubs/cpu-get-icount.c                       |   21 -
 stubs/cpu-synchronize-state.c                |   15 +
 stubs/icount.c                               |   22 +
 stubs/qemu-timer-notify-cb.c                 |    8 +
 stubs/qtest.c                                |    5 +
 target/alpha/translate.c                     |    3 +-
 target/arm/helper.c                          |    7 +-
 target/i386/Makefile.objs                    |    7 +-
 target/i386/hax-all.c                        |    6 +-
 target/i386/hax-cpus-interface.c             |   85 +
 target/i386/hax-cpus-interface.h             |    8 +
 target/i386/hax-i386.h                       |    2 +
 target/i386/hax-posix.c                      |   12 +
 target/i386/hax-windows.c                    |   20 +
 target/i386/hvf/Makefile.objs                |    2 +-
 target/i386/hvf/hvf-cpus-interface.c         |   92 ++
 target/i386/hvf/hvf-cpus-interface.h         |    8 +
 target/i386/hvf/hvf.c                        |    5 +-
 target/i386/whpx-all.c                       |    3 +
 target/i386/whpx-cpus-interface.c            |   96 ++
 target/i386/whpx-cpus-interface.h            |    8 +
 target/riscv/csr.c                           |    8 +-
 tests/ptimer-test-stubs.c                    |    7 +-
 tests/test-timed-average.c                   |    2 +-
 util/main-loop.c                             |    4 +-
 util/qemu-timer.c                            |   12 +-
 78 files changed, 3136 insertions(+), 2517 deletions(-)
 create mode 100644 accel/kvm/kvm-cpus-interface.c
 create mode 100644 accel/kvm/kvm-cpus-interface.h
 create mode 100644 accel/tcg/tcg-cpus-interface.c
 create mode 100644 accel/tcg/tcg-cpus-interface.h
 delete mode 100644 cpus.c
 create mode 100644 include/sysemu/cpu-throttle.h
 create mode 100644 include/sysemu/cpu-timers.h
 rename arch_init.c => softmmu/arch_init.c (100%)
 rename balloon.c => softmmu/balloon.c (100%)
 create mode 100644 softmmu/cpu-throttle.c
 create mode 100644 softmmu/cpu-timers.c
 create mode 100644 softmmu/cpus.c
 create mode 100644 softmmu/icount.c
 rename ioport.c => softmmu/ioport.c (100%)
 rename memory.c => softmmu/memory.c (100%)
 rename memory_mapping.c => softmmu/memory_mapping.c (100%)
 rename qtest.c => softmmu/qtest.c (95%)
 create mode 100644 softmmu/timers-state.h
 delete mode 100644 stubs/cpu-get-icount.c
 create mode 100644 stubs/cpu-synchronize-state.c
 create mode 100644 stubs/icount.c
 create mode 100644 stubs/qemu-timer-notify-cb.c
 create mode 100644 target/i386/hax-cpus-interface.c
 create mode 100644 target/i386/hax-cpus-interface.h
 create mode 100644 target/i386/hvf/hvf-cpus-interface.c
 create mode 100644 target/i386/hvf/hvf-cpus-interface.h
 create mode 100644 target/i386/whpx-cpus-interface.c
 create mode 100644 target/i386/whpx-cpus-interface.h

-- 
2.16.4


