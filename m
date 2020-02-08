Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC963156478
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 14:10:05 +0100 (CET)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0Ps4-00068h-Vq
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 08:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j0Ph0-0000z8-Do
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j0Pgz-0005Ee-5M
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:38 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43669)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j0Pgy-0005DM-V4
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:37 -0500
Received: by mail-wr1-x441.google.com with SMTP id z9so2005541wrs.10
 for <qemu-devel@nongnu.org>; Sat, 08 Feb 2020 04:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mdjhvy7wmcGZ9rsKN0Hq6HG9JnMWN4n96rrfZwt5buc=;
 b=Sf0oRc159rjudaRbfeqDtkUK6waFsMmyxGRLd9H2DZUSGOMbfqhT3cvL6yKH/Wj7nm
 zpvbbUAPoqnfiDgWJp4/B27tQ77Oe4oj9hdwAkLDSlraLuWii+7OA0oj8z6TjgjGgxD+
 hFfpLzwWzVkvBaEteaA44I8QJGrk6hWU2IrAySHUI06YWepPDjOQHFU3hkCMZ5jj89gp
 l51PRKLFlxA0V3EtcsSelJL4gJWM4+Qm+pLi6IMs6dF8v0ikvq+xwGjqltOYRVohsS4b
 tTh8tKWueG8k0G1kOiUrSIi+g9MmLhjgOI/Zyv7iLZXazNtCH2blYWg6MD9o6LM6MDt6
 ZRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mdjhvy7wmcGZ9rsKN0Hq6HG9JnMWN4n96rrfZwt5buc=;
 b=gSJoBE/WtMhxVEteN2G5t8cXG1hWOnA0DqJ6Pknw1r0i96F7wxEJzcSu+eRusqw48Q
 dZdfnhTAn5HGmxw83jFKIySPzs5yMZauPy1O8Q4NBAIECjEI9tixT68qrKHXb1RLj3Nf
 GtjxNwltb1dCZEOts/VrvHlWEjCZQ7CA31IV9lbhy9BsboU5Ds5z8STpCCvyMveNIXS9
 eWTDGSIQYZxhZxWMRy/dN2qE2/nPhr+sZ7MwQkfpqNkQ9ymdhdydqUIEzBZCV+/V6UNt
 gSt0yxKsvhCNb+GiLBquAnq3ZWxfId1C8YQR/0yBybcNlIZwIk/VQs0etmoXZIdHDvJC
 rjiQ==
X-Gm-Message-State: APjAAAWg6j7jKXDFFqN7JlvvfxeZfLwg/dWueUPazdktI9Zk+asfceh2
 LqAvTKlNSWwze4ViWf+CFCZJqz+uMItDXA==
X-Google-Smtp-Source: APXvYqzjA0eovB4EX1/C9Q65EnPa91R2szHlqj9KhLX9ogwIIkECbUurB3PisPvQN3nTkWyHyTu5+Q==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr5140608wrm.13.1581166715726;
 Sat, 08 Feb 2020 04:58:35 -0800 (PST)
Received: from localhost.localdomain ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id p5sm7490534wrt.79.2020.02.08.04.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 04:58:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/20] target/arm: Update MSR access to UAO
Date: Sat,  8 Feb 2020 12:58:14 +0000
Message-Id: <20200208125816.14954-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200208125816.14954-1-richard.henderson@linaro.org>
References: <20200208125816.14954-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Move reginfo to file scope; avoid setting uao from spsr
    when the feature is not enabled (pmm).
v3: Update for aarch64_pstate_valid_mask
---
 target/arm/cpu.h           |  6 ++++++
 target/arm/internals.h     |  3 +++
 target/arm/helper.c        | 21 +++++++++++++++++++++
 target/arm/translate-a64.c | 14 ++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 71879393c2..e943ffe8a9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1253,6 +1253,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
+#define PSTATE_UAO (1U << 23)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
@@ -3642,6 +3643,11 @@ static inline bool isar_feature_aa64_ats1e1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, PAN) >= 2;
 }
 
+static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4a139644b5..58c4d707c5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1112,6 +1112,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_pan(id)) {
         valid |= PSTATE_PAN;
     }
+    if (isar_feature_aa64_uao(id)) {
+        valid |= PSTATE_UAO;
+    }
 
     return valid;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d29722d8ac..11a5f0be52 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4191,6 +4191,24 @@ static const ARMCPRegInfo pan_reginfo = {
     .readfn = aa64_pan_read, .writefn = aa64_pan_write
 };
 
+static uint64_t aa64_uao_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_UAO;
+}
+
+static void aa64_uao_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_UAO) | (value & PSTATE_UAO);
+}
+
+static const ARMCPRegInfo uao_reginfo = {
+    .name = "UAO", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 4,
+    .type = ARM_CP_NO_RAW, .access = PL1_RW,
+    .readfn = aa64_uao_read, .writefn = aa64_uao_write
+};
+
 static CPAccessResult aa64_cacheop_access(CPUARMState *env,
                                           const ARMCPRegInfo *ri,
                                           bool isread)
@@ -7664,6 +7682,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, ats1cp_reginfo);
     }
 #endif
+    if (cpu_isar_feature(aa64_uao, cpu)) {
+        define_one_arm_cp_reg(cpu, &uao_reginfo);
+    }
 
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d8ba240a15..7c26c3bfeb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1602,6 +1602,20 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         s->base.is_jmp = DISAS_NEXT;
         break;
 
+    case 0x03: /* UAO */
+        if (!dc_isar_feature(aa64_uao, s) || s->current_el == 0) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_UAO);
+        } else {
+            clear_pstate_bits(PSTATE_UAO);
+        }
+        t1 = tcg_const_i32(s->current_el);
+        gen_helper_rebuild_hflags_a64(cpu_env, t1);
+        tcg_temp_free_i32(t1);
+        break;
+
     case 0x04: /* PAN */
         if (!dc_isar_feature(aa64_pan, s) || s->current_el == 0) {
             goto do_unallocated;
-- 
2.20.1


