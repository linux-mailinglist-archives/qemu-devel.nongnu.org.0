Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F467E951
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSW-0006JP-86; Fri, 27 Jan 2023 10:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSQ-0006IK-5R
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:02 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSM-0007fB-OL
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id l8so3681172wms.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0U+Il4a8T/dt0WAsDkDpCQXyx0Semr+BKbPY7DEyoM=;
 b=VymtPy1vqq9lWXq1GSLgTqwgTd8ke878s7+J7RHyeCuINeCQxQBJcgs3WXjzx76FIq
 1y69/U9CMrqKCr1v2jKDSZYMZV/c3rYNYrsN+JSMm6q8O8uH7f2NzfW1DYtUjVk0zBj/
 fwtIJi+MhV+NWIjw+8RlS3HrGKctvKheyFOaHHwwHQYQCj908OU7chkFHAbbuUkI+hhS
 +wW+Lrdqi/NgRMWGJD7FcaL/C+hgE+K3PEFKpoDeOAk9fx7b2e7owxlMjcdBk76f8EEY
 b7f9t0+AFrH/OBvnN2Mcf4SXi2YTf1PFYTlmVdE4/u9GcV6u8dhcKtKl6CEAwDBfVGuu
 VVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0U+Il4a8T/dt0WAsDkDpCQXyx0Semr+BKbPY7DEyoM=;
 b=Sir0gGuUC11fScm2WO35I2g4sz8nFko2Jw8MCO5k5m+duwyGcJ78xZgDA1eJ67PcRN
 u34Ulb0NIyQaykqTBWElTLv4SYQoKoThTjF9dCncZF88uvVtwFpZ3c9N90OqUCZ/y+o5
 nKMw0I6GEG31rgLsGCDitgEr+tOZhLEHJO/LbQUXq4zWglzOxJ9J/Tgi3qELnppdwKL5
 N1CPfdVUxr/G2FC2ESEwmNDXwtHTtD8L7RIMsNtN40oH0FqCsw5T4Sl4c/TgGshEm2AC
 yINoSNObXshzgzMkbwAYalHoDcLj1FDB52+T5skkFiEwMZI9EWNfm6QriXI4Y3op/Zuk
 ISwg==
X-Gm-Message-State: AFqh2kpQty/tMgJirQhRDtD4kP17X7gI2kXzZUqifsvQ16RY+p9yfWKg
 D1ZuLVswTjy9nzJ5czD+TBe1zQ==
X-Google-Smtp-Source: AMrXdXuueF8x1/095lgRiyv5ga6qoHBW+FOlCa5j8xkrhQp8jza46g8uUqvznRohdxh29dMX7SFAPA==
X-Received: by 2002:a05:600c:31a3:b0:3da:6a6:739d with SMTP id
 s35-20020a05600c31a300b003da06a6739dmr40093483wmp.19.1674832557082; 
 Fri, 27 Jan 2023 07:15:57 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:15:56 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 01/16] NOMERGE: Add KVM Arm RME definitions to Linux
 headers
Date: Fri, 27 Jan 2023 15:07:14 +0000
Message-Id: <20230127150727.612594-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
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

Copy the KVM definitions for Arm RME from the development branch.
Don't merge, they will be added from the periodic Linux header sync.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 linux-headers/asm-arm64/kvm.h | 63 +++++++++++++++++++++++++++++++++++
 linux-headers/linux/kvm.h     | 21 +++++++++---
 2 files changed, 80 insertions(+), 4 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4bf2d7246e..8e04d6f7ff 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -108,6 +108,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_SVE		4 /* enable SVE for this CPU */
 #define KVM_ARM_VCPU_PTRAUTH_ADDRESS	5 /* VCPU uses address authentication */
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
+#define KVM_ARM_VCPU_REC		7 /* VCPU REC state as part of Realm */
 
 struct kvm_vcpu_init {
 	__u32 target;
@@ -391,6 +392,68 @@ enum {
 #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
 #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
 
+/* KVM_CAP_ARM_RME on VM fd */
+#define KVM_CAP_ARM_RME_CONFIG_REALM		0
+#define KVM_CAP_ARM_RME_CREATE_RD		1
+#define KVM_CAP_ARM_RME_INIT_IPA_REALM		2
+#define KVM_CAP_ARM_RME_POPULATE_REALM		3
+#define KVM_CAP_ARM_RME_ACTIVATE_REALM		4
+
+#define KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256		0
+#define KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA512		1
+
+#define KVM_CAP_ARM_RME_RPV_SIZE 64
+
+/* List of configuration items accepted for KVM_CAP_ARM_RME_CONFIG_REALM */
+#define KVM_CAP_ARM_RME_CFG_RPV			0
+#define KVM_CAP_ARM_RME_CFG_HASH_ALGO		1
+#define KVM_CAP_ARM_RME_CFG_SVE			2
+#define KVM_CAP_ARM_RME_CFG_DBG			3
+#define KVM_CAP_ARM_RME_CFG_PMU			4
+
+struct kvm_cap_arm_rme_config_item {
+	__u32 cfg;
+	union {
+		/* cfg == KVM_CAP_ARM_RME_CFG_RPV */
+		struct {
+			__u8	rpv[KVM_CAP_ARM_RME_RPV_SIZE];
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_HASH_ALGO */
+		struct {
+			__u32	hash_algo;
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_SVE */
+		struct {
+			__u32	sve_vq;
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_DBG */
+		struct {
+			__u32	num_brps;
+			__u32	num_wrps;
+		};
+
+		/* cfg == KVM_CAP_ARM_RME_CFG_PMU */
+		struct {
+			__u32	num_pmu_cntrs;
+		};
+		/* Fix the size of the union */
+		__u8	reserved[256];
+	};
+};
+
+struct kvm_cap_arm_rme_populate_realm_args {
+	__u64 populate_ipa_base;
+	__u64 populate_ipa_size;
+};
+
+struct kvm_cap_arm_rme_init_ipa_args {
+	__u64 init_ipa_base;
+	__u64 init_ipa_size;
+};
+
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
 #define   KVM_ARM_VCPU_PMU_V3_IRQ	0
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index ebdafa576d..9d5affc98a 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -901,14 +901,25 @@ struct kvm_ppc_resize_hpt {
 #define KVM_S390_SIE_PAGE_OFFSET 1
 
 /*
- * On arm64, machine type can be used to request the physical
- * address size for the VM. Bits[7-0] are reserved for the guest
- * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
- * value 0 implies the default IPA size, 40bits.
+ * On arm64, machine type can be used to request both the machine type and
+ * the physical address size for the VM.
+ *
+ * Bits[11-8] are reserved for the ARM specific machine type.
+ *
+ * Bits[7-0] are reserved for the guest PA size shift (i.e, log2(PA_Size)).
+ * For backward compatibility, value 0 implies the default IPA size, 40bits.
  */
+#define KVM_VM_TYPE_ARM_SHIFT		8
+#define KVM_VM_TYPE_ARM_MASK		(0xfULL << KVM_VM_TYPE_ARM_SHIFT)
+#define KVM_VM_TYPE_ARM(_type)		\
+	(((_type) << KVM_VM_TYPE_ARM_SHIFT) & KVM_VM_TYPE_ARM_MASK)
+#define KVM_VM_TYPE_ARM_NORMAL		KVM_VM_TYPE_ARM(0)
+#define KVM_VM_TYPE_ARM_REALM		KVM_VM_TYPE_ARM(1)
+
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
 /*
  * ioctls for /dev/kvm fds:
  */
@@ -1176,6 +1187,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_ZPCI_OP 221
 #define KVM_CAP_S390_CPU_TOPOLOGY 222
 
+#define KVM_CAP_ARM_RME 300 // FIXME: Large number to prevent conflicts
+
 #ifdef KVM_CAP_IRQ_ROUTING
 
 struct kvm_irq_routing_irqchip {
-- 
2.39.0


