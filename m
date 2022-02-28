Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F04F4C7D71
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 23:34:32 +0100 (CET)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOob9-00029B-I4
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 17:34:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoT7-0004Ko-Sn
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 17:26:14 -0500
Received: from [2001:41c9:1:41f::167] (port=51180
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoT5-0003RS-KF
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 17:26:13 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoSO-0004GN-Ms; Mon, 28 Feb 2022 22:25:32 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Mon, 28 Feb 2022 22:25:25 +0000
Message-Id: <20220228222527.8234-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/10] esp: convert ESPState pdma_cb from a function pointer
 to an integer
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

This prepares for the inclusion of the current PDMA callback in the migration
stream since the callback is referenced by an integer instead of a function
pointer.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 47 ++++++++++++++++++++++++++++++-------------
 include/hw/scsi/esp.h | 11 +++++++++-
 2 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 035fb0d1f6..e8b6f25dbb 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -195,14 +195,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     esp_set_tc(s, dmalen);
 }
 
-static void esp_set_pdma_cb(ESPState *s, void (*cb)(ESPState *))
+static void esp_set_pdma_cb(ESPState *s, int pdma_cb)
 {
-    s->pdma_cb = cb;
-}
-
-static void esp_pdma_cb(ESPState *s)
-{
-    s->pdma_cb(s);
+    assert(pdma_cb >= 0 && pdma_cb < PDMA_NUM_CBS);
+    s->pdma_cb = pdma_cb;
 }
 
 static int esp_select(ESPState *s)
@@ -366,7 +362,7 @@ static void handle_satn(ESPState *s)
         s->dma_cb = handle_satn;
         return;
     }
-    esp_set_pdma_cb(s, satn_pdma_cb);
+    esp_set_pdma_cb(s, PDMA_SATN_PDMA_CB);
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 1;
@@ -397,7 +393,7 @@ static void handle_s_without_atn(ESPState *s)
         s->dma_cb = handle_s_without_atn;
         return;
     }
-    esp_set_pdma_cb(s, s_without_satn_pdma_cb);
+    esp_set_pdma_cb(s, PDMA_S_WITHOUT_SATN_PDMA_CB);
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 0;
@@ -432,7 +428,7 @@ static void handle_satn_stop(ESPState *s)
         s->dma_cb = handle_satn_stop;
         return;
     }
-    esp_set_pdma_cb(s, satn_stop_pdma_cb);
+    esp_set_pdma_cb(s, PDMA_SATN_STOP_PDMA_CB);
     cmdlen = get_cmd(s, 1);
     if (cmdlen > 0) {
         trace_esp_handle_satn_stop(fifo8_num_used(&s->cmdfifo));
@@ -474,7 +470,7 @@ static void write_response(ESPState *s)
             s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
         } else {
-            esp_set_pdma_cb(s, write_response_pdma_cb);
+            esp_set_pdma_cb(s, PDMA_WRITE_RESPONSE_PDMA_CB);
             esp_raise_drq(s);
             return;
         }
@@ -614,7 +610,7 @@ static void esp_do_dma(ESPState *s)
             s->dma_memory_read(s->dma_opaque, buf, len);
             fifo8_push_all(&s->cmdfifo, buf, len);
         } else {
-            esp_set_pdma_cb(s, do_dma_pdma_cb);
+            esp_set_pdma_cb(s, PDMA_DO_DMA_PDMA_CB);
             esp_raise_drq(s);
             return;
         }
@@ -656,7 +652,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            esp_set_pdma_cb(s, do_dma_pdma_cb);
+            esp_set_pdma_cb(s, PDMA_DO_DMA_PDMA_CB);
             esp_raise_drq(s);
             return;
         }
@@ -688,7 +684,7 @@ static void esp_do_dma(ESPState *s)
             }
 
             esp_set_tc(s, esp_get_tc(s) - len);
-            esp_set_pdma_cb(s, do_dma_pdma_cb);
+            esp_set_pdma_cb(s, PDMA_DO_DMA_PDMA_CB);
             esp_raise_drq(s);
 
             /* Indicate transfer to FIFO is complete */
@@ -787,6 +783,29 @@ static void esp_do_nodma(ESPState *s)
     esp_raise_irq(s);
 }
 
+static void esp_pdma_cb(ESPState *s)
+{
+    switch (s->pdma_cb) {
+    case PDMA_SATN_PDMA_CB:
+        satn_pdma_cb(s);
+        break;
+    case PDMA_S_WITHOUT_SATN_PDMA_CB:
+        s_without_satn_pdma_cb(s);
+        break;
+    case PDMA_SATN_STOP_PDMA_CB:
+        satn_stop_pdma_cb(s);
+        break;
+    case PDMA_WRITE_RESPONSE_PDMA_CB:
+        write_response_pdma_cb(s);
+        break;
+    case PDMA_DO_DMA_PDMA_CB:
+        do_dma_pdma_cb(s);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 void esp_command_complete(SCSIRequest *req, size_t resid)
 {
     ESPState *s = req->hba_private;
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index b1ec27612f..885ccf4660 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -51,7 +51,7 @@ struct ESPState {
     ESPDMAMemoryReadWriteFunc dma_memory_write;
     void *dma_opaque;
     void (*dma_cb)(ESPState *s);
-    void (*pdma_cb)(ESPState *s);
+    uint8_t pdma_cb;
 
     uint8_t mig_version_id;
 
@@ -150,6 +150,15 @@ struct SysBusESPState {
 #define TCHI_FAS100A 0x4
 #define TCHI_AM53C974 0x12
 
+/* PDMA callbacks */
+#define PDMA_SATN_PDMA_CB              0
+#define PDMA_S_WITHOUT_SATN_PDMA_CB    1
+#define PDMA_SATN_STOP_PDMA_CB         2
+#define PDMA_WRITE_RESPONSE_PDMA_CB    3
+#define PDMA_DO_DMA_PDMA_CB            4
+
+#define PDMA_NUM_CBS                   5
+
 void esp_dma_enable(ESPState *s, int irq, int level);
 void esp_request_cancelled(SCSIRequest *req);
 void esp_command_complete(SCSIRequest *req, size_t resid);
-- 
2.20.1


