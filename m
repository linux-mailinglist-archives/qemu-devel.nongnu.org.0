Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC24CB170
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:37:37 +0100 (CET)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWfA-0005aW-3H
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:37:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWc-0002JY-42
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:46 -0500
Received: from [2001:41c9:1:41f::167] (port=54802
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWa-0002HE-KI
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:45 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWVt-000C4G-J2; Wed, 02 Mar 2022 21:28:05 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Wed,  2 Mar 2022 21:27:50 +0000
Message-Id: <20220302212752.6922-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 08/10] esp: convert ESPState pdma_cb from a function
 pointer to an integer
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/esp.c         | 44 ++++++++++++++++++++++++++++++-------------
 include/hw/scsi/esp.h | 11 ++++++++++-
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 035fb0d1f6..a818b2b07a 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -195,16 +195,11 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     esp_set_tc(s, dmalen);
 }
 
-static void esp_set_pdma_cb(ESPState *s, void (*cb)(ESPState *))
+static void esp_set_pdma_cb(ESPState *s, enum pdma_cb cb)
 {
     s->pdma_cb = cb;
 }
 
-static void esp_pdma_cb(ESPState *s)
-{
-    s->pdma_cb(s);
-}
-
 static int esp_select(ESPState *s)
 {
     int target;
@@ -366,7 +361,7 @@ static void handle_satn(ESPState *s)
         s->dma_cb = handle_satn;
         return;
     }
-    esp_set_pdma_cb(s, satn_pdma_cb);
+    esp_set_pdma_cb(s, SATN_PDMA_CB);
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 1;
@@ -397,7 +392,7 @@ static void handle_s_without_atn(ESPState *s)
         s->dma_cb = handle_s_without_atn;
         return;
     }
-    esp_set_pdma_cb(s, s_without_satn_pdma_cb);
+    esp_set_pdma_cb(s, S_WITHOUT_SATN_PDMA_CB);
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 0;
@@ -432,7 +427,7 @@ static void handle_satn_stop(ESPState *s)
         s->dma_cb = handle_satn_stop;
         return;
     }
-    esp_set_pdma_cb(s, satn_stop_pdma_cb);
+    esp_set_pdma_cb(s, SATN_STOP_PDMA_CB);
     cmdlen = get_cmd(s, 1);
     if (cmdlen > 0) {
         trace_esp_handle_satn_stop(fifo8_num_used(&s->cmdfifo));
@@ -474,7 +469,7 @@ static void write_response(ESPState *s)
             s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
         } else {
-            esp_set_pdma_cb(s, write_response_pdma_cb);
+            esp_set_pdma_cb(s, WRITE_RESPONSE_PDMA_CB);
             esp_raise_drq(s);
             return;
         }
@@ -614,7 +609,7 @@ static void esp_do_dma(ESPState *s)
             s->dma_memory_read(s->dma_opaque, buf, len);
             fifo8_push_all(&s->cmdfifo, buf, len);
         } else {
-            esp_set_pdma_cb(s, do_dma_pdma_cb);
+            esp_set_pdma_cb(s, DO_DMA_PDMA_CB);
             esp_raise_drq(s);
             return;
         }
@@ -656,7 +651,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            esp_set_pdma_cb(s, do_dma_pdma_cb);
+            esp_set_pdma_cb(s, DO_DMA_PDMA_CB);
             esp_raise_drq(s);
             return;
         }
@@ -688,7 +683,7 @@ static void esp_do_dma(ESPState *s)
             }
 
             esp_set_tc(s, esp_get_tc(s) - len);
-            esp_set_pdma_cb(s, do_dma_pdma_cb);
+            esp_set_pdma_cb(s, DO_DMA_PDMA_CB);
             esp_raise_drq(s);
 
             /* Indicate transfer to FIFO is complete */
@@ -787,6 +782,29 @@ static void esp_do_nodma(ESPState *s)
     esp_raise_irq(s);
 }
 
+static void esp_pdma_cb(ESPState *s)
+{
+    switch (s->pdma_cb) {
+    case SATN_PDMA_CB:
+        satn_pdma_cb(s);
+        break;
+    case S_WITHOUT_SATN_PDMA_CB:
+        s_without_satn_pdma_cb(s);
+        break;
+    case SATN_STOP_PDMA_CB:
+        satn_stop_pdma_cb(s);
+        break;
+    case WRITE_RESPONSE_PDMA_CB:
+        write_response_pdma_cb(s);
+        break;
+    case DO_DMA_PDMA_CB:
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
index b1ec27612f..13b17496f8 100644
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
+enum pdma_cb {
+    SATN_PDMA_CB = 0,
+    S_WITHOUT_SATN_PDMA_CB = 1,
+    SATN_STOP_PDMA_CB = 2,
+    WRITE_RESPONSE_PDMA_CB = 3,
+    DO_DMA_PDMA_CB = 4
+};
+
 void esp_dma_enable(ESPState *s, int irq, int level);
 void esp_request_cancelled(SCSIRequest *req);
 void esp_command_complete(SCSIRequest *req, size_t resid);
-- 
2.20.1


