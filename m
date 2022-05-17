Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17FA52993C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:02:53 +0200 (CEST)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqIG-0001CC-N8
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4n-0000Tg-Rg
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:48:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4l-0007nY-4s
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:48:57 -0400
Received: by mail-pl1-x631.google.com with SMTP id n8so16439731plh.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6iXgfu3U31v7MEJyJm8Rq3CUs2tIrolz0tZM3iDqk8o=;
 b=LSvgDqQ//M1R8gx+SjYvFytOeeOAGlHcvzhTJgmr4zlliZ1OX7r8jYFDTWDqiAcja/
 UwJVcIwDHywje5l+tB0YWb1+vdJQ9YdJOKle5g3XaYBiCarVTSO+cZ/9qm4aw4+wlPH5
 Jt8Mf644qf7AMQw74m0QfFeVdRQ3FOBBHQz8y1c9TX8+aJZ3v1eyGoflkzLILhsjfV9/
 SHWb8smbzs7LX6pZiaGBejhCk29xszWFhEGLbtdiixknll/2xS+TfAsVY94HRwM+jZC3
 zXo6W1SLF96k5I0NNZjl1raSEClVaQyXfcGdO8zwXxb0LrNlpzFZJOrR3yXSmj7i7318
 Fh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6iXgfu3U31v7MEJyJm8Rq3CUs2tIrolz0tZM3iDqk8o=;
 b=j7A0ivC6tgst9CNuu12e5P/s7Xp1rEA8v4IWOyy/LqCD4S4x+02e2Y0NZ6rmkaAPxY
 6uvg7DyTfA4iogjZbhfP/ODvj3zKVQZaXP77n72lFOjmhiAVj+P1k9BGucFaU/tuEgnr
 SpuailY0y6I6ol60gIjbau493X7fT9ZJLV73znvgNDZcnuGNxP/94IOqzTDLQVEk3bOs
 MQWH4kASfl8Xq8zOlMXS2SA5eevvGJV0FQbjKRB9YtYfGmmaQG0DxoOYQn5OalH0q/mK
 xKcPIn9KGS7x8XcFwjQCTbqsT12O7+fmS6pLP6c+NctyOer+o2vUFptyNIvd5oU+LBA/
 ob5Q==
X-Gm-Message-State: AOAM530o5hpOODx9iuvWHIjH6PA3N4bBsO8afVQ9lQhEgr/9fTfgUCne
 wcCz0iXRECDhHL5UmuQqxBumbSch2Jfo7Q==
X-Google-Smtp-Source: ABdhPJztCQrC0WTubfP/KYUSvyB0FlTBPtJsQcSQtRJozJTyWdapwTNm2s/ciimAu5oDD5j6IvWSdA==
X-Received: by 2002:a17:903:1c9:b0:161:89e8:229 with SMTP id
 e9-20020a17090301c900b0016189e80229mr6383982plh.106.1652766533651; 
 Mon, 16 May 2022 22:48:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/7] target/arm: Use FIELD definitions for CPACR, CPTR_ELx
Date: Mon, 16 May 2022 22:48:45 -0700
Message-Id: <20220517054850.177016-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

We had a few CPTR_* bits defined, but missed quite a few.
Complete all of the fields up to ARMv9.2.
Use FIELD_EX64 instead of manual extract32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 44 +++++++++++++++++++++++++++++++-----
 hw/arm/boot.c       |  2 +-
 target/arm/cpu.c    | 11 ++++++---
 target/arm/helper.c | 54 ++++++++++++++++++++++-----------------------
 4 files changed, 75 insertions(+), 36 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b35b117fe7..d23b7b3ad4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1259,11 +1259,45 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
 #define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
 
-#define CPTR_TCPAC    (1U << 31)
-#define CPTR_TTA      (1U << 20)
-#define CPTR_TFP      (1U << 10)
-#define CPTR_TZ       (1U << 8)   /* CPTR_EL2 */
-#define CPTR_EZ       (1U << 8)   /* CPTR_EL3 */
+/* Bit definitions for CPACR (AArch32 only) */
+FIELD(CPACR, CP10, 20, 2)
+FIELD(CPACR, CP11, 22, 2)
+FIELD(CPACR, TRCDIS, 28, 1)    /* matches CPACR_EL1.TTA */
+FIELD(CPACR, D32DIS, 30, 1)    /* up to v7; RAZ in v8 */
+FIELD(CPACR, ASEDIS, 31, 1)
+
+/* Bit definitions for CPACR_EL1 (AArch64 only) */
+FIELD(CPACR_EL1, ZEN, 16, 2)
+FIELD(CPACR_EL1, FPEN, 20, 2)
+FIELD(CPACR_EL1, SMEN, 24, 2)
+FIELD(CPACR_EL1, TTA, 28, 1)   /* matches CPACR.TRCDIS */
+
+/* Bit definitions for HCPTR (AArch32 only) */
+FIELD(HCPTR, TCP10, 10, 1)
+FIELD(HCPTR, TCP11, 11, 1)
+FIELD(HCPTR, TASE, 15, 1)
+FIELD(HCPTR, TTA, 20, 1)
+FIELD(HCPTR, TAM, 30, 1)       /* matches CPTR_EL2.TAM */
+FIELD(HCPTR, TCPAC, 31, 1)     /* matches CPTR_EL2.TCPAC */
+
+/* Bit definitions for CPTR_EL2 (AArch64 only) */
+FIELD(CPTR_EL2, TZ, 8, 1)      /* !E2H */
+FIELD(CPTR_EL2, TFP, 10, 1)    /* !E2H, matches HCPTR.TCP10 */
+FIELD(CPTR_EL2, TSM, 12, 1)    /* !E2H */
+FIELD(CPTR_EL2, ZEN, 16, 2)    /* E2H */
+FIELD(CPTR_EL2, FPEN, 20, 2)   /* E2H */
+FIELD(CPTR_EL2, SMEN, 24, 2)   /* E2H */
+FIELD(CPTR_EL2, TTA, 28, 1)
+FIELD(CPTR_EL2, TAM, 30, 1)    /* matches HCPTR.TAM */
+FIELD(CPTR_EL2, TCPAC, 31, 1)  /* matches HCPTR.TCPAC */
+
+/* Bit definitions for CPTR_EL3 (AArch64 only) */
+FIELD(CPTR_EL3, EZ, 8, 1)
+FIELD(CPTR_EL3, TFP, 10, 1)
+FIELD(CPTR_EL3, ESM, 12, 1)
+FIELD(CPTR_EL3, TTA, 20, 1)
+FIELD(CPTR_EL3, TAM, 30, 1)
+FIELD(CPTR_EL3, TCPAC, 31, 1)
 
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a47f38dfc9..a8de33fd64 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -761,7 +761,7 @@ static void do_cpu_reset(void *opaque)
                         env->cp15.scr_el3 |= SCR_ATA;
                     }
                     if (cpu_isar_feature(aa64_sve, cpu)) {
-                        env->cp15.cptr_el[3] |= CPTR_EZ;
+                        env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
                     }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 029f644768..d2bd74c2ed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -201,9 +201,11 @@ static void arm_cpu_reset(DeviceState *dev)
         /* Trap on btype=3 for PACIxSP. */
         env->cp15.sctlr_el[1] |= SCTLR_BT0;
         /* and to the FP/Neon instructions */
-        env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
+        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                         CPACR_EL1, FPEN, 3);
         /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
+        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                         CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
             env->vfp.zcr_el[1] =
@@ -252,7 +254,10 @@ static void arm_cpu_reset(DeviceState *dev)
     } else {
 #if defined(CONFIG_USER_ONLY)
         /* Userspace expects access to cp10 and cp11 for FP/Neon */
-        env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 4, 0xf);
+        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                         CPACR, CP10, 3);
+        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                         CPACR, CP11, 3);
 #endif
     }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 93ab552346..5fd64b742a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -767,11 +767,14 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
          */
         if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
             /* VFP coprocessor: cp10 & cp11 [23:20] */
-            mask |= (1 << 31) | (1 << 30) | (0xf << 20);
+            mask |= R_CPACR_ASEDIS_MASK |
+                    R_CPACR_D32DIS_MASK |
+                    R_CPACR_CP11_MASK |
+                    R_CPACR_CP10_MASK;
 
             if (!arm_feature(env, ARM_FEATURE_NEON)) {
                 /* ASEDIS [31] bit is RAO/WI */
-                value |= (1 << 31);
+                value |= R_CPACR_ASEDIS_MASK;
             }
 
             /* VFPv3 and upwards with NEON implement 32 double precision
@@ -779,7 +782,7 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
              */
             if (!cpu_isar_feature(aa32_simd_r32, env_archcpu(env))) {
                 /* D32DIS [30] is RAO/WI if D16-31 are not implemented. */
-                value |= (1 << 30);
+                value |= R_CPACR_D32DIS_MASK;
             }
         }
         value &= mask;
@@ -791,8 +794,8 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
         !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
-        value &= ~(0xf << 20);
-        value |= env->cp15.cpacr_el1 & (0xf << 20);
+        mask = R_CPACR_CP11_MASK | R_CPACR_CP10_MASK;
+        value = (value & ~mask) | (env->cp15.cpacr_el1 & mask);
     }
 
     env->cp15.cpacr_el1 = value;
@@ -808,7 +811,7 @@ static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
         !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
-        value &= ~(0xf << 20);
+        value = ~(R_CPACR_CP11_MASK | R_CPACR_CP10_MASK);
     }
     return value;
 }
@@ -828,11 +831,11 @@ static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
     if (arm_feature(env, ARM_FEATURE_V8)) {
         /* Check if CPACR accesses are to be trapped to EL2 */
         if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
-            (env->cp15.cptr_el[2] & CPTR_TCPAC)) {
+            FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TCPAC)) {
             return CP_ACCESS_TRAP_EL2;
         /* Check if CPACR accesses are to be trapped to EL3 */
         } else if (arm_current_el(env) < 3 &&
-                   (env->cp15.cptr_el[3] & CPTR_TCPAC)) {
+                   FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, TCPAC)) {
             return CP_ACCESS_TRAP_EL3;
         }
     }
@@ -844,7 +847,8 @@ static CPAccessResult cptr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     /* Check if CPTR accesses are set to trap to EL3 */
-    if (arm_current_el(env) == 2 && (env->cp15.cptr_el[3] & CPTR_TCPAC)) {
+    if (arm_current_el(env) == 2 &&
+        FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, TCPAC)) {
         return CP_ACCESS_TRAP_EL3;
     }
 
@@ -5333,8 +5337,8 @@ static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
         !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
-        value &= ~(0x3 << 10);
-        value |= env->cp15.cptr_el[2] & (0x3 << 10);
+        uint64_t mask = R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
+        value = (value & ~mask) | (env->cp15.cptr_el[2] & mask);
     }
     env->cp15.cptr_el[2] = value;
 }
@@ -5349,7 +5353,7 @@ static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
         !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
-        value |= 0x3 << 10;
+        value |= R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
     }
     return value;
 }
@@ -6144,8 +6148,7 @@ int sve_exception_el(CPUARMState *env, int el)
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
 
     if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        /* Check CPACR.ZEN.  */
-        switch (extract32(env->cp15.cpacr_el1, 16, 2)) {
+        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, ZEN)) {
         case 1:
             if (el != 0) {
                 break;
@@ -6158,7 +6161,7 @@ int sve_exception_el(CPUARMState *env, int el)
         }
 
         /* Check CPACR.FPEN.  */
-        switch (extract32(env->cp15.cpacr_el1, 20, 2)) {
+        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN)) {
         case 1:
             if (el != 0) {
                 break;
@@ -6175,8 +6178,7 @@ int sve_exception_el(CPUARMState *env, int el)
      */
     if (el <= 2) {
         if (hcr_el2 & HCR_E2H) {
-            /* Check CPTR_EL2.ZEN.  */
-            switch (extract32(env->cp15.cptr_el[2], 16, 2)) {
+            switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
                 if (el != 0 || !(hcr_el2 & HCR_TGE)) {
                     break;
@@ -6187,8 +6189,7 @@ int sve_exception_el(CPUARMState *env, int el)
                 return 2;
             }
 
-            /* Check CPTR_EL2.FPEN.  */
-            switch (extract32(env->cp15.cptr_el[2], 20, 2)) {
+            switch (FIELD_EX32(env->cp15.cptr_el[2], CPTR_EL2, FPEN)) {
             case 1:
                 if (el == 2 || !(hcr_el2 & HCR_TGE)) {
                     break;
@@ -6199,10 +6200,10 @@ int sve_exception_el(CPUARMState *env, int el)
                 return 0;
             }
         } else if (arm_is_el2_enabled(env)) {
-            if (env->cp15.cptr_el[2] & CPTR_TZ) {
+            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-            if (env->cp15.cptr_el[2] & CPTR_TFP) {
+            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TFP)) {
                 return 0;
             }
         }
@@ -6210,7 +6211,7 @@ int sve_exception_el(CPUARMState *env, int el)
 
     /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
     if (arm_feature(env, ARM_FEATURE_EL3)
-        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, EZ)) {
         return 3;
     }
 #endif
@@ -13266,7 +13267,7 @@ int fp_exception_el(CPUARMState *env, int cur_el)
      * This register is ignored if E2H+TGE are both set.
      */
     if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        int fpen = extract32(env->cp15.cpacr_el1, 20, 2);
+        int fpen = FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN);
 
         switch (fpen) {
         case 0:
@@ -13312,8 +13313,7 @@ int fp_exception_el(CPUARMState *env, int cur_el)
      */
     if (cur_el <= 2) {
         if (hcr_el2 & HCR_E2H) {
-            /* Check CPTR_EL2.FPEN.  */
-            switch (extract32(env->cp15.cptr_el[2], 20, 2)) {
+            switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, FPEN)) {
             case 1:
                 if (cur_el != 0 || !(hcr_el2 & HCR_TGE)) {
                     break;
@@ -13324,14 +13324,14 @@ int fp_exception_el(CPUARMState *env, int cur_el)
                 return 2;
             }
         } else if (arm_is_el2_enabled(env)) {
-            if (env->cp15.cptr_el[2] & CPTR_TFP) {
+            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TFP)) {
                 return 2;
             }
         }
     }
 
     /* CPTR_EL3 : present in v8 */
-    if (env->cp15.cptr_el[3] & CPTR_TFP) {
+    if (FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, TFP)) {
         /* Trap all FP ops to EL3 */
         return 3;
     }
-- 
2.34.1


