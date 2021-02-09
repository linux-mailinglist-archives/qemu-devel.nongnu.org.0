Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BBC315789
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:14:35 +0100 (CET)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZP8-0001I4-QH
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yky-0006Eu-HL
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:04 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57030
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yku-0002vJ-1X
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:03 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yl2-0007pt-Gt; Tue, 09 Feb 2021 19:33:13 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:06 +0000
Message-Id: <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 30/42] esp: add 4 byte PDMA read and write transfers
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
and from the target. Since the SCSI bus is 16-bits wide, use the memory API
to split a 4 byte access into 2 x 2 byte accesses.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 7671cc398d..1d56c99527 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1003,7 +1003,9 @@ static const MemoryRegionOps sysbus_esp_pdma_ops = {
     .write = sysbus_esp_pdma_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid.min_access_size = 1,
-    .valid.max_access_size = 2,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 2,
 };
 
 static const struct SCSIBusInfo esp_scsi_info = {
@@ -1048,7 +1050,7 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
                           sysbus, "esp-regs", ESP_REGS << sysbus->it_shift);
     sysbus_init_mmio(sbd, &sysbus->iomem);
     memory_region_init_io(&sysbus->pdma, OBJECT(sysbus), &sysbus_esp_pdma_ops,
-                          sysbus, "esp-pdma", 2);
+                          sysbus, "esp-pdma", 4);
     sysbus_init_mmio(sbd, &sysbus->pdma);
 
     qdev_init_gpio_in(dev, sysbus_esp_gpio_demux, 2);
-- 
2.20.1


