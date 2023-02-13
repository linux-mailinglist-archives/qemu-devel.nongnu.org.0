Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C9693B6C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 01:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRMtQ-0000AS-Q5; Sun, 12 Feb 2023 19:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtN-00009G-6A
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtL-0003K6-7W
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcOL1H5G2Cy942ZvmrgRVKBMqDA5YQeeIuS/uJMngy8=;
 b=ENXxF0UWBOm39OZViumffuEOGtrD6/F0R+mendgDrVImdTmWawF9B8Nt9DPXb88yfG+auf
 BKSCpJCnlJop/n66grttYn8z+weX4O8BeEoPeqj/pgC9QuQDXMRgPcuQGZ9gi/JiK4Bok9
 x7G0sogwY1UUJ3fqWVhaavYODlwFq2g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-gZW5A4BjN-GuABBKF6qyBA-1; Sun, 12 Feb 2023 19:40:19 -0500
X-MC-Unique: gZW5A4BjN-GuABBKF6qyBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9832D3C0256D;
 Mon, 13 Feb 2023 00:40:18 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D51340B3FE1;
 Mon, 13 Feb 2023 00:40:12 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
Date: Mon, 13 Feb 2023 08:39:24 +0800
Message-Id: <20230213003925.40158-6-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-1-gshan@redhat.com>
References: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When KVM device "kvm-arm-gicv3" or "arm-its-kvm" is used, we have to
enable the backup bitmap for the dirty ring. Otherwise, the migration
will fail because those two devices are using the backup bitmap to track
dirty guest memory, corresponding to various hardware tables.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 hw/arm/virt.c        | 26 ++++++++++++++++++++++++++
 target/arm/kvm64.c   | 25 +++++++++++++++++++++++++
 target/arm/kvm_arm.h | 12 ++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 75f28947de..ea9bd98a65 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2024,6 +2024,8 @@ static void machvirt_init(MachineState *machine)
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus;
+    const char *gictype = NULL;
+    const char *itsclass = NULL;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     MemoryRegion *tag_sysmem = NULL;
@@ -2071,6 +2073,30 @@ static void machvirt_init(MachineState *machine)
      */
     finalize_gic_version(vms);
 
+    /*
+     * When "kvm-arm-gicv3" or "arm-its-kvm" is used, the backup dirty
+     * bitmap has to be enabled for KVM dirty ring, before any memory
+     * slot is added. Otherwise, the migration will fail with the dirty
+     * ring.
+     */
+    if (kvm_enabled()) {
+        if (vms->gic_version != VIRT_GIC_VERSION_2) {
+            gictype = gicv3_class_name();
+        }
+
+        if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
+            itsclass = its_class_name();
+        }
+
+        if (((gictype && !strcmp(gictype, "kvm-arm-gicv3")) ||
+             (itsclass && !strcmp(itsclass, "arm-its-kvm"))) &&
+            !kvm_arm_enable_dirty_ring_with_bitmap()) {
+            error_report("Failed to enable the backup bitmap for "
+                         "KVM dirty ring");
+            exit(1);
+        }
+    }
+
     if (vms->secure) {
         /*
          * The Secure view of the world is the same as the NonSecure,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..91960e1cd3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -764,6 +764,31 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_enable_dirty_ring_with_bitmap(void)
+{
+    int ret;
+
+    /* No need to enable the backup bitmap if dirty ring isn't enabled */
+    if (!kvm_dirty_ring_enabled()) {
+        return true;
+    }
+
+    ret = kvm_check_extension(kvm_state, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP);
+    if (!ret) {
+        return false;
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP,
+                            0, 1);
+    if (ret) {
+        return false;
+    }
+
+    kvm_state->kvm_dirty_ring_with_bitmap = true;
+
+    return true;
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 uint32_t kvm_arm_sve_get_vls(CPUState *cs)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..402281e61a 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -282,6 +282,13 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
  */
 bool kvm_arm_steal_time_supported(void);
 
+/**
+ * kvm_arm_enable_dirty_ring_with_bitmap:
+ * Returns: true if KVM dirty ring's backup bitmap is enabled
+ * and false otherwise.
+ */
+bool kvm_arm_enable_dirty_ring_with_bitmap(void);
+
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -395,6 +402,11 @@ static inline bool kvm_arm_steal_time_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_enable_dirty_ring_with_bitmap(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
-- 
2.23.0


