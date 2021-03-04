Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DFA32DCFD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:29:11 +0100 (CET)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwT0-0004uy-DU
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwFN-0002Xy-7l
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:15:05 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40310
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwFL-0006yU-0W
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:15:04 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwF4-0008MJ-Qa; Thu, 04 Mar 2021 22:14:51 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Thu,  4 Mar 2021 22:11:02 +0000
Message-Id: <20210304221103.6369-42-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 41/42] esp: implement non-DMA transfers in PDMA mode
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/esp.c         | 133 ++++++++++++++++++++++++++++++------------
 include/hw/scsi/esp.h |   1 +
 2 files changed, 98 insertions(+), 36 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 8a9b1500de..f828e70865 100644
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
@@ -645,6 +646,71 @@ static void esp_do_dma(ESPState *s)
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
 void esp_command_complete(SCSIRequest *req, size_t resid)
 {
     ESPState *s = req->hba_private;
@@ -701,56 +767,51 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
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
 
@@ -789,12 +850,12 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
 
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
@@ -846,7 +907,6 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         if (s->do_cmd) {
             esp_cmdfifo_push(s, val);
         } else {
-            s->ti_size++;
             esp_fifo_push(s, val);
         }
 
@@ -1047,6 +1107,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT8_TEST(cmdfifo_cdb_offset, ESPState, esp_is_version_5),
         VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
         VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
+        VMSTATE_UINT8_TEST(ti_cmd, ESPState, esp_is_version_5),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 2fe8d20ab5..95088490aa 100644
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


