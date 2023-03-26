Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B16C97C2
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 22:24:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgWtf-0001qy-Jv; Sun, 26 Mar 2023 16:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWtc-0001pb-Py; Sun, 26 Mar 2023 16:23:20 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWtb-0003pk-4i; Sun, 26 Mar 2023 16:23:20 -0400
Received: by mail-lf1-x129.google.com with SMTP id br6so8673596lfb.11;
 Sun, 26 Mar 2023 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679862197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+9drRYcPap8x0rvwcbFK9iA3EPw67rquBQoOyVcYNs=;
 b=d89m837MjZMyo0BMzlsajrm+d3D6DtUlGOVF3P8PDsbvHGeFcM8jbo/UY5bfDPwL9B
 YDts53cniUujGZJ8tjncpNWjeIY2wNJN4BohNb2ekCPfPg1qy5yieDSGXZI/66GA3f/s
 2iH92VcE3ILuaA/AruhxuB9an0uAGKKTkH6bJI2KVzlHgB4jkwYvll19YTdCzOyI0IIt
 GQ4AtVK6luL1H4yr1mihB4QJF/GMPVdrG3m1vvaRdE2mt6EC9GHaugwNDo3V4XcWKMvg
 1/eaoLTtLXcly1eQxkRwSBX77//EMvQZrq3oD0+CD45Jx3aEGv1pp0kDYsim5BNvubXh
 kFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679862197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+9drRYcPap8x0rvwcbFK9iA3EPw67rquBQoOyVcYNs=;
 b=7Wvc3qvaAGoYXGCCmoOt43n9zWrUkwXs/MZL290L0vdsUM+n+/vjZb9bPPr4wRm3tu
 AsnbmDbSI1cLSXYbgA2QEG3wJQC2sL5+zx3gN4zNOZ6ohJOzRaQTfi7JL2PUFvHORjTH
 htrnzRnhwOc9N30HXgdlCUwJ6NWg++oL+ywYbeMZuLllVxDjyu1C/dlUZZKm3Uw3RYRW
 /iadmf3fQDjXoGQI+9jp8EyvhaatevWFlMmKCnA1hD9iQC6ymzr8KoovZYmRNoT8W+/+
 B931xrlwXXKBxXnva4AeWgjsfP+wDORegS7ApHdD3vEuQCCKsJTG3tUmaemGPRaea51n
 uIBQ==
X-Gm-Message-State: AAQBX9dn1UpqYGCVaVQqrPZyc5BS7/RuJi+TRw78d6VbaGDr1RDm8KMQ
 XC3Gwnea9IForZZJjCcgrUU=
X-Google-Smtp-Source: AKy350YP7GYxUgrGaFZT/8NgmBdXDycZ94h6eHQGhCxhHoyqjmawbOOEfG+wO6c2vo2gKk+ZEL6X1g==
X-Received: by 2002:ac2:55b8:0:b0:4e0:6e01:7ebf with SMTP id
 y24-20020ac255b8000000b004e06e017ebfmr2967784lfg.52.1679862197102; 
 Sun, 26 Mar 2023 13:23:17 -0700 (PDT)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 u3-20020a2e9f03000000b002a2b9d9429esm1427773ljk.117.2023.03.26.13.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:23:16 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 3/4] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
Date: Sun, 26 Mar 2023 22:22:55 +0200
Message-Id: <20230326202256.22980-4-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
References: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch adds WDT to Allwinner-H3 and Orangepi-PC.
WDT is added as an overlay to the Timer module memory area.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 docs/system/arm/orangepi.rst  | 1 +
 hw/arm/Kconfig                | 1 +
 hw/arm/allwinner-h3.c         | 8 ++++++++
 include/hw/arm/allwinner-h3.h | 5 ++++-
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index e5973600a1..9afa54213b 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -26,6 +26,7 @@ The Orange Pi PC machine supports the following devices:
  * System Control module
  * Security Identifier device
  * TWI (I2C)
+ * Watchdog timer
 
 Limitations
 """""""""""
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ec15248536..7d916f5450 100644
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
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 69d0ad6f50..f05afddf7e 100644
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
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 59e0f822d2..f15d6d7cc7 100644
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
-- 
2.30.2


