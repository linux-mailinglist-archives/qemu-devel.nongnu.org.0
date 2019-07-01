Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643B4ED54
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 18:43:36 +0200 (CEST)
Received: from localhost ([::1]:36760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heMdT-0007Yd-7v
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 12:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44487)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1heMVH-0001Um-MZ
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1heMVF-0001Gh-MU
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1heMV3-0000Ac-MA; Fri, 21 Jun 2019 12:34:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F496C18B2FA;
 Fri, 21 Jun 2019 16:34:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D07041001DF3;
 Fri, 21 Jun 2019 16:34:34 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 21 Jun 2019 18:34:10 +0200
Message-Id: <20190621163422.6127-3-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 21 Jun 2019 16:34:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 02/14] target/arm/cpu: Ensure we can use the
 pmu with kvm
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

We first convert the pmu property from a static property to one with
its own accessors. Then we use the set accessor to check if the PMU is
supported when using KVM. Indeed a 32-bit KVM host does not support
the PMU, so this check will catch an attempt to use it at property-set
time.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c     | 30 +++++++++++++++++++++++++-----
 target/arm/kvm.c     |  9 +++++++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 3 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 376db154f008..858f668d226e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -759,10 +759,6 @@ static Property arm_cpu_has_el3_property =3D
 static Property arm_cpu_cfgend_property =3D
             DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
=20
-/* use property name "pmu" to match other archs and virt tools */
-static Property arm_cpu_has_pmu_property =3D
-            DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
-
 static Property arm_cpu_has_vfp_property =3D
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
=20
@@ -785,6 +781,29 @@ static Property arm_cpu_pmsav7_dregion_property =3D
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
=20
+static bool arm_get_pmu(Object *obj, Error **errp)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    return cpu->has_pmu;
+}
+
+static void arm_set_pmu(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    if (value) {
+        if (kvm_enabled() && !kvm_arm_pmu_supported(CPU(cpu))) {
+            error_setg(errp, "'pmu' feature not supported by KVM on this=
 host");
+            return;
+        }
+        set_feature(&cpu->env, ARM_FEATURE_PMU);
+    } else {
+        unset_feature(&cpu->env, ARM_FEATURE_PMU);
+    }
+    cpu->has_pmu =3D value;
+}
+
 static void arm_get_init_svtor(Object *obj, Visitor *v, const char *name=
,
                                void *opaque, Error **errp)
 {
@@ -859,7 +878,8 @@ void arm_cpu_post_init(Object *obj)
     }
=20
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
+        cpu->has_pmu =3D true;
+        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu,
                                  &error_abort);
     }
=20
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index fe4f461d4ef6..69c961a4c62c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -162,6 +162,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features =3D arm_host_cpu_features.features;
 }
=20
+bool kvm_arm_pmu_supported(CPUState *cpu)
+{
+    KVMState *s =3D KVM_STATE(current_machine->accelerator);
+    int ret;
+
+    ret =3D kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
+    return ret > 0;
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     KVMState *s =3D KVM_STATE(ms->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 812125f805a1..e0ded3607996 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -216,6 +216,14 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)=
;
  */
 bool kvm_arm_aarch32_supported(CPUState *cs);
=20
+/**
+ * bool kvm_arm_pmu_supported:
+ * @cs: CPUState
+ *
+ * Returns true if the KVM VCPU can enable its PMU and false otherwise.
+ */
+bool kvm_arm_pmu_supported(CPUState *cs);
+
 /**
  * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
  * IPA address space supported by KVM
@@ -261,6 +269,11 @@ static inline bool kvm_arm_aarch32_supported(CPUStat=
e *cs)
     return false;
 }
=20
+static inline bool kvm_arm_pmu_supported(CPUState *cs)
+{
+    return false;
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     return -ENOENT;
--=20
2.20.1


