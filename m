Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FBB6F43B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:22:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptows-0005qP-IM; Tue, 02 May 2023 08:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oL-Sy
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-00030S-IQ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315735514so166128755e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029704; x=1685621704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vhCJQkRGpiu7aAtZfDcMuXspmgw32q1IgJyApqwqld8=;
 b=q0kvPbwB2CWORqbzN/Ix+98mGkeDVq1G5hWScHLUIKswTIb9O0RZ6f65k94HoUkCnv
 dsmf4MqzAqb0CILPYC+h3fAW3uitOPPWkLIlzIiiw8XseEeX+SnXLGi5O3Eqt8LsIUpL
 Sy7hkaD8YLv3XcDWOt9EwXR1qtToDWG1pmp8Hn6FmgvKM1IxGYx4pdUmpXbpHrCCiSuE
 HKF+GF/9WYVFkgHyDIkdkG4IVIlMHjW/6gcR+9hTY80mUwDsPFSfwcKVh7HWjsvV93ol
 sR1JuPewWT7JVzuU6jEZFq+KFsHmwLpEwPhc+I36e8ZrjjwMYTeaxBpkFdi48SNnHebE
 wwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029704; x=1685621704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhCJQkRGpiu7aAtZfDcMuXspmgw32q1IgJyApqwqld8=;
 b=Ytyu0MfPWJ7jSFz95AlRDB08Vdq3WoEFp5eHX91ArnWwJ56Elzi3fIGpNNiZMoD0hZ
 3euIKEX2LXEHylabmvF86hdhRtSMG+NGnIZkipRuI7LnrWmGkc66S6gya7qK5SYF+LlS
 4fud6qh3C7+/MDr7e0usNdjc9mOORHlSNta8jcfOGf6eYy5mMf0MtraIVKyfHiNVYrm9
 6r7Xm6cpOJ96lwyPZoBY08B3Q2jAZIradho9k4v8yR3pnrnxa9WZi+ypbdVg9jDZTlKk
 SumSo8J2JGLcNrq3Za/KCZ6SKRYJaeS3IvjNv2qRg9ULgsv3N4aol9OvaTkF2QwmibqT
 MGUw==
X-Gm-Message-State: AC+VfDxVVnJJHSxy1eX3JU1m1mlmNfjusYTBXqSFnT1Qt/YD2ufAzxtT
 DHhh4yVXExTqr6r8LwG6HaYvDnEeKv+yblURLXc=
X-Google-Smtp-Source: ACHHUZ79UF4NaCRf6qYRzWYhlZb5O+RJDqT4qFap9/0xI/5J833ao6xu0BPFsKSbmuxTv41moRi9BQ==
X-Received: by 2002:a5d:6911:0:b0:306:2be3:6d40 with SMTP id
 t17-20020a5d6911000000b003062be36d40mr3972075wru.35.1683029703505; 
 Tue, 02 May 2023 05:15:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/35] target/arm: Move 64-bit TCG CPUs into tcg/
Date: Tue,  2 May 2023 13:14:29 +0100
Message-Id: <20230502121459.2422303-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

Move the 64-bit CPUs that are TCG-only:
- cortex-a35
- cortex-a55
- cortex-a72
- cortex-a76
- a64fx
- neoverse-n1

Keep the CPUs that can be used with KVM:
- cortex-a57
- cortex-a53
- max
- host

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230426180013.14814-6-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h       |   4 +
 hw/arm/virt.c                |   6 +-
 target/arm/cpu64.c           | 687 +-----------------------------
 target/arm/{ => tcg}/cpu64.c | 782 +----------------------------------
 target/arm/tcg/meson.build   |   1 +
 5 files changed, 14 insertions(+), 1466 deletions(-)
 copy target/arm/{ => tcg}/cpu64.c (51%)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b73c540e7e0..0df8f3b8bca 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1361,6 +1361,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
+void aarch64_max_tcg_initfn(Object *obj);
+void aarch64_add_pauth_properties(Object *obj);
+void aarch64_add_sve_properties(Object *obj);
+void aarch64_add_sme_properties(Object *obj);
 #endif
 
 /* Read the CONTROL register as the MRS instruction would. */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a89d699f0b7..1450a9f363a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -208,14 +208,16 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
 #endif
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a35"),
-    ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a55"),
-    ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
+#endif
+    ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6a6a2ece2b2..6eaf8e32cfa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -34,86 +34,6 @@
 #include "internals.h"
 #include "cpregs.h"
 
-static void aarch64_a35_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a35";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* From B2.2 AArch64 identification registers. */
-    cpu->midr = 0x411fd040;
-    cpu->revidr = 0;
-    cpu->ctr = 0x84448004;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64pfr1 = 0;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64dfr1 = 0;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64isar1 = 0;
-    cpu->isar.id_aa64mmfr0 = 0x00101122;
-    cpu->isar.id_aa64mmfr1 = 0;
-    cpu->clidr = 0x0a200023;
-    cpu->dcz_blocksize = 4;
-
-    /* From B2.4 AArch64 Virtual Memory control registers */
-    cpu->reset_sctlr = 0x00c50838;
-
-    /* From B2.10 AArch64 performance monitor registers */
-    cpu->isar.reset_pmcr_el0 = 0x410a3000;
-
-    /* From B2.29 Cache ID registers */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
-
-    /* From B3.5 VGIC Type register */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* From C6.4 Debug ID Register */
-    cpu->isar.dbgdidr = 0x3516d000;
-    /* From C6.5 Debug Device ID Register */
-    cpu->isar.dbgdevid = 0x00110f13;
-    /* From C6.6 Debug Device ID Register 1 */
-    cpu->isar.dbgdevid1 = 0x2;
-
-    /* From Cortex-A35 SIMD and Floating-point Support r1p0 */
-    /* From 3.2 AArch32 register summary */
-    cpu->reset_fpsid = 0x41034043;
-
-    /* From 2.2 AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* These values are the same with A53/A57/A72. */
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
-}
-
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -313,41 +233,6 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
     cpu->sve_vq.map = vq_map;
 }
 
-static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t value;
-
-    /* All vector lengths are disabled when SVE is off. */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        value = 0;
-    } else {
-        value = cpu->sve_max_vq;
-    }
-    visit_type_uint32(v, name, &value, errp);
-}
-
-static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t max_vq;
-
-    if (!visit_type_uint32(v, name, &max_vq, errp)) {
-        return;
-    }
-
-    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
-        error_setg(errp, "unsupported SVE vector length");
-        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
-                          ARM_MAX_VQ);
-        return;
-    }
-
-    cpu->sve_max_vq = max_vq;
-}
-
 /*
  * Note that cpu_arm_{get,set}_vq cannot use the simpler
  * object_property_add_bool interface because they make use of the
@@ -538,7 +423,7 @@ static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
 }
 #endif
 
-static void aarch64_add_sve_properties(Object *obj)
+void aarch64_add_sve_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -561,7 +446,7 @@ static void aarch64_add_sve_properties(Object *obj)
 #endif
 }
 
-static void aarch64_add_sme_properties(Object *obj)
+void aarch64_add_sme_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -626,7 +511,7 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
-static void aarch64_add_pauth_properties(Object *obj)
+void aarch64_add_pauth_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
@@ -647,9 +532,6 @@ static void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
-static Property arm_cpu_lpa2_property =
-    DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
-
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 {
     uint64_t t;
@@ -784,384 +666,6 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-static void aarch64_a55_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a55";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00011011;
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x412FD050;          /* r2p0 */
-    cpu->revidr = 0;
-
-    /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
-
-    /* From B2.96 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
-
-    /* From B4.45 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* From D5.4 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410b3000;
-}
-
-static void aarch64_a72_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a72";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr = 0x410fd083;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034080;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64mmfr0 = 0x00001124;
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41023000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
-}
-
-static void aarch64_a76_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a76";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x8444C004;
-    cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x414fd0b1;          /* r4p1 */
-    cpu->revidr = 0;
-
-    /* From B2.18 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
-
-    /* From B2.93 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
-
-    /* From B4.23 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* From B5.1 AdvSIMD AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* From D5.1 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410b3000;
-}
-
-static void aarch64_a64fx_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,a64fx";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr = 0x461f0010;
-    cpu->revidr = 0x00000000;
-    cpu->ctr = 0x86668006;
-    cpu->reset_sctlr = 0x30000180;
-    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
-    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
-    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
-    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
-    cpu->id_aa64afr0 = 0x0000000000000000;
-    cpu->id_aa64afr1 = 0x0000000000000000;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
-    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
-    cpu->isar.id_aa64isar0 = 0x0000000010211120;
-    cpu->isar.id_aa64isar1 = 0x0000000000010001;
-    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
-    cpu->clidr = 0x0000000080000023;
-    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
-    cpu->dcz_blocksize = 6; /* 256 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* The A64FX supports only 128, 256 and 512 bit vector lengths */
-    aarch64_add_sve_properties(obj);
-    cpu->sve_vq.supported = (1 << 0)  /* 128bit */
-                          | (1 << 1)  /* 256bit */
-                          | (1 << 3); /* 512bit */
-
-    cpu->isar.reset_pmcr_el0 = 0x46014040;
-
-    /* TODO:  Add A64FX specific HPC extension registers */
-}
-
-static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
-    { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ATCR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ATCR_EL12", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 5, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "AVTCR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    /*
-     * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
-     * (and in particular its system registers).
-     */
-    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
-      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },
-    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010 },
-    { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPMR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 3,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPOR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 2,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPSELR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 0,
-      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ERXPFGCDN_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ERXPFGF_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-};
-
-static void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
-{
-    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
-}
-
-static void aarch64_neoverse_n1_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,neoverse-n1";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-
-    /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x8444c004;
-    cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x414fd0c1;          /* r4p1 */
-    cpu->revidr = 0;
-
-    /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
-
-    /* From B2.98 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
-
-    /* From B4.23 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-
-    /* From B5.1 AdvSIMD AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
-
-    /* From D5.1 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410c3000;
-
-    define_neoverse_n1_cp_reginfo(cpu);
-}
-
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -1180,185 +684,6 @@ static void aarch64_host_initfn(Object *obj)
 #endif
 }
 
-/*
- * -cpu max: a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
- * this only needs to handle 64 bits.
- */
-static void aarch64_max_tcg_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
-    uint32_t u;
-
-    /*
-     * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
-     * one and try to apply errata workarounds or use impdef features we
-     * don't provide.
-     * An IMPLEMENTER field of 0 means "reserved for software use";
-     * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
-     * to see which features are present";
-     * the VARIANT, PARTNUM and REVISION fields are all implementation
-     * defined and we choose to define PARTNUM just in case guest
-     * code needs to distinguish this QEMU CPU from other software
-     * implementations, though this shouldn't be needed.
-     */
-    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
-    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
-    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
-    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
-    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-    cpu->midr = t;
-
-    /*
-     * We're going to set FEAT_S2FWB, which mandates that CLIDR_EL1.{LoUU,LoUIS}
-     * are zero.
-     */
-    u = cpu->clidr;
-    u = FIELD_DP32(u, CLIDR_EL1, LOUIS, 0);
-    u = FIELD_DP32(u, CLIDR_EL1, LOUU, 0);
-    cpu->clidr = u;
-
-    t = cpu->isar.id_aa64isar0;
-    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
-    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* FEAT_SHA3 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);      /* FEAT_SM3 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);      /* FEAT_SM4 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
-    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);      /* FEAT_FHM */
-    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
-    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
-    cpu->isar.id_aa64isar0 = t;
-
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
-    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
-    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2);    /* FEAT_LRCPC2 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);  /* FEAT_FRINTTS */
-    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
-    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
-    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
-    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
-    cpu->isar.id_aa64isar1 = t;
-
-    t = cpu->isar.id_aa64pfr0;
-    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
-    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
-    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 2);       /* FEAT_RASv1p1 + FEAT_DoubleFault */
-    t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
-    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
-    cpu->isar.id_aa64pfr0 = t;
-
-    t = cpu->isar.id_aa64pfr1;
-    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);        /* FEAT_BTI */
-    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);      /* FEAT_SSBS2 */
-    /*
-     * Begin with full support for MTE. This will be downgraded to MTE=0
-     * during realize if the board provides no tag memory, much like
-     * we do for EL2 with the virtualization=on property.
-     */
-    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
-    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
-    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
-    cpu->isar.id_aa64pfr1 = t;
-
-    t = cpu->isar.id_aa64mmfr0;
-    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
-    cpu->isar.id_aa64mmfr0 = t;
-
-    t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
-    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
-    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
-    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
-    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
-    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 3);      /* FEAT_PAN3 */
-    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
-    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
-    t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
-    cpu->isar.id_aa64mmfr1 = t;
-
-    t = cpu->isar.id_aa64mmfr2;
-    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
-    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
-    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
-    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
-    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
-    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
-    t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
-    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-    t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
-    t = FIELD_DP64(t, ID_AA64MMFR2, EVT, 2);      /* FEAT_EVT */
-    t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
-    cpu->isar.id_aa64mmfr2 = t;
-
-    t = cpu->isar.id_aa64zfr0;
-    t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
-    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);  /* FEAT_BF16 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);      /* FEAT_SVE_SHA3 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);       /* FEAT_SVE_SM4 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
-    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
-    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
-    cpu->isar.id_aa64zfr0 = t;
-
-    t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
-    cpu->isar.id_aa64dfr0 = t;
-
-    t = cpu->isar.id_aa64smfr0;
-    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
-    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
-    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
-    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
-    cpu->isar.id_aa64smfr0 = t;
-
-    /* Replicate the same data to the 32-bit id registers.  */
-    aa32_max_features(cpu);
-
-#ifdef CONFIG_USER_ONLY
-    /*
-     * For usermode -cpu max we can use a larger and more efficient DCZ
-     * blocksize since we don't have to follow what the hardware does.
-     */
-    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-    cpu->dcz_blocksize = 7; /*  512 bytes */
-#endif
-
-    cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
-    cpu->sme_vq.supported = SVE_VQ_POW2_MAP;
-
-    aarch64_add_pauth_properties(obj);
-    aarch64_add_sve_properties(obj);
-    aarch64_add_sme_properties(obj);
-    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
-                        cpu_max_set_sve_max_vq, NULL, NULL);
-    qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
-}
-
 static void aarch64_max_initfn(Object *obj)
 {
     if (kvm_enabled() || hvf_enabled()) {
@@ -1378,14 +703,8 @@ static void aarch64_max_initfn(Object *obj)
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-    { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
-    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
-    { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
-    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
-    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
-    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",               .initfn = aarch64_host_initfn },
diff --git a/target/arm/cpu64.c b/target/arm/tcg/cpu64.c
similarity index 51%
copy from target/arm/cpu64.c
copy to target/arm/tcg/cpu64.c
index 6a6a2ece2b2..646aa46ac96 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1,5 +1,5 @@
 /*
- * QEMU AArch64 CPU
+ * QEMU AArch64 TCG CPUs
  *
  * Copyright (c) 2013 Linaro Ltd
  *
@@ -21,14 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "cpregs.h"
 #include "qemu/module.h"
-#include "sysemu/kvm.h"
-#include "sysemu/hvf.h"
-#include "sysemu/qtest.h"
-#include "sysemu/tcg.h"
-#include "kvm_arm.h"
-#include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 #include "internals.h"
@@ -114,205 +107,6 @@ static void aarch64_a35_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
-{
-    /*
-     * If any vector lengths are explicitly enabled with sve<N> properties,
-     * then all other lengths are implicitly disabled.  If sve-max-vq is
-     * specified then it is the same as explicitly enabling all lengths
-     * up to and including the specified maximum, which means all larger
-     * lengths will be implicitly disabled.  If no sve<N> properties
-     * are enabled and sve-max-vq is not specified, then all lengths not
-     * explicitly disabled will be enabled.  Additionally, all power-of-two
-     * vector lengths less than the maximum enabled length will be
-     * automatically enabled and all vector lengths larger than the largest
-     * disabled power-of-two vector length will be automatically disabled.
-     * Errors are generated if the user provided input that interferes with
-     * any of the above.  Finally, if SVE is not disabled, then at least one
-     * vector length must be enabled.
-     */
-    uint32_t vq_map = cpu->sve_vq.map;
-    uint32_t vq_init = cpu->sve_vq.init;
-    uint32_t vq_supported;
-    uint32_t vq_mask = 0;
-    uint32_t tmp, vq, max_vq = 0;
-
-    /*
-     * CPU models specify a set of supported vector lengths which are
-     * enabled by default.  Attempting to enable any vector length not set
-     * in the supported bitmap results in an error.  When KVM is enabled we
-     * fetch the supported bitmap from the host.
-     */
-    if (kvm_enabled()) {
-        if (kvm_arm_sve_supported()) {
-            cpu->sve_vq.supported = kvm_arm_sve_get_vls(CPU(cpu));
-            vq_supported = cpu->sve_vq.supported;
-        } else {
-            assert(!cpu_isar_feature(aa64_sve, cpu));
-            vq_supported = 0;
-        }
-    } else {
-        vq_supported = cpu->sve_vq.supported;
-    }
-
-    /*
-     * Process explicit sve<N> properties.
-     * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
-     * Check first for any sve<N> enabled.
-     */
-    if (vq_map != 0) {
-        max_vq = 32 - clz32(vq_map);
-        vq_mask = MAKE_64BIT_MASK(0, max_vq);
-
-        if (cpu->sve_max_vq && max_vq > cpu->sve_max_vq) {
-            error_setg(errp, "cannot enable sve%d", max_vq * 128);
-            error_append_hint(errp, "sve%d is larger than the maximum vector "
-                              "length, sve-max-vq=%d (%d bits)\n",
-                              max_vq * 128, cpu->sve_max_vq,
-                              cpu->sve_max_vq * 128);
-            return;
-        }
-
-        if (kvm_enabled()) {
-            /*
-             * For KVM we have to automatically enable all supported unitialized
-             * lengths, even when the smaller lengths are not all powers-of-two.
-             */
-            vq_map |= vq_supported & ~vq_init & vq_mask;
-        } else {
-            /* Propagate enabled bits down through required powers-of-two. */
-            vq_map |= SVE_VQ_POW2_MAP & ~vq_init & vq_mask;
-        }
-    } else if (cpu->sve_max_vq == 0) {
-        /*
-         * No explicit bits enabled, and no implicit bits from sve-max-vq.
-         */
-        if (!cpu_isar_feature(aa64_sve, cpu)) {
-            /* SVE is disabled and so are all vector lengths.  Good. */
-            return;
-        }
-
-        if (kvm_enabled()) {
-            /* Disabling a supported length disables all larger lengths. */
-            tmp = vq_init & vq_supported;
-        } else {
-            /* Disabling a power-of-two disables all larger lengths. */
-            tmp = vq_init & SVE_VQ_POW2_MAP;
-        }
-        vq = ctz32(tmp) + 1;
-
-        max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-        vq_mask = MAKE_64BIT_MASK(0, max_vq);
-        vq_map = vq_supported & ~vq_init & vq_mask;
-
-        if (max_vq == 0 || vq_map == 0) {
-            error_setg(errp, "cannot disable sve%d", vq * 128);
-            error_append_hint(errp, "Disabling sve%d results in all "
-                              "vector lengths being disabled.\n",
-                              vq * 128);
-            error_append_hint(errp, "With SVE enabled, at least one "
-                              "vector length must be enabled.\n");
-            return;
-        }
-
-        max_vq = 32 - clz32(vq_map);
-        vq_mask = MAKE_64BIT_MASK(0, max_vq);
-    }
-
-    /*
-     * Process the sve-max-vq property.
-     * Note that we know from the above that no bit above
-     * sve-max-vq is currently set.
-     */
-    if (cpu->sve_max_vq != 0) {
-        max_vq = cpu->sve_max_vq;
-        vq_mask = MAKE_64BIT_MASK(0, max_vq);
-
-        if (vq_init & ~vq_map & (1 << (max_vq - 1))) {
-            error_setg(errp, "cannot disable sve%d", max_vq * 128);
-            error_append_hint(errp, "The maximum vector length must be "
-                              "enabled, sve-max-vq=%d (%d bits)\n",
-                              max_vq, max_vq * 128);
-            return;
-        }
-
-        /* Set all bits not explicitly set within sve-max-vq. */
-        vq_map |= ~vq_init & vq_mask;
-    }
-
-    /*
-     * We should know what max-vq is now.  Also, as we're done
-     * manipulating sve-vq-map, we ensure any bits above max-vq
-     * are clear, just in case anybody looks.
-     */
-    assert(max_vq != 0);
-    assert(vq_mask != 0);
-    vq_map &= vq_mask;
-
-    /* Ensure the set of lengths matches what is supported. */
-    tmp = vq_map ^ (vq_supported & vq_mask);
-    if (tmp) {
-        vq = 32 - clz32(tmp);
-        if (vq_map & (1 << (vq - 1))) {
-            if (cpu->sve_max_vq) {
-                error_setg(errp, "cannot set sve-max-vq=%d", cpu->sve_max_vq);
-                error_append_hint(errp, "This CPU does not support "
-                                  "the vector length %d-bits.\n", vq * 128);
-                error_append_hint(errp, "It may not be possible to use "
-                                  "sve-max-vq with this CPU. Try "
-                                  "using only sve<N> properties.\n");
-            } else {
-                error_setg(errp, "cannot enable sve%d", vq * 128);
-                if (vq_supported) {
-                    error_append_hint(errp, "This CPU does not support "
-                                      "the vector length %d-bits.\n", vq * 128);
-                } else {
-                    error_append_hint(errp, "SVE not supported by KVM "
-                                      "on this host\n");
-                }
-            }
-            return;
-        } else {
-            if (kvm_enabled()) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "The KVM host requires all "
-                                  "supported vector lengths smaller "
-                                  "than %d bits to also be enabled.\n",
-                                  max_vq * 128);
-                return;
-            } else {
-                /* Ensure all required powers-of-two are enabled. */
-                tmp = SVE_VQ_POW2_MAP & vq_mask & ~vq_map;
-                if (tmp) {
-                    vq = 32 - clz32(tmp);
-                    error_setg(errp, "cannot disable sve%d", vq * 128);
-                    error_append_hint(errp, "sve%d is required as it "
-                                      "is a power-of-two length smaller "
-                                      "than the maximum, sve%d\n",
-                                      vq * 128, max_vq * 128);
-                    return;
-                }
-            }
-        }
-    }
-
-    /*
-     * Now that we validated all our vector lengths, the only question
-     * left to answer is if we even want SVE at all.
-     */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        error_setg(errp, "cannot enable sve%d", max_vq * 128);
-        error_append_hint(errp, "SVE must be enabled to enable vector "
-                          "lengths.\n");
-        error_append_hint(errp, "Add sve=on to the CPU property list.\n");
-        return;
-    }
-
-    /* From now on sve_max_vq is the actual maximum supported length. */
-    cpu->sve_max_vq = max_vq;
-    cpu->sve_vq.map = vq_map;
-}
-
 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
@@ -348,442 +142,9 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
     cpu->sve_max_vq = max_vq;
 }
 
-/*
- * Note that cpu_arm_{get,set}_vq cannot use the simpler
- * object_property_add_bool interface because they make use of the
- * contents of "name" to determine which bit on which to operate.
- */
-static void cpu_arm_get_vq(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    ARMVQMap *vq_map = opaque;
-    uint32_t vq = atoi(&name[3]) / 128;
-    bool sve = vq_map == &cpu->sve_vq;
-    bool value;
-
-    /* All vector lengths are disabled when feature is off. */
-    if (sve
-        ? !cpu_isar_feature(aa64_sve, cpu)
-        : !cpu_isar_feature(aa64_sme, cpu)) {
-        value = false;
-    } else {
-        value = extract32(vq_map->map, vq - 1, 1);
-    }
-    visit_type_bool(v, name, &value, errp);
-}
-
-static void cpu_arm_set_vq(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    ARMVQMap *vq_map = opaque;
-    uint32_t vq = atoi(&name[3]) / 128;
-    bool value;
-
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
-    vq_map->map = deposit32(vq_map->map, vq - 1, 1, value);
-    vq_map->init |= 1 << (vq - 1);
-}
-
-static bool cpu_arm_get_sve(Object *obj, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    return cpu_isar_feature(aa64_sve, cpu);
-}
-
-static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
-
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "'sve' feature not supported by KVM on this host");
-        return;
-    }
-
-    t = cpu->isar.id_aa64pfr0;
-    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
-    cpu->isar.id_aa64pfr0 = t;
-}
-
-void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
-{
-    uint32_t vq_map = cpu->sme_vq.map;
-    uint32_t vq_init = cpu->sme_vq.init;
-    uint32_t vq_supported = cpu->sme_vq.supported;
-    uint32_t vq;
-
-    if (vq_map == 0) {
-        if (!cpu_isar_feature(aa64_sme, cpu)) {
-            cpu->isar.id_aa64smfr0 = 0;
-            return;
-        }
-
-        /* TODO: KVM will require limitations via SMCR_EL2. */
-        vq_map = vq_supported & ~vq_init;
-
-        if (vq_map == 0) {
-            vq = ctz32(vq_supported) + 1;
-            error_setg(errp, "cannot disable sme%d", vq * 128);
-            error_append_hint(errp, "All SME vector lengths are disabled.\n");
-            error_append_hint(errp, "With SME enabled, at least one "
-                              "vector length must be enabled.\n");
-            return;
-        }
-    } else {
-        if (!cpu_isar_feature(aa64_sme, cpu)) {
-            vq = 32 - clz32(vq_map);
-            error_setg(errp, "cannot enable sme%d", vq * 128);
-            error_append_hint(errp, "SME must be enabled to enable "
-                              "vector lengths.\n");
-            error_append_hint(errp, "Add sme=on to the CPU property list.\n");
-            return;
-        }
-        /* TODO: KVM will require limitations via SMCR_EL2. */
-    }
-
-    cpu->sme_vq.map = vq_map;
-}
-
-static bool cpu_arm_get_sme(Object *obj, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    return cpu_isar_feature(aa64_sme, cpu);
-}
-
-static void cpu_arm_set_sme(Object *obj, bool value, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
-
-    t = cpu->isar.id_aa64pfr1;
-    t = FIELD_DP64(t, ID_AA64PFR1, SME, value);
-    cpu->isar.id_aa64pfr1 = t;
-}
-
-static bool cpu_arm_get_sme_fa64(Object *obj, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    return cpu_isar_feature(aa64_sme, cpu) &&
-           cpu_isar_feature(aa64_sme_fa64, cpu);
-}
-
-static void cpu_arm_set_sme_fa64(Object *obj, bool value, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
-
-    t = cpu->isar.id_aa64smfr0;
-    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, value);
-    cpu->isar.id_aa64smfr0 = t;
-}
-
-#ifdef CONFIG_USER_ONLY
-/* Mirror linux /proc/sys/abi/{sve,sme}_default_vector_length. */
-static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
-                                        const char *name, void *opaque,
-                                        Error **errp)
-{
-    uint32_t *ptr_default_vq = opaque;
-    int32_t default_len, default_vq, remainder;
-
-    if (!visit_type_int32(v, name, &default_len, errp)) {
-        return;
-    }
-
-    /* Undocumented, but the kernel allows -1 to indicate "maximum". */
-    if (default_len == -1) {
-        *ptr_default_vq = ARM_MAX_VQ;
-        return;
-    }
-
-    default_vq = default_len / 16;
-    remainder = default_len % 16;
-
-    /*
-     * Note that the 512 max comes from include/uapi/asm/sve_context.h
-     * and is the maximum architectural width of ZCR_ELx.LEN.
-     */
-    if (remainder || default_vq < 1 || default_vq > 512) {
-        ARMCPU *cpu = ARM_CPU(obj);
-        const char *which =
-            (ptr_default_vq == &cpu->sve_default_vq ? "sve" : "sme");
-
-        error_setg(errp, "cannot set %s-default-vector-length", which);
-        if (remainder) {
-            error_append_hint(errp, "Vector length not a multiple of 16\n");
-        } else if (default_vq < 1) {
-            error_append_hint(errp, "Vector length smaller than 16\n");
-        } else {
-            error_append_hint(errp, "Vector length larger than %d\n",
-                              512 * 16);
-        }
-        return;
-    }
-
-    *ptr_default_vq = default_vq;
-}
-
-static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
-                                        const char *name, void *opaque,
-                                        Error **errp)
-{
-    uint32_t *ptr_default_vq = opaque;
-    int32_t value = *ptr_default_vq * 16;
-
-    visit_type_int32(v, name, &value, errp);
-}
-#endif
-
-static void aarch64_add_sve_properties(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq;
-
-    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
-
-    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-        char name[8];
-        sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_vq,
-                            cpu_arm_set_vq, NULL, &cpu->sve_vq);
-    }
-
-#ifdef CONFIG_USER_ONLY
-    /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
-    object_property_add(obj, "sve-default-vector-length", "int32",
-                        cpu_arm_get_default_vec_len,
-                        cpu_arm_set_default_vec_len, NULL,
-                        &cpu->sve_default_vq);
-#endif
-}
-
-static void aarch64_add_sme_properties(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq;
-
-    object_property_add_bool(obj, "sme", cpu_arm_get_sme, cpu_arm_set_sme);
-    object_property_add_bool(obj, "sme_fa64", cpu_arm_get_sme_fa64,
-                             cpu_arm_set_sme_fa64);
-
-    for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
-        char name[8];
-        sprintf(name, "sme%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_vq,
-                            cpu_arm_set_vq, NULL, &cpu->sme_vq);
-    }
-
-#ifdef CONFIG_USER_ONLY
-    /* Mirror linux /proc/sys/abi/sme_default_vector_length. */
-    object_property_add(obj, "sme-default-vector-length", "int32",
-                        cpu_arm_get_default_vec_len,
-                        cpu_arm_set_default_vec_len, NULL,
-                        &cpu->sme_default_vq);
-#endif
-}
-
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
-{
-    int arch_val = 0, impdef_val = 0;
-    uint64_t t;
-
-    /* Exit early if PAuth is enabled, and fall through to disable it */
-    if ((kvm_enabled() || hvf_enabled()) && cpu->prop_pauth) {
-        if (!cpu_isar_feature(aa64_pauth, cpu)) {
-            error_setg(errp, "'pauth' feature not supported by %s on this host",
-                       kvm_enabled() ? "KVM" : "hvf");
-        }
-
-        return;
-    }
-
-    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
-    if (cpu->prop_pauth) {
-        if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
-        } else {
-            arch_val = 1;
-        }
-    } else if (cpu->prop_pauth_impdef) {
-        error_setg(errp, "cannot enable pauth-impdef without pauth");
-        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
-    }
-
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
-    cpu->isar.id_aa64isar1 = t;
-}
-
-static Property arm_cpu_pauth_property =
-    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
-static Property arm_cpu_pauth_impdef_property =
-    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
-
-static void aarch64_add_pauth_properties(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    /* Default to PAUTH on, with the architected algorithm on TCG. */
-    qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-    if (kvm_enabled() || hvf_enabled()) {
-        /*
-         * Mirror PAuth support from the probed sysregs back into the
-         * property for KVM or hvf. Is it just a bit backward? Yes it is!
-         * Note that prop_pauth is true whether the host CPU supports the
-         * architected QARMA5 algorithm or the IMPDEF one. We don't
-         * provide the separate pauth-impdef property for KVM or hvf,
-         * only for TCG.
-         */
-        cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
-    } else {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
-    }
-}
-
 static Property arm_cpu_lpa2_property =
     DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
 
-void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
-{
-    uint64_t t;
-
-    /*
-     * We only install the property for tcg -cpu max; this is the
-     * only situation in which the cpu field can be true.
-     */
-    if (!cpu->prop_lpa2) {
-        return;
-    }
-
-    t = cpu->isar.id_aa64mmfr0;
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2);   /* 16k pages w/ LPA2 */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);    /*  4k pages w/ LPA2 */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 3); /* 16k stage2 w/ LPA2 */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 3);  /*  4k stage2 w/ LPA2 */
-    cpu->isar.id_aa64mmfr0 = t;
-}
-
-static void aarch64_a57_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a57";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
-    cpu->midr = 0x411fd070;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034070;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_isar6 = 0;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64mmfr0 = 0x00001124;
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41013000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
-}
-
-static void aarch64_a53_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a53";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
-    cpu->midr = 0x410fd034;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034070;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_isar6 = 0;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x00110f13;
-    cpu->isar.dbgdevid1 = 0x1;
-    cpu->isar.reset_pmcr_el0 = 0x41033000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe07a; /* 1024KB L2 cache */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
-}
-
 static void aarch64_a55_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1162,30 +523,12 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     define_neoverse_n1_cp_reginfo(cpu);
 }
 
-static void aarch64_host_initfn(Object *obj)
-{
-#if defined(CONFIG_KVM)
-    ARMCPU *cpu = ARM_CPU(obj);
-    kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-        aarch64_add_pauth_properties(obj);
-    }
-#elif defined(CONFIG_HVF)
-    ARMCPU *cpu = ARM_CPU(obj);
-    hvf_arm_set_cpu_features_from_host(cpu);
-    aarch64_add_pauth_properties(obj);
-#else
-    g_assert_not_reached();
-#endif
-}
-
 /*
  * -cpu max: a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
  * this only needs to handle 64 bits.
  */
-static void aarch64_max_tcg_initfn(Object *obj)
+void aarch64_max_tcg_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
@@ -1359,140 +702,19 @@ static void aarch64_max_tcg_initfn(Object *obj)
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
-static void aarch64_max_initfn(Object *obj)
-{
-    if (kvm_enabled() || hvf_enabled()) {
-        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
-        aarch64_host_initfn(obj);
-        return;
-    }
-
-    if (tcg_enabled() || qtest_enabled()) {
-        aarch64_a57_initfn(obj);
-    }
-
-    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-    if (tcg_enabled()) {
-        aarch64_max_tcg_initfn(obj);
-    }
-}
-
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
-    { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
-    { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
-    { .name = "max",                .initfn = aarch64_max_initfn },
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    { .name = "host",               .initfn = aarch64_host_initfn },
-#endif
-};
-
-static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
-}
-
-static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    /* At this time, this property is only allowed if KVM is enabled.  This
-     * restriction allows us to avoid fixing up functionality that assumes a
-     * uniform execution state like do_interrupt.
-     */
-    if (value == false) {
-        if (!kvm_enabled() || !kvm_arm_aarch32_supported()) {
-            error_setg(errp, "'aarch64' feature cannot be disabled "
-                             "unless KVM is enabled and 32-bit EL1 "
-                             "is supported");
-            return;
-        }
-        unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    } else {
-        set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    }
-}
-
-static void aarch64_cpu_finalizefn(Object *obj)
-{
-}
-
-static gchar *aarch64_gdb_arch_name(CPUState *cs)
-{
-    return g_strdup("aarch64");
-}
-
-static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
-{
-    CPUClass *cc = CPU_CLASS(oc);
-
-    cc->gdb_read_register = aarch64_cpu_gdb_read_register;
-    cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 34;
-    cc->gdb_core_xml_file = "aarch64-core.xml";
-    cc->gdb_arch_name = aarch64_gdb_arch_name;
-
-    object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
-                                   aarch64_cpu_set_aarch64);
-    object_class_property_set_description(oc, "aarch64",
-                                          "Set on/off to enable/disable aarch64 "
-                                          "execution state ");
-}
-
-static void aarch64_cpu_instance_init(Object *obj)
-{
-    ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
-
-    acc->info->initfn(obj);
-    arm_cpu_post_init(obj);
-}
-
-static void cpu_register_class_init(ObjectClass *oc, void *data)
-{
-    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
-
-    acc->info = data;
-}
-
-void aarch64_cpu_register(const ARMCPUInfo *info)
-{
-    TypeInfo type_info = {
-        .parent = TYPE_AARCH64_CPU,
-        .instance_size = sizeof(ARMCPU),
-        .instance_init = aarch64_cpu_instance_init,
-        .class_size = sizeof(ARMCPUClass),
-        .class_init = info->class_init ?: cpu_register_class_init,
-        .class_data = (void *)info,
-    };
-
-    type_info.name = g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
-    type_register(&type_info);
-    g_free((void *)type_info.name);
-}
-
-static const TypeInfo aarch64_cpu_type_info = {
-    .name = TYPE_AARCH64_CPU,
-    .parent = TYPE_ARM_CPU,
-    .instance_size = sizeof(ARMCPU),
-    .instance_finalize = aarch64_cpu_finalizefn,
-    .abstract = true,
-    .class_size = sizeof(AArch64CPUClass),
-    .class_init = aarch64_cpu_class_init,
 };
 
 static void aarch64_cpu_register_types(void)
 {
     size_t i;
 
-    type_register_static(&aarch64_cpu_type_info);
-
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
     }
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index d27e76af6cb..128f782816a 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -35,6 +35,7 @@ arm_ss.add(files(
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
   'translate-a64.c',
   'translate-sve.c',
   'translate-sme.c',
-- 
2.34.1


