Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC94A6E8F3B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAE-0000cg-Ts; Thu, 20 Apr 2023 06:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA4-0000Xj-3k
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:08 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppR9z-0003et-Qb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so445721f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985101; x=1684577101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Gpk2O9QYMWltB8kuw8C1EvNPkPN/lY6R3pJGRRQ85tA=;
 b=NzY9mES7ibVQWezGS/1/9Ya/Y75yfYJY01EOAQmpITdCvr+57HmxuTgcU3XeNZH5ao
 vDdakdeeTTKQaspjyfzM5W5Vwr8jfcxrbCfJhtO6SkpYCdL69UAWMh0UB1RaJYwpy8Uo
 OKOsLc+h4/lTaTuKxz/lLJEspG2T5iYE05oyp3nl/YqFo/2t/kTpktzsVmR+XnYp+l7W
 lwvBJYPE3pN5KiQTn4N6FQrEw537F6PiJNmlk8/zSrYHMPMs6EIxtl6/UGqvaXgqz/yD
 m9W5g7r9TUP/YUi+XEwF7+FHfUaPcNJjYZcvEgM6cmgChtgRk3dpHdmmQO3+b4bp2PBo
 w7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985101; x=1684577101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gpk2O9QYMWltB8kuw8C1EvNPkPN/lY6R3pJGRRQ85tA=;
 b=RMVZXoyOhF5hY6596kJu35HaEvHvx92C1Pm99fmC+kXHri6gvvhsjFAsDFZ9cdBJYE
 4xGcRG1HLqBoBBWGFF/Pbh3zVDC6zMuRkv7lqR9g8lvKhxCgbdw/mFptoo1c6Y4beRpA
 CgAex9k5hvE/cVzQcvx3p4jWqBIlXOGFOBuP3/IW5l0A1QqrJKn3/IEsYW2AR9PFhOTP
 MS+EsXAO7nH3fjViLnds8cFpxN6ucVNujLvfQow7G5lSIjnSZCeZls7B7g9bgIUL70y+
 aAtV4y5zaJpa0U7tMd5sbeFcy4gajho+hsWvi9sOw61BQCkjS9r5VUTU+M1YV47GxAHs
 EOZg==
X-Gm-Message-State: AAQBX9cGDTOkxMcn4RqUQO8t1US92jMPGA4CMt6sxmp9naiD7W2mMyG3
 toVAkeg9Ccp/8eGdXMClrGMMnwBLD3r0j0cXKHI=
X-Google-Smtp-Source: AKy350Z208x9WAr9xpGai+AManqTvX6QhZib5cndRVex0AYR73CCFlcIbZAuDuXJOVUsl9qUpqxBqQ==
X-Received: by 2002:adf:ee8f:0:b0:2f8:ddce:f838 with SMTP id
 b15-20020adfee8f000000b002f8ddcef838mr784848wro.21.1681985101487; 
 Thu, 20 Apr 2023 03:05:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] hw/arm: Add WDT to Allwinner-A10 and Cubieboard
Date: Thu, 20 Apr 2023 11:04:39 +0100
Message-Id: <20230420100456.944969-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

This patch adds WDT to Allwinner-A10 and Cubieboard.
WDT is added as an overlay to the Timer module memory map.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20230326202256.22980-3-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cubieboard.rst | 1 +
 include/hw/arm/allwinner-a10.h | 2 ++
 hw/arm/allwinner-a10.c         | 7 +++++++
 hw/arm/Kconfig                 | 1 +
 4 files changed, 11 insertions(+)

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
index 8d485f5435a..58c4a2d3ea6 100644
--- a/docs/system/arm/cubieboard.rst
+++ b/docs/system/arm/cubieboard.rst
@@ -15,3 +15,4 @@ Emulated devices:
 - USB controller
 - SATA controller
 - TWI (I2C) controller
+- Watchdog timer
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 095afb225d6..cd1465c6138 100644
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
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index b7ca795c712..b0ea3f7f662 100644
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
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index db1105c7175..338dabce427 100644
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
-- 
2.34.1


