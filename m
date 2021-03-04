Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51832DD32
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:36:45 +0100 (CET)
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwaK-0005li-FN
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEi-0001Ih-I9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:14:25 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40230
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEf-0006dp-Jn
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:14:24 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEN-0008MJ-SA; Thu, 04 Mar 2021 22:14:10 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Thu,  4 Mar 2021 22:10:54 +0000
Message-Id: <20210304221103.6369-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 33/42] esp: defer command completion interrupt on incoming
 data transfers
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

The MacOS toolbox ROM issues a command to the ESP controller as part of its
"FAST" SCSI routines and then proceeds to read the incoming data soon after
receiving the command completion interrupt.

Unfortunately due to SCSI block transfers being asynchronous the incoming data
may not yet be present causing an underflow error. Resolve this by waiting for
the SCSI subsystem transfer_data callback before raising the command completion
interrupt.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/esp.c         | 66 ++++++++++++++++++++++++++++++++++---------
 include/hw/scsi/esp.h |  1 +
 2 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 54d008c609..0eecc1d05c 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -183,6 +183,14 @@ static int esp_select(ESPState *s)
         esp_raise_irq(s);
         return -1;
     }
+
+    /*
+     * Note that we deliberately don't raise the IRQ here: this will be done
+     * either in do_busid_cmd() for DATA OUT transfers or by the deferred
+     * IRQ mechanism in esp_transfer_data() for DATA IN transfers
+     */
+    s->rregs[ESP_RINTR] |= INTR_FC;
+    s->rregs[ESP_RSEQ] = SEQ_CD;
     return 0;
 }
 
@@ -237,18 +245,24 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
     s->ti_size = datalen;
     if (datalen != 0) {
         s->rregs[ESP_RSTAT] = STAT_TC;
+        s->rregs[ESP_RSEQ] = SEQ_CD;
         esp_set_tc(s, 0);
         if (datalen > 0) {
+            /*
+             * Switch to DATA IN phase but wait until initial data xfer is
+             * complete before raising the command completion interrupt
+             */
+            s->data_in_ready = false;
             s->rregs[ESP_RSTAT] |= STAT_DI;
         } else {
             s->rregs[ESP_RSTAT] |= STAT_DO;
+            s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
+            esp_raise_irq(s);
+            esp_lower_drq(s);
         }
         scsi_req_continue(s->current_req);
+        return;
     }
-    s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
-    s->rregs[ESP_RSEQ] = SEQ_CD;
-    esp_raise_irq(s);
-    esp_lower_drq(s);
 }
 
 static void do_cmd(ESPState *s)
@@ -439,17 +453,11 @@ static void do_dma_pdma_cb(ESPState *s)
     } else {
         if (s->async_len == 0) {
             if (s->current_req) {
+                /* Defer until the scsi layer has completed */
                 scsi_req_continue(s->current_req);
+                s->data_in_ready = false;
             }
-
-            /*
-             * If there is still data to be read from the device then
-             * complete the DMA operation immediately.  Otherwise defer
-             * until the scsi layer has completed.
-             */
-            if (esp_get_tc(s) != 0 || s->ti_size == 0) {
-                return;
-            }
+            return;
         }
 
         if (esp_get_tc(s) != 0) {
@@ -602,12 +610,35 @@ void esp_command_complete(SCSIRequest *req, size_t resid)
 void esp_transfer_data(SCSIRequest *req, uint32_t len)
 {
     ESPState *s = req->hba_private;
+    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
     uint32_t dmalen = esp_get_tc(s);
 
     assert(!s->do_cmd);
     trace_esp_transfer_data(dmalen, s->ti_size);
     s->async_len = len;
     s->async_buf = scsi_req_get_buf(req);
+
+    if (!to_device && !s->data_in_ready) {
+        /*
+         * Initial incoming data xfer is complete so raise command
+         * completion interrupt
+         */
+        s->data_in_ready = true;
+        s->rregs[ESP_RSTAT] |= STAT_TC;
+        s->rregs[ESP_RINTR] |= INTR_BS;
+        esp_raise_irq(s);
+
+        /*
+         * If data is ready to transfer and the TI command has already
+         * been executed, start DMA immediately. Otherwise DMA will start
+         * when host sends the TI command
+         */
+        if (s->ti_size && (s->rregs[ESP_CMD] == (CMD_TI | CMD_DMA))) {
+            esp_do_dma(s);
+        }
+        return;
+    }
+
     if (dmalen) {
         esp_do_dma(s);
     } else if (s->ti_size <= 0) {
@@ -869,6 +900,14 @@ static bool esp_is_before_version_5(void *opaque, int version_id)
     return version_id < 5;
 }
 
+static bool esp_is_version_5(void *opaque, int version_id)
+{
+    ESPState *s = ESP(opaque);
+
+    version_id = MIN(version_id, s->mig_version_id);
+    return version_id == 5;
+}
+
 static int esp_pre_save(void *opaque)
 {
     ESPState *s = ESP(opaque);
@@ -913,6 +952,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT32(cmdlen, ESPState),
         VMSTATE_UINT32(do_cmd, ESPState),
         VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
+        VMSTATE_BOOL_TEST(data_in_ready, ESPState, esp_is_version_5),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 91f8ffd6c8..61bc317a4c 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -41,6 +41,7 @@ struct ESPState {
     uint32_t cmdlen;
     uint32_t do_cmd;
 
+    bool data_in_ready;
     int dma_enabled;
 
     uint32_t async_len;
-- 
2.20.1


