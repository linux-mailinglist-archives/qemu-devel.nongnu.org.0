Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A840A6D82F7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:06:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5dR-0005yi-CF; Wed, 05 Apr 2023 12:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dQ-0005xm-0b
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dM-0007XC-FU
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q19so33656565wrc.5
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqJcKhz9mIYMr3Oe650mCrgDSoO6+Z+db2hud5uttJw=;
 b=HKwM2wDJ1Fum+wqlFpT+ZGNsBPp7MH24wgkXSJwjBKyOE+4yhIpILKEyyjMZxMmiAD
 DXttce9/UlXfCDXhUY0vpealipGUCFqdh25CESoprzd/G49n7qbtXRObflz9tqSuM1F7
 NhEOtd7ocMwbq0oWvCtYAuvh91yLbGhXLXvZ0H3VeVIegPm2GRaXQd0+P7USRVczo9wH
 OkkavqtWMbctyFZouKLoRT8V4s8VzYy1hTwtmR5fLXDvRCDvderEBMd29GlxvpY9KDh3
 HoKoGgz26of/gomablGIAqTVkdsvIcrHjzIM7huMgI0NyHKBbCcGxfoW5vbe7ROmPTjn
 Ht6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqJcKhz9mIYMr3Oe650mCrgDSoO6+Z+db2hud5uttJw=;
 b=aAaMabauz+D6sehjwYWSqqd6a8Hz8uowG51UszOhesiROBNo4XoxF+bBw3OEK7h1TF
 eil4aqf95rlGYPXiwIoQQNfHQB6EhLpL9FmQ2j2Os0AH/vISoFvd5q1zkTe3UQZdxuwx
 grLeTZNt7v713yAuKCs+2Lu8yoZKXwBou0eimwL5DgXEfUT5Lpo+I/sMm64LDnfpv2mO
 XgN8tXyqdj8BAIf3yCxxDKVGOZDrMNJIWVdM/yRGr1lcY8QIjGgClODTGSyVKU6FT3Bk
 VNCLfCT7WW6QH2+06axPU/ITph1daOyS7c0Zbkbhr6JZxTKhEOeJ8jtzz3dAemLjWmSq
 ydtg==
X-Gm-Message-State: AAQBX9eWdikxz9xDnhPD7akfatoN2EWcMuYre7TJuYZu7mgqJwv8LZ5I
 xisnEVXMFDThWq2hPlLvL9ViRWXEL/zN5AJrzIM=
X-Google-Smtp-Source: AKy350bN19fJ+yL8EQeK+93Zo/4a5VSKfxzvyGOZ4rYVIwTM+m7Uu71D6zWrGtIgzjY9gZsgTdtgFA==
X-Received: by 2002:adf:cd05:0:b0:2cf:e34c:a229 with SMTP id
 w5-20020adfcd05000000b002cfe34ca229mr4808855wrm.8.1680710715354; 
 Wed, 05 Apr 2023 09:05:15 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a5d5966000000b002d78a96cf5fsm15467280wri.70.2023.04.05.09.05.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/10] hw/intc/arm_gic: Un-inline GIC*/ITS class_name() helpers
Date: Wed,  5 Apr 2023 18:04:47 +0200
Message-Id: <20230405160454.97436-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"kvm_arm.h" contains external and internal prototype declarations.
Files under the hw/ directory should only access the KVM external
API.

In order to avoid machine / device models to include "kvm_arm.h"
simply to get the QOM GIC/ITS class name, un-inline each class
name getter to the proper device model file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/arm_gic.h              |  2 ++
 include/hw/intc/arm_gicv3_common.h     | 10 ++++++
 include/hw/intc/arm_gicv3_its_common.h |  9 ++++++
 target/arm/kvm_arm.h                   | 45 --------------------------
 hw/arm/virt-acpi-build.c               |  2 +-
 hw/arm/virt.c                          |  1 +
 hw/intc/arm_gic_common.c               |  7 ++++
 hw/intc/arm_gicv3_common.c             | 14 ++++++++
 hw/intc/arm_gicv3_its_common.c         | 12 +++++++
 9 files changed, 56 insertions(+), 46 deletions(-)

diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 116ccbb5a9..48f6a51a70 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -86,4 +86,6 @@ struct ARMGICClass {
     DeviceRealize parent_realize;
 };
 
+const char *gic_class_name(void);
+
 #endif
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index ab5182a28a..4e2fb518e7 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -329,4 +329,14 @@ struct ARMGICv3CommonClass {
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
                               const MemoryRegionOps *ops);
 
+/**
+ * gicv3_class_name
+ *
+ * Return name of GICv3 class to use depending on whether KVM acceleration is
+ * in use. May throw an error if the chosen implementation is not available.
+ *
+ * Returns: class name to use
+ */
+const char *gicv3_class_name(void);
+
 #endif
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index a11a0f6654..7dc712b38d 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -122,5 +122,14 @@ struct GICv3ITSCommonClass {
     void (*post_load)(GICv3ITSState *s);
 };
 
+/**
+ * its_class_name:
+ *
+ * Return the ITS class name to use depending on whether KVM acceleration
+ * and KVM CAP_SIGNAL_MSI are supported
+ *
+ * Returns: class name to use or NULL
+ */
+const char *its_class_name(void);
 
 #endif
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..fe6d824a52 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -445,32 +445,6 @@ static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 
 #endif
 
-static inline const char *gic_class_name(void)
-{
-    return kvm_irqchip_in_kernel() ? "kvm-arm-gic" : "arm_gic";
-}
-
-/**
- * gicv3_class_name
- *
- * Return name of GICv3 class to use depending on whether KVM acceleration is
- * in use. May throw an error if the chosen implementation is not available.
- *
- * Returns: class name to use
- */
-static inline const char *gicv3_class_name(void)
-{
-    if (kvm_irqchip_in_kernel()) {
-        return "kvm-arm-gicv3";
-    } else {
-        if (kvm_enabled()) {
-            error_report("Userspace GICv3 is not supported with KVM");
-            exit(1);
-        }
-        return "arm-gicv3";
-    }
-}
-
 /**
  * kvm_arm_handle_debug:
  * @cs: CPUState
@@ -508,23 +482,4 @@ void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
  */
 bool kvm_arm_verify_ext_dabt_pending(CPUState *cs);
 
-/**
- * its_class_name:
- *
- * Return the ITS class name to use depending on whether KVM acceleration
- * and KVM CAP_SIGNAL_MSI are supported
- *
- * Returns: class name to use or NULL
- */
-static inline const char *its_class_name(void)
-{
-    if (kvm_irqchip_in_kernel()) {
-        /* KVM implementation requires this capability */
-        return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
-    } else {
-        /* Software emulation based model */
-        return "arm-gicv3-its";
-    }
-}
-
 #endif
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49..e8bab19847 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -48,12 +48,12 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/arm/virt.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/platform-bus.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/tpm.h"
-#include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1fe39c6683..dbbe639e61 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -63,6 +63,7 @@
 #include "hw/arm/fdt.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/irq.h"
 #include "kvm_arm.h"
 #include "hw/firmware/smbios.h"
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index a379cea395..9702197856 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -21,10 +21,12 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "gic_internal.h"
 #include "hw/arm/linux-boot-if.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "sysemu/kvm.h"
 
 static int gic_pre_save(void *opaque)
 {
@@ -393,3 +395,8 @@ static void register_types(void)
 }
 
 type_init(register_types)
+
+const char *gic_class_name(void)
+{
+    return kvm_irqchip_in_kernel() ? "kvm-arm-gic" : "arm_gic";
+}
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 642a8243ed..2ebf880ead 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "hw/core/cpu.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/qdev-properties.h"
@@ -608,3 +609,16 @@ static void register_types(void)
 }
 
 type_init(register_types)
+
+const char *gicv3_class_name(void)
+{
+    if (kvm_irqchip_in_kernel()) {
+        return "kvm-arm-gicv3";
+    } else {
+        if (kvm_enabled()) {
+            error_report("Userspace GICv3 is not supported with KVM");
+            exit(1);
+        }
+        return "arm-gicv3";
+    }
+}
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index d7532a7a89..abaf77057e 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -24,6 +24,7 @@
 #include "hw/intc/arm_gicv3_its_common.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "sysemu/kvm.h"
 
 static int gicv3_its_pre_save(void *opaque)
 {
@@ -158,3 +159,14 @@ static void gicv3_its_common_register_types(void)
 }
 
 type_init(gicv3_its_common_register_types)
+
+const char *its_class_name(void)
+{
+    if (kvm_irqchip_in_kernel()) {
+        /* KVM implementation requires this capability */
+        return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
+    } else {
+        /* Software emulation based model */
+        return "arm-gicv3-its";
+    }
+}
-- 
2.38.1


