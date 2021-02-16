Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08831D2D8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 23:51:03 +0100 (CET)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9BO-00067T-AD
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 17:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96Y-0000vB-Jo
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:46:02 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:34064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96O-0004sJ-Mu
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:46:02 -0500
Received: by mail-ot1-x335.google.com with SMTP id b16so8021262otq.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 14:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5P6YxnXQSfQV1rvzo56pSgpKXJwdD6Qy9MoHnPSuEQ4=;
 b=fuYoTdPF3TyE/eHtguZ4/wZ8HA1C4DYn/7l5mfB7Tb6WgT64cjPqlEcYHDZ5qFvdc4
 9cRxkTboqcHV08N7fg5rpJd/wmsPP3FYxomtaxub/INKLssa73i4Q0WeyLoLWJ+Iy0ft
 IgPJAS/ps6fmfd23/KIIoqJRdDdo7FRoa2LR+5RMSLVj9DQImUmOK+ivk5xvey9OKHE8
 AHWNr1ktsvQrpOHeWAaf5CGMULtWCNTpxpTMxjAgy2fZoYufTiHR549a7NZKRWe9Xkf4
 9r4NkjgFbev/TNs/njF5faBmUY3yMDFX+SngGElQzXXKVBmljegK/jj2+XqUBWFr3eAO
 Sjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5P6YxnXQSfQV1rvzo56pSgpKXJwdD6Qy9MoHnPSuEQ4=;
 b=PHTLmzznRwaostpbdwW13oYoVxI9rBfh8VIZj1KNsyFoQ93BCNYXijpMiTrw+3yl4d
 ImR4n+MWyWUXAea6OewPICNt+M7DzHi+qFBafaBa66OqZZLJ5auc226vVEDT2xxFKS5P
 rG928LvLixwm14Q/y35N5ln72YFiQiuc+eASik0GpoS1G5at2w3LdqR97MFf8c9OU2En
 cIt197wCswPRfJPFZ/geFdLpjwg8wI2fJX1ojA1B7qxlWXLYm7vCMvAETeMULjthS3z4
 ySeNhTX/wOxKjsPag0nCgJGOIumnMvyi9AqF8ZrI6l7kqCOfMs8L5JaT3q4EBY8ar2UJ
 2GvA==
X-Gm-Message-State: AOAM533ctzTm63ofqBUl+SYjLmHQw3jE1RfPwFAAybJmK3iza5UiO8OL
 w5s6oGC+58lTrIt+eMvZ9oKQlw==
X-Google-Smtp-Source: ABdhPJyheHAGsdO+Sj5/m5Vfn9Ni4waLeOMqRk7rCGHCCSJI4MAuG+mi4BzOOPhCIwiNGurP4Bc7UA==
X-Received: by 2002:a05:6830:903:: with SMTP id
 v3mr15796778ott.46.1613515551561; 
 Tue, 16 Feb 2021 14:45:51 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b12sm32909oti.65.2021.02.16.14.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 14:45:50 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/3] target/arm: Add support for FEAT_SSBS,
 Speculative Store Bypass Safe
Date: Tue, 16 Feb 2021 15:45:41 -0700
Message-Id: <20210216224543.16142-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216224543.16142-1-rebecca@nuviainc.com>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for FEAT_SSBS. SSBS (Speculative Store Bypass Safe) is an
optional feature in ARMv8.0, and mandatory in ARMv8.5.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h           | 15 +++++++-
 target/arm/helper.c        | 37 ++++++++++++++++++++
 target/arm/internals.h     |  6 ++++
 target/arm/translate-a64.c | 12 +++++++
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f240275407bc..a0a3ee7bcde9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1201,6 +1201,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_TE      (1U << 30) /* AArch32 only */
 #define SCTLR_EnIB    (1U << 30) /* v8.3, AArch64 only */
 #define SCTLR_EnIA    (1U << 31) /* v8.3, AArch64 only */
+#define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
 #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
 #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
 #define SCTLR_ITFSB   (1ULL << 37) /* v8.5-MemTag */
@@ -1208,7 +1209,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_TCF     (3ULL << 40) /* v8.5-MemTag */
 #define SCTLR_ATA0    (1ULL << 42) /* v8.5-MemTag */
 #define SCTLR_ATA     (1ULL << 43) /* v8.5-MemTag */
-#define SCTLR_DSSBS   (1ULL << 44) /* v8.5 */
+#define SCTLR_DSSBS_64 (1ULL << 44) /* v8.5, AArch64 only */
 
 #define CPTR_TCPAC    (1U << 31)
 #define CPTR_TTA      (1U << 20)
@@ -1245,6 +1246,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IL (1U << 20)
 #define CPSR_DIT (1U << 21)
 #define CPSR_PAN (1U << 22)
+#define CPSR_SSBS (1U << 23)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
 #define CPSR_Q (1U << 27)
@@ -1307,6 +1309,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_A (1U << 8)
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
+#define PSTATE_SSBS (1U << 12)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
@@ -3883,6 +3886,11 @@ static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4137,6 +4145,11 @@ static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b94211c..fedcf2e739e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4450,6 +4450,24 @@ static const ARMCPRegInfo dit_reginfo = {
     .readfn = aa64_dit_read, .writefn = aa64_dit_write
 };
 
+static uint64_t aa64_ssbs_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_SSBS;
+}
+
+static void aa64_ssbs_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_SSBS) | (value & PSTATE_SSBS);
+}
+
+static const ARMCPRegInfo ssbs_reginfo = {
+    .name = "SSBS", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 6,
+    .type = ARM_CP_NO_RAW, .access = PL0_RW,
+    .readfn = aa64_ssbs_read, .writefn = aa64_ssbs_write
+};
+
 static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
@@ -8244,6 +8262,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_dit, cpu)) {
         define_one_arm_cp_reg(cpu, &dit_reginfo);
     }
+    if (cpu_isar_feature(aa64_ssbs, cpu)) {
+        define_one_arm_cp_reg(cpu, &ssbs_reginfo);
+    }
 
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
@@ -9463,6 +9484,14 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     env->uncached_cpsr &= ~(CPSR_IL | CPSR_J);
     env->daif |= mask;
 
+    if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
+        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_32) {
+            env->uncached_cpsr |= CPSR_SSBS;
+        } else {
+            env->uncached_cpsr &= ~CPSR_SSBS;
+        }
+    }
+
     if (new_mode == ARM_CPU_MODE_HYP) {
         env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
         env->elr_el[2] = env->regs[15];
@@ -9973,6 +10002,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         new_mode |= PSTATE_TCO;
     }
 
+    if (cpu_isar_feature(aa64_ssbs, cpu)) {
+        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_64) {
+            new_mode |= PSTATE_SSBS;
+        } else {
+            new_mode &= ~PSTATE_SSBS;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b251fe44506b..d92aeb57d782 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1231,6 +1231,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_aa32_dit(id)) {
         valid |= CPSR_DIT;
     }
+    if (isar_feature_aa32_ssbs(id)) {
+        valid |= CPSR_SSBS;
+    }
 
     return valid;
 }
@@ -1252,6 +1255,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_dit(id)) {
         valid |= PSTATE_DIT;
     }
+    if (isar_feature_aa64_ssbs(id)) {
+        valid |= PSTATE_SSBS;
+    }
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1c4b8d02f3b8..4dc72736d649 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1700,6 +1700,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         tcg_temp_free_i32(t1);
         break;
 
+    case 0x19: /* SSBS */
+        if (!dc_isar_feature(aa64_ssbs, s)) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_SSBS);
+        } else {
+            clear_pstate_bits(PSTATE_SSBS);
+        }
+        /* Don't need to rebuild hflags since SSBS is a nop */
+        break;
+
     case 0x1a: /* DIT */
         if (!dc_isar_feature(aa64_dit, s)) {
             goto do_unallocated;
-- 
2.26.2


