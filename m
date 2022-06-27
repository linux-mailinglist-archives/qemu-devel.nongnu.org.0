Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5255B93D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:45:14 +0200 (CEST)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mEz-0007B1-C9
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltQ-0002Q1-Un
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltO-0004w9-NU
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:56 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w17so12334926wrg.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S5KlS03XVlUTJnKwjh9r15WOZqJ50ROAGOtbVW9mWeY=;
 b=ECh2yd0JL7PvbvW9gxi9g3kvrgUUqoOrULEsJ1aCsXxoHekbNJ2c8PT5ILvIhckkAs
 7vgH85LiGHLeuLZJoYE1J264fMpsUwkTIuhPZE12hImc0IBdVpFuc3cGc962l8s61+ZD
 z5WD5+D33jKJynGlGkhuZeim1RrOeUf2Pbx4VwGbyM5LguKQDe7OxV/yBY6sG68LYLVG
 gQq2qUHEoVPKIXuKTtn9Ds1ZDBuEPBuzKWPjcnFp9s6A3dwnP5fmABhzknUGxMF8cY/l
 Lj2SCQ5TkPh1B+siq/6AaPF5jRqnO5GUQCNNRkJ/aIWOfk+rU1RO19v3YvrcyzEXrrCf
 BJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S5KlS03XVlUTJnKwjh9r15WOZqJ50ROAGOtbVW9mWeY=;
 b=e3Af0i9dBGhhGHUn0XPJglGZ9mehMdhq98yiI3zT+RvphMIA88rR5XgX5/KVUK9oQn
 TqT05vh1h8yY7cUdJ1Qxap1I1htGqLGvrTCMVZXuMIM8Rv7N2vSFCFtCmYaQN3x7r6D1
 x8oSBBH6MLNPw//X/rwgEI/sXL9R1H0N27YKShlqmmdY2Q1sNwlpXmmpwIzkj1Nt5xb/
 agoiTx40d0whyLR2JjoWuLCNqM+TMSU/uICNoWbNXjzqG3Ur6RdHn+dF9H5fV6PBVU0x
 zCtoLuQjewRCeBO4TSXr7YovflDHW4b1PbX57YuYI1DtlVm+NtFXbLHHGs3bl5rzApmU
 H+Pw==
X-Gm-Message-State: AJIora+58M+PNhqqBlxJFtOkZgtp+beTHjgUGdAreOTN15tsCSUpkiDt
 ddBG1a0l8uqyuJ1E38smx9wCrgKedBHEFw==
X-Google-Smtp-Source: AGRyM1v2xWPKQ6ZtkpHLK3xbpJ3KkSoAI7sEXcywJbr5+yA0rYIQZpiq/HkMjB0fyE0kGy/6ZJ9N9w==
X-Received: by 2002:a05:6000:2ab:b0:211:7fd6:24ef with SMTP id
 l11-20020a05600002ab00b002117fd624efmr11706448wry.67.1656325373301; 
 Mon, 27 Jun 2022 03:22:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/25] target/arm: Add cpu properties for SME
Date: Mon, 27 Jun 2022 11:22:31 +0100
Message-Id: <20220627102236.3097629-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Mirror the properties for SVE.  The main difference is
that any arbitrary set of powers of 2 may be supported,
and not the stricter constraints that apply to SVE.

Include a property to control FEAT_SME_FA64, as failing
to restrict the runtime to the proper subset of insns
could be a major point for bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220620175235.60881-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst |  56 +++++++++++++++
 target/arm/cpu.h                 |   2 +
 target/arm/internals.h           |   1 +
 target/arm/cpu.c                 |  14 +++-
 target/arm/cpu64.c               | 114 +++++++++++++++++++++++++++++--
 5 files changed, 180 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 3e626c4b68a..3fd76fa0b4f 100644
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
index d2b005f76c8..c018f97b77b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1060,9 +1060,11 @@ struct ArchCPU {
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
index aef568adf75..c66f74a0db1 100644
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
index 660fd8b8b90..bb44ad45aa1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1123,11 +1123,13 @@ static void arm_cpu_initfn(Object *obj)
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
@@ -1430,6 +1432,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
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
index 6f6ee57a914..19188d6cc2a 100644
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
2.25.1


