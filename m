Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1D852993E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:03:50 +0200 (CEST)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqJB-0002mT-25
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4s-0000UC-Mi
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:04 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4q-0007os-TW
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:02 -0400
Received: by mail-pf1-x429.google.com with SMTP id c14so15987144pfn.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAd7na+2KxBtPMtY2na7BNVtRH2LfOqAnHHLmai2Ves=;
 b=iEnGoxrWBBUVFA9N55qcwl85lWxtXGeREh50OFGNEVw7WPltlQ+LpwjgR9LnmLZQ1i
 bShKbiPcLXXhOgQXEkw6Hq55SXAYlY9w+qT8yiHfYD817ZBceWGXIy6O6g/x+2XZ+4FZ
 rga9IUYiuQ6GscMoVoKxHkpllYKtwU6s+0KKAyHsOHTxknoVvhx9QBONLoArAo408APM
 UsWjJhrTZT3bcY+jozvLV3fYculJC7B+qoQ1pAoGxP2KvMzRGuX2yC0PFFEOAoWBKiqg
 aD13Fec+bspkiCLkdf6kE0yN48iYKCzJFpm7tB4X800lgJpo0VqJBDZsacr9JIsEtcC9
 acLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAd7na+2KxBtPMtY2na7BNVtRH2LfOqAnHHLmai2Ves=;
 b=VZfwVFg16Xg4BdQxhL1kGbPC0mT+tpu56r/3w0ADVvlLy3utaggxIU9UE02pM4Fg3k
 kfSJcV1VnaVMgk72/mAsiscNfr366UPGAgzqUWUfrcu0VcPs//L/Tlb5jyFCTuU9yH4e
 m93Ff09rQgEQfPu+gLsulD5ArloGPI4n1NGOJ4vE7sS8u7zS/h0K1TuODDiPMBlGXRAO
 9J+fT+w75+t3pGU9Mgjwt1Uw3hV6Vc1/OHL51o7dZ06AwD14zQZOvyo6SplC7yDCKsqJ
 mhinPt92pGGa1pVHalUlxIJpVpwozKEomvFfFcIATWFFbXRbizJ+gjHbswAU5Hcsud6V
 3tsA==
X-Gm-Message-State: AOAM530tJ4rSbyR9iHjCM4h/gFWNRQqMhcLXHGOShMdLzIxUOtBq+VSw
 UfkRTMNDNhpaMcPiS4WvH8+lFJI0D15kYw==
X-Google-Smtp-Source: ABdhPJw6kiW8Qj9pGbcxDn/gmwHcUuBLndyTKfWcdxT1g/oe07NyruTJZ1PZ1AAeyb3r7RQ3HV4i/g==
X-Received: by 2002:a63:1c4e:0:b0:3f2:6da7:5d90 with SMTP id
 c14-20020a631c4e000000b003f26da75d90mr7562874pgm.429.1652766532943; 
 Mon, 16 May 2022 22:48:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/7] target/arm: Enable FEAT_HCX for -cpu max
Date: Mon, 16 May 2022 22:48:44 -0700
Message-Id: <20220517054850.177016-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature adds a new register, HCRX_EL2, which controls
many of the newer AArch64 features.  So far the register is
effectively RES0, because none of the new features are done.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 20 ++++++++++++++++++
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 18ca61e8e2..b35b117fe7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -362,6 +362,7 @@ typedef struct CPUArchState {
         uint32_t pmsav5_data_ap; /* PMSAv5 MPU data access permissions */
         uint32_t pmsav5_insn_ap; /* PMSAv5 MPU insn access permissions */
         uint64_t hcr_el2; /* Hypervisor configuration register */
+        uint64_t hcrx_el2; /* Extended Hypervisor configuration register */
         uint64_t scr_el3; /* Secure configuration register.  */
         union { /* Fault status registers.  */
             struct {
@@ -1543,6 +1544,19 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TWEDEN    (1ULL << 59)
 #define HCR_TWEDEL    MAKE_64BIT_MASK(60, 4)
 
+#define HCRX_ENAS0    (1ULL << 0)
+#define HCRX_ENALS    (1ULL << 1)
+#define HCRX_ENASR    (1ULL << 2)
+#define HCRX_FNXS     (1ULL << 3)
+#define HCRX_FGTNXS   (1ULL << 4)
+#define HCRX_SMPME    (1ULL << 5)
+#define HCRX_TALLINT  (1ULL << 6)
+#define HCRX_VINMI    (1ULL << 7)
+#define HCRX_VFNMI    (1ULL << 8)
+#define HCRX_CMOW     (1ULL << 9)
+#define HCRX_MCE2     (1ULL << 10)
+#define HCRX_MSCEN    (1ULL << 11)
+
 #define HPFAR_NS      (1ULL << 63)
 
 #define SCR_NS                (1U << 0)
@@ -2310,6 +2324,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  * Not included here is HCR_RW.
  */
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
+uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
 /* Return true if the specified exception level is running in AArch64 state. */
 static inline bool arm_el_is_aa64(CPUARMState *env, int el)
@@ -3931,6 +3946,11 @@ static inline bool isar_feature_aa64_ats1e1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, PAN) >= 2;
 }
 
+static inline bool isar_feature_aa64_hcx(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HCX) != 0;
+}
+
 static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 04427e073f..4ab1dcf2ef 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -910,6 +910,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
     t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2);      /* FEAT_PAN2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
     cpu->isar.id_aa64mmfr1 = t;
 
     t = cpu->isar.id_aa64mmfr2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 432bd81919..93ab552346 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5278,6 +5278,52 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    uint64_t valid_mask = 0;
+
+    /* No features adding bits to HCRX are implemented. */
+
+    /* Clear RES0 bits.  */
+    env->cp15.hcrx_el2 = value & valid_mask;
+}
+
+static CPAccessResult access_hxen(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_current_el(env) < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_HXEN)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo hcrx_el2_reginfo = {
+    .name = "HCRX_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 2,
+    .access = PL2_RW, .writefn = hcrx_write, .accessfn = access_hxen,
+    .fieldoffset = offsetof(CPUARMState, cp15.hcrx_el2),
+};
+
+/* Return the effective value of HCRX_EL2.  */
+uint64_t arm_hcrx_el2_eff(CPUARMState *env)
+{
+    /*
+     * The bits in this register behave as 0 for all purposes other than
+     * direct reads of the register if:
+     *   - EL2 is not enabled in the current security state,
+     *   - SCR_EL3.HXEn is 0.
+     */
+    if (!arm_is_el2_enabled(env)
+        || (arm_feature(env, ARM_FEATURE_EL3)
+            && !(env->cp15.scr_el3 & SCR_HXEN))) {
+        return 0;
+    }
+    return env->cp15.hcrx_el2;
+}
+
 static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
@@ -8384,6 +8430,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, zcr_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_hcx, cpu)) {
+        define_one_arm_cp_reg(cpu, &hcrx_el2_reginfo);
+    }
+
 #ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
-- 
2.34.1


