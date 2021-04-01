Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6959351069
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:54:07 +0200 (CEST)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRs9W-0002bE-R2
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5e-0005ax-KM
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:50:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57024
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5c-0000rH-VO
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:50:06 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5i-0004IO-TH; Thu, 01 Apr 2021 08:50:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Thu,  1 Apr 2021 08:49:26 +0100
Message-Id: <20210401074933.9923-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 04/11] esp: consolidate esp_cmdfifo_pop() into
 esp_fifo_pop()
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

Each FIFO currently has its own pop functions with the only difference being
the capacity check. The original reason for this was that the fifo8
implementation doesn't have a formal API for retrieving the FIFO capacity,
however there are multiple examples within QEMU where the capacity field is
accessed directly.

Change esp_fifo_pop() to access the FIFO capacity directly and then consolidate
esp_cmdfifo_pop() into esp_fifo_pop().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 16aaf8be93..ce88866803 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -107,22 +107,13 @@ static void esp_fifo_push(Fifo8 *fifo, uint8_t val)
 
     fifo8_push(fifo, val);
 }
-static uint8_t esp_fifo_pop(ESPState *s)
+static uint8_t esp_fifo_pop(Fifo8 *fifo)
 {
-    if (fifo8_is_empty(&s->fifo)) {
+    if (fifo8_is_empty(fifo)) {
         return 0;
     }
 
-    return fifo8_pop(&s->fifo);
-}
-
-static uint8_t esp_cmdfifo_pop(ESPState *s)
-{
-    if (fifo8_is_empty(&s->cmdfifo)) {
-        return 0;
-    }
-
-    return fifo8_pop(&s->cmdfifo);
+    return fifo8_pop(fifo);
 }
 
 static uint32_t esp_get_tc(ESPState *s)
@@ -159,9 +150,9 @@ static uint8_t esp_pdma_read(ESPState *s)
     uint8_t val;
 
     if (s->do_cmd) {
-        val = esp_cmdfifo_pop(s);
+        val = esp_fifo_pop(&s->cmdfifo);
     } else {
-        val = esp_fifo_pop(s);
+        val = esp_fifo_pop(&s->fifo);
     }
 
     return val;
@@ -887,7 +878,7 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
             qemu_log_mask(LOG_UNIMP, "esp: PIO data read not implemented\n");
             s->rregs[ESP_FIFO] = 0;
         } else {
-            s->rregs[ESP_FIFO] = esp_fifo_pop(s);
+            s->rregs[ESP_FIFO] = esp_fifo_pop(&s->fifo);
         }
         val = s->rregs[ESP_FIFO];
         break;
-- 
2.20.1


