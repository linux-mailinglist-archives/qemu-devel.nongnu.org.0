Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0335D333
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:34:16 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW58J-00033A-Mz
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vr-00030H-Gg
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44066
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vn-0002kX-8e
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:23 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vw-0004Dc-Ld; Mon, 12 Apr 2021 23:21:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 12 Apr 2021 23:20:39 +0100
Message-Id: <20210412222048.22818-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
References: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 04/13] esp: consolidate esp_cmdfifo_push() into esp_fifo_push()
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

Each FIFO currently has its own push functions with the only difference being
the capacity check. The original reason for this was that the fifo8
implementation doesn't have a formal API for retrieving the FIFO capacity,
however there are multiple examples within QEMU where the capacity field is
accessed directly.

Change esp_fifo_push() to access the FIFO capacity directly and then consolidate
esp_cmdfifo_push() into esp_fifo_push().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210407195801.685-4-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 2584ec6fb1..b3471e0333 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -98,16 +98,15 @@ void esp_request_cancelled(SCSIRequest *req)
     }
 }
 
-static void esp_fifo_push(ESPState *s, uint8_t val)
+static void esp_fifo_push(Fifo8 *fifo, uint8_t val)
 {
-    if (fifo8_num_used(&s->fifo) == ESP_FIFO_SZ) {
+    if (fifo8_num_used(fifo) == fifo->capacity) {
         trace_esp_error_fifo_overrun();
         return;
     }
 
-    fifo8_push(&s->fifo, val);
+    fifo8_push(fifo, val);
 }
-
 static uint8_t esp_fifo_pop(ESPState *s)
 {
     if (fifo8_is_empty(&s->fifo)) {
@@ -117,16 +116,6 @@ static uint8_t esp_fifo_pop(ESPState *s)
     return fifo8_pop(&s->fifo);
 }
 
-static void esp_cmdfifo_push(ESPState *s, uint8_t val)
-{
-    if (fifo8_num_used(&s->cmdfifo) == ESP_CMDFIFO_SZ) {
-        trace_esp_error_fifo_overrun();
-        return;
-    }
-
-    fifo8_push(&s->cmdfifo, val);
-}
-
 static uint8_t esp_cmdfifo_pop(ESPState *s)
 {
     if (fifo8_is_empty(&s->cmdfifo)) {
@@ -187,9 +176,9 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     }
 
     if (s->do_cmd) {
-        esp_cmdfifo_push(s, val);
+        esp_fifo_push(&s->cmdfifo, val);
     } else {
-        esp_fifo_push(s, val);
+        esp_fifo_push(&s->fifo, val);
     }
 
     dmalen--;
@@ -645,7 +634,7 @@ static void esp_do_dma(ESPState *s)
              */
             if (len < esp_get_tc(s) && esp_get_tc(s) <= ESP_FIFO_SZ) {
                 while (fifo8_num_used(&s->fifo) < ESP_FIFO_SZ) {
-                    esp_fifo_push(s, 0);
+                    esp_fifo_push(&s->fifo, 0);
                     len++;
                 }
             }
@@ -947,9 +936,9 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         break;
     case ESP_FIFO:
         if (s->do_cmd) {
-            esp_cmdfifo_push(s, val);
+            esp_fifo_push(&s->cmdfifo, val);
         } else {
-            esp_fifo_push(s, val);
+            esp_fifo_push(&s->fifo, val);
         }
 
         /* Non-DMA transfers raise an interrupt after every byte */
-- 
2.20.1


