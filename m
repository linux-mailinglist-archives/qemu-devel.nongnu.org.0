Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE5689BA8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4Y-0006gi-AI; Fri, 03 Feb 2023 09:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4S-0006f3-Nw
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4K-00053d-Ex
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id q8so3999749wmo.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xjR2XR977p7LFkCyD/RSl9r6hvoh3VT3zTXhEMUsJd8=;
 b=ru7LF32+GMvqBKUzoUsMR6hQDS6MrPomUhCpMiIu4ZoAFFr66bVMlWYFkCS6hh23Iw
 IgLAYpMS+il8iceVds/doOrOhUiCA7VHmX38VvX9QiY5FUj/qTC8PE4bM6EQcK/R6hFG
 aMRDrdX/X3VY37PV2zzlcFQTxnf4/Cihh8DHkK4QhaRzz6JiPtsYP6YLBanT+G4F7Exq
 D7Bn1FryShyN/VXvl8KBK1VBBeOP/dpQPqBfPSG/Gm9X0nMpG3+Nws4ck96Fv0b1P0E+
 fpWS851tzn2Bz4jkGJxbnUef3EWyz3h9C9XywAtamcN7bQ2LsK5KrBWCVUlnCWM2U6jT
 aRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjR2XR977p7LFkCyD/RSl9r6hvoh3VT3zTXhEMUsJd8=;
 b=DNa5IS2sM7cpO13Z2BXF8TQhoR7SUAjhKEu+8nrEpkNoUQAABnSmtRYmIBo1kLrhHb
 K3UQmHvUDQ5RWPUiIiDcfORCV1cPiHJfBm3/Cr0qI3bJj3Sp8DP8Bc+H3UdI0z7q+Mjx
 CXfzi4owN4u4lpKaeYzRXqPjkywMQ5HusJ5Ds8m7uik1krRTusejDav7mppd7FIJXn7S
 9U3bioAdw7UU1yaYDfJXnfs7iOPkRQ32JfjT9DHB+t9RRkK3WPxxY5+51RARR+RwYrrL
 3bc+p1Si/6eSzetpIZno+3rw78mVH0Dbiuq9eRx3k1fqXKUDLnMheJKUqgBro5GLpLiQ
 F8iA==
X-Gm-Message-State: AO0yUKWnS3hMnP6ab2Rw1mNE+YL4NbZsMFpnewdVbKyLdmd1g3eri9sn
 tTF33Uot5Tms6uAnoCccAsF6BoRzmLWseKxb
X-Google-Smtp-Source: AK7set9gEhVPQLpmlLdH+cMlkKz/LF/pILwEzgix4el7KrNrvy/ssdEZz4tPHk5SgkL2P6rfIhiVPQ==
X-Received: by 2002:a7b:ce85:0:b0:3dc:50c2:cc1 with SMTP id
 q5-20020a7bce85000000b003dc50c20cc1mr10069615wmj.23.1675434575021; 
 Fri, 03 Feb 2023 06:29:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/33] hvf: arm: Add support for GICv3
Date: Fri,  3 Feb 2023 14:29:01 +0000
Message-Id: <20230203142927.834793-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alexander Graf <agraf@csgraf.de>

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
Message-id: 20230128224459.70676-1-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c   |  16 +++-
 target/arm/hvf/hvf.c        | 151 ++++++++++++++++++++++++++++++++++++
 target/arm/hvf/trace-events |   2 +
 3 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index b17b29288c7..9a7fc190994 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -21,6 +21,8 @@
 #include "hw/irq.h"
 #include "cpu.h"
 #include "target/arm/cpregs.h"
+#include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 
 /*
  * Special case return value from hppvi_index(); must be larger than
@@ -2810,6 +2812,8 @@ void gicv3_init_cpuif(GICv3State *s)
          * which case we'd get the wrong value.
          * So instead we define the regs with no ri->opaque info, and
          * get back to the GICv3CPUState from the CPUARMState.
+         *
+         * These CP regs callbacks can be called from either TCG or HVF code.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
 
@@ -2905,6 +2909,16 @@ void gicv3_init_cpuif(GICv3State *s)
                 define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
             }
         }
-        arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+        if (tcg_enabled() || qtest_enabled()) {
+            /*
+             * We can only trap EL changes with TCG. However the GIC interrupt
+             * state only changes on EL changes involving EL2 or EL3, so for
+             * the non-TCG case this is OK, as EL2 and EL3 can't exist.
+             */
+            arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+        } else {
+            assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
+            assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));
+        }
     }
 }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4b..ad65603445e 100644
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
+                              (reg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK,
+                              (reg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK,
+                              (reg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK,
+                              (reg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK,
+                              (reg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK);
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
index 820e8e02979..4fbbe4b45ec 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -9,3 +9,5 @@ hvf_unknown_hvc(uint64_t x0) "unknown HVC! 0x%016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
 hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
+hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
+hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
-- 
2.34.1


