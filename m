Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C4A6AC58D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCra-0004I8-FE; Mon, 06 Mar 2023 10:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrY-0004Fh-8U
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrW-00029T-GC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so8488845wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AGvJ/+azoSfvbLgBtU0OVWx+UNPYGoxdaOuHi65PSgM=;
 b=fpbTlwWYYoWygDUytIlUL8CCvs8bPYKhK5NN4ia4MK5Wy09VMJswKAUagxwcz3M0E8
 4L4QFT2MwMak3tX8HY1atnOoaaeiS6H1ziPZ+yNjiYY7F6/Djo9afh1jt+U8W4oyYkkL
 Ft51O6tz8kTQntzJOpRZ+BwIxxWtSMIXjNC7NsJawTT7TSDhg48yyZV1bgXTzgzlQKsf
 s6Si/lQ4+sAe1EhMXgBeBW45lJDuNFEVQrQh8BRufrzEAACyIgo9NUEzg+lXRifjBnol
 tt0QQthyFPC7x5W8Vfloz2I4MOp9QJJNbRKYdlBI3xAsfess1BBI+/B+b1Yaf09bBo6v
 yASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGvJ/+azoSfvbLgBtU0OVWx+UNPYGoxdaOuHi65PSgM=;
 b=Y+/nep4cFlla+MGKiGhRK5lVuRNiy8ED5fIvveiVP+AtGsS0yBZQcclBvU2+/CnvV0
 3u2jdqcJzQlqVnvDXWdArar196hbhrtqdcSLUPHMHTJkS5VX93lgfh/+sQltF/iIyWjL
 MSPZqTBgc69JGAGCYsE+P2dca6w69B7XQTfSWJkmcmXrA5bLJ+AJLx97XU0o+rreTq3t
 mNfpue7QVr77nInvPSkkDXb+tdoJ63t/h+D8HzahhLUrsS/cRYZZORdTcBNzl3NJdOCq
 OsHz455Mr7xS/RC48f8abyF4CMcF8mFlK+J/atm3cNKQ9yWPR5Do2ECU2xOjPSuLBDzy
 wvnA==
X-Gm-Message-State: AO0yUKUYsmWyT7daNj+l8D+lj+GlV2cZlJgHc2MKEzG68UJYfaI0Mqvz
 XmRejM1VvZZa9D7yHG+0B7WBEOxvGrsStGB0E8U=
X-Google-Smtp-Source: AK7set/Ov66OucYv2v4zPP+WCoooLMGeb86ORpi6mQZFUQLvSAdZxInYkUcpcUqetuLO3Bt2StW/lw==
X-Received: by 2002:a05:600c:3153:b0:3ea:f73e:9d8c with SMTP id
 h19-20020a05600c315300b003eaf73e9d8cmr9960394wmo.16.1678116893785; 
 Mon, 06 Mar 2023 07:34:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] hw: arm: allwinner-h3: Fix and complete H3 i2c devices
Date: Mon,  6 Mar 2023 15:34:35 +0000
Message-Id: <20230306153435.490894-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: qianfan Zhao <qianfanguijin@163.com>

Allwinner h3 has 4 twi(i2c) devices named twi0, twi1, twi2 and r_twi.
The registers are compatible with TYPE_AW_I2C_SUN6I, write 1 to clear
control register's INT_FLAG bit.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/allwinner-h3.h |  6 ++++++
 hw/arm/allwinner-h3.c         | 29 +++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 1d7ce205890..59e0f822d2d 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -84,6 +84,8 @@ enum {
     AW_H3_DEV_UART3,
     AW_H3_DEV_EMAC,
     AW_H3_DEV_TWI0,
+    AW_H3_DEV_TWI1,
+    AW_H3_DEV_TWI2,
     AW_H3_DEV_DRAMCOM,
     AW_H3_DEV_DRAMCTL,
     AW_H3_DEV_DRAMPHY,
@@ -93,6 +95,7 @@ enum {
     AW_H3_DEV_GIC_VCPU,
     AW_H3_DEV_RTC,
     AW_H3_DEV_CPUCFG,
+    AW_H3_DEV_R_TWI,
     AW_H3_DEV_SDRAM
 };
 
@@ -133,6 +136,9 @@ struct AwH3State {
     AwSidState sid;
     AwSdHostState mmc0;
     AWI2CState i2c0;
+    AWI2CState i2c1;
+    AWI2CState i2c2;
+    AWI2CState r_twi;
     AwSun8iEmacState emac;
     AwRtcState rtc;
     GICState gic;
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index bfce3c8d92a..69d0ad6f50e 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -54,6 +54,8 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_DEV_UART2]      = 0x01c28800,
     [AW_H3_DEV_UART3]      = 0x01c28c00,
     [AW_H3_DEV_TWI0]       = 0x01c2ac00,
+    [AW_H3_DEV_TWI1]       = 0x01c2b000,
+    [AW_H3_DEV_TWI2]       = 0x01c2b400,
     [AW_H3_DEV_EMAC]       = 0x01c30000,
     [AW_H3_DEV_DRAMCOM]    = 0x01c62000,
     [AW_H3_DEV_DRAMCTL]    = 0x01c63000,
@@ -64,6 +66,7 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_DEV_GIC_VCPU]   = 0x01c86000,
     [AW_H3_DEV_RTC]        = 0x01f00000,
     [AW_H3_DEV_CPUCFG]     = 0x01f01c00,
+    [AW_H3_DEV_R_TWI]      = 0x01f02400,
     [AW_H3_DEV_SDRAM]      = 0x40000000
 };
 
@@ -107,8 +110,6 @@ struct AwH3Unimplemented {
     { "uart1",     0x01c28400, 1 * KiB },
     { "uart2",     0x01c28800, 1 * KiB },
     { "uart3",     0x01c28c00, 1 * KiB },
-    { "twi1",      0x01c2b000, 1 * KiB },
-    { "twi2",      0x01c2b400, 1 * KiB },
     { "scr",       0x01c2c400, 1 * KiB },
     { "gpu",       0x01c40000, 64 * KiB },
     { "hstmr",     0x01c60000, 4 * KiB },
@@ -123,7 +124,6 @@ struct AwH3Unimplemented {
     { "r_prcm",    0x01f01400, 1 * KiB },
     { "r_twd",     0x01f01800, 1 * KiB },
     { "r_cir-rx",  0x01f02000, 1 * KiB },
-    { "r_twi",     0x01f02400, 1 * KiB },
     { "r_uart",    0x01f02800, 1 * KiB },
     { "r_pio",     0x01f02c00, 1 * KiB },
     { "r_pwm",     0x01f03800, 1 * KiB },
@@ -151,8 +151,11 @@ enum {
     AW_H3_GIC_SPI_UART2     =  2,
     AW_H3_GIC_SPI_UART3     =  3,
     AW_H3_GIC_SPI_TWI0      =  6,
+    AW_H3_GIC_SPI_TWI1      =  7,
+    AW_H3_GIC_SPI_TWI2      =  8,
     AW_H3_GIC_SPI_TIMER0    = 18,
     AW_H3_GIC_SPI_TIMER1    = 19,
+    AW_H3_GIC_SPI_R_TWI     = 44,
     AW_H3_GIC_SPI_MMC0      = 60,
     AW_H3_GIC_SPI_EHCI0     = 72,
     AW_H3_GIC_SPI_OHCI0     = 73,
@@ -227,7 +230,10 @@ static void allwinner_h3_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN6I);
 
-    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C);
+    object_initialize_child(obj, "twi0",  &s->i2c0,  TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -432,6 +438,21 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
                        qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI0));
 
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c1), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c1), 0, s->memmap[AW_H3_DEV_TWI1]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c1), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI1));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c2), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c2), 0, s->memmap[AW_H3_DEV_TWI2]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c2), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI2));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->r_twi), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->r_twi), 0, s->memmap[AW_H3_DEV_R_TWI]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_R_TWI));
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
         create_unimplemented_device(unimplemented[i].device_name,
-- 
2.34.1


