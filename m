Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902065523CA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:23:06 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M3F-0000wd-BV
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La5-00069j-Qk
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La1-0001Sg-Td
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id go6so6037296pjb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+m84gtfOUbmxmC1WizriZFGe/UkDUFluZJCR0LwtuS0=;
 b=skaO4UxfKrmmQof36jZe+ZrXf2oXiZHVT7a0YnUItFHnH6u/Cu50q0qvnLEAVMvRzY
 BtUyx3rE40ikyNK3NhXrD2Sd1kgfBkUSkw1vUlXpeydsKDAlmujP4qtK3faTnwQNHfoX
 6VfXweu+3Z70Ko1x2AjdooIFySipaAt5RKjok7QSAP6eU7EiPaPCt0lcVOxXE5kyV/G9
 GXAtuXCc0SgqMxH+Czv0jdBA4zojG4K98atArBvXuWmPhYWyEXVAK8SqMr9IFbTXuu99
 pEV/QK/wLbM+vjidu35Y6r0jMhxKjN9gxHIRsjjWU07CqfQqnLyA0uHjPqUK53ZoIupd
 y0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+m84gtfOUbmxmC1WizriZFGe/UkDUFluZJCR0LwtuS0=;
 b=IZqtvfgO9kRn/PwytVRQNZMGIrM1f4Q8Pwn79Ur53j/V7HxQP/erob0FT90+HA4xhJ
 nekS0ELUlQBBcrNMFl7FpdhIzm4tpT+MF6787rxt0Dew1ClKIQr6BH8eG6roEuzzPKWy
 iiR5nO2gDcwcDFrcOwl4ubcAa6OHFUFJytYM/WoqFBeZEOLHm9afTzlqQF+p+HUNUjnH
 +ufTVGxP0FlSHnRgMHS2vi/Tnp/2SZJolm/Xr54eaTNYpcvmNBTbx34cYNyOm/6N9ut4
 inZLAJi+4OADPLAGX1bxyM7Dx1biZrJ0+yxmSxHj5AtjxTdcJVBrwDMNStzT9BlFkwoa
 Wvbw==
X-Gm-Message-State: AJIora8dOiEV1cl/wpzwzW9pjqCpkTH14MF+nRr6J1VzdjwJLFJfufMM
 57OY/cwuZztiQ/x51+Jm9BGCGzf423odfA==
X-Google-Smtp-Source: AGRyM1tnfvobOs6iCxmlRisBsFnXzBY9C4aOWM7frgOfJ6f/NsoC5PtMcfjrtspZegtsUuvAAwVmuA==
X-Received: by 2002:a17:90b:682:b0:1e3:142:a562 with SMTP id
 m2-20020a17090b068200b001e30142a562mr38212399pjz.91.1655747571548; 
 Mon, 20 Jun 2022 10:52:51 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 17/51] target/arm: Add cpu properties for SME
Date: Mon, 20 Jun 2022 10:52:01 -0700
Message-Id: <20220620175235.60881-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Mirror the properties for SVE.  The main difference is
that any arbitrary set of powers of 2 may be supported,
and not the stricter constraints that apply to SVE.

Include a property to control FEAT_SME_FA64, as failing
to restrict the runtime to the proper subset of insns
could be a major point for bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/cpu-features.rst |  56 +++++++++++++++
 target/arm/cpu.h                 |   2 +
 target/arm/internals.h           |   1 +
 target/arm/cpu.c                 |  14 +++-
 target/arm/cpu64.c               | 114 +++++++++++++++++++++++++++++--
 5 files changed, 180 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 3e626c4b68..3fd76fa0b4 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -372,6 +372,31 @@ verbose command lines.  However, the recommended way to select vector
 lengths is to explicitly enable each desired length.  Therefore only
 example's (1), (4), and (6) exhibit recommended uses of the properties.
 
+SME CPU Property Examples
+-------------------------
+
+  1) Disable SME::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sme=off
+
+  2) Implicitly enable all vector lengths for the ``max`` CPU type::
+
+     $ qemu-system-aarch64 -M virt -cpu max
+
+  3) Only enable the 256-bit vector length::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sme256=on
+
+  3) Enable the 256-bit and 1024-bit vector lengths::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sme256=on,sme1024=on
+
+  4) Disable the 512-bit vector length.  This results in all the other
+     lengths supported by ``max`` defaulting to enabled
+     (128, 256, 1024 and 2048)::
+
+     $ qemu-system-aarch64 -M virt -cpu max,sve512=off
+
 SVE User-mode Default Vector Length Property
 --------------------------------------------
 
@@ -387,3 +412,34 @@ length supported by QEMU is 256.
 
 If this property is set to ``-1`` then the default vector length
 is set to the maximum possible length.
+
+SME CPU Properties
+==================
+
+The SME CPU properties are much like the SVE properties: ``sme`` is
+used to enable or disable the entire SME feature, and ``sme<N>`` is
+used to enable or disable specific vector lengths.  Finally,
+``sme_fa64`` is used to enable or disable ``FEAT_SME_FA64``, which
+allows execution of the "full a64" instruction set while Streaming
+SVE mode is enabled.
+
+SME is not supported by KVM at this time.
+
+At least one vector length must be enabled when ``sme`` is enabled,
+and all vector lengths must be powers of 2.  The maximum vector
+length supported by qemu is 2048 bits.  Otherwise, there are no
+additional constraints on the set of vector lengths supported by SME.
+
+SME User-mode Default Vector Length Property
+--------------------------------------------
+
+For qemu-aarch64, the cpu propery ``sme-default-vector-length=N`` is
+defined to mirror the Linux kernel parameter file
+``/proc/sys/abi/sme_default_vector_length``.  The default length, ``N``,
+is in units of bytes and must be between 16 and 8192.
+If not specified, the default vector length is 32.
+
+As with ``sve-default-vector-length``, if the default length is larger
+than the maximum vector length enabled, the actual vector length will
+be reduced.  If this property is set to ``-1`` then the default vector
+length is set to the maximum possible length.
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c73f289125..8b00d29af4 100644
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
index aef568adf7..c66f74a0db 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1289,6 +1289,7 @@ int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
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
index 6f6ee57a91..19188d6cc2 100644
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
@@ -977,9 +1081,11 @@ static void aarch64_max_initfn(Object *obj)
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


