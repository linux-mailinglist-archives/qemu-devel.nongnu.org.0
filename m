Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2CF408247
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 01:15:27 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPYh4-0007yp-Ir
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 19:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPYZz-0002GR-Dx; Sun, 12 Sep 2021 19:08:07 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43526 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPYZu-0003FJ-Fr; Sun, 12 Sep 2021 19:08:07 -0400
Received: from localhost.localdomain
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id D11DF60806AF;
 Mon, 13 Sep 2021 01:08:00 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v9 04/11] hvf: Add Apple Silicon support
Date: Mon, 13 Sep 2021 01:07:50 +0200
Message-Id: <20210912230757.41096-5-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210912230757.41096-1-agraf@csgraf.de>
References: <20210912230757.41096-1-agraf@csgraf.de>
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

With Apple Silicon available to the masses, it's a good time to add support
for driving its virtualization extensions from QEMU.

This patch adds all necessary architecture specific code to get basic VMs
working. It's still pretty raw, but definitely functional.

Known limitations:

  - Vtimer acknowledgement is hacky
  - Should implement more sysregs and fault on invalid ones then
  - WFI handling is missing, need to marry it with vtimer

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>

---

v1 -> v2:

  - Merge vcpu kick function patch
  - Implement WFI handling (allows vCPUs to sleep)
  - Synchronize system registers (fixes OVMF crashes and reboot)
  - Don't always call cpu_synchronize_state()
  - Use more fine grained iothread locking
  - Populate aa64mmfr0 from hardware

v2 -> v3:

  - Advance PC on SMC
  - Use cp list interface for sysreg syncs
  - Do not set current_cpu
  - Fix sysreg isread mask
  - Move sysreg handling to functions
  - Remove WFI logic again
  - Revert to global iothread locking
  - Use Hypervisor.h on arm, hv.h does not contain aarch64 definitions

v3 -> v4:

  - No longer include Hypervisor.h

v5 -> v6:

  - Swap sysreg definition order. This way we're in line with asm outputs.

v6 -> v7:

  - Remove osdep.h include from hvf_int.h
  - Synchronize SIMD registers as well
  - Prepend 0x for hex values
  - Convert DPRINTF to trace points
  - Use main event loop (fixes gdbstub issues)
  - Remove PSCI support, inject UDEF on HVC/SMC
  - Change vtimer logic to look at ctl.istatus for vtimer mask sync
  - Add kick callback again (fixes remote CPU notification)

v7 -> v8:

  - Fix checkpatch errors

v8 -> v9:

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
---
 MAINTAINERS                 |   5 +
 accel/hvf/hvf-accel-ops.c   |   9 +
 include/sysemu/hvf_int.h    |  10 +-
 meson.build                 |   1 +
 target/arm/hvf/hvf.c        | 793 ++++++++++++++++++++++++++++++++++++
 target/arm/hvf/trace-events |  10 +
 target/i386/hvf/hvf.c       |   5 +
 7 files changed, 832 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/trace-events

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c20634d63..d7915ec128 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -433,6 +433,11 @@ F: accel/accel-*.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
 
+Apple Silicon HVF CPUs
+M: Alexander Graf <agraf@csgraf.de>
+S: Maintained
+F: target/arm/hvf/
+
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <r.bolshakov@yadro.com>
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 65d431868f..4f75927a8e 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -60,6 +60,10 @@
 
 HVFState *hvf_state;
 
+#ifdef __aarch64__
+#define HV_VM_DEFAULT NULL
+#endif
+
 /* Memory slots */
 
 hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
@@ -376,7 +380,11 @@ static int hvf_init_vcpu(CPUState *cpu)
     pthread_sigmask(SIG_BLOCK, NULL, &set);
     sigdelset(&set, SIG_IPI);
 
+#ifdef __aarch64__
+    r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
+#else
     r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf->fd, HV_VCPU_DEFAULT);
+#endif
     cpu->vcpu_dirty = 1;
     assert_hvf_ok(r);
 
@@ -452,6 +460,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
+    ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 0466106d16..7c245c7b11 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -11,7 +11,11 @@
 #ifndef HVF_INT_H
 #define HVF_INT_H
 
+#ifdef __aarch64__
+#include <Hypervisor/Hypervisor.h>
+#else
 #include <Hypervisor/hv.h>
+#endif
 
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
@@ -40,11 +44,14 @@ struct HVFState {
     int num_slots;
 
     hvf_vcpu_caps *hvf_caps;
+    uint64_t vtimer_offset;
 };
 extern HVFState *hvf_state;
 
 struct hvf_vcpu_state {
-    int fd;
+    uint64_t fd;
+    void *exit;
+    bool vtimer_masked;
 };
 
 void assert_hvf_ok(hv_return_t ret);
@@ -55,5 +62,6 @@ int hvf_vcpu_exec(CPUState *);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
+void hvf_kick_vcpu_thread(CPUState *cpu);
 
 #endif
diff --git a/meson.build b/meson.build
index 9a64d16943..a3e9b95846 100644
--- a/meson.build
+++ b/meson.build
@@ -2169,6 +2169,7 @@ if have_system or have_user
     'accel/tcg',
     'hw/core',
     'target/arm',
+    'target/arm/hvf',
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
new file mode 100644
index 0000000000..f04324b598
--- /dev/null
+++ b/target/arm/hvf/hvf.c
@@ -0,0 +1,793 @@
+/*
+ * QEMU Hypervisor.framework support for Apple Silicon
+
+ * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/error-report.h"
+
+#include "sysemu/runstate.h"
+#include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
+#include "sysemu/hw_accel.h"
+
+#include <mach/mach_time.h>
+
+#include "exec/address-spaces.h"
+#include "hw/irq.h"
+#include "qemu/main-loop.h"
+#include "sysemu/cpus.h"
+#include "target/arm/cpu.h"
+#include "target/arm/internals.h"
+#include "trace/trace-target_arm_hvf.h"
+#include "migration/vmstate.h"
+
+#define HVF_SYSREG(crn, crm, op0, op1, op2) \
+        ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
+#define PL1_WRITE_MASK 0x4
+
+#define SYSREG(op0, op1, crn, crm, op2) \
+    ((op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (crm << 1))
+#define SYSREG_MASK           SYSREG(0x3, 0x7, 0xf, 0xf, 0x7)
+#define SYSREG_OSLAR_EL1      SYSREG(2, 0, 1, 0, 4)
+#define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
+#define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
+#define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+
+#define WFX_IS_WFE (1 << 0)
+
+#define TMR_CTL_ENABLE  (1 << 0)
+#define TMR_CTL_IMASK   (1 << 1)
+#define TMR_CTL_ISTATUS (1 << 2)
+
+typedef struct HVFVTimer {
+    /* Vtimer value during migration and paused state */
+    uint64_t vtimer_val;
+} HVFVTimer;
+
+static HVFVTimer vtimer;
+
+struct hvf_reg_match {
+    int reg;
+    uint64_t offset;
+};
+
+static const struct hvf_reg_match hvf_reg_match[] = {
+    { HV_REG_X0,   offsetof(CPUARMState, xregs[0]) },
+    { HV_REG_X1,   offsetof(CPUARMState, xregs[1]) },
+    { HV_REG_X2,   offsetof(CPUARMState, xregs[2]) },
+    { HV_REG_X3,   offsetof(CPUARMState, xregs[3]) },
+    { HV_REG_X4,   offsetof(CPUARMState, xregs[4]) },
+    { HV_REG_X5,   offsetof(CPUARMState, xregs[5]) },
+    { HV_REG_X6,   offsetof(CPUARMState, xregs[6]) },
+    { HV_REG_X7,   offsetof(CPUARMState, xregs[7]) },
+    { HV_REG_X8,   offsetof(CPUARMState, xregs[8]) },
+    { HV_REG_X9,   offsetof(CPUARMState, xregs[9]) },
+    { HV_REG_X10,  offsetof(CPUARMState, xregs[10]) },
+    { HV_REG_X11,  offsetof(CPUARMState, xregs[11]) },
+    { HV_REG_X12,  offsetof(CPUARMState, xregs[12]) },
+    { HV_REG_X13,  offsetof(CPUARMState, xregs[13]) },
+    { HV_REG_X14,  offsetof(CPUARMState, xregs[14]) },
+    { HV_REG_X15,  offsetof(CPUARMState, xregs[15]) },
+    { HV_REG_X16,  offsetof(CPUARMState, xregs[16]) },
+    { HV_REG_X17,  offsetof(CPUARMState, xregs[17]) },
+    { HV_REG_X18,  offsetof(CPUARMState, xregs[18]) },
+    { HV_REG_X19,  offsetof(CPUARMState, xregs[19]) },
+    { HV_REG_X20,  offsetof(CPUARMState, xregs[20]) },
+    { HV_REG_X21,  offsetof(CPUARMState, xregs[21]) },
+    { HV_REG_X22,  offsetof(CPUARMState, xregs[22]) },
+    { HV_REG_X23,  offsetof(CPUARMState, xregs[23]) },
+    { HV_REG_X24,  offsetof(CPUARMState, xregs[24]) },
+    { HV_REG_X25,  offsetof(CPUARMState, xregs[25]) },
+    { HV_REG_X26,  offsetof(CPUARMState, xregs[26]) },
+    { HV_REG_X27,  offsetof(CPUARMState, xregs[27]) },
+    { HV_REG_X28,  offsetof(CPUARMState, xregs[28]) },
+    { HV_REG_X29,  offsetof(CPUARMState, xregs[29]) },
+    { HV_REG_X30,  offsetof(CPUARMState, xregs[30]) },
+    { HV_REG_PC,   offsetof(CPUARMState, pc) },
+};
+
+static const struct hvf_reg_match hvf_fpreg_match[] = {
+    { HV_SIMD_FP_REG_Q0,  offsetof(CPUARMState, vfp.zregs[0]) },
+    { HV_SIMD_FP_REG_Q1,  offsetof(CPUARMState, vfp.zregs[1]) },
+    { HV_SIMD_FP_REG_Q2,  offsetof(CPUARMState, vfp.zregs[2]) },
+    { HV_SIMD_FP_REG_Q3,  offsetof(CPUARMState, vfp.zregs[3]) },
+    { HV_SIMD_FP_REG_Q4,  offsetof(CPUARMState, vfp.zregs[4]) },
+    { HV_SIMD_FP_REG_Q5,  offsetof(CPUARMState, vfp.zregs[5]) },
+    { HV_SIMD_FP_REG_Q6,  offsetof(CPUARMState, vfp.zregs[6]) },
+    { HV_SIMD_FP_REG_Q7,  offsetof(CPUARMState, vfp.zregs[7]) },
+    { HV_SIMD_FP_REG_Q8,  offsetof(CPUARMState, vfp.zregs[8]) },
+    { HV_SIMD_FP_REG_Q9,  offsetof(CPUARMState, vfp.zregs[9]) },
+    { HV_SIMD_FP_REG_Q10, offsetof(CPUARMState, vfp.zregs[10]) },
+    { HV_SIMD_FP_REG_Q11, offsetof(CPUARMState, vfp.zregs[11]) },
+    { HV_SIMD_FP_REG_Q12, offsetof(CPUARMState, vfp.zregs[12]) },
+    { HV_SIMD_FP_REG_Q13, offsetof(CPUARMState, vfp.zregs[13]) },
+    { HV_SIMD_FP_REG_Q14, offsetof(CPUARMState, vfp.zregs[14]) },
+    { HV_SIMD_FP_REG_Q15, offsetof(CPUARMState, vfp.zregs[15]) },
+    { HV_SIMD_FP_REG_Q16, offsetof(CPUARMState, vfp.zregs[16]) },
+    { HV_SIMD_FP_REG_Q17, offsetof(CPUARMState, vfp.zregs[17]) },
+    { HV_SIMD_FP_REG_Q18, offsetof(CPUARMState, vfp.zregs[18]) },
+    { HV_SIMD_FP_REG_Q19, offsetof(CPUARMState, vfp.zregs[19]) },
+    { HV_SIMD_FP_REG_Q20, offsetof(CPUARMState, vfp.zregs[20]) },
+    { HV_SIMD_FP_REG_Q21, offsetof(CPUARMState, vfp.zregs[21]) },
+    { HV_SIMD_FP_REG_Q22, offsetof(CPUARMState, vfp.zregs[22]) },
+    { HV_SIMD_FP_REG_Q23, offsetof(CPUARMState, vfp.zregs[23]) },
+    { HV_SIMD_FP_REG_Q24, offsetof(CPUARMState, vfp.zregs[24]) },
+    { HV_SIMD_FP_REG_Q25, offsetof(CPUARMState, vfp.zregs[25]) },
+    { HV_SIMD_FP_REG_Q26, offsetof(CPUARMState, vfp.zregs[26]) },
+    { HV_SIMD_FP_REG_Q27, offsetof(CPUARMState, vfp.zregs[27]) },
+    { HV_SIMD_FP_REG_Q28, offsetof(CPUARMState, vfp.zregs[28]) },
+    { HV_SIMD_FP_REG_Q29, offsetof(CPUARMState, vfp.zregs[29]) },
+    { HV_SIMD_FP_REG_Q30, offsetof(CPUARMState, vfp.zregs[30]) },
+    { HV_SIMD_FP_REG_Q31, offsetof(CPUARMState, vfp.zregs[31]) },
+};
+
+struct hvf_sreg_match {
+    int reg;
+    uint32_t key;
+    uint32_t cp_idx;
+};
+
+static struct hvf_sreg_match hvf_sreg_match[] = {
+    { HV_SYS_REG_DBGBVR0_EL1, HVF_SYSREG(0, 0, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR0_EL1, HVF_SYSREG(0, 0, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR0_EL1, HVF_SYSREG(0, 0, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR0_EL1, HVF_SYSREG(0, 0, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR1_EL1, HVF_SYSREG(0, 1, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR1_EL1, HVF_SYSREG(0, 1, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR1_EL1, HVF_SYSREG(0, 1, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR1_EL1, HVF_SYSREG(0, 1, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR2_EL1, HVF_SYSREG(0, 2, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR2_EL1, HVF_SYSREG(0, 2, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR2_EL1, HVF_SYSREG(0, 2, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR2_EL1, HVF_SYSREG(0, 2, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR3_EL1, HVF_SYSREG(0, 3, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR3_EL1, HVF_SYSREG(0, 3, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR3_EL1, HVF_SYSREG(0, 3, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR3_EL1, HVF_SYSREG(0, 3, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR4_EL1, HVF_SYSREG(0, 4, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR4_EL1, HVF_SYSREG(0, 4, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR4_EL1, HVF_SYSREG(0, 4, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR4_EL1, HVF_SYSREG(0, 4, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR5_EL1, HVF_SYSREG(0, 5, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR5_EL1, HVF_SYSREG(0, 5, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR5_EL1, HVF_SYSREG(0, 5, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR5_EL1, HVF_SYSREG(0, 5, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR6_EL1, HVF_SYSREG(0, 6, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR6_EL1, HVF_SYSREG(0, 6, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR6_EL1, HVF_SYSREG(0, 6, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR6_EL1, HVF_SYSREG(0, 6, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR7_EL1, HVF_SYSREG(0, 7, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR7_EL1, HVF_SYSREG(0, 7, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR7_EL1, HVF_SYSREG(0, 7, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR7_EL1, HVF_SYSREG(0, 7, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR8_EL1, HVF_SYSREG(0, 8, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR8_EL1, HVF_SYSREG(0, 8, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR8_EL1, HVF_SYSREG(0, 8, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR8_EL1, HVF_SYSREG(0, 8, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR9_EL1, HVF_SYSREG(0, 9, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR9_EL1, HVF_SYSREG(0, 9, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR9_EL1, HVF_SYSREG(0, 9, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR9_EL1, HVF_SYSREG(0, 9, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR10_EL1, HVF_SYSREG(0, 10, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR10_EL1, HVF_SYSREG(0, 10, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR10_EL1, HVF_SYSREG(0, 10, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR10_EL1, HVF_SYSREG(0, 10, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR11_EL1, HVF_SYSREG(0, 11, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR11_EL1, HVF_SYSREG(0, 11, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR11_EL1, HVF_SYSREG(0, 11, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR11_EL1, HVF_SYSREG(0, 11, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR12_EL1, HVF_SYSREG(0, 12, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR12_EL1, HVF_SYSREG(0, 12, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR12_EL1, HVF_SYSREG(0, 12, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR12_EL1, HVF_SYSREG(0, 12, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR13_EL1, HVF_SYSREG(0, 13, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR13_EL1, HVF_SYSREG(0, 13, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR13_EL1, HVF_SYSREG(0, 13, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR13_EL1, HVF_SYSREG(0, 13, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR14_EL1, HVF_SYSREG(0, 14, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR14_EL1, HVF_SYSREG(0, 14, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR14_EL1, HVF_SYSREG(0, 14, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR14_EL1, HVF_SYSREG(0, 14, 14, 0, 7) },
+
+    { HV_SYS_REG_DBGBVR15_EL1, HVF_SYSREG(0, 15, 14, 0, 4) },
+    { HV_SYS_REG_DBGBCR15_EL1, HVF_SYSREG(0, 15, 14, 0, 5) },
+    { HV_SYS_REG_DBGWVR15_EL1, HVF_SYSREG(0, 15, 14, 0, 6) },
+    { HV_SYS_REG_DBGWCR15_EL1, HVF_SYSREG(0, 15, 14, 0, 7) },
+
+#ifdef SYNC_NO_RAW_REGS
+    /*
+     * The registers below are manually synced on init because they are
+     * marked as NO_RAW. We still list them to make number space sync easier.
+     */
+    { HV_SYS_REG_MDCCINT_EL1, HVF_SYSREG(0, 2, 2, 0, 0) },
+    { HV_SYS_REG_MIDR_EL1, HVF_SYSREG(0, 0, 3, 0, 0) },
+    { HV_SYS_REG_MPIDR_EL1, HVF_SYSREG(0, 0, 3, 0, 5) },
+    { HV_SYS_REG_ID_AA64PFR0_EL1, HVF_SYSREG(0, 4, 3, 0, 0) },
+#endif
+    { HV_SYS_REG_ID_AA64PFR1_EL1, HVF_SYSREG(0, 4, 3, 0, 2) },
+    { HV_SYS_REG_ID_AA64DFR0_EL1, HVF_SYSREG(0, 5, 3, 0, 0) },
+    { HV_SYS_REG_ID_AA64DFR1_EL1, HVF_SYSREG(0, 5, 3, 0, 1) },
+    { HV_SYS_REG_ID_AA64ISAR0_EL1, HVF_SYSREG(0, 6, 3, 0, 0) },
+    { HV_SYS_REG_ID_AA64ISAR1_EL1, HVF_SYSREG(0, 6, 3, 0, 1) },
+#ifdef SYNC_NO_MMFR0
+    /* We keep the hardware MMFR0 around. HW limits are there anyway */
+    { HV_SYS_REG_ID_AA64MMFR0_EL1, HVF_SYSREG(0, 7, 3, 0, 0) },
+#endif
+    { HV_SYS_REG_ID_AA64MMFR1_EL1, HVF_SYSREG(0, 7, 3, 0, 1) },
+    { HV_SYS_REG_ID_AA64MMFR2_EL1, HVF_SYSREG(0, 7, 3, 0, 2) },
+
+    { HV_SYS_REG_MDSCR_EL1, HVF_SYSREG(0, 2, 2, 0, 2) },
+    { HV_SYS_REG_SCTLR_EL1, HVF_SYSREG(1, 0, 3, 0, 0) },
+    { HV_SYS_REG_CPACR_EL1, HVF_SYSREG(1, 0, 3, 0, 2) },
+    { HV_SYS_REG_TTBR0_EL1, HVF_SYSREG(2, 0, 3, 0, 0) },
+    { HV_SYS_REG_TTBR1_EL1, HVF_SYSREG(2, 0, 3, 0, 1) },
+    { HV_SYS_REG_TCR_EL1, HVF_SYSREG(2, 0, 3, 0, 2) },
+
+    { HV_SYS_REG_APIAKEYLO_EL1, HVF_SYSREG(2, 1, 3, 0, 0) },
+    { HV_SYS_REG_APIAKEYHI_EL1, HVF_SYSREG(2, 1, 3, 0, 1) },
+    { HV_SYS_REG_APIBKEYLO_EL1, HVF_SYSREG(2, 1, 3, 0, 2) },
+    { HV_SYS_REG_APIBKEYHI_EL1, HVF_SYSREG(2, 1, 3, 0, 3) },
+    { HV_SYS_REG_APDAKEYLO_EL1, HVF_SYSREG(2, 2, 3, 0, 0) },
+    { HV_SYS_REG_APDAKEYHI_EL1, HVF_SYSREG(2, 2, 3, 0, 1) },
+    { HV_SYS_REG_APDBKEYLO_EL1, HVF_SYSREG(2, 2, 3, 0, 2) },
+    { HV_SYS_REG_APDBKEYHI_EL1, HVF_SYSREG(2, 2, 3, 0, 3) },
+    { HV_SYS_REG_APGAKEYLO_EL1, HVF_SYSREG(2, 3, 3, 0, 0) },
+    { HV_SYS_REG_APGAKEYHI_EL1, HVF_SYSREG(2, 3, 3, 0, 1) },
+
+    { HV_SYS_REG_SPSR_EL1, HVF_SYSREG(4, 0, 3, 0, 0) },
+    { HV_SYS_REG_ELR_EL1, HVF_SYSREG(4, 0, 3, 0, 1) },
+    { HV_SYS_REG_SP_EL0, HVF_SYSREG(4, 1, 3, 0, 0) },
+    { HV_SYS_REG_AFSR0_EL1, HVF_SYSREG(5, 1, 3, 0, 0) },
+    { HV_SYS_REG_AFSR1_EL1, HVF_SYSREG(5, 1, 3, 0, 1) },
+    { HV_SYS_REG_ESR_EL1, HVF_SYSREG(5, 2, 3, 0, 0) },
+    { HV_SYS_REG_FAR_EL1, HVF_SYSREG(6, 0, 3, 0, 0) },
+    { HV_SYS_REG_PAR_EL1, HVF_SYSREG(7, 4, 3, 0, 0) },
+    { HV_SYS_REG_MAIR_EL1, HVF_SYSREG(10, 2, 3, 0, 0) },
+    { HV_SYS_REG_AMAIR_EL1, HVF_SYSREG(10, 3, 3, 0, 0) },
+    { HV_SYS_REG_VBAR_EL1, HVF_SYSREG(12, 0, 3, 0, 0) },
+    { HV_SYS_REG_CONTEXTIDR_EL1, HVF_SYSREG(13, 0, 3, 0, 1) },
+    { HV_SYS_REG_TPIDR_EL1, HVF_SYSREG(13, 0, 3, 0, 4) },
+    { HV_SYS_REG_CNTKCTL_EL1, HVF_SYSREG(14, 1, 3, 0, 0) },
+    { HV_SYS_REG_CSSELR_EL1, HVF_SYSREG(0, 0, 3, 2, 0) },
+    { HV_SYS_REG_TPIDR_EL0, HVF_SYSREG(13, 0, 3, 3, 2) },
+    { HV_SYS_REG_TPIDRRO_EL0, HVF_SYSREG(13, 0, 3, 3, 3) },
+    { HV_SYS_REG_CNTV_CTL_EL0, HVF_SYSREG(14, 3, 3, 3, 1) },
+    { HV_SYS_REG_CNTV_CVAL_EL0, HVF_SYSREG(14, 3, 3, 3, 2) },
+    { HV_SYS_REG_SP_EL1, HVF_SYSREG(4, 1, 3, 4, 0) },
+};
+
+int hvf_get_registers(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t ret;
+    uint64_t val;
+    hv_simd_fp_uchar16_t fpval;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
+        ret = hv_vcpu_get_reg(cpu->hvf->fd, hvf_reg_match[i].reg, &val);
+        *(uint64_t *)((void *)env + hvf_reg_match[i].offset) = val;
+        assert_hvf_ok(ret);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(hvf_fpreg_match); i++) {
+        ret = hv_vcpu_get_simd_fp_reg(cpu->hvf->fd, hvf_fpreg_match[i].reg,
+                                      &fpval);
+        memcpy((void *)env + hvf_fpreg_match[i].offset, &fpval, sizeof(fpval));
+        assert_hvf_ok(ret);
+    }
+
+    val = 0;
+    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_FPCR, &val);
+    assert_hvf_ok(ret);
+    vfp_set_fpcr(env, val);
+
+    val = 0;
+    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_FPSR, &val);
+    assert_hvf_ok(ret);
+    vfp_set_fpsr(env, val);
+
+    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_CPSR, &val);
+    assert_hvf_ok(ret);
+    pstate_write(env, val);
+
+    for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
+        if (hvf_sreg_match[i].cp_idx == -1) {
+            continue;
+        }
+
+        ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
+        assert_hvf_ok(ret);
+
+        arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
+    }
+    assert(write_list_to_cpustate(arm_cpu));
+
+    aarch64_restore_sp(env, arm_current_el(env));
+
+    return 0;
+}
+
+int hvf_put_registers(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t ret;
+    uint64_t val;
+    hv_simd_fp_uchar16_t fpval;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
+        val = *(uint64_t *)((void *)env + hvf_reg_match[i].offset);
+        ret = hv_vcpu_set_reg(cpu->hvf->fd, hvf_reg_match[i].reg, val);
+        assert_hvf_ok(ret);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(hvf_fpreg_match); i++) {
+        memcpy(&fpval, (void *)env + hvf_fpreg_match[i].offset, sizeof(fpval));
+        ret = hv_vcpu_set_simd_fp_reg(cpu->hvf->fd, hvf_fpreg_match[i].reg,
+                                      fpval);
+        assert_hvf_ok(ret);
+    }
+
+    ret = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_FPCR, vfp_get_fpcr(env));
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_FPSR, vfp_get_fpsr(env));
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_CPSR, pstate_read(env));
+    assert_hvf_ok(ret);
+
+    aarch64_save_sp(env, arm_current_el(env));
+
+    assert(write_cpustate_to_list(arm_cpu, false));
+    for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
+        if (hvf_sreg_match[i].cp_idx == -1) {
+            continue;
+        }
+
+        val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
+        ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, val);
+        assert_hvf_ok(ret);
+    }
+
+    ret = hv_vcpu_set_vtimer_offset(cpu->hvf->fd, hvf_state->vtimer_offset);
+    assert_hvf_ok(ret);
+
+    return 0;
+}
+
+static void flush_cpu_state(CPUState *cpu)
+{
+    if (cpu->vcpu_dirty) {
+        hvf_put_registers(cpu);
+        cpu->vcpu_dirty = false;
+    }
+}
+
+static void hvf_set_reg(CPUState *cpu, int rt, uint64_t val)
+{
+    hv_return_t r;
+
+    flush_cpu_state(cpu);
+
+    if (rt < 31) {
+        r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_X0 + rt, val);
+        assert_hvf_ok(r);
+    }
+}
+
+static uint64_t hvf_get_reg(CPUState *cpu, int rt)
+{
+    uint64_t val = 0;
+    hv_return_t r;
+
+    flush_cpu_state(cpu);
+
+    if (rt < 31) {
+        r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_X0 + rt, &val);
+        assert_hvf_ok(r);
+    }
+
+    return val;
+}
+
+void hvf_arch_vcpu_destroy(CPUState *cpu)
+{
+}
+
+int hvf_arch_init_vcpu(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    uint32_t sregs_match_len = ARRAY_SIZE(hvf_sreg_match);
+    uint32_t sregs_cnt = 0;
+    uint64_t pfr;
+    hv_return_t ret;
+    int i;
+
+    env->aarch64 = 1;
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* Allocate enough space for our sysreg sync */
+    arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
+                                     sregs_match_len);
+    arm_cpu->cpreg_values = g_renew(uint64_t, arm_cpu->cpreg_values,
+                                    sregs_match_len);
+    arm_cpu->cpreg_vmstate_indexes = g_renew(uint64_t,
+                                             arm_cpu->cpreg_vmstate_indexes,
+                                             sregs_match_len);
+    arm_cpu->cpreg_vmstate_values = g_renew(uint64_t,
+                                            arm_cpu->cpreg_vmstate_values,
+                                            sregs_match_len);
+
+    memset(arm_cpu->cpreg_values, 0, sregs_match_len * sizeof(uint64_t));
+
+    /* Populate cp list for all known sysregs */
+    for (i = 0; i < sregs_match_len; i++) {
+        const ARMCPRegInfo *ri;
+        uint32_t key = hvf_sreg_match[i].key;
+
+        ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
+        if (ri) {
+            assert(!(ri->type & ARM_CP_NO_RAW));
+            hvf_sreg_match[i].cp_idx = sregs_cnt;
+            arm_cpu->cpreg_indexes[sregs_cnt++] = cpreg_to_kvm_id(key);
+        } else {
+            hvf_sreg_match[i].cp_idx = -1;
+        }
+    }
+    arm_cpu->cpreg_array_len = sregs_cnt;
+    arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
+
+    assert(write_cpustate_to_list(arm_cpu, false));
+
+    /* Set CP_NO_RAW system registers on init */
+    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MIDR_EL1,
+                              arm_cpu->midr);
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MPIDR_EL1,
+                              arm_cpu->mp_affinity);
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
+    assert_hvf_ok(ret);
+    pfr |= env->gicv3state ? (1 << 24) : 0;
+    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
+    assert_hvf_ok(ret);
+
+    /* We're limited to underlying hardware caps, override internal versions */
+    ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
+                              &arm_cpu->isar.id_aa64mmfr0);
+    assert_hvf_ok(ret);
+
+    return 0;
+}
+
+void hvf_kick_vcpu_thread(CPUState *cpu)
+{
+    hv_vcpus_exit(&cpu->hvf->fd, 1);
+}
+
+static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
+                                uint32_t syndrome)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+
+    cpu->exception_index = excp;
+    env->exception.target_el = 1;
+    env->exception.syndrome = syndrome;
+
+    arm_cpu_do_interrupt(cpu);
+}
+
+static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    uint64_t val = 0;
+
+    switch (reg) {
+    case SYSREG_CNTPCT_EL0:
+        val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
+              gt_cntfrq_period_ns(arm_cpu);
+        break;
+    case SYSREG_OSLSR_EL1:
+        val = env->cp15.oslsr_el1;
+        break;
+    case SYSREG_OSDLR_EL1:
+        /* Dummy register */
+        break;
+    default:
+        cpu_synchronize_state(cpu);
+        trace_hvf_unhandled_sysreg_read(env->pc, reg,
+                                        (reg >> 20) & 0x3,
+                                        (reg >> 14) & 0x7,
+                                        (reg >> 10) & 0xf,
+                                        (reg >> 1) & 0xf,
+                                        (reg >> 17) & 0x7);
+        hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        return 1;
+    }
+
+    trace_hvf_sysreg_read(reg,
+                          (reg >> 20) & 0x3,
+                          (reg >> 14) & 0x7,
+                          (reg >> 10) & 0xf,
+                          (reg >> 1) & 0xf,
+                          (reg >> 17) & 0x7,
+                          val);
+    hvf_set_reg(cpu, rt, val);
+
+    return 0;
+}
+
+static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+
+    trace_hvf_sysreg_write(reg,
+                           (reg >> 20) & 0x3,
+                           (reg >> 14) & 0x7,
+                           (reg >> 10) & 0xf,
+                           (reg >> 1) & 0xf,
+                           (reg >> 17) & 0x7,
+                           val);
+
+    switch (reg) {
+    case SYSREG_OSLAR_EL1:
+        env->cp15.oslsr_el1 = val & 1;
+        break;
+    case SYSREG_OSDLR_EL1:
+        /* Dummy register */
+        break;
+    default:
+        cpu_synchronize_state(cpu);
+        trace_hvf_unhandled_sysreg_write(env->pc, reg,
+                                         (reg >> 20) & 0x3,
+                                         (reg >> 14) & 0x7,
+                                         (reg >> 10) & 0xf,
+                                         (reg >> 1) & 0xf,
+                                         (reg >> 17) & 0x7);
+        hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        return 1;
+    }
+
+    return 0;
+}
+
+static int hvf_inject_interrupts(CPUState *cpu)
+{
+    if (cpu->interrupt_request & CPU_INTERRUPT_FIQ) {
+        trace_hvf_inject_fiq();
+        hv_vcpu_set_pending_interrupt(cpu->hvf->fd, HV_INTERRUPT_TYPE_FIQ,
+                                      true);
+    }
+
+    if (cpu->interrupt_request & CPU_INTERRUPT_HARD) {
+        trace_hvf_inject_irq();
+        hv_vcpu_set_pending_interrupt(cpu->hvf->fd, HV_INTERRUPT_TYPE_IRQ,
+                                      true);
+    }
+
+    return 0;
+}
+
+static uint64_t hvf_vtimer_val_raw(void)
+{
+    /*
+     * mach_absolute_time() returns the vtimer value without the VM
+     * offset that we define. Add our own offset on top.
+     */
+    return mach_absolute_time() - hvf_state->vtimer_offset;
+}
+
+static void hvf_sync_vtimer(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    hv_return_t r;
+    uint64_t ctl;
+    bool irq_state;
+
+    if (!cpu->hvf->vtimer_masked) {
+        /* We will get notified on vtimer changes by hvf, nothing to do */
+        return;
+    }
+
+    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
+    assert_hvf_ok(r);
+
+    irq_state = (ctl & (TMR_CTL_ENABLE | TMR_CTL_IMASK | TMR_CTL_ISTATUS)) ==
+                (TMR_CTL_ENABLE | TMR_CTL_ISTATUS);
+    qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], irq_state);
+
+    if (!irq_state) {
+        /* Timer no longer asserting, we can unmask it */
+        hv_vcpu_set_vtimer_mask(cpu->hvf->fd, false);
+        cpu->hvf->vtimer_masked = false;
+    }
+}
+
+int hvf_vcpu_exec(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
+    hv_return_t r;
+    bool advance_pc = false;
+
+    if (hvf_inject_interrupts(cpu)) {
+        return EXCP_INTERRUPT;
+    }
+
+    if (cpu->halted) {
+        return EXCP_HLT;
+    }
+
+    flush_cpu_state(cpu);
+
+    qemu_mutex_unlock_iothread();
+    assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));
+
+    /* handle VMEXIT */
+    uint64_t exit_reason = hvf_exit->reason;
+    uint64_t syndrome = hvf_exit->exception.syndrome;
+    uint32_t ec = syn_get_ec(syndrome);
+
+    qemu_mutex_lock_iothread();
+    switch (exit_reason) {
+    case HV_EXIT_REASON_EXCEPTION:
+        /* This is the main one, handle below. */
+        break;
+    case HV_EXIT_REASON_VTIMER_ACTIVATED:
+        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+        cpu->hvf->vtimer_masked = true;
+        return 0;
+    case HV_EXIT_REASON_CANCELED:
+        /* we got kicked, no exit to process */
+        return 0;
+    default:
+        assert(0);
+    }
+
+    hvf_sync_vtimer(cpu);
+
+    switch (ec) {
+    case EC_DATAABORT: {
+        bool isv = syndrome & ARM_EL_ISV;
+        bool iswrite = (syndrome >> 6) & 1;
+        bool s1ptw = (syndrome >> 7) & 1;
+        uint32_t sas = (syndrome >> 22) & 3;
+        uint32_t len = 1 << sas;
+        uint32_t srt = (syndrome >> 16) & 0x1f;
+        uint64_t val = 0;
+
+        trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
+                             hvf_exit->exception.physical_address, isv,
+                             iswrite, s1ptw, len, srt);
+
+        assert(isv);
+
+        if (iswrite) {
+            val = hvf_get_reg(cpu, srt);
+            address_space_write(&address_space_memory,
+                                hvf_exit->exception.physical_address,
+                                MEMTXATTRS_UNSPECIFIED, &val, len);
+        } else {
+            address_space_read(&address_space_memory,
+                               hvf_exit->exception.physical_address,
+                               MEMTXATTRS_UNSPECIFIED, &val, len);
+            hvf_set_reg(cpu, srt, val);
+        }
+
+        advance_pc = true;
+        break;
+    }
+    case EC_SYSTEMREGISTERTRAP: {
+        bool isread = (syndrome >> 0) & 1;
+        uint32_t rt = (syndrome >> 5) & 0x1f;
+        uint32_t reg = syndrome & SYSREG_MASK;
+        uint64_t val;
+        int ret = 0;
+
+        if (isread) {
+            ret = hvf_sysreg_read(cpu, reg, rt);
+        } else {
+            val = hvf_get_reg(cpu, rt);
+            ret = hvf_sysreg_write(cpu, reg, val);
+        }
+
+        advance_pc = !ret;
+        break;
+    }
+    case EC_WFX_TRAP:
+        advance_pc = true;
+        break;
+    case EC_AA64_HVC:
+        cpu_synchronize_state(cpu);
+        trace_hvf_unknown_hvf(env->xregs[0]);
+        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
+        break;
+    case EC_AA64_SMC:
+        cpu_synchronize_state(cpu);
+        trace_hvf_unknown_smc(env->xregs[0]);
+        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
+        break;
+    default:
+        cpu_synchronize_state(cpu);
+        trace_hvf_exit(syndrome, ec, env->pc);
+        error_report("0x%llx: unhandled exception ec=0x%x", env->pc, ec);
+    }
+
+    if (advance_pc) {
+        uint64_t pc;
+
+        flush_cpu_state(cpu);
+
+        r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_PC, &pc);
+        assert_hvf_ok(r);
+        pc += 4;
+        r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
+        assert_hvf_ok(r);
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_hvf_vtimer = {
+    .name = "hvf-vtimer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(vtimer_val, HVFVTimer),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void hvf_vm_state_change(void *opaque, bool running, RunState state)
+{
+    HVFVTimer *s = opaque;
+
+    if (running) {
+        /* Update vtimer offset on all CPUs */
+        hvf_state->vtimer_offset = mach_absolute_time() - s->vtimer_val;
+        cpu_synchronize_all_states();
+    } else {
+        /* Remember vtimer value on every pause */
+        s->vtimer_val = hvf_vtimer_val_raw();
+    }
+}
+
+int hvf_arch_init(void)
+{
+    hvf_state->vtimer_offset = mach_absolute_time();
+    vmstate_register(NULL, 0, &vmstate_hvf_vtimer, &vtimer);
+    qemu_add_vm_change_state_handler(hvf_vm_state_change, &vtimer);
+    return 0;
+}
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
new file mode 100644
index 0000000000..e972bdd9ce
--- /dev/null
+++ b/target/arm/hvf/trace-events
@@ -0,0 +1,10 @@
+hvf_unhandled_sysreg_read(uint64_t pc, uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2) "unhandled sysreg read at pc=0x%"PRIx64": 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d)"
+hvf_unhandled_sysreg_write(uint64_t pc, uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2) "unhandled sysreg write at pc=0x%"PRIx64": 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d)"
+hvf_inject_fiq(void) "injecting FIQ"
+hvf_inject_irq(void) "injecting IRQ"
+hvf_data_abort(uint64_t pc, uint64_t va, uint64_t pa, bool isv, bool iswrite, bool s1ptw, uint32_t len, uint32_t srt) "data abort: [pc=0x%"PRIx64" va=0x%016"PRIx64" pa=0x%016"PRIx64" isv=%d iswrite=%d s1ptw=%d len=%d srt=%d]"
+hvf_sysreg_read(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg read 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d) = 0x%016"PRIx64
+hvf_sysreg_write(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg write 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d, val=0x%016"PRIx64")"
+hvf_unknown_hvf(uint64_t x0) "unknown HVC! 0x%016"PRIx64
+hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
+hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index abef24a9c8..33a4e74980 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -206,6 +206,11 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
     return env->apic_bus_freq != 0;
 }
 
+void hvf_kick_vcpu_thread(CPUState *cpu)
+{
+    cpus_kick_thread(cpu);
+}
+
 int hvf_arch_init(void)
 {
     return 0;
-- 
2.30.1 (Apple Git-130)


