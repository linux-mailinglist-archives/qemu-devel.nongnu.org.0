Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E794CB155
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:31:48 +0100 (CET)
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWZX-0004nt-Lq
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:31:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWU-0001yw-MT
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:38 -0500
Received: from [2001:41c9:1:41f::167] (port=54782
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWT-0002FF-5f
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:38 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWVl-000C4G-5p; Wed, 02 Mar 2022 21:27:57 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Wed,  2 Mar 2022 21:27:48 +0000
Message-Id: <20220302212752.6922-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 06/10] esp: introduce esp_set_pdma_cb() function
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

This function is to be used to set the current PDMA callback rather than
accessing the ESPState pdma_cb function pointer directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/esp.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 58d0edbd56..d1640218c4 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -195,6 +195,11 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     esp_set_tc(s, dmalen);
 }
 
+static void esp_set_pdma_cb(ESPState *s, void (*cb)(ESPState *))
+{
+    s->pdma_cb = cb;
+}
+
 static int esp_select(ESPState *s)
 {
     int target;
@@ -356,7 +361,7 @@ static void handle_satn(ESPState *s)
         s->dma_cb = handle_satn;
         return;
     }
-    s->pdma_cb = satn_pdma_cb;
+    esp_set_pdma_cb(s, satn_pdma_cb);
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 1;
@@ -387,7 +392,7 @@ static void handle_s_without_atn(ESPState *s)
         s->dma_cb = handle_s_without_atn;
         return;
     }
-    s->pdma_cb = s_without_satn_pdma_cb;
+    esp_set_pdma_cb(s, s_without_satn_pdma_cb);
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 0;
@@ -422,7 +427,7 @@ static void handle_satn_stop(ESPState *s)
         s->dma_cb = handle_satn_stop;
         return;
     }
-    s->pdma_cb = satn_stop_pdma_cb;
+    esp_set_pdma_cb(s, satn_stop_pdma_cb);
     cmdlen = get_cmd(s, 1);
     if (cmdlen > 0) {
         trace_esp_handle_satn_stop(fifo8_num_used(&s->cmdfifo));
@@ -464,7 +469,7 @@ static void write_response(ESPState *s)
             s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
         } else {
-            s->pdma_cb = write_response_pdma_cb;
+            esp_set_pdma_cb(s, write_response_pdma_cb);
             esp_raise_drq(s);
             return;
         }
@@ -604,7 +609,7 @@ static void esp_do_dma(ESPState *s)
             s->dma_memory_read(s->dma_opaque, buf, len);
             fifo8_push_all(&s->cmdfifo, buf, len);
         } else {
-            s->pdma_cb = do_dma_pdma_cb;
+            esp_set_pdma_cb(s, do_dma_pdma_cb);
             esp_raise_drq(s);
             return;
         }
@@ -646,7 +651,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            s->pdma_cb = do_dma_pdma_cb;
+            esp_set_pdma_cb(s, do_dma_pdma_cb);
             esp_raise_drq(s);
             return;
         }
@@ -678,7 +683,7 @@ static void esp_do_dma(ESPState *s)
             }
 
             esp_set_tc(s, esp_get_tc(s) - len);
-            s->pdma_cb = do_dma_pdma_cb;
+            esp_set_pdma_cb(s, do_dma_pdma_cb);
             esp_raise_drq(s);
 
             /* Indicate transfer to FIFO is complete */
-- 
2.20.1


