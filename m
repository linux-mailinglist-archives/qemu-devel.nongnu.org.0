Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DDD3FD88E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:18:49 +0200 (CEST)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOGW-0005rs-8n
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcd-0007EC-LS
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcU-0005zf-7E
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:34 -0400
Received: by mail-wr1-x430.google.com with SMTP id v10so3744065wrd.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j83XUPV97J381oMF7qSvoBGESd0UTWy6ZMCHvkTRW4Y=;
 b=qtNIt07tA70+/bC4lF7JqB03lYM/9futLrbWLQ7IJ/8pX1iEqkHruzXy+bW7QKDHaU
 PNudWrJ3FFHegi3G6RdxYeSAhd3OsPwne5e4EokZhhCXshBNmSCS30odAiFzhkAiGppy
 XgxMvyFd6jSJyBd4w249WhM4dAfgsyDkG2+e1YciJh5CcJzs2Z3bsnX/OkxwUE+LKlpA
 6fbYUVUHw2DwqVrJJwqpke+9jXpTnrpIbIUhpOjeS94MwTLZ5246MvpoXif1pQRS7A3a
 Rez+O6veLfpUkaUOD5IzQFMzb9VpjtcGp1ULqIVrn6akGIgL4bLb5uxRKwbSivpE/MBJ
 38Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j83XUPV97J381oMF7qSvoBGESd0UTWy6ZMCHvkTRW4Y=;
 b=o0Tv2Pms7kl1OORSDWMKvgBbgn8k2jSRLFXL1C4paEPbMbyi3lEwVPePVf2WtxEzQl
 uzf2O8d0JYBlfKMtPi5nwphg1PfETgTT/HVRde1c3qCe7hMZY/MUDKHm97rPvAZfaU6W
 uzlDiuB1h5uIyDlVEoF/jV/IHsw8cLQjhA5wvQdaGN6g3fKqAiB2UZtPcsIESFV0A+aR
 u8+Tk5C4zqq7qgBSdwKtBgvM9Doc7CspH7N/8nRYwaQk4X+EbdDqCabzyw7ej83YobbE
 HD5dG71yONmcWO56CPPpRc/Gm/i3HISz5iH5XODnJLlHkgNzmWbbqsmpLjF0iSZMqmys
 N5/Q==
X-Gm-Message-State: AOAM530OOTlwc21csa+cQzgMuTxq+obcTp9FZXlgoSLzv8VNb6RHo2cU
 LLomDUgrMADmF1+YURlvf9x3hhg4EpIFfA==
X-Google-Smtp-Source: ABdhPJybbfxVVP2uIoVKeWMIgi4YfSZWhZcYSTf35xc9cj3ym9z6Yew26voETnyoBTuHeKIEjPGVVg==
X-Received: by 2002:adf:c148:: with SMTP id w8mr29040415wre.317.1630492643919; 
 Wed, 01 Sep 2021 03:37:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/51] hw/arm/stellaris: split stellaris_sys_init()
Date: Wed,  1 Sep 2021 11:36:44 +0100
Message-Id: <20210901103653.13435-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Message-id: 20210812093356.1946-17-peter.maydell@linaro.org
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


