Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2010388B65
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:12:42 +0200 (CEST)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJBx-0005Ks-Bq
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7i-0002am-AY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37248
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7g-0003HB-L1
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:18 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7d-0001Gv-TX; Wed, 19 May 2021 11:08:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu, hpoussin@reactos.org
Date: Wed, 19 May 2021 11:08:00 +0100
Message-Id: <20210519100803.10293-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/5] esp: handle non-DMA transfers from the target one byte at
 a time
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

The initial implementation of non-DMA transfers was based upon analysis of traces
from the MacOS toolbox ROM for handling unaligned reads but missed one key
aspect - during a non-DMA transfer from the target, the bus service interrupt
should be raised for every single byte received from the bus and not just at either
the end of the transfer or when the FIFO is full.

Adjust the non-DMA code accordingly so that esp_do_nodma() is called for every byte
received from the target. This also includes special handling for managing the change
from DATA IN to STATUS phase as this needs to occur when the final byte is read out
from the FIFO, and not at the end of the transfer of the last byte into the FIFO.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 72 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index a611718769..f2fd4e443a 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -740,20 +740,17 @@ static void esp_do_nodma(ESPState *s)
         s->async_len -= len;
         s->ti_size += len;
     } else {
-        len = MIN(s->ti_size, s->async_len);
-        len = MIN(len, fifo8_num_free(&s->fifo));
-        fifo8_push_all(&s->fifo, s->async_buf, len);
-        s->async_buf += len;
-        s->async_len -= len;
-        s->ti_size -= len;
+        if (fifo8_is_empty(&s->fifo)) {
+            fifo8_push(&s->fifo, s->async_buf[0]);
+            s->async_buf++;
+            s->async_len--;
+            s->ti_size--;
+        }
     }
 
     if (s->async_len == 0) {
         scsi_req_continue(s->current_req);
-
-        if (to_device || s->ti_size == 0) {
-            return;
-        }
+        return;
     }
 
     s->rregs[ESP_RINTR] |= INTR_BS;
@@ -763,20 +760,37 @@ static void esp_do_nodma(ESPState *s)
 void esp_command_complete(SCSIRequest *req, size_t resid)
 {
     ESPState *s = req->hba_private;
+    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
 
     trace_esp_command_complete();
-    if (s->ti_size != 0) {
-        trace_esp_command_complete_unexpected();
+
+    /*
+     * Non-DMA transfers from the target will leave the last byte in
+     * the FIFO so don't reset ti_size in this case
+     */
+    if (s->dma || to_device) {
+        if (s->ti_size != 0) {
+            trace_esp_command_complete_unexpected();
+        }
+        s->ti_size = 0;
     }
-    s->ti_size = 0;
+
     s->async_len = 0;
     if (req->status) {
         trace_esp_command_complete_fail();
     }
     s->status = req->status;
-    s->rregs[ESP_RSTAT] = STAT_ST;
-    esp_dma_done(s);
-    esp_lower_drq(s);
+
+    /*
+     * If the transfer is finished, switch to status phase. For non-DMA
+     * transfers from the target the last byte is still in the FIFO
+     */
+    if (s->ti_size == 0) {
+        s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
+        esp_dma_done(s);
+        esp_lower_drq(s);
+    }
+
     if (s->current_req) {
         scsi_req_unref(s->current_req);
         s->current_req = NULL;
@@ -895,6 +909,17 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
             qemu_log_mask(LOG_UNIMP, "esp: PIO data read not implemented\n");
             s->rregs[ESP_FIFO] = 0;
         } else {
+            if ((s->rregs[ESP_RSTAT] & 0x7) == STAT_DI) {
+                if (s->ti_size) {
+                    esp_do_nodma(s);
+                } else {
+                    /*
+                     * The last byte of a non-DMA transfer has been read out
+                     * of the FIFO so switch to status phase
+                     */
+                    s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
+                }
+            }
             s->rregs[ESP_FIFO] = esp_fifo_pop(&s->fifo);
         }
         val = s->rregs[ESP_FIFO];
@@ -945,15 +970,18 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
     case ESP_FIFO:
         if (s->do_cmd) {
             esp_fifo_push(&s->cmdfifo, val);
+
+            /*
+             * If any unexpected message out/command phase data is
+             * transferred using non-DMA, raise the interrupt
+             */
+            if (s->rregs[ESP_CMD] == CMD_TI) {
+                s->rregs[ESP_RINTR] |= INTR_BS;
+                esp_raise_irq(s);
+            }
         } else {
             esp_fifo_push(&s->fifo, val);
         }
-
-        /* Non-DMA transfers raise an interrupt after every byte */
-        if (s->rregs[ESP_CMD] == CMD_TI) {
-            s->rregs[ESP_RINTR] |= INTR_FC | INTR_BS;
-            esp_raise_irq(s);
-        }
         break;
     case ESP_CMD:
         s->rregs[saddr] = val;
-- 
2.20.1


