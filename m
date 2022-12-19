Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FBE651550
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7OJ4-0007i9-SZ; Mon, 19 Dec 2022 17:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7OIz-0007hY-J0; Mon, 19 Dec 2022 17:08:20 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7OIv-0003o3-7R; Mon, 19 Dec 2022 17:08:15 -0500
Received: from localhost.localdomain
 (dynamic-077-002-090-134.77.2.pool.telefonica.de [77.2.90.134])
 by csgraf.de (Postfix) with ESMTPSA id D1CBF60806FC;
 Mon, 19 Dec 2022 23:08:09 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH] hvf: arm: Add support for GICv3
Date: Mon, 19 Dec 2022 23:08:08 +0100
Message-Id: <20221219220808.26392-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We currently only support GICv2 emulation. To also support GICv3, we will
need to pass a few system registers into their respective handler functions.

This patch adds support for HVF to call into the TCG callbacks for GICv3
system register handlers. This is safe because the GICv3 TCG code is generic
as long as we limit ourselves to EL0 and EL1 - which are the only modes
supported by HVF.

To make sure nobody trips over that, we also annotate callbacks that don't
work in HVF mode, such as EL state change hooks.

With GICv3 support in place, we can run with more than 8 vCPUs.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/intc/arm_gicv3_cpuif.c   |   8 +-
 target/arm/hvf/hvf.c        | 151 ++++++++++++++++++++++++++++++++++++
 target/arm/hvf/trace-events |   2 +
 3 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index b17b29288c..b4e387268c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "cpu.h"
 #include "target/arm/cpregs.h"
+#include "sysemu/tcg.h"
 
 /*
  * Special case return value from hppvi_index(); must be larger than
@@ -2810,6 +2811,8 @@ void gicv3_init_cpuif(GICv3State *s)
          * which case we'd get the wrong value.
          * So instead we define the regs with no ri->opaque info, and
          * get back to the GICv3CPUState from the CPUARMState.
+         *
+         * These CP regs callbacks can be called from either TCG or HVF code.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
 
@@ -2905,6 +2908,9 @@ void gicv3_init_cpuif(GICv3State *s)
                 define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
             }
         }
-        arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+        if (tcg_enabled()) {
+            /* We can only trap EL changes with TCG for now */
+            arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+        }
     }
 }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..8ea4be5f30 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -80,6 +80,33 @@
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
 
+#define SYSREG_ICC_AP0R0_EL1     SYSREG(3, 0, 12, 8, 4)
+#define SYSREG_ICC_AP0R1_EL1     SYSREG(3, 0, 12, 8, 5)
+#define SYSREG_ICC_AP0R2_EL1     SYSREG(3, 0, 12, 8, 6)
+#define SYSREG_ICC_AP0R3_EL1     SYSREG(3, 0, 12, 8, 7)
+#define SYSREG_ICC_AP1R0_EL1     SYSREG(3, 0, 12, 9, 0)
+#define SYSREG_ICC_AP1R1_EL1     SYSREG(3, 0, 12, 9, 1)
+#define SYSREG_ICC_AP1R2_EL1     SYSREG(3, 0, 12, 9, 2)
+#define SYSREG_ICC_AP1R3_EL1     SYSREG(3, 0, 12, 9, 3)
+#define SYSREG_ICC_ASGI1R_EL1    SYSREG(3, 0, 12, 11, 6)
+#define SYSREG_ICC_BPR0_EL1      SYSREG(3, 0, 12, 8, 3)
+#define SYSREG_ICC_BPR1_EL1      SYSREG(3, 0, 12, 12, 3)
+#define SYSREG_ICC_CTLR_EL1      SYSREG(3, 0, 12, 12, 4)
+#define SYSREG_ICC_DIR_EL1       SYSREG(3, 0, 12, 11, 1)
+#define SYSREG_ICC_EOIR0_EL1     SYSREG(3, 0, 12, 8, 1)
+#define SYSREG_ICC_EOIR1_EL1     SYSREG(3, 0, 12, 12, 1)
+#define SYSREG_ICC_HPPIR0_EL1    SYSREG(3, 0, 12, 8, 2)
+#define SYSREG_ICC_HPPIR1_EL1    SYSREG(3, 0, 12, 12, 2)
+#define SYSREG_ICC_IAR0_EL1      SYSREG(3, 0, 12, 8, 0)
+#define SYSREG_ICC_IAR1_EL1      SYSREG(3, 0, 12, 12, 0)
+#define SYSREG_ICC_IGRPEN0_EL1   SYSREG(3, 0, 12, 12, 6)
+#define SYSREG_ICC_IGRPEN1_EL1   SYSREG(3, 0, 12, 12, 7)
+#define SYSREG_ICC_PMR_EL1       SYSREG(3, 0, 4, 6, 0)
+#define SYSREG_ICC_RPR_EL1       SYSREG(3, 0, 12, 11, 3)
+#define SYSREG_ICC_SGI0R_EL1     SYSREG(3, 0, 12, 11, 7)
+#define SYSREG_ICC_SGI1R_EL1     SYSREG(3, 0, 12, 11, 5)
+#define SYSREG_ICC_SRE_EL1       SYSREG(3, 0, 12, 12, 5)
+
 #define WFX_IS_WFE (1 << 0)
 
 #define TMR_CTL_ENABLE  (1 << 0)
@@ -788,6 +815,43 @@ static bool is_id_sysreg(uint32_t reg)
            SYSREG_CRM(reg) < 8;
 }
 
+static uint32_t hvf_reg2cp_reg(uint32_t reg)
+{
+    return ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
+                              (reg >> 10) & 0xf,
+                              (reg >> 1) & 0xf,
+                              (reg >> 20) & 0x3,
+                              (reg >> 14) & 0x7,
+                              (reg >> 17) & 0x7);
+}
+
+static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+    if (ri) {
+        if (ri->accessfn) {
+            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
+                return false;
+            }
+        }
+        if (ri->type & ARM_CP_CONST) {
+            *val = ri->resetvalue;
+        } else if (ri->readfn) {
+            *val = ri->readfn(env, ri);
+        } else {
+            *val = CPREG_FIELD64(env, ri);
+        }
+        trace_hvf_vgic_read(ri->name, *val);
+        return true;
+    }
+
+    return false;
+}
+
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -839,6 +903,36 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_ICC_AP0R0_EL1:
+    case SYSREG_ICC_AP0R1_EL1:
+    case SYSREG_ICC_AP0R2_EL1:
+    case SYSREG_ICC_AP0R3_EL1:
+    case SYSREG_ICC_AP1R0_EL1:
+    case SYSREG_ICC_AP1R1_EL1:
+    case SYSREG_ICC_AP1R2_EL1:
+    case SYSREG_ICC_AP1R3_EL1:
+    case SYSREG_ICC_ASGI1R_EL1:
+    case SYSREG_ICC_BPR0_EL1:
+    case SYSREG_ICC_BPR1_EL1:
+    case SYSREG_ICC_DIR_EL1:
+    case SYSREG_ICC_EOIR0_EL1:
+    case SYSREG_ICC_EOIR1_EL1:
+    case SYSREG_ICC_HPPIR0_EL1:
+    case SYSREG_ICC_HPPIR1_EL1:
+    case SYSREG_ICC_IAR0_EL1:
+    case SYSREG_ICC_IAR1_EL1:
+    case SYSREG_ICC_IGRPEN0_EL1:
+    case SYSREG_ICC_IGRPEN1_EL1:
+    case SYSREG_ICC_PMR_EL1:
+    case SYSREG_ICC_SGI0R_EL1:
+    case SYSREG_ICC_SGI1R_EL1:
+    case SYSREG_ICC_SRE_EL1:
+    case SYSREG_ICC_CTLR_EL1:
+        /* Call the TCG sysreg handler. This is only safe for GICv3 regs. */
+        if (!hvf_sysreg_read_cp(cpu, reg, &val)) {
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
+        break;
     default:
         if (is_id_sysreg(reg)) {
             /* ID system registers read as RES0 */
@@ -944,6 +1038,33 @@ static void pmswinc_write(CPUARMState *env, uint64_t value)
     }
 }
 
+static bool hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+
+    if (ri) {
+        if (ri->accessfn) {
+            if (ri->accessfn(env, ri, false) != CP_ACCESS_OK) {
+                return false;
+            }
+        }
+        if (ri->writefn) {
+            ri->writefn(env, ri, val);
+        } else {
+            CPREG_FIELD64(env, ri) = val;
+        }
+
+        trace_hvf_vgic_write(ri->name, val);
+        return true;
+    }
+
+    return false;
+}
+
 static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -1021,6 +1142,36 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_ICC_AP0R0_EL1:
+    case SYSREG_ICC_AP0R1_EL1:
+    case SYSREG_ICC_AP0R2_EL1:
+    case SYSREG_ICC_AP0R3_EL1:
+    case SYSREG_ICC_AP1R0_EL1:
+    case SYSREG_ICC_AP1R1_EL1:
+    case SYSREG_ICC_AP1R2_EL1:
+    case SYSREG_ICC_AP1R3_EL1:
+    case SYSREG_ICC_ASGI1R_EL1:
+    case SYSREG_ICC_BPR0_EL1:
+    case SYSREG_ICC_BPR1_EL1:
+    case SYSREG_ICC_CTLR_EL1:
+    case SYSREG_ICC_DIR_EL1:
+    case SYSREG_ICC_EOIR0_EL1:
+    case SYSREG_ICC_EOIR1_EL1:
+    case SYSREG_ICC_HPPIR0_EL1:
+    case SYSREG_ICC_HPPIR1_EL1:
+    case SYSREG_ICC_IAR0_EL1:
+    case SYSREG_ICC_IAR1_EL1:
+    case SYSREG_ICC_IGRPEN0_EL1:
+    case SYSREG_ICC_IGRPEN1_EL1:
+    case SYSREG_ICC_PMR_EL1:
+    case SYSREG_ICC_SGI0R_EL1:
+    case SYSREG_ICC_SGI1R_EL1:
+    case SYSREG_ICC_SRE_EL1:
+        /* Call the TCG sysreg handler. This is only safe for GICv3 regs. */
+        if (!hvf_sysreg_write_cp(cpu, reg, val)) {
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index 820e8e0297..4fbbe4b45e 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -9,3 +9,5 @@ hvf_unknown_hvc(uint64_t x0) "unknown HVC! 0x%016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
 hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
+hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
+hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
-- 
2.37.1 (Apple Git-137.1)


