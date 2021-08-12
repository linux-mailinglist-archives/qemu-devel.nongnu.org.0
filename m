Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C161C3EA232
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:39:41 +0200 (CEST)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7Bc-0004sW-Ni
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76R-0005gt-Rv
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0007xc-3p
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id k4so3998643wms.3
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziCsEIjr/6TL4DulcAYvJ5WYZ2Dy4YbpYnG7GIAD+KQ=;
 b=uLI4GHlrahoEjmoi9UbRyyOH2CvIYVp0nKK6wuNVR9wIej28PUgEpsdbdhQWId79ub
 piv5iObOY/1xfZZ0HKGLSs+kqOaFPBmzU/Q1wpL3Z9Tnqczi7pj+tBjDZ7Vt32MxSZZl
 P3zQuCkF67R2WmeNB20rvd2T2qxFQT4E6JR60GwRGp98xBosY1FN8mPKKR9F1z3mrJUr
 8UlU0Zk4XBtsXEFggXGcuxe31k1wZdZ7/Znoh1g6UFm3Sb/iTs+x5okkbI04uWGX6xr+
 X74QsoqSHneNy/Rrj5yET5HbJ0JMorDiv8DdVouhdYxYK6vdz+S820b8/35LZD152EEm
 Dwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziCsEIjr/6TL4DulcAYvJ5WYZ2Dy4YbpYnG7GIAD+KQ=;
 b=NhVvHsVwLaHT6D6SFCYiV+MkOCXpqPRN4eiH6aYca4FAuseE938I8KaCPd8KCaOKxe
 nA2ulrqx3QAILLIb+eSpcYUUcfqyxRiGLW+JodNmKMfpVaGzgc9YwFzbA8MEkCaLy21y
 vCDR80/lmb6HanXneSLdfhg90Q75LwKKv1BlHwkSGnBjo/Zp1H7XbYtcWY0ydgmmcRXP
 THJFZeVBVZmkzeqzwyMy+oWoldPBpVPwgDsq3Lo/Hbvnd9oB1l59QI+hnpe7wi4QAkeW
 zNPrrlVT5aCzEkIFoDh0rSDYBDsj7Xq2HdIGQQHvwM8FaYzC9zwnV7UbuB8oo29FXnd8
 +G8A==
X-Gm-Message-State: AOAM530G3dkL5GCnBX7Fa9OH2Kk3PhY15jXG0lPnvySTELVAUie74Jlz
 LTcmaw7Iabr+nXHlSOv8smDdUQ==
X-Google-Smtp-Source: ABdhPJzfZwInhL8G2jZEVr9C6XfJXwEHjYi1sVc93LpHtzvM3iQIT5p+/FhwzzxsVHXqLATEa1ttXg==
X-Received: by 2002:a1c:27c5:: with SMTP id n188mr1085350wmn.126.1628760854226; 
 Thu, 12 Aug 2021 02:34:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 16/25] hw/arm/stellaris: split stellaris_sys_init()
Date: Thu, 12 Aug 2021 10:33:47 +0100
Message-Id: <20210812093356.1946-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the stellaris_sys_init() function creates the
TYPE_STELLARIS_SYS object, sets its properties, realizes it, maps its
MMIO region and connects its IRQ.  In order to support wiring the
sysclk up to the armv7m object, we need to split this function apart,
because to connect the clock output of the STELLARIS_SYS object to
the armv7m object we need to create the STELLARIS_SYS object before
the armv7m object, but we can't wire up the IRQ until after we've
created the armv7m object.

Remove the stellaris_sys_init() function, and instead put the
create/configure/realize parts before we create the armv7m object and
the mmio/irq connection parts afterwards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 56 +++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index ad48cf26058..bf24abd44fd 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -755,33 +755,6 @@ static void stellaris_sys_instance_init(Object *obj)
     s->sysclk = qdev_init_clock_out(DEVICE(s), "SYSCLK");
 }
 
-static DeviceState *stellaris_sys_init(uint32_t base, qemu_irq irq,
-                                       stellaris_board_info *board,
-                                       uint8_t *macaddr)
-{
-    DeviceState *dev = qdev_new(TYPE_STELLARIS_SYS);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-
-    /* Most devices come preprogrammed with a MAC address in the user data. */
-    qdev_prop_set_uint32(dev, "user0",
-                         macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16));
-    qdev_prop_set_uint32(dev, "user1",
-                         macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16));
-    qdev_prop_set_uint32(dev, "did0", board->did0);
-    qdev_prop_set_uint32(dev, "did1", board->did1);
-    qdev_prop_set_uint32(dev, "dc0", board->dc0);
-    qdev_prop_set_uint32(dev, "dc1", board->dc1);
-    qdev_prop_set_uint32(dev, "dc2", board->dc2);
-    qdev_prop_set_uint32(dev, "dc3", board->dc3);
-    qdev_prop_set_uint32(dev, "dc4", board->dc4);
-
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_mmio_map(sbd, 0, base);
-    sysbus_connect_irq(sbd, 0, irq);
-
-    return dev;
-}
-
 /* I2C controller.  */
 
 #define TYPE_STELLARIS_I2C "stellaris-i2c"
@@ -1349,6 +1322,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     DeviceState *ssys_dev;
     int i;
     int j;
+    uint8_t *macaddr;
 
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *flash = g_new(MemoryRegion, 1);
@@ -1366,6 +1340,26 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                            &error_fatal);
     memory_region_add_subregion(system_memory, 0x20000000, sram);
 
+    /*
+     * Create the system-registers object early, because we will
+     * need its sysclk output.
+     */
+    ssys_dev = qdev_new(TYPE_STELLARIS_SYS);
+    /* Most devices come preprogrammed with a MAC address in the user data. */
+    macaddr = nd_table[0].macaddr.a;
+    qdev_prop_set_uint32(ssys_dev, "user0",
+                         macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16));
+    qdev_prop_set_uint32(ssys_dev, "user1",
+                         macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16));
+    qdev_prop_set_uint32(ssys_dev, "did0", board->did0);
+    qdev_prop_set_uint32(ssys_dev, "did1", board->did1);
+    qdev_prop_set_uint32(ssys_dev, "dc0", board->dc0);
+    qdev_prop_set_uint32(ssys_dev, "dc1", board->dc1);
+    qdev_prop_set_uint32(ssys_dev, "dc2", board->dc2);
+    qdev_prop_set_uint32(ssys_dev, "dc3", board->dc3);
+    qdev_prop_set_uint32(ssys_dev, "dc4", board->dc4);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(ssys_dev), &error_fatal);
+
     nvic = qdev_new(TYPE_ARMV7M);
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
@@ -1375,6 +1369,10 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     /* This will exit with an error if the user passed us a bad cpu_type */
     sysbus_realize_and_unref(SYS_BUS_DEVICE(nvic), &error_fatal);
 
+    /* Now we can wire up the IRQ and MMIO of the system registers */
+    sysbus_mmio_map(SYS_BUS_DEVICE(ssys_dev), 0, 0x400fe000);
+    sysbus_connect_irq(SYS_BUS_DEVICE(ssys_dev), 0, qdev_get_gpio_in(nvic, 28));
+
     if (board->dc1 & (1 << 16)) {
         dev = sysbus_create_varargs(TYPE_STELLARIS_ADC, 0x40038000,
                                     qdev_get_gpio_in(nvic, 14),
@@ -1397,10 +1395,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         }
     }
 
-    ssys_dev = stellaris_sys_init(0x400fe000, qdev_get_gpio_in(nvic, 28),
-                                  board, nd_table[0].macaddr.a);
-
-
     if (board->dc1 & (1 << 3)) { /* watchdog present */
         dev = qdev_new(TYPE_LUMINARY_WATCHDOG);
 
-- 
2.20.1


