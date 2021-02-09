Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE5315795
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:18:33 +0100 (CET)
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZSy-00074c-7y
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ylg-0006uh-6R
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:49 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57128
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yla-0003Ao-Az
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:47 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ylh-0007pt-QX; Tue, 09 Feb 2021 19:33:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:15 +0000
Message-Id: <20210209193018.31339-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 39/42] esp: convert cmdbuf from array to Fifo8
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

Rename ESP_CMDBUF_SZ to ESP_CMDFIFO_SZ and cmdbuf_cdb_offset to cmdfifo_cdb_offset
to indicate that the command buffer type has changed from an array to a Fifo8.

This also enables us to remove the ESPState field cmdlen since the command length
is now simply the number of elements used in cmdfifo.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 151 +++++++++++++++++++++++++++---------------
 include/hw/scsi/esp.h |   9 +--
 2 files changed, 101 insertions(+), 59 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 98df357276..9dd9947307 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -117,6 +117,25 @@ static uint8_t esp_fifo_pop(ESPState *s)
     return fifo8_pop(&s->fifo);
 }
 
+static void esp_cmdfifo_push(ESPState *s, uint8_t val)
+{
+    if (fifo8_num_used(&s->cmdfifo) == ESP_CMDFIFO_SZ) {
+        trace_esp_error_fifo_overrun();
+        return;
+    }
+
+    fifo8_push(&s->cmdfifo, val);
+}
+
+static uint8_t esp_cmdfifo_pop(ESPState *s)
+{
+    if (fifo8_is_empty(&s->cmdfifo)) {
+        return 0;
+    }
+
+    return fifo8_pop(&s->cmdfifo);
+}
+
 static uint32_t esp_get_tc(ESPState *s)
 {
     uint32_t dmalen;
@@ -151,7 +170,7 @@ static uint8_t esp_pdma_read(ESPState *s)
     uint8_t val;
 
     if (s->do_cmd) {
-        val = s->cmdbuf[s->cmdlen++];
+        val = esp_cmdfifo_pop(s);
     } else {
         val = esp_fifo_pop(s);
     }
@@ -168,7 +187,7 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     }
 
     if (s->do_cmd) {
-        s->cmdbuf[s->cmdlen++] = val;
+        esp_cmdfifo_push(s, val);
     } else {
         esp_fifo_push(s, val);
     }
@@ -214,7 +233,7 @@ static int esp_select(ESPState *s)
 
 static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
 {
-    uint8_t *buf = s->cmdbuf;
+    uint8_t buf[ESP_CMDFIFO_SZ];
     uint32_t dmalen, n;
     int target;
 
@@ -226,15 +245,18 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
         }
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
+            fifo8_push_all(&s->cmdfifo, buf, dmalen);
         } else {
             if (esp_select(s) < 0) {
+                fifo8_reset(&s->cmdfifo);
                 return -1;
             }
             esp_raise_drq(s);
+            fifo8_reset(&s->cmdfifo);
             return 0;
         }
     } else {
-        dmalen = MIN(s->ti_size, maxlen);
+        dmalen = MIN(fifo8_num_used(&s->fifo), maxlen);
         if (dmalen == 0) {
             return 0;
         }
@@ -242,27 +264,35 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
         if (dmalen >= 3) {
             buf[0] = buf[2] >> 5;
         }
+        fifo8_push_all(&s->cmdfifo, buf, dmalen);
     }
     trace_esp_get_cmd(dmalen, target);
 
     if (esp_select(s) < 0) {
+        fifo8_reset(&s->cmdfifo);
         return -1;
     }
     return dmalen;
 }
 
-static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
+static void do_busid_cmd(ESPState *s, uint8_t busid)
 {
+    uint32_t n, cmdlen;
     int32_t datalen;
     int lun;
     SCSIDevice *current_lun;
+    uint8_t *buf;
 
     trace_esp_do_busid_cmd(busid);
     lun = busid & 7;
+    cmdlen = fifo8_num_used(&s->cmdfifo);
+    buf = (uint8_t *)fifo8_pop_buf(&s->cmdfifo, cmdlen, &n);
+
     current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, lun);
     s->current_req = scsi_req_new(current_lun, 0, lun, buf, s);
     datalen = scsi_req_enqueue(s->current_req);
     s->ti_size = datalen;
+    fifo8_reset(&s->cmdfifo);
     if (datalen != 0) {
         s->rregs[ESP_RSTAT] = STAT_TC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -287,18 +317,25 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
 
 static void do_cmd(ESPState *s)
 {
-    uint8_t *buf = s->cmdbuf;
-    uint8_t busid = buf[0];
+    uint8_t busid = fifo8_pop(&s->cmdfifo);
+    uint32_t n;
+
+    s->cmdfifo_cdb_offset--;
 
     /* Ignore extended messages for now */
-    do_busid_cmd(s, &buf[s->cmdbuf_cdb_offset], busid);
+    if (s->cmdfifo_cdb_offset) {
+        fifo8_pop_buf(&s->cmdfifo, s->cmdfifo_cdb_offset, &n);
+        s->cmdfifo_cdb_offset = 0;
+    }
+
+    do_busid_cmd(s, busid);
 }
 
 static void satn_pdma_cb(ESPState *s)
 {
     s->do_cmd = 0;
-    if (s->cmdlen) {
-        s->cmdbuf_cdb_offset = 1;
+    if (!fifo8_is_empty(&s->cmdfifo)) {
+        s->cmdfifo_cdb_offset = 1;
         do_cmd(s);
     }
 }
@@ -312,13 +349,11 @@ static void handle_satn(ESPState *s)
         return;
     }
     s->pdma_cb = satn_pdma_cb;
-    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
+    cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
-        s->cmdlen = cmdlen;
-        s->cmdbuf_cdb_offset = 1;
+        s->cmdfifo_cdb_offset = 1;
         do_cmd(s);
     } else if (cmdlen == 0) {
-        s->cmdlen = 0;
         s->do_cmd = 1;
         /* Target present, but no cmd yet - switch to command phase */
         s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -328,10 +363,13 @@ static void handle_satn(ESPState *s)
 
 static void s_without_satn_pdma_cb(ESPState *s)
 {
+    uint32_t len;
+
     s->do_cmd = 0;
-    if (s->cmdlen) {
-        s->cmdbuf_cdb_offset = 0;
-        do_busid_cmd(s, s->cmdbuf, 0);
+    len = fifo8_num_used(&s->cmdfifo);
+    if (len) {
+        s->cmdfifo_cdb_offset = 0;
+        do_busid_cmd(s, 0);
     }
 }
 
@@ -344,13 +382,11 @@ static void handle_s_without_atn(ESPState *s)
         return;
     }
     s->pdma_cb = s_without_satn_pdma_cb;
-    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
+    cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
-        s->cmdlen = cmdlen;
-        s->cmdbuf_cdb_offset = 0;
-        do_busid_cmd(s, s->cmdbuf, 0);
+        s->cmdfifo_cdb_offset = 0;
+        do_busid_cmd(s, 0);
     } else if (cmdlen == 0) {
-        s->cmdlen = 0;
         s->do_cmd = 1;
         /* Target present, but no cmd yet - switch to command phase */
         s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -361,10 +397,10 @@ static void handle_s_without_atn(ESPState *s)
 static void satn_stop_pdma_cb(ESPState *s)
 {
     s->do_cmd = 0;
-    if (s->cmdlen) {
-        trace_esp_handle_satn_stop(s->cmdlen);
+    if (!fifo8_is_empty(&s->cmdfifo)) {
+        trace_esp_handle_satn_stop(fifo8_num_used(&s->cmdfifo));
         s->do_cmd = 1;
-        s->cmdbuf_cdb_offset = 1;
+        s->cmdfifo_cdb_offset = 1;
         s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
         s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -383,16 +419,14 @@ static void handle_satn_stop(ESPState *s)
     s->pdma_cb = satn_stop_pdma_cb;
     cmdlen = get_cmd(s, 1);
     if (cmdlen > 0) {
-        trace_esp_handle_satn_stop(cmdlen);
-        s->cmdlen = cmdlen;
+        trace_esp_handle_satn_stop(fifo8_num_used(&s->cmdfifo));
         s->do_cmd = 1;
-        s->cmdbuf_cdb_offset = 1;
+        s->cmdfifo_cdb_offset = 1;
         s->rregs[ESP_RSTAT] = STAT_MO;
         s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
         s->rregs[ESP_RSEQ] = SEQ_MO;
         esp_raise_irq(s);
     } else if (cmdlen == 0) {
-        s->cmdlen = 0;
         s->do_cmd = 1;
         /* Target present, switch to message out phase */
         s->rregs[ESP_RSEQ] = SEQ_MO;
@@ -455,7 +489,6 @@ static void do_dma_pdma_cb(ESPState *s)
 
     if (s->do_cmd) {
         s->ti_size = 0;
-        s->cmdlen = 0;
         s->do_cmd = 0;
         do_cmd(s);
         esp_lower_drq(s);
@@ -515,8 +548,9 @@ static void do_dma_pdma_cb(ESPState *s)
 
 static void esp_do_dma(ESPState *s)
 {
-    uint32_t len;
+    uint32_t len, cmdlen;
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
+    uint8_t buf[ESP_CMDFIFO_SZ];
 
     len = esp_get_tc(s);
     if (s->do_cmd) {
@@ -524,34 +558,33 @@ static void esp_do_dma(ESPState *s)
          * handle_ti_cmd() case: esp_do_dma() is called only from
          * handle_ti_cmd() with do_cmd != NULL (see the assert())
          */
-        trace_esp_do_dma(s->cmdlen, len);
-        assert(s->cmdlen <= sizeof(s->cmdbuf) &&
-               len <= sizeof(s->cmdbuf) - s->cmdlen);
+        cmdlen = fifo8_num_used(&s->cmdfifo);
+        trace_esp_do_dma(cmdlen, len);
         if (s->dma_memory_read) {
-            s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
+            s->dma_memory_read(s->dma_opaque, buf, len);
+            fifo8_push_all(&s->cmdfifo, buf, len);
         } else {
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
         }
-        trace_esp_handle_ti_cmd(s->cmdlen);
+        trace_esp_handle_ti_cmd(cmdlen);
         s->ti_size = 0;
         if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
             /* No command received */
-            if (s->cmdbuf_cdb_offset == s->cmdlen) {
+            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
                 return;
             }
 
             /* Command has been received */
-            s->cmdlen = 0;
             s->do_cmd = 0;
             do_cmd(s);
         } else {
             /*
-             * Extra message out bytes received: update cmdbuf_cdb_offset
+             * Extra message out bytes received: update cmdfifo_cdb_offset
              * and then switch to commmand phase
              */
-            s->cmdbuf_cdb_offset = s->cmdlen;
+            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
             s->rregs[ESP_RSEQ] = SEQ_CD;
             s->rregs[ESP_RINTR] |= INTR_BS;
@@ -689,7 +722,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
 
 static void handle_ti(ESPState *s)
 {
-    uint32_t dmalen;
+    uint32_t dmalen, cmdlen;
 
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_ti;
@@ -702,24 +735,24 @@ static void handle_ti(ESPState *s)
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
         esp_do_dma(s);
     } else if (s->do_cmd) {
-        trace_esp_handle_ti_cmd(s->cmdlen);
+        cmdlen = fifo8_num_used(&s->cmdfifo);
+        trace_esp_handle_ti_cmd(cmdlen);
         s->ti_size = 0;
         if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
             /* No command received */
-            if (s->cmdbuf_cdb_offset == s->cmdlen) {
+            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
                 return;
             }
 
             /* Command has been received */
-            s->cmdlen = 0;
             s->do_cmd = 0;
             do_cmd(s);
         } else {
             /*
-             * Extra message out bytes received: update cmdbuf_cdb_offset
+             * Extra message out bytes received: update cmdfifo_cdb_offset
              * and then switch to commmand phase
              */
-            s->cmdbuf_cdb_offset = s->cmdlen;
+            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
             s->rregs[ESP_RSEQ] = SEQ_CD;
             s->rregs[ESP_RINTR] |= INTR_BS;
@@ -735,6 +768,7 @@ void esp_hard_reset(ESPState *s)
     s->tchi_written = 0;
     s->ti_size = 0;
     fifo8_reset(&s->fifo);
+    fifo8_reset(&s->cmdfifo);
     s->dma = 0;
     s->do_cmd = 0;
     s->dma_cb = NULL;
@@ -813,11 +847,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         break;
     case ESP_FIFO:
         if (s->do_cmd) {
-            if (s->cmdlen < ESP_CMDBUF_SZ) {
-                s->cmdbuf[s->cmdlen++] = val & 0xff;
-            } else {
-                trace_esp_error_fifo_overrun();
-            }
+            esp_cmdfifo_push(s, val & 0xff);
         } else {
             s->ti_size++;
             esp_fifo_push(s, val & 0xff);
@@ -979,6 +1009,11 @@ static int esp_post_load(void *opaque, int version_id)
         for (i = 0; i < len; i++) {
             fifo8_push(&s->fifo, s->mig_ti_buf[i]);
         }
+
+        /* Migrate cmdbuf to cmdfifo */
+        for (i = 0; i < s->mig_cmdlen; i++) {
+            fifo8_push(&s->cmdfifo, s->mig_cmdbuf[i]);
+        }
     }
 
     s->mig_version_id = vmstate_esp.version_id;
@@ -1004,14 +1039,18 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_BOOL_TEST(mig_deferred_complete, ESPState,
                           esp_is_before_version_5),
         VMSTATE_UINT32(dma, ESPState),
-        VMSTATE_PARTIAL_BUFFER(cmdbuf, ESPState, 16),
-        VMSTATE_BUFFER_START_MIDDLE_V(cmdbuf, ESPState, 16, 4),
-        VMSTATE_UINT32(cmdlen, ESPState),
+        VMSTATE_STATIC_BUFFER(mig_cmdbuf, ESPState, 0,
+                              esp_is_before_version_5, 0, 16),
+        VMSTATE_STATIC_BUFFER(mig_cmdbuf, ESPState, 4,
+                              esp_is_before_version_5, 16,
+                              sizeof(typeof_field(ESPState, mig_cmdbuf))),
+        VMSTATE_UINT32_TEST(mig_cmdlen, ESPState, esp_is_before_version_5),
         VMSTATE_UINT32(do_cmd, ESPState),
         VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
         VMSTATE_BOOL_TEST(data_in_ready, ESPState, esp_is_version_5),
-        VMSTATE_UINT8_TEST(cmdbuf_cdb_offset, ESPState, esp_is_version_5),
+        VMSTATE_UINT8_TEST(cmdfifo_cdb_offset, ESPState, esp_is_version_5),
         VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
+        VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -1202,6 +1241,7 @@ static void esp_finalize(Object *obj)
     ESPState *s = ESP(obj);
 
     fifo8_destroy(&s->fifo);
+    fifo8_destroy(&s->cmdfifo);
 }
 
 static void esp_init(Object *obj)
@@ -1209,6 +1249,7 @@ static void esp_init(Object *obj)
     ESPState *s = ESP(obj);
 
     fifo8_create(&s->fifo, ESP_FIFO_SZ);
+    fifo8_create(&s->cmdfifo, ESP_CMDFIFO_SZ);
 }
 
 static void esp_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 063d9b1caa..9da2905f14 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -12,7 +12,7 @@ typedef void (*ESPDMAMemoryReadWriteFunc)(void *opaque, uint8_t *buf, int len);
 
 #define ESP_REGS 16
 #define ESP_FIFO_SZ 16
-#define ESP_CMDBUF_SZ 32
+#define ESP_CMDFIFO_SZ 32
 
 typedef struct ESPState ESPState;
 
@@ -35,9 +35,8 @@ struct ESPState {
     SCSIBus bus;
     SCSIDevice *current_dev;
     SCSIRequest *current_req;
-    uint8_t cmdbuf[ESP_CMDBUF_SZ];
-    uint32_t cmdlen;
-    uint8_t cmdbuf_cdb_offset;
+    Fifo8 cmdfifo;
+    uint8_t cmdfifo_cdb_offset;
     uint32_t do_cmd;
 
     bool data_in_ready;
@@ -60,6 +59,8 @@ struct ESPState {
     bool mig_deferred_complete;
     uint32_t mig_ti_rptr, mig_ti_wptr;
     uint8_t mig_ti_buf[ESP_FIFO_SZ];
+    uint8_t mig_cmdbuf[ESP_CMDFIFO_SZ];
+    uint32_t mig_cmdlen;
 };
 
 #define TYPE_SYSBUS_ESP "sysbus-esp"
-- 
2.20.1


