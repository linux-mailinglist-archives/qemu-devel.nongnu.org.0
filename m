Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47994FAC34
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:02:20 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQeR-00053S-HV
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZp-0001yc-Jy
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZm-0002zC-TN
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:33 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so13559593pjk.4
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpS74LDHWG/S/DkrcIyrDZyCFuZ6BFbDpFALEvPQLBw=;
 b=pbpP/sv3V8pWGG7SwEwzlNOm6aChKj5XbhkJKMmfZ1KrDaaDHkWT0dkV+oV8Z3kcaL
 US+DcsehPjCfJjxrVxWJZUWThcKNLBLw96wFYp3bhlMbGwESEHEydh//IHvGvZYXf7+b
 9DflojKLX+CYVlYs4Kggjt52RQJQWqhMA9V5kG3D7HaaDuxo7US9GgIqOGM9BqBq4axI
 qeAu2jnWL1xgfq7DzujG5+zO8atmjyLYFDKsY1vAv6mbG43KpLsajKvtWp1tbQTrLOtL
 jvOqVkiDbEJj8vR3BYV9vO6Gmx4ehps6yjvfHHhzYZpFesQn0OV1UN6uSjBU2yNQYzEh
 wBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpS74LDHWG/S/DkrcIyrDZyCFuZ6BFbDpFALEvPQLBw=;
 b=puzmk9ci/6Nx7F8esqujpwkNxtuuoUhzUErix0W5r4MAieqXTHN+Iz82F/0wJK3cPs
 OaItKvIObSKAB4fYVtkUfuzLWHvSmjOG6V175qBb7Fh8e3sG3z4jfSXCrEV9Kt3YcW3D
 jsOsru+kGOs9sK9ZvtKHu0thR3B8DsoAspSBbOUYvSU92olhim1+Ze/+p+snPOOyJeQF
 1DHRau0wEl0cKvaNkgem2dc2caFh6ygdBqbnc9Uudg3/Olr0C/0JMEjEF089AS4yozqF
 dOyuHd1zMysOI//xJM00P8z5lmOJ+XQNTNHAe+FJIl5UbPn8Hp7sB3dVgyFMxw6ZeY7z
 gvew==
X-Gm-Message-State: AOAM532Q5adGiIb7oK8SAYrFGgOv7Xpad1KJYOjlCnegMf1JtvhxUYz8
 uL2CwMw2/mJQSCAYOoxBmA9wbiUK2mnPTg==
X-Google-Smtp-Source: ABdhPJz+yQBWWZP1OiZwO7XUSu8GmgJKPVe8CvDvj3PtdZ/kfofHi/tinaJHL41ZAkpq7U59dPuu0Q==
X-Received: by 2002:a17:90b:4c8e:b0:1c6:d1ed:f6b2 with SMTP id
 my14-20020a17090b4c8e00b001c6d1edf6b2mr29995305pjb.166.1649570249352; 
 Sat, 09 Apr 2022 22:57:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] target/arm: Enable FEAT_CSV2_2 for -cpu max
Date: Sat,  9 Apr 2022 22:57:21 -0700
Message-Id: <20220410055725.380246-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no branch prediction in TCG, therefore there is no
need to actually include the context number into the predictor.
Therefore all we need to do is add the state for SCXTNUM_ELx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 16 +++++++++++
 target/arm/cpu64.c  |  2 +-
 target/arm/helper.c | 70 ++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6c6d89a69..0b89620662 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -688,6 +688,8 @@ typedef struct CPUArchState {
         ARMPACKey apdb;
         ARMPACKey apga;
     } keys;
+
+    uint64_t scxtnum_el[4];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
@@ -1211,6 +1213,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_WXN     (1U << 19)
 #define SCTLR_ST      (1U << 20) /* up to ??, RAZ in v6 */
 #define SCTLR_UWXN    (1U << 20) /* v7 onward, AArch32 only */
+#define SCTLR_TSCXT   (1U << 20) /* FEAT_CSV2_1p2, AArch64 only */
 #define SCTLR_FI      (1U << 21) /* up to v7, v8 RES0 */
 #define SCTLR_IESB    (1U << 21) /* v8.2-IESB, AArch64 only */
 #define SCTLR_U       (1U << 22) /* up to v6, RAO in v7 */
@@ -4368,6 +4371,19 @@ static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa64_scxtnum(const ARMISARegisters *id)
+{
+    int key = FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, CSV2);
+    if (key >= 2) {
+        return true;      /* FEAT_CSV2_2 */
+    }
+    if (key == 1) {
+        key = FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, CSV2_FRAC);
+        return key >= 2;  /* FEAT_CSV2_1p2 */
+    }
+    return false;
+}
+
 static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c1006a067c..9ff08bd995 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -805,7 +805,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bd1c8e01cb..66af3397ee 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1780,6 +1780,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= SCR_ENSCXT;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -5312,6 +5315,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= HCR_ENSCXT;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5965,6 +5971,10 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
           "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
 
+        { K(3, 0, 0xd, 0, 7), K(3, 4, 0xd, 0, 7), K(3, 5, 0xd, 0, 7),
+          "SCXTNUM_EL1", "SCXTNUM_EL2", "SCXTNUM_EL12",
+          isar_feature_aa64_scxtnum },
+
         /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
         /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
     };
@@ -7434,7 +7444,61 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-#endif
+static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
+{
+    uint64_t hcr;
+
+    switch (arm_current_el(env)) {
+    case 0:
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_TGE | HCR_E2H)) != (HCR_TGE | HCR_E2H)) {
+            if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
+                if (hcr & HCR_TGE) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+                return CP_ACCESS_TRAP;
+            }
+            if (arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
+                return CP_ACCESS_TRAP_EL2;
+            }
+        } else {
+            QEMU_FALLTHROUGH;
+    case 1:
+            if (env->cp15.sctlr_el[2] & SCTLR_TSCXT) {
+                return CP_ACCESS_TRAP_EL2;
+            }
+        }
+        QEMU_FALLTHROUGH;
+    case 2:
+        if (arm_feature(env, ARM_FEATURE_EL3)
+            && !(env->cp15.scr_el3 & SCR_ENSCXT)) {
+            return CP_ACCESS_TRAP_EL3;
+        }
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo scxtnum_reginfo[] = {
+    { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 0xd, .crm = 0, .opc2 = 7,
+      .access = PL0_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
+    { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 0xd, .crm = 0, .opc2 = 7,
+      .access = PL1_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
+    { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 0xd, .crm = 0, .opc2 = 7,
+      .access = PL2_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[2]) },
+    { .name = "SCXTNUM_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 0xd, .crm = 0, .opc2 = 7,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[3]) },
+    REGINFO_SENTINEL
+};
+#endif /* TARGET_AARCH64 */
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
@@ -8634,6 +8698,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
         define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
+
+    if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+        define_arm_cp_regs(cpu, scxtnum_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
-- 
2.25.1


