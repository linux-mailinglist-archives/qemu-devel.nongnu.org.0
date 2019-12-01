Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647310E1DF
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Dec 2019 13:23:18 +0100 (CET)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibOFw-0004Ah-UF
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 07:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1ibODi-0002CH-8I
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 07:20:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1ibODg-0002yV-3N
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 07:20:57 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:60090)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>) id 1ibODf-0002vQ-SF
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 07:20:56 -0500
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by cheepnis.misterjones.org with esmtpsa
 (TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128) (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1ibODY-0007WK-Fh; Sun, 01 Dec 2019 13:20:48 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] target/arm: Add support for missing Jazelle system
 registers
Date: Sun,  1 Dec 2019 12:20:18 +0000
Message-Id: <20191201122018.25808-6-maz@kernel.org>
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

QEMU lacks the minimum Jazelle implementation that is required
by the architecture (everything is RAZ or RAZ/WI). Add it
together with the HCR_EL2.TID0 trapping that goes with it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 target/arm/helper.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0ba08d550a..d6fc198a97 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6040,6 +6040,16 @@ static CPAccessResult access_aa32_tid3(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_jazelle(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TID0)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+
+    return CP_ACCESS_OK;
+}
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -6057,6 +6067,23 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v8_cp_reginfo);
     }
 
+    if (cpu_isar_feature(jazelle, cpu)) {
+        ARMCPRegInfo jazelle_regs[] = {
+            { .name = "JIDR",
+              .cp = 14, .crn = 0, .crm = 0, .opc1 = 7, .opc2 = 0,
+              .access = PL1_R, .accessfn = access_jazelle,
+              .type = ARM_CP_CONST, .resetvalue = 0 },
+            { .name = "JOSCR",
+              .cp = 14, .crn = 1, .crm = 0, .opc1 = 7, .opc2 = 0,
+              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+            { .name = "JMCR",
+              .cp = 14, .crn = 2, .crm = 0, .opc1 = 7, .opc2 = 0,
+              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+            REGINFO_SENTINEL
+        };
+
+        define_arm_cp_regs(cpu, jazelle_regs);
+    }
     if (arm_feature(env, ARM_FEATURE_V6)) {
         /* The ID registers all have impdef reset values */
         ARMCPRegInfo v6_idregs[] = {
-- 
2.20.1


