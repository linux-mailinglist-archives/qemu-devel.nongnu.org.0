Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6FB5A8702
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:53:19 +0200 (CEST)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTm2-0005oY-RJ
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSps-00060l-9v; Wed, 31 Aug 2022 14:53:12 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpp-00086u-Go; Wed, 31 Aug 2022 14:53:11 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11edd61a9edso20218934fac.5; 
 Wed, 31 Aug 2022 11:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Aqhm2DSvpPsr+pZGAjrTFswQiP48p96CEQbc1ZnRqSM=;
 b=TgmGNpEIBC/b0ODxhcnHoW3z5xgUOIJ3ygMRMmv9xNAYvLuKTPgeYlxOGROQY7SeEB
 WMfoWn6zNMU8JRz8KiHsofLnRk7zyZMEz8sXKfXlUp9bqzCCpP/yXLsnwWi0YOmJ9aPG
 fVeB2XNKMlyH+zxrrykoRNd481HOrDlXpYnrtY9R/6TSg0ZmtkYZ4kIv712Al4cZiyKc
 Chv8Pd+CIqV7k7zHkdLd87FedsfagvyHoAcC1ZKzQ2CJVMHAGK3VWHI6t7VLx868bn+/
 kJrWPtwlWVxhd9VkQStQeKCR+eam7xFVlpHAEj2nI/sgzIaU+dxB5moh+/JaUacgsIJR
 7q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Aqhm2DSvpPsr+pZGAjrTFswQiP48p96CEQbc1ZnRqSM=;
 b=FshgN2s0fDSxIiegK98WukKzWylvRggEqHAE2cIovy1E1p+vpkLONI9xJFcK7pBsIH
 rI5wdUGC+j7N9rtrx+fDiFbG7AUSnwU+TJQfQz23OK8ruTTpwN9zrN2O0mZtktGXm5++
 TmurmOSJSBIjwZdQixxcmSfV74lxoVj+YGzqLV9aAe4WZgdh6GtpM3IIF1xHz5ATBTvV
 OPhiYHzpRsLFMhwJQyrygsW2jQUQ8uWdFiqdJGZVzbCuHy6FA42sAxq4gTy5fZ7gFHY1
 sA6l/RQoTPvdElForHeYMCg8NWcL9qaLpnKO2aw9+W9hh1Kikc5k7YIP63A+q0wiNAID
 ZnZQ==
X-Gm-Message-State: ACgBeo3eA52FYbUh3AXt7QpLjykmAMyfqJrSyFRPEHCdV0zip6Cs5zF6
 6gxWInHHy6BQRU1/t1ggUkg6mt6WrXQ=
X-Google-Smtp-Source: AA6agR70C2S6lzDm6W9VcybrvemIlS/NrUD465Stm17gJiOMifZzd79EpdhDBmsbIrGUvNDCiMKcDQ==
X-Received: by 2002:a05:6871:784:b0:11c:291d:6147 with SMTP id
 o4-20020a056871078400b0011c291d6147mr2142226oap.66.1661971986830; 
 Wed, 31 Aug 2022 11:53:06 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 52/60] ppc/ppc405: Use an embedded PPCUIC model in SoC state
Date: Wed, 31 Aug 2022 15:50:26 -0300
Message-Id: <20220831185034.23240-53-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Simplify sysbus device casts for readability]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <ac5f010f4eb3ade061c65bc39a049f231f75574a.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h    |  3 ++-
 hw/ppc/ppc405_uc.c | 28 ++++++++++++++--------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 343a84c98e..67f4c14f50 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -27,6 +27,7 @@
 
 #include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
+#include "hw/intc/ppc-uic.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
 #define PPC405EP_NVRAM_BASE 0xF0000000
@@ -208,7 +209,7 @@ struct Ppc405SoCState {
     hwaddr ram_size;
 
     PowerPCCPU cpu;
-    DeviceState *uic;
+    PPCUIC uic;
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 247c4f3fa8..47bb9f534a 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1083,6 +1083,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "cpu", &s->cpu,
                             POWERPC_CPU_TYPE_NAME("405ep"));
 
+    object_initialize_child(obj, "uic", &s->uic, TYPE_PPC_UIC);
+
     object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 
@@ -1150,17 +1152,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(sbd, 0, 0xef600600);
 
     /* Universal interrupt controller */
-    s->uic = qdev_new(TYPE_PPC_UIC);
-
-    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
+    object_property_set_link(OBJECT(&s->uic), "cpu", OBJECT(&s->cpu),
                              &error_fatal);
-    if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
+    sbd = SYS_BUS_DEVICE(&s->uic);
+    if (!sysbus_realize(sbd, errp)) {
         return;
     }
-
-    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
+    sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
-    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
+    sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
@@ -1171,7 +1171,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                              "ppc405.sdram0", s->dram_mr,
                              s->ram_bases[0], s->ram_sizes[0]);
 
-    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17), 1,
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
                       s->ram_banks, s->ram_bases, s->ram_sizes,
                       s->do_dram_init);
 
@@ -1186,12 +1186,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
     sbd = SYS_BUS_DEVICE(&s->dma);
     for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
-        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 5 + i));
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(DEVICE(&s->uic), 5 + i));
     }
 
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
-                         qdev_get_gpio_in(s->uic, 2));
+                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
 
     /* GPIO */
     sbd = SYS_BUS_DEVICE(&s->gpio);
@@ -1203,13 +1203,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     /* Serial ports */
     if (serial_hd(0) != NULL) {
         serial_mm_init(get_system_memory(), 0xef600300, 0,
-                       qdev_get_gpio_in(s->uic, 0),
+                       qdev_get_gpio_in(DEVICE(&s->uic), 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hd(1) != NULL) {
         serial_mm_init(get_system_memory(), 0xef600400, 0,
-                       qdev_get_gpio_in(s->uic, 1),
+                       qdev_get_gpio_in(DEVICE(&s->uic), 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
                        DEVICE_BIG_ENDIAN);
     }
@@ -1226,7 +1226,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(sbd, 0, 0xef600000);
     for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
-        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 19 + i));
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(DEVICE(&s->uic), 19 + i));
     }
 
     /* MAL */
@@ -1237,7 +1237,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
     sbd = SYS_BUS_DEVICE(&s->mal);
     for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
-        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 11 + i));
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(DEVICE(&s->uic), 11 + i));
     }
 
     /* Ethernet */
-- 
2.37.2


