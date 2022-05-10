Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25E5209D6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 02:09:52 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noDRn-0001yl-UL
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 20:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noDMh-000633-55
 for qemu-devel@nongnu.org; Mon, 09 May 2022 20:04:35 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noDMd-0005B1-5z
 for qemu-devel@nongnu.org; Mon, 09 May 2022 20:04:33 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k14so13340739pga.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 17:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqE31/G84do5x2ANoQ3B3dzVwa3TzsZPNoyk2qXIy4U=;
 b=KLwemzzHeX4PZOxSfbuIpLv9DLs33SwwMpOPmus6sBaeMQj1+Xez+NefjypPn+8OKm
 /j3aVuJ79ObxFS1tuE7LbLWwmnvwIocv9qAWKfiGuQolgTkKgQ2oHswo4o1Mv0wFkfQ6
 b/cadO7cXPRlUfpse0Ei+z9xn1gankGTRaIEVmX79ar6OxvKWOXPOvVmx0oJWjWSSlD1
 U9TOTFxEZSBZ97iMquzHfqOV/A7vg8PmqdKB7SseoS6H3Mvyw1wF24RfsXvQyoM5DTEW
 SQdiQn4BXf/k4EbHgNuTIAsluTIK4zohT1tUXHxjOWxWmYeXdYiFG+o7c60UlwmPWzu8
 x+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aqE31/G84do5x2ANoQ3B3dzVwa3TzsZPNoyk2qXIy4U=;
 b=TuQojpp9ceD4Vji2HglmCg8M9UYO1puWh7mn/X02k91MvlzKVHpuItkRdIBqIdhOII
 viIoAG+Izp7VvmyyUSHAd3AfnapL2/6oNMKgg8nkRYBwZMTK1BUQCh+iEexF2mi02cPP
 Cd9mS78ky5EpJP+R6JWzdH877goxA/3DDauMpj5TLQE4MDqp8aq8JUoWL7lTImOOY2FX
 heBFSShOcgN3dCN/O7fQTNzfP38Nc/YUzlvEc3sNK1Ex3xcB1s6Rv4YV8yFbTm5zi6S5
 C29Eh5jVhQzxjaKkmm+lqxTqN7yxkHJQaf8F0iUxLUznqKKImUNUTgFlwF6oAVwKfL1a
 JEqw==
X-Gm-Message-State: AOAM530ScwnTlScbqSGrR56u8b5KVNzjLJtC77kO/yCfFiXOHS+9d7F1
 ZzmFU0Xf8g4fyR5nJFHlDGLKDv7QYvbzxg==
X-Google-Smtp-Source: ABdhPJwzIwXpYENzfPNtoZLi6iizJ2XMH6dtNli83apgfj85yqbNlkm34tmHtyinQIWVRWo+BEDvEw==
X-Received: by 2002:a05:6a00:1385:b0:50a:9768:9eca with SMTP id
 t5-20020a056a00138500b0050a97689ecamr17726661pfg.43.1652141069550; 
 Mon, 09 May 2022 17:04:29 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x71-20020a63864a000000b003c15f7f2914sm8983691pgd.24.2022.05.09.17.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 17:04:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Enable FEAT_HCX for -cpu max
Date: Mon,  9 May 2022 17:04:25 -0700
Message-Id: <20220510000426.45797-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220510000426.45797-1-richard.henderson@linaro.org>
References: <20220510000426.45797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

This feature adds a new register, HCRX_EL2, which controls
many of the newer AArch64 features.  So far the register is
effectively RES0, because none of the new features are done.

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


