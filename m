Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6432C7D2F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 04:14:56 +0100 (CET)
Received: from localhost ([::1]:51380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZeR-0007VG-RV
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 22:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZXK-0008DP-UA; Sun, 29 Nov 2020 22:07:34 -0500
Received: from mail.csgraf.de ([188.138.100.120]:35394
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZXG-00078H-CV; Sun, 29 Nov 2020 22:07:34 -0500
Received: from localhost.localdomain
 (dynamic-077-009-091-089.77.9.pool.telefonica.de [77.9.91.89])
 by csgraf.de (Postfix) with ESMTPSA id 01E5C39004E2;
 Mon, 30 Nov 2020 04:07:27 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hvf: Add Apple Silicon support
Date: Mon, 30 Nov 2020 04:07:22 +0100
Message-Id: <20201130030723.78326-8-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201130030723.78326-1-agraf@csgraf.de>
References: <20201130030723.78326-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
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
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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

---

v1 -> v2:

  - Merge vcpu kick function patch
  - Implement WFI handling (allows vCPUs to sleep)
  - Synchronize system registers (fixes OVMF crashes and reboot)
  - Don't always call cpu_synchronize_state()
  - Use more fine grained iothread locking
  - Populate aa64mmfr0 from hardware
---
 MAINTAINERS              |   5 +
 accel/hvf/hvf-cpus.c     |  14 +
 include/sysemu/hvf_int.h |   7 +-
 target/arm/hvf/hvf.c     | 603 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 628 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/hvf/hvf.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ca4b6d9279..9cd1d9d448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -439,6 +439,11 @@ F: accel/accel.c
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
diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index e6dffcd9b5..4360f64671 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -60,6 +60,10 @@
 
 #include <Hypervisor/Hypervisor.h>
 
+#ifdef __aarch64__
+#define HV_VM_DEFAULT NULL
+#endif
+
 /* Memory slots */
 
 struct mac_slot {
@@ -344,7 +348,11 @@ static int hvf_init_vcpu(CPUState *cpu)
     sigdelset(&set, SIG_IPI);
     pthread_sigmask(SIG_SETMASK, &set, NULL);
 
+#ifdef __aarch64__
+    r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
+#else
     r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf->fd, HV_VCPU_DEFAULT);
+#endif
     cpu->vcpu_dirty = 1;
     assert_hvf_ok(r);
 
@@ -415,8 +423,14 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+__attribute__((weak)) void hvf_kick_vcpu_thread(CPUState *cpu)
+{
+    cpus_kick_thread(cpu);
+}
+
 static const CpusAccel hvf_cpus = {
     .create_vcpu_thread = hvf_start_vcpu_thread,
+    .kick_vcpu_thread = hvf_kick_vcpu_thread,
 
     .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
     .synchronize_post_init = hvf_cpu_synchronize_post_init,
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 7967e33727..c56baa3ae8 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -11,6 +11,7 @@
 #ifndef HVF_INT_H
 #define HVF_INT_H
 
+#include "qemu/osdep.h"
 #include <Hypervisor/Hypervisor.h>
 
 #define HVF_MAX_VCPU 0x10
@@ -59,7 +60,10 @@ struct HVFState {
 extern HVFState *hvf_state;
 
 struct hvf_vcpu_state {
-    int fd;
+    uint64_t fd;
+    void *exit;
+    struct timespec ts;
+    bool sleeping;
 };
 
 void assert_hvf_ok(hv_return_t ret);
@@ -69,5 +73,6 @@ int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *cpu);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
+void hvf_kick_vcpu_thread(CPUState *cpu);
 
 #endif
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
new file mode 100644
index 0000000000..8fe10966d2
--- /dev/null
+++ b/target/arm/hvf/hvf.c
@@ -0,0 +1,603 @@
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
+#include <Hypervisor/Hypervisor.h>
+
+#include "exec/address-spaces.h"
+#include "hw/irq.h"
+#include "qemu/main-loop.h"
+#include "sysemu/accel.h"
+#include "sysemu/cpus.h"
+#include "target/arm/cpu.h"
+#include "target/arm/internals.h"
+
+#define HVF_DEBUG 0
+#define DPRINTF(...)                                        \
+    if (HVF_DEBUG) {                                        \
+        fprintf(stderr, "HVF %s:%d ", __func__, __LINE__);  \
+        fprintf(stderr, __VA_ARGS__);                       \
+        fprintf(stderr, "\n");                              \
+    }
+
+#define SYSREG(op0, op1, op2, crn, crm) \
+    ((op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (crm << 1))
+#define SYSREG_MASK           SYSREG(0x3, 0x7, 0x7, 0xf, 0xf)
+#define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 1, 14, 0)
+#define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 0, 9, 13)
+
+#define WFX_IS_WFE (1 << 0)
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
+static const struct hvf_reg_match hvf_sreg_match[] = {
+    { HV_SYS_REG_DBGBVR0_EL1, offsetof(CPUARMState, cp15.dbgbvr[0]) },
+    { HV_SYS_REG_DBGBCR0_EL1, offsetof(CPUARMState, cp15.dbgbcr[0]) },
+    { HV_SYS_REG_DBGWVR0_EL1, offsetof(CPUARMState, cp15.dbgwvr[0]) },
+    { HV_SYS_REG_DBGWCR0_EL1, offsetof(CPUARMState, cp15.dbgwcr[0]) },
+    { HV_SYS_REG_DBGBVR1_EL1, offsetof(CPUARMState, cp15.dbgbvr[1]) },
+    { HV_SYS_REG_DBGBCR1_EL1, offsetof(CPUARMState, cp15.dbgbcr[1]) },
+    { HV_SYS_REG_DBGWVR1_EL1, offsetof(CPUARMState, cp15.dbgwvr[1]) },
+    { HV_SYS_REG_DBGWCR1_EL1, offsetof(CPUARMState, cp15.dbgwcr[1]) },
+    { HV_SYS_REG_MDSCR_EL1, offsetof(CPUARMState, cp15.mdscr_el1) },
+    { HV_SYS_REG_DBGBVR2_EL1, offsetof(CPUARMState, cp15.dbgbvr[2]) },
+    { HV_SYS_REG_DBGBCR2_EL1, offsetof(CPUARMState, cp15.dbgbcr[2]) },
+    { HV_SYS_REG_DBGWVR2_EL1, offsetof(CPUARMState, cp15.dbgwvr[2]) },
+    { HV_SYS_REG_DBGWCR2_EL1, offsetof(CPUARMState, cp15.dbgwcr[2]) },
+    { HV_SYS_REG_DBGBVR3_EL1, offsetof(CPUARMState, cp15.dbgbvr[3]) },
+    { HV_SYS_REG_DBGBCR3_EL1, offsetof(CPUARMState, cp15.dbgbcr[3]) },
+    { HV_SYS_REG_DBGWVR3_EL1, offsetof(CPUARMState, cp15.dbgwvr[3]) },
+    { HV_SYS_REG_DBGWCR3_EL1, offsetof(CPUARMState, cp15.dbgwcr[3]) },
+    { HV_SYS_REG_DBGBVR4_EL1, offsetof(CPUARMState, cp15.dbgbvr[4]) },
+    { HV_SYS_REG_DBGBCR4_EL1, offsetof(CPUARMState, cp15.dbgbcr[4]) },
+    { HV_SYS_REG_DBGWVR4_EL1, offsetof(CPUARMState, cp15.dbgwvr[4]) },
+    { HV_SYS_REG_DBGWCR4_EL1, offsetof(CPUARMState, cp15.dbgwcr[4]) },
+    { HV_SYS_REG_DBGBVR5_EL1, offsetof(CPUARMState, cp15.dbgbvr[5]) },
+    { HV_SYS_REG_DBGBCR5_EL1, offsetof(CPUARMState, cp15.dbgbcr[5]) },
+    { HV_SYS_REG_DBGWVR5_EL1, offsetof(CPUARMState, cp15.dbgwvr[5]) },
+    { HV_SYS_REG_DBGWCR5_EL1, offsetof(CPUARMState, cp15.dbgwcr[5]) },
+    { HV_SYS_REG_DBGBVR6_EL1, offsetof(CPUARMState, cp15.dbgbvr[6]) },
+    { HV_SYS_REG_DBGBCR6_EL1, offsetof(CPUARMState, cp15.dbgbcr[6]) },
+    { HV_SYS_REG_DBGWVR6_EL1, offsetof(CPUARMState, cp15.dbgwvr[6]) },
+    { HV_SYS_REG_DBGWCR6_EL1, offsetof(CPUARMState, cp15.dbgwcr[6]) },
+    { HV_SYS_REG_DBGBVR7_EL1, offsetof(CPUARMState, cp15.dbgbvr[7]) },
+    { HV_SYS_REG_DBGBCR7_EL1, offsetof(CPUARMState, cp15.dbgbcr[7]) },
+    { HV_SYS_REG_DBGWVR7_EL1, offsetof(CPUARMState, cp15.dbgwvr[7]) },
+    { HV_SYS_REG_DBGWCR7_EL1, offsetof(CPUARMState, cp15.dbgwcr[7]) },
+    { HV_SYS_REG_DBGBVR8_EL1, offsetof(CPUARMState, cp15.dbgbvr[8]) },
+    { HV_SYS_REG_DBGBCR8_EL1, offsetof(CPUARMState, cp15.dbgbcr[8]) },
+    { HV_SYS_REG_DBGWVR8_EL1, offsetof(CPUARMState, cp15.dbgwvr[8]) },
+    { HV_SYS_REG_DBGWCR8_EL1, offsetof(CPUARMState, cp15.dbgwcr[8]) },
+    { HV_SYS_REG_DBGBVR9_EL1, offsetof(CPUARMState, cp15.dbgbvr[9]) },
+    { HV_SYS_REG_DBGBCR9_EL1, offsetof(CPUARMState, cp15.dbgbcr[9]) },
+    { HV_SYS_REG_DBGWVR9_EL1, offsetof(CPUARMState, cp15.dbgwvr[9]) },
+    { HV_SYS_REG_DBGWCR9_EL1, offsetof(CPUARMState, cp15.dbgwcr[9]) },
+    { HV_SYS_REG_DBGBVR10_EL1, offsetof(CPUARMState, cp15.dbgbvr[10]) },
+    { HV_SYS_REG_DBGBCR10_EL1, offsetof(CPUARMState, cp15.dbgbcr[10]) },
+    { HV_SYS_REG_DBGWVR10_EL1, offsetof(CPUARMState, cp15.dbgwvr[10]) },
+    { HV_SYS_REG_DBGWCR10_EL1, offsetof(CPUARMState, cp15.dbgwcr[10]) },
+    { HV_SYS_REG_DBGBVR11_EL1, offsetof(CPUARMState, cp15.dbgbvr[11]) },
+    { HV_SYS_REG_DBGBCR11_EL1, offsetof(CPUARMState, cp15.dbgbcr[11]) },
+    { HV_SYS_REG_DBGWVR11_EL1, offsetof(CPUARMState, cp15.dbgwvr[11]) },
+    { HV_SYS_REG_DBGWCR11_EL1, offsetof(CPUARMState, cp15.dbgwcr[11]) },
+    { HV_SYS_REG_DBGBVR12_EL1, offsetof(CPUARMState, cp15.dbgbvr[12]) },
+    { HV_SYS_REG_DBGBCR12_EL1, offsetof(CPUARMState, cp15.dbgbcr[12]) },
+    { HV_SYS_REG_DBGWVR12_EL1, offsetof(CPUARMState, cp15.dbgwvr[12]) },
+    { HV_SYS_REG_DBGWCR12_EL1, offsetof(CPUARMState, cp15.dbgwcr[12]) },
+    { HV_SYS_REG_DBGBVR13_EL1, offsetof(CPUARMState, cp15.dbgbvr[13]) },
+    { HV_SYS_REG_DBGBCR13_EL1, offsetof(CPUARMState, cp15.dbgbcr[13]) },
+    { HV_SYS_REG_DBGWVR13_EL1, offsetof(CPUARMState, cp15.dbgwvr[13]) },
+    { HV_SYS_REG_DBGWCR13_EL1, offsetof(CPUARMState, cp15.dbgwcr[13]) },
+    { HV_SYS_REG_DBGBVR14_EL1, offsetof(CPUARMState, cp15.dbgbvr[14]) },
+    { HV_SYS_REG_DBGBCR14_EL1, offsetof(CPUARMState, cp15.dbgbcr[14]) },
+    { HV_SYS_REG_DBGWVR14_EL1, offsetof(CPUARMState, cp15.dbgwvr[14]) },
+    { HV_SYS_REG_DBGWCR14_EL1, offsetof(CPUARMState, cp15.dbgwcr[14]) },
+    { HV_SYS_REG_DBGBVR15_EL1, offsetof(CPUARMState, cp15.dbgbvr[15]) },
+    { HV_SYS_REG_DBGBCR15_EL1, offsetof(CPUARMState, cp15.dbgbcr[15]) },
+    { HV_SYS_REG_DBGWVR15_EL1, offsetof(CPUARMState, cp15.dbgwvr[15]) },
+    { HV_SYS_REG_DBGWCR15_EL1, offsetof(CPUARMState, cp15.dbgwcr[15]) },
+    { HV_SYS_REG_MIDR_EL1, offsetof(CPUARMState, cp15.c0_cpuid) },
+    { HV_SYS_REG_SCTLR_EL1, offsetof(CPUARMState, cp15.sctlr_ns) },
+    { HV_SYS_REG_CPACR_EL1, offsetof(CPUARMState, cp15.cpacr_el1) },
+    { HV_SYS_REG_TTBR0_EL1, offsetof(CPUARMState, cp15.ttbr0_ns) },
+    { HV_SYS_REG_TTBR1_EL1, offsetof(CPUARMState, cp15.ttbr1_ns) },
+    { HV_SYS_REG_TCR_EL1, offsetof(CPUARMState, cp15.tcr_el[1]) },
+    { HV_SYS_REG_APIAKEYLO_EL1, offsetof(CPUARMState, keys.apia.lo) },
+    { HV_SYS_REG_APIAKEYHI_EL1, offsetof(CPUARMState, keys.apia.hi) },
+    { HV_SYS_REG_APIBKEYLO_EL1, offsetof(CPUARMState, keys.apib.lo) },
+    { HV_SYS_REG_APIBKEYHI_EL1, offsetof(CPUARMState, keys.apib.hi) },
+    { HV_SYS_REG_APDAKEYLO_EL1, offsetof(CPUARMState, keys.apda.lo) },
+    { HV_SYS_REG_APDAKEYHI_EL1, offsetof(CPUARMState, keys.apda.hi) },
+    { HV_SYS_REG_APDBKEYLO_EL1, offsetof(CPUARMState, keys.apdb.lo) },
+    { HV_SYS_REG_APDBKEYHI_EL1, offsetof(CPUARMState, keys.apdb.hi) },
+    { HV_SYS_REG_APGAKEYLO_EL1, offsetof(CPUARMState, keys.apga.lo) },
+    { HV_SYS_REG_APGAKEYHI_EL1, offsetof(CPUARMState, keys.apga.hi) },
+    { HV_SYS_REG_SPSR_EL1, offsetof(CPUARMState, banked_spsr[BANK_SVC]) },
+    { HV_SYS_REG_ELR_EL1, offsetof(CPUARMState, elr_el[1]) },
+    { HV_SYS_REG_SP_EL0, offsetof(CPUARMState, sp_el[0]) },
+    { HV_SYS_REG_ESR_EL1, offsetof(CPUARMState, cp15.esr_el[1]) },
+    { HV_SYS_REG_FAR_EL1, offsetof(CPUARMState, cp15.far_el[1]) },
+    { HV_SYS_REG_PAR_EL1, offsetof(CPUARMState, cp15.par_el[1]) },
+    { HV_SYS_REG_MAIR_EL1, offsetof(CPUARMState, cp15.mair_el[1]) },
+    { HV_SYS_REG_VBAR_EL1, offsetof(CPUARMState, cp15.vbar_ns) },
+    { HV_SYS_REG_CONTEXTIDR_EL1, offsetof(CPUARMState, cp15.contextidr_el[1]) },
+    { HV_SYS_REG_TPIDR_EL1, offsetof(CPUARMState, cp15.tpidr_el[1]) },
+    { HV_SYS_REG_CNTKCTL_EL1, offsetof(CPUARMState, cp15.c14_cntkctl) },
+    { HV_SYS_REG_CSSELR_EL1, offsetof(CPUARMState, cp15.csselr_ns) },
+    { HV_SYS_REG_TPIDR_EL0, offsetof(CPUARMState, cp15.tpidr_el[0]) },
+    { HV_SYS_REG_TPIDRRO_EL0, offsetof(CPUARMState, cp15.tpidrro_el[0]) },
+    { HV_SYS_REG_CNTV_CTL_EL0, offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].ctl) },
+    { HV_SYS_REG_CNTV_CVAL_EL0, offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval) },
+    { HV_SYS_REG_SP_EL1, offsetof(CPUARMState, sp_el[1]) },
+};
+
+int hvf_get_registers(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t ret;
+    uint64_t val;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
+        ret = hv_vcpu_get_reg(cpu->hvf->fd, hvf_reg_match[i].reg, &val);
+        *(uint64_t *)((void *)env + hvf_reg_match[i].offset) = val;
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
+        ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
+        *(uint64_t *)((void *)env + hvf_sreg_match[i].offset) = val;
+        assert_hvf_ok(ret);
+    }
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
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
+        val = *(uint64_t *)((void *)env + hvf_reg_match[i].offset);
+        ret = hv_vcpu_set_reg(cpu->hvf->fd, hvf_reg_match[i].reg, val);
+
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
+    for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
+        val = *(uint64_t *)((void *)env + hvf_sreg_match[i].offset);
+        ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, val);
+
+        assert_hvf_ok(ret);
+    }
+
+    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MPIDR_EL1,
+                              arm_cpu->mp_affinity);
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
+    hv_return_t ret;
+
+    env->aarch64 = 1;
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_SCTLR_EL1,
+                              arm_cpu->reset_sctlr);
+    assert_hvf_ok(ret);
+
+    /* We're limited to local hardware caps, override internal versions */
+    ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
+                              &arm_cpu->isar.id_aa64mmfr0);
+
+    return 0;
+}
+
+void hvf_kick_vcpu_thread(CPUState *cpu)
+{
+    if (cpu->hvf->sleeping) {
+        /*
+         * When sleeping, make sure we always send signals. Also, clear the
+         * timespec, so that an IPI that arrives between setting hvf->sleeping
+         * and the nanosleep syscall still aborts the sleep.
+         */
+        cpu->thread_kicked = false;
+        cpu->hvf->ts = (struct timespec){ };
+        cpus_kick_thread(cpu);
+    } else {
+        hv_vcpus_exit(&cpu->hvf->fd, 1);
+    }
+}
+
+static int hvf_inject_interrupts(CPUState *cpu)
+{
+    if (cpu->interrupt_request & CPU_INTERRUPT_FIQ) {
+        DPRINTF("injecting FIQ");
+        hv_vcpu_set_pending_interrupt(cpu->hvf->fd, HV_INTERRUPT_TYPE_FIQ, true);
+    }
+
+    if (cpu->interrupt_request & CPU_INTERRUPT_HARD) {
+        DPRINTF("injecting IRQ");
+        hv_vcpu_set_pending_interrupt(cpu->hvf->fd, HV_INTERRUPT_TYPE_IRQ, true);
+    }
+
+    return 0;
+}
+
+int hvf_vcpu_exec(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
+    hv_return_t r;
+    int ret = 0;
+
+    qemu_mutex_unlock_iothread();
+
+    do {
+        bool advance_pc = false;
+
+        qemu_mutex_lock_iothread();
+        current_cpu = cpu;
+        qemu_wait_io_event_common(cpu);
+        qemu_mutex_unlock_iothread();
+
+        flush_cpu_state(cpu);
+
+        if (hvf_inject_interrupts(cpu)) {
+            return EXCP_INTERRUPT;
+        }
+
+        if (cpu->halted) {
+            qemu_mutex_lock_iothread();
+            return EXCP_HLT;
+        }
+
+        assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));
+
+        /* handle VMEXIT */
+        uint64_t exit_reason = hvf_exit->reason;
+        uint64_t syndrome = hvf_exit->exception.syndrome;
+        uint32_t ec = syn_get_ec(syndrome);
+
+        switch (exit_reason) {
+        case HV_EXIT_REASON_EXCEPTION:
+            /* This is the main one, handle below. */
+            break;
+        case HV_EXIT_REASON_VTIMER_ACTIVATED:
+            qemu_mutex_lock_iothread();
+            current_cpu = cpu;
+            qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+            qemu_mutex_unlock_iothread();
+            continue;
+        case HV_EXIT_REASON_CANCELED:
+            /* we got kicked, no exit to process */
+            continue;
+        default:
+            assert(0);
+        }
+
+        ret = 0;
+        switch (ec) {
+        case EC_DATAABORT: {
+            bool isv = syndrome & ARM_EL_ISV;
+            bool iswrite = (syndrome >> 6) & 1;
+            bool s1ptw = (syndrome >> 7) & 1;
+            uint32_t sas = (syndrome >> 22) & 3;
+            uint32_t len = 1 << sas;
+            uint32_t srt = (syndrome >> 16) & 0x1f;
+            uint64_t val = 0;
+
+            qemu_mutex_lock_iothread();
+            current_cpu = cpu;
+
+            DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
+                    "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
+                    env->pc, hvf_exit->exception.virtual_address,
+                    hvf_exit->exception.physical_address, isv, iswrite,
+                    s1ptw, len, srt);
+
+            assert(isv);
+
+            if (iswrite) {
+                val = hvf_get_reg(cpu, srt);
+                address_space_write(&address_space_memory,
+                                    hvf_exit->exception.physical_address,
+                                    MEMTXATTRS_UNSPECIFIED, &val, len);
+
+                /*
+                 * We do not have a callback to see if the timer is out of
+                 * pending state. That means every MMIO write could
+                 * potentially be an EOI ends the vtimer. Until we get an
+                 * actual callback, let's just see if the timer is still
+                 * pending on every possible toggle point.
+                 */
+                qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 0);
+                hv_vcpu_set_vtimer_mask(cpu->hvf->fd, false);
+            } else {
+                address_space_read(&address_space_memory,
+                                   hvf_exit->exception.physical_address,
+                                   MEMTXATTRS_UNSPECIFIED, &val, len);
+                hvf_set_reg(cpu, srt, val);
+            }
+
+            qemu_mutex_unlock_iothread();
+
+            advance_pc = true;
+            break;
+        }
+        case EC_SYSTEMREGISTERTRAP: {
+            bool isread = (syndrome >> 21) & 1;
+            uint32_t rt = (syndrome >> 5) & 0x1f;
+            uint32_t reg = syndrome & SYSREG_MASK;
+            uint64_t val = 0;
+
+            if (isread) {
+                switch (reg) {
+                case SYSREG_CNTPCT_EL0:
+                    val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
+                          gt_cntfrq_period_ns(arm_cpu);
+                    break;
+                case SYSREG_PMCCNTR_EL0:
+                    val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+                    break;
+                default:
+                    DPRINTF("unhandled sysreg read %08x (op0=%d op1=%d op2=%d "
+                            "crn=%d crm=%d)", reg, (reg >> 20) & 0x3,
+                            (reg >> 14) & 0x7, (reg >> 17) & 0x7,
+                            (reg >> 10) & 0xf, (reg >> 1) & 0xf);
+                    break;
+                }
+
+                hvf_set_reg(cpu, rt, val);
+            } else {
+                val = hvf_get_reg(cpu, rt);
+
+                switch (reg) {
+                case SYSREG_CNTPCT_EL0:
+                    break;
+                default:
+                    DPRINTF("unhandled sysreg write %08x", reg);
+                    break;
+                }
+            }
+
+            advance_pc = true;
+            break;
+        }
+        case EC_WFX_TRAP:
+            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
+                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
+                uint64_t cval, ctl, val, diff, now;
+
+                /* Set up a local timer for vtimer if necessary ... */
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
+                assert_hvf_ok(r);
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
+                assert_hvf_ok(r);
+
+                asm volatile("mrs %0, cntvct_el0" : "=r"(val));
+                diff = cval - val;
+
+                now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
+                      gt_cntfrq_period_ns(arm_cpu);
+
+                /* Timer disabled or masked, just wait for long */
+                if (!(ctl & 1) || (ctl & 2)) {
+                    diff = (120 * NANOSECONDS_PER_SECOND) /
+                           gt_cntfrq_period_ns(arm_cpu);
+                }
+
+                if (diff < INT64_MAX) {
+                    uint64_t ns = diff * gt_cntfrq_period_ns(arm_cpu);
+                    struct timespec *ts = &cpu->hvf->ts;
+
+                    *ts = (struct timespec){
+                        .tv_sec = ns / NANOSECONDS_PER_SECOND,
+                        .tv_nsec = ns % NANOSECONDS_PER_SECOND,
+                    };
+
+                    /*
+                     * Waking up easily takes 1ms, don't go to sleep for smaller
+                     * time periods than 2ms.
+                     */
+                    if (!ts->tv_sec && (ts->tv_nsec < (SCALE_MS * 2))) {
+                        advance_pc = true;
+                        break;
+                    }
+
+                    /* Set cpu->hvf->sleeping so that we get a SIG_IPI signal. */
+                    cpu->hvf->sleeping = true;
+                    smp_mb();
+
+                    /* Bail out if we received an IRQ meanwhile */
+                    if (cpu->thread_kicked || (cpu->interrupt_request &
+                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
+                        cpu->hvf->sleeping = false;
+                        break;
+                    }
+
+                    /* nanosleep returns on signal, so we wake up on kick. */
+                    nanosleep(ts, NULL);
+
+                    /* Out of sleep - either naturally or because of a kick */
+                    cpu->hvf->sleeping = false;
+                }
+
+                advance_pc = true;
+            }
+            break;
+        case EC_AA64_HVC:
+            cpu_synchronize_state(cpu);
+            qemu_mutex_lock_iothread();
+            current_cpu = cpu;
+            if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
+                arm_handle_psci_call(arm_cpu);
+            } else {
+                DPRINTF("unknown HVC! %016llx", env->xregs[0]);
+                env->xregs[0] = -1;
+            }
+            qemu_mutex_unlock_iothread();
+            break;
+        case EC_AA64_SMC:
+            cpu_synchronize_state(cpu);
+            qemu_mutex_lock_iothread();
+            current_cpu = cpu;
+            if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
+                arm_handle_psci_call(arm_cpu);
+            } else {
+                DPRINTF("unknown SMC! %016llx", env->xregs[0]);
+                env->xregs[0] = -1;
+                env->pc += 4;
+            }
+            qemu_mutex_unlock_iothread();
+            break;
+        default:
+            cpu_synchronize_state(cpu);
+            DPRINTF("exit: %llx [ec=0x%x pc=0x%llx]", syndrome, ec, env->pc);
+            error_report("%llx: unhandled exit %llx", env->pc, exit_reason);
+        }
+
+        if (advance_pc) {
+            uint64_t pc;
+
+            flush_cpu_state(cpu);
+
+            r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_PC, &pc);
+            assert_hvf_ok(r);
+            pc += 4;
+            r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
+            assert_hvf_ok(r);
+        }
+    } while (ret == 0);
+
+    qemu_mutex_lock_iothread();
+    current_cpu = cpu;
+
+    return ret;
+}
-- 
2.24.3 (Apple Git-128)


