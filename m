Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7453C0D6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:36:04 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtQB-0002u6-2C
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh9-00058c-OV
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:31 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh7-0000F5-Bg
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:31 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso10608719pjf.5
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vO3Yto/XnsTJAh/EMBZYKjobNaPPy/x1NLNYISgx84=;
 b=cxnVdPAoEYngXlGBzq26iAozhPorMjLhqugxLL897SRao+LQCtXQX1IfOhfkfaNgHs
 jYyeHzaeRCXl9Wu3rssmwTLq675aBaWmJLIBTHokDhO/BqJIa0sQAfhp2/o3m+aT6lSs
 tTQ3ANsQQrOtJWC0ek27SscxVLWhUgaNvr/wXgRa9MCdN6HyRMCL5eny4oyNFD1a4Q52
 pL/URiZs5Ch1YuVPxxVbsUtPng42I83112+CMy4O6Z9sIIWqRmoE5OJ+tqI+oYCfGHui
 XQVpfpRwmRCqNUBOrPGUKHttFXm/C0uq4Tb42l3Vw/1+nKWlzajBf2TgrmuVH5Yx1Ok1
 ZFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vO3Yto/XnsTJAh/EMBZYKjobNaPPy/x1NLNYISgx84=;
 b=chnMyWFd6dMmwwCrZGuVauMGoRDDmQQJfsC9fkYXKOVoGkdAIZ5q1Ue0rDLFP1iUQ4
 KPN7ivib/J4oCnIIfXrEEse/Lw6m4rmrSCtApQrHbkODhYTFcZZkZRFmq2P4mx2lfNDw
 k6TbXQ0E99UnojRr6GxNkduB2zzfukeiJpHwguoccnUXnElhgrTJA0NjFS+j29CE4/0Q
 7+uR5VZka+z8JtMuDXPUgEq0mduuX5IntKpbPpLeq41BZiOH1ZwBFQGCG2HD2h6dG9VW
 2+aoYMsq6eqsd/kJpqH0HTRANnBwZ3TRealkBHrsOuo+mtCGwHwwhrBm+0+HrlWfY4Im
 7vhw==
X-Gm-Message-State: AOAM533/6B4jaJOCBmvlOZImQspOnDs4jdfpJv2VwyPg1lswpuKM7ajN
 nfkVMy8iHYlCjwxfCD9W2hWBmORmnpzulg==
X-Google-Smtp-Source: ABdhPJzPLXo6nTrCihK2nWjCv74ZOy1gabx6sdPRIbpqc/7usWY+6Mi3SLe5izMolAc8mC5bpWgSOQ==
X-Received: by 2002:a17:90a:64c5:b0:1e6:a230:2a71 with SMTP id
 i5-20020a17090a64c500b001e6a2302a71mr2448171pjm.49.1654206566934; 
 Thu, 02 Jun 2022 14:49:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 37/71] target/arm: Add cpu properties for SME
Date: Thu,  2 Jun 2022 14:48:19 -0700
Message-Id: <20220602214853.496211-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Mirror the properties for SVE.  The main difference is
that any arbitrary set of powers of 2 may be supported,
and not the stricter constraints that apply to SVE.

Include a property to control FEAT_SME_FA64, as failing
to restrict the runtime to the proper subset of insns
could be a major point for bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |   2 +
 target/arm/internals.h |   1 +
 target/arm/cpu.c       |  14 +++--
 target/arm/cpu64.c     | 114 +++++++++++++++++++++++++++++++++++++++--
 4 files changed, 124 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 60f84ba033..d74c06e2f0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1046,9 +1046,11 @@ struct ArchCPU {
 #ifdef CONFIG_USER_ONLY
     /* Used to set the default vector length at process start. */
     uint32_t sve_default_vq;
+    uint32_t sme_default_vq;
 #endif
 
     ARMVQMap sve_vq;
+    ARMVQMap sme_vq;
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 756301b536..7e160d1349 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1310,6 +1310,7 @@ int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b5276fa944..75295a14a3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1122,11 +1122,13 @@ static void arm_cpu_initfn(Object *obj)
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
     /*
-     * The linux kernel defaults to 512-bit vectors, when sve is supported.
-     * See documentation for /proc/sys/abi/sve_default_vector_length, and
-     * our corresponding sve-default-vector-length cpu property.
+     * The linux kernel defaults to 512-bit for SVE, and 256-bit for SME.
+     * These values were chosen to fit within the default signal frame.
+     * See documentation for /proc/sys/abi/{sve,sme}_default_vector_length,
+     * and our corresponding cpu property.
      */
     cpu->sve_default_vq = 4;
+    cpu->sme_default_vq = 2;
 # endif
 #else
     /* Our inbound IRQ and FIQ lines */
@@ -1429,6 +1431,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
 
+        arm_cpu_sme_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
         arm_cpu_pauth_finalize(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9ae9be6698..aaf2c243d6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -589,10 +589,13 @@ static void cpu_arm_get_vq(Object *obj, Visitor *v, const char *name,
     ARMCPU *cpu = ARM_CPU(obj);
     ARMVQMap *vq_map = opaque;
     uint32_t vq = atoi(&name[3]) / 128;
+    bool sve = vq_map == &cpu->sve_vq;
     bool value;
 
-    /* All vector lengths are disabled when SVE is off. */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
+    /* All vector lengths are disabled when feature is off. */
+    if (sve
+        ? !cpu_isar_feature(aa64_sve, cpu)
+        : !cpu_isar_feature(aa64_sme, cpu)) {
         value = false;
     } else {
         value = extract32(vq_map->map, vq - 1, 1);
@@ -636,8 +639,80 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     cpu->isar.id_aa64pfr0 = t;
 }
 
+void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
+{
+    uint32_t vq_map = cpu->sme_vq.map;
+    uint32_t vq_init = cpu->sme_vq.init;
+    uint32_t vq_supported = cpu->sme_vq.supported;
+    uint32_t vq;
+
+    if (vq_map == 0) {
+        if (!cpu_isar_feature(aa64_sme, cpu)) {
+            cpu->isar.id_aa64smfr0 = 0;
+            return;
+        }
+
+        /* TODO: KVM will require limitations via SMCR_EL2. */
+        vq_map = vq_supported & ~vq_init;
+
+        if (vq_map == 0) {
+            vq = ctz32(vq_supported) + 1;
+            error_setg(errp, "cannot disable sme%d", vq * 128);
+            error_append_hint(errp, "All SME vector lengths are disabled.\n");
+            error_append_hint(errp, "With SME enabled, at least one "
+                              "vector length must be enabled.\n");
+            return;
+        }
+    } else {
+        if (!cpu_isar_feature(aa64_sme, cpu)) {
+            vq = 32 - clz32(vq_map);
+            error_setg(errp, "cannot enable sme%d", vq * 128);
+            error_append_hint(errp, "SME must be enabled to enable "
+                              "vector lengths.\n");
+            error_append_hint(errp, "Add sme=on to the CPU property list.\n");
+            return;
+        }
+        /* TODO: KVM will require limitations via SMCR_EL2. */
+    }
+
+    cpu->sme_vq.map = vq_map;
+}
+
+static bool cpu_arm_get_sme(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu_isar_feature(aa64_sme, cpu);
+}
+
+static void cpu_arm_set_sme(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    t = cpu->isar.id_aa64pfr1;
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, value);
+    cpu->isar.id_aa64pfr1 = t;
+}
+
+static bool cpu_arm_get_sme_fa64(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu_isar_feature(aa64_sme, cpu) &&
+           cpu_isar_feature(aa64_sme_fa64, cpu);
+}
+
+static void cpu_arm_set_sme_fa64(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, value);
+    cpu->isar.id_aa64smfr0 = t;
+}
+
 #ifdef CONFIG_USER_ONLY
-/* Mirror linux /proc/sys/abi/sve_default_vector_length. */
+/* Mirror linux /proc/sys/abi/{sve,sme}_default_vector_length. */
 static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
                                         const char *name, void *opaque,
                                         Error **errp)
@@ -663,7 +738,11 @@ static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
      * and is the maximum architectural width of ZCR_ELx.LEN.
      */
     if (remainder || default_vq < 1 || default_vq > 512) {
-        error_setg(errp, "cannot set sve-default-vector-length");
+        ARMCPU *cpu = ARM_CPU(obj);
+        const char *which =
+            (ptr_default_vq == &cpu->sve_default_vq ? "sve" : "sme");
+
+        error_setg(errp, "cannot set %s-default-vector-length", which);
         if (remainder) {
             error_append_hint(errp, "Vector length not a multiple of 16\n");
         } else if (default_vq < 1) {
@@ -712,6 +791,31 @@ static void aarch64_add_sve_properties(Object *obj)
 #endif
 }
 
+static void aarch64_add_sme_properties(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq;
+
+    object_property_add_bool(obj, "sme", cpu_arm_get_sme, cpu_arm_set_sme);
+    object_property_add_bool(obj, "sme_fa64", cpu_arm_get_sme_fa64,
+                             cpu_arm_set_sme_fa64);
+
+    for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
+        char name[8];
+        sprintf(name, "sme%d", vq * 128);
+        object_property_add(obj, name, "bool", cpu_arm_get_vq,
+                            cpu_arm_set_vq, NULL, &cpu->sme_vq);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    /* Mirror linux /proc/sys/abi/sme_default_vector_length. */
+    object_property_add(obj, "sme-default-vector-length", "int32",
+                        cpu_arm_get_default_vec_len,
+                        cpu_arm_set_default_vec_len, NULL,
+                        &cpu->sme_default_vq);
+#endif
+}
+
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
     int arch_val = 0, impdef_val = 0;
@@ -976,9 +1080,11 @@ static void aarch64_max_initfn(Object *obj)
 #endif
 
     cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
+    cpu->sme_vq.supported = SVE_VQ_POW2_MAP;
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
+    aarch64_add_sme_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
-- 
2.34.1


