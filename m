Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AC40CCD0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:52:00 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQa0l-0003NK-CJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQZN3-0006Ro-DA; Wed, 15 Sep 2021 14:10:57 -0400
Received: from mail.csgraf.de ([85.25.223.15]:50648 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQZN1-0003My-2I; Wed, 15 Sep 2021 14:10:56 -0400
Received: from localhost.localdomain
 (dynamic-095-117-089-091.95.117.pool.telefonica.de [95.117.89.91])
 by csgraf.de (Postfix) with ESMTPSA id 76C0860801E7;
 Wed, 15 Sep 2021 20:10:50 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v11 00/10] hvf: Implement Apple Silicon Support
Date: Wed, 15 Sep 2021 20:10:39 +0200
Message-Id: <20210915181049.27597-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that Apple Silicon is widely available, people are obviously excited
to try and run virtualized workloads on them, such as Linux and Windows.

This patch set implements a fully functional version to get the ball
going on that. With this applied, I can successfully run both Linux and
Windows as guests. I am not aware of any limitations specific to
Hypervisor.framework apart from:

  - gdbstub debugging (breakpoints)
  - missing GICv3 support
  - Windows will not work due to UDEF SMC implementation

To use hvf support, please make sure to run -M virt,highmem=off to fit
in M1's physical address space limits and use -cpu host.


Enjoy!

Alex

v1 -> v2:

  - New patch: hvf: Actually set SIG_IPI mask
  - New patch: hvf: Introduce hvf vcpu struct
  - New patch: hvf: arm: Mark CPU as dirty on reset
  - Removed patch: hw/arm/virt: Disable highmem when on hypervisor.framework
  - Removed patch: arm: Synchronize CPU on PSCI on
  - Fix build on 32bit arm
  - Merge vcpu kick function patch into ARM enablement
  - Implement WFI handling (allows vCPUs to sleep)
  - Synchronize system registers (fixes OVMF crashes and reboot)
  - Don't always call cpu_synchronize_state()
  - Use more fine grained iothread locking
  - Populate aa64mmfr0 from hardware
  - Make safe to ctrl-C entitlement application

v2 -> v3:

  - Removed patch: hvf: Actually set SIG_IPI mask
  - New patch: hvf: arm: Add support for GICv3
  - New patch: hvf: arm: Implement -cpu host
  - Advance PC on SMC
  - Use cp list interface for sysreg syncs
  - Do not set current_cpu
  - Fix sysreg isread mask
  - Move sysreg handling to functions
  - Remove WFI logic again
  - Revert to global iothread locking

v3 -> v4:

  - Removed patch: hvf: arm: Mark CPU as dirty on reset
  - New patch: hvf: Simplify post reset/init/loadvm hooks
  - Remove i386-softmmu target (meson.build for hvf target)
  - Combine both if statements (PSCI)
  - Use hv.h instead of Hypervisor.h for 10.15 compat
  - Remove manual inclusion of Hypervisor.h in common .c files
  - No longer include Hypervisor.h in arm hvf .c files
  - Remove unused exe_full variable
  - Reuse exe_name variable

v4 -> v5:

  - Use g_free() on destroy

v5 -> v6:

  - Switch SYSREG() macro order to the same as asm intrinsics

v6 -> v7:

  - Already merged: hvf: Add hypervisor entitlement to output binaries
  - Already merged: hvf: x86: Remove unused definitions
  - Patch split: hvf: Move common code out
    -> hvf: Move assert_hvf_ok() into common directory
    -> hvf: Move vcpu thread functions into common directory
    -> hvf: Move cpu functions into common directory
    -> hvf: Move hvf internal definitions into common header
    -> hvf: Make hvf_set_phys_mem() static
    -> hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
    -> hvf: Split out common code on vcpu init and destroy
    -> hvf: Use cpu_synchronize_state()
    -> hvf: Make synchronize functions static
    -> hvf: Remove hvf-accel-ops.h
  - New patch: hvf: arm: Implement PSCI handling
  - New patch: arm: Enable Windows 10 trusted SMCCC boot call
  - New patch: hvf: arm: Handle Windows 10 SMC call
  - Removed patch: "arm: Set PSCI to 0.2 for HVF" (included above)
  - Removed patch: "hvf: arm: Add support for GICv3" (deferred to later)
  - Remove osdep.h include from hvf_int.h
  - Synchronize SIMD registers as well
  - Prepend 0x for hex values
  - Convert DPRINTF to trace points
  - Use main event loop (fixes gdbstub issues)
  - Remove PSCI support, inject UDEF on HVC/SMC
  - Change vtimer logic to look at ctl.istatus for vtimer mask sync
  - Add kick callback again (fixes remote CPU notification)
  - Move function define to own header
  - Do not propagate SVE features for HVF
  - Remove stray whitespace change
  - Verify that EL0 and EL1 do not allow AArch32 mode
  - Only probe host CPU features once
  - Move WFI into function
  - Improve comment wording
  - Simplify HVF matching logic in meson build file

v7 -> v8:

  - checkpatch fixes
  - Do not advance for HVC, PC is already updated by hvf
    (fixes Linux boot)

v8 -> v9:

  - [Merged] hvf: Move assert_hvf_ok() into common directory
  - [Merged] hvf: Move vcpu thread functions into common directory
  - [Merged] hvf: Move cpu functions into common directory
  - [Merged] hvf: Move hvf internal definitions into common header
  - [Merged] hvf: Make hvf_set_phys_mem() static
  - [Merged] hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
  - [Merged] hvf: Split out common code on vcpu init and destroy
  - [Merged] hvf: Use cpu_synchronize_state()
  - [Merged] hvf: Make synchronize functions static
  - [Merged] hvf: Remove hvf-accel-ops.h
  - [Merged] hvf: Introduce hvf vcpu struct
  - [Merged] hvf: Simplify post reset/init/loadvm hooks
  - [Dropped] arm: Enable Windows 10 trusted SMCCC boot call
  - [Dropped] hvf: arm: Handle Windows 10 SMC call
  - [New] arm: Move PMC register definitions to cpu.h
  - [New] hvf: Add execute to dirty log permission bitmap
  - [New] hvf: Introduce hvf_arch_init() callback
  - [New] hvf: arm: Implement PSCI handling
  - [New] hvf: arm: Add rudimentary PMC support
  - [New] arm: tcg: Adhere to SMCCC 1.3 section 5.2
  - [New] hvf: arm: Adhere to SMCCC 1.3 section 5.2
  - Make kick function non-weak
  - Use arm_cpu_do_interrupt()
  - Remove CNTPCT_EL0 write case
  - Inject UDEF on invalid sysreg access
  - Add support for OS locking sysregs
  - Remove PMCCNTR_EL0 handling
  - Print PC on unhandled sysreg trace
  - Sync SP (x31) based on SP_EL0/SP_EL1
  - Fix SPSR_EL1 mapping
  - Only sync known sysregs, assert when syncing fails
  - Improve error message on unhandled ec
  - Move vtimer sync to post-exit (fixes disable corner case from
    kvm-unit-tests)
  - Add vtimer offset, migration and pause logic
  - Flush registers only after EXCP checkers (fixes PSCI on race)
  - Remove Windows specifics and just comply with SMCCC spec
  - Zero-initialize host_isar
  - Use M1 SCTLR reset value
  - Add support for cntv offsets
  - Improve code readability
  - Use new hvf_raise_exception() prototype
  - Make cpu_off function void
  - Add comment about return value, use -1 for "not found"
  - Remove cpu_synchronize_state() when halted

v9 -> v10:

  - [Dropped] hvf: arm: Adhere to SMCCC 1.3 section 5.2
  - Only handle PSCI calls for the current conduit
  - Return true/false
  - Return -1 in x0 on unknown SMC/HVC calls
  - Move to target/arm/internals.h
  - Fail -cpu host class creation gracefully
  - Adjust error message on -cpu host realize failure
  - Extend SCTLR comment that hvf returns 0 as default value
  - Return true/false
  - Report errors lazily
  - Fix comment

v10 -> v11:

  - Treat SMC as UDEF. A follow-up patch set will try to change behavior
    consistently in TCG as well as HVF.

Alexander Graf (9):
  arm: Move PMC register definitions to cpu.h
  hvf: Add execute to dirty log permission bitmap
  hvf: Introduce hvf_arch_init() callback
  hvf: Add Apple Silicon support
  hvf: arm: Implement -cpu host
  hvf: arm: Implement PSCI handling
  arm: Add Hypervisor.framework build target
  hvf: arm: Add rudimentary PMC support
  arm: tcg: Adhere to SMCCC 1.3 section 5.2

Peter Collingbourne (1):
  arm/hvf: Add a WFI handler

 MAINTAINERS                 |    5 +
 accel/hvf/hvf-accel-ops.c   |   21 +-
 include/sysemu/hvf_int.h    |   12 +-
 meson.build                 |    8 +
 target/arm/cpu.c            |   17 +-
 target/arm/cpu.h            |    2 +
 target/arm/helper.c         |   44 --
 target/arm/hvf/hvf.c        | 1268 +++++++++++++++++++++++++++++++++++
 target/arm/hvf/meson.build  |    3 +
 target/arm/hvf/trace-events |   11 +
 target/arm/hvf_arm.h        |   19 +
 target/arm/internals.h      |   44 ++
 target/arm/kvm_arm.h        |    2 -
 target/arm/meson.build      |    2 +
 target/arm/psci.c           |   35 +-
 target/i386/hvf/hvf.c       |   10 +
 16 files changed, 1415 insertions(+), 88 deletions(-)
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 create mode 100644 target/arm/hvf/trace-events
 create mode 100644 target/arm/hvf_arm.h

-- 
2.30.1 (Apple Git-130)


