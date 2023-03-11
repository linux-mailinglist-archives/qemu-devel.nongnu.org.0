Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F86B5CF7
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 15:43:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb0QE-000433-Ds; Sat, 11 Mar 2023 09:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0QB-00041m-FV; Sat, 11 Mar 2023 09:42:07 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0Q9-0002o1-PH; Sat, 11 Mar 2023 09:42:07 -0500
Received: by mail-lf1-x133.google.com with SMTP id bp27so36718lfb.6;
 Sat, 11 Mar 2023 06:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678545724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQyfudqt+hsBlbV+O4406nNeH2P74SLw55o4TH/T4p0=;
 b=V8WS1qPVHiCeE5xxmsk2/3db0/6S541wZ4vC6HsCK30T68N+R2/dlqzYRlLLeJ2GRG
 dnEYRZCpvQn2ste3gNN4JIxgtWj6lWY92GF8qg0X9+jL1TE8qv/4HQw9DI2cWDAxISD/
 yw7wv92iJtqgtaYis+E5PkY9O7IiTheQr7/8HaUNEzXcVruLeYttZeyrkJLIDLXxg5LQ
 D05sx2iRj9YY9VG6lsVY4OC3yeaSgxGp+/8nfczRg6e2ezZg1lg8iQbBQ7DNCYveGauP
 T9gm47m5bumRBkkE5+sgu1K3S2npVNT0cETHTQ00xROq1hrlUh6AR2EDvs5rwrWLlg6D
 Ng3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678545724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UQyfudqt+hsBlbV+O4406nNeH2P74SLw55o4TH/T4p0=;
 b=fRzdc7BHrcpjYGpRUFXVvedyZ9OJuq4HN3fWToA5PVCM6YTL1uqU6qBPCvQuTXUwso
 Ff4qck7EuYTUGAe8ZXDIEM+OO8/O30+cqi+8Zd65M+aVUZm7yCq8RrHg8z1W610SthP4
 5d2qqPMR3P+gcajrs9HH8u6eurQm8LbKPGdMuMi9Mh9vpr6DPB4KkKWhB5ZRTZzrEP2j
 u938eaH3O74yA2N73ob8m0l1Vs/vN8rDygV7U5aUXeMAVTR7513atGo5F2Nce0aHIYiR
 J04lzYJkje8hUKJQPNoCQC5T/DOecakPW8Uif2l7jxkDh92zSIL6VAY3RmN9rQh4DwR5
 wN3g==
X-Gm-Message-State: AO0yUKWObOV/7E7tRB9BRLmYqsJCDXQgXMsi77HO+KoRkIuWj1Asliap
 easVqOAwXidJXC4aSBRPUOe+2+pxfwYgJdKq+cc=
X-Google-Smtp-Source: AK7set+oZg2R6uehoaiRnBrEnfdMqi6GLAIayY0c1fXQ/ARdc8VQVWyIhcFq3JnmB3RjhbmMRX/DDQ==
X-Received: by 2002:ac2:5fa7:0:b0:4b5:26f3:2247 with SMTP id
 s7-20020ac25fa7000000b004b526f32247mr7664918lfe.69.1678545723802; 
 Sat, 11 Mar 2023 06:42:03 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 g15-20020a19ee0f000000b004d887e0e9edsm333320lfb.168.2023.03.11.06.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 06:42:03 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 2/4] hw/arm: Add WDT to Allwinner-A10 and Cubieboard
Date: Sat, 11 Mar 2023 15:41:09 +0100
Message-Id: <20230311144111.30468-3-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This patch adds WDT to Allwinner-A10 and Cubieboard.
WDT is added as an overlay to the Timer module memory map.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 docs/system/arm/cubieboard.rst | 1 +
 hw/arm/Kconfig                 | 1 +
 hw/arm/allwinner-a10.c         | 7 +++++++
 include/hw/arm/allwinner-a10.h | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
index 8d485f5435..58c4a2d3ea 100644
--- a/docs/system/arm/cubieboard.rst
+++ b/docs/system/arm/cubieboard.rst
@@ -15,3 +15,4 @@ Emulated devices:
 - USB controller
 - SATA controller
 - TWI (I2C) controller
+- Watchdog timer
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..ec15248536 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -325,6 +325,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_PIC
     select ALLWINNER_A10_CCM
     select ALLWINNER_A10_DRAMC
+    select ALLWINNER_WDT
     select ALLWINNER_EMAC
     select ALLWINNER_I2C
     select AXP209_PMU
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index b7ca795c71..b0ea3f7f66 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -38,6 +38,7 @@
 #define AW_A10_EHCI_BASE        0x01c14000
 #define AW_A10_OHCI_BASE        0x01c14400
 #define AW_A10_SATA_BASE        0x01c18000
+#define AW_A10_WDT_BASE         0x01c20c90
 #define AW_A10_RTC_BASE         0x01c20d00
 #define AW_A10_I2C0_BASE        0x01c2ac00
 
@@ -92,6 +93,8 @@ static void aw_a10_init(Object *obj)
     object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN4I);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN4I);
+
+    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN4I);
 }
 
 static void aw_a10_realize(DeviceState *dev, Error **errp)
@@ -203,6 +206,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, AW_A10_I2C0_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0, qdev_get_gpio_in(dev, 7));
+
+    /* WDT */
+    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0, AW_A10_WDT_BASE, 1);
 }
 
 static void aw_a10_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 095afb225d..cd1465c613 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -13,6 +13,7 @@
 #include "hw/misc/allwinner-a10-ccm.h"
 #include "hw/misc/allwinner-a10-dramc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "hw/watchdog/allwinner-wdt.h"
 #include "sysemu/block-backend.h"
 
 #include "target/arm/cpu.h"
@@ -41,6 +42,7 @@ struct AwA10State {
     AwSdHostState mmc0;
     AWI2CState i2c0;
     AwRtcState rtc;
+    AwWdtState wdt;
     MemoryRegion sram_a;
     EHCISysBusState ehci[AW_A10_NUM_USB];
     OHCISysBusState ohci[AW_A10_NUM_USB];
-- 
2.30.2


