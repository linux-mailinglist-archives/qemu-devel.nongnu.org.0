Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18827156457
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 14:01:59 +0100 (CET)
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0PkE-0005pv-4t
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 08:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j0Pgt-0000f0-9w
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j0Pgr-0004v4-Us
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:31 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j0Pgr-0004t9-O2
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:29 -0500
Received: by mail-wm1-x341.google.com with SMTP id a5so5226838wmb.0
 for <qemu-devel@nongnu.org>; Sat, 08 Feb 2020 04:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffmGYNu7uQNDZ2hXeKd5mhG9+9eYvjRJF/DWhIeGdyE=;
 b=bqc/suh07UkZaHOWJTB3WR1DJjkk9Dj2nl2tPZWLdeYLtUDIZcNxLPxZrPsDmiPSWw
 u7RmwzJEII7t1JIw5n0StyroM/05OjZ3c1WFVgqQKkB5Bw+H33JG9JdPUx8v+VCtjCCK
 KKtj3t011CCZkMHf/W/YMdUvWXzcXVkaFADF8JEcqVegwsUkVg3FHvdUPSGJTLarHKGC
 AP1sxc5bYEsbVzZ3KtlBRX6ustIR5y+b2mEUEWy4ynYqhlBu1SDHmSKXsiPOuBNcoNfx
 9XemfJPhLO/ggnnImsxeHq2Ovaimb2S82JPoObjwZwFAyOHzMD/BMoAYWoW22i0fAGff
 gIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffmGYNu7uQNDZ2hXeKd5mhG9+9eYvjRJF/DWhIeGdyE=;
 b=YcjDT0IscQEMYeXpKgdjIwyFASEqInfqxR9mpjoR/h19wL8k7VwojB8B8X0T7AZJZS
 3v1hGc83Owx0jxIdPR4QzJLHqh814CXCYVQro+nr2WoBojkMfJA79A3lvdENgFVBCkLc
 nSrgmJIhmvUUEmxSeEwKbJHSpiQlWKT5+IZMSgn1LUMgiMLJxKDICx5CTmG4TxN9GLAk
 XfnjREALm/cDCwSxp6kxtFFKpCXL717pQuxN9fUhHvsFumS3cm/7aHHOggDzFQLxz3fd
 RqAfVK1J8rOlJJBs7JOTdquKNMJXKW8ShvxnHUFw6VLUuZzhSbgSH19tFMxZ9zmYaM3t
 yysw==
X-Gm-Message-State: APjAAAXGljzKmOvGx9HDGkyfb9ZGxp2d/ZcXG/4XtJ7d9x2XuVDBqH0j
 cbv8HrZLAj+BgckpBKXIeZrSSvcSathkpQ==
X-Google-Smtp-Source: APXvYqw93gxjKe9NuAjBvZodXsCtTrHaY26MC/FF2z3ZYJXCd3Hyv4ocBn0+RQlROp9soBNyCLc1og==
X-Received: by 2002:a05:600c:10d2:: with SMTP id
 l18mr4334225wmd.122.1581166708502; 
 Sat, 08 Feb 2020 04:58:28 -0800 (PST)
Received: from localhost.localdomain ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id p5sm7490534wrt.79.2020.02.08.04.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 04:58:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/20] target/arm: Update MSR access for PAN
Date: Sat,  8 Feb 2020 12:58:07 +0000
Message-Id: <20200208125816.14954-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200208125816.14954-1-richard.henderson@linaro.org>
References: <20200208125816.14954-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For aarch64, there's a dedicated msr (imm, reg) insn.
For aarch32, this is done via msr to cpsr.  Writes from el0
are ignored, which is already handled by the CPSR_USER mask.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Move regdef to file scope; merge patch for CPSR_RESERVED:
    do not remove CPSR_SSBS from CPSR_RESERVED yet, mask PAN
    from CPSR if feature not enabled (pmm).
v3: Update for cpsr_valid_mask etc.
---
 target/arm/cpu.h           |  2 ++
 target/arm/internals.h     |  6 ++++++
 target/arm/helper.c        | 21 +++++++++++++++++++++
 target/arm/translate-a64.c | 14 ++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6dff1d55b..65a0ef8cd6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1186,6 +1186,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IT_2_7 (0xfc00U)
 #define CPSR_GE (0xfU << 16)
 #define CPSR_IL (1U << 20)
+#define CPSR_PAN (1U << 22)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
 #define CPSR_Q (1U << 27)
@@ -1250,6 +1251,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
+#define PSTATE_PAN (1U << 22)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 034d98ad53..f6709a2b08 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1081,6 +1081,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_jazelle(id)) {
         valid |= CPSR_J;
     }
+    if (isar_feature_aa32_pan(id)) {
+        valid |= CPSR_PAN;
+    }
 
     return valid;
 }
@@ -1093,6 +1096,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_bti(id)) {
         valid |= PSTATE_BTYPE;
     }
+    if (isar_feature_aa64_pan(id)) {
+        valid |= PSTATE_PAN;
+    }
 
     return valid;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e4f17c7e83..058fb23959 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4163,6 +4163,24 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->daif = value & PSTATE_DAIF;
 }
 
+static uint64_t aa64_pan_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_PAN;
+}
+
+static void aa64_pan_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_PAN) | (value & PSTATE_PAN);
+}
+
+static const ARMCPRegInfo pan_reginfo = {
+    .name = "PAN", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 3,
+    .type = ARM_CP_NO_RAW, .access = PL1_RW,
+    .readfn = aa64_pan_read, .writefn = aa64_pan_write
+};
+
 static CPAccessResult aa64_cacheop_access(CPUARMState *env,
                                           const ARMCPRegInfo *ri,
                                           bool isread)
@@ -7599,6 +7617,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_lor, cpu)) {
         define_arm_cp_regs(cpu, lor_reginfo);
     }
+    if (cpu_isar_feature(aa64_pan, cpu)) {
+        define_one_arm_cp_reg(cpu, &pan_reginfo);
+    }
 
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 49631c2340..d8ba240a15 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1602,6 +1602,20 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         s->base.is_jmp = DISAS_NEXT;
         break;
 
+    case 0x04: /* PAN */
+        if (!dc_isar_feature(aa64_pan, s) || s->current_el == 0) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_PAN);
+        } else {
+            clear_pstate_bits(PSTATE_PAN);
+        }
+        t1 = tcg_const_i32(s->current_el);
+        gen_helper_rebuild_hflags_a64(cpu_env, t1);
+        tcg_temp_free_i32(t1);
+        break;
+
     case 0x05: /* SPSel */
         if (s->current_el == 0) {
             goto do_unallocated;
-- 
2.20.1


