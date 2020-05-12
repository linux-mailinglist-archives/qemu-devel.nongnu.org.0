Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC221CED50
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 08:52:54 +0200 (CEST)
Received: from localhost ([::1]:50502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYOmb-0000cE-QP
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 02:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1jYOkk-0006SB-AB
 for qemu-devel@nongnu.org; Tue, 12 May 2020 02:50:58 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1jYOkd-0003Vk-VL
 for qemu-devel@nongnu.org; Tue, 12 May 2020 02:50:58 -0400
Received: by mail-pf1-x443.google.com with SMTP id f7so5917802pfa.9
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XIE8tcfmr9KiAKJsz4GBMxjUe5fuqMt4TnUdfIsEbOc=;
 b=T1XhYR9FqTCJ8AO/C2GEZKBb5SSYHgc7uvTWBspgJN7qtyvj14b7AuAHaQQvShD7CJ
 U8QnabjDju/bbIGNgXwUYW1REz8Rs5NfeWiMlbo/Frr1F9bg3Kr5/WLtD0MJqXiZJG8P
 rHW8abRdRg14J1eIZ7NmWr4nKdN7bhiQBD6Z95i/hQ84ojzVb3fLe3XsuOGF64tfnCia
 5m0/jBwQovM7ovzaMhysTVWH0GkbCT644NTxuPCDg2x/zbwEjLEB0thjWTSsdOIqwl4Y
 oVJ47ElR4HdcANNLfxrwYmi8HiCxOBhBOrVYnr3LEz90gdkL4oHxD6F39hWrYOTJA4h0
 XGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XIE8tcfmr9KiAKJsz4GBMxjUe5fuqMt4TnUdfIsEbOc=;
 b=j2Mc77GV0htfjjpTZYeLvcGOA6tl/hiBdox400XiNEDu0e9pwD+R4yxGBGTiH+ZF5n
 AcVs5LN0F+lzbEmeBNAXjI+cDsNJsxiEh6l2bKy3TTw0sHvM3EFfFexqYVMeldP0a/ux
 k/9GmX+JJapTZphprpvwD4x7F7h1H55i8zFACV71zSm/Q8wctDMN/FbdYhoFQdYUUoS5
 Yre2G9GnUSStL+dO1m5/PYTGCldBYOUSgB8XEhsCLd2IhQaYpMiaeigy7Roq6vkoiMXt
 dxJK+xYctN4f9boMmIMvqRiZE0mTM/Niy1az3/cY4xqc8R29fvPiNWHRhyFJ12tVnzik
 XvRg==
X-Gm-Message-State: AGi0PubGnWL/hmkTc+ujFLrmXuhn859yq2x9lW83RLnHqDEOiD1ZhEYu
 fGRDnIOvK84fBJ+HG+y0uKI=
X-Google-Smtp-Source: APiQypJmGp3sWlBUGlzrUUTR+QRrQ6V6RWCqjvR4QpNc4Gp32JriELRhjbzIShz/ElngFDEI415MZw==
X-Received: by 2002:a62:1801:: with SMTP id 1mr19843974pfy.230.1589266249655; 
 Mon, 11 May 2020 23:50:49 -0700 (PDT)
Received: from localhost.localdomain ([75.167.104.59])
 by smtp.gmail.com with ESMTPSA id j7sm11837286pjy.9.2020.05.11.23.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:50:49 -0700 (PDT)
From: Paul Zimmerman <pauldzim@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v5 6/7] wire in the dwc-hsotg (dwc2) USB host controller
 emulation
Date: Mon, 11 May 2020 23:48:59 -0700
Message-Id: <20200512064900.28554-7-pauldzim@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512064900.28554-1-pauldzim@gmail.com>
References: <20200512064900.28554-1-pauldzim@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=pauldzim@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paul Zimmerman <pauldzim@gmail.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wire the dwc-hsotg (dwc2) emulation into Qemu

Reviewed-by: Philippe Mathieu-Daude <f4bug@amsat.org>
Signed-off-by: Paul Zimmerman <pauldzim@gmail.com>
---
 hw/arm/bcm2835_peripherals.c         | 21 ++++++++++++++++++++-
 include/hw/arm/bcm2835_peripherals.h |  3 ++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 5e2c832d95..3b554cfac0 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -128,6 +128,13 @@ static void bcm2835_peripherals_init(Object *obj)
     sysbus_init_child_obj(obj, "mphi", &s->mphi, sizeof(s->mphi),
                           TYPE_BCM2835_MPHI);
 
+    /* DWC2 */
+    sysbus_init_child_obj(obj, "dwc2", &s->dwc2, sizeof(s->dwc2),
+                          TYPE_DWC2_USB);
+
+    object_property_add_const_link(OBJECT(&s->dwc2), "dma-mr",
+                                   OBJECT(&s->gpu_bus_mr), &error_abort);
+
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
                                    OBJECT(&s->sdhci.sdbus), &error_abort);
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
@@ -385,6 +392,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_HOSTPORT));
 
+    /* DWC2 */
+    object_property_set_bool(OBJECT(&s->dwc2), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, USB_OTG_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dwc2), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->dwc2), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_USB));
+
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
@@ -398,7 +418,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
-    create_unimp(s, &s->dwc2, "dwc-usb2", USB_OTG_OFFSET, 0x1000);
     create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
 }
 
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 7a7a8f6141..48a0ad1633 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -27,6 +27,7 @@
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
 #include "hw/timer/bcm2835_systmr.h"
+#include "hw/usb/hcd-dwc2.h"
 #include "hw/misc/unimp.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
@@ -67,7 +68,7 @@ typedef struct BCM2835PeripheralState {
     UnimplementedDeviceState ave0;
     UnimplementedDeviceState bscsl;
     UnimplementedDeviceState smi;
-    UnimplementedDeviceState dwc2;
+    DWC2State dwc2;
     UnimplementedDeviceState sdramc;
 } BCM2835PeripheralState;
 
-- 
2.17.1


