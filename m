Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA3933ED15
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:34:10 +0100 (CET)
Received: from localhost ([::1]:53166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSZ7-0005Yg-Qj
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTy-0001nv-EP
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:51 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTv-00014R-UW
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:50 -0400
Received: by mail-pj1-x102c.google.com with SMTP id s21so781519pjq.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69KRFSXYjzFlJT+Yhq6KsYSkZCWp63z+0u1KJALVHNA=;
 b=K6Z9UjHEZYHee0gFfJmGGCucD9CZzFrEKcarXyT4TXAo+E3rSf0FAOW8Iavko+tTSh
 kCGYxou/IKR+nL4CHNnPkzELpxp3K5DAfZTpgP3muHYxOXIZo0sBdQWUa2e4tuL3+MZd
 zHbsER/bGfrgYU1IeemiJPueLSeUKvhXdgqKf622ucyILlYNXvHV7X0hOtX3sr82EKD4
 65D0ALDt7cA3IgQDEKCwKmMa5SmQC0u7HWMMBGB5pXD5kdJlKm3AO8EKvVu++xJYLFzK
 jZesvDwvf8+YTTGLd4btO6qHTenIcDs/tXUSLKb7Vx55+9atgSt35W7BbrMi8bPmmfAr
 RAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69KRFSXYjzFlJT+Yhq6KsYSkZCWp63z+0u1KJALVHNA=;
 b=k0+4cYTKrxcBVxfJ57M0TeMZ8F33cUfLGB7oB+2KNb6POSQNMz0KahDCZsv3EzRjsy
 DcuTanwyP2YqccOj9hU7T8AKC5meWCqDektxKvfFDWK7/4ixSpbUsd+Rf1YxKoJh7sAt
 GWVz8pefZy3OsGqOdgCuJCOGnnd01M4LAzowAqGtnT5ljk/n6Dn5zx7G+Th5LfgTTmP6
 3Z+vgpoTbPEKQX61ulHw7FtSs1jO1tm07u2Q6Iu0CgagXWhpiyd1yj+sF697HGeFWuGB
 w+GK3P4XN4LJaVY+qwfer2lmW2wsmUl4/jGiDwS9qgKitt+QQg6BQuKF+Ha2VzDR6XWD
 APCA==
X-Gm-Message-State: AOAM5337xy+qfrMomSHnWpDp1MamDPVCLF+De/WtRJ+RcaNDHXOP7z05
 eEL9k7nbt5ya3mOeWAI4ee9Y
X-Google-Smtp-Source: ABdhPJwfHs+AWfOVJzLEt+Eq70GPIH8o0n9PVGaYymF/EuexpwPXB5/l4CMXRuaZjJbjMxTqwOJEQA==
X-Received: by 2002:a17:902:f1c2:b029:e4:6c23:489f with SMTP id
 e2-20020a170902f1c2b02900e46c23489fmr3813518plc.62.1615973326296; 
 Wed, 17 Mar 2021 02:28:46 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:46 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 2/5] Add basic MTE support to KVM guest
Date: Wed, 17 Mar 2021 09:28:21 +0000
Message-Id: <dc2ef2000f73aa9aded5d97b417289083bf52aa7.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=haibo.xu@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable the virt machine feature "mte" to work with
KVM guest. This feature is still hiden from the user
in this patch, and will be available in a later patch.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c      | 22 +++++++++++-----------
 target/arm/cpu.c   |  2 +-
 target/arm/kvm.c   |  9 +++++++++
 target/arm/kvm64.c |  7 +++++++
 4 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..76658b93a3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1988,18 +1988,18 @@ static void machvirt_init(MachineState *machine)
         }
 
         if (vms->mte) {
+            /*
+             * The property exists only if MemTag is supported.
+             * If it is, we must allocate the ram to back that up.
+             */
+            if (!object_property_find(cpuobj, "tag-memory")) {
+                error_report("MTE requested, but not supported "
+                             "by the guest CPU");
+                exit(1);
+            }
+
             /* Create the memory region only once, but link to all cpus. */
-            if (!tag_sysmem) {
-                /*
-                 * The property exists only if MemTag is supported.
-                 * If it is, we must allocate the ram to back that up.
-                 */
-                if (!object_property_find(cpuobj, "tag-memory")) {
-                    error_report("MTE requested, but not supported "
-                                 "by the guest CPU");
-                    exit(1);
-                }
-
+            if (!tag_sysmem && !kvm_enabled()) {
                 tag_sysmem = g_new(MemoryRegion, 1);
                 memory_region_init(tag_sysmem, OBJECT(machine),
                                    "tag-memory", UINT64_MAX / 32);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408..47bf817b61 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1847,7 +1847,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                cpu->secure_memory);
     }
 
-    if (cpu->tag_memory != NULL) {
+    if (cpu->tag_memory != NULL && !kvm_enabled()) {
         cpu_address_space_init(cs, ARMASIdx_TagNS, "cpu-tag-memory",
                                cpu->tag_memory);
         if (has_secure) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..3403e621ac 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -32,6 +32,7 @@
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
+#include "hw/arm/virt.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -274,6 +275,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (kvm_check_extension(s, KVM_CAP_ARM_MTE) &&
+        object_dynamic_cast(OBJECT(ms), TYPE_VIRT_MACHINE) &&
+        VIRT_MACHINE(ms)->mte) {
+            if (kvm_vm_enable_cap(s, KVM_CAP_ARM_MTE, 0)) {
+                error_report("Failed to enable KVM_CAP_ARM_MTE cap");
+            }
+    }
+
     return ret;
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..73a191f8e1 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -500,6 +500,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool mte_supported;
     uint64_t features = 0;
     uint64_t t;
     int err;
@@ -646,6 +647,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    mte_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_MTE) > 0;
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
@@ -659,6 +661,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         ahcf->isar.id_aa64pfr0 = t;
     }
+    if (mte_supported) {
+        t = ahcf->isar.id_aa64pfr1;
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
+        ahcf->isar.id_aa64pfr1 = t;
+    }
 
     /*
      * We can assume any KVM supporting CPU is at least a v8
-- 
2.17.1


