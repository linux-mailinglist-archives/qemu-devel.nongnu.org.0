Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC268C922
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9em-00051W-Fe; Mon, 06 Feb 2023 17:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9ek-0004w6-0N; Mon, 06 Feb 2023 17:08:10 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eg-0007Mw-R7; Mon, 06 Feb 2023 17:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NYiFvvxyaowG9kTY2/o+uLhNFeEgeTBC/dFDkUy0Iyc=; b=hDZaCSqOCzUe4KS7SbRLG/Uj+I
 VATNV6tjTHbqsgQcn/cc72azZ/kwrxvUiLuRZe+Z52h4kHQbk4FCQ6yMDOrR21X6UyT0UMKUOOeBb
 qkejNFn77OaO0biShUpt7atqp76aEbZ1csO/ZsWxeJUKfGGrinwcWT0r8E1RXCL+EQxwvrm3hYcIy
 BA97TQRX2ghCF4mbQ2u7qy1NgEnwYE9rpr98dy5SpcSGq0qFmIIa56utv9L9ajCrEmtKTmu2sontT
 yTGCIrD421DgQddvj+Zh2Fw2FfuiENNgXI0OGyhpP6XBrznjrZ4GtydH+JEp6XmAkaPsjUUlq1mva
 c9HG87QMX31VQOarHGqcK7wqNMawgdmzZ1vWdexh5EkVNCdR/58oFB+eQ8dYdiO+4HdUpfIuZWfgd
 G9rmcdN/YM6Kc6D3VTIqZT0LnxjKUMxyuAH1b3ydDbkSdE7DX9qk0Luzv/OBIdJAZz5XtI5O8oXAa
 MA7CFqKvuWT50UXi3lfflKMVyWW7NnWJgV7EBiV0IUD+kcpwIH3aiGIcXXyrfLpZeEU3EyZLtcZWo
 v0pdJ/Vf27y8DKr/SHVwoaolVJiha5tldFNy8tNESQnk6X95gzrCkKsEF18MFHoTAxSWDQzNeYZ9z
 xvbW9po6QDdXZDNfkCsgAfvFrDnmIwsCifZiYzgc8=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9e6-00039N-Md; Mon, 06 Feb 2023 22:07:34 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:20 +0000
Message-Id: <20230206220722.125814-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 6/8] hw/misc/macio: Return bool from functions taking errp
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Use the convention to return bool from functions which take an error
pointer which allows for callers to pass through their error pointer
without needing a local.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <bfce0751e82b031f5e6fb3c32cfbce6325434400.1674001242.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c | 62 +++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index ae2a9a960d..265c0bbd8d 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -90,13 +90,13 @@ static void macio_bar_setup(MacIOState *s)
     macio_escc_legacy_setup(s);
 }
 
-static void macio_common_realize(PCIDevice *d, Error **errp)
+static bool macio_common_realize(PCIDevice *d, Error **errp)
 {
     MacIOState *s = MACIO(d);
     SysBusDevice *sbd;
 
     if (!qdev_realize(DEVICE(&s->dbdma), BUS(&s->macio_bus), errp)) {
-        return;
+        return false;
     }
     sbd = SYS_BUS_DEVICE(&s->dbdma);
     memory_region_add_subregion(&s->bar, 0x08000,
@@ -108,14 +108,16 @@ static void macio_common_realize(PCIDevice *d, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->escc), "chnBtype", escc_serial);
     qdev_prop_set_uint32(DEVICE(&s->escc), "chnAtype", escc_serial);
     if (!qdev_realize(DEVICE(&s->escc), BUS(&s->macio_bus), errp)) {
-        return;
+        return false;
     }
 
     macio_bar_setup(s);
     pci_register_bar(d, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->bar);
+
+    return true;
 }
 
-static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
+static bool macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
                               qemu_irq irq0, qemu_irq irq1, int dmaid,
                               Error **errp)
 {
@@ -128,7 +130,7 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
                              &error_abort);
     macio_ide_register_dma(ide);
 
-    qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
+    return qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
 }
 
 static void macio_oldworld_realize(PCIDevice *d, Error **errp)
@@ -136,12 +138,9 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
     MacIOState *s = MACIO(d);
     OldWorldMacIOState *os = OLDWORLD_MACIO(d);
     DeviceState *pic_dev = DEVICE(&os->pic);
-    Error *err = NULL;
     SysBusDevice *sbd;
 
-    macio_common_realize(d, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_common_realize(d, errp)) {
         return;
     }
 
@@ -176,21 +175,17 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
     pmac_format_nvram_partition(&os->nvram, os->nvram.size);
 
     /* IDE buses */
-    macio_realize_ide(s, &os->ide[0],
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_DMA_IRQ),
-                      0x16, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &os->ide[0],
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_DMA_IRQ),
+                           0x16, errp)) {
         return;
     }
 
-    macio_realize_ide(s, &os->ide[1],
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_DMA_IRQ),
-                      0x1a, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &os->ide[1],
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_DMA_IRQ),
+                           0x1a, errp)) {
         return;
     }
 }
@@ -266,13 +261,10 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
     MacIOState *s = MACIO(d);
     NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
     DeviceState *pic_dev = DEVICE(&ns->pic);
-    Error *err = NULL;
     SysBusDevice *sbd;
     MemoryRegion *timer_memory = NULL;
 
-    macio_common_realize(d, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_common_realize(d, errp)) {
         return;
     }
 
@@ -288,21 +280,17 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
     sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, NEWWORLD_ESCCA_IRQ));
 
     /* IDE buses */
-    macio_realize_ide(s, &ns->ide[0],
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
-                      0x16, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &ns->ide[0],
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
+                           0x16, errp)) {
         return;
     }
 
-    macio_realize_ide(s, &ns->ide[1],
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
-                      0x1a, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &ns->ide[1],
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
+                           0x1a, errp)) {
         return;
     }
 
-- 
2.30.2


