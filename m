Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4760E541
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 18:09:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oniuT-0003Oh-34; Wed, 26 Oct 2022 12:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oniuD-00033h-Kn
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oniuB-0003RL-KM
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666800322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t63IJHsIpf1oOdLiq5BWrhLFoaUWAMyncclMuRIiCHQ=;
 b=TPyW0p67EfhpXv0rWR5HWx+F6xvA0+atfANB5nCNpi58EgAB0h0EE2QN4HmHiqnF0st3A2
 25dRg31TPqEmq701vP3+9OdvbL9ZA49ifZEIK3Hgkg+ccz0Sl0Kh8h+zumMiLsfr2JhwcK
 Qzk1wgD1MbiodIx8yLHKR6oZp6sSfdI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-nedqSc_uNgKG6_dsoslCUw-1; Wed, 26 Oct 2022 12:05:19 -0400
X-MC-Unique: nedqSc_uNgKG6_dsoslCUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1245829DD9A5;
 Wed, 26 Oct 2022 16:05:19 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03E5AC15BAB;
 Wed, 26 Oct 2022 16:05:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 1/2] arm/kvm: add support for MTE
Date: Wed, 26 Oct 2022 18:05:10 +0200
Message-Id: <20221026160511.37162-2-cohuck@redhat.com>
In-Reply-To: <20221026160511.37162-1-cohuck@redhat.com>
References: <20221026160511.37162-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce a new cpu feature flag to control MTE support. To preserve
backwards compatibility for tcg, MTE will continue to be enabled as
long as tag memory has been provided.

If MTE has been enabled, we need to disable migration, as we do not
yet have a way to migrate the tags as well. Therefore, MTE will stay
off with KVM unless requested explicitly.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/system/arm/cpu-features.rst |  21 +++++
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  12 +++
 target/arm/monitor.c             |   1 +
 8 files changed, 180 insertions(+), 12 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index c2c01ec7d265..9e35b70138d0 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
 than the maximum vector length enabled, the actual vector length will
 be reduced.  If this property is set to ``-1`` then the default vector
 length is set to the maximum possible length.
+
+MTE CPU Property
+================
+
+The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
+presence of tag memory (which can be turned on for the ``virt`` machine via
+``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
+proper migration support is implemented, enabling MTE will install a migration
+blocker.
+
+If not specified explicitly via ``on`` or ``off``, MTE will be available
+according to the following rules:
+
+* When TCG is used, MTE will be available iff tag memory is available; i.e. it
+  preserves the behaviour prior to introduction of the feature.
+
+* When KVM is used, MTE will default to off, so that migration will not
+  unintentionally be blocked.
+
+* Other accelerators currently don't support MTE.
+
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 94ca6f163f78..2425473e1ced 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1479,6 +1479,11 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+        arm_cpu_mte_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 #endif
 
@@ -1555,7 +1560,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
         if (cpu->tag_memory) {
             error_setg(errp,
-                       "Cannot enable %s when guest CPUs has MTE enabled",
+                       "Cannot enable %s when guest CPUs has tag memory enabled",
                        current_accel_name());
             return;
         }
@@ -1934,17 +1939,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                        ID_PFR1, VIRTUALIZATION, 0);
     }
 
-#ifndef CONFIG_USER_ONLY
-    if (cpu->tag_memory == NULL && cpu_isar_feature(aa64_mte, cpu)) {
-        /*
-         * Disable the MTE feature bits if we do not have tag-memory
-         * provided by the machine.
-         */
-        cpu->isar.id_aa64pfr1 =
-            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
-    }
-#endif
-
     if (tcg_enabled()) {
         /*
          * Don't report the Statistical Profiling Extension in the ID
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e3dbef5be865..53d1efdf9a76 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1027,6 +1027,7 @@ struct ArchCPU {
     bool prop_pauth;
     bool prop_pauth_impdef;
     bool prop_lpa2;
+    OnOffAuto prop_mte;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85e0d1daf1c7..c81cf8932407 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -35,6 +35,13 @@
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 #include "internals.h"
+#include "migration/blocker.h"
+#include "qapi/qapi-visit-common.h"
+#include "hw/arm/virt.h"
+
+#ifdef CONFIG_KVM
+static Error *mte_migration_blocker;
+#endif
 
 static void aarch64_a35_initfn(Object *obj)
 {
@@ -1034,6 +1041,130 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x410c3000;
 }
 
+static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    OnOffAuto mte = cpu->prop_mte;
+
+    visit_type_OnOffAuto(v, name, &mte, errp);
+}
+
+static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp);
+
+}
+
+static void aarch64_add_mte_properties(Object *obj)
+{
+    /*
+     * For tcg, "AUTO" means turn on mte if tag memory has been provided, and
+     * turn it off (without error) if not.
+     * For kvm, "AUTO" currently means mte off, as migration is not supported
+     * yet.
+     * For all others, "AUTO" means mte off.
+     */
+    object_property_add(obj, "mte", "OnOffAuto", aarch64_cpu_get_mte,
+                        aarch64_cpu_set_mte, NULL, NULL);
+}
+
+static inline bool arm_machine_has_tag_memory(void)
+{
+#ifndef CONFIG_USER_ONLY
+    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
+
+    /* so far, only the virt machine has support for tag memory */
+    if (obj) {
+        VirtMachineState *vms = VIRT_MACHINE(obj);
+
+        return vms->mte;
+    }
+#endif
+    return false;
+}
+
+void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
+{
+    bool enable_mte;
+
+    switch (cpu->prop_mte) {
+    case ON_OFF_AUTO_OFF:
+        enable_mte = false;
+        break;
+    case ON_OFF_AUTO_ON:
+        if (!kvm_enabled()) {
+            if (cpu_isar_feature(aa64_mte, cpu)) {
+                if (!arm_machine_has_tag_memory()) {
+                    error_setg(errp, "mte=on requires tag memory");
+                    return;
+                }
+            } else {
+                error_setg(errp, "mte not provided");
+                return;
+            }
+        }
+#ifdef CONFIG_KVM
+        if (kvm_enabled() && !kvm_arm_mte_supported()) {
+            error_setg(errp, "mte not supported by kvm");
+            return;
+        }
+#endif
+        enable_mte = true;
+        break;
+    default: /* AUTO */
+        if (!kvm_enabled()) {
+            if (cpu_isar_feature(aa64_mte, cpu)) {
+                /*
+                 * Tie mte enablement to presence of tag memory, in order to
+                 * preserve pre-existing behaviour.
+                 */
+                enable_mte = arm_machine_has_tag_memory();
+            } else {
+                enable_mte = false;
+            }
+            break;
+        } else {
+            /*
+             * This cannot yet be
+             * enable_mte = kvm_arm_mte_supported();
+             * as we don't support migration yet.
+             */
+            enable_mte = false;
+        }
+    }
+
+    if (!enable_mte) {
+        /* Disable MTE feature bits. */
+        cpu->isar.id_aa64pfr1 =
+            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
+        return;
+    }
+
+    /* accelerator-specific enablement */
+    if (kvm_enabled()) {
+#ifdef CONFIG_KVM
+        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
+            error_setg(errp, "Failed to enable KVM_CAP_ARM_MTE");
+        } else {
+            /* TODO: add proper migration support with MTE enabled */
+            if (!mte_migration_blocker) {
+                error_setg(&mte_migration_blocker,
+                           "Live migration disabled due to MTE enabled");
+                if (migrate_add_blocker(mte_migration_blocker, NULL)) {
+                    error_setg(errp, "Failed to add MTE migration blocker");
+                    error_free(mte_migration_blocker);
+                    mte_migration_blocker = NULL;
+                }
+            }
+        }
+#endif
+    }
+}
+
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -1042,6 +1173,7 @@ static void aarch64_host_initfn(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
+        aarch64_add_mte_properties(obj);
     }
 #elif defined(CONFIG_HVF)
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1235,6 +1367,7 @@ static void aarch64_max_initfn(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
+    aarch64_add_mte_properties(obj);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9566364dcaed..e5d46e9e3935 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1313,6 +1313,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12f7..b777bd0a11d2 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -764,6 +764,11 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_mte_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_MTE);
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 uint32_t kvm_arm_sve_get_vls(CPUState *cs)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635ce4..762443f8a7c0 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -305,6 +305,13 @@ bool kvm_arm_pmu_supported(void);
  */
 bool kvm_arm_sve_supported(void);
 
+/**
+ * kvm_arm_mte_supported:
+ *
+ * Returns: true if KVM can enable MTE, and false otherwise.
+ */
+bool kvm_arm_mte_supported(void);
+
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
@@ -395,6 +402,11 @@ static inline bool kvm_arm_steal_time_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_mte_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa3556d..f13ff2664b67 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -96,6 +96,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
     "pauth", "pauth-impdef",
+    "mte",
     NULL
 };
 
-- 
2.37.3


