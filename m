Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8D689BA6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4g-0006jR-2q; Fri, 03 Feb 2023 09:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4U-0006fR-Mm
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:46 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4M-00055K-T2
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so4005581wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XxpRepMJTovvA+isBKIvWPf2Mb0oogTF5j2Y5fZGMUU=;
 b=YwOWfy6VyhNuaVP/DEUZPqtZJkqhYO3GDZyIov9FheIwMWJJkGSCZkUbIb6gv5TrnB
 FHbtsCZnwVeZZKFtNg/q3sEeR0Y278AEjtqAVHwrIZkAat3XMae/9RU9EjSsQeI+uNQh
 YqaAypzFex6nYULV4Y6TA2A1Uq4Wg8OFxPjW7LAyRlG7hvJFMpyP9EEO1XDrYi/aQ3yz
 HZEbWfRgV5eQdSUPA9JqxWa2wVQPEvpm1UZJ3jcOO93Prm8kZo7G47N+gxUor8l4z7jj
 k998XfpY9J/bYfgyDcMoP+77AS6tvN1+cs1PebzawNLiPtOpIg0xhVX4tC+o5UYybB9F
 Jdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxpRepMJTovvA+isBKIvWPf2Mb0oogTF5j2Y5fZGMUU=;
 b=A0g86WK9SJlWA27eEJo46tTb/5Lla+56I5w1UaceiTbAvZu9qqswl20rvCQAyUnYQn
 X8fSLvVDSkfl9OkhQiGuA5Ha+qupTd4925bPg11dOt2LAfOxF3VmfhaibV018idUmX8t
 XOHQwqAFSU2FhlM/Eht2xKYiINENiCoBlgmDrihb2hMGqTxpCQ9kKINpsmAJzZRbJAfC
 JFm0dw2afCS/EHlkOISMTdpYJ04Hu82pJbR0X6f3pjGqK6uqEuE5ZgptjAZy5i8H1R9w
 yihwaDaGd58L4F4qtWcHj5GFb8qAMP2RoVBbFhxPGvt6GquhfPlYcYFLBoRXPtmB6lfq
 BVVQ==
X-Gm-Message-State: AO0yUKXD/DQZNT1v7MAQk2Kv80L4Af1EQK74UhydFK3xVH+EStw1QzOi
 1JjDQoFxlBPPtItY7zPoxz7szOhcpMKQysi+
X-Google-Smtp-Source: AK7set82JzSu+JAxlGK9tqiprP3f7zw7BMlmfVQ9lfCZUf7+JWq0M2sNAbq5UZPUWc9r86HPanTF4A==
X-Received: by 2002:a7b:ca54:0:b0:3dc:2b62:ee9f with SMTP id
 m20-20020a7bca54000000b003dc2b62ee9fmr10009573wml.3.1675434575851; 
 Fri, 03 Feb 2023 06:29:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] hw/arm/virt: Consolidate GIC finalize logic
Date: Fri,  3 Feb 2023 14:29:02 +0000
Message-Id: <20230203142927.834793-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alexander Graf <agraf@csgraf.de>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Message-id: 20221223090107.98888-2-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h |  15 ++--
 hw/arm/virt.c         | 198 ++++++++++++++++++++++--------------------
 2 files changed, 112 insertions(+), 101 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c7dd59d7f1f..e1ddbea96be 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -109,14 +109,19 @@ typedef enum VirtMSIControllerType {
 } VirtMSIControllerType;
 
 typedef enum VirtGICType {
-    VIRT_GIC_VERSION_MAX,
-    VIRT_GIC_VERSION_HOST,
-    VIRT_GIC_VERSION_2,
-    VIRT_GIC_VERSION_3,
-    VIRT_GIC_VERSION_4,
+    VIRT_GIC_VERSION_MAX = 0,
+    VIRT_GIC_VERSION_HOST = 1,
+    /* The concrete GIC values have to match the GIC version number */
+    VIRT_GIC_VERSION_2 = 2,
+    VIRT_GIC_VERSION_3 = 3,
+    VIRT_GIC_VERSION_4 = 4,
     VIRT_GIC_VERSION_NOSEL,
 } VirtGICType;
 
+#define VIRT_GIC_VERSION_2_MASK BIT(VIRT_GIC_VERSION_2)
+#define VIRT_GIC_VERSION_3_MASK BIT(VIRT_GIC_VERSION_3)
+#define VIRT_GIC_VERSION_4_MASK BIT(VIRT_GIC_VERSION_4)
+
 struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 90a7099d3b5..28c43d59fbd 100644
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
+        if (!kvm_enabled()) {
+            error_report("gic-version=host requires KVM");
+            exit(1);
+        }
+
+        /* For KVM, gic-version=host means gic-version=max */
+        return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
+                                       gics_supported, max_cpus);
+    case VIRT_GIC_VERSION_MAX:
+        if (gics_supported & VIRT_GIC_VERSION_4_MASK) {
+            gic_version = VIRT_GIC_VERSION_4;
+        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
+            gic_version = VIRT_GIC_VERSION_3;
+        } else {
+            gic_version = VIRT_GIC_VERSION_2;
+        }
+        break;
+    case VIRT_GIC_VERSION_NOSEL:
+        if ((gics_supported & VIRT_GIC_VERSION_2_MASK) &&
+            max_cpus <= GIC_NCPU) {
+            gic_version = VIRT_GIC_VERSION_2;
+        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
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
+        if (!(gics_supported & VIRT_GIC_VERSION_2_MASK)) {
+            error_report("%s does not support GICv2 emulation", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_3:
+        if (!(gics_supported & VIRT_GIC_VERSION_3_MASK)) {
+            error_report("%s does not support GICv3 emulation", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_4:
+        if (!(gics_supported & VIRT_GIC_VERSION_4_MASK)) {
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
+    /* Determine which GIC versions the current environment supports */
+    if (kvm_enabled() && kvm_irqchip_in_kernel()) {
+        int probe_bitmap = kvm_arm_vgic_probe();
 
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
-
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
+            gics_supported |= VIRT_GIC_VERSION_2_MASK;
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
+            gics_supported |= VIRT_GIC_VERSION_3_MASK;
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
+        gics_supported |= VIRT_GIC_VERSION_2_MASK;
+        accel_name = "KVM with kernel-irqchip=off";
+    } else {
+        gics_supported |= VIRT_GIC_VERSION_2_MASK;
         if (module_object_class_by_name("arm-gicv3")) {
-            /* CONFIG_ARM_GICV3_TCG was set */
+            gics_supported |= VIRT_GIC_VERSION_3_MASK;
             if (vms->virt) {
                 /* GICv4 only makes sense if CPU has EL2 */
-                vms->gic_version = VIRT_GIC_VERSION_4;
-            } else {
-                vms->gic_version = VIRT_GIC_VERSION_3;
+                gics_supported |= VIRT_GIC_VERSION_4_MASK;
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
-- 
2.34.1


