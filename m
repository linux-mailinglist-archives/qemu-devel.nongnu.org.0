Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858842F4FAC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:17:34 +0100 (CET)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzipx-0000Dv-I6
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikO-0003Hj-QR; Wed, 13 Jan 2021 11:11:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39950
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikN-0001QX-68; Wed, 13 Jan 2021 11:11:48 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikT-0001mR-GN; Wed, 13 Jan 2021 16:11:57 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Wed, 13 Jan 2021 16:11:23 +0000
Message-Id: <20210113161128.3156-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113161128.3156-1-mark.cave-ayland@ilande.co.uk>
References: <20210113161128.3156-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 2/7] mac_oldworld: move initialisation of grackle before
 heathrow
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

In order to move the heathrow PIC to the macio device, the PCI bus needs to be
initialised before the macio device and also before wiring the PIC IRQs.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20201229175619.6051-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_oldworld.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 2ead34bdf1..e58e0525fe 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -227,6 +227,21 @@ static void ppc_heathrow_init(MachineState *machine)
         }
     }
 
+    /* Grackle PCI host bridge */
+    dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
+    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+
+    sysbus_mmio_map(s, 0, GRACKLE_BASE);
+    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
+    /* PCI hole */
+    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
+                                sysbus_mmio_get_region(s, 2));
+    /* Register 2 MB of ISA IO space */
+    memory_region_add_subregion(get_system_memory(), 0xfe000000,
+                                sysbus_mmio_get_region(s, 3));
+
     /* XXX: we register only 1 output pin for heathrow PIC */
     pic_dev = qdev_new(TYPE_HEATHROW);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pic_dev), &error_fatal);
@@ -251,21 +266,6 @@ static void ppc_heathrow_init(MachineState *machine)
         tbfreq = TBFREQ;
     }
 
-    /* Grackle PCI host bridge */
-    dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
-    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-
-    sysbus_mmio_map(s, 0, GRACKLE_BASE);
-    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
-    /* PCI hole */
-    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
-                                sysbus_mmio_get_region(s, 2));
-    /* Register 2 MB of ISA IO space */
-    memory_region_add_subregion(get_system_memory(), 0xfe000000,
-                                sysbus_mmio_get_region(s, 3));
-
     for (i = 0; i < 4; i++) {
         qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x15 + i));
     }
-- 
2.20.1


