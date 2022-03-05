Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73124CE5B2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 17:02:06 +0100 (CET)
Received: from localhost ([::1]:41296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQWr7-0000vG-EL
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 11:02:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQWlT-0004hz-Nf
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:56:15 -0500
Received: from [2001:41c9:1:41f::167] (port=59314
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQWlS-0003jF-87
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:56:15 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQWkn-0008cY-V7; Sat, 05 Mar 2022 15:55:34 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 15:55:29 +0000
Message-Id: <20220305155530.9265-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305155530.9265-1-mark.cave-ayland@ilande.co.uk>
References: <20220305155530.9265-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 09/10] esp: include the current PDMA callback in the
 migration stream
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This involves (re)adding a PDMA-specific subsection to hold the reference to the
current PDMA callback.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/esp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index a818b2b07a..3f7cf30fa7 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1209,6 +1209,33 @@ static int esp_post_load(void *opaque, int version_id)
     return 0;
 }
 
+/*
+ * PDMA (or pseudo-DMA) is only used on the Macintosh and requires the
+ * guest CPU to perform the transfers between the SCSI bus and memory
+ * itself. This is indicated by the dma_memory_read and dma_memory_write
+ * functions being NULL (in contrast to the ESP PCI device) whilst
+ * dma_enabled is still set.
+ */
+
+static bool esp_pdma_needed(void *opaque)
+{
+    ESPState *s = ESP(opaque);
+
+    return s->dma_memory_read == NULL && s->dma_memory_write == NULL &&
+           s->dma_enabled;
+}
+
+static const VMStateDescription vmstate_esp_pdma = {
+    .name = "esp/pdma",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .needed = esp_pdma_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(pdma_cb, ESPState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_esp = {
     .name = "esp",
     .version_id = 6,
@@ -1243,6 +1270,10 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT8_TEST(lun, ESPState, esp_is_version_6),
         VMSTATE_END_OF_LIST()
     },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_esp_pdma,
+        NULL
+    }
 };
 
 static void sysbus_esp_mem_write(void *opaque, hwaddr addr,
-- 
2.20.1


