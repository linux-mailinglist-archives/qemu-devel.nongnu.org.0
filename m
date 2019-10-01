Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77989C3540
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 15:12:58 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFHxZ-0002eN-Dp
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 09:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iFHkU-0006sp-G8
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iFHkS-0005xx-SK
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:59:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iFHkK-0005j8-AL; Tue, 01 Oct 2019 08:59:16 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 771CE1057867;
 Tue,  1 Oct 2019 12:59:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C33E46;
 Tue,  1 Oct 2019 12:59:13 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v5 6/9] target/arm/kvm64: max cpu: Enable SVE when available
Date: Tue,  1 Oct 2019 14:58:42 +0200
Message-Id: <20191001125845.8793-7-drjones@redhat.com>
In-Reply-To: <20191001125845.8793-1-drjones@redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 01 Oct 2019 12:59:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, armbru@redhat.com,
 eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable SVE in the KVM guest when the 'max' cpu type is configured
and KVM supports it. KVM SVE requires use of the new finalize
vcpu ioctl, so we add that now too. For starters SVE can only be
turned on or off, getting all vector lengths the host CPU supports
when on. We'll add the other SVE CPU properties in later patches.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu64.c       | 17 ++++++++++++++---
 target/arm/kvm.c         |  5 +++++
 target/arm/kvm64.c       | 20 +++++++++++++++++++-
 target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
 tests/arm-cpu-features.c |  1 +
 5 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 34b0ba2cf6f7..a771a28daa56 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -493,6 +493,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v,=
 const char *name,
         return;
     }
=20
+    if (value && kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
+        error_setg(errp, "'sve' feature not supported by KVM on this hos=
t");
+        return;
+    }
+
     t =3D cpu->isar.id_aa64pfr0;
     t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
     cpu->isar.id_aa64pfr0 =3D t;
@@ -507,11 +512,16 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
     uint32_t vq;
+    uint64_t t;
=20
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        if (kvm_arm_sve_supported(CPU(cpu))) {
+            t =3D cpu->isar.id_aa64pfr0;
+            t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+            cpu->isar.id_aa64pfr0 =3D t;
+        }
     } else {
-        uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
=20
@@ -612,8 +622,6 @@ static void aarch64_max_initfn(Object *obj)
=20
         object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve=
_max_vq,
                             cpu_max_set_sve_max_vq, NULL, NULL, &error_f=
atal);
-        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
=20
         for (vq =3D 1; vq <=3D ARM_MAX_VQ; ++vq) {
             char name[8];
@@ -622,6 +630,9 @@ static void aarch64_max_initfn(Object *obj)
                                 cpu_arm_set_sve_vq, NULL, NULL, &error_f=
atal);
         }
     }
+
+    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
 }
=20
 struct ARMCPUInfo {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b2eaa50b8df9..72569f71236e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -51,6 +51,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
 }
=20
+int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
+{
+    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
+}
+
 void kvm_arm_init_serror_injection(CPUState *cs)
 {
     cap_has_inject_serror_esr =3D kvm_check_extension(cs->kvm_state,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4c0b11d105a4..850da1b5e6aa 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -602,6 +602,13 @@ bool kvm_arm_aarch32_supported(CPUState *cpu)
     return kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
 }
=20
+bool kvm_arm_sve_supported(CPUState *cpu)
+{
+    KVMState *s =3D KVM_STATE(current_machine->accelerator);
+
+    return kvm_check_extension(s, KVM_CAP_ARM_SVE);
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
=20
 int kvm_arch_init_vcpu(CPUState *cs)
@@ -630,13 +637,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
     if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-            cpu->has_pmu =3D false;
+        cpu->has_pmu =3D false;
     }
     if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_PMU_V3;
     } else {
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        assert(kvm_arm_sve_supported(cs));
+        cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_SVE;
+    }
=20
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret =3D kvm_arm_vcpu_init(cs);
@@ -644,6 +655,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
=20
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret =3D kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
+        if (ret) {
+            return ret;
+        }
+    }
+
     /*
      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
      * Currently KVM has its own idea about MPIDR assignment, so we
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b3106c8600af..1151877f97ea 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -27,6 +27,20 @@
  */
 int kvm_arm_vcpu_init(CPUState *cs);
=20
+/**
+ * kvm_arm_vcpu_finalize
+ * @cs: CPUState
+ * @feature: int
+ *
+ * Finalizes the configuration of the specified VCPU feature by
+ * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
+ * this are documented in the "KVM_ARM_VCPU_FINALIZE" section of
+ * KVM's API documentation.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
+
 /**
  * kvm_arm_register_device:
  * @mr: memory region for this device
@@ -225,6 +239,14 @@ bool kvm_arm_aarch32_supported(CPUState *cs);
  */
 bool kvm_arm_pmu_supported(CPUState *cs);
=20
+/**
+ * bool kvm_arm_sve_supported:
+ * @cs: CPUState
+ *
+ * Returns true if the KVM VCPU can enable SVE and false otherwise.
+ */
+bool kvm_arm_sve_supported(CPUState *cs);
+
 /**
  * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
  * IPA address space supported by KVM
@@ -275,6 +297,11 @@ static inline bool kvm_arm_pmu_supported(CPUState *c=
s)
     return false;
 }
=20
+static inline bool kvm_arm_sve_supported(CPUState *cs)
+{
+    return false;
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     return -ENOENT;
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 0190148260dc..3c8ed85b5adb 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -391,6 +391,7 @@ static void test_query_cpu_model_expansion_kvm(const =
void *data)
=20
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature(qts, "host", "aarch64");
+        assert_has_feature(qts, "max", "sve");
=20
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
--=20
2.20.1


