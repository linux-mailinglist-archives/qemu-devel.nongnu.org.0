Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869EB2E7AC2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:54:03 +0100 (CET)
Received: from localhost ([::1]:49764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudnW-0008SE-Fo
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZn-0001iH-Ma
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:52 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50936
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZj-0002J6-Pr
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:51 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZU-00070L-UU; Wed, 30 Dec 2020 15:39:38 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:43 +0000
Message-Id: <20201230153745.30241-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 23/25] esp: use FIFO for PDMA transfers between initiator and
 device
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

PDMA as implemented on the Quadra 800 uses DREQ to load data into the FIFO
up to a maximum of 16 bytes at a time. The MacOS toolbox ROM requires this
because it mixes FIFO and PDMA transfers whilst checking the FIFO status
and counter registers to ensure success.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 104 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 31 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 69c03e59f0..d2a70998aa 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -134,13 +134,8 @@ static void set_pdma(ESPState *s, enum pdma_origin_id origin)
 
 static uint8_t esp_pdma_read(ESPState *s)
 {
-    uint32_t dmalen = esp_get_tc(s);
     uint8_t val;
 
-    if (dmalen == 0) {
-        return 0;
-    }
-
     switch (s->pdma_origin) {
     case TI:
         if (s->do_cmd) {
@@ -161,8 +156,6 @@ static uint8_t esp_pdma_read(ESPState *s)
     }
 
     s->ti_size--;
-    dmalen--;
-    esp_set_tc(s, dmalen);
 
     return val;
 }
@@ -447,28 +440,71 @@ static void esp_dma_done(ESPState *s)
 static void do_dma_pdma_cb(ESPState *s)
 {
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
+    int len;
 
     if (s->do_cmd) {
         s->ti_size = 0;
         s->cmdlen = 0;
         s->do_cmd = 0;
         do_cmd(s, s->cmdbuf);
+        esp_lower_drq(s);
         return;
     }
-    if (s->async_len == 0) {
-        scsi_req_continue(s->current_req);
-        /*
-         * If there is still data to be read from the device then
-         * complete the DMA operation immediately.  Otherwise defer
-         * until the scsi layer has completed.
-         */
-        if (to_device || esp_get_tc(s) != 0 || s->ti_size == 0) {
+
+    if (to_device) {
+        /* Copy FIFO data to device */
+        len = MIN(s->ti_wptr, TI_BUFSZ);
+        memcpy(s->async_buf, s->ti_buf, len);
+        s->ti_wptr = 0;
+        s->ti_rptr = 0;
+        s->async_buf += len;
+        s->async_len -= len;
+        if (s->async_len == 0) {
+            scsi_req_continue(s->current_req);
+            /*
+             * If there is still data to be read from the device then
+             * complete the DMA operation immediately.  Otherwise defer
+             * until the scsi layer has completed.
+             */
             return;
         }
-    }
 
-    /* Partially filled a scsi buffer. Complete immediately.  */
-    esp_dma_done(s);
+        if (esp_get_tc(s) == 0) {
+            esp_lower_drq(s);
+            esp_dma_done(s);
+        }
+
+        return;
+    } else {
+        if (s->async_len == 0) {
+            scsi_req_continue(s->current_req);
+            /*
+             * If there is still data to be read from the device then
+             * complete the DMA operation immediately.  Otherwise defer
+             * until the scsi layer has completed.
+             */
+            if (esp_get_tc(s) != 0) {
+                return;
+            }
+        }
+
+        if (esp_get_tc(s) != 0) {
+            /* Copy device data to FIFO */
+            s->ti_wptr = 0;
+            s->ti_rptr = 0;
+            len = MIN(s->async_len, TI_BUFSZ);
+            memcpy(s->ti_buf, s->async_buf, len);
+            s->ti_wptr += len;
+            s->async_buf += len;
+            s->async_len -= len;
+            esp_set_tc(s, esp_get_tc(s) - len);
+            return;
+        }
+
+        /* Partially filled a scsi buffer. Complete immediately.  */
+        esp_lower_drq(s);
+        esp_dma_done(s);
+    }
 }
 
 static void esp_do_dma(ESPState *s)
@@ -511,7 +547,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, ASYNC);
+            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -520,9 +556,19 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_write) {
             s->dma_memory_write(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, ASYNC);
+            /* Copy device data to FIFO */
+            len = MIN(len, TI_BUFSZ - s->ti_wptr);
+            memcpy(&s->ti_buf[s->ti_wptr], s->async_buf, len);
+            s->ti_wptr += len;
+            s->async_buf += len;
+            s->async_len -= len;
+            esp_set_tc(s, esp_get_tc(s) - len);
+            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
+
+            /* Indicate transfer to FIFO is complete */
+            s->rregs[ESP_RSTAT] |= STAT_TC;
             return;
         }
     }
@@ -548,6 +594,7 @@ static void esp_do_dma(ESPState *s)
 
     /* Partially filled a scsi buffer. Complete immediately.  */
     esp_dma_done(s);
+    esp_lower_drq(s);
 }
 
 static void esp_report_command_complete(ESPState *s, uint32_t status)
@@ -564,6 +611,7 @@ static void esp_report_command_complete(ESPState *s, uint32_t status)
     s->status = status;
     s->rregs[ESP_RSTAT] = STAT_ST;
     esp_dma_done(s);
+    esp_lower_drq(s);
     if (s->current_req) {
         scsi_req_unref(s->current_req);
         s->current_req = NULL;
@@ -607,6 +655,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
          * completion interrupt is deferred to here.
          */
         esp_dma_done(s);
+        esp_lower_drq(s);
     }
 }
 
@@ -944,10 +993,8 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         break;
     }
     dmalen = esp_get_tc(s);
-    if (dmalen == 0 && s->pdma_cb) {
-        esp_lower_drq(s);
+    if (dmalen == 0 || (s->ti_wptr == TI_BUFSZ)) {
         s->pdma_cb(s);
-        s->pdma_cb = NULL;
     }
 }
 
@@ -956,14 +1003,10 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = &sysbus->esp;
-    uint32_t dmalen = esp_get_tc(s);
     uint64_t val = 0;
 
     trace_esp_pdma_read(size);
 
-    if (dmalen == 0) {
-        return 0;
-    }
     switch (size) {
     case 1:
         val = esp_pdma_read(s);
@@ -973,11 +1016,10 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
         val = (val << 8) | esp_pdma_read(s);
         break;
     }
-    dmalen = esp_get_tc(s);
-    if (dmalen == 0 && s->pdma_cb) {
-        esp_lower_drq(s);
+    if (s->ti_rptr == s->ti_wptr) {
+        s->ti_wptr = 0;
+        s->ti_rptr = 0;
         s->pdma_cb(s);
-        s->pdma_cb = NULL;
     }
     return val;
 }
-- 
2.20.1


