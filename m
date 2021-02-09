Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D844A315762
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:05:39 +0100 (CET)
Received: from localhost ([::1]:51892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZGU-0000GY-W4
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkV-0005oh-7k
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:35 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56982
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkT-0002md-KC
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:34 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ykc-0007pt-48; Tue, 09 Feb 2021 19:32:46 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:01 +0000
Message-Id: <20210209193018.31339-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 25/42] esp: remove CMD pdma_origin
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

The cmdbuf is really just a copy of FIFO data (including extra message phase
bytes) so its pdma_origin is effectively TI. Fortunately we already know when
we are receiving a SCSI command since do_cmd == 1 which enables us to
distinguish between the two cases in esp_pdma_read()/esp_pdma_write().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 22 ++++++++++++----------
 include/hw/scsi/esp.h |  1 -
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index bff330733f..921f79ae89 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -143,10 +143,11 @@ static uint8_t esp_pdma_read(ESPState *s)
 
     switch (s->pdma_origin) {
     case TI:
-        val = s->ti_buf[s->ti_rptr++];
-        break;
-    case CMD:
-        val = s->cmdbuf[s->cmdlen++];
+        if (s->do_cmd) {
+            val = s->cmdbuf[s->cmdlen++];
+        } else {
+            val = s->ti_buf[s->ti_rptr++];
+        }
         break;
     case ASYNC:
         val = s->async_buf[0];
@@ -176,10 +177,11 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
 
     switch (s->pdma_origin) {
     case TI:
-        s->ti_buf[s->ti_wptr++] = val;
-        break;
-    case CMD:
-        s->cmdbuf[s->cmdlen++] = val;
+        if (s->do_cmd) {
+            s->cmdbuf[s->cmdlen++] = val;
+        } else {
+            s->ti_buf[s->ti_wptr++] = val;
+        }
         break;
     case ASYNC:
         s->async_buf[0] = val;
@@ -240,7 +242,7 @@ static uint32_t get_cmd(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
         } else {
-            set_pdma(s, CMD);
+            set_pdma(s, TI);
             esp_raise_drq(s);
             return 0;
         }
@@ -471,7 +473,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
         } else {
-            set_pdma(s, CMD);
+            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 1e84b7bfb0..a8d5bf8a63 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -17,7 +17,6 @@ typedef struct ESPState ESPState;
 
 enum pdma_origin_id {
     TI,
-    CMD,
     ASYNC,
 };
 
-- 
2.20.1


