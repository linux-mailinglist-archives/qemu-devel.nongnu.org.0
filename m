Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB3586BF3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:28:32 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVTD-0005Do-J0
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVDS-0005vf-2z; Mon, 01 Aug 2022 09:12:14 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:49329
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVDN-0007OW-61; Mon, 01 Aug 2022 09:12:13 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxJS54zKqz4xGZ;
 Mon,  1 Aug 2022 23:12:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxJS31sRlz4xGQ;
 Mon,  1 Aug 2022 23:12:02 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 19/19] ppc/ppc405: QOM'ify I2C
Date: Mon,  1 Aug 2022 15:10:39 +0200
Message-Id: <20220801131039.1693913-20-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801131039.1693913-1-clg@kaod.org>
References: <20220801131039.1693913-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having an explicit I2C model object will help if one day we want to
add I2C devices on the bus.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    |  2 ++
 hw/ppc/ppc405_uc.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index c2cfccb9d106..0b1e15c18fe0 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -28,6 +28,7 @@
 #include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/intc/ppc-uic.h"
+#include "hw/i2c/ppc4xx_i2c.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
 #define PPC405EP_NVRAM_BASE 0xF0000000
@@ -256,6 +257,7 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
+    PPC4xxI2CState i2c;
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 0336d1e08689..5372c308c227 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1461,6 +1461,8 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
+    object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
+
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
@@ -1572,8 +1574,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* I2C controller */
-    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
-                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, 0xef600500);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
+                       qdev_get_gpio_in(DEVICE(&s->uic), 2));
 
     /* GPIO */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
-- 
2.37.1


