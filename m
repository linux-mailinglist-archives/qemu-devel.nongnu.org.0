Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728743820B8
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 22:01:43 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liMxK-0005a7-9C
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 16:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMul-0001sZ-3o; Sun, 16 May 2021 15:59:03 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45292 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMuh-0008Bj-PS; Sun, 16 May 2021 15:59:02 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id C77C360803FB;
 Sun, 16 May 2021 21:58:55 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 00/19] hvf: Implement Apple Silicon Support
Date: Sun, 16 May 2021 21:58:36 +0200
Message-Id: <20210516195855.28869-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that Apple Silicon is widely available, people are obviously excited
to try and run virtualized workloads on them, such as Linux and Windows.

This patch set implements a fully functional version to get the ball
going on that. With this applied, I can successfully run both Linux and
Windows as guests. I am not aware of any limitations specific to
Hypervisor.framework apart from:

  - Live migration / savevm
  - gdbstub debugging (SP register)


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

Alexander Graf (18):
  hvf: Move assert_hvf_ok() into common directory
  hvf: Move vcpu thread functions into common directory
  hvf: Move cpu functions into common directory
  hvf: Move hvf internal definitions into common header
  hvf: Make hvf_set_phys_mem() static
  hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
  hvf: Split out common code on vcpu init and destroy
  hvf: Use cpu_synchronize_state()
  hvf: Make synchronize functions static
  hvf: Remove hvf-accel-ops.h
  hvf: Introduce hvf vcpu struct
  hvf: Simplify post reset/init/loadvm hooks
  hvf: Add Apple Silicon support
  hvf: arm: Implement -cpu host
  hvf: arm: Implement PSCI handling
  arm: Add Hypervisor.framework build target
  arm: Enable Windows 10 trusted SMCCC boot call
  hvf: arm: Handle Windows 10 SMC call

Peter Collingbourne (1):
  arm/hvf: Add a WFI handler

 MAINTAINERS                     |  13 +
 accel/hvf/hvf-accel-ops.c       | 484 ++++++++++++++++
 accel/hvf/hvf-all.c             |  47 ++
 accel/hvf/meson.build           |   7 +
 accel/meson.build               |   1 +
 include/hw/core/cpu.h           |   3 +-
 include/sysemu/hvf_int.h        |  66 +++
 meson.build                     |   8 +
 target/arm/cpu.c                |  13 +-
 target/arm/cpu.h                |   2 +
 target/arm/hvf/hvf.c            | 959 ++++++++++++++++++++++++++++++++
 target/arm/hvf/meson.build      |   3 +
 target/arm/hvf/trace-events     |  11 +
 target/arm/hvf_arm.h            |  19 +
 target/arm/kvm-consts.h         |   2 +
 target/arm/kvm_arm.h            |   2 -
 target/arm/meson.build          |   2 +
 target/arm/psci.c               |   2 +
 target/i386/hvf/hvf-accel-ops.c | 146 -----
 target/i386/hvf/hvf-accel-ops.h |  23 -
 target/i386/hvf/hvf-i386.h      |  33 +-
 target/i386/hvf/hvf.c           | 464 ++-------------
 target/i386/hvf/meson.build     |   1 -
 target/i386/hvf/vmx.h           |  24 +-
 target/i386/hvf/x86.c           |  28 +-
 target/i386/hvf/x86_descr.c     |  26 +-
 target/i386/hvf/x86_emu.c       |  62 +--
 target/i386/hvf/x86_mmu.c       |   4 +-
 target/i386/hvf/x86_task.c      |  12 +-
 target/i386/hvf/x86hvf.c        | 222 ++++----
 target/i386/hvf/x86hvf.h        |   2 -
 31 files changed, 1884 insertions(+), 807 deletions(-)
 create mode 100644 accel/hvf/hvf-accel-ops.c
 create mode 100644 accel/hvf/hvf-all.c
 create mode 100644 accel/hvf/meson.build
 create mode 100644 include/sysemu/hvf_int.h
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 create mode 100644 target/arm/hvf/trace-events
 create mode 100644 target/arm/hvf_arm.h
 delete mode 100644 target/i386/hvf/hvf-accel-ops.c
 delete mode 100644 target/i386/hvf/hvf-accel-ops.h

-- 
2.30.1 (Apple Git-130)


