Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E754F193C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 18:19:36 +0200 (CEST)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbPQV-00028W-4L
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 12:19:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvB-0004sr-GR
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:13 -0400
Received: from [2a00:1450:4864:20::336] (port=33940
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv7-0000UG-RG
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so199938wms.1
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31u0+avP323YLzOU9pyrAUZrwJi1ZG4EQzUEZW+ZySs=;
 b=ggIaRci5JqAn4tNH9+ew6CHAM0uLSaJ/HkzplB1wURn+7e3fG+cTPmc7vSn5mDbbCj
 2ZUWQiV980W2L03c179BkN1H4ZSnMvnqMkK7Ri12/bm5QAX4iP4Rer1aM0YsUU51Tkpj
 vyeFvejRmjCEUIItzFV6MKoyP3ejGg23LzMO+hYCkENxtoeHSgv3UOJl0GNW7YcntAlj
 UmSM5MsLz0o6lRXxEu3WboCgqgo/C4Loe7guxXF3l7u0N0DHV0RXxwSwjT70I4OUfB5R
 SUFIHCBFEL0vFpEw2BgpqtFsulUAjsn9/0gkSZ2OZBOpDxssgNOuy4hEeTsp2DpH0aWU
 glGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31u0+avP323YLzOU9pyrAUZrwJi1ZG4EQzUEZW+ZySs=;
 b=17hLJizMgEFBNjqR9j9R9/1dluNiTnYSPxAJOqNpt0nYEXIQ1ejQztbwdbp3oh3eD+
 S/Xmt1IJUbJcDVdSJlxDFJx7P7Wo3DxhW2xxEr4jLHJezXyDTy7VfJwmknCgIXMyDF/g
 8yqyTKR8bw9bRqIFek2QtxgKZkWhkkGHrEGo1MEzkn75rPKFe+N57aGfiYaR7AFlUqRF
 11RftkXl1BOrhD5wD/iBb9UNtcnfbh5doLI5MyqzyuiTdFcdMEeRvTpLgyNDiv+46gRA
 sFaVq3Jds8hna99i9t+ln00dK9QvkMceJthSnge6TLkpfzJIHZKRZXMBXQL5sG1xqTDi
 DlTQ==
X-Gm-Message-State: AOAM531fpd5f1p/WqR4DLuYbUbz5+ngAWSlDn3Ue3+ytJ6x+I2aKxxtY
 FXhRZ8CmlBX28gG7XjF4LJp6BA==
X-Google-Smtp-Source: ABdhPJyoFW0I2+0LoRQCNTUMJ4kqRw292eoCy7aHoD1hJJMrYaH49UzoR9GNYiYAlCPuI4TpEV3N4Q==
X-Received: by 2002:a05:600c:644:b0:38c:8aab:1708 with SMTP id
 p4-20020a05600c064400b0038c8aab1708mr94436wmm.149.1649087228449; 
 Mon, 04 Apr 2022 08:47:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 08/18] hw/arm/exynos4210: Put external GIC into state
 struct
Date: Mon,  4 Apr 2022 16:46:48 +0100
Message-Id: <20220404154658.565020-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the creation of the external GIC to the new-style "embedded in
state struct" approach, so we can easily refer to the object
elsewhere during realize.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h      |  2 ++
 include/hw/intc/exynos4210_gic.h | 43 ++++++++++++++++++++++++++++++++
 hw/arm/exynos4210.c              | 10 ++++----
 hw/intc/exynos4210_gic.c         | 17 ++-----------
 MAINTAINERS                      |  2 +-
 5 files changed, 53 insertions(+), 21 deletions(-)
 create mode 100644 include/hw/intc/exynos4210_gic.h

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index d83e96a091e..f35ae90000f 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -27,6 +27,7 @@
 #include "hw/or-irq.h"
 #include "hw/sysbus.h"
 #include "hw/cpu/a9mpcore.h"
+#include "hw/intc/exynos4210_gic.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
 
@@ -103,6 +104,7 @@ struct Exynos4210State {
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
     A9MPPrivState a9mpcore;
+    Exynos4210GicState ext_gic;
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/include/hw/intc/exynos4210_gic.h b/include/hw/intc/exynos4210_gic.h
new file mode 100644
index 00000000000..f64c4069c6d
--- /dev/null
+++ b/include/hw/intc/exynos4210_gic.h
@@ -0,0 +1,43 @@
+/*
+ * Samsung exynos4210 GIC implementation. Based on hw/arm_gic.c
+ *
+ * Copyright (c) 2000 - 2011 Samsung Electronics Co., Ltd.
+ * All rights reserved.
+ *
+ * Evgeny Voevodin <e.voevodin@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ * See the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_INTC_EXYNOS4210_GIC_H
+#define HW_INTC_EXYNOS4210_GIC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_EXYNOS4210_GIC "exynos4210.gic"
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210GicState, EXYNOS4210_GIC)
+
+#define EXYNOS4210_GIC_NCPUS 2
+
+struct Exynos4210GicState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion cpu_container;
+    MemoryRegion dist_container;
+    MemoryRegion cpu_alias[EXYNOS4210_GIC_NCPUS];
+    MemoryRegion dist_alias[EXYNOS4210_GIC_NCPUS];
+    uint32_t num_cpu;
+    DeviceState *gic;
+};
+
+#endif
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 742666ba779..2058df9aecf 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -455,10 +455,9 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     sysbus_create_simple("l2x0", EXYNOS4210_L2X0_BASE_ADDR, NULL);
 
     /* External GIC */
-    dev = qdev_new("exynos4210.gic");
-    qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    qdev_prop_set_uint32(DEVICE(&s->ext_gic), "num-cpu", EXYNOS4210_NCPUS);
+    busdev = SYS_BUS_DEVICE(&s->ext_gic);
+    sysbus_realize(busdev, &error_fatal);
     /* Map CPU interface */
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_GIC_CPU_BASE_ADDR);
     /* Map Distributer interface */
@@ -468,7 +467,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 1));
     }
     for (n = 0; n < EXYNOS4210_EXT_GIC_NIRQ; n++) {
-        s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(dev, n);
+        s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->ext_gic), n);
     }
 
     /* Internal Interrupt Combiner */
@@ -686,6 +685,7 @@ static void exynos4210_init(Object *obj)
     }
 
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
+    object_initialize_child(obj, "ext-gic", &s->ext_gic, TYPE_EXYNOS4210_GIC);
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index d8cad537fbf..71a88c86bc1 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/intc/exynos4210_gic.h"
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
 
@@ -44,20 +45,6 @@
 #define EXYNOS4210_GIC_CPU_REGION_SIZE  0x100
 #define EXYNOS4210_GIC_DIST_REGION_SIZE 0x1000
 
-#define TYPE_EXYNOS4210_GIC "exynos4210.gic"
-OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210GicState, EXYNOS4210_GIC)
-
-struct Exynos4210GicState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion cpu_container;
-    MemoryRegion dist_container;
-    MemoryRegion cpu_alias[EXYNOS4210_NCPUS];
-    MemoryRegion dist_alias[EXYNOS4210_NCPUS];
-    uint32_t num_cpu;
-    DeviceState *gic;
-};
-
 static void exynos4210_gic_set_irq(void *opaque, int irq, int level)
 {
     Exynos4210GicState *s = (Exynos4210GicState *)opaque;
@@ -100,7 +87,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
      * enough room for the cpu numbers.  gcc 9.2.1 on 32-bit x86
      * doesn't figure this out, otherwise and gives spurious warnings.
      */
-    assert(n <= EXYNOS4210_NCPUS);
+    assert(n <= EXYNOS4210_GIC_NCPUS);
     for (i = 0; i < n; i++) {
         /* Map CPU interface per SMP Core */
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef73..5ac10b88977 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -648,7 +648,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/*/exynos*
-F: include/hw/arm/exynos4210.h
+F: include/hw/*/exynos*
 
 Calxeda Highbank
 M: Rob Herring <robh@kernel.org>
-- 
2.25.1


