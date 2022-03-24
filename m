Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F055F4E68AC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:29:40 +0100 (CET)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSDL-0006fF-Vm
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:29:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0V-0005tW-O2
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:23 -0400
Received: from [2607:f8b0:4864:20::635] (port=34785
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0T-00035h-Bk
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:23 -0400
Received: by mail-pl1-x635.google.com with SMTP id i11so5622721plr.1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9B6mV80OgqdiI83ewaqC80HWu/UbOOhNxA7lQxIlI8=;
 b=msRaTW7Wh1RhszjFBzjpEZZtDQa/ZjCSSxsduINZ3T3WDQv9OAJKS8KFPC+jJWVwzz
 zckfW1hHBGABJPe70kiYUcvGRsHb/dn/yIWYjSEnIGIahuoY5KYiZokzX3LBrNRgB5FF
 Bpnp80QgKlo+Gh2P5DqGVCGJwr27EzyJzoVhg6iC5sHkjWFypWUU+Z2JzVqVO8Wbupoq
 2OrnflgmfA8gf0ErsVY+y4FCWcZcB5C/aw0qwLxs5reIp8i1pPSGCvY7p7FePyWTtZCW
 KBwD9foKzwuIPWHxNybp+WHyZgS/VXrpaD2NC0WWg8K2Eog1lLbXrQFmfXoqS+olmp2b
 sZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9B6mV80OgqdiI83ewaqC80HWu/UbOOhNxA7lQxIlI8=;
 b=yCal5HItRMoCoCSklHhk3kVScLF15lcnmCgRWihVA/jh46oqTBrGEthKcl2gPRO97W
 k6DWuY4dk8PzS+HkBbfIJRTBiUSGwt4LgWHWFtoFbewDm4Vi0UXr5okGxy+0t/gqEMvJ
 OQmqQaRN+L2/woFAaFxe7JGsgDvrWaA+nL+y8xRuBjBUXk8LejZMSvl6ujRmsDnSncua
 BemmZzfL6ApbxQeQ9si1s+AvC+1hZ8UkFpq6/tpXWO/kOTx4eYlJFSquRHFJ93z0C53j
 e7F0TrxsmvaC6WiFS4PAeHerN5FSWTk2GXOba66/Yxr752/SEuYg3I4POzY5Nzb+EaHm
 36mQ==
X-Gm-Message-State: AOAM532lfPqxEv+zWp8p92dygYKCuHNuoNWvDoS0ZwveN1YN6E8UMpfL
 GOAM8ydbgRvom4Q2zktZKaPdZi6g8S3xzA==
X-Google-Smtp-Source: ABdhPJx856d+uj572Oto/CbHbITA5sDDhcrx9woUOIpDJVuVJugOKaq/GRdbYFKnlmf4TPtz8qVIUg==
X-Received: by 2002:a17:90a:8a91:b0:1c6:9f99:e671 with SMTP id
 x17-20020a17090a8a9100b001c69f99e671mr19859368pjn.100.1648145779767; 
 Thu, 24 Mar 2022 11:16:19 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.101])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm3577725pjd.15.2022.03.24.11.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 11:16:19 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
Date: Fri, 25 Mar 2022 02:15:56 +0800
Message-Id: <20220324181557.203805-4-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324181557.203805-1-zongyuan.li@smartx.com>
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>, Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/exynos4210.c           | 26 +++++++++++
 hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
 hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
 include/hw/arm/exynos4210.h   | 11 ++---
 include/hw/core/split-irq.h   |  5 +--
 5 files changed, 126 insertions(+), 33 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0299e81f85..28bcf97af9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -288,6 +288,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, s->irqs.int_gic_irq[n]);
     }
+    /* SplitIRQ for internal irq realized here */
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
 
@@ -299,6 +300,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, s->irqs.ext_gic_irq[n]);
     }
+    /* SplitIRQ for external irq realized here */
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
 
@@ -488,6 +490,30 @@ static void exynos4210_init(Object *obj)
         object_initialize_child(obj, name, orgate, TYPE_OR_IRQ);
         g_free(name);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->irqs.int_combiner_irq); i++) {
+        char *name = g_strdup_printf("internal-combiner-irq-%d", i);
+
+        object_initialize_child(obj, name, &s->irqs.int_combiner_irq[i],
+                                TYPE_SPLIT_IRQ);
+        g_free(name);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->irqs.ext_combiner_irq); i++) {
+        char *name = g_strdup_printf("external-combiner-irq-%d", i);
+
+        object_initialize_child(obj, name, &s->irqs.ext_combiner_irq[i],
+                                TYPE_SPLIT_IRQ);
+        g_free(name);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->irqs.board_irqs); i++) {
+        char *name = g_strdup_printf("board-irq-%d", i);
+
+        object_initialize_child(obj, name, &s->irqs.board_irqs[i],
+                                TYPE_SPLIT_IRQ);
+        g_free(name);
+    }
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 4534ee248d..fafcfc484d 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -31,6 +31,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 
 #include "hw/arm/exynos4210.h"
 #include "hw/hw.h"
@@ -105,16 +106,39 @@ static const VMStateDescription vmstate_exynos4210_combiner = {
     }
 };
 
+static void split_irq(SplitIRQ *splitter, qemu_irq out1, qemu_irq out2)
+{
+    DeviceState *dev = DEVICE(splitter);
+
+    qdev_prop_set_uint32(dev, "num-lines", 2);
+
+    qdev_realize(dev, NULL, &error_fatal);
+
+    qdev_connect_gpio_out(dev, 0, out1);
+    qdev_connect_gpio_out(dev, 1, out2);
+}
+
+static void passthrough_irq(SplitIRQ *splitter, qemu_irq out)
+{
+    DeviceState *dev = DEVICE(splitter);
+
+    qdev_prop_set_uint32(dev, "num-lines", 1);
+
+    qdev_realize(dev, NULL, &error_fatal);
+
+    qdev_connect_gpio_out(dev, 0, out);
+}
+
 /*
  * Get Combiner input GPIO into irqs structure
  */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
-        int ext)
+void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *combiner,
+                                    int ext)
 {
     int n;
     int bit;
     int max;
-    qemu_irq *irq;
+    SplitIRQ *irq;
 
     max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
         EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
@@ -132,53 +156,74 @@ void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
         /* MDNIE_LCD1 INTG1 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]),
+                        0));
             continue;
 
         /* TMU INTG3 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]),
+                        0));
             continue;
 
         /* LCD1 INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
-               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                       irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG35 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG51 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG53 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
         }
 
-        irq[n] = qdev_get_gpio_in(dev, n);
+        passthrough_irq(&irq[n], qdev_get_gpio_in(combiner, n));
     }
 }
 
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f115..888233c681 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -29,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
+#include "hw/hw.h"
 
 enum ExtGicId {
     EXT_GIC_ID_MDMA_LCD0 = 66,
@@ -197,7 +198,7 @@ static void exynos4210_irq_handler(void *opaque, int irq, int level)
     Exynos4210Irq *s = (Exynos4210Irq *)opaque;
 
     /* Bypass */
-    qemu_set_irq(s->board_irqs[irq], level);
+    qemu_set_irq(qdev_get_gpio_in(DEVICE(&s->board_irqs[irq]), 0), level);
 }
 
 /*
@@ -218,6 +219,12 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
     uint32_t grp, bit, irq_id, n;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
+        SplitIRQ *splitter = &s->board_irqs[n];
+        DeviceState *dev = DEVICE(splitter);
+
+        qdev_prop_set_uint32(dev, "num-lines", 2);
+        qdev_realize(dev, NULL, &error_fatal);
+
         irq_id = 0;
         if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
                 n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
@@ -229,15 +236,28 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
             /* MCT_G1 is passed to External and GIC */
             irq_id = EXT_GIC_ID_MCT_G1;
         }
+
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_gic_irq[irq_id-32]);
+            qdev_connect_gpio_out(dev, 0,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->int_combiner_irq[n]), 0));
+            qdev_connect_gpio_out(dev, 1, s->ext_gic_irq[irq_id - 32]);
         } else {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_combiner_irq[n]);
+            qdev_connect_gpio_out(dev, 0,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->int_combiner_irq[n]), 0));
+            qdev_connect_gpio_out(dev, 1,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->ext_combiner_irq[n]), 0));
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
+        SplitIRQ *splitter = &s->board_irqs[n];
+        DeviceState *dev = DEVICE(splitter);
+
+        qdev_prop_set_uint32(dev, "num-lines", 2);
+        qdev_realize(dev, NULL, &error_fatal);
+
         /* these IDs are passed to Internal Combiner and External GIC */
         grp = EXYNOS4210_COMBINER_GET_GRP_NUM(n);
         bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
@@ -245,8 +265,10 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_gic_irq[irq_id-32]);
+            qdev_connect_gpio_out(dev, 0,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->int_combiner_irq[n]), 0));
+            qdev_connect_gpio_out(dev, 1, s->ext_gic_irq[irq_id - 32]);
         }
     }
 }
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 60b9e126f5..be36665e04 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
+#include "hw/core/split-irq.h"
 
 #define EXYNOS4210_NCPUS                    2
 
@@ -79,11 +80,11 @@
 #define EXYNOS4210_NUM_DMA      3
 
 typedef struct Exynos4210Irq {
-    qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
-    qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
+    SplitIRQ int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
+    SplitIRQ ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
     qemu_irq int_gic_irq[EXYNOS4210_INT_GIC_NIRQ];
     qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
-    qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
+    SplitIRQ board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 } Exynos4210Irq;
 
 struct Exynos4210State {
@@ -115,7 +116,7 @@ qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
 
 /* Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs */
-void exynos4210_init_board_irqs(Exynos4210Irq *s);
+void exynos4210_init_board_irqs(Exynos4210Irq *irqs);
 
 /* Get IRQ number from exynos4210 IRQ subsystem stub.
  * To identify IRQ source use internal combiner group and bit number
@@ -126,7 +127,7 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit);
 /*
  * Get Combiner input GPIO into irqs structure
  */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
+void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *combiner,
         int ext);
 
 /*
diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
index ff8852f407..eb485dd7a6 100644
--- a/include/hw/core/split-irq.h
+++ b/include/hw/core/split-irq.h
@@ -42,9 +42,6 @@
 
 #define MAX_SPLIT_LINES 16
 
-
-OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
-
 struct SplitIRQ {
     DeviceState parent_obj;
 
@@ -52,4 +49,6 @@ struct SplitIRQ {
     uint16_t num_lines;
 };
 
+OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
+
 #endif
-- 
2.34.0


