Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C425048EC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:29:44 +0200 (CEST)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9eZ-0005GY-Lu
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90U-0004gc-OY
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90S-00045K-Kd
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id bx5so11322322pjb.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYEZAarhcV8VbvRrhZATBlBb0FycBEBDo1cg0e6bHok=;
 b=v9w9ZfsWI/2WgL1V2DeC4tQa3BRlHstrcoOpXegpv1ZZHoihPt6CUWGbq6V8iEx/we
 vT8eb//mBxmzxQMvNG/n3eiKxbuYstOLbjYXyhcQgLL5GmZest0LoXJkJRxQRwxpWgXp
 d7csZvBBM/lCCpLD5i8yB8XLq74YkkmALza1hm+0JDgKwjrnnfZgMHk1lm+an8n07nDH
 jTE5r2v16fYJ4OOKFvkTBi1TxeqAi/0q3tTp/4kgN5jupizHH3nnhH/tq1ASmiXi5msM
 shgi5Fk8rtoUnM6hLeGpIp4ey2AkemZketNZGCd4bw+FDDLcWBIfIUWF4URre5GRAKgp
 fP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYEZAarhcV8VbvRrhZATBlBb0FycBEBDo1cg0e6bHok=;
 b=VBCoiIllBqDJpy6k7OKiuqMIGyJlhGM2qsuykG17edayyYfHObUfJHwiOm0akd5qlh
 l/W23kq7bkNbrd3zaOLMh2ES3KoClWmnzyd7HAlNASTcLys3sahfkjEnoPgTQtfS7rib
 RWI4F/m0i37YEp2aRuhHQ2G8cIz/kifFRVOmfNRI8TL0+vQMp1JI1+OvGWlJgsn9wUFm
 fOMMZKVBzU1m0gpNCl5IxZtT6C8U6v2GtqF1FcDgQutcZ5zDYv1Tu+bgmbAuoetlg5PE
 Oxe1Lbci0fH36FVVNGeflWqmjX54Z1Jym2DhA1ulZTty20Lw4w2zn7k5ahaAv5XMbVhH
 0lXQ==
X-Gm-Message-State: AOAM532FRSlotRqSA+PdjrJmhNpmtK0LDTvTD7lCWHCAw5YysAYczhIg
 FPnSnAmtW4X93OXYhnPvwM5SEsu8jmAyoA==
X-Google-Smtp-Source: ABdhPJzFMR7RZ7g/XBmYbFgPkCDn6ja4ZUhNW9Si1t+KewLGL5ijqL+KUz3lOGELxhrVsTi7BwyH+Q==
X-Received: by 2002:a17:90a:e7cd:b0:1c7:acbd:215d with SMTP id
 kb13-20020a17090ae7cd00b001c7acbd215dmr9045455pjb.153.1650217695242; 
 Sun, 17 Apr 2022 10:48:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 52/60] target/arm: Implement ESB instruction
Date: Sun, 17 Apr 2022 10:44:18 -0700
Message-Id: <20220417174426.711829-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check for and defer any pending virtual SError.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Retain m-profile check; improve comments.
---
 target/arm/helper.h        |  1 +
 target/arm/a32.decode      | 16 ++++++++------
 target/arm/t32.decode      | 18 ++++++++--------
 target/arm/op_helper.c     | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 17 +++++++++++++++
 target/arm/translate.c     | 23 ++++++++++++++++++++
 6 files changed, 103 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b463d9343b..b1334e0c42 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
+DEF_HELPER_1(vesb, void, env)
 
 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index fcd8cd4f7d..f2ca480949 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -187,13 +187,17 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
 
 {
   {
-    YIELD        ---- 0011 0010 0000 1111 ---- 0000 0001
-    WFE          ---- 0011 0010 0000 1111 ---- 0000 0010
-    WFI          ---- 0011 0010 0000 1111 ---- 0000 0011
+    [
+      YIELD      ---- 0011 0010 0000 1111 ---- 0000 0001
+      WFE        ---- 0011 0010 0000 1111 ---- 0000 0010
+      WFI        ---- 0011 0010 0000 1111 ---- 0000 0011
 
-    # TODO: Implement SEV, SEVL; may help SMP performance.
-    # SEV        ---- 0011 0010 0000 1111 ---- 0000 0100
-    # SEVL       ---- 0011 0010 0000 1111 ---- 0000 0101
+      # TODO: Implement SEV, SEVL; may help SMP performance.
+      # SEV      ---- 0011 0010 0000 1111 ---- 0000 0100
+      # SEVL     ---- 0011 0010 0000 1111 ---- 0000 0101
+
+      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
+    ]
 
     # The canonical nop ends in 00000000, but the whole of the
     # rest of the space executes as nop if otherwise unsupported.
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 78fadef9d6..f21ad0167a 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -364,17 +364,17 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
   [
     # Hints, and CPS
     {
-      YIELD      1111 0011 1010 1111 1000 0000 0000 0001
-      WFE        1111 0011 1010 1111 1000 0000 0000 0010
-      WFI        1111 0011 1010 1111 1000 0000 0000 0011
+      [
+        YIELD    1111 0011 1010 1111 1000 0000 0000 0001
+        WFE      1111 0011 1010 1111 1000 0000 0000 0010
+        WFI      1111 0011 1010 1111 1000 0000 0000 0011
 
-      # TODO: Implement SEV, SEVL; may help SMP performance.
-      # SEV      1111 0011 1010 1111 1000 0000 0000 0100
-      # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
+        # TODO: Implement SEV, SEVL; may help SMP performance.
+        # SEV    1111 0011 1010 1111 1000 0000 0000 0100
+        # SEVL   1111 0011 1010 1111 1000 0000 0000 0101
 
-      # For M-profile minimal-RAS ESB can be a NOP, which is the
-      # default behaviour since it is in the hint space.
-      # ESB      1111 0011 1010 1111 1000 0000 0001 0000
+        ESB      1111 0011 1010 1111 1000 0000 0001 0000
+      ]
 
       # The canonical nop ends in 0000 0000, but the whole rest
       # of the space is "reserved hint, behaves as nop".
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 76499ffa14..390b6578a8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -960,3 +960,46 @@ void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
                      access_type, mmu_idx, ra);
     }
 }
+
+/*
+ * This function corresponds to AArch64.vESBOperation().
+ * Note that the AArch32 version is not functionally different.
+ */
+void HELPER(vesb)(CPUARMState *env)
+{
+    /*
+     * The EL2Enabled() check is done inside arm_hcr_el2_eff,
+     * and will return HCR_EL2.VSE == 0, so nothing happens.
+     */
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    bool enabled = !(hcr & HCR_TGE) && (hcr & HCR_AMO);
+    bool pending = enabled && (hcr & HCR_VSE);
+    bool masked  = (env->daif & PSTATE_A);
+
+    /* If VSE pending and masked, defer the exception.  */
+    if (pending && masked) {
+        uint32_t syndrome;
+
+        if (arm_el_is_aa64(env, 1)) {
+            /* Copy across IDS and ISS from VSESR. */
+            syndrome = env->cp15.vsesr_el2 & 0x1ffffff;
+        } else {
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal };
+
+            if (extended_addresses_enabled(env)) {
+                syndrome = arm_fi_to_lfsc(&fi);
+            } else {
+                syndrome = arm_fi_to_sfsc(&fi);
+            }
+            /* Copy across AET and ExT from VSESR. */
+            syndrome |= env->cp15.vsesr_el2 & 0xd000;
+        }
+
+        /* Set VDISR_EL2.A along with the syndrome. */
+        env->cp15.vdisr_el2 = syndrome | (1u << 31);
+
+        /* Clear pending virtual SError */
+        env->cp15.hcr_el2 &= ~HCR_VSE;
+        cpu_reset_interrupt(env_cpu(env), CPU_INTERRUPT_VSERR);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 98dbc8203f..fc0b3ebf44 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1454,6 +1454,23 @@ static void handle_hint(DisasContext *s, uint32_t insn,
             gen_helper_autib(cpu_X[17], cpu_env, cpu_X[17], cpu_X[16]);
         }
         break;
+    case 0b10000: /* ESB */
+        /* Without RAS, we must implement this as NOP. */
+        if (dc_isar_feature(aa64_ras, s)) {
+            /*
+             * QEMU does not have a source of physical SErrors,
+             * so we are only concerned with virtual SErrors.
+             * The pseudocode in the ARM for this case is
+             *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+             *      AArch64.vESBOperation();
+             * Most of the condition can be evaluated at translation time.
+             * Test for EL2 present, and defer test for SEL2 to runtime.
+             */
+            if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+                gen_helper_vesb(cpu_env);
+            }
+        }
+        break;
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9370b44707..fef7ccea5c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6236,6 +6236,29 @@ static bool trans_WFI(DisasContext *s, arg_WFI *a)
     return true;
 }
 
+static bool trans_ESB(DisasContext *s, arg_ESB *a)
+{
+    /*
+     * For M-profile, minimal-RAS ESB can be a NOP.
+     * Without RAS, we must implement this as NOP.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_M) && dc_isar_feature(aa32_ras, s)) {
+        /*
+         * QEMU does not have a source of physical SErrors,
+         * so we are only concerned with virtual SErrors.
+         * The pseudocode in the ARM for this case is
+         *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+         *      AArch32.vESBOperation();
+         * Most of the condition can be evaluated at translation time.
+         * Test for EL2 present, and defer test for SEL2 to runtime.
+         */
+        if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+            gen_helper_vesb(cpu_env);
+        }
+    }
+    return true;
+}
+
 static bool trans_NOP(DisasContext *s, arg_NOP *a)
 {
     return true;
-- 
2.25.1


