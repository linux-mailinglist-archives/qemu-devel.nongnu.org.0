Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC166E1A1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:05:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnVh-000624-GT; Tue, 17 Jan 2023 10:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHnVW-0005zZ-NE; Tue, 17 Jan 2023 10:04:16 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHnVU-0000WP-UC; Tue, 17 Jan 2023 10:04:14 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1708420DFE9B;
 Tue, 17 Jan 2023 07:04:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1708420DFE9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673967851;
 bh=JQI/hQq9twRi2qAs9giuU1jaByhc7XoUTrhQigrCPCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gkn8fwjp38JylkJisxsb8UEpnbDf7/IFS1TLkEAdlyD5Qi6+KUnM2xcxQyO5J7LPb
 GJ8TMC2tik1uNTtyDOfSuu7n5U3jjSFRYcDK0kP4VVuEb7zND39JNUg9znsLEA8Wks
 inQIOqnfC+HfseKddtteV8Y+UAMvdEKmpVObxVm4=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 1/2] target/arm: implement DBGCLAIM registers
Date: Tue, 17 Jan 2023 16:04:04 +0100
Message-Id: <20230117150405.2940-2-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
References: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

The architecture does not define any functionality for the CLAIM tag bits.
So we will just keep the raw bits, as per spec.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b4bd20f9d..eddec155b0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -494,6 +494,7 @@ typedef struct CPUArchState {
         uint64_t dbgbcr[16]; /* breakpoint control registers */
         uint64_t dbgwvr[16]; /* watchpoint value registers */
         uint64_t dbgwcr[16]; /* watchpoint control registers */
+        uint64_t dbgclaim;   /* DBGCLAIM bits */
         uint64_t mdscr_el1;
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t osdlr_el1; /* OS DoubleLock status */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c21739242c..6c34c6e27d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -629,6 +629,29 @@ static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void dbgclaimset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim |= (value & 0xFF);
+}
+
+static uint64_t dbgclaimset_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* CLAIM bits are RAO */
+    return 0xFF;
+}
+
+static void dbgclaimclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim &= ~(value & 0xFF);
+}
+
+static void dbgclaimclr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+{
+    env->cp15.dbgclaim = value;
+}
+
 static const ARMCPRegInfo debug_cp_reginfo[] = {
     /*
      * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
@@ -712,6 +735,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
+    /*
+     * Dummy DBGCLAIM registers.
+     * "The architecture does not define any functionality for the CLAIM tag bits.",
+     * so we only keep the raw bits
+     */
+    { .name = "DBGCLAIMSET_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
+      .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimset_write, .readfn = dbgclaimset_read },
+    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimclr_write, .raw_writefn = dbgclaimclr_raw_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
 };
 
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
-- 
2.34.1


