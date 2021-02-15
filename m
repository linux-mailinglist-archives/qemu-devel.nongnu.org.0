Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D357831C3E5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:01:22 +0100 (CET)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlvl-0000V5-SS
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt9-0006Q4-Td
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:39 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:39627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt6-0007oO-9d
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:39 -0500
Received: by mail-il1-x130.google.com with SMTP id o15so6685033ilt.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g31olqeqAlYvuy3UNBSe5MnRp9TrW3RvM+hKwl28ZYI=;
 b=mVR9rntHZp0hGXth0okVNNNDfc18SVTPGfpyQ0WSzptkWWNLCiNCqjWaKCCVf0wIq/
 NbMG9EAoVozjLR5AvL8OJtWNcPojZ72wUfQkNI83/LNoVeU/VsrBIUtGIuhb0vaUbznz
 If6GaIyQhrJRbawXGe236Zqye+1H2/OKYfWbXcTNQPVV9XBvedupj+uwqi3Xx0X+xZO2
 X09OrPVMJy2ZtM4BRfKVohV29X741ek2VpgwqIAfRuyg9y1FIzFB0rUFIxM9YmUevxfK
 LgDR89NJJUbhGjIb6a53sQBZY4JjuuBkVOKAiVzhBPltrxmNnNlJNeIMo660EDGOjAwU
 muCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g31olqeqAlYvuy3UNBSe5MnRp9TrW3RvM+hKwl28ZYI=;
 b=exqUYFHnyrRogKiI4QYQf1iuhFt4cAq3VIEXCrbY2WnLwUpEPOpsG/tONY++GP6rKZ
 NUhVHteW3JP0WVOXCdxmhiXNzNhieoMuL6fHDaimhP5kL5VnrfYQVgWxsA8wdU6SjI5a
 xSxS4oqm17A/1e77F56GGcFSEa+QlZ/HWDr1MizASdGowoVmQXY0mCyl/s3yp7A7i+EG
 gyM0YcBUMS1ukA+iciVPOh6DrU4vO/x0HbnpVflNUy8GTkjckpq//hP9PG9+CGt4vnXz
 /9UNO+LULtTj2aORxRdUv+DB17K48ifPiVcDbiaqgcbirMV6iW3X7gCC0TFIOf3xnlYG
 vz+g==
X-Gm-Message-State: AOAM533z4or30dCa4jhElxnaiUaFI8PfAsWKh7ZVFtxwz4v60lBCF7mB
 dZ7C75PfVYM9BlufiXM/xVc0VA==
X-Google-Smtp-Source: ABdhPJyp7A6/+I0wTa/kAefPQST0/8D0/bGYjXRY1iP3JLvTJZhqo0zCDAfD3LPz/ag3XKW7jTYVOA==
X-Received: by 2002:a92:7307:: with SMTP id o7mr15185553ilc.266.1613426314425; 
 Mon, 15 Feb 2021 13:58:34 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id j12sm9812254ila.75.2021.02.15.13.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 13:58:34 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/3] target/arm: Add support for FEAT_SSBS,
 Speculative Store Bypass Safe
Date: Mon, 15 Feb 2021 14:58:17 -0700
Message-Id: <20210215215819.1142-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215215819.1142-1-rebecca@nuviainc.com>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x130.google.com
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
 target/arm/cpu.h           | 15 +++++-
 target/arm/helper-a64.c    |  6 +++
 target/arm/helper.c        | 52 ++++++++++++++++++++
 target/arm/internals.h     |  6 +++
 target/arm/translate-a64.c | 12 +++++
 5 files changed, 90 insertions(+), 1 deletion(-)

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
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index ae611d73c2c4..6b204c5a67ac 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -960,6 +960,12 @@ static void cpsr_write_from_spsr_elx(CPUARMState *env,
         val |= CPSR_DIT;
     }
 
+    /* Move SSBS to the correct location for CPSR */
+    if (val & PSTATE_SSBS) {
+        val &= ~PSTATE_SSBS;
+        val |= CPSR_SSBS;
+    }
+
     mask = aarch32_cpsr_valid_mask(env->features, \
         &env_archcpu(env)->isar);
     cpsr_write(env, val, mask, CPSRWriteRaw);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b94211c..a7c5dc3d420d 100644
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
@@ -9466,6 +9487,14 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     if (new_mode == ARM_CPU_MODE_HYP) {
         env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
         env->elr_el[2] = env->regs[15];
+
+        if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
+            if (env->cp15.hsctlr & SCTLR_DSSBS_32) {
+                env->uncached_cpsr |= CPSR_SSBS;
+            } else {
+                env->uncached_cpsr &= ~CPSR_SSBS;
+            }
+        }
     } else {
         /* CPSR.PAN is normally preserved preserved unless...  */
         if (cpu_isar_feature(aa32_pan, env_archcpu(env))) {
@@ -9486,6 +9515,14 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
                 break;
             }
         }
+
+        if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
+            if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_32) {
+                env->uncached_cpsr |= CPSR_SSBS;
+            } else {
+                env->uncached_cpsr &= ~CPSR_SSBS;
+            }
+        }
         /*
          * this is a lie, as there was no c1_sys on V4T/V5, but who cares
          * and we should just guard the thumb mode on V4
@@ -9809,6 +9846,13 @@ static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
         ret &= ~CPSR_DIT;
         ret |= PSTATE_DIT;
     }
+
+    /* Move SSBS to the correct location for SPSR_ELx */
+    if (ret & CPSR_SSBS) {
+        ret &= ~CPSR_SSBS;
+        ret |= PSTATE_SSBS;
+    }
+
     /* Merge PSTATE.SS into SPSR_ELx */
     ret |= env->pstate & PSTATE_SS;
 
@@ -9973,6 +10017,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
index 1c4b8d02f3b8..2372d55ea18b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1712,6 +1712,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         /* There's no need to rebuild hflags because DIT is a nop */
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
     case 0x1e: /* DAIFSet */
         t1 = tcg_const_i32(crm);
         gen_helper_msr_i_daifset(cpu_env, t1);
-- 
2.26.2


