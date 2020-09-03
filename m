Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4625BFBD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 12:57:42 +0200 (CEST)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDmw1-0004TY-Ly
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 06:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDmuk-0002kM-HB
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:56:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:48676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDmuh-0004Vm-Qv
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:56:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 387C1ABAD;
 Thu,  3 Sep 2020 10:56:18 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v7 00/16] QEMU cpus.c refactoring part2
Date: Thu,  3 Sep 2020 12:55:58 +0200
Message-Id: <20200903105614.17772-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Motivation and higher level steps:

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html

Current state is all reviewed, I think this is a good base to
include at this point.
I had to fix one build issue in patch 1 that went undetected previously due to
a meson thing (parallel build).

Further work for future patches include:

* additional improvements to naming consistency in QEMU files. (Claudio, Alex, Roman)

* tcg vcpu start refactoring, providing then multiple structs for mttg, icount, normal.
  (Claudio, Alex)

* possible removal of NULL check for virtual clock if the qcow2 early call is solved.
  (Claudio, Paolo, Berto)

PATCH v6 -> PATCH v7:

* in patch "cpu-timers, icount: new modules":
  - remove redundant double initialization of spice
  - remove lingering calls to icount_get

PATCH v5 -> PATCH v6:

* moved to mason build system

* patch (new): cpus: remove checks for non-NULL cpus_accel (Richard)

  This has however a big caveat: in some cases the virtual clock is
  queried before an accelerator is set or ticks are enabled; this is
  currently special cased (keeping the NULL check in cpus_get_virtual_clock),
  but maybe this should not happen at all? (Paolo, Berto)

* in patch "cpu-timers, icount: new modules"
  do not change (yet) icount_enabled() to a function.
  Mimic instead what is done with tcg_enabled(). (Richard)

* split the changes into two separate patches, with name-only changes
  extracted out into a separate patch (Richard).
  Removed existing Reviewed-by because of these changes (Alex)-
  Alex are you ok with them?

* in patch "cpus: prepare new CpusAccel cpu accelerator interface"
  remove some unneeded stubs from stubs/cpu-synchronize-state.c
  Use const for the CpusAccel interface. (Richard)

* in patch "cpus: extract out TCG-specific code to accel/tcg"
  use const for the CpusAccel interface. (Richard)

* in patch "cpus: extract out qtest-specific code to accel/qtest"
  use const for the CpusAccel interface;
  use g_assert_not_reached (Richard)

* in patch "cpus: extract out kvm-specific code to accel/kvm"
  use const for the CpusAccel interface. (Richard)

* in patch "cpus: extract out hax-specific code to target/i386/"
  use const for the CpusAccel interface. (Richard)

* in patch "cpus: extract out whpx-specific code to target/i386/"
  use const for the CpusAccel interface. (Richard)

* in patch "cpus: extract out hvf-specific code to target/i386/hvf/"
  use const for the CpusAccel interface. (Richard)


RFC v4 -> PATCH v5:

* in patch 2, move comment about cpus_get_elapsed_ticks from patch 3
  (Philippe)

* in patch 11-14, do not create separate xxx-int.h files,
  instead use the xxx-cpus.h files (Philippe)

RFC v3 -> v4:

* added patch 9: cleanup unneeded includes

* added patch 10: add handle_interrupt to the interface (Roman)

* added patch 11-14: remove accelerator specific internal functions
  from global includes (Roman)

* in patch 2, removed leftover "if hvf_enabled" hunk

* in patch 2, convert if (!tcg_enabled) with more punctual if (hax_enabled)
  when eating dummy APC

----

RFC v2 -> v3:

* provided defaults for all methods.
  Only create_vcpu_thread is now a mandatory field. (Paolo)

* separated new CpusAccel patch from its first user, new patch nr. 2:
  "cpus: prepare new CpusAccel cpu accelerator interface"

* new CpusAccel methods: get_virtual_clock and get_elapsed_ticks.
  (Paolo)

  In this series, get_virtual_clock has a separate implementation
  between TCG/icount and qtest,
  while get_elapsed_ticks only returns a virtual counter for icount.

  Looking for more comments in this area.

----

RFC v1 -> v2:

* split the cpus.c accelerator refactoring into 6 patches.

* other minor changes to be able to proceed step by step.

----

* Rebased on commit 255ae6e2158c743717bed76c9a2365ee4bcd326e,
"replay: notify the main loop when there are no instructions"

[SPLIT into part1 and part2]

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


Claudio Fontana (16):
  cpu-timers, icount: new modules
  icount: rename functions to be consistent with the module name
  cpus: prepare new CpusAccel cpu accelerator interface
  cpus: extract out TCG-specific code to accel/tcg
  cpus: extract out qtest-specific code to accel/qtest
  cpus: extract out kvm-specific code to accel/kvm
  cpus: extract out hax-specific code to target/i386/
  cpus: extract out whpx-specific code to target/i386/
  cpus: extract out hvf-specific code to target/i386/hvf/
  cpus: cleanup now unneeded includes
  cpus: remove checks for non-NULL cpus_accel
  cpus: add handle_interrupt to the CpusAccel interface
  hvf: remove hvf specific functions from global includes
  whpx: remove whpx specific functions from global includes
  hax: remove hax specific functions from global includes
  kvm: remove kvm specific functions from global includes

 MAINTAINERS                    |    5 +-
 accel/kvm/kvm-all.c            |   14 +-
 accel/kvm/kvm-cpus.c           |   88 ++
 accel/kvm/kvm-cpus.h           |   24 +
 accel/kvm/meson.build          |    5 +-
 accel/meson.build              |    2 +-
 accel/qtest/meson.build        |    7 +
 accel/qtest/qtest-cpus.c       |   91 ++
 accel/qtest/qtest-cpus.h       |   17 +
 accel/{ => qtest}/qtest.c      |   13 +-
 accel/stubs/hax-stub.c         |   10 -
 accel/stubs/hvf-stub.c         |   30 -
 accel/stubs/kvm-stub.c         |   23 -
 accel/stubs/meson.build        |    2 -
 accel/stubs/whpx-stub.c        |   47 -
 accel/tcg/cpu-exec.c           |   43 +-
 accel/tcg/meson.build          |    2 +-
 accel/tcg/tcg-all.c            |   43 +-
 accel/tcg/tcg-cpus.c           |  569 +++++++++++
 accel/tcg/tcg-cpus.h           |   17 +
 accel/tcg/translate-all.c      |    3 +-
 dma-helpers.c                  |    4 +-
 docs/replay.txt                |    6 +-
 exec.c                         |    4 -
 hw/core/cpu.c                  |   14 +-
 hw/core/ptimer.c               |    8 +-
 hw/i386/x86.c                  |    3 +-
 include/exec/cpu-all.h         |    4 +
 include/exec/exec-all.h        |    4 +-
 include/hw/core/cpu.h          |   14 -
 include/qemu/timer.h           |   24 +-
 include/sysemu/cpu-timers.h    |   90 ++
 include/sysemu/cpus.h          |   50 +-
 include/sysemu/hax.h           |   17 -
 include/sysemu/hvf.h           |    8 -
 include/sysemu/hw_accel.h      |   69 +-
 include/sysemu/kvm.h           |    7 -
 include/sysemu/qtest.h         |    2 +
 include/sysemu/replay.h        |    4 +-
 include/sysemu/whpx.h          |   19 -
 replay/replay.c                |    6 +-
 softmmu/cpu-timers.c           |  279 ++++++
 softmmu/cpus.c                 | 1697 +++-----------------------------
 softmmu/icount.c               |  492 +++++++++
 softmmu/meson.build            |   10 +-
 softmmu/qtest.c                |   34 +-
 softmmu/timers-state.h         |   69 ++
 softmmu/vl.c                   |    8 +-
 stubs/clock-warp.c             |    7 -
 stubs/cpu-get-clock.c          |    3 +-
 stubs/cpu-get-icount.c         |   21 -
 stubs/cpu-synchronize-state.c  |    9 +
 stubs/cpus-get-virtual-clock.c |    8 +
 stubs/icount.c                 |   45 +
 stubs/meson.build              |    6 +-
 stubs/qemu-timer-notify-cb.c   |    8 +
 stubs/qtest.c                  |    5 +
 target/alpha/translate.c       |    3 +-
 target/arm/helper.c            |    7 +-
 target/i386/hax-all.c          |   17 +-
 target/i386/hax-cpus.c         |   84 ++
 target/i386/hax-cpus.h         |   33 +
 target/i386/hax-i386.h         |    2 +
 target/i386/hax-mem.c          |    2 +-
 target/i386/hax-posix.c        |   13 +-
 target/i386/hax-windows.c      |   22 +-
 target/i386/hax-windows.h      |    2 +
 target/i386/hvf/hvf-cpus.c     |  131 +++
 target/i386/hvf/hvf-cpus.h     |   25 +
 target/i386/hvf/hvf.c          |   12 +-
 target/i386/hvf/meson.build    |    1 +
 target/i386/hvf/x86hvf.c       |    2 +
 target/i386/hvf/x86hvf.h       |    1 -
 target/i386/meson.build        |   14 +-
 target/i386/whpx-all.c         |   13 +-
 target/i386/whpx-cpus.c        |   96 ++
 target/i386/whpx-cpus.h        |   34 +
 target/riscv/csr.c             |    8 +-
 tests/ptimer-test-stubs.c      |    5 +-
 tests/test-timed-average.c     |    2 +-
 util/main-loop.c               |   12 +-
 util/qemu-timer.c              |   14 +-
 82 files changed, 2637 insertions(+), 2031 deletions(-)
 create mode 100644 accel/kvm/kvm-cpus.c
 create mode 100644 accel/kvm/kvm-cpus.h
 create mode 100644 accel/qtest/meson.build
 create mode 100644 accel/qtest/qtest-cpus.c
 create mode 100644 accel/qtest/qtest-cpus.h
 rename accel/{ => qtest}/qtest.c (81%)
 delete mode 100644 accel/stubs/hvf-stub.c
 delete mode 100644 accel/stubs/whpx-stub.c
 create mode 100644 accel/tcg/tcg-cpus.c
 create mode 100644 accel/tcg/tcg-cpus.h
 create mode 100644 include/sysemu/cpu-timers.h
 create mode 100644 softmmu/cpu-timers.c
 create mode 100644 softmmu/icount.c
 create mode 100644 softmmu/timers-state.h
 delete mode 100644 stubs/clock-warp.c
 delete mode 100644 stubs/cpu-get-icount.c
 create mode 100644 stubs/cpu-synchronize-state.c
 create mode 100644 stubs/cpus-get-virtual-clock.c
 create mode 100644 stubs/icount.c
 create mode 100644 stubs/qemu-timer-notify-cb.c
 create mode 100644 target/i386/hax-cpus.c
 create mode 100644 target/i386/hax-cpus.h
 create mode 100644 target/i386/hvf/hvf-cpus.c
 create mode 100644 target/i386/hvf/hvf-cpus.h
 create mode 100644 target/i386/whpx-cpus.c
 create mode 100644 target/i386/whpx-cpus.h

-- 
2.26.2


