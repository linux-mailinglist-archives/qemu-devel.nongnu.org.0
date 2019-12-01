Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1A10E1DD
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Dec 2019 13:23:16 +0100 (CET)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibOFv-0004A6-0A
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 07:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1ibODi-0002CJ-UO
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 07:21:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1ibODf-0002y6-VH
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 07:20:58 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:49406)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>) id 1ibODf-0002vO-HE
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 07:20:55 -0500
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by cheepnis.misterjones.org with esmtpsa
 (TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128) (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1ibODW-0007WK-JM; Sun, 01 Dec 2019 13:20:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] target/arm: Honor HCR_EL2.TID2 trapping requirements
Date: Sun,  1 Dec 2019 12:20:14 +0000
Message-Id: <20191201122018.25808-2-maz@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191201122018.25808-1-maz@kernel.org>
References: <20191201122018.25808-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, kvmarm@lists.cs.columbia.edu,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 edgar.iglesias@xilinx.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 213.251.177.50
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HCR_EL2.TID2 mandates that access from EL1 to CTR_EL0, CCSIDR_EL1,
CCSIDR2_EL1, CLIDR_EL1, CSSELR_EL1 are trapped to EL2, and QEMU
completely ignores it, making it impossible for hypervisors to
virtualize the cache hierarchy.

Do the right thing by trapping to EL2 if HCR_EL2.TID2 is set.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 target/arm/helper.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0bf8f53d4b..1e546096b8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1910,6 +1910,17 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     raw_write(env, ri, value);
 }
 
+static CPAccessResult access_aa64_tid2(CPUARMState *env,
+                                       const ARMCPRegInfo *ri,
+                                       bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TID2)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+
+    return CP_ACCESS_OK;
+}
+
 static uint64_t ccsidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -2110,10 +2121,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .writefn = pmintenclr_write },
     { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
-      .access = PL1_R, .readfn = ccsidr_read, .type = ARM_CP_NO_RAW },
+      .access = PL1_R,
+      .accessfn = access_aa64_tid2,
+      .readfn = ccsidr_read, .type = ARM_CP_NO_RAW },
     { .name = "CSSELR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 2, .opc2 = 0,
-      .access = PL1_RW, .writefn = csselr_write, .resetvalue = 0,
+      .access = PL1_RW,
+      .accessfn = access_aa64_tid2,
+      .writefn = csselr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.csselr_s),
                              offsetof(CPUARMState, cp15.csselr_ns) } },
     /* Auxiliary ID register: this actually has an IMPDEF value but for now
@@ -5204,6 +5219,11 @@ static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
     if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UCT)) {
         return CP_ACCESS_TRAP;
     }
+
+    if (arm_current_el(env) < 2 && arm_hcr_el2_eff(env) & HCR_TID2) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+
     return CP_ACCESS_OK;
 }
 
@@ -6184,7 +6204,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
-            .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = cpu->clidr
+            .access = PL1_R, .type = ARM_CP_CONST,
+            .accessfn = access_aa64_tid2,
+            .resetvalue = cpu->clidr
         };
         define_one_arm_cp_reg(cpu, &clidr);
         define_arm_cp_regs(cpu, v7_cp_reginfo);
@@ -6717,7 +6739,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             /* These are common to v8 and pre-v8 */
             { .name = "CTR",
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 1,
-              .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = cpu->ctr },
+              .access = PL1_R, .accessfn = ctr_el0_access,
+              .type = ARM_CP_CONST, .resetvalue = cpu->ctr },
             { .name = "CTR_EL0", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .opc2 = 1, .crn = 0, .crm = 0,
               .access = PL0_R, .accessfn = ctr_el0_access,
-- 
2.20.1


