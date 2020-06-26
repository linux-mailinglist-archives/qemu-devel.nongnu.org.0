Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F820B475
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:25:23 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joqED-0002rT-Vu
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq44-0002IY-GC
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:52 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq41-0006N6-KH
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:52 -0400
Received: by mail-wm1-x342.google.com with SMTP id o8so9155768wmh.4
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3JhZ3wDYLmG32gJ9N1aTvgQgu0hTvog32hizBZWQ+I4=;
 b=lk7yOhD1x7iMf50nPEYIQ5fkX9qzBLdPGrdHYzFL2tIXgHua3CXBAmxIF+4IFzYnMX
 vA8GcAqQVy8h/Aarw26/bDljpolz1IxsOEleECgq7CJUzTGftXUdRigxjxAn+tj8ICrN
 pHHl/rtVLePWuoIeXqQf6sVGFfUWe1meKXykV3pdpU2ikQIEWsEQW/+2MDbdKJzsWiEG
 6sfPXKFJNQDNffifLJ8yMtu52B1kds5TV0VCiKN7vLZPCNYfS1MSCvUQweToYamxMX9Z
 9pNecootrdBkbh4bASCq3GZTv+XGcIQDOLDPe0aclymxOZTdP/nsnAyRE2Sd1u3aXvIq
 tb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3JhZ3wDYLmG32gJ9N1aTvgQgu0hTvog32hizBZWQ+I4=;
 b=ny/GzjfePJeWJsK1XuZ/AB84F7p8excZmahN5R+EhnFsMfF9o+BNX6tMaKRxRzUlhz
 z9q6Bh4Q08jP7Bl+3UCmU+xrtyznczunYVin9gfcTaDJO83hArtCINRFet9YxKOM4j7H
 45Dv99wCiJXrFgTAF6TIuWBR0pnk5vyNDTLBe7IVhBFx+m6DGuib0iJvpo9oez5rC8P7
 bxzqAtLcDtDSVvexci6SayT8Z8vZ7dQwoB5pUzhfUCt3+zKNwcw9wHHO2hV7etG8q2E9
 ypmexq6H2UaK+ZwjB0i2YuvttUT4T+vdAZI7x45MJhbO7AabtSp0ewi74o4Mo4Av6AqA
 ZodA==
X-Gm-Message-State: AOAM532SbH6GSKW9wE2JBA1vx10oiBa81CxpuNTuFl+t6Sv7begYQKdV
 53Ej/YrwYYjpyMishobYBLQUTZY+ti1VyA==
X-Google-Smtp-Source: ABdhPJygOJ856Fk1SJi2LlmchHz+HiUalg9XUJqVpmTOGK8fh6ObHUSls0IJNnTIbyr1O3L7xDjGXA==
X-Received: by 2002:a05:600c:2202:: with SMTP id
 z2mr4155883wml.13.1593184487789; 
 Fri, 26 Jun 2020 08:14:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.14.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:14:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/57] target/arm: Add MTE system registers
Date: Fri, 26 Jun 2020 16:13:46 +0100
Message-Id: <20200626151424.30117-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

From: Richard Henderson <richard.henderson@linaro.org>

This is TFSRE0_EL1, TFSR_EL1, TFSR_EL2, TFSR_EL3,
RGSR_EL1, GCR_EL1, GMID_EL1, and PSTATE.TCO.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200626033144.790098-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  4 ++
 target/arm/internals.h     |  9 ++++
 target/arm/helper.c        | 94 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 21 +++++++++
 4 files changed, 128 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ff70115801f..0a98b6a06d6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -502,6 +502,9 @@ typedef struct CPUARMState {
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
+        uint64_t tfsr_el[4]; /* tfsre0_el1 is index 0.  */
+        uint64_t gcr_el1;
+        uint64_t rgsr_el1;
     } cp15;
 
     struct {
@@ -1282,6 +1285,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4bdbc3a8ace..56b46726857 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1159,6 +1159,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_uao(id)) {
         valid |= PSTATE_UAO;
     }
+    if (isar_feature_aa64_mte(id)) {
+        valid |= PSTATE_TCO;
+    }
 
     return valid;
 }
@@ -1234,4 +1237,10 @@ void arm_log_exception(int idx);
 
 #endif /* !CONFIG_USER_ONLY */
 
+/*
+ * The log2 of the words in the tag block, for GMID_EL1.BS.
+ * The is the maximum, 256 bytes, which manipulates 64-bits of tags.
+ */
+#define GMID_EL1_BS  6
+
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d6c326b58e8..b4842ea23eb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5881,6 +5881,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
 
+        { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
+          "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
+
         /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
         /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
     };
@@ -6855,6 +6858,86 @@ static const ARMCPRegInfo dcpodp_reg[] = {
 };
 #endif /*CONFIG_USER_ONLY*/
 
+static CPAccessResult access_aa64_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
+                                       bool isread)
+{
+    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID5)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult access_mte(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 &&
+        arm_feature(env, ARM_FEATURE_EL2) &&
+        !(arm_hcr_el2_eff(env) & HCR_ATA)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 &&
+        arm_feature(env, ARM_FEATURE_EL3) &&
+        !(env->cp15.scr_el3 & SCR_ATA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static uint64_t tco_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_TCO;
+}
+
+static void tco_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
+{
+    env->pstate = (env->pstate & ~PSTATE_TCO) | (val & PSTATE_TCO);
+}
+
+static const ARMCPRegInfo mte_reginfo[] = {
+    { .name = "TFSRE0_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 6, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[0]) },
+    { .name = "TFSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 6, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[1]) },
+    { .name = "TFSR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 6, .opc2 = 0,
+      .access = PL2_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[2]) },
+    { .name = "TFSR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 5, .crm = 6, .opc2 = 0,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[3]) },
+    { .name = "RGSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 5,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.rgsr_el1) },
+    { .name = "GCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcr_el1) },
+    { .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
+      .access = PL1_R, .accessfn = access_aa64_tid5,
+      .type = ARM_CP_CONST, .resetvalue = GMID_EL1_BS },
+    { .name = "TCO", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
+      .type = ARM_CP_NO_RAW,
+      .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    REGINFO_SENTINEL
+};
+
+static const ARMCPRegInfo mte_tco_ro_reginfo[] = {
+    { .name = "TCO", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
+      .type = ARM_CP_CONST, .access = PL0_RW, },
+    REGINFO_SENTINEL
+};
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -7980,6 +8063,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     }
 #endif /*CONFIG_USER_ONLY*/
+
+    /*
+     * If full MTE is enabled, add all of the system registers.
+     * If only "instructions available at EL0" are enabled,
+     * then define only a RAZ/WI version of PSTATE.TCO.
+     */
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        define_arm_cp_regs(cpu, mte_reginfo);
+    } else if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
+        define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 027be7d8c29..d4793dd8fea 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1619,6 +1619,27 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
 
+    case 0x1c: /* TCO */
+        if (dc_isar_feature(aa64_mte, s)) {
+            /* Full MTE is enabled -- set the TCO bit as directed. */
+            if (crm & 1) {
+                set_pstate_bits(PSTATE_TCO);
+            } else {
+                clear_pstate_bits(PSTATE_TCO);
+            }
+            t1 = tcg_const_i32(s->current_el);
+            gen_helper_rebuild_hflags_a64(cpu_env, t1);
+            tcg_temp_free_i32(t1);
+            /* Many factors, including TCO, go into MTE_ACTIVE. */
+            s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
+        } else if (dc_isar_feature(aa64_mte_insn_reg, s)) {
+            /* Only "instructions accessible at EL0" -- PSTATE.TCO is WI.  */
+            s->base.is_jmp = DISAS_NEXT;
+        } else {
+            goto do_unallocated;
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
-- 
2.20.1


