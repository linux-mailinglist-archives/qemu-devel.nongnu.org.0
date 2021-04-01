Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F53351065
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:52:36 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRs83-000148-Oz
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5W-0005Lp-Gt
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:49:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57008
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5V-0000kR-2W
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:49:58 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5Z-0004IO-8s; Thu, 01 Apr 2021 08:50:07 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Thu,  1 Apr 2021 08:49:24 +0100
Message-Id: <20210401074933.9923-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 02/11] esp: rework write_response() to avoid using the FIFO
 for DMA transactions
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

The code for write_response() has always used the FIFO to store the data for
the status/message in phases, even for DMA transactions. Switch to using a
separate buffer that can be used directly for DMA transactions and restrict
the FIFO use to the non-DMA case.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index bafea0d4e6..26fe1dcb9d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -445,18 +445,16 @@ static void write_response_pdma_cb(ESPState *s)
 
 static void write_response(ESPState *s)
 {
-    uint32_t n;
+    uint8_t buf[2];
 
     trace_esp_write_response(s->status);
 
-    fifo8_reset(&s->fifo);
-    esp_fifo_push(s, s->status);
-    esp_fifo_push(s, 0);
+    buf[0] = s->status;
+    buf[1] = 0;
 
     if (s->dma) {
         if (s->dma_memory_write) {
-            s->dma_memory_write(s->dma_opaque,
-                                (uint8_t *)fifo8_pop_buf(&s->fifo, 2, &n), 2);
+            s->dma_memory_write(s->dma_opaque, buf, 2);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
             s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -466,7 +464,8 @@ static void write_response(ESPState *s)
             return;
         }
     } else {
-        s->ti_size = 2;
+        fifo8_reset(&s->fifo);
+        fifo8_push_all(&s->fifo, buf, 2);
         s->rregs[ESP_RFLAGS] = 2;
     }
     esp_raise_irq(s);
-- 
2.20.1


