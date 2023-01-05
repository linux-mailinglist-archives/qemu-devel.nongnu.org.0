Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B834D65F19C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:00:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTM2-0000Z3-0g; Thu, 05 Jan 2023 11:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLw-0000S8-E4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:28 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLt-0007Mj-QC
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id g10so14660828wmo.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/+yy8hrXR7W8CC89aup3gLLcA2qa4yC8gAslmEHdnXE=;
 b=k7pJT1ESY39CpKZyRqhHGTks/E2MNfgoE2q53HlzQ21hS2+KR+KL8hZgVPV+cqgSsh
 HprP8PAYEWZpCSYgtG0KWvQf1iCN/e1YU0mEiIYglErUuI340J3+hMkxn1QMti2oEfkF
 SswD6VsZV1AsL86ce6R/GNgshMhafi1ONQ+nUsbc/VXQQaue5BdUArZuYiRUT0JQUipD
 3Sa/2nPhUaVE+4KQxDHPlgfdmCuYxvRJLmv6h1SCJhCWnqT7nXbXcY98Cl0Uq7Gf28eR
 bYNs3YKBIoNkPzz2+1bOA+YGbUnH3u7zLqEDeiafNnNo++9ZaP06T35XJdi0QhE9Vgv4
 RRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+yy8hrXR7W8CC89aup3gLLcA2qa4yC8gAslmEHdnXE=;
 b=ekKOlQHBDFqPtlkFdl/lULb8zB6s4kz21PN4y7nfI6EOgLVu3YRjv8wP731XPAHWev
 qwqhcbzYYLYkK+gByaYnWLNpkHHtkgBt7Km0BgWcg62xv96qEgog0HEUEYp7MKz31z0l
 bkE1buuyE/lhM/6b3XcK/le2veipTgI1n6MipwZ17NTGjw12UusczBmitpBNSyMIVxuc
 PaRm3vbxOj3K1uHN3XZIB/cDr42cT5merQv50EZX1AA+SK2ExeJl0Fl7UINu0t1hVsqg
 tc3hCVtRHcIcHTHL33fmqxBdpSnO9eIv6x4lXs7HFgVtsMO9DdX/VzGORjB56BSkGClM
 69xw==
X-Gm-Message-State: AFqh2krJxAZ5ZvfGoSpXqxZWJcgwezGSElZCQM9ZJByABOC4PTOGhxYw
 xSKKgUAK8N2K8n+3nRdSWzlJ7xSq9bo+FxEP
X-Google-Smtp-Source: AMrXdXszoDVwK1rP/Syt0EJSHpCeA76AaIQk6iutNaSiSxGwoxpjV07hrQZ0LCeeZexBeMx/Fn6bKg==
X-Received: by 2002:a05:600c:3844:b0:3d2:191d:2420 with SMTP id
 s4-20020a05600c384400b003d2191d2420mr37826502wmr.7.1672937064423; 
 Thu, 05 Jan 2023 08:44:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/34] target/arm: Add PMSAv8r registers
Date: Thu,  5 Jan 2023 16:43:49 +0000
Message-Id: <20230105164417.3994639-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Message-id: 20221206102504.165775-6-tobias.roehmel@rwth-aachen.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     |   6 +
 target/arm/cpu.c     |  28 +++-
 target/arm/helper.c  | 302 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c |  28 ++++
 4 files changed, 360 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b4bd20f9d0..bf2bce046d5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -309,6 +309,7 @@ typedef struct CPUArchState {
             };
             uint64_t sctlr_el[4];
         };
+        uint64_t vsctlr; /* Virtualization System control register. */
         uint64_t cpacr_el1; /* Architectural feature access control register */
         uint64_t cptr_el[4];  /* ARMv8 feature trap registers */
         uint32_t c1_xscaleauxcr; /* XScale auxiliary control register.  */
@@ -745,8 +746,11 @@ typedef struct CPUArchState {
          */
         uint32_t *rbar[M_REG_NUM_BANKS];
         uint32_t *rlar[M_REG_NUM_BANKS];
+        uint32_t *hprbar;
+        uint32_t *hprlar;
         uint32_t mair0[M_REG_NUM_BANKS];
         uint32_t mair1[M_REG_NUM_BANKS];
+        uint32_t hprselr;
     } pmsav8;
 
     /* v8M SAU */
@@ -906,6 +910,8 @@ struct ArchCPU {
     bool has_mpu;
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
+    /* PMSAv8 MPU number of supported hyp regions */
+    uint32_t pmsav8r_hdregion;
     /* v8M SAU number of supported regions */
     uint32_t sau_sregion;
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c107cbd7574..f99f749b295 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -491,6 +491,14 @@ static void arm_cpu_reset_hold(Object *obj)
                        sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion);
             }
         }
+
+        if (cpu->pmsav8r_hdregion > 0) {
+            memset(env->pmsav8.hprbar, 0,
+                   sizeof(*env->pmsav8.hprbar) * cpu->pmsav8r_hdregion);
+            memset(env->pmsav8.hprlar, 0,
+                   sizeof(*env->pmsav8.hprlar) * cpu->pmsav8r_hdregion);
+        }
+
         env->pmsav7.rnr[M_REG_NS] = 0;
         env->pmsav7.rnr[M_REG_S] = 0;
         env->pmsav8.mair0[M_REG_NS] = 0;
@@ -2002,11 +2010,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
      * to false or by setting pmsav7-dregion to 0.
      */
-    if (!cpu->has_mpu) {
-        cpu->pmsav7_dregion = 0;
-    }
-    if (cpu->pmsav7_dregion == 0) {
+    if (!cpu->has_mpu || cpu->pmsav7_dregion == 0) {
         cpu->has_mpu = false;
+        cpu->pmsav7_dregion = 0;
+        cpu->pmsav8r_hdregion = 0;
     }
 
     if (arm_feature(env, ARM_FEATURE_PMSA) &&
@@ -2033,6 +2040,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 env->pmsav7.dracr = g_new0(uint32_t, nr);
             }
         }
+
+        if (cpu->pmsav8r_hdregion > 0xff) {
+            error_setg(errp, "PMSAv8 MPU EL2 #regions invalid %" PRIu32,
+                              cpu->pmsav8r_hdregion);
+            return;
+        }
+
+        if (cpu->pmsav8r_hdregion) {
+            env->pmsav8.hprbar = g_new0(uint32_t,
+                                        cpu->pmsav8r_hdregion);
+            env->pmsav8.hprlar = g_new0(uint32_t,
+                                        cpu->pmsav8r_hdregion);
+        }
     }
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8066fe97d3..b13f6ff328c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3682,6 +3682,222 @@ static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void prbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.rbar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]] = value;
+}
+
+static uint64_t prbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.rbar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]];
+}
+
+static void prlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.rlar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]] = value;
+}
+
+static uint64_t prlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.rlar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]];
+}
+
+static void prselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /*
+     * Ignore writes that would select not implemented region.
+     * This is architecturally UNPREDICTABLE.
+     */
+    if (value >= cpu->pmsav7_dregion) {
+        return;
+    }
+
+    env->pmsav7.rnr[M_REG_NS] = value;
+}
+
+static void hprbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.hprbar[env->pmsav8.hprselr] = value;
+}
+
+static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprbar[env->pmsav8.hprselr];
+}
+
+static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.hprlar[env->pmsav8.hprselr] = value;
+}
+
+static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprlar[env->pmsav8.hprselr];
+}
+
+static void hprenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    uint32_t n;
+    uint32_t bit;
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Ignore writes to unimplemented regions */
+    int rmax = MIN(cpu->pmsav8r_hdregion, 32);
+    value &= MAKE_64BIT_MASK(0, rmax);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+
+    /* Register alias is only valid for first 32 indexes */
+    for (n = 0; n < rmax; ++n) {
+        bit = extract32(value, n, 1);
+        env->pmsav8.hprlar[n] = deposit32(
+                    env->pmsav8.hprlar[n], 0, 1, bit);
+    }
+}
+
+static uint64_t hprenr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint32_t n;
+    uint32_t result = 0x0;
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Register alias is only valid for first 32 indexes */
+    for (n = 0; n < MIN(cpu->pmsav8r_hdregion, 32); ++n) {
+        if (env->pmsav8.hprlar[n] & 0x1) {
+            result |= (0x1 << n);
+        }
+    }
+    return result;
+}
+
+static void hprselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /*
+     * Ignore writes that would select not implemented region.
+     * This is architecturally UNPREDICTABLE.
+     */
+    if (value >= cpu->pmsav8r_hdregion) {
+        return;
+    }
+
+    env->pmsav8.hprselr = value;
+}
+
+static void pmsav8r_regn_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint8_t index = (extract32(ri->opc0, 0, 1) << 4) |
+                    (extract32(ri->crm, 0, 3) << 1) | extract32(ri->opc2, 2, 1);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+
+    if (ri->opc1 & 4) {
+        if (index >= cpu->pmsav8r_hdregion) {
+            return;
+        }
+        if (ri->opc2 & 0x1) {
+            env->pmsav8.hprlar[index] = value;
+        } else {
+            env->pmsav8.hprbar[index] = value;
+        }
+    } else {
+        if (index >= cpu->pmsav7_dregion) {
+            return;
+        }
+        if (ri->opc2 & 0x1) {
+            env->pmsav8.rlar[M_REG_NS][index] = value;
+        } else {
+            env->pmsav8.rbar[M_REG_NS][index] = value;
+        }
+    }
+}
+
+static uint64_t pmsav8r_regn_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint8_t index = (extract32(ri->opc0, 0, 1) << 4) |
+                    (extract32(ri->crm, 0, 3) << 1) | extract32(ri->opc2, 2, 1);
+
+    if (ri->opc1 & 4) {
+        if (index >= cpu->pmsav8r_hdregion) {
+            return 0x0;
+        }
+        if (ri->opc2 & 0x1) {
+            return env->pmsav8.hprlar[index];
+        } else {
+            return env->pmsav8.hprbar[index];
+        }
+    } else {
+        if (index >= cpu->pmsav7_dregion) {
+            return 0x0;
+        }
+        if (ri->opc2 & 0x1) {
+            return env->pmsav8.rlar[M_REG_NS][index];
+        } else {
+            return env->pmsav8.rbar[M_REG_NS][index];
+        }
+    }
+}
+
+static const ARMCPRegInfo pmsav8r_cp_reginfo[] = {
+    { .name = "PRBAR",
+      .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_NO_RAW,
+      .accessfn = access_tvm_trvm,
+      .readfn = prbar_read, .writefn = prbar_write },
+    { .name = "PRLAR",
+      .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_NO_RAW,
+      .accessfn = access_tvm_trvm,
+      .readfn = prlar_read, .writefn = prlar_write },
+    { .name = "PRSELR", .resetvalue = 0,
+      .cp = 15, .opc1 = 0, .crn = 6, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .writefn = prselr_write,
+      .fieldoffset = offsetof(CPUARMState, pmsav7.rnr[M_REG_NS]) },
+    { .name = "HPRBAR", .resetvalue = 0,
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_NO_RAW,
+      .readfn = hprbar_read, .writefn = hprbar_write },
+    { .name = "HPRLAR",
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_NO_RAW,
+      .readfn = hprlar_read, .writefn = hprlar_write },
+    { .name = "HPRSELR", .resetvalue = 0,
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 2, .opc2 = 1,
+      .access = PL2_RW,
+      .writefn = hprselr_write,
+      .fieldoffset = offsetof(CPUARMState, pmsav8.hprselr) },
+    { .name = "HPRENR",
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_NO_RAW,
+      .readfn = hprenr_read, .writefn = hprenr_write },
+};
+
 static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
     /* Reset for all these registers is handled in arm_cpu_reset(),
      * because the PMSAv7 is also used by M-profile CPUs, which do
@@ -8207,6 +8423,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
+        /* HMPUIR is specific to PMSA V8 */
+        ARMCPRegInfo id_hmpuir_reginfo = {
+            .name = "HMPUIR",
+            .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 4,
+            .access = PL2_R, .type = ARM_CP_CONST,
+            .resetvalue = cpu->pmsav8r_hdregion
+        };
         static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
@@ -8249,6 +8472,74 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, id_cp_reginfo);
         if (!arm_feature(env, ARM_FEATURE_PMSA)) {
             define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
+        } else if (arm_feature(env, ARM_FEATURE_PMSA) &&
+                   arm_feature(env, ARM_FEATURE_V8)) {
+            uint32_t i = 0;
+            char *tmp_string;
+
+            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
+            define_one_arm_cp_reg(cpu, &id_hmpuir_reginfo);
+            define_arm_cp_regs(cpu, pmsav8r_cp_reginfo);
+
+            /* Register alias is only valid for first 32 indexes */
+            for (i = 0; i < MIN(cpu->pmsav7_dregion, 32); ++i) {
+                uint8_t crm = 0b1000 | extract32(i, 1, 3);
+                uint8_t opc1 = extract32(i, 4, 1);
+                uint8_t opc2 = extract32(i, 0, 1) << 2;
+
+                tmp_string = g_strdup_printf("PRBAR%u", i);
+                ARMCPRegInfo tmp_prbarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
+                g_free(tmp_string);
+
+                opc2 = extract32(i, 0, 1) << 2 | 0x1;
+                tmp_string = g_strdup_printf("PRLAR%u", i);
+                ARMCPRegInfo tmp_prlarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
+                g_free(tmp_string);
+            }
+
+            /* Register alias is only valid for first 32 indexes */
+            for (i = 0; i < MIN(cpu->pmsav8r_hdregion, 32); ++i) {
+                uint8_t crm = 0b1000 | extract32(i, 1, 3);
+                uint8_t opc1 = 0b100 | extract32(i, 4, 1);
+                uint8_t opc2 = extract32(i, 0, 1) << 2;
+
+                tmp_string = g_strdup_printf("HPRBAR%u", i);
+                ARMCPRegInfo tmp_hprbarn_reginfo = {
+                    .name = tmp_string,
+                    .type = ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
+                g_free(tmp_string);
+
+                opc2 = extract32(i, 0, 1) << 2 | 0x1;
+                tmp_string = g_strdup_printf("HPRLAR%u", i);
+                ARMCPRegInfo tmp_hprlarn_reginfo = {
+                    .name = tmp_string,
+                    .type = ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
+                g_free(tmp_string);
+            }
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
         }
@@ -8370,6 +8661,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             sctlr.type |= ARM_CP_SUPPRESS_TB_END;
         }
         define_one_arm_cp_reg(cpu, &sctlr);
+
+        if (arm_feature(env, ARM_FEATURE_PMSA) &&
+            arm_feature(env, ARM_FEATURE_V8)) {
+            ARMCPRegInfo vsctlr = {
+                .name = "VSCTLR", .state = ARM_CP_STATE_AA32,
+                .cp = 15, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
+                .access = PL2_RW, .resetvalue = 0x0,
+                .fieldoffset = offsetoflow32(CPUARMState, cp15.vsctlr),
+            };
+            define_one_arm_cp_reg(cpu, &vsctlr);
+        }
     }
 
     if (cpu_isar_feature(aa64_lor, cpu)) {
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 54c5c62433d..5f261526525 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -487,6 +487,30 @@ static bool pmsav8_needed(void *opaque)
         arm_feature(env, ARM_FEATURE_V8);
 }
 
+static bool pmsav8r_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8) &&
+        !arm_feature(env, ARM_FEATURE_M);
+}
+
+static const VMStateDescription vmstate_pmsav8r = {
+    .name = "cpu/pmsav8/pmsav8r",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pmsav8r_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_VARRAY_UINT32(env.pmsav8.hprbar, ARMCPU,
+                        pmsav8r_hdregion, 0, vmstate_info_uint32, uint32_t),
+        VMSTATE_VARRAY_UINT32(env.pmsav8.hprlar, ARMCPU,
+                        pmsav8r_hdregion, 0, vmstate_info_uint32, uint32_t),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_pmsav8 = {
     .name = "cpu/pmsav8",
     .version_id = 1,
@@ -500,6 +524,10 @@ static const VMStateDescription vmstate_pmsav8 = {
         VMSTATE_UINT32(env.pmsav8.mair0[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.pmsav8.mair1[M_REG_NS], ARMCPU),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_pmsav8r,
+        NULL
     }
 };
 
-- 
2.25.1


