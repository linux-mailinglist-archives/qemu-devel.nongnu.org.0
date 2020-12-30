Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D341C2E7AC0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:53:16 +0100 (CET)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudml-0007i2-Sm
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZr-0001qr-5Z
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:55 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50958
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZp-0002Ka-Dg
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:54 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZf-00070L-Uw; Wed, 30 Dec 2020 15:39:47 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:45 +0000
Message-Id: <20201230153745.30241-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 25/25] esp: add 4 byte PDMA read and write transfers
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

The MacOS toolbox ROM performs 4 byte reads/writes when transferring data to
and from the target.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 773fe09c49..b356a65f5c 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -933,6 +933,12 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         esp_pdma_write(s, val >> 8);
         esp_pdma_write(s, val);
         break;
+    case 4:
+        esp_pdma_write(s, val >> 24);
+        esp_pdma_write(s, val >> 16);
+        esp_pdma_write(s, val >> 8);
+        esp_pdma_write(s, val);
+        break;
     }
     dmalen = esp_get_tc(s);
     if (dmalen == 0 || (s->ti_wptr == TI_BUFSZ)) {
@@ -957,6 +963,12 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
         val = esp_pdma_read(s);
         val = (val << 8) | esp_pdma_read(s);
         break;
+    case 4:
+        val = esp_pdma_read(s);
+        val = (val << 8) | esp_pdma_read(s);
+        val = (val << 8) | esp_pdma_read(s);
+        val = (val << 8) | esp_pdma_read(s);
+        break;
     }
     if (s->ti_rptr == s->ti_wptr) {
         s->ti_wptr = 0;
@@ -971,7 +983,7 @@ static const MemoryRegionOps sysbus_esp_pdma_ops = {
     .write = sysbus_esp_pdma_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid.min_access_size = 1,
-    .valid.max_access_size = 2,
+    .valid.max_access_size = 4,
 };
 
 static const struct SCSIBusInfo esp_scsi_info = {
@@ -1014,7 +1026,7 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
                           sysbus, "esp-regs", ESP_REGS << sysbus->it_shift);
     sysbus_init_mmio(sbd, &sysbus->iomem);
     memory_region_init_io(&sysbus->pdma, OBJECT(sysbus), &sysbus_esp_pdma_ops,
-                          sysbus, "esp-pdma", 2);
+                          sysbus, "esp-pdma", 4);
     sysbus_init_mmio(sbd, &sysbus->pdma);
 
     qdev_init_gpio_in(dev, sysbus_esp_gpio_demux, 2);
-- 
2.20.1


