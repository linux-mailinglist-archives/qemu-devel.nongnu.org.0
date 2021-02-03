Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00E30E080
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:08:32 +0100 (CET)
Received: from localhost ([::1]:57404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ldo-0005G2-05
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LS5-0004xD-An; Wed, 03 Feb 2021 11:56:26 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:29222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LS2-00082b-Lq; Wed, 03 Feb 2021 11:56:24 -0500
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1612371380; h=from:subject:to:date:message-id;
 bh=X2wnTu4NMcpKV+EZTbug/3AW40/hzSkCyt8FKBp28i8=;
 b=OoqbucPfEVYaWadrKJtfu6uNqHghv0HI9WBwwiIfOiKiKt665QkcXETN0VKD4zXxQpYdosFLuXl
 4KSXGl4DWVVVsRMciogQtJqcLsFFbQtuhKRwdEOLAPe56BOaQyP7ALDh8IltgP7SxVX+HisRoY0vt
 ugmbUvbxieFQuKNYlzQizgSoz968MYHFWmjTWHL2CpC/Q8YgILurtoxMRnmUlNYrQVQVJ2JF5jKGB
 qvvydmZVDOZBrhiM7WWoVvzB0AzlFUyWZDV4mhSK2IAYRpXCAMCl29wOZ+yKRhwgW5AQm62FC7Uun
 vFAc9+lHMWXyZZxZAjUnyPKS2WmMGNeaGuHQ==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge06.gtri.dmz
 (10.41.104.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Wed, 3 Feb 2021
 11:56:20 -0500
Received: from localhost.localdomain (10.41.0.30) by tybee.core.gtri.org
 (10.41.1.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Wed, 3 Feb
 2021 11:56:19 -0500
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
Date: Wed, 3 Feb 2021 11:55:52 -0500
Message-ID: <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
MIME-Version: 1.0
X-ClientProxiedBy: hatteras.core.gtri.org (10.41.22.72) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-devel@nongnu.org>

The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
to 1 only when there is no support for AArch32 at EL1 or above.

The reset value will be 0x30 only if the CPU is AArch64-only; if there
is support for AArch32 at EL1 or above, it will be reset to 0.

Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
is supported at EL1 or above.

Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 16 ++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d080239863..39633f73f3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4033,6 +4033,11 @@ static inline bool isar_feature_aa64_aa32(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL0) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47e266d7e6..e529cdbfd0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2024,7 +2024,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
 
     if (ri->state == ARM_CP_STATE_AA64) {
-        value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
+        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
+                value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
+        }
         valid_mask &= ~SCR_NET;
 
         if (cpu_isar_feature(aa64_lor, cpu)) {
@@ -2063,6 +2066,15 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     raw_write(env, ri, value);
 }
 
+static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /*
+     * scr_write will set the RES1 bits on an AArch64-only CPU.
+     * The reset value will be 0x30 on an AArch64-only CPU and 0 otherwise.
+     */
+    scr_write(env, ri, 0);
+}
+
 static CPAccessResult access_aa64_tid2(CPUARMState *env,
                                        const ARMCPRegInfo *ri,
                                        bool isread)
@@ -5785,7 +5797,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
-      .resetvalue = 0, .writefn = scr_write },
+      .resetfn = scr_reset, .writefn = scr_write },
     { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-- 
2.20.1


