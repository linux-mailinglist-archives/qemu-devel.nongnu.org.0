Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76702524DFD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 15:14:17 +0200 (CEST)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np8e0-0004aN-Cx
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 09:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1np8bq-0001jL-Jm
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:12:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1np8bo-0004oT-KI
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652361120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9QzHOYviTr+OO0iuFKFM8CRDc6/CGD4m0dOzezLDt4=;
 b=N1qAcq13GAB54ES9wQLqFIe3wdASTjb7TqjGlNQGcVIUdvl51ad2soZK66EGDugm2ekYRm
 x9n6DyQZmDtxcHUuQ6kUCiT+dvtFH8ACyvO0E9dEK2fVPzIUsLklOoBz9Y4d/McEm6SbDL
 ruS+pzzsaHUSQRegApThl2vCVtuTECk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-nKi-JwR8Pj6g457j47Az9w-1; Thu, 12 May 2022 09:11:55 -0400
X-MC-Unique: nKi-JwR8Pj6g457j47Az9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32658811E84;
 Thu, 12 May 2022 13:11:55 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A27553CF;
 Thu, 12 May 2022 13:11:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC 1/2] arm/kvm: enable MTE if available
Date: Thu, 12 May 2022 15:11:45 +0200
Message-Id: <20220512131146.78457-2-cohuck@redhat.com>
In-Reply-To: <20220512131146.78457-1-cohuck@redhat.com>
References: <20220512131146.78457-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We need to disable migration, as we do not yet have a way to migrate
the tags as well.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu.c     | 18 ++++------
 target/arm/cpu.h     |  4 +++
 target/arm/cpu64.c   | 78 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c   |  5 +++
 target/arm/kvm_arm.h | 12 +++++++
 target/arm/monitor.c |  1 +
 6 files changed, 106 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 029f644768b1..f0505815b1e7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1435,6 +1435,11 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+        arm_cpu_mte_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
     if (kvm_enabled()) {
@@ -1504,7 +1509,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
         if (cpu->tag_memory) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPUs has MTE enabled");
+                       "Cannot enable KVM when guest CPUs has tag memory enabled");
             return;
         }
     }
@@ -1882,17 +1887,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
      * to false or by setting pmsav7-dregion to 0.
      */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 18ca61e8e25b..183506713e96 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -208,11 +208,13 @@ typedef struct {
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
 static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -993,6 +995,7 @@ struct ArchCPU {
     bool prop_pauth;
     bool prop_pauth_impdef;
     bool prop_lpa2;
+    bool prop_mte;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
@@ -1091,6 +1094,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
+void aarch64_add_mte_properties(Object *obj);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 04427e073f17..eea9ad195470 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -35,7 +35,11 @@
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 #include "internals.h"
+#include "migration/blocker.h"
 
+#ifdef CONFIG_KVM
+static Error *mte_migration_blocker;
+#endif
 
 static void aarch64_a57_initfn(Object *obj)
 {
@@ -785,6 +789,78 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     cpu->isar.id_aa64mmfr0 = t;
 }
 
+static Property arm_cpu_mte_property =
+    DEFINE_PROP_BOOL("mte", ARMCPU, prop_mte, true);
+
+void aarch64_add_mte_properties(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    /*
+     * For tcg, the machine type may provide tag memory for MTE emulation.
+     * We do not know whether that is the case at this point in time, so
+     * default MTE to on and check later.
+     * This preserves pre-existing behaviour, but is really a bit awkward.
+     */
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_mte_property);
+    if (kvm_enabled()) {
+        /*
+         * Default MTE to off, as long as migration support is not
+         * yet implemented.
+         * TODO: implement migration support for kvm
+         */
+        cpu->prop_mte = false;
+    }
+}
+
+void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
+{
+    if (!cpu->prop_mte) {
+        /* Disable MTE feature bits. */
+        cpu->isar.id_aa64pfr1 =
+            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
+        return;
+    }
+#ifndef CONFIG_USER_ONLY
+    if (!kvm_enabled()) {
+        if (cpu_isar_feature(aa64_mte, cpu) && !cpu->tag_memory) {
+            /*
+             * Disable the MTE feature bits, unless we have tag-memory
+             * provided by the machine.
+             * This silent downgrade is not really nice if the user had
+             * explicitly requested MTE to be enabled by the cpu, but it
+             * preserves pre-existing behaviour. In an ideal world, we
+             * would fail if MTE was requested, but no tag memory has
+             * been provided.
+             */
+            cpu->isar.id_aa64pfr1 =
+                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
+        }
+        if (!cpu_isar_feature(aa64_mte, cpu)) {
+            cpu->prop_mte = false;
+        }
+        return;
+    }
+    if (kvm_arm_mte_supported()) {
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
+                }
+            }
+        }
+#endif
+    }
+    /* When HVF provides support for MTE, add it here */
+#endif
+}
+
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -793,6 +869,7 @@ static void aarch64_host_initfn(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
+        aarch64_add_mte_properties(obj);
     }
 #elif defined(CONFIG_HVF)
     ARMCPU *cpu = ARM_CPU(obj);
@@ -958,6 +1035,7 @@ static void aarch64_max_initfn(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
+    aarch64_add_mte_properties(obj);
 }
 
 static void aarch64_a64fx_initfn(Object *obj)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index b8cfaf5782ac..d129a264a3f6 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -746,6 +746,11 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_mte_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_MTE);
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b7f78b521545..13f06ed5e0ea 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -306,6 +306,13 @@ bool kvm_arm_pmu_supported(void);
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
@@ -396,6 +403,11 @@ static inline bool kvm_arm_steal_time_supported(void)
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
2.34.3


