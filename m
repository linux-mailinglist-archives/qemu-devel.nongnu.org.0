Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C434B029
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:28:53 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPt4e-0007Qg-UR
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHh-0007ET-EG
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:46112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHd-0001FX-8r
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2A34AF3F;
 Fri, 26 Mar 2021 19:38:01 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 50/65] target/arm: cpu-sve: new module
Date: Fri, 26 Mar 2021 20:36:46 +0100
Message-Id: <20210326193701.5981-51-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

extract the SVE-related cpu object properties and functions,
and move them to a separate module.

Disentangle SVE from pauth that is a separate, TCG-only feature.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-sve.h     |  37 ++++
 target/arm/cpu.h         |  14 +-
 target/arm/cpu-sve.c     | 358 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c         |   5 +-
 target/arm/cpu64.c       | 331 +-----------------------------------
 target/arm/kvm/kvm-cpu.c |   3 +-
 target/arm/meson.build   |   1 +
 7 files changed, 411 insertions(+), 338 deletions(-)
 create mode 100644 target/arm/cpu-sve.h
 create mode 100644 target/arm/cpu-sve.c

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
new file mode 100644
index 0000000000..ece36d2a0c
--- /dev/null
+++ b/target/arm/cpu-sve.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU AArch64 CPU SVE Extensions for TARGET_AARCH64
+ *
+ * Copyright (c) 2013 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#ifndef CPU_SVE_H
+#define CPU_SVE_H
+
+/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */
+
+#include "cpu.h"
+
+/* called by arm_cpu_finalize_features in realizefn */
+void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
+
+/* add the CPU SVE properties */
+void cpu_sve_add_props(Object *obj);
+
+/* add the CPU SVE properties specific to the "MAX" CPU */
+void cpu_sve_add_props_max(Object *obj);
+
+#endif /* CPU_SVE_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 778db4a459..4a5ea510a1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -173,7 +173,8 @@ typedef struct {
 #define VSTCR_SW VTCR_NSW
 #define VSTCR_SA VTCR_NSA
 
-/* Define a maximum sized vector register.
+/*
+ * Define a maximum sized vector register.
  * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
  * For 64-bit, this is a 2048-bit SVE register.
  *
@@ -201,13 +202,9 @@ typedef struct {
 
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
-static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-#endif
+#endif /* TARGET_AARCH64 */
 
 typedef struct ARMVectorReg {
     uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
@@ -219,10 +216,13 @@ typedef struct ARMPredicateReg {
     uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
 } ARMPredicateReg;
 
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 /* In AArch32 mode, PAC keys do not exist at all.  */
 typedef struct ARMPACKey {
     uint64_t lo, hi;
 } ARMPACKey;
+#else
+static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct CPUARMState {
@@ -1052,7 +1052,6 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void aarch64_add_sve_properties(Object *obj);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
@@ -1083,7 +1082,6 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
new file mode 100644
index 0000000000..da60330cc2
--- /dev/null
+++ b/target/arm/cpu-sve.c
@@ -0,0 +1,358 @@
+/*
+ * QEMU ARM CPU
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "sysemu/tcg.h"
+#include "sysemu/kvm.h"
+#include "kvm/kvm_arm.h"
+#include "qapi/visitor.h"
+#include "cpu-sve.h"
+
+void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
+{
+    /*
+     * If any vector lengths are explicitly enabled with sve<N> properties,
+     * then all other lengths are implicitly disabled.  If sve-max-vq is
+     * specified then it is the same as explicitly enabling all lengths
+     * up to and including the specified maximum, which means all larger
+     * lengths will be implicitly disabled.  If no sve<N> properties
+     * are enabled and sve-max-vq is not specified, then all lengths not
+     * explicitly disabled will be enabled.  Additionally, all power-of-two
+     * vector lengths less than the maximum enabled length will be
+     * automatically enabled and all vector lengths larger than the largest
+     * disabled power-of-two vector length will be automatically disabled.
+     * Errors are generated if the user provided input that interferes with
+     * any of the above.  Finally, if SVE is not disabled, then at least one
+     * vector length must be enabled.
+     */
+    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
+    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
+    uint32_t vq, max_vq = 0;
+
+    /* Collect the set of vector lengths supported by KVM. */
+    bitmap_zero(kvm_supported, ARM_MAX_VQ);
+    if (kvm_enabled() && kvm_arm_sve_supported()) {
+        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
+    } else if (kvm_enabled()) {
+        assert(!cpu_isar_feature(aa64_sve, cpu));
+    }
+
+    /*
+     * Process explicit sve<N> properties.
+     * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
+     * Check first for any sve<N> enabled.
+     */
+    if (!bitmap_empty(cpu->sve_vq_map, ARM_MAX_VQ)) {
+        max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
+
+        if (cpu->sve_max_vq && max_vq > cpu->sve_max_vq) {
+            error_setg(errp, "cannot enable sve%d", max_vq * 128);
+            error_append_hint(errp, "sve%d is larger than the maximum vector "
+                              "length, sve-max-vq=%d (%d bits)\n",
+                              max_vq * 128, cpu->sve_max_vq,
+                              cpu->sve_max_vq * 128);
+            return;
+        }
+
+        if (kvm_enabled()) {
+            /*
+             * For KVM we have to automatically enable all supported unitialized
+             * lengths, even when the smaller lengths are not all powers-of-two.
+             */
+            bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
+            bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+        } else if (tcg_enabled()) {
+            /* Propagate enabled bits down through required powers-of-two. */
+            for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+                if (!test_bit(vq - 1, cpu->sve_vq_init)) {
+                    set_bit(vq - 1, cpu->sve_vq_map);
+                }
+            }
+        }
+    } else if (cpu->sve_max_vq == 0) {
+        /*
+         * No explicit bits enabled, and no implicit bits from sve-max-vq.
+         */
+        if (!cpu_isar_feature(aa64_sve, cpu)) {
+            /* SVE is disabled and so are all vector lengths.  Good. */
+            return;
+        }
+
+        if (kvm_enabled()) {
+            /* Disabling a supported length disables all larger lengths. */
+            for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+                if (test_bit(vq - 1, cpu->sve_vq_init) &&
+                    test_bit(vq - 1, kvm_supported)) {
+                    break;
+                }
+            }
+            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+            bitmap_andnot(cpu->sve_vq_map, kvm_supported,
+                          cpu->sve_vq_init, max_vq);
+            if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
+                error_setg(errp, "cannot disable sve%d", vq * 128);
+                error_append_hint(errp, "Disabling sve%d results in all "
+                                  "vector lengths being disabled.\n",
+                                  vq * 128);
+                error_append_hint(errp, "With SVE enabled, at least one "
+                                  "vector length must be enabled.\n");
+                return;
+            }
+        } else if (tcg_enabled()) {
+            /* Disabling a power-of-two disables all larger lengths. */
+            if (test_bit(0, cpu->sve_vq_init)) {
+                error_setg(errp, "cannot disable sve128");
+                error_append_hint(errp, "Disabling sve128 results in all "
+                                  "vector lengths being disabled.\n");
+                error_append_hint(errp, "With SVE enabled, at least one "
+                                  "vector length must be enabled.\n");
+                return;
+            }
+            for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
+                if (test_bit(vq - 1, cpu->sve_vq_init)) {
+                    break;
+                }
+            }
+            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+            bitmap_complement(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
+        }
+
+        max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
+    }
+
+    /*
+     * Process the sve-max-vq property.
+     * Note that we know from the above that no bit above
+     * sve-max-vq is currently set.
+     */
+    if (cpu->sve_max_vq != 0) {
+        max_vq = cpu->sve_max_vq;
+
+        if (!test_bit(max_vq - 1, cpu->sve_vq_map) &&
+            test_bit(max_vq - 1, cpu->sve_vq_init)) {
+            error_setg(errp, "cannot disable sve%d", max_vq * 128);
+            error_append_hint(errp, "The maximum vector length must be "
+                              "enabled, sve-max-vq=%d (%d bits)\n",
+                              max_vq, max_vq * 128);
+            return;
+        }
+
+        /* Set all bits not explicitly set within sve-max-vq. */
+        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
+        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+    }
+
+    /*
+     * We should know what max-vq is now.  Also, as we're done
+     * manipulating sve-vq-map, we ensure any bits above max-vq
+     * are clear, just in case anybody looks.
+     */
+    assert(max_vq != 0);
+    bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
+
+    if (kvm_enabled()) {
+        /* Ensure the set of lengths matches what KVM supports. */
+        bitmap_xor(tmp, cpu->sve_vq_map, kvm_supported, max_vq);
+        if (!bitmap_empty(tmp, max_vq)) {
+            vq = find_last_bit(tmp, max_vq) + 1;
+            if (test_bit(vq - 1, cpu->sve_vq_map)) {
+                if (cpu->sve_max_vq) {
+                    error_setg(errp, "cannot set sve-max-vq=%d",
+                               cpu->sve_max_vq);
+                    error_append_hint(errp, "This KVM host does not support "
+                                      "the vector length %d-bits.\n",
+                                      vq * 128);
+                    error_append_hint(errp, "It may not be possible to use "
+                                      "sve-max-vq with this KVM host. Try "
+                                      "using only sve<N> properties.\n");
+                } else {
+                    error_setg(errp, "cannot enable sve%d", vq * 128);
+                    error_append_hint(errp, "This KVM host does not support "
+                                      "the vector length %d-bits.\n",
+                                      vq * 128);
+                }
+            } else {
+                error_setg(errp, "cannot disable sve%d", vq * 128);
+                error_append_hint(errp, "The KVM host requires all "
+                                  "supported vector lengths smaller "
+                                  "than %d bits to also be enabled.\n",
+                                  max_vq * 128);
+            }
+            return;
+        }
+    } else if (tcg_enabled()) {
+        /* Ensure all required powers-of-two are enabled. */
+        for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+            if (!test_bit(vq - 1, cpu->sve_vq_map)) {
+                error_setg(errp, "cannot disable sve%d", vq * 128);
+                error_append_hint(errp, "sve%d is required as it "
+                                  "is a power-of-two length smaller than "
+                                  "the maximum, sve%d\n",
+                                  vq * 128, max_vq * 128);
+                return;
+            }
+        }
+    }
+
+    /*
+     * Now that we validated all our vector lengths, the only question
+     * left to answer is if we even want SVE at all.
+     */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        error_setg(errp, "cannot enable sve%d", max_vq * 128);
+        error_append_hint(errp, "SVE must be enabled to enable vector "
+                          "lengths.\n");
+        error_append_hint(errp, "Add sve=on to the CPU property list.\n");
+        return;
+    }
+
+    /* From now on sve_max_vq is the actual maximum supported length. */
+    cpu->sve_max_vq = max_vq;
+}
+
+static void get_prop_max_vq(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value;
+
+    /* All vector lengths are disabled when SVE is off. */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        value = 0;
+    } else {
+        value = cpu->sve_max_vq;
+    }
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void set_prop_max_vq(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t max_vq;
+
+    if (!visit_type_uint32(v, name, &max_vq, errp)) {
+        return;
+    }
+
+    if (kvm_enabled() && !kvm_arm_sve_supported()) {
+        error_setg(errp, "cannot set sve-max-vq");
+        error_append_hint(errp, "SVE not supported by KVM on this host\n");
+        return;
+    }
+
+    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
+        error_setg(errp, "unsupported SVE vector length");
+        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
+                          ARM_MAX_VQ);
+        return;
+    }
+
+    cpu->sve_max_vq = max_vq;
+}
+
+/*
+ * Note that cpu_arm_get/set_sve_vq cannot use the simpler
+ * object_property_add_bool interface because they make use
+ * of the contents of "name" to determine which bit on which
+ * to operate.
+ */
+static void get_prop_vq(Object *obj, Visitor *v, const char *name,
+                        void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq = atoi(&name[3]) / 128;
+    bool value;
+
+    /* All vector lengths are disabled when SVE is off. */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        value = false;
+    } else {
+        value = test_bit(vq - 1, cpu->sve_vq_map);
+    }
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void set_prop_vq(Object *obj, Visitor *v, const char *name,
+                        void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq = atoi(&name[3]) / 128;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
+        error_setg(errp, "cannot enable %s", name);
+        error_append_hint(errp, "SVE not supported by KVM on this host\n");
+        return;
+    }
+
+    if (value) {
+        set_bit(vq - 1, cpu->sve_vq_map);
+    } else {
+        clear_bit(vq - 1, cpu->sve_vq_map);
+    }
+    set_bit(vq - 1, cpu->sve_vq_init);
+}
+
+static bool get_prop_sve(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu_isar_feature(aa64_sve, cpu);
+}
+
+static void set_prop_sve(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
+        error_setg(errp, "'sve' feature not supported by KVM on this host");
+        return;
+    }
+
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
+    cpu->isar.id_aa64pfr0 = t;
+}
+
+void cpu_sve_add_props(Object *obj)
+{
+    uint32_t vq;
+
+    object_property_add_bool(obj, "sve", get_prop_sve, set_prop_sve);
+
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        char name[8];
+        sprintf(name, "sve%d", vq * 128);
+        object_property_add(obj, name, "bool", get_prop_vq, set_prop_vq, NULL, NULL);
+    }
+}
+
+/* properties added for MAX CPU */
+void cpu_sve_add_props_max(Object *obj)
+{
+    object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d523d9b68d..828ca28a7a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "target/arm/idau.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "cpu-sve.h"
 #include "cpregs.h"
 
 #ifdef CONFIG_TCG
@@ -818,8 +819,9 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        arm_cpu_sve_finalize(cpu, &local_err);
+        cpu_sve_finalize_features(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
@@ -838,6 +840,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             }
         }
     }
+#endif /* TARGET_AARCH64 */
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2e281d2fe4..4c758ab5a4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "cpu-sve.h"
 #include "qemu/module.h"
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
@@ -245,331 +246,6 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
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
-    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
-    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
-    uint32_t vq, max_vq = 0;
-
-    /* Collect the set of vector lengths supported by KVM. */
-    bitmap_zero(kvm_supported, ARM_MAX_VQ);
-    if (kvm_enabled() && kvm_arm_sve_supported()) {
-        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
-    } else if (kvm_enabled()) {
-        assert(!cpu_isar_feature(aa64_sve, cpu));
-    }
-
-    /*
-     * Process explicit sve<N> properties.
-     * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
-     * Check first for any sve<N> enabled.
-     */
-    if (!bitmap_empty(cpu->sve_vq_map, ARM_MAX_VQ)) {
-        max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
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
-            bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
-            bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
-        } else if (tcg_enabled()) {
-            /* Propagate enabled bits down through required powers-of-two. */
-            for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-                if (!test_bit(vq - 1, cpu->sve_vq_init)) {
-                    set_bit(vq - 1, cpu->sve_vq_map);
-                }
-            }
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
-            for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-                if (test_bit(vq - 1, cpu->sve_vq_init) &&
-                    test_bit(vq - 1, kvm_supported)) {
-                    break;
-                }
-            }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_andnot(cpu->sve_vq_map, kvm_supported,
-                          cpu->sve_vq_init, max_vq);
-            if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "Disabling sve%d results in all "
-                                  "vector lengths being disabled.\n",
-                                  vq * 128);
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
-        } else if (tcg_enabled()) {
-            /* Disabling a power-of-two disables all larger lengths. */
-            if (test_bit(0, cpu->sve_vq_init)) {
-                error_setg(errp, "cannot disable sve128");
-                error_append_hint(errp, "Disabling sve128 results in all "
-                                  "vector lengths being disabled.\n");
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
-            for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
-                if (test_bit(vq - 1, cpu->sve_vq_init)) {
-                    break;
-                }
-            }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_complement(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
-        }
-
-        max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
-    }
-
-    /*
-     * Process the sve-max-vq property.
-     * Note that we know from the above that no bit above
-     * sve-max-vq is currently set.
-     */
-    if (cpu->sve_max_vq != 0) {
-        max_vq = cpu->sve_max_vq;
-
-        if (!test_bit(max_vq - 1, cpu->sve_vq_map) &&
-            test_bit(max_vq - 1, cpu->sve_vq_init)) {
-            error_setg(errp, "cannot disable sve%d", max_vq * 128);
-            error_append_hint(errp, "The maximum vector length must be "
-                              "enabled, sve-max-vq=%d (%d bits)\n",
-                              max_vq, max_vq * 128);
-            return;
-        }
-
-        /* Set all bits not explicitly set within sve-max-vq. */
-        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
-        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
-    }
-
-    /*
-     * We should know what max-vq is now.  Also, as we're done
-     * manipulating sve-vq-map, we ensure any bits above max-vq
-     * are clear, just in case anybody looks.
-     */
-    assert(max_vq != 0);
-    bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
-
-    if (kvm_enabled()) {
-        /* Ensure the set of lengths matches what KVM supports. */
-        bitmap_xor(tmp, cpu->sve_vq_map, kvm_supported, max_vq);
-        if (!bitmap_empty(tmp, max_vq)) {
-            vq = find_last_bit(tmp, max_vq) + 1;
-            if (test_bit(vq - 1, cpu->sve_vq_map)) {
-                if (cpu->sve_max_vq) {
-                    error_setg(errp, "cannot set sve-max-vq=%d",
-                               cpu->sve_max_vq);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                    error_append_hint(errp, "It may not be possible to use "
-                                      "sve-max-vq with this KVM host. Try "
-                                      "using only sve<N> properties.\n");
-                } else {
-                    error_setg(errp, "cannot enable sve%d", vq * 128);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                }
-            } else {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "The KVM host requires all "
-                                  "supported vector lengths smaller "
-                                  "than %d bits to also be enabled.\n",
-                                  max_vq * 128);
-            }
-            return;
-        }
-    } else if (tcg_enabled()) {
-        /* Ensure all required powers-of-two are enabled. */
-        for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-            if (!test_bit(vq - 1, cpu->sve_vq_map)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "sve%d is required as it "
-                                  "is a power-of-two length smaller than "
-                                  "the maximum, sve%d\n",
-                                  vq * 128, max_vq * 128);
-                return;
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
-}
-
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
-    if (kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot set sve-max-vq");
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
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
-/*
- * Note that cpu_arm_get/set_sve_vq cannot use the simpler
- * object_property_add_bool interface because they make use
- * of the contents of "name" to determine which bit on which
- * to operate.
- */
-static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq = atoi(&name[3]) / 128;
-    bool value;
-
-    /* All vector lengths are disabled when SVE is off. */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        value = false;
-    } else {
-        value = test_bit(vq - 1, cpu->sve_vq_map);
-    }
-    visit_type_bool(v, name, &value, errp);
-}
-
-static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq = atoi(&name[3]) / 128;
-    bool value;
-
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot enable %s", name);
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
-    if (value) {
-        set_bit(vq - 1, cpu->sve_vq_map);
-    } else {
-        clear_bit(vq - 1, cpu->sve_vq_map);
-    }
-    set_bit(vq - 1, cpu->sve_vq_init);
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
-void aarch64_add_sve_properties(Object *obj)
-{
-    uint32_t vq;
-
-    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
-
-    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-        char name[8];
-        sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                            cpu_arm_set_sve_vq, NULL, NULL);
-    }
-}
-
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
     int arch_val = 0, impdef_val = 0;
@@ -762,9 +438,8 @@ static void aarch64_max_initfn(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
     }
 
-    aarch64_add_sve_properties(obj);
-    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
-                        cpu_max_set_sve_max_vq, NULL, NULL);
+    cpu_sve_add_props(obj);
+    cpu_sve_add_props_max(obj);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index 9f65010c0c..09aede9319 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
+#include "cpu-sve.h"
 #include "hw/core/accel-cpu.h"
 #include "qapi/error.h"
 
@@ -88,7 +89,7 @@ static void host_cpu_instance_init(Object *obj)
 
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
+        cpu_sve_add_props(obj);
     }
     arm_cpu_post_init(obj);
 }
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 448e94861f..bad5a659a7 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,6 +13,7 @@ arm_ss.add(zlib)
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
+  'cpu-sve.c',
   'gdbstub64.c',
 ))
 
-- 
2.26.2


