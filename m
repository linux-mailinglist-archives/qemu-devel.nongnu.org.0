Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DD597300
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:31:49 +0200 (CEST)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOL1I-0001qI-JP
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKet-0004lM-UI; Wed, 17 Aug 2022 11:08:40 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKes-0002zM-BS; Wed, 17 Aug 2022 11:08:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DC1AE746E06;
 Wed, 17 Aug 2022 17:08:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BB46174638A; Wed, 17 Aug 2022 17:08:36 +0200 (CEST)
Message-Id: <68eb8b5ac408ca8cc981ebf53a3e154c0d34c7f6.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 18/31] ppc/ppc405: Use an explicit I2C object
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:36 +0200 (CEST)
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

Having an explicit I2C model object will help if one day we want to
add I2C devices on the bus from the machine init routine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Symplify sysbus device casts for readibility]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    |  2 ++
 hw/ppc/ppc405_uc.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 67f4c14f50..efa29fdfb1 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -28,6 +28,7 @@
 #include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/intc/ppc-uic.h"
+#include "hw/i2c/ppc4xx_i2c.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
 #define PPC405EP_NVRAM_BASE 0xF0000000
@@ -215,6 +216,7 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
+    PPC4xxI2CState i2c;
     Ppc4xxEbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index c070102b14..54a51594ca 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1093,6 +1093,8 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
+    object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
+
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC4xx_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
@@ -1185,8 +1187,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* I2C controller */
-    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
-                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
+    sbd = SYS_BUS_DEVICE(&s->i2c);
+    if (!sysbus_realize(sbd, errp)) {
+        return;
+    }
+    sysbus_mmio_map(sbd, 0, 0xef600500);
+    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(DEVICE(&s->uic), 2));
 
     /* GPIO */
     sbd = SYS_BUS_DEVICE(&s->gpio);
-- 
2.30.4


