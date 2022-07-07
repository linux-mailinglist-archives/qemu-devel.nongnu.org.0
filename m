Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D2056A234
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:39:42 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9QnF-0002XV-BF
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbg-0007kU-Bn
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbe-0006vq-6o
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 h131-20020a1c2189000000b003a2cc290135so819112wmh.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VybfOs2fNz5z+Pm59pXoMNM44u6RPdQ7FNc33RNUKFM=;
 b=pSWKOLb2xcxhg1n9jQST0oFL4sWPKk5nS2n09SoXh6lLcnCxufYeQnlSClu2PC8wah
 nUdMzbLEm4IWDDlpI58cQW3prfsrNHkaqZSM4XOllprIAfeEFevc8sKrSqgDYJsf0kgH
 ObBKfP3ZwJar1iOWkuDzGDsm/Yhd4ZXPFVjZdattRva3NEMm1gtwCKjhIL3IfKq148HK
 H0LW1Te2WlhOUs7VuvwUj9iZgr+3jAc2zVN8fSdyvM8QltBg/R/mReFJbzFBtPcnt6h4
 7XDaEXfMYwBFJ1c7WB4M44dQoVj7MR5Snuq02JHFntoH7G8FYvVwp5yzOcMFW7HWavFt
 2UwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VybfOs2fNz5z+Pm59pXoMNM44u6RPdQ7FNc33RNUKFM=;
 b=OceFGv9K/w2iZm5GFR5OQntVcxq/CVzaVRQ1SWm62tkEAnB68bzS/rr/y7Rh/GbGd9
 fk1QUbXGQZ3eQXmPSW1MyikQabDxqRmKDONOfD9A3rgfxVFcx++y7E+ApLWTu3aH7sOV
 Jp7bHoiWj0NzyaHRlgSupoQSE4WEHPjDU/FwSxoq+FTFVzTiMpvwWHS2D6C2WMwpmI5/
 OzbVQAkKB3bYS9qBCMJsS06i4qWzTJRIJncSs9POD9HeFqxt+uJl4R9hKGnuh5Py6N5p
 jGI+YCArMv0lyjDMRAR1JE0hNpBTWWysE2aM7O/CkpQhvxR65y+6csP3sVpBpM3WCLPp
 Yr4g==
X-Gm-Message-State: AJIora/9dHMbUJgbhnBb+aQXbdLLAOD26ll5aENFR37Pnk9dSz9zVv5j
 CpdDMVaeQWikUgtHnGnNGLylyrN6GVdYHQ==
X-Google-Smtp-Source: AGRyM1vAtxHu1RCAO9OLYhcACihHIAkyhW4ii8wbftkcN956rw1XqCpF79oMPdR97vmjzPOT6sijBQ==
X-Received: by 2002:a7b:cd82:0:b0:3a1:7528:2d79 with SMTP id
 y2-20020a7bcd82000000b003a175282d79mr4307410wmj.79.1657196860767; 
 Thu, 07 Jul 2022 05:27:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] target/arm: Fix code style issues in debug helper functions
Date: Thu,  7 Jul 2022 13:27:29 +0100
Message-Id: <20220707122734.288929-5-peter.maydell@linaro.org>
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

Before moving debug system register helper functions to a
different file, fix the code style issues (mostly block
comment syntax) so checkpatch doesn't complain about the
code-motion patch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220630194116.3438513-2-peter.maydell@linaro.org
---
 target/arm/helper.c | 58 +++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f6dcb1a1152..1c7ec2f8678 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -307,7 +307,8 @@ static uint64_t arm_mdcr_el2_eff(CPUARMState *env)
     return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
 }
 
-/* Check for traps to "powerdown debug" registers, which are controlled
+/*
+ * Check for traps to "powerdown debug" registers, which are controlled
  * by MDCR.TDOSA
  */
 static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -327,7 +328,8 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-/* Check for traps to "debug ROM" registers, which are controlled
+/*
+ * Check for traps to "debug ROM" registers, which are controlled
  * by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.
  */
 static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -347,7 +349,8 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-/* Check for traps to general debug registers, which are controlled
+/*
+ * Check for traps to general debug registers, which are controlled
  * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
  */
 static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5982,7 +5985,8 @@ static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    /* Writes to OSLAR_EL1 may update the OS lock status, which can be
+    /*
+     * Writes to OSLAR_EL1 may update the OS lock status, which can be
      * read via a bit in OSLSR_EL1.
      */
     int oslock;
@@ -5997,7 +6001,8 @@ static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo debug_cp_reginfo[] = {
-    /* DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
+    /*
+     * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
      * debug components. The AArch64 version of DBGDRAR is named MDRAR_EL1;
      * unlike DBGDRAR it is never accessible from EL0.
      * DBGDSAR is deprecated and must RAZ from v8 anyway, so it has no AArch64
@@ -6052,21 +6057,24 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_tdosa,
       .type = ARM_CP_NOP },
-    /* Dummy DBGVCR: Linux wants to clear this on startup, but we don't
+    /*
+     * Dummy DBGVCR: Linux wants to clear this on startup, but we don't
      * implement vector catch debug events yet.
      */
     { .name = "DBGVCR",
       .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
-    /* Dummy DBGVCR32_EL2 (which is only for a 64-bit hypervisor
+    /*
+     * Dummy DBGVCR32_EL2 (which is only for a 64-bit hypervisor
      * to save and restore a 32-bit guest's DBGVCR)
      */
     { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL2_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP | ARM_CP_EL3_NO_EL2_KEEP },
-    /* Dummy MDCCINT_EL1, since we don't implement the Debug Communications
+    /*
+     * Dummy MDCCINT_EL1, since we don't implement the Debug Communications
      * Channel but Linux may try to access this register. The 32-bit
      * alias is DBGDCCINT.
      */
@@ -6079,9 +6087,9 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
     /* 64 bit access versions of the (dummy) debug registers */
     { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
     { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
 };
 
 /*
@@ -6496,13 +6504,15 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         break;
     }
 
-    /* Attempts to use both MASK and BAS fields simultaneously are
+    /*
+     * Attempts to use both MASK and BAS fields simultaneously are
      * CONSTRAINED UNPREDICTABLE; we opt to ignore BAS in this case,
      * thus generating a watchpoint for every byte in the masked region.
      */
     mask = FIELD_EX64(wcr, DBGWCR, MASK);
     if (mask == 1 || mask == 2) {
-        /* Reserved values of MASK; we must act as if the mask value was
+        /*
+         * Reserved values of MASK; we must act as if the mask value was
          * some non-reserved value, or as if the watchpoint were disabled.
          * We choose the latter.
          */
@@ -6510,7 +6520,8 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
     } else if (mask) {
         /* Watchpoint covers an aligned area up to 2GB in size */
         len = 1ULL << mask;
-        /* If masked bits in WVR are not zero it's CONSTRAINED UNPREDICTABLE
+        /*
+         * If masked bits in WVR are not zero it's CONSTRAINED UNPREDICTABLE
          * whether the watchpoint fires when the unmasked bits match; we opt
          * to generate the exceptions.
          */
@@ -6521,7 +6532,8 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         int basstart;
 
         if (extract64(wvr, 2, 1)) {
-            /* Deprecated case of an only 4-aligned address. BAS[7:4] are
+            /*
+             * Deprecated case of an only 4-aligned address. BAS[7:4] are
              * ignored, and BAS[3:0] define which bytes to watch.
              */
             bas &= 0xf;
@@ -6532,7 +6544,8 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
             return;
         }
 
-        /* The BAS bits are supposed to be programmed to indicate a contiguous
+        /*
+         * The BAS bits are supposed to be programmed to indicate a contiguous
          * range of bytes. Otherwise it is CONSTRAINED UNPREDICTABLE whether
          * we fire for each byte in the word/doubleword addressed by the WVR.
          * We choose to ignore any non-zero bits after the first range of 1s.
@@ -6551,7 +6564,8 @@ void hw_watchpoint_update_all(ARMCPU *cpu)
     int i;
     CPUARMState *env = &cpu->env;
 
-    /* Completely clear out existing QEMU watchpoints and our array, to
+    /*
+     * Completely clear out existing QEMU watchpoints and our array, to
      * avoid possible stale entries following migration load.
      */
     cpu_watchpoint_remove_all(CPU(cpu), BP_CPU);
@@ -6669,7 +6683,8 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 11: /* linked context ID and VMID match (reserved if no EL2) */
     case 3: /* linked context ID match */
     default:
-        /* We must generate no events for Linked context matches (unless
+        /*
+         * We must generate no events for Linked context matches (unless
          * they are linked to by some other bp/wp, which is handled in
          * updates for the linking bp/wp). We choose to also generate no events
          * for reserved values.
@@ -6685,7 +6700,8 @@ void hw_breakpoint_update_all(ARMCPU *cpu)
     int i;
     CPUARMState *env = &cpu->env;
 
-    /* Completely clear out existing QEMU breakpoints and our array, to
+    /*
+     * Completely clear out existing QEMU breakpoints and our array, to
      * avoid possible stale entries following migration load.
      */
     cpu_breakpoint_remove_all(CPU(cpu), BP_CPU);
@@ -6712,7 +6728,8 @@ static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     int i = ri->crm;
 
-    /* BAS[3] is a read-only copy of BAS[2], and BAS[1] a read-only
+    /*
+     * BAS[3] is a read-only copy of BAS[2], and BAS[1] a read-only
      * copy of BAS[0].
      */
     value = deposit64(value, 6, 1, extract64(value, 5, 1));
@@ -6724,7 +6741,8 @@ static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static void define_debug_regs(ARMCPU *cpu)
 {
-    /* Define v7 and v8 architectural debug registers.
+    /*
+     * Define v7 and v8 architectural debug registers.
      * These are just dummy implementations for now.
      */
     int i;
-- 
2.25.1


