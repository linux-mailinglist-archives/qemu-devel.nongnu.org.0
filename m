Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2831578F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:16:10 +0100 (CET)
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZQf-0003Ev-KQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yle-0006uY-9P
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:47 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57116
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YlW-000398-UP
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:44 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ylc-0007pt-Sf; Tue, 09 Feb 2021 19:33:49 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:14 +0000
Message-Id: <20210209193018.31339-39-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 38/42] esp: convert ti_buf from array to Fifo8
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

Rename TI_BUFSZ to ESP_FIFO_SZ since this constant is really describing the size
of the FIFO and is not directly related to the TI size.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 117 ++++++++++++++++++++++++++----------------
 include/hw/scsi/esp.h |   8 +--
 2 files changed, 79 insertions(+), 46 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 5a66b7d710..98df357276 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -98,6 +98,25 @@ void esp_request_cancelled(SCSIRequest *req)
     }
 }
 
+static void esp_fifo_push(ESPState *s, uint8_t val)
+{
+    if (fifo8_num_used(&s->fifo) == ESP_FIFO_SZ) {
+        trace_esp_error_fifo_overrun();
+        return;
+    }
+
+    fifo8_push(&s->fifo, val);
+}
+
+static uint8_t esp_fifo_pop(ESPState *s)
+{
+    if (fifo8_is_empty(&s->fifo)) {
+        return 0;
+    }
+
+    return fifo8_pop(&s->fifo);
+}
+
 static uint32_t esp_get_tc(ESPState *s)
 {
     uint32_t dmalen;
@@ -134,7 +153,7 @@ static uint8_t esp_pdma_read(ESPState *s)
     if (s->do_cmd) {
         val = s->cmdbuf[s->cmdlen++];
     } else {
-        val = s->ti_buf[s->ti_rptr++];
+        val = esp_fifo_pop(s);
     }
 
     return val;
@@ -151,7 +170,7 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     if (s->do_cmd) {
         s->cmdbuf[s->cmdlen++] = val;
     } else {
-        s->ti_buf[s->ti_wptr++] = val;
+        esp_fifo_push(s, val);
     }
 
     dmalen--;
@@ -165,8 +184,7 @@ static int esp_select(ESPState *s)
     target = s->wregs[ESP_WBUSID] & BUSID_DID;
 
     s->ti_size = 0;
-    s->ti_rptr = 0;
-    s->ti_wptr = 0;
+    fifo8_reset(&s->fifo);
 
     if (s->current_req) {
         /* Started a new command before the old one finished.  Cancel it.  */
@@ -197,7 +215,7 @@ static int esp_select(ESPState *s)
 static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
 {
     uint8_t *buf = s->cmdbuf;
-    uint32_t dmalen;
+    uint32_t dmalen, n;
     int target;
 
     target = s->wregs[ESP_WBUSID] & BUSID_DID;
@@ -220,7 +238,7 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
         if (dmalen == 0) {
             return 0;
         }
-        memcpy(buf, s->ti_buf, dmalen);
+        memcpy(buf, fifo8_pop_buf(&s->fifo, dmalen, &n), dmalen);
         if (dmalen >= 3) {
             buf[0] = buf[2] >> 5;
         }
@@ -392,12 +410,18 @@ static void write_response_pdma_cb(ESPState *s)
 
 static void write_response(ESPState *s)
 {
+    uint32_t n;
+
     trace_esp_write_response(s->status);
-    s->ti_buf[0] = s->status;
-    s->ti_buf[1] = 0;
+
+    fifo8_reset(&s->fifo);
+    esp_fifo_push(s, s->status);
+    esp_fifo_push(s, 0);
+
     if (s->dma) {
         if (s->dma_memory_write) {
-            s->dma_memory_write(s->dma_opaque, s->ti_buf, 2);
+            s->dma_memory_write(s->dma_opaque,
+                                (uint8_t *)fifo8_pop_buf(&s->fifo, 2, &n), 2);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
             s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -408,8 +432,6 @@ static void write_response(ESPState *s)
         }
     } else {
         s->ti_size = 2;
-        s->ti_rptr = 0;
-        s->ti_wptr = 2;
         s->rregs[ESP_RFLAGS] = 2;
     }
     esp_raise_irq(s);
@@ -429,6 +451,7 @@ static void do_dma_pdma_cb(ESPState *s)
 {
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
     int len;
+    uint32_t n;
 
     if (s->do_cmd) {
         s->ti_size = 0;
@@ -441,10 +464,8 @@ static void do_dma_pdma_cb(ESPState *s)
 
     if (to_device) {
         /* Copy FIFO data to device */
-        len = MIN(s->ti_wptr, TI_BUFSZ);
-        memcpy(s->async_buf, s->ti_buf, len);
-        s->ti_wptr = 0;
-        s->ti_rptr = 0;
+        len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
+        memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
         s->async_buf += len;
         s->async_len -= len;
         s->ti_size += len;
@@ -477,11 +498,8 @@ static void do_dma_pdma_cb(ESPState *s)
 
         if (esp_get_tc(s) != 0) {
             /* Copy device data to FIFO */
-            s->ti_wptr = 0;
-            s->ti_rptr = 0;
-            len = MIN(s->async_len, TI_BUFSZ);
-            memcpy(s->ti_buf, s->async_buf, len);
-            s->ti_wptr += len;
+            len = MIN(s->async_len, fifo8_num_free(&s->fifo));
+            fifo8_push_all(&s->fifo, s->async_buf, len);
             s->async_buf += len;
             s->async_len -= len;
             s->ti_size -= len;
@@ -561,9 +579,8 @@ static void esp_do_dma(ESPState *s)
             s->dma_memory_write(s->dma_opaque, s->async_buf, len);
         } else {
             /* Copy device data to FIFO */
-            len = MIN(len, TI_BUFSZ - s->ti_wptr);
-            memcpy(&s->ti_buf[s->ti_wptr], s->async_buf, len);
-            s->ti_wptr += len;
+            len = MIN(len, fifo8_num_free(&s->fifo));
+            fifo8_push_all(&s->fifo, s->async_buf, len);
             s->async_buf += len;
             s->async_len -= len;
             s->ti_size -= len;
@@ -717,8 +734,7 @@ void esp_hard_reset(ESPState *s)
     memset(s->wregs, 0, ESP_REGS);
     s->tchi_written = 0;
     s->ti_size = 0;
-    s->ti_rptr = 0;
-    s->ti_wptr = 0;
+    fifo8_reset(&s->fifo);
     s->dma = 0;
     s->do_cmd = 0;
     s->dma_cb = NULL;
@@ -750,13 +766,9 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
             /* Data out.  */
             qemu_log_mask(LOG_UNIMP, "esp: PIO data read not implemented\n");
             s->rregs[ESP_FIFO] = 0;
-        } else if (s->ti_rptr < s->ti_wptr) {
+        } else {
             s->ti_size--;
-            s->rregs[ESP_FIFO] = s->ti_buf[s->ti_rptr++];
-        }
-        if (s->ti_rptr == s->ti_wptr) {
-            s->ti_rptr = 0;
-            s->ti_wptr = 0;
+            s->rregs[ESP_FIFO] = esp_fifo_pop(s);
         }
         val = s->rregs[ESP_FIFO];
         break;
@@ -806,11 +818,9 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             } else {
                 trace_esp_error_fifo_overrun();
             }
-        } else if (s->ti_wptr == TI_BUFSZ - 1) {
-            trace_esp_error_fifo_overrun();
         } else {
             s->ti_size++;
-            s->ti_buf[s->ti_wptr++] = val & 0xff;
+            esp_fifo_push(s, val & 0xff);
         }
 
         /* Non-DMA transfers raise an interrupt after every byte */
@@ -839,8 +849,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         case CMD_FLUSH:
             trace_esp_mem_writeb_cmd_flush(val);
             /*s->ti_size = 0;*/
-            s->ti_wptr = 0;
-            s->ti_rptr = 0;
+            fifo8_reset(&s->fifo);
             break;
         case CMD_RESET:
             trace_esp_mem_writeb_cmd_reset(val);
@@ -958,11 +967,18 @@ static int esp_pre_save(void *opaque)
 static int esp_post_load(void *opaque, int version_id)
 {
     ESPState *s = ESP(opaque);
+    int len, i;
 
     version_id = MIN(version_id, s->mig_version_id);
 
     if (version_id < 5) {
         esp_set_tc(s, s->mig_dma_left);
+
+        /* Migrate ti_buf to fifo */
+        len = s->mig_ti_wptr - s->mig_ti_rptr;
+        for (i = 0; i < len; i++) {
+            fifo8_push(&s->fifo, s->mig_ti_buf[i]);
+        }
     }
 
     s->mig_version_id = vmstate_esp.version_id;
@@ -979,9 +995,9 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_BUFFER(rregs, ESPState),
         VMSTATE_BUFFER(wregs, ESPState),
         VMSTATE_INT32(ti_size, ESPState),
-        VMSTATE_UINT32(ti_rptr, ESPState),
-        VMSTATE_UINT32(ti_wptr, ESPState),
-        VMSTATE_BUFFER(ti_buf, ESPState),
+        VMSTATE_UINT32_TEST(mig_ti_rptr, ESPState, esp_is_before_version_5),
+        VMSTATE_UINT32_TEST(mig_ti_wptr, ESPState, esp_is_before_version_5),
+        VMSTATE_BUFFER_TEST(mig_ti_buf, ESPState, esp_is_before_version_5),
         VMSTATE_UINT32(status, ESPState),
         VMSTATE_UINT32_TEST(mig_deferred_status, ESPState,
                             esp_is_before_version_5),
@@ -995,6 +1011,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
         VMSTATE_BOOL_TEST(data_in_ready, ESPState, esp_is_version_5),
         VMSTATE_UINT8_TEST(cmdbuf_cdb_offset, ESPState, esp_is_version_5),
+        VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -1047,7 +1064,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         break;
     }
     dmalen = esp_get_tc(s);
-    if (dmalen == 0 || (s->ti_wptr == TI_BUFSZ)) {
+    if (dmalen == 0 || fifo8_is_full(&s->fifo)) {
         s->pdma_cb(s);
     }
 }
@@ -1070,9 +1087,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
         val = (val << 8) | esp_pdma_read(s);
         break;
     }
-    if (s->ti_rptr == s->ti_wptr) {
-        s->ti_wptr = 0;
-        s->ti_rptr = 0;
+    if (fifo8_is_empty(&s->fifo)) {
         s->pdma_cb(s);
     }
     return val;
@@ -1182,6 +1197,20 @@ static const TypeInfo sysbus_esp_info = {
     .class_init    = sysbus_esp_class_init,
 };
 
+static void esp_finalize(Object *obj)
+{
+    ESPState *s = ESP(obj);
+
+    fifo8_destroy(&s->fifo);
+}
+
+static void esp_init(Object *obj)
+{
+    ESPState *s = ESP(obj);
+
+    fifo8_create(&s->fifo, ESP_FIFO_SZ);
+}
+
 static void esp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1194,6 +1223,8 @@ static void esp_class_init(ObjectClass *klass, void *data)
 static const TypeInfo esp_info = {
     .name = TYPE_ESP,
     .parent = TYPE_DEVICE,
+    .instance_init = esp_init,
+    .instance_finalize = esp_finalize,
     .instance_size = sizeof(ESPState),
     .class_init = esp_class_init,
 };
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 6f3bf4a0ce..063d9b1caa 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -3,6 +3,7 @@
 
 #include "hw/scsi/scsi.h"
 #include "hw/sysbus.h"
+#include "qemu/fifo8.h"
 #include "qom/object.h"
 
 /* esp.c */
@@ -10,7 +11,7 @@
 typedef void (*ESPDMAMemoryReadWriteFunc)(void *opaque, uint8_t *buf, int len);
 
 #define ESP_REGS 16
-#define TI_BUFSZ 16
+#define ESP_FIFO_SZ 16
 #define ESP_CMDBUF_SZ 32
 
 typedef struct ESPState ESPState;
@@ -28,10 +29,9 @@ struct ESPState {
     uint8_t chip_id;
     bool tchi_written;
     int32_t ti_size;
-    uint32_t ti_rptr, ti_wptr;
     uint32_t status;
     uint32_t dma;
-    uint8_t ti_buf[TI_BUFSZ];
+    Fifo8 fifo;
     SCSIBus bus;
     SCSIDevice *current_dev;
     SCSIRequest *current_req;
@@ -58,6 +58,8 @@ struct ESPState {
     uint32_t mig_dma_left;
     uint32_t mig_deferred_status;
     bool mig_deferred_complete;
+    uint32_t mig_ti_rptr, mig_ti_wptr;
+    uint8_t mig_ti_buf[ESP_FIFO_SZ];
 };
 
 #define TYPE_SYSBUS_ESP "sysbus-esp"
-- 
2.20.1


