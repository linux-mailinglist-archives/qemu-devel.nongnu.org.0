Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33D3513D8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:45:26 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRupJ-0003Uv-3S
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulL-0007BD-UY
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:19 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:33481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulJ-0002Q8-SS
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:19 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso1762092otp.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
 b=N8s3VyqaA5j1K7gTuKQyZ3SwynhIrvrdaHQu0PtzeaOvtj2bxCwNErcsd+tjj80giN
 nNJ7ZO+NRfkMihBBGpXa8s7L4FgVFIk69th5ZObD7Z7u5Lhk7K8gnVD7aDkRas8OQ+Jo
 YBh3ICwegcaw98mXexDWCFNY+XF6sY4C8V7cuGiDUe41/0PewAuXWDhPeOq9Kf88n7AV
 Q+ZQZLrPSbLWJJeW7RZGp5BWEmtqcz1jciLuUZNqo95ZzdvEsFgzJ94m/gkgwMCKcX6k
 bRTMXTI/VW4Wh4JZIDG9wP8EFqiE57BJGGXzeS9kXLyzojAvlZmYZkI3MsblvvnLfAZa
 pQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
 b=RbMAi/JIbV3BezXaK86wF25z5a0wzMEQWMwVK2IPNIW5W8fASoSPXJNkrbeqyczrhB
 bLwNCpatGNOSHm7t5IZe8pYU+SI7VeS7NjafCgsvNp6ZZfubXSCCXnEWQJrpjb7OoS45
 RY1GemZkP8aVDfxGAJ2qfOBOVjTyQ9J5FlquSd6h5DhCdHEkMvezlwXbAtD79Bjb2BSm
 sAkUo/Fn3++H33qR67wULKr7hjcJBkb4vx8a+7KlOX4NQRoa4H2vZm+rH54CRMHrJqW2
 5RREadu03FY3Ga8syh0i6MsaYf3uMSPmkwu4i5SANLrcQ/3DDTTiDo3B4kOPUPrdGWga
 soIg==
X-Gm-Message-State: AOAM5331xYvvj8ObHypSsuiEstrFWok+k9Y1WXjs0T0eWHgU3B0fo3OT
 m3/iWCOeAT4Y3JAMbmbOeKT5DPTZTuPdNGY=
X-Google-Smtp-Source: ABdhPJzKlz2O/UEvWy+raEdJpCPr51k5efYj+PYR/Qrz1DDjSx2Pl2VZTssFf59q3juYx0S/xVLRsw==
X-Received: by 2002:a05:6830:14d2:: with SMTP id
 t18mr2404432otq.50.1617273676505; 
 Thu, 01 Apr 2021 03:41:16 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:16 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 5/6] target/arm/cpu: Enable 'el2' to work with host/max cpu
Date: Thu,  1 Apr 2021 10:40:57 +0000
Message-Id: <37df1b1872f15086dd1d066e53dc1eedaf114051.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn off the 'el2' cpu property by default to keep in line with
that in TCG mode, i.e. we can now use '-cpu max|host,el2=on' to
enable the nested virtualization.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c      | 14 ++++++++++----
 target/arm/cpu.c   |  3 ++-
 target/arm/cpu64.c |  1 +
 target/arm/kvm64.c | 10 ++++++++++
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 92d46ebcfe..74340e21bd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -454,6 +454,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
     char *nodename;
+    bool has_el2 = object_property_get_bool(OBJECT(first_cpu), "el2", NULL);
 
     vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
@@ -491,7 +492,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                  2, vms->memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (vms->virt) {
+        if (vms->virt || has_el2) {
             qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                                    GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
@@ -1911,8 +1912,8 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->virt && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "Virtualization extensions to the guest CPU");
+        error_report("mach-virt: VM 'virtualization' feature is not supported "
+                     "in KVM mode, please use CPU feature 'el2' instead");
         exit(1);
     }
 
@@ -1950,11 +1951,16 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
 
-        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
+        if (!vms->virt && !kvm_enabled() &&
+            object_property_find(cpuobj, "has_el2")) {
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
         if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+            if (kvm_enabled() && ARM_CPU(cpuobj)->has_el2) {
+                vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
+            }
+
             object_property_set_int(cpuobj, "psci-conduit", vms->psci_conduit,
                                     NULL);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 30cc330f50..9530a2c4bf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1099,7 +1099,7 @@ static Property arm_cpu_rvbar_property =
 
 #ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
-            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
+            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, false);
 
 static Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
@@ -2018,6 +2018,7 @@ static void arm_host_initfn(Object *obj)
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
+        aarch64_add_el2_properties(obj);
     }
     arm_cpu_post_init(obj);
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3f3f2c5495..ae8811d09e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -666,6 +666,7 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        aarch64_add_el2_properties(obj);
     } else {
         uint64_t t;
         uint32_t u;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 9cacaf2eb8..7bf892404f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -500,6 +500,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool el2_supported;
     uint64_t features = 0;
     uint64_t t;
     int err;
@@ -646,6 +647,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    el2_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_EL2) > 0;
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
@@ -660,6 +662,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         ahcf->isar.id_aa64pfr0 = t;
     }
 
+    /* Use the ARM_FEATURE_EL2 bit to keep inline with that in TCG mode. */
+    if (el2_supported) {
+        features |= 1ULL << ARM_FEATURE_EL2;
+    }
+
     /*
      * We can assume any KVM supporting CPU is at least a v8
      * with VFPv4+Neon; this in turn implies most of the other
@@ -861,6 +868,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(kvm_arm_sve_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
-- 
2.17.1


