Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E92FFBF0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 05:47:34 +0100 (CET)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2oM9-0007Be-5h
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 23:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKa-0005Wc-L4
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:56 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKY-0000iK-1H
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:56 -0500
Received: by mail-pl1-x629.google.com with SMTP id x18so2539442pln.6
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 20:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L5W98BS+qePyetQ3JdC9YY4Ow4oVa1fLbZ1axvKmbAI=;
 b=ph5Fy2q5Of/n+MO8HX0cu2zNnGTqZWQwxvuk55hPsH3O+GpEo+O0Ufk7DdVqwM6MuO
 +RiDPOn/a+dUo3eS5M/jgihtWfbCVWB4lYCo9vx9Vlt3P9AoTBrPUr0fDIfs4LcPvg4O
 Y0kmZZrj5QjEucWuNcEkTfH/mvVUzEbiCD+HqTSSyY4Ck6spFA8BBOKtQ52BS0vzrzo4
 JfS8glGBHN2NPO85TWE63lbRByTj6oDnq2M5nGYziCPImUJIMCxDmxYLU6JM57bIiqfp
 /wyn36WglLiKcBKtDjNdXgJUa0kKYEt8+9XOILFuak2gz4jE+pcAu6qnb6RUrTGu4g8F
 VnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L5W98BS+qePyetQ3JdC9YY4Ow4oVa1fLbZ1axvKmbAI=;
 b=ZPA0gkQxc78BnaOfwx3jsQZnZzr2PisKmgQRAyGzVQEdSwPLJpORHedUOHuoqObjqa
 P2EnXCYCnD2zMJdy0V4vYyWHrW9Pb+xzaylHAZ7sHvO8xF/2z0IuFrwv5kzs/P43PZM0
 ku7saePLwwF0UeqbdV/QU1/b1fETakYuRi1khGcKIGKDEnnStMXrPJ+Wv1I0fLIEMGIB
 NZC8yaUCzIAP8S5hI0US86X4yePypo+Lp8QdVX6EFAO4hTu1fB7GTR2M4ZUk7yXrpQZ6
 gbBi9Ef9dYrHxil4wgy4tzsLX2LHOKyc75ExlRxwxSaMJqCqHDWuuvIn31te66t+rsDU
 5yeQ==
X-Gm-Message-State: AOAM530bZgcZHpTrJIOUCVz17YFdyl/siAb+3xJOsL4DThsTBqcyl3I8
 1hZ8zoSaroJQMP86Rk8u04eYq9C030h+045uYOKfcJjyed1v3tMMWKJlVihoRXFclKOlFOfqtBp
 uwXqlbHp63DZ9tfOVPA6//Gh4VpFoKBvs7jIsYtw9cOiz0pt+ZWEKc1LlgamyYFBd7DLPJh/IRw
 ==
X-Google-Smtp-Source: ABdhPJxEyBjMVTb9uWwvdl82ZvWBxldFrwsywwiXJhXf4m0VODbfwsWhovj+MicvfuQ6E92bgO+DiA==
X-Received: by 2002:a17:90a:5509:: with SMTP id
 b9mr3184390pji.230.1611290752264; 
 Thu, 21 Jan 2021 20:45:52 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b10sm7050494pgh.15.2021.01.21.20.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 20:45:51 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Thu, 21 Jan 2021 21:45:36 -0700
Message-Id: <20210122044537.1823-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122044537.1823-1-rebecca@nuviainc.com>
References: <20210122044537.1823-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=rebecca@nuviainc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
feature for ARMv8.4. Since virtual machine execution is largely
nondeterministic and TCG is outside of the security domain, it's
implemented as a NOP.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h           | 12 +++++++++++
 target/arm/helper.c        | 22 ++++++++++++++++++++
 target/arm/internals.h     |  6 ++++++
 target/arm/translate-a64.c | 12 +++++++++++
 4 files changed, 52 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df0d6778330f..56b1053dfdec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1242,6 +1242,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IT_2_7 (0xfc00U)
 #define CPSR_GE (0xfU << 16)
 #define CPSR_IL (1U << 20)
+#define CPSR_DIT (1U << 21)
 #define CPSR_PAN (1U << 22)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
@@ -1309,6 +1310,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_DIT (1U << 24)
 #define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
@@ -3875,6 +3877,11 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
 }
 
+static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4119,6 +4126,11 @@ static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
 }
 
+static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 01b50316046b..c1e8ba5bd177 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4419,6 +4419,24 @@ static const ARMCPRegInfo uao_reginfo = {
     .readfn = aa64_uao_read, .writefn = aa64_uao_write
 };
 
+static uint64_t aa64_dit_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_DIT;
+}
+
+static void aa64_dit_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_DIT) | (value & PSTATE_DIT);
+}
+
+static const ARMCPRegInfo dit_reginfo = {
+    .name = "DIT", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 5,
+    .type = ARM_CP_NO_RAW, .access = PL0_RW,
+    .readfn = aa64_dit_read, .writefn = aa64_dit_write
+};
+
 static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
@@ -8203,6 +8221,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &uao_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_dit, cpu)) {
+        define_one_arm_cp_reg(cpu, &dit_reginfo);
+    }
+
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 853fa88fd616..3d11e42d8e1b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1222,6 +1222,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_aa32_pan(id)) {
         valid |= CPSR_PAN;
     }
+    if (isar_feature_aa32_dit(id)) {
+        valid |= CPSR_DIT;
+    }
 
     return valid;
 }
@@ -1240,6 +1243,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_uao(id)) {
         valid |= PSTATE_UAO;
     }
+    if (isar_feature_aa64_dit(id)) {
+        valid |= PSTATE_DIT;
+    }
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ffc060e5d70c..1c4b8d02f3b8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1700,6 +1700,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         tcg_temp_free_i32(t1);
         break;
 
+    case 0x1a: /* DIT */
+        if (!dc_isar_feature(aa64_dit, s)) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_DIT);
+        } else {
+            clear_pstate_bits(PSTATE_DIT);
+        }
+        /* There's no need to rebuild hflags because DIT is a nop */
+        break;
+
     case 0x1e: /* DAIFSet */
         t1 = tcg_const_i32(crm);
         gen_helper_msr_i_daifset(cpu_env, t1);
-- 
2.26.2


