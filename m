Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850846951F7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:36:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfUd-0004Xk-HN; Mon, 13 Feb 2023 15:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfUa-0004We-V4; Mon, 13 Feb 2023 15:32:04 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfUW-0002bI-R7; Mon, 13 Feb 2023 15:32:04 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7EA8A22341;
 Mon, 13 Feb 2023 20:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676320319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XlnqXV4veeMU994JRh9Svsi0aidvjdzZDi6uW4Ich0=;
 b=VvOoYHtHSIjMXc42cAZxJAaSRG+SVlW45cWA2lIWo88SMRnKw79ZW8WKChATAsC3Kqt+jM
 LqB0xZZ3N9UUurgjWwFANUdPqVcXlSJqGkwVQAW6HIK5Bh02heBg+dcRhkoO8WDSQIg+9w
 yWY7syIfMYib7fq+TfgCZtLHTtQXu5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676320319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XlnqXV4veeMU994JRh9Svsi0aidvjdzZDi6uW4Ich0=;
 b=IyhlVBL4s+ECt6hbz1d8F0Z4lG2rPobVNAy4tgm6gTvorNRheDF98JQ6YB3sfJRbSQyhtw
 J7XCZzLLSV8a2fCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 715D41391B;
 Mon, 13 Feb 2023 20:31:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SD/eDTye6mOVMwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RESEND v5 07/28] target/arm: Move define_debug_regs() to
 cpregs.c
Date: Mon, 13 Feb 2023 17:29:06 -0300
Message-Id: <20230213202927.28992-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The debug_helper.c file will move into a tcg-specific directory, so
take the cpregs code out of it. That code needs to be present in KVM
builds as well.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpregs.c       | 473 ++++++++++++++++++++++++++++++++++++++
 target/arm/debug_helper.c | 459 ------------------------------------
 target/arm/internals.h    |   9 -
 3 files changed, 473 insertions(+), 468 deletions(-)

diff --git a/target/arm/cpregs.c b/target/arm/cpregs.c
index e87a11fe48..80a810e641 100644
--- a/target/arm/cpregs.c
+++ b/target/arm/cpregs.c
@@ -16,6 +16,7 @@
 #include "exec/exec-all.h"
 #include "hw/irq.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #include "cpregs.h"
@@ -287,6 +288,287 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
     return CP_ACCESS_TRAP_UNCATEGORIZED;
 }
 
+static uint64_t arm_mdcr_el2_eff(CPUARMState *env)
+{
+    return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
+}
+
+/*
+ * Check for traps to "powerdown debug" registers, which are controlled
+ * by MDCR.TDOSA
+ */
+static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdosa = (mdcr_el2 & MDCR_TDOSA) || (mdcr_el2 & MDCR_TDE) ||
+        (arm_hcr_el2_eff(env) & HCR_TGE);
+
+    if (el < 2 && mdcr_el2_tdosa) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+/*
+ * Check for traps to "debug ROM" registers, which are controlled
+ * by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.
+ */
+static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdra = (mdcr_el2 & MDCR_TDRA) || (mdcr_el2 & MDCR_TDE) ||
+        (arm_hcr_el2_eff(env) & HCR_TGE);
+
+    if (el < 2 && mdcr_el2_tdra) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+/*
+ * Check for traps to general debug registers, which are controlled
+ * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
+ */
+static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
+        (arm_hcr_el2_eff(env) & HCR_TGE);
+
+    if (el < 2 && mdcr_el2_tda) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+/*
+ * Check for traps to Debug Comms Channel registers. If FEAT_FGT
+ * is implemented then these are controlled by MDCR_EL2.TDCC for
+ * EL2 and MDCR_EL3.TDCC for EL3. They are also controlled by
+ * the general debug access trap bits MDCR_EL2.TDA and MDCR_EL3.TDA.
+ */
+static CPAccessResult access_tdcc(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
+        (arm_hcr_el2_eff(env) & HCR_TGE);
+    bool mdcr_el2_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (mdcr_el2 & MDCR_TDCC);
+    bool mdcr_el3_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (env->cp15.mdcr_el3 & MDCR_TDCC);
+
+    if (el < 2 && (mdcr_el2_tda || mdcr_el2_tdcc)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && ((env->cp15.mdcr_el3 & MDCR_TDA) || mdcr_el3_tdcc)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    /*
+     * Writes to OSLAR_EL1 may update the OS lock status, which can be
+     * read via a bit in OSLSR_EL1.
+     */
+    int oslock;
+
+    if (ri->state == ARM_CP_STATE_AA32) {
+        oslock = (value == 0xC5ACCE55);
+    } else {
+        oslock = value & 1;
+    }
+
+    env->cp15.oslsr_el1 = deposit32(env->cp15.oslsr_el1, 1, 1, oslock);
+}
+
+static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    /*
+     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
+     * implemented this is RAZ/WI.
+     */
+    if (arm_feature(env, ARM_FEATURE_AARCH64)
+       ? cpu_isar_feature(aa64_doublelock, cpu)
+       : cpu_isar_feature(aa32_doublelock, cpu)) {
+        env->cp15.osdlr_el1 = value & 1;
+    }
+}
+
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
+static const ARMCPRegInfo debug_cp_reginfo[] = {
+    /*
+     * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
+     * debug components. The AArch64 version of DBGDRAR is named MDRAR_EL1;
+     * unlike DBGDRAR it is never accessible from EL0.
+     * DBGDSAR is deprecated and must RAZ from v8 anyway, so it has no AArch64
+     * accessor.
+     */
+    { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
+      .access = PL0_R, .accessfn = access_tdra,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "MDRAR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
+      .access = PL1_R, .accessfn = access_tdra,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
+      .access = PL0_R, .accessfn = access_tdra,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
+    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_MDSCR_EL1,
+      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
+      .resetvalue = 0 },
+    /*
+     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
+     * Debug Communication Channel is not implemented.
+     */
+    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
+      .access = PL0_R, .accessfn = access_tdcc,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
+     * It is a component of the Debug Communications Channel, which is not implemented.
+     */
+    { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tdcc,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tdcc,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * OSECCR_EL1 provides a mechanism for an operating system
+     * to access the contents of EDECCR. EDECCR is not implemented though,
+     * as is the rest of external device mechanism.
+     */
+    { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_OSECCR_EL1,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
+     * it is unlikely a guest will care.
+     * We don't implement the configurable EL0 access.
+     */
+    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
+      .cp = 14, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
+      .type = ARM_CP_ALIAS,
+      .access = PL1_R, .accessfn = access_tda,
+      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
+    { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .accessfn = access_tdosa,
+      .fgt = FGT_OSLAR_EL1,
+      .writefn = oslar_write },
+    { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
+      .access = PL1_R, .resetvalue = 10,
+      .accessfn = access_tdosa,
+      .fgt = FGT_OSLSR_EL1,
+      .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
+    /* Dummy OSDLR_EL1: 32-bit Linux will read this */
+    { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
+      .access = PL1_RW, .accessfn = access_tdosa,
+      .fgt = FGT_OSDLR_EL1,
+      .writefn = osdlr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.osdlr_el1) },
+    /*
+     * Dummy DBGVCR: Linux wants to clear this on startup, but we don't
+     * implement vector catch debug events yet.
+     */
+    { .name = "DBGVCR",
+      .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_NOP },
+    /*
+     * Dummy DBGVCR32_EL2 (which is only for a 64-bit hypervisor
+     * to save and restore a 32-bit guest's DBGVCR)
+     */
+    { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .accessfn = access_tda,
+      .type = ARM_CP_NOP | ARM_CP_EL3_NO_EL2_KEEP },
+    /*
+     * Dummy MDCCINT_EL1, since we don't implement the Debug Communications
+     * Channel but Linux may try to access this register. The 32-bit
+     * alias is DBGDCCINT.
+     */
+    { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_tdcc,
+      .type = ARM_CP_NOP },
+    /*
+     * Dummy DBGCLAIM registers.
+     * "The architecture does not define any functionality for the CLAIM tag bits.",
+     * so we only keep the raw bits
+     */
+    { .name = "DBGCLAIMSET_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
+      .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_DBGCLAIM,
+      .writefn = dbgclaimset_write, .readfn = dbgclaimset_read },
+    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_DBGCLAIM,
+      .writefn = dbgclaimclr_write, .raw_writefn = raw_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
+};
+
+static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
+    /* 64 bit access versions of the (dummy) debug registers */
+    { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+};
 /*
  * Check for traps to performance monitor registers, which are controlled
  * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
@@ -6604,6 +6886,197 @@ static const ARMCPRegInfo sme_reginfo[] = {
 };
 #endif /* TARGET_AARCH64 */
 
+static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int i = ri->crm;
+
+    /*
+     * Bits [1:0] are RES0.
+     *
+     * It is IMPLEMENTATION DEFINED whether [63:49] ([63:53] with FEAT_LVA)
+     * are hardwired to the value of bit [48] ([52] with FEAT_LVA), or if
+     * they contain the value written.  It is CONSTRAINED UNPREDICTABLE
+     * whether the RESS bits are ignored when comparing an address.
+     *
+     * Therefore we are allowed to compare the entire register, which lets
+     * us avoid considering whether or not FEAT_LVA is actually enabled.
+     */
+    value &= ~3ULL;
+
+    raw_write(env, ri, value);
+
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
+}
+
+static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int i = ri->crm;
+
+    raw_write(env, ri, value);
+
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
+}
+
+static void dbgbvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int i = ri->crm;
+
+    raw_write(env, ri, value);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
+}
+
+static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int i = ri->crm;
+
+    /*
+     * BAS[3] is a read-only copy of BAS[2], and BAS[1] a read-only
+     * copy of BAS[0].
+     */
+    value = deposit64(value, 6, 1, extract64(value, 5, 1));
+    value = deposit64(value, 8, 1, extract64(value, 7, 1));
+
+    raw_write(env, ri, value);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
+}
+
+static void define_debug_regs(ARMCPU *cpu)
+{
+    /*
+     * Define v7 and v8 architectural debug registers.
+     * These are just dummy implementations for now.
+     */
+    int i;
+    int wrps, brps, ctx_cmps;
+
+    /*
+     * The Arm ARM says DBGDIDR is optional and deprecated if EL1 cannot
+     * use AArch32.  Given that bit 15 is RES1, if the value is 0 then
+     * the register must not exist for this cpu.
+     */
+    if (cpu->isar.dbgdidr != 0) {
+        ARMCPRegInfo dbgdidr = {
+            .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0,
+            .opc1 = 0, .opc2 = 0,
+            .access = PL0_R, .accessfn = access_tda,
+            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdidr,
+        };
+        define_one_arm_cp_reg(cpu, &dbgdidr);
+    }
+
+    /*
+     * DBGDEVID is present in the v7 debug architecture if
+     * DBGDIDR.DEVID_imp is 1 (bit 15); from v7.1 and on it is
+     * mandatory (and bit 15 is RES1). DBGDEVID1 and DBGDEVID2 exist
+     * from v7.1 of the debug architecture. Because no fields have yet
+     * been defined in DBGDEVID2 (and quite possibly none will ever
+     * be) we don't define an ARMISARegisters field for it.
+     * These registers exist only if EL1 can use AArch32, but that
+     * happens naturally because they are only PL1 accessible anyway.
+     */
+    if (extract32(cpu->isar.dbgdidr, 15, 1)) {
+        ARMCPRegInfo dbgdevid = {
+            .name = "DBGDEVID",
+            .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 2, .crn = 7,
+            .access = PL1_R, .accessfn = access_tda,
+            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid,
+        };
+        define_one_arm_cp_reg(cpu, &dbgdevid);
+    }
+    if (cpu_isar_feature(aa32_debugv7p1, cpu)) {
+        ARMCPRegInfo dbgdevid12[] = {
+            {
+                .name = "DBGDEVID1",
+                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 1, .crn = 7,
+                .access = PL1_R, .accessfn = access_tda,
+                .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid1,
+            }, {
+                .name = "DBGDEVID2",
+                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 0, .crn = 7,
+                .access = PL1_R, .accessfn = access_tda,
+                .type = ARM_CP_CONST, .resetvalue = 0,
+            },
+        };
+        define_arm_cp_regs(cpu, dbgdevid12);
+    }
+
+    brps = arm_num_brps(cpu);
+    wrps = arm_num_wrps(cpu);
+    ctx_cmps = arm_num_ctx_cmps(cpu);
+
+    assert(ctx_cmps <= brps);
+
+    define_arm_cp_regs(cpu, debug_cp_reginfo);
+
+    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
+        define_arm_cp_regs(cpu, debug_lpae_cp_reginfo);
+    }
+
+    for (i = 0; i < brps; i++) {
+        char *dbgbvr_el1_name = g_strdup_printf("DBGBVR%d_EL1", i);
+        char *dbgbcr_el1_name = g_strdup_printf("DBGBCR%d_EL1", i);
+        ARMCPRegInfo dbgregs[] = {
+            { .name = dbgbvr_el1_name, .state = ARM_CP_STATE_BOTH,
+              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
+              .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGBVRN_EL1,
+              .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
+              .writefn = dbgbvr_write, .raw_writefn = raw_write
+            },
+            { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
+              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
+              .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGBCRN_EL1,
+              .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
+              .writefn = dbgbcr_write, .raw_writefn = raw_write
+            },
+        };
+        define_arm_cp_regs(cpu, dbgregs);
+        g_free(dbgbvr_el1_name);
+        g_free(dbgbcr_el1_name);
+    }
+
+    for (i = 0; i < wrps; i++) {
+        char *dbgwvr_el1_name = g_strdup_printf("DBGWVR%d_EL1", i);
+        char *dbgwcr_el1_name = g_strdup_printf("DBGWCR%d_EL1", i);
+        ARMCPRegInfo dbgregs[] = {
+            { .name = dbgwvr_el1_name, .state = ARM_CP_STATE_BOTH,
+              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
+              .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGWVRN_EL1,
+              .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
+              .writefn = dbgwvr_write, .raw_writefn = raw_write
+            },
+            { .name = dbgwcr_el1_name, .state = ARM_CP_STATE_BOTH,
+              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
+              .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGWCRN_EL1,
+              .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
+              .writefn = dbgwcr_write, .raw_writefn = raw_write
+            },
+        };
+        define_arm_cp_regs(cpu, dbgregs);
+        g_free(dbgwvr_el1_name);
+        g_free(dbgwcr_el1_name);
+    }
+}
+
 static void define_pmu_regs(ARMCPU *cpu)
 {
     /*
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 3c671c88c1..eaee9f7731 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -9,7 +9,6 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
-#include "cpregs.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
@@ -536,283 +535,6 @@ void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
     raise_exception_debug(env, EXCP_UDEF, syndrome);
 }
 
-/*
- * Check for traps to "powerdown debug" registers, which are controlled
- * by MDCR.TDOSA
- */
-static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
-                                   bool isread)
-{
-    int el = arm_current_el(env);
-    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
-    bool mdcr_el2_tdosa = (mdcr_el2 & MDCR_TDOSA) || (mdcr_el2 & MDCR_TDE) ||
-        (arm_hcr_el2_eff(env) & HCR_TGE);
-
-    if (el < 2 && mdcr_el2_tdosa) {
-        return CP_ACCESS_TRAP_EL2;
-    }
-    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
-        return CP_ACCESS_TRAP_EL3;
-    }
-    return CP_ACCESS_OK;
-}
-
-/*
- * Check for traps to "debug ROM" registers, which are controlled
- * by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.
- */
-static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
-                                  bool isread)
-{
-    int el = arm_current_el(env);
-    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
-    bool mdcr_el2_tdra = (mdcr_el2 & MDCR_TDRA) || (mdcr_el2 & MDCR_TDE) ||
-        (arm_hcr_el2_eff(env) & HCR_TGE);
-
-    if (el < 2 && mdcr_el2_tdra) {
-        return CP_ACCESS_TRAP_EL2;
-    }
-    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
-        return CP_ACCESS_TRAP_EL3;
-    }
-    return CP_ACCESS_OK;
-}
-
-/*
- * Check for traps to general debug registers, which are controlled
- * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
- */
-static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
-                                  bool isread)
-{
-    int el = arm_current_el(env);
-    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
-    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
-        (arm_hcr_el2_eff(env) & HCR_TGE);
-
-    if (el < 2 && mdcr_el2_tda) {
-        return CP_ACCESS_TRAP_EL2;
-    }
-    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
-        return CP_ACCESS_TRAP_EL3;
-    }
-    return CP_ACCESS_OK;
-}
-
-/*
- * Check for traps to Debug Comms Channel registers. If FEAT_FGT
- * is implemented then these are controlled by MDCR_EL2.TDCC for
- * EL2 and MDCR_EL3.TDCC for EL3. They are also controlled by
- * the general debug access trap bits MDCR_EL2.TDA and MDCR_EL3.TDA.
- */
-static CPAccessResult access_tdcc(CPUARMState *env, const ARMCPRegInfo *ri,
-                                  bool isread)
-{
-    int el = arm_current_el(env);
-    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
-    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
-        (arm_hcr_el2_eff(env) & HCR_TGE);
-    bool mdcr_el2_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
-                                          (mdcr_el2 & MDCR_TDCC);
-    bool mdcr_el3_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
-                                          (env->cp15.mdcr_el3 & MDCR_TDCC);
-
-    if (el < 2 && (mdcr_el2_tda || mdcr_el2_tdcc)) {
-        return CP_ACCESS_TRAP_EL2;
-    }
-    if (el < 3 && ((env->cp15.mdcr_el3 & MDCR_TDA) || mdcr_el3_tdcc)) {
-        return CP_ACCESS_TRAP_EL3;
-    }
-    return CP_ACCESS_OK;
-}
-
-static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                        uint64_t value)
-{
-    /*
-     * Writes to OSLAR_EL1 may update the OS lock status, which can be
-     * read via a bit in OSLSR_EL1.
-     */
-    int oslock;
-
-    if (ri->state == ARM_CP_STATE_AA32) {
-        oslock = (value == 0xC5ACCE55);
-    } else {
-        oslock = value & 1;
-    }
-
-    env->cp15.oslsr_el1 = deposit32(env->cp15.oslsr_el1, 1, 1, oslock);
-}
-
-static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                        uint64_t value)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    /*
-     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
-     * implemented this is RAZ/WI.
-     */
-    if(arm_feature(env, ARM_FEATURE_AARCH64)
-       ? cpu_isar_feature(aa64_doublelock, cpu)
-       : cpu_isar_feature(aa32_doublelock, cpu)) {
-        env->cp15.osdlr_el1 = value & 1;
-    }
-}
-
-static void dbgclaimset_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                              uint64_t value)
-{
-    env->cp15.dbgclaim |= (value & 0xFF);
-}
-
-static uint64_t dbgclaimset_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    /* CLAIM bits are RAO */
-    return 0xFF;
-}
-
-static void dbgclaimclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                              uint64_t value)
-{
-    env->cp15.dbgclaim &= ~(value & 0xFF);
-}
-
-static const ARMCPRegInfo debug_cp_reginfo[] = {
-    /*
-     * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
-     * debug components. The AArch64 version of DBGDRAR is named MDRAR_EL1;
-     * unlike DBGDRAR it is never accessible from EL0.
-     * DBGDSAR is deprecated and must RAZ from v8 anyway, so it has no AArch64
-     * accessor.
-     */
-    { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL0_R, .accessfn = access_tdra,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "MDRAR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
-      .access = PL1_R, .accessfn = access_tdra,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL0_R, .accessfn = access_tdra,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
-    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
-      .fgt = FGT_MDSCR_EL1,
-      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
-      .resetvalue = 0 },
-    /*
-     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
-     * Debug Communication Channel is not implemented.
-     */
-    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
-      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
-      .access = PL0_R, .accessfn = access_tdcc,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    /*
-     * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
-     * It is a component of the Debug Communications Channel, which is not implemented.
-     */
-    { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
-      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tdcc,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
-      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tdcc,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    /*
-     * OSECCR_EL1 provides a mechanism for an operating system
-     * to access the contents of EDECCR. EDECCR is not implemented though,
-     * as is the rest of external device mechanism.
-     */
-    { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
-      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
-      .fgt = FGT_OSECCR_EL1,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    /*
-     * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
-     * it is unlikely a guest will care.
-     * We don't implement the configurable EL0 access.
-     */
-    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
-      .cp = 14, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
-      .type = ARM_CP_ALIAS,
-      .access = PL1_R, .accessfn = access_tda,
-      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
-    { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
-      .accessfn = access_tdosa,
-      .fgt = FGT_OSLAR_EL1,
-      .writefn = oslar_write },
-    { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
-      .access = PL1_R, .resetvalue = 10,
-      .accessfn = access_tdosa,
-      .fgt = FGT_OSLSR_EL1,
-      .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
-    /* Dummy OSDLR_EL1: 32-bit Linux will read this */
-    { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
-      .access = PL1_RW, .accessfn = access_tdosa,
-      .fgt = FGT_OSDLR_EL1,
-      .writefn = osdlr_write,
-      .fieldoffset = offsetof(CPUARMState, cp15.osdlr_el1) },
-    /*
-     * Dummy DBGVCR: Linux wants to clear this on startup, but we don't
-     * implement vector catch debug events yet.
-     */
-    { .name = "DBGVCR",
-      .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
-      .access = PL1_RW, .accessfn = access_tda,
-      .type = ARM_CP_NOP },
-    /*
-     * Dummy DBGVCR32_EL2 (which is only for a 64-bit hypervisor
-     * to save and restore a 32-bit guest's DBGVCR)
-     */
-    { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
-      .access = PL2_RW, .accessfn = access_tda,
-      .type = ARM_CP_NOP | ARM_CP_EL3_NO_EL2_KEEP },
-    /*
-     * Dummy MDCCINT_EL1, since we don't implement the Debug Communications
-     * Channel but Linux may try to access this register. The 32-bit
-     * alias is DBGDCCINT.
-     */
-    { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .accessfn = access_tdcc,
-      .type = ARM_CP_NOP },
-    /*
-     * Dummy DBGCLAIM registers.
-     * "The architecture does not define any functionality for the CLAIM tag bits.",
-     * so we only keep the raw bits
-     */
-    { .name = "DBGCLAIMSET_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
-      .type = ARM_CP_ALIAS,
-      .access = PL1_RW, .accessfn = access_tda,
-      .fgt = FGT_DBGCLAIM,
-      .writefn = dbgclaimset_write, .readfn = dbgclaimset_read },
-    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
-      .access = PL1_RW, .accessfn = access_tda,
-      .fgt = FGT_DBGCLAIM,
-      .writefn = dbgclaimclr_write, .raw_writefn = raw_write,
-      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
-};
-
-static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
-    /* 64 bit access versions of the (dummy) debug registers */
-    { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-};
-
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
@@ -919,39 +641,6 @@ void hw_watchpoint_update_all(ARMCPU *cpu)
     }
 }
 
-static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                         uint64_t value)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int i = ri->crm;
-
-    /*
-     * Bits [1:0] are RES0.
-     *
-     * It is IMPLEMENTATION DEFINED whether [63:49] ([63:53] with FEAT_LVA)
-     * are hardwired to the value of bit [48] ([52] with FEAT_LVA), or if
-     * they contain the value written.  It is CONSTRAINED UNPREDICTABLE
-     * whether the RESS bits are ignored when comparing an address.
-     *
-     * Therefore we are allowed to compare the entire register, which lets
-     * us avoid considering whether or not FEAT_LVA is actually enabled.
-     */
-    value &= ~3ULL;
-
-    raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
-}
-
-static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                         uint64_t value)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int i = ri->crm;
-
-    raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
-}
-
 void hw_breakpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
@@ -1055,154 +744,6 @@ void hw_breakpoint_update_all(ARMCPU *cpu)
     }
 }
 
-static void dbgbvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                         uint64_t value)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int i = ri->crm;
-
-    raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
-}
-
-static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                         uint64_t value)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int i = ri->crm;
-
-    /*
-     * BAS[3] is a read-only copy of BAS[2], and BAS[1] a read-only
-     * copy of BAS[0].
-     */
-    value = deposit64(value, 6, 1, extract64(value, 5, 1));
-    value = deposit64(value, 8, 1, extract64(value, 7, 1));
-
-    raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
-}
-
-void define_debug_regs(ARMCPU *cpu)
-{
-    /*
-     * Define v7 and v8 architectural debug registers.
-     * These are just dummy implementations for now.
-     */
-    int i;
-    int wrps, brps, ctx_cmps;
-
-    /*
-     * The Arm ARM says DBGDIDR is optional and deprecated if EL1 cannot
-     * use AArch32.  Given that bit 15 is RES1, if the value is 0 then
-     * the register must not exist for this cpu.
-     */
-    if (cpu->isar.dbgdidr != 0) {
-        ARMCPRegInfo dbgdidr = {
-            .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0,
-            .opc1 = 0, .opc2 = 0,
-            .access = PL0_R, .accessfn = access_tda,
-            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdidr,
-        };
-        define_one_arm_cp_reg(cpu, &dbgdidr);
-    }
-
-    /*
-     * DBGDEVID is present in the v7 debug architecture if
-     * DBGDIDR.DEVID_imp is 1 (bit 15); from v7.1 and on it is
-     * mandatory (and bit 15 is RES1). DBGDEVID1 and DBGDEVID2 exist
-     * from v7.1 of the debug architecture. Because no fields have yet
-     * been defined in DBGDEVID2 (and quite possibly none will ever
-     * be) we don't define an ARMISARegisters field for it.
-     * These registers exist only if EL1 can use AArch32, but that
-     * happens naturally because they are only PL1 accessible anyway.
-     */
-    if (extract32(cpu->isar.dbgdidr, 15, 1)) {
-        ARMCPRegInfo dbgdevid = {
-            .name = "DBGDEVID",
-            .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 2, .crn = 7,
-            .access = PL1_R, .accessfn = access_tda,
-            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid,
-        };
-        define_one_arm_cp_reg(cpu, &dbgdevid);
-    }
-    if (cpu_isar_feature(aa32_debugv7p1, cpu)) {
-        ARMCPRegInfo dbgdevid12[] = {
-            {
-                .name = "DBGDEVID1",
-                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 1, .crn = 7,
-                .access = PL1_R, .accessfn = access_tda,
-                .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid1,
-            }, {
-                .name = "DBGDEVID2",
-                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 0, .crn = 7,
-                .access = PL1_R, .accessfn = access_tda,
-                .type = ARM_CP_CONST, .resetvalue = 0,
-            },
-        };
-        define_arm_cp_regs(cpu, dbgdevid12);
-    }
-
-    brps = arm_num_brps(cpu);
-    wrps = arm_num_wrps(cpu);
-    ctx_cmps = arm_num_ctx_cmps(cpu);
-
-    assert(ctx_cmps <= brps);
-
-    define_arm_cp_regs(cpu, debug_cp_reginfo);
-
-    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
-        define_arm_cp_regs(cpu, debug_lpae_cp_reginfo);
-    }
-
-    for (i = 0; i < brps; i++) {
-        char *dbgbvr_el1_name = g_strdup_printf("DBGBVR%d_EL1", i);
-        char *dbgbcr_el1_name = g_strdup_printf("DBGBCR%d_EL1", i);
-        ARMCPRegInfo dbgregs[] = {
-            { .name = dbgbvr_el1_name, .state = ARM_CP_STATE_BOTH,
-              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
-              .access = PL1_RW, .accessfn = access_tda,
-              .fgt = FGT_DBGBVRN_EL1,
-              .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
-              .writefn = dbgbvr_write, .raw_writefn = raw_write
-            },
-            { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
-              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
-              .access = PL1_RW, .accessfn = access_tda,
-              .fgt = FGT_DBGBCRN_EL1,
-              .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
-              .writefn = dbgbcr_write, .raw_writefn = raw_write
-            },
-        };
-        define_arm_cp_regs(cpu, dbgregs);
-        g_free(dbgbvr_el1_name);
-        g_free(dbgbcr_el1_name);
-    }
-
-    for (i = 0; i < wrps; i++) {
-        char *dbgwvr_el1_name = g_strdup_printf("DBGWVR%d_EL1", i);
-        char *dbgwcr_el1_name = g_strdup_printf("DBGWCR%d_EL1", i);
-        ARMCPRegInfo dbgregs[] = {
-            { .name = dbgwvr_el1_name, .state = ARM_CP_STATE_BOTH,
-              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
-              .access = PL1_RW, .accessfn = access_tda,
-              .fgt = FGT_DBGWVRN_EL1,
-              .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
-              .writefn = dbgwvr_write, .raw_writefn = raw_write
-            },
-            { .name = dbgwcr_el1_name, .state = ARM_CP_STATE_BOTH,
-              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
-              .access = PL1_RW, .accessfn = access_tda,
-              .fgt = FGT_DBGWCRN_EL1,
-              .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
-              .writefn = dbgwcr_write, .raw_writefn = raw_write
-            },
-        };
-        define_arm_cp_regs(cpu, dbgregs);
-        g_free(dbgwvr_el1_name);
-        g_free(dbgwcr_el1_name);
-    }
-}
-
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index e1e018da46..81773efcc8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1363,15 +1363,6 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
-/* Add the cpreg definitions for debug related system registers */
-void define_debug_regs(ARMCPU *cpu);
-
-/* Effective value of MDCR_EL2 */
-static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
-{
-    return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
-}
-
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
     ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
-- 
2.35.3


