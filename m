Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70AC4AF23F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:01:32 +0100 (CET)
Received: from localhost ([::1]:44732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmbD-0003zb-0s
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:01:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHmIW-0000KM-3O; Wed, 09 Feb 2022 07:42:12 -0500
Received: from mail.csgraf.de ([85.25.223.15]:35084 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHmIS-0006zB-By; Wed, 09 Feb 2022 07:42:11 -0500
Received: from localhost.localdomain
 (dynamic-095-115-119-071.95.115.pool.telefonica.de [95.115.119.71])
 by csgraf.de (Postfix) with ESMTPSA id 2F8A860806B1;
 Wed,  9 Feb 2022 13:41:36 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 1/2] hvf: arm: Use macros for sysreg shift/masking
Date: Wed,  9 Feb 2022 13:41:34 +0100
Message-Id: <20220209124135.69183-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are parsing the syndrome field for sysregs in multiple places across
the hvf code, but repeat shift/mask operations with hard coded constants
every time. This is an error prone approach and makes it harder to reason
about the correctness of these operations.

Let's introduce macros that allow us to unify the constants used as well
as create new helpers to extract fields from the sysreg value.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 69 ++++++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 92ad0d29c4..8d0447ab01 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -35,9 +35,34 @@
         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
 #define PL1_WRITE_MASK 0x4
 
+#define SYSREG_OP0_SHIFT      20
+#define SYSREG_OP0_MASK       0x3
+#define SYSREG_OP0(sysreg)    ((sysreg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK)
+#define SYSREG_OP1_SHIFT      14
+#define SYSREG_OP1_MASK       0x7
+#define SYSREG_OP1(sysreg)    ((sysreg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK)
+#define SYSREG_CRN_SHIFT      10
+#define SYSREG_CRN_MASK       0xf
+#define SYSREG_CRN(sysreg)    ((sysreg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK)
+#define SYSREG_CRM_SHIFT      1
+#define SYSREG_CRM_MASK       0xf
+#define SYSREG_CRM(sysreg)    ((sysreg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK)
+#define SYSREG_OP2_SHIFT      17
+#define SYSREG_OP2_MASK       0x7
+#define SYSREG_OP2(sysreg)    ((sysreg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK)
+
 #define SYSREG(op0, op1, crn, crm, op2) \
-    ((op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (crm << 1))
-#define SYSREG_MASK           SYSREG(0x3, 0x7, 0xf, 0xf, 0x7)
+    ((op0 << SYSREG_OP0_SHIFT) | \
+     (op1 << SYSREG_OP1_SHIFT) | \
+     (crn << SYSREG_CRN_SHIFT) | \
+     (crm << SYSREG_CRM_SHIFT) | \
+     (op2 << SYSREG_OP2_SHIFT))
+#define SYSREG_MASK \
+    SYSREG(SYSREG_OP0_MASK, \
+           SYSREG_OP1_MASK, \
+           SYSREG_CRN_MASK, \
+           SYSREG_CRM_MASK, \
+           SYSREG_OP2_MASK)
 #define SYSREG_OSLAR_EL1      SYSREG(2, 0, 1, 0, 4)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
@@ -783,21 +808,21 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_read(env->pc, reg,
-                                        (reg >> 20) & 0x3,
-                                        (reg >> 14) & 0x7,
-                                        (reg >> 10) & 0xf,
-                                        (reg >> 1) & 0xf,
-                                        (reg >> 17) & 0x7);
+                                        SYSREG_OP0(reg),
+                                        SYSREG_OP1(reg),
+                                        SYSREG_CRN(reg),
+                                        SYSREG_CRM(reg),
+                                        SYSREG_OP2(reg));
         hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         return 1;
     }
 
     trace_hvf_sysreg_read(reg,
-                          (reg >> 20) & 0x3,
-                          (reg >> 14) & 0x7,
-                          (reg >> 10) & 0xf,
-                          (reg >> 1) & 0xf,
-                          (reg >> 17) & 0x7,
+                          SYSREG_OP0(reg),
+                          SYSREG_OP1(reg),
+                          SYSREG_CRN(reg),
+                          SYSREG_CRM(reg),
+                          SYSREG_OP2(reg),
                           val);
     hvf_set_reg(cpu, rt, val);
 
@@ -886,11 +911,11 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     CPUARMState *env = &arm_cpu->env;
 
     trace_hvf_sysreg_write(reg,
-                           (reg >> 20) & 0x3,
-                           (reg >> 14) & 0x7,
-                           (reg >> 10) & 0xf,
-                           (reg >> 1) & 0xf,
-                           (reg >> 17) & 0x7,
+                           SYSREG_OP0(reg),
+                           SYSREG_OP1(reg),
+                           SYSREG_CRN(reg),
+                           SYSREG_CRM(reg),
+                           SYSREG_OP2(reg),
                            val);
 
     switch (reg) {
@@ -960,11 +985,11 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
-                                         (reg >> 20) & 0x3,
-                                         (reg >> 14) & 0x7,
-                                         (reg >> 10) & 0xf,
-                                         (reg >> 1) & 0xf,
-                                         (reg >> 17) & 0x7);
+                                         SYSREG_OP0(reg),
+                                         SYSREG_OP1(reg),
+                                         SYSREG_CRN(reg),
+                                         SYSREG_CRM(reg),
+                                         SYSREG_OP2(reg));
         hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         return 1;
     }
-- 
2.32.0 (Apple Git-132)


