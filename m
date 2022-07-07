Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B656A241
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:45:43 +0200 (CEST)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qt4-0001iJ-CB
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbk-0007qM-5E
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbg-0006wG-7m
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:47 -0400
Received: by mail-wm1-x32a.google.com with SMTP id l42so852537wms.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Oqi7W5KRLEM6TRklN2zjDGigMaQta7JS5duLjMmH+2A=;
 b=yQ043JkK+fzAG1iQ4K4cf3HZEd5CXrk2FR8jJBNBf+55LVzFu/XNJnztWG1GxDnxaP
 H7D6jDx1RBl5JGh4JxEle5Gi3NteQiKpJAPu7y1WjYsDsfmvzyuDiqwhICPiwjNCA7aE
 XtYQEi7ytTso5DNV2ZZ8l4uLcANhqahr9hcM6abVk4N3+5Zyjaa0Eax9RkCFcr44uSxj
 OzZOaPXCYPZ+B7VF12ihU+01z2qFGI9afn2WaaXNJQ0Ot4E5MswrHjoaUBTGuIkFCa9h
 ghmb3QNfGZeGVZmbtpVLZBcQh/uwsvzGzBUW6augSPEDSH2q2ePwv+OZLXRmDHIqktXY
 rB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oqi7W5KRLEM6TRklN2zjDGigMaQta7JS5duLjMmH+2A=;
 b=xdn3TIh+JjCIDa/FfSo+KTeAVp51FpcYw4ezJDrVQWvZH3kOheZ+x41oi1rhsS3aBk
 y6IipsNhYZKgk/CPbr+28+bal/qStnEPZ+G+X8eMgwSPgtMJtqaT3yLreFL2rnJWz989
 ke2/4KFb0HNZd804SHQuBRhKegmtKS354r7r1rm6XuLHZbkP7nTQxbpXRwb6vbUXlXZc
 mpY3UGnn2AUmILT72sBScfauJWv2mV0vn3+f7vYVZl9/NcLK3QqwUweb3EVWXfHk8r87
 l18cVQw+HAn5XxwNfP+oDEe0lKQrvz5Qj5MQeGn5/5GpedhhbizI04xgEjQaC0b3VRSS
 nDlw==
X-Gm-Message-State: AJIora/7ILJoVmynIH1PJqdF72Rx7IXYLDiHVwN7vDQ1sN20WL2gsfFR
 QrYlm8WTPq/wu79XmtKGhSWMpRaixIChsA==
X-Google-Smtp-Source: AGRyM1twkMeY283ewp/vSsSIzmvW2WPAO9kwi+kqQxckSrf9Qm5HBhq8Q/YJwqNIPMv0QxxVq55hVA==
X-Received: by 2002:a05:600c:8a9:b0:3a0:3d78:21a4 with SMTP id
 l41-20020a05600c08a900b003a03d7821a4mr4167614wmp.112.1657196862406; 
 Thu, 07 Jul 2022 05:27:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] target/arm: Move define_debug_regs() to debug_helper.c
Date: Thu,  7 Jul 2022 13:27:30 +0100
Message-Id: <20220707122734.288929-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target/arm/helper.c file is very long and is a grabbag of all
kinds of functionality.  We have already a debug_helper.c which has
code for implementing architectural debug.  Move the code which
defines the debug-related system registers out to this file also.
This affects the define_debug_regs() function and the various
functions and arrays which are used only by it.

The functions raw_write() and arm_mdcr_el2_eff() and
define_debug_regs() now need to be global rather than local to
helper.c; everything else is pure code movement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220630194116.3438513-3-peter.maydell@linaro.org
---
 target/arm/cpregs.h       |   3 +
 target/arm/internals.h    |   9 +
 target/arm/debug_helper.c | 525 +++++++++++++++++++++++++++++++++++++
 target/arm/helper.c       | 531 +-------------------------------------
 4 files changed, 538 insertions(+), 530 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index d30758ee713..7e78c2c05c6 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -442,6 +442,9 @@ void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
 /* CPReadFn that can be used for read-as-zero behaviour */
 uint64_t arm_cp_read_zero(CPUARMState *env, const ARMCPRegInfo *ri);
 
+/* CPWriteFn that just writes the value to ri->fieldoffset */
+void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value);
+
 /*
  * CPResetFn that does nothing, for use if no reset is required even
  * if fieldoffset is non zero.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c66f74a0db1..00e2e710f6c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1307,6 +1307,15 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+/* Add the cpreg definitions for debug related system registers */
+void define_debug_regs(ARMCPU *cpu);
+
+/* Effective value of MDCR_EL2 */
+static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
+{
+    return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
+}
+
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
     ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b18a6bd3a23..9a78c1db966 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -6,8 +6,10 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
+#include "cpregs.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
@@ -528,6 +530,529 @@ void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
     raise_exception_debug(env, EXCP_UDEF, syndrome);
 }
 
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
+      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
+      .resetvalue = 0 },
+    /*
+     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
+     * Debug Communication Channel is not implemented.
+     */
+    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
+      .access = PL0_R, .accessfn = access_tda,
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
+      .writefn = oslar_write },
+    { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
+      .access = PL1_R, .resetvalue = 10,
+      .accessfn = access_tdosa,
+      .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
+    /* Dummy OSDLR_EL1: 32-bit Linux will read this */
+    { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
+      .access = PL1_RW, .accessfn = access_tdosa,
+      .type = ARM_CP_NOP },
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
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_NOP },
+};
+
+static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
+    /* 64 bit access versions of the (dummy) debug registers */
+    { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+};
+
+void hw_watchpoint_update(ARMCPU *cpu, int n)
+{
+    CPUARMState *env = &cpu->env;
+    vaddr len = 0;
+    vaddr wvr = env->cp15.dbgwvr[n];
+    uint64_t wcr = env->cp15.dbgwcr[n];
+    int mask;
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+
+    if (env->cpu_watchpoint[n]) {
+        cpu_watchpoint_remove_by_ref(CPU(cpu), env->cpu_watchpoint[n]);
+        env->cpu_watchpoint[n] = NULL;
+    }
+
+    if (!FIELD_EX64(wcr, DBGWCR, E)) {
+        /* E bit clear : watchpoint disabled */
+        return;
+    }
+
+    switch (FIELD_EX64(wcr, DBGWCR, LSC)) {
+    case 0:
+        /* LSC 00 is reserved and must behave as if the wp is disabled */
+        return;
+    case 1:
+        flags |= BP_MEM_READ;
+        break;
+    case 2:
+        flags |= BP_MEM_WRITE;
+        break;
+    case 3:
+        flags |= BP_MEM_ACCESS;
+        break;
+    }
+
+    /*
+     * Attempts to use both MASK and BAS fields simultaneously are
+     * CONSTRAINED UNPREDICTABLE; we opt to ignore BAS in this case,
+     * thus generating a watchpoint for every byte in the masked region.
+     */
+    mask = FIELD_EX64(wcr, DBGWCR, MASK);
+    if (mask == 1 || mask == 2) {
+        /*
+         * Reserved values of MASK; we must act as if the mask value was
+         * some non-reserved value, or as if the watchpoint were disabled.
+         * We choose the latter.
+         */
+        return;
+    } else if (mask) {
+        /* Watchpoint covers an aligned area up to 2GB in size */
+        len = 1ULL << mask;
+        /*
+         * If masked bits in WVR are not zero it's CONSTRAINED UNPREDICTABLE
+         * whether the watchpoint fires when the unmasked bits match; we opt
+         * to generate the exceptions.
+         */
+        wvr &= ~(len - 1);
+    } else {
+        /* Watchpoint covers bytes defined by the byte address select bits */
+        int bas = FIELD_EX64(wcr, DBGWCR, BAS);
+        int basstart;
+
+        if (extract64(wvr, 2, 1)) {
+            /*
+             * Deprecated case of an only 4-aligned address. BAS[7:4] are
+             * ignored, and BAS[3:0] define which bytes to watch.
+             */
+            bas &= 0xf;
+        }
+
+        if (bas == 0) {
+            /* This must act as if the watchpoint is disabled */
+            return;
+        }
+
+        /*
+         * The BAS bits are supposed to be programmed to indicate a contiguous
+         * range of bytes. Otherwise it is CONSTRAINED UNPREDICTABLE whether
+         * we fire for each byte in the word/doubleword addressed by the WVR.
+         * We choose to ignore any non-zero bits after the first range of 1s.
+         */
+        basstart = ctz32(bas);
+        len = cto32(bas >> basstart);
+        wvr += basstart;
+    }
+
+    cpu_watchpoint_insert(CPU(cpu), wvr, len, flags,
+                          &env->cpu_watchpoint[n]);
+}
+
+void hw_watchpoint_update_all(ARMCPU *cpu)
+{
+    int i;
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * Completely clear out existing QEMU watchpoints and our array, to
+     * avoid possible stale entries following migration load.
+     */
+    cpu_watchpoint_remove_all(CPU(cpu), BP_CPU);
+    memset(env->cpu_watchpoint, 0, sizeof(env->cpu_watchpoint));
+
+    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_watchpoint); i++) {
+        hw_watchpoint_update(cpu, i);
+    }
+}
+
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
+    hw_watchpoint_update(cpu, i);
+}
+
+static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int i = ri->crm;
+
+    raw_write(env, ri, value);
+    hw_watchpoint_update(cpu, i);
+}
+
+void hw_breakpoint_update(ARMCPU *cpu, int n)
+{
+    CPUARMState *env = &cpu->env;
+    uint64_t bvr = env->cp15.dbgbvr[n];
+    uint64_t bcr = env->cp15.dbgbcr[n];
+    vaddr addr;
+    int bt;
+    int flags = BP_CPU;
+
+    if (env->cpu_breakpoint[n]) {
+        cpu_breakpoint_remove_by_ref(CPU(cpu), env->cpu_breakpoint[n]);
+        env->cpu_breakpoint[n] = NULL;
+    }
+
+    if (!extract64(bcr, 0, 1)) {
+        /* E bit clear : watchpoint disabled */
+        return;
+    }
+
+    bt = extract64(bcr, 20, 4);
+
+    switch (bt) {
+    case 4: /* unlinked address mismatch (reserved if AArch64) */
+    case 5: /* linked address mismatch (reserved if AArch64) */
+        qemu_log_mask(LOG_UNIMP,
+                      "arm: address mismatch breakpoint types not implemented\n");
+        return;
+    case 0: /* unlinked address match */
+    case 1: /* linked address match */
+    {
+        /*
+         * Bits [1:0] are RES0.
+         *
+         * It is IMPLEMENTATION DEFINED whether bits [63:49]
+         * ([63:53] for FEAT_LVA) are hardwired to a copy of the sign bit
+         * of the VA field ([48] or [52] for FEAT_LVA), or whether the
+         * value is read as written.  It is CONSTRAINED UNPREDICTABLE
+         * whether the RESS bits are ignored when comparing an address.
+         * Therefore we are allowed to compare the entire register, which
+         * lets us avoid considering whether FEAT_LVA is actually enabled.
+         *
+         * The BAS field is used to allow setting breakpoints on 16-bit
+         * wide instructions; it is CONSTRAINED UNPREDICTABLE whether
+         * a bp will fire if the addresses covered by the bp and the addresses
+         * covered by the insn overlap but the insn doesn't start at the
+         * start of the bp address range. We choose to require the insn and
+         * the bp to have the same address. The constraints on writing to
+         * BAS enforced in dbgbcr_write mean we have only four cases:
+         *  0b0000  => no breakpoint
+         *  0b0011  => breakpoint on addr
+         *  0b1100  => breakpoint on addr + 2
+         *  0b1111  => breakpoint on addr
+         * See also figure D2-3 in the v8 ARM ARM (DDI0487A.c).
+         */
+        int bas = extract64(bcr, 5, 4);
+        addr = bvr & ~3ULL;
+        if (bas == 0) {
+            return;
+        }
+        if (bas == 0xc) {
+            addr += 2;
+        }
+        break;
+    }
+    case 2: /* unlinked context ID match */
+    case 8: /* unlinked VMID match (reserved if no EL2) */
+    case 10: /* unlinked context ID and VMID match (reserved if no EL2) */
+        qemu_log_mask(LOG_UNIMP,
+                      "arm: unlinked context breakpoint types not implemented\n");
+        return;
+    case 9: /* linked VMID match (reserved if no EL2) */
+    case 11: /* linked context ID and VMID match (reserved if no EL2) */
+    case 3: /* linked context ID match */
+    default:
+        /*
+         * We must generate no events for Linked context matches (unless
+         * they are linked to by some other bp/wp, which is handled in
+         * updates for the linking bp/wp). We choose to also generate no events
+         * for reserved values.
+         */
+        return;
+    }
+
+    cpu_breakpoint_insert(CPU(cpu), addr, flags, &env->cpu_breakpoint[n]);
+}
+
+void hw_breakpoint_update_all(ARMCPU *cpu)
+{
+    int i;
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * Completely clear out existing QEMU breakpoints and our array, to
+     * avoid possible stale entries following migration load.
+     */
+    cpu_breakpoint_remove_all(CPU(cpu), BP_CPU);
+    memset(env->cpu_breakpoint, 0, sizeof(env->cpu_breakpoint));
+
+    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_breakpoint); i++) {
+        hw_breakpoint_update(cpu, i);
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
+    hw_breakpoint_update(cpu, i);
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
+    hw_breakpoint_update(cpu, i);
+}
+
+void define_debug_regs(ARMCPU *cpu)
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
+              .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
+              .writefn = dbgbvr_write, .raw_writefn = raw_write
+            },
+            { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
+              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
+              .access = PL1_RW, .accessfn = access_tda,
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
+              .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
+              .writefn = dbgwvr_write, .raw_writefn = raw_write
+            },
+            { .name = dbgwcr_el1_name, .state = ARM_CP_STATE_BOTH,
+              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
+              .access = PL1_RW, .accessfn = access_tda,
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
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1c7ec2f8678..e6f37e160f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -51,8 +51,7 @@ static uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
-static void raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                      uint64_t value)
+void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     assert(ri->fieldoffset);
     if (cpreg_field_is_64bit(ri)) {
@@ -302,74 +301,6 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
     return CP_ACCESS_TRAP_UNCATEGORIZED;
 }
 
-static uint64_t arm_mdcr_el2_eff(CPUARMState *env)
-{
-    return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
-}
-
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
 /* Check for traps to performance monitor registers, which are controlled
  * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
  */
@@ -5982,116 +5913,6 @@ static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
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
-      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
-      .resetvalue = 0 },
-    /*
-     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
-     * Debug Communication Channel is not implemented.
-     */
-    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
-      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
-      .access = PL0_R, .accessfn = access_tda,
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
-      .writefn = oslar_write },
-    { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
-      .access = PL1_R, .resetvalue = 10,
-      .accessfn = access_tdosa,
-      .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
-    /* Dummy OSDLR_EL1: 32-bit Linux will read this */
-    { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
-      .access = PL1_RW, .accessfn = access_tdosa,
-      .type = ARM_CP_NOP },
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
-      .access = PL1_RW, .accessfn = access_tda,
-      .type = ARM_CP_NOP },
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
 /*
  * Check for traps to RAS registers, which are controlled
  * by HCR_EL2.TERR and SCR_EL3.TERR.
@@ -6470,356 +6291,6 @@ static const ARMCPRegInfo sme_reginfo[] = {
 };
 #endif /* TARGET_AARCH64 */
 
-void hw_watchpoint_update(ARMCPU *cpu, int n)
-{
-    CPUARMState *env = &cpu->env;
-    vaddr len = 0;
-    vaddr wvr = env->cp15.dbgwvr[n];
-    uint64_t wcr = env->cp15.dbgwcr[n];
-    int mask;
-    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
-
-    if (env->cpu_watchpoint[n]) {
-        cpu_watchpoint_remove_by_ref(CPU(cpu), env->cpu_watchpoint[n]);
-        env->cpu_watchpoint[n] = NULL;
-    }
-
-    if (!FIELD_EX64(wcr, DBGWCR, E)) {
-        /* E bit clear : watchpoint disabled */
-        return;
-    }
-
-    switch (FIELD_EX64(wcr, DBGWCR, LSC)) {
-    case 0:
-        /* LSC 00 is reserved and must behave as if the wp is disabled */
-        return;
-    case 1:
-        flags |= BP_MEM_READ;
-        break;
-    case 2:
-        flags |= BP_MEM_WRITE;
-        break;
-    case 3:
-        flags |= BP_MEM_ACCESS;
-        break;
-    }
-
-    /*
-     * Attempts to use both MASK and BAS fields simultaneously are
-     * CONSTRAINED UNPREDICTABLE; we opt to ignore BAS in this case,
-     * thus generating a watchpoint for every byte in the masked region.
-     */
-    mask = FIELD_EX64(wcr, DBGWCR, MASK);
-    if (mask == 1 || mask == 2) {
-        /*
-         * Reserved values of MASK; we must act as if the mask value was
-         * some non-reserved value, or as if the watchpoint were disabled.
-         * We choose the latter.
-         */
-        return;
-    } else if (mask) {
-        /* Watchpoint covers an aligned area up to 2GB in size */
-        len = 1ULL << mask;
-        /*
-         * If masked bits in WVR are not zero it's CONSTRAINED UNPREDICTABLE
-         * whether the watchpoint fires when the unmasked bits match; we opt
-         * to generate the exceptions.
-         */
-        wvr &= ~(len - 1);
-    } else {
-        /* Watchpoint covers bytes defined by the byte address select bits */
-        int bas = FIELD_EX64(wcr, DBGWCR, BAS);
-        int basstart;
-
-        if (extract64(wvr, 2, 1)) {
-            /*
-             * Deprecated case of an only 4-aligned address. BAS[7:4] are
-             * ignored, and BAS[3:0] define which bytes to watch.
-             */
-            bas &= 0xf;
-        }
-
-        if (bas == 0) {
-            /* This must act as if the watchpoint is disabled */
-            return;
-        }
-
-        /*
-         * The BAS bits are supposed to be programmed to indicate a contiguous
-         * range of bytes. Otherwise it is CONSTRAINED UNPREDICTABLE whether
-         * we fire for each byte in the word/doubleword addressed by the WVR.
-         * We choose to ignore any non-zero bits after the first range of 1s.
-         */
-        basstart = ctz32(bas);
-        len = cto32(bas >> basstart);
-        wvr += basstart;
-    }
-
-    cpu_watchpoint_insert(CPU(cpu), wvr, len, flags,
-                          &env->cpu_watchpoint[n]);
-}
-
-void hw_watchpoint_update_all(ARMCPU *cpu)
-{
-    int i;
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * Completely clear out existing QEMU watchpoints and our array, to
-     * avoid possible stale entries following migration load.
-     */
-    cpu_watchpoint_remove_all(CPU(cpu), BP_CPU);
-    memset(env->cpu_watchpoint, 0, sizeof(env->cpu_watchpoint));
-
-    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_watchpoint); i++) {
-        hw_watchpoint_update(cpu, i);
-    }
-}
-
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
-void hw_breakpoint_update(ARMCPU *cpu, int n)
-{
-    CPUARMState *env = &cpu->env;
-    uint64_t bvr = env->cp15.dbgbvr[n];
-    uint64_t bcr = env->cp15.dbgbcr[n];
-    vaddr addr;
-    int bt;
-    int flags = BP_CPU;
-
-    if (env->cpu_breakpoint[n]) {
-        cpu_breakpoint_remove_by_ref(CPU(cpu), env->cpu_breakpoint[n]);
-        env->cpu_breakpoint[n] = NULL;
-    }
-
-    if (!extract64(bcr, 0, 1)) {
-        /* E bit clear : watchpoint disabled */
-        return;
-    }
-
-    bt = extract64(bcr, 20, 4);
-
-    switch (bt) {
-    case 4: /* unlinked address mismatch (reserved if AArch64) */
-    case 5: /* linked address mismatch (reserved if AArch64) */
-        qemu_log_mask(LOG_UNIMP,
-                      "arm: address mismatch breakpoint types not implemented\n");
-        return;
-    case 0: /* unlinked address match */
-    case 1: /* linked address match */
-    {
-        /*
-         * Bits [1:0] are RES0.
-         *
-         * It is IMPLEMENTATION DEFINED whether bits [63:49]
-         * ([63:53] for FEAT_LVA) are hardwired to a copy of the sign bit
-         * of the VA field ([48] or [52] for FEAT_LVA), or whether the
-         * value is read as written.  It is CONSTRAINED UNPREDICTABLE
-         * whether the RESS bits are ignored when comparing an address.
-         * Therefore we are allowed to compare the entire register, which
-         * lets us avoid considering whether FEAT_LVA is actually enabled.
-         *
-         * The BAS field is used to allow setting breakpoints on 16-bit
-         * wide instructions; it is CONSTRAINED UNPREDICTABLE whether
-         * a bp will fire if the addresses covered by the bp and the addresses
-         * covered by the insn overlap but the insn doesn't start at the
-         * start of the bp address range. We choose to require the insn and
-         * the bp to have the same address. The constraints on writing to
-         * BAS enforced in dbgbcr_write mean we have only four cases:
-         *  0b0000  => no breakpoint
-         *  0b0011  => breakpoint on addr
-         *  0b1100  => breakpoint on addr + 2
-         *  0b1111  => breakpoint on addr
-         * See also figure D2-3 in the v8 ARM ARM (DDI0487A.c).
-         */
-        int bas = extract64(bcr, 5, 4);
-        addr = bvr & ~3ULL;
-        if (bas == 0) {
-            return;
-        }
-        if (bas == 0xc) {
-            addr += 2;
-        }
-        break;
-    }
-    case 2: /* unlinked context ID match */
-    case 8: /* unlinked VMID match (reserved if no EL2) */
-    case 10: /* unlinked context ID and VMID match (reserved if no EL2) */
-        qemu_log_mask(LOG_UNIMP,
-                      "arm: unlinked context breakpoint types not implemented\n");
-        return;
-    case 9: /* linked VMID match (reserved if no EL2) */
-    case 11: /* linked context ID and VMID match (reserved if no EL2) */
-    case 3: /* linked context ID match */
-    default:
-        /*
-         * We must generate no events for Linked context matches (unless
-         * they are linked to by some other bp/wp, which is handled in
-         * updates for the linking bp/wp). We choose to also generate no events
-         * for reserved values.
-         */
-        return;
-    }
-
-    cpu_breakpoint_insert(CPU(cpu), addr, flags, &env->cpu_breakpoint[n]);
-}
-
-void hw_breakpoint_update_all(ARMCPU *cpu)
-{
-    int i;
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * Completely clear out existing QEMU breakpoints and our array, to
-     * avoid possible stale entries following migration load.
-     */
-    cpu_breakpoint_remove_all(CPU(cpu), BP_CPU);
-    memset(env->cpu_breakpoint, 0, sizeof(env->cpu_breakpoint));
-
-    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_breakpoint); i++) {
-        hw_breakpoint_update(cpu, i);
-    }
-}
-
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
-static void define_debug_regs(ARMCPU *cpu)
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
-              .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
-              .writefn = dbgbvr_write, .raw_writefn = raw_write
-            },
-            { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
-              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
-              .access = PL1_RW, .accessfn = access_tda,
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
-              .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
-              .writefn = dbgwvr_write, .raw_writefn = raw_write
-            },
-            { .name = dbgwcr_el1_name, .state = ARM_CP_STATE_BOTH,
-              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
-              .access = PL1_RW, .accessfn = access_tda,
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
 static void define_pmu_regs(ARMCPU *cpu)
 {
     /*
-- 
2.25.1


