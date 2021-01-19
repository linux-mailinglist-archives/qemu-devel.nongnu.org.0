Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3472FBB6D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:42:17 +0100 (CET)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1t96-0002Du-Qf
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfJ-0007nx-V7
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfE-0001Ha-Jg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id y17so20079752wrr.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V7V3jqznNzA/c9b2qWt+9TGnvRXnla31qGLYyMHy5jY=;
 b=r19MF8DL/f/sgJROuexDEvaIWdwbbrzbPCEyK2BG/Pty3T6njsXW/vV7ZzcqE6yl8x
 pGZjMMSGCTzQMOnJi9hsZnMZ2H9HQ72newVjljgqh2Qj1iHOeblKHkIrKSOL5BKzRsWE
 eufjNFiebUVSj6vrwOp/jZs0NoS8mc0/EukJX6feV5UAtBb0fhZQC+xgbEyPrgpwvXlp
 zAh2w7vot8Ryq4d8CBXJof/tJHuRZGpdvlIfzVhKE1ghSixZWuid8c50aSkirXNuyBqb
 C1QICgwRZz4DsSw4wK2eNJ+2g0Bf/fl+LV7BkAjMPWOV/BI3Iny22c/PZFdDwiQfjiKv
 Ua9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7V3jqznNzA/c9b2qWt+9TGnvRXnla31qGLYyMHy5jY=;
 b=K3XJayeN3CM3jwt+SXmx4+IzbUnSTCk4Hn1A9J4vE3mRiSS76wwcBymwn/CKlTNRc7
 zuLA/6Oqhysh/4+ok4HgVZ3IyZlhQILqn+E3a3rimgOLz7TvHkMpS2qEaPBsgZxy6VCw
 J2ERfJ4+fHP5Q1/SiVAKqWLn9tOENQwWQqv1dN13xqTuDX1LFEDg074Dt4F/WiD6kUDI
 Hlx1b3Bhu7zfGZyKpKP8xvGsXrtftJk+TofXgS5ZMafD0cWdh8nGGA8hcABo/OAtXJ+T
 a6dnUCXX3DrkGCQFzEMmK1n6P2rB4Hph8fYvQuCXhALMkrkD40kAPx8xJ2U2kSCSWYAf
 j9Lw==
X-Gm-Message-State: AOAM530wvbrNDRQg0Y6+U5ZGAEsiXPhXagHLNC6S9TX8EuZg/MCIDSqI
 s7GRjYP+jN+2GCc6PP8YnoM0qNkSOmMyqQ==
X-Google-Smtp-Source: ABdhPJyrdsjrvFVHCuhmb/O0Mc5u6fmhzzAgLoC1/JLxrbw6kiDuwSGu9XOrrEAaWk3+2gUS66MyBw==
X-Received: by 2002:adf:dd45:: with SMTP id u5mr3267434wrm.392.1611069083126; 
 Tue, 19 Jan 2021 07:11:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] target/arm: Implement SCR_EL2.EEL2
Date: Tue, 19 Jan 2021 15:10:51 +0000
Message-Id: <20210119151104.16264-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds handling for the SCR_EL3.EEL2 bit.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Message-id: 20210112104511.36576-17-remi.denis.courmont@huawei.com
[PMM: Applied fixes for review issues noted by RTH:
 - check for FEATURE_AARCH64 before checking sel2 isar feature
 - correct the commit message subject line]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  8 ++++++--
 target/arm/cpu.c       |  2 +-
 target/arm/helper.c    | 19 ++++++++++++++++---
 target/arm/translate.c | 15 +++++++++++++--
 4 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b115da59359..df0d6778330 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2164,7 +2164,10 @@ static inline bool arm_is_secure(CPUARMState *env)
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
     if (arm_feature(env, ARM_FEATURE_EL2)) {
-        return !arm_is_secure_below_el3(env);
+        if (arm_is_secure_below_el3(env)) {
+            return (env->cp15.scr_el3 & SCR_EEL2) != 0;
+        }
+        return true;
     }
     return false;
 }
@@ -2211,7 +2214,8 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
         return aa64;
     }
 
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
+    if (arm_feature(env, ARM_FEATURE_EL3) &&
+        ((env->cp15.scr_el3 & SCR_NS) || !(env->cp15.scr_el3 & SCR_EEL2))) {
         aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
     }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4ae22b2086b..40142ac141e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -480,7 +480,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
              * masked from Secure state. The HCR and SCR settings
              * don't affect the masking logic, only the interrupt routing.
              */
-            if (target_el == 3 || !secure) {
+            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
                 unmasked = true;
             }
         } else {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 79164a03e07..f3ee6d98080 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -533,6 +533,9 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
         return CP_ACCESS_OK;
     }
     if (arm_is_secure_below_el3(env)) {
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_TRAP_EL2;
+        }
         return CP_ACCESS_TRAP_EL3;
     }
     /* This will be EL1 NS and EL2 NS, which just UNDEF */
@@ -2030,6 +2033,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |= SCR_API | SCR_APK;
         }
+        if (cpu_isar_feature(aa64_sel2, cpu)) {
+            valid_mask |= SCR_EEL2;
+        }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
         }
@@ -3388,13 +3394,16 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (ri->opc2 & 4) {
-        /* The ATS12NSO* operations must trap to EL3 if executed in
+        /* The ATS12NSO* operations must trap to EL3 or EL2 if executed in
          * Secure EL1 (which can only happen if EL3 is AArch64).
          * They are simply UNDEF if executed from NS EL1.
          * They function normally from EL2 or EL3.
          */
         if (arm_current_el(env) == 1) {
             if (arm_is_secure_below_el3(env)) {
+                if (env->cp15.scr_el3 & SCR_EEL2) {
+                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
+                }
                 return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
             }
             return CP_ACCESS_TRAP_UNCATEGORIZED;
@@ -3657,7 +3666,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
-    if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & SCR_NS)) {
+    if (arm_current_el(env) == 3 &&
+        !(env->cp15.scr_el3 & (SCR_NS | SCR_EEL2))) {
         return CP_ACCESS_TRAP;
     }
     return CP_ACCESS_OK;
@@ -5756,12 +5766,15 @@ static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
-     * At Secure EL1 it traps to EL3.
+     * At Secure EL1 it traps to EL3 or EL2.
      */
     if (arm_current_el(env) == 3) {
         return CP_ACCESS_OK;
     }
     if (arm_is_secure_below_el3(env)) {
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_TRAP_EL2;
+        }
         return CP_ACCESS_TRAP_EL3;
     }
     /* Accesses from EL1 NS and EL2 NS are UNDEF for write but allow reads. */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 614a6853ca5..1653cca1aaa 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2832,9 +2832,20 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
         }
         if (s->current_el == 1) {
             /* If we're in Secure EL1 (which implies that EL3 is AArch64)
-             * then accesses to Mon registers trap to EL3
+             * then accesses to Mon registers trap to Secure EL2, if it exists,
+             * otherwise EL3.
              */
-            TCGv_i32 tcg_el = tcg_const_i32(3);
+            TCGv_i32 tcg_el;
+
+            if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
+                dc_isar_feature(aa64_sel2, s)) {
+                /* Target EL is EL<3 minus SCR_EL3.EEL2> */
+                tcg_el = load_cpu_field(cp15.scr_el3);
+                tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
+                tcg_gen_addi_i32(tcg_el, tcg_el, 3);
+            } else {
+                tcg_el = tcg_const_i32(3);
+            }
 
             gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
-- 
2.20.1


