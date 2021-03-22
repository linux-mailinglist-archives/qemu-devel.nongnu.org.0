Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F6343D93
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:15:00 +0100 (CET)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHaN-0004ah-RA
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTS-0007Kr-EH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTN-0002T9-Cy
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so10851519pjb.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+NM5yfD0ObBzM0/K9OBInQYziKkO1YL7j+UCs3urWY=;
 b=U/q/tBhSVlswCb6NbPI/TgCTClXY4bMfl5LAHhLEVBCCUxJQw0P9GDFj1Mrt3y4T1d
 Ee/qiZQYBRZ2Fd/mT6IKBqoHEMgwczJtGm+SRQhk1cZeqU+zufkn+aK8TrccXQtWOF23
 zodMTFACG6FP5OwVPk/QfvoxT78TsBstzAMw0877WSnH2j93COzlli9alKC2pK4ssdGP
 CYHuwZGzBfm56N1bmM+2W9DP5nAerbOPImgDbS/scCOcSD2bkYxee+PMLNLTgzGFB6Gr
 d1YOOzAHr7JSt3VUD3wi6xGEwtArgBLn+MrXV5i73G+iwyeHhCpscxYjfaJd3DmPgzrV
 au4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+NM5yfD0ObBzM0/K9OBInQYziKkO1YL7j+UCs3urWY=;
 b=NsQB5ysaMbftx78Bdpv4GIUFhcZd1WDVlFmiMDf8PMGKzIVSak+fNXqtP++neTap/i
 QrUr6cq3yxSErU2VQQ6CVrxpd4Q8w4jKGQWBZwUPhPJ81Y4hs5Lhn2tWpfK+LmcxIz0l
 Pp0SvLDvBiI8PRkS2QtSLkFhMgIDYa9llnO/yM1zJ7b4QxqIc6WLdX6Rxt2tPhu++Nd6
 YfMLWRWbCquvU8eqRyiexBmtsU2+nx7QqtR6SnHZ1R8dEnSB6NopjAOMppiHSjPTP6uY
 gnXRejYffUIT/hvg/m0mfMK9XWYgBLiQ8NYMVErdcJBuBLBeEQ/nfI3IdaQqwx1/3Tr5
 FbAQ==
X-Gm-Message-State: AOAM530U9MmPA3UCvO4N5aCgeh+BH9kqS5JqKdUfQ09g3l2M/DofZkdp
 KFh2PDn6ynU8zT9537f1tVLxSImSl6mAJXY=
X-Google-Smtp-Source: ABdhPJyILCQzK34xtTGRMQTCzT2XFT9ajArH7TfmsYcudnbheygKu2F79I8oeMxH+sf7eGSZQkr89A==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr12361738pjb.147.1616407663884; 
 Mon, 22 Mar 2021 03:07:43 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id c193sm13697145pfc.180.2021.03.22.03.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 03:07:43 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 3/3] Enable nested virtualization support in arm64 KVM mode
Date: Mon, 22 Mar 2021 10:07:26 +0000
Message-Id: <b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616052889.git.haibo.xu@linaro.org>
References: <cover.1616052889.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=haibo.xu@linaro.org; helo=mail-pj1-x102e.google.com
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
 Haibo Xu <haibo.xu@linaro.org>, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for arm64 el2 in qemu KVM mode(nested virtualization).
This feature is disabled by default, just as that in TCG mode, and
can be enabled by "-M virt,accel=kvm,virtualization=on" when starting
a VM.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c        | 11 ++++++++---
 target/arm/cpu.h     |  8 ++++++++
 target/arm/kvm64.c   | 14 ++++++++++++++
 target/arm/kvm_arm.h | 28 ++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..72e60348d5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -663,6 +663,11 @@ static void create_gic(VirtMachineState *vms)
             qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
         }
+
+        if (kvm_irqchip_in_kernel()) {
+            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
+                              vms->virt);
+        }
     } else {
         if (!kvm_irqchip_in_kernel()) {
             qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
@@ -1905,9 +1910,9 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "Virtualization extensions to the guest CPU");
+    if (vms->virt && kvm_enabled() && !kvm_arm_nested_virt_supported()) {
+        error_report("mach-virt: nested virtualization requested, "
+                     "but not supported by the host.");
         exit(1);
     }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7f..377187152b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4182,6 +4182,14 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+/*
+ * Currently we don't differentiate between the ARMv8.3-NV and ARMv8.4-NV.
+ */
+static inline bool isar_feature_aa64_nv(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, NV) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..2810104dea 100644
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
 
@@ -671,6 +673,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_PMU;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
 
+    if (el2_supported) {
+        features |= 1ULL << ARM_FEATURE_EL2;
+    }
+
     ahcf->features = features;
 
     return true;
@@ -721,6 +727,11 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_nested_virt_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
@@ -856,6 +867,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(kvm_arm_sve_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
+    if (cpu->has_el2) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..da3a3d5920 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -285,6 +285,24 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
  */
 bool kvm_arm_steal_time_supported(void);
 
+/**
+ * kvm_arm_nested_virt_finalize:
+ * @cpu: ARMCPU for which to finalize nested-virt
+ * @errp: Pointer to Error* for error propagation
+ *
+ * Validate the nested-virt property selection and set its default
+ * based on KVM support and guest configuration.
+ */
+void kvm_arm_nested_virt_finalize(ARMCPU *cpu, Error **errp);
+
+/**
+ * kvm_arm_nested_virt_supported:
+ *
+ * Returns: true if KVM can enable nested virtualization
+ * and false otherwise.
+ */
+bool kvm_arm_nested_virt_supported(void);
+
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -398,6 +416,11 @@ static inline bool kvm_arm_steal_time_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_nested_virt_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
@@ -441,6 +464,11 @@ static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
     g_assert_not_reached();
 }
 
+static inline void kvm_arm_nested_virt_finalize(ARMCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
+
 static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
 {
     g_assert_not_reached();
-- 
2.17.1


