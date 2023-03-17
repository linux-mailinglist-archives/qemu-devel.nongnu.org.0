Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F886BDD6E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 01:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcxjB-0005nh-Hm; Thu, 16 Mar 2023 20:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxiz-0005db-Hp; Thu, 16 Mar 2023 20:13:37 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxiw-0004SS-7x; Thu, 16 Mar 2023 20:13:36 -0400
Received: by mail-lf1-x12c.google.com with SMTP id x17so4513500lfu.5;
 Thu, 16 Mar 2023 17:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679012012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+9drRYcPap8x0rvwcbFK9iA3EPw67rquBQoOyVcYNs=;
 b=D6lms0RhFYeZz7A496H3g7GjvThyIReCsd1Wr8twJ/wp0yvi+Sg3GKx1z6T5vYWNL5
 xkqbsBTQ3yIUyHYyM1V+V+61C5dsrOTE52jxlwaVywzyryQz2Qs7hhCtHNANynsBY83V
 Pzl4jrXwczLBGPvvOUdrq4ISDB5ShzfVwLytddhnP+2/cBQE0EmJfTKsgsRwmDICX80m
 X1nj1mT339mznz0NMQ2SPrqJkwozjw0RoqI3XhehlBBiBleN+Yzs1uiZWcXKsV2GpwjY
 SQNxHjqzLJyGg+R1eFqfFLOaIVxRs1os5sT3apSlOEubukNNK1xoTtCUAmkAxY93O0Us
 uxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679012012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+9drRYcPap8x0rvwcbFK9iA3EPw67rquBQoOyVcYNs=;
 b=NQhgLMN77nycBjC4x2ULKL4evbc6p9K5/xP/eV1iWgTVlrpPu9BPvKkN0gOF9hy2JD
 nxOcwv5rfoFs/qPJXkmdW6NgZGxCv8L557+HGw8VMxB9Hf1HZIXsZlo1N43wTxhgGbVg
 c8MZAKSw5f6FH3tOZ/BbuWvnuHXS+HbE52XDu4KhD3Yhg13lLxGnBEvQRbvBPgTvr2Iw
 fa3A6E55Qyw/97xFdKW7LeBbDR3eLlByyqVVyvrGZ5lYa9bm+BcAQAABemlckTNvxIgK
 czz1kCR4vzvwyzUkCI7bcfBEoCBcHSAf1uDYttX7HzyPVCVPn0K6zx9k5N3Hn9ykLdv2
 m6Tw==
X-Gm-Message-State: AO0yUKXZWpcOd+G1+Y/nroPlMdni3hJJrNb5csap6ROnQZQiT3TZKYI6
 9T5klQRfhTjFpw61eUu6Bk4=
X-Google-Smtp-Source: AK7set8fiz263uCYen3lHp//sIQS1iAaJnei3B15SzOjq1iSBMmxkbzTN2QH6GvONU+ODHLz+O+Uqg==
X-Received: by 2002:a05:6512:3f07:b0:4da:ffa0:3f21 with SMTP id
 y7-20020a0565123f0700b004daffa03f21mr286839lfa.14.1679012012232; 
 Thu, 16 Mar 2023 17:13:32 -0700 (PDT)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 y17-20020ac24211000000b004ddaea30ba6sm97776lfh.235.2023.03.16.17.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 17:13:32 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 3/4] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
Date: Fri, 17 Mar 2023 01:12:05 +0100
Message-Id: <20230317001203.18425-4-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
References: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x12c.google.com
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


