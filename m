Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36624E57EE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:55:17 +0100 (CET)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5CW-0004X8-H2
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:55:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uH-0008VB-8H
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:25 -0400
Received: from [2607:f8b0:4864:20::42d] (port=38654
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uF-0005VR-Nz
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:24 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b15so2015324pfm.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCsELW2QXqJF8bCAIFTcBQvHzfwsRKTCwEsXwAqek4w=;
 b=8G1Fo/LtG+qvDUJoacfKR5i0ISORzoj/q0mLJFWlp7UCcqBq8Tw1PLwhHODtHdJvn/
 Na+9mBMqkYTDBSx7F3kCfm6KE41HBhVus8t3EflXRhRgCsepMjzjlCDdyieE9egYoBoB
 ahtzQowWnAA+lVhVfDicbWzT9fXLn5Ueiv+LzNw1Bbpbon0epS/MV6ifXyW7kyvP8n1L
 YcjVDfg+N7Pl7/uMlb9LA8Aqv9jDXnRwL2uRErrFxLku3bAA4J5wHF/e3FEfMIPnOvA2
 LMUPqQSd51l1/6QYApGdGdpi9yi2JMrEN3n0oGDmnnZuZSgGhuvSqFBWsAHseav18bKR
 35kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCsELW2QXqJF8bCAIFTcBQvHzfwsRKTCwEsXwAqek4w=;
 b=2/4HD3oqFgVN0E4wpZm7EWOuy3eCljoybh+udchf6NoiFTL1bUubSEvH5RU8gbMvtD
 8nmV5Lpzc9ZIFH0SA583JP1LrXWlJAbyvJe53bftbvkBqKmL4O4C7aYOBNz1Hq7Fg5Lh
 F9P4uUVPszScIAbCouiBDRbkuRjl4fPhNCcxpw/pnWBvNs5HzYrWczq+M3O3MFk77toF
 wmD4Db00sYPNwB32U9py+p3oOQsvwtu5/RrQqPIV0Cehnbm1jO8/qnpTL5JPUzfWNGf8
 VjiGkyuFoaKt3kljcrIcMX18ZJARF6rlRcWVZvwbGNGaW7jZ5OVM8p0+dalfTIgoEOz4
 eR4w==
X-Gm-Message-State: AOAM530EB3RPuN1/uaXlljaD0tULO1qRi5d1/jvWKjIhTvh+xA9gp6gN
 vLg3xpiDBKDVZnHDosIBs5snTbbSG8bggA==
X-Google-Smtp-Source: ABdhPJzphzNzX2yfXcbFXBPXl5A/SpIIQnOAMfQpwd+vopzjt8s46NdLQrLIHEwE1PsytbmHivGG+w==
X-Received: by 2002:a63:481b:0:b0:378:9b24:5163 with SMTP id
 v27-20020a63481b000000b003789b245163mr782851pga.224.1648056982228; 
 Wed, 23 Mar 2022 10:36:22 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:21 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] hw/intc/exynos4210_combiner: replace 'qemu_split_irq'
 with 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:41 +0800
Message-Id: <20220323173543.146442-4-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
 hw/intc/exynos4210_combiner.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 4534ee248d..18dade35d3 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -31,10 +31,12 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 
 #include "hw/arm/exynos4210.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
+#include "hw/core/split-irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
 
@@ -105,6 +107,22 @@ static const VMStateDescription vmstate_exynos4210_combiner = {
     }
 };
 
+static qemu_irq split_irq(qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
+        hw_error("exynos4210.combiner: unable to realize split irq device");
+        return NULL;
+    }
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+
+    return qdev_get_gpio_in(splitter, 0);
+}
+
 /*
  * Get Combiner input GPIO into irqs structure
  */
@@ -132,48 +150,48 @@ void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
         /* MDNIE_LCD1 INTG1 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
             continue;
 
         /* TMU INTG3 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
             continue;
 
         /* LCD1 INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
-               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+               irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                        irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG35 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG51 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG53 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
         }
-- 
2.34.0


