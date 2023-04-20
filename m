Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA66E8F78
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:08:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAD-0000ba-B6; Thu, 20 Apr 2023 06:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA7-0000Yi-8O
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA1-0003f2-KN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso282817f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985102; x=1684577102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gHMd6Mccc9WWoHnZhKOQsV6TX3fZq4KK5xzXCVpXhHc=;
 b=jV43J+jPPgeZZ1rafSh+11Yui31ZGn0F+Gg8wWEyD4/N8wfisjlzfLmg629dax6O+j
 oovT03f6gnlsu5AX4cSC3Q3OQMJEcv47LhD8kVs2LU6RpSXH1UXk3oydrzlrag0VKW2G
 XFZuLMLWWidW5yFA/dxtszsyPu++eWDbzboS19KGx9BnfkgeFU1fR07HKkI4OOFgL7Jx
 wCzyyQ89mnI2Q/15Lvry9v/OLRrbUeXcDql6oz/A1y9LXMdK/fT/1I/zZnEpA7H1d4Pn
 iT6fIVce9hkjx+ztZqYNN5KkwszMeV/JvAguA4HDIPOvNNlJ8xTucuDSWbz6cVfbx9SZ
 B3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985102; x=1684577102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gHMd6Mccc9WWoHnZhKOQsV6TX3fZq4KK5xzXCVpXhHc=;
 b=M/XGLGIOSlkB98OiRGi4nE0V7ws0VNJYEAmAsc7eDD8K64SXceTwSgRHEEhh0tiAyo
 Kg7GrtaSb+jSZOOr5lIAK8eDEqvStGGL7+RMz2udOz+yhzhy/4ZKBsb3XyLX2cXuXXxX
 yzSETK2FP+0d+LCuCaB8wY5z/zIcT0r75CCg9u/+Bhy+SF6SDDLM6t6I8geA5h/PR0bb
 G2wO6sewLNWNNBCauu0wHe35Ynwm4o/4R3QHBXKDLoTOmibtRNyZ4kSJ+5ROnpi6LiNv
 e+JgHTLu4Jixiu54bUi4NohHZDsusOmk25+03H+UbPGg167StCQG7LnQqMxhRgjzKr4P
 qDeA==
X-Gm-Message-State: AAQBX9eJ/8MSF8m654fD+KyFAs90UCuM3EcrpOR4diRMp0EzfkYgriBL
 l0qY5TrrYecO0JEIRU6tjubklJfGWlziciOTqQU=
X-Google-Smtp-Source: AKy350Y0Sws7heQ26++tRlTCAn0kytd+YuV1YqF9kJE/R9Djvh9hGclqSbMezrPv6+b7vdwCmKOUrg==
X-Received: by 2002:adf:ff83:0:b0:2f9:5841:a4d4 with SMTP id
 j3-20020adfff83000000b002f95841a4d4mr905392wrr.27.1681985102123; 
 Thu, 20 Apr 2023 03:05:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
Date: Thu, 20 Apr 2023 11:04:40 +0100
Message-Id: <20230420100456.944969-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

This patch adds WDT to Allwinner-H3 and Orangepi-PC.
WDT is added as an overlay to the Timer module memory area.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20230326202256.22980-4-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/orangepi.rst  | 1 +
 include/hw/arm/allwinner-h3.h | 5 ++++-
 hw/arm/allwinner-h3.c         | 8 ++++++++
 hw/arm/Kconfig                | 1 +
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index e5973600a15..9afa54213b0 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -26,6 +26,7 @@ The Orange Pi PC machine supports the following devices:
  * System Control module
  * Security Identifier device
  * TWI (I2C)
+ * Watchdog timer
 
 Limitations
 """""""""""
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 59e0f822d2d..f15d6d7cc7d 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -48,6 +48,7 @@
 #include "hw/net/allwinner-sun8i-emac.h"
 #include "hw/rtc/allwinner-rtc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "hw/watchdog/allwinner-wdt.h"
 #include "target/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
@@ -96,7 +97,8 @@ enum {
     AW_H3_DEV_RTC,
     AW_H3_DEV_CPUCFG,
     AW_H3_DEV_R_TWI,
-    AW_H3_DEV_SDRAM
+    AW_H3_DEV_SDRAM,
+    AW_H3_DEV_WDT
 };
 
 /** Total number of CPU cores in the H3 SoC */
@@ -141,6 +143,7 @@ struct AwH3State {
     AWI2CState r_twi;
     AwSun8iEmacState emac;
     AwRtcState rtc;
+    AwWdtState wdt;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 69d0ad6f50e..f05afddf7e0 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -49,6 +49,7 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_DEV_OHCI3]      = 0x01c1d400,
     [AW_H3_DEV_CCU]        = 0x01c20000,
     [AW_H3_DEV_PIT]        = 0x01c20c00,
+    [AW_H3_DEV_WDT]        = 0x01c20ca0,
     [AW_H3_DEV_UART0]      = 0x01c28000,
     [AW_H3_DEV_UART1]      = 0x01c28400,
     [AW_H3_DEV_UART2]      = 0x01c28800,
@@ -234,6 +235,8 @@ static void allwinner_h3_init(Object *obj)
     object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
     object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
     object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
+
+    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN6I);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -453,6 +456,11 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
                        qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_R_TWI));
 
+    /* WDT */
+    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0,
+                            s->memmap[AW_H3_DEV_WDT], 1);
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
         create_unimplemented_device(unimplemented[i].device_name,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 338dabce427..91636ab460c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -337,6 +337,7 @@ config ALLWINNER_H3
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select ALLWINNER_I2C
+    select ALLWINNER_WDT
     select SERIAL
     select ARM_TIMER
     select ARM_GIC
-- 
2.34.1


