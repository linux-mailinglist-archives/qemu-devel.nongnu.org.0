Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF2A52DC5F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:07:22 +0200 (CEST)
Received: from localhost ([::1]:40334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkYS-0007Ob-VJ
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5L-0006WJ-Ce
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5J-0000tF-EQ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id r30so8179117wra.13
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PFMQfJk7ShbzqpPqn4n5EsRCCO6FXeD6n+dIQT6h+4E=;
 b=A/Vx/IGmcSdTDC2gZb5O3rrUDRcsTlr7zmrvVzSmDBMzMvaWuje3J7wMyPL960HnEb
 7ceT/m3LVNycHNq7sVunVadUVSAfrbkOL4BILVGZsE4J1NalC5CC3aRazpxdxWHtwmhJ
 0J/6EDMPGAppAEw5a6N7WF2QyFs9K0j/TqHCUJcHWpUuw4okUtv1ZHxyItqHaoD/8kJ2
 zCsYqD+cR7HEENTTDOupSD2otRBOMP7x7EY8Bsn/HRjNPrm0nYpBz2kv2xMMh0n6ui0Z
 mrezf4xuG1tQrCygwz5JnLUgfd+8DjKD4tPe1aT7mGeRtEDXyiTqw4c05M4qvMjb8jip
 ZZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PFMQfJk7ShbzqpPqn4n5EsRCCO6FXeD6n+dIQT6h+4E=;
 b=JnGDCAl5Ouudc4I66XvAj9uKiczhlUZLSXAz5u5LAqAysniDCgqouL5046z2q2+bJk
 Alp2gwsQ5MEngVqn2qx8gxPqkjDIUm7qsazAwEZLvcBsCnbJ4bk3XgYFIYWCMU3Thd3U
 lljWZb2+Ejb0GRC15bJAO4LfUMi5U3fNj9MiSpuGR0zufOXHuyXqvjdCOThq+iBOU3Og
 v5a56pmGrblEnLQdVWH76x2Khq5YiELINQh87lHaCP/PooGFPEdwymBwjfRhg0E3x+Kc
 JE/o+xYc+BE7Vbz9Oqx7McY61iKmg5RnxVcNwch1Ezfz5c43YnW+PB7T3j73MnTtBRuk
 HCeg==
X-Gm-Message-State: AOAM532GXcmcERKoGqlZ2lunRitecIpMNSn4papwXa9g0RC8ltSMiR6D
 9xcnGp0h5DPJ3g6cFH+QfNLhphFRIs+XBA==
X-Google-Smtp-Source: ABdhPJxN79GmQqkqpNJWYeTJfejEWMx+YyXkWN3BGEjK7fALdQsxK3YvXXYbGW7k43oPO3wQySc1lQ==
X-Received: by 2002:a5d:4b8b:0:b0:20c:f8c5:b9bc with SMTP id
 b11-20020a5d4b8b000000b0020cf8c5b9bcmr5281602wrt.282.1652981831116; 
 Thu, 19 May 2022 10:37:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/22] target/arm: Enable FEAT_HCX for -cpu max
Date: Thu, 19 May 2022 18:36:50 +0100
Message-Id: <20220519173651.399295-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This feature adds a new register, HCRX_EL2, which controls
many of the newer AArch64 features.  So far the register is
effectively RES0, because none of the new features are done.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220517054850.177016-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 20 ++++++++++++++++++
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3dc79f121b5..fac526a4905 100644
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
@@ -1545,6 +1546,19 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
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
@@ -2312,6 +2326,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  * Not included here is HCR_RW.
  */
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
+uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
 /* Return true if the specified exception level is running in AArch64 state. */
 static inline bool arm_el_is_aa64(CPUARMState *env, int el)
@@ -3933,6 +3948,11 @@ static inline bool isar_feature_aa64_ats1e1(const ARMISARegisters *id)
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
index a752b648568..3ff9219ca3b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -934,6 +934,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
     t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2);      /* FEAT_PAN2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
     cpu->isar.id_aa64mmfr1 = t;
 
     t = cpu->isar.id_aa64mmfr2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fdd51e5e754..7d983d7fffb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5288,6 +5288,52 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
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
@@ -8405,6 +8451,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.25.1


