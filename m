Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ECB4ED34
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 18:39:41 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heMZf-0004Zk-5X
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 12:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1heMVH-0001Uo-M6
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1heMVF-0001GO-Kk
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1heMUz-0008U6-P5; Fri, 21 Jun 2019 12:34:51 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A714930C584D;
 Fri, 21 Jun 2019 16:34:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3D91001DC7;
 Fri, 21 Jun 2019 16:34:30 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 21 Jun 2019 18:34:09 +0200
Message-Id: <20190621163422.6127-2-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 21 Jun 2019 16:34:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 01/14] target/arm/cpu64: Ensure kvm really
 supports aarch64=off
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

If -cpu <cpu>,aarch64=3Doff is used then KVM must also be used, and it
and the host must support running the vcpu in 32-bit mode. Also, if
-cpu <cpu>,aarch64=3Don is used, then it doesn't matter if kvm is
enabled or not.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c   | 12 ++++++------
 target/arm/kvm64.c   | 11 +++++++++++
 target/arm/kvm_arm.h | 14 ++++++++++++++
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1901997a0645..946994838d8a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -407,13 +407,13 @@ static void aarch64_cpu_set_aarch64(Object *obj, bo=
ol value, Error **errp)
      * restriction allows us to avoid fixing up functionality that assum=
es a
      * uniform execution state like do_interrupt.
      */
-    if (!kvm_enabled()) {
-        error_setg(errp, "'aarch64' feature cannot be disabled "
-                         "unless KVM is enabled");
-        return;
-    }
-
     if (value =3D=3D false) {
+        if (!kvm_enabled() || !kvm_arm_aarch32_supported(CPU(cpu))) {
+            error_setg(errp, "'aarch64' feature cannot be disabled "
+                             "unless KVM is enabled and 32-bit EL1 "
+                             "is supported");
+            return;
+        }
         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
     } else {
         set_feature(&cpu->env, ARM_FEATURE_AARCH64);
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 22d19c9aec6f..45ccda589903 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -24,7 +24,9 @@
 #include "exec/gdbstub.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
 #include "kvm_arm.h"
+#include "hw/boards.h"
 #include "internals.h"
=20
 static bool have_guest_debug;
@@ -593,6 +595,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf)
     return true;
 }
=20
+bool kvm_arm_aarch32_supported(CPUState *cpu)
+{
+    KVMState *s =3D KVM_STATE(current_machine->accelerator);
+    int ret;
+
+    ret =3D kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
+    return ret > 0;
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
=20
 int kvm_arch_init_vcpu(CPUState *cs)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2a07333c615f..812125f805a1 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -207,6 +207,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
=20
+/**
+ * kvm_arm_aarch32_supported:
+ * @cs: CPUState
+ *
+ * Returns true if the KVM VCPU can enable AArch32 mode and false
+ * otherwise.
+ */
+bool kvm_arm_aarch32_supported(CPUState *cs);
+
 /**
  * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
  * IPA address space supported by KVM
@@ -247,6 +256,11 @@ static inline void kvm_arm_set_cpu_features_from_hos=
t(ARMCPU *cpu)
     cpu->host_cpu_probe_failed =3D true;
 }
=20
+static inline bool kvm_arm_aarch32_supported(CPUState *cs)
+{
+    return false;
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     return -ENOENT;
--=20
2.20.1


