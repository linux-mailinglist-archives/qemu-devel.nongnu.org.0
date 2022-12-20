Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BBF652996
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 00:06:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7lfq-0000PW-8Y; Tue, 20 Dec 2022 18:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7lem-0008Lj-AH; Tue, 20 Dec 2022 18:04:23 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7lej-0007cL-WA; Tue, 20 Dec 2022 18:04:20 -0500
Received: from localhost.localdomain
 (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
 by csgraf.de (Postfix) with ESMTPSA id C569460802FA;
 Wed, 21 Dec 2022 00:04:15 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/2] hw/arm/virt: Consolidate GIC finalize logic
Date: Wed, 21 Dec 2022 00:04:13 +0100
Message-Id: <20221220230414.47876-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221220230414.47876-1-agraf@csgraf.de>
References: <20221220230414.47876-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Up to now, the finalize_gic_version() code open coded what is essentially
a support bitmap match between host/emulation environment and desired
target GIC type.

This open coding leads to undesirable side effects. For example, a VM with
KVM and -smp 10 will automatically choose GICv3 while the same command
line with TCG will stay on GICv2 and fail the launch.

This patch combines the TCG and KVM matching code paths by making
everything a 2 pass process. First, we determine which GIC versions the
current environment is able to support, then we go through a single
state machine to determine which target GIC mode that means for us.

After this patch, the only user noticable changes should be consolidated
error messages as well as TCG -M virt supporting -smp > 8 automatically.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/arm/virt.c         | 198 ++++++++++++++++++++++--------------------
 include/hw/arm/virt.h |  12 +--
 2 files changed, 108 insertions(+), 102 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 04eb6c201d..c79f5b6a66 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1820,6 +1820,84 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     }
 }
 
+static VirtGICType finalize_gic_version_do(const char *accel_name,
+                                           VirtGICType gic_version,
+                                           int gics_supported,
+                                           unsigned int max_cpus)
+{
+    /* Convert host/max/nosel to GIC version number */
+    switch (gic_version) {
+    case VIRT_GIC_VERSION_HOST:
+        if (kvm_enabled()) {
+            /* For KVM, -cpu host means -cpu max */
+            return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
+                                           gics_supported, max_cpus);
+        }
+
+        error_report("gic-version=host requires KVM");
+        exit(1);
+        break;
+    case VIRT_GIC_VERSION_MAX:
+        if (gics_supported & VIRT_GIC_VERSION_4) {
+            gic_version = VIRT_GIC_VERSION_4;
+        } else if (gics_supported & VIRT_GIC_VERSION_3) {
+            gic_version = VIRT_GIC_VERSION_3;
+        } else {
+            gic_version = VIRT_GIC_VERSION_2;
+        }
+        break;
+    case VIRT_GIC_VERSION_NOSEL:
+        if ((gics_supported & VIRT_GIC_VERSION_2) && max_cpus <= GIC_NCPU) {
+            gic_version = VIRT_GIC_VERSION_2;
+        } else if (gics_supported & VIRT_GIC_VERSION_3) {
+            /*
+             * in case the host does not support v2 emulation or
+             * the end-user requested more than 8 VCPUs we now default
+             * to v3. In any case defaulting to v2 would be broken.
+             */
+            gic_version = VIRT_GIC_VERSION_3;
+        } else if (max_cpus > GIC_NCPU) {
+            error_report("%s only supports GICv2 emulation but more than 8 "
+                         "vcpus are requested", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_2:
+    case VIRT_GIC_VERSION_3:
+    case VIRT_GIC_VERSION_4:
+        break;
+    }
+
+    /* Check chosen version is effectively supported */
+    switch (gic_version) {
+    case VIRT_GIC_VERSION_2:
+        if (!(gics_supported & VIRT_GIC_VERSION_2)) {
+            error_report("%s does not support GICv2 emulation", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_3:
+        if (!(gics_supported & VIRT_GIC_VERSION_3)) {
+            error_report("%s does not support GICv3 emulation", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_4:
+        if (!(gics_supported & VIRT_GIC_VERSION_4)) {
+            error_report("%s does not support GICv4 emulation, is virtualization=on?",
+                         accel_name);
+            exit(1);
+        }
+        break;
+    default:
+        error_report("logic error in finalize_gic_version");
+        exit(1);
+        break;
+    }
+
+    return gic_version;
+}
+
 /*
  * finalize_gic_version - Determines the final gic_version
  * according to the gic-version property
@@ -1828,118 +1906,46 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
  */
 static void finalize_gic_version(VirtMachineState *vms)
 {
+    const char *accel_name = current_accel_name();
     unsigned int max_cpus = MACHINE(vms)->smp.max_cpus;
+    int gics_supported = 0;
 
-    if (kvm_enabled()) {
-        int probe_bitmap;
-
-        if (!kvm_irqchip_in_kernel()) {
-            switch (vms->gic_version) {
-            case VIRT_GIC_VERSION_HOST:
-                warn_report(
-                    "gic-version=host not relevant with kernel-irqchip=off "
-                     "as only userspace GICv2 is supported. Using v2 ...");
-                return;
-            case VIRT_GIC_VERSION_MAX:
-            case VIRT_GIC_VERSION_NOSEL:
-                vms->gic_version = VIRT_GIC_VERSION_2;
-                return;
-            case VIRT_GIC_VERSION_2:
-                return;
-            case VIRT_GIC_VERSION_3:
-                error_report(
-                    "gic-version=3 is not supported with kernel-irqchip=off");
-                exit(1);
-            case VIRT_GIC_VERSION_4:
-                error_report(
-                    "gic-version=4 is not supported with kernel-irqchip=off");
-                exit(1);
-            }
-        }
+    /* Determine which GIC versions the current environment supports */
+    if (kvm_enabled() && kvm_irqchip_in_kernel()) {
+        int probe_bitmap = kvm_arm_vgic_probe();
 
-        probe_bitmap = kvm_arm_vgic_probe();
         if (!probe_bitmap) {
             error_report("Unable to determine GIC version supported by host");
             exit(1);
         }
 
-        switch (vms->gic_version) {
-        case VIRT_GIC_VERSION_HOST:
-        case VIRT_GIC_VERSION_MAX:
-            if (probe_bitmap & KVM_ARM_VGIC_V3) {
-                vms->gic_version = VIRT_GIC_VERSION_3;
-            } else {
-                vms->gic_version = VIRT_GIC_VERSION_2;
-            }
-            return;
-        case VIRT_GIC_VERSION_NOSEL:
-            if ((probe_bitmap & KVM_ARM_VGIC_V2) && max_cpus <= GIC_NCPU) {
-                vms->gic_version = VIRT_GIC_VERSION_2;
-            } else if (probe_bitmap & KVM_ARM_VGIC_V3) {
-                /*
-                 * in case the host does not support v2 in-kernel emulation or
-                 * the end-user requested more than 8 VCPUs we now default
-                 * to v3. In any case defaulting to v2 would be broken.
-                 */
-                vms->gic_version = VIRT_GIC_VERSION_3;
-            } else if (max_cpus > GIC_NCPU) {
-                error_report("host only supports in-kernel GICv2 emulation "
-                             "but more than 8 vcpus are requested");
-                exit(1);
-            }
-            break;
-        case VIRT_GIC_VERSION_2:
-        case VIRT_GIC_VERSION_3:
-            break;
-        case VIRT_GIC_VERSION_4:
-            error_report("gic-version=4 is not supported with KVM");
-            exit(1);
+        if (probe_bitmap & KVM_ARM_VGIC_V2) {
+            gics_supported |= VIRT_GIC_VERSION_2;
         }
-
-        /* Check chosen version is effectively supported by the host */
-        if (vms->gic_version == VIRT_GIC_VERSION_2 &&
-            !(probe_bitmap & KVM_ARM_VGIC_V2)) {
-            error_report("host does not support in-kernel GICv2 emulation");
-            exit(1);
-        } else if (vms->gic_version == VIRT_GIC_VERSION_3 &&
-                   !(probe_bitmap & KVM_ARM_VGIC_V3)) {
-            error_report("host does not support in-kernel GICv3 emulation");
-            exit(1);
+        if (probe_bitmap & KVM_ARM_VGIC_V3) {
+            gics_supported |= VIRT_GIC_VERSION_3;
         }
-        return;
-    }
-
-    /* TCG mode */
-    switch (vms->gic_version) {
-    case VIRT_GIC_VERSION_NOSEL:
-        vms->gic_version = VIRT_GIC_VERSION_2;
-        break;
-    case VIRT_GIC_VERSION_MAX:
+    } else if (kvm_enabled() && !kvm_irqchip_in_kernel()) {
+        /* KVM w/o kernel irqchip can only deal with GICv2 */
+        gics_supported |= VIRT_GIC_VERSION_2;
+        accel_name = "KVM with kernel-irqchip=off";
+    } else {
+        gics_supported |= VIRT_GIC_VERSION_2;
         if (module_object_class_by_name("arm-gicv3")) {
-            /* CONFIG_ARM_GICV3_TCG was set */
+            gics_supported |= VIRT_GIC_VERSION_3;
             if (vms->virt) {
                 /* GICv4 only makes sense if CPU has EL2 */
-                vms->gic_version = VIRT_GIC_VERSION_4;
-            } else {
-                vms->gic_version = VIRT_GIC_VERSION_3;
+                gics_supported |= VIRT_GIC_VERSION_4;
             }
-        } else {
-            vms->gic_version = VIRT_GIC_VERSION_2;
         }
-        break;
-    case VIRT_GIC_VERSION_HOST:
-        error_report("gic-version=host requires KVM");
-        exit(1);
-    case VIRT_GIC_VERSION_4:
-        if (!vms->virt) {
-            error_report("gic-version=4 requires virtualization enabled");
-            exit(1);
-        }
-        break;
-    case VIRT_GIC_VERSION_2:
-    case VIRT_GIC_VERSION_3:
-        break;
     }
+
+    /*
+     * Then convert helpers like host/max to concrete GIC versions and ensure
+     * the desired version is supported
+     */
+    vms->gic_version = finalize_gic_version_do(accel_name, vms->gic_version,
+                                               gics_supported, max_cpus);
 }
 
 /*
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c7dd59d7f1..365d19f7a3 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -109,12 +109,12 @@ typedef enum VirtMSIControllerType {
 } VirtMSIControllerType;
 
 typedef enum VirtGICType {
-    VIRT_GIC_VERSION_MAX,
-    VIRT_GIC_VERSION_HOST,
-    VIRT_GIC_VERSION_2,
-    VIRT_GIC_VERSION_3,
-    VIRT_GIC_VERSION_4,
-    VIRT_GIC_VERSION_NOSEL,
+    VIRT_GIC_VERSION_MAX = 0,
+    VIRT_GIC_VERSION_HOST = 1,
+    VIRT_GIC_VERSION_NOSEL = 2,
+    VIRT_GIC_VERSION_2 = (1 << 2),
+    VIRT_GIC_VERSION_3 = (1 << 3),
+    VIRT_GIC_VERSION_4 = (1 << 4),
 } VirtGICType;
 
 struct VirtMachineClass {
-- 
2.37.1 (Apple Git-137.1)


