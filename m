Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296292438B2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 12:37:07 +0200 (CEST)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Aba-0006nc-40
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 06:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXF-0000AU-9Q; Thu, 13 Aug 2020 06:32:37 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4185 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXD-0006pp-5o; Thu, 13 Aug 2020 06:32:36 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 25E88F768B5D1C296E35;
 Thu, 13 Aug 2020 18:32:32 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:21 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 6/9] target/arm: introduce KVM_CAP_ARM_CPU_FEATURE
Date: Thu, 13 Aug 2020 18:26:54 +0800
Message-ID: <20200813102657.2588720-7-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce KVM_CAP_ARM_CPU_FEATURE to check whether KVM supports to set
CPU features in ARM.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 linux-headers/linux/kvm.h |  1 +
 target/arm/cpu.c          |  5 +++++
 target/arm/kvm64.c        | 14 ++++++++++++++
 target/arm/kvm_arm.h      |  7 +++++++
 4 files changed, 27 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c366737..0b83d2b4bb 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SECURE_GUEST 181
 #define KVM_CAP_HALT_POLL 182
 #define KVM_CAP_ASYNC_PF_INT 183
+#define KVM_CAP_ARM_CPU_FEATURE 187
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4e67b8f22c..3fc54cb3a4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1539,6 +1539,11 @@ static void arm_cpu_set_bit_prop(Object *obj, Visitor *v, const char *name,
     Error *local_err = NULL;
     bool value;
 
+    if (!kvm_arm_cpu_feature_supported()) {
+        warn_report("KVM doesn't support to set CPU feature in arm.  "
+                    "Setting to `%s` is ignored.", name);
+        return;
+    }
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
         return;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index be2d0cda0d..e7470477d5 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -664,6 +664,20 @@ bool kvm_arm_sve_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
 }
 
+bool kvm_arm_cpu_feature_supported(void)
+{
+    static bool cpu_feature_initialized;
+    static bool cpu_feature_supported;
+
+    if (!cpu_feature_initialized) {
+        cpu_feature_supported = kvm_check_extension(kvm_state,
+                                                    KVM_CAP_ARM_CPU_FEATURE);
+        cpu_feature_initialized = true;
+    }
+
+    return cpu_feature_supported;
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99035494ae..c2481ce464 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -290,6 +290,13 @@ bool kvm_arm_pmu_supported(void);
  */
 bool kvm_arm_sve_supported(void);
 
+/**
+ * kvm_arm_cpu_feature_supported:
+ *
+ * Returns true if KVM can set CPU features and false otherwise.
+ */
+bool kvm_arm_cpu_feature_supported(void);
+
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
-- 
2.18.4


