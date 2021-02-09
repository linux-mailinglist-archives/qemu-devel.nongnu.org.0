Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B531578E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:16:09 +0100 (CET)
Received: from localhost ([::1]:49360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZQe-0003Ct-EL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ym2-0006yC-Bg
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:34:11 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57148
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yln-0003Ez-SE
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:34:08 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yls-0007pt-Jq; Tue, 09 Feb 2021 19:34:06 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:17 +0000
Message-Id: <20210209193018.31339-42-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 41/42] esp: implement non-DMA transfers in PDMA mode
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

The MacOS toolbox ROM uses non-DMA TI commands to handle the first/last byte
of an unaligned 16-bit transfer to memory.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 133 ++++++++++++++++++++++++++++++------------
 include/hw/scsi/esp.h |   1 +
 2 files changed, 98 insertions(+), 36 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 1f01f2314b..ae9e265a5d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -296,6 +296,7 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
     if (datalen != 0) {
         s->rregs[ESP_RSTAT] = STAT_TC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
+        s->ti_cmd = 0;
         esp_set_tc(s, 0);
         if (datalen > 0) {
             /*
@@ -651,6 +652,71 @@ static void esp_do_dma(ESPState *s)
     esp_lower_drq(s);
 }
 
+static void esp_do_nodma(ESPState *s)
+{
+    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
+    uint32_t cmdlen, n;
+    int len;
+
+    if (s->do_cmd) {
+        cmdlen = fifo8_num_used(&s->cmdfifo);
+        trace_esp_handle_ti_cmd(cmdlen);
+        s->ti_size = 0;
+        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
+            /* No command received */
+            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
+                return;
+            }
+
+            /* Command has been received */
+            s->do_cmd = 0;
+            do_cmd(s);
+        } else {
+            /*
+             * Extra message out bytes received: update cmdfifo_cdb_offset
+             * and then switch to commmand phase
+             */
+            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
+            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
+            s->rregs[ESP_RSEQ] = SEQ_CD;
+            s->rregs[ESP_RINTR] |= INTR_BS;
+            esp_raise_irq(s);
+        }
+        return;
+    }
+
+    if (s->async_len == 0) {
+        /* Defer until data is available.  */
+        return;
+    }
+
+    if (to_device) {
+        len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
+        memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
+        s->async_buf += len;
+        s->async_len -= len;
+        s->ti_size += len;
+    } else {
+        len = MIN(s->ti_size, s->async_len);
+        len = MIN(len, fifo8_num_free(&s->fifo));
+        fifo8_push_all(&s->fifo, s->async_buf, len);
+        s->async_buf += len;
+        s->async_len -= len;
+        s->ti_size -= len;
+    }
+
+    if (s->async_len == 0) {
+        scsi_req_continue(s->current_req);
+
+        if (to_device || s->ti_size == 0) {
+            return;
+        }
+    }
+
+    s->rregs[ESP_RINTR] |= INTR_BS;
+    esp_raise_irq(s);
+}
+
 void esp_command_complete(SCSIRequest *req, uint32_t status,
                           size_t resid)
 {
@@ -708,56 +774,51 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
         return;
     }
 
-    if (dmalen) {
-        esp_do_dma(s);
-    } else if (s->ti_size <= 0) {
+    if (s->ti_cmd == 0) {
         /*
-         * If this was the last part of a DMA transfer then the
-         * completion interrupt is deferred to here.
+         * Always perform the initial transfer upon reception of the next TI
+         * command to ensure the DMA/non-DMA status of the command is correct.
+         * It is not possible to use s->dma directly in the section below as
+         * some OSs send non-DMA NOP commands after a DMA transfer. Hence if the
+         * async data transfer is delayed then s->dma is set incorrectly.
          */
-        esp_dma_done(s);
-        esp_lower_drq(s);
+        return;
+    }
+
+    if (s->ti_cmd & CMD_DMA) {
+        if (dmalen) {
+            esp_do_dma(s);
+        } else if (s->ti_size <= 0) {
+            /*
+             * If this was the last part of a DMA transfer then the
+             * completion interrupt is deferred to here.
+             */
+            esp_dma_done(s);
+            esp_lower_drq(s);
+        }
+    } else {
+        esp_do_nodma(s);
     }
 }
 
 static void handle_ti(ESPState *s)
 {
-    uint32_t dmalen, cmdlen;
+    uint32_t dmalen;
 
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_ti;
         return;
     }
 
-    dmalen = esp_get_tc(s);
+    s->ti_cmd = s->rregs[ESP_CMD];
     if (s->dma) {
+        dmalen = esp_get_tc(s);
         trace_esp_handle_ti(dmalen);
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
         esp_do_dma(s);
-    } else if (s->do_cmd) {
-        cmdlen = fifo8_num_used(&s->cmdfifo);
-        trace_esp_handle_ti_cmd(cmdlen);
-        s->ti_size = 0;
-        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
-            /* No command received */
-            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
-                return;
-            }
-
-            /* Command has been received */
-            s->do_cmd = 0;
-            do_cmd(s);
-        } else {
-            /*
-             * Extra message out bytes received: update cmdfifo_cdb_offset
-             * and then switch to commmand phase
-             */
-            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
-            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
-            s->rregs[ESP_RSEQ] = SEQ_CD;
-            s->rregs[ESP_RINTR] |= INTR_BS;
-            esp_raise_irq(s);
-        }
+    } else {
+        trace_esp_handle_ti(s->ti_size);
+        esp_do_nodma(s);
     }
 }
 
@@ -796,12 +857,12 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
 
     switch (saddr) {
     case ESP_FIFO:
-        if ((s->rregs[ESP_RSTAT] & STAT_PIO_MASK) == 0) {
+        if (s->dma_memory_read && s->dma_memory_write &&
+                (s->rregs[ESP_RSTAT] & STAT_PIO_MASK) == 0) {
             /* Data out.  */
             qemu_log_mask(LOG_UNIMP, "esp: PIO data read not implemented\n");
             s->rregs[ESP_FIFO] = 0;
         } else {
-            s->ti_size--;
             s->rregs[ESP_FIFO] = esp_fifo_pop(s);
         }
         val = s->rregs[ESP_FIFO];
@@ -853,7 +914,6 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         if (s->do_cmd) {
             esp_cmdfifo_push(s, val & 0xff);
         } else {
-            s->ti_size++;
             esp_fifo_push(s, val & 0xff);
         }
 
@@ -1055,6 +1115,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT8_TEST(cmdfifo_cdb_offset, ESPState, esp_is_version_5),
         VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
         VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
+        VMSTATE_UINT8_TEST(ti_cmd, ESPState, esp_is_version_5),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 9da2905f14..a387eb5292 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -40,6 +40,7 @@ struct ESPState {
     uint32_t do_cmd;
 
     bool data_in_ready;
+    uint8_t ti_cmd;
     int dma_enabled;
 
     uint32_t async_len;
-- 
2.20.1


