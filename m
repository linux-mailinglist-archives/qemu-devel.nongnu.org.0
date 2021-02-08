Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15558312999
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:59:03 +0100 (CET)
Received: from localhost ([::1]:60410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xhW-00071y-3y
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6I-0007in-6i
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:34 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:46557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6C-0001ij-Pl
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:33 -0500
Received: by mail-il1-x12b.google.com with SMTP id m20so11450513ilj.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 19:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7kX52+i6GRyy+3lYBjqHTFyTQeUgleV90lSPDfFuBI=;
 b=qxtw6SwooIdn9ov3wbboEkGG84GD/5rSi1t5TkmrylFDjzUCD9rOmJ2KRjR4lXdiUq
 7j05tdtRIcDmVjQnqYaVM3uPil+UwKZI424v2Y4q1idO+6HCXKz3Eh9X0RikaQ/RAoTg
 hT70RTMvlL/tW816z5z8v1uPSAb0GY/kHoXCq+BH8WWRfvsuXs1tWdso2N9amh07tlRd
 3wvSOxjGLJZ912SRUe+FmBYjEPmwpxeSSNa2spdOP7OAbph/3bAXb5fsFTN6QrTqed+T
 Zv0g7GMEFAfGa1cGzRjosPpGAi6gc46aK+7GLXE1n4QvgC1i3yMAACjH4LfxUJDjionZ
 WE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7kX52+i6GRyy+3lYBjqHTFyTQeUgleV90lSPDfFuBI=;
 b=Z1ONplYF1IiNpz50sMXKLcGcVQG+Pty56rgaD6fCSnTwGqhC9v3jmLsFbuuPOlpnmi
 VQE4ZF8KOdxARnkEARjevpIaJHzarYd2vMWZnueXL0/hWg9116nPSL/dAymhkNrBTf8X
 jUuV/JBxFPl9//ebJtwDJ80RV8vr4mEMhXYEIXeKosh9o5DGOuVpbk14OI2aAdIley2k
 H9HzTLMg3SHsVM4E9dycA+pqnyKLhbe4ARAKrVBd7m19mJAE6kOnCj3lljq1O9fmIpDO
 oZED3QckMRd0KlYT+UQ43WsyypT0XR9NsSHCy9U4Eqm97aVsukEUhgK+hMoIQpHhp2mJ
 eRqA==
X-Gm-Message-State: AOAM531ynMU8MAkp2bVFa8ayJDIpD0xl4yUEETimZ15MJ31jO1XQTJSZ
 VS06N0FCPh9mvv/bKhI/sOQl
X-Google-Smtp-Source: ABdhPJzkI0gA3fQ9pLeboMZOLQRxhnj50m7snSmljrzJDXNETsBIztKQjlRCiDMmuWnmBVnoG69dzw==
X-Received: by 2002:a05:6e02:1343:: with SMTP id
 k3mr13906775ilr.102.1612754427727; 
 Sun, 07 Feb 2021 19:20:27 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:27 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 2/5] Add basic MTE support to KVM guest
Date: Mon,  8 Feb 2021 03:20:03 +0000
Message-Id: <9c4507258ffe9cea4aeb5e19ef8475cb65230c3d.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x12b.google.com
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
index 399da73454..623d5e9397 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1974,18 +1974,18 @@ static void machvirt_init(MachineState *machine)
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
index 40142ac141..50f3223944 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1831,7 +1831,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                cpu->secure_memory);
     }
 
-    if (cpu->tag_memory != NULL) {
+    if (cpu->tag_memory != NULL && !kvm_enabled()) {
         cpu_address_space_init(cs, ARMASIdx_TagNS, "cpu-tag-memory",
                                cpu->tag_memory);
         if (has_secure) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ffe186de8d..33630b2b70 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -32,6 +32,7 @@
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
+#include "hw/arm/virt.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -272,6 +273,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
index 3c37fc4fb6..23f34034db 100644
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


