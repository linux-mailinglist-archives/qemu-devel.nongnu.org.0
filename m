Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AFB32DD15
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:33:32 +0100 (CET)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwXD-0002Ha-En
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEb-00013I-4x
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:14:17 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40218
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEZ-0006bN-7B
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:14:16 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEL-0008MJ-GI; Thu, 04 Mar 2021 22:14:03 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Thu,  4 Mar 2021 22:10:53 +0000
Message-Id: <20210304221103.6369-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 32/42] esp: latch individual bits in ESP_RINTR register
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

Currently the ESP_RINTR register is set to a specific value as required within
the ESP state machine. In order to implement the upcoming deferred interrupt
functionality it is necessary to set individual bits within ESP_RINTR so that
a deferred interrupt will not overwrite the value of any other interrupt bits.

This also requires fixing up a few locations where the ESP_RINTR and ESP_RSEQ
registers are set/reset unexpectedly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/esp.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 6aae6f91c2..54d008c609 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -178,7 +178,7 @@ static int esp_select(ESPState *s)
     if (!s->current_dev) {
         /* No such drive */
         s->rregs[ESP_RSTAT] = 0;
-        s->rregs[ESP_RINTR] = INTR_DC;
+        s->rregs[ESP_RINTR] |= INTR_DC;
         s->rregs[ESP_RSEQ] = SEQ_0;
         esp_raise_irq(s);
         return -1;
@@ -245,7 +245,7 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
         }
         scsi_req_continue(s->current_req);
     }
-    s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+    s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
     s->rregs[ESP_RSEQ] = SEQ_CD;
     esp_raise_irq(s);
     esp_lower_drq(s);
@@ -326,7 +326,7 @@ static void satn_stop_pdma_cb(ESPState *s)
         trace_esp_handle_satn_stop(s->cmdlen);
         s->do_cmd = 1;
         s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
-        s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+        s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
         esp_raise_irq(s);
     }
@@ -346,8 +346,8 @@ static void handle_satn_stop(ESPState *s)
         trace_esp_handle_satn_stop(s->cmdlen);
         s->cmdlen = cmdlen;
         s->do_cmd = 1;
-        s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
-        s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+        s->rregs[ESP_RSTAT] = STAT_CD;
+        s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
         esp_raise_irq(s);
     } else if (cmdlen == 0) {
@@ -362,7 +362,7 @@ static void handle_satn_stop(ESPState *s)
 static void write_response_pdma_cb(ESPState *s)
 {
     s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
-    s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+    s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
     s->rregs[ESP_RSEQ] = SEQ_CD;
     esp_raise_irq(s);
 }
@@ -376,7 +376,7 @@ static void write_response(ESPState *s)
         if (s->dma_memory_write) {
             s->dma_memory_write(s->dma_opaque, s->ti_buf, 2);
             s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
-            s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
+            s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
         } else {
             s->pdma_cb = write_response_pdma_cb;
@@ -395,7 +395,7 @@ static void write_response(ESPState *s)
 static void esp_dma_done(ESPState *s)
 {
     s->rregs[ESP_RSTAT] |= STAT_TC;
-    s->rregs[ESP_RINTR] = INTR_BS;
+    s->rregs[ESP_RINTR] |= INTR_BS;
     s->rregs[ESP_RSEQ] = 0;
     s->rregs[ESP_RFLAGS] = 0;
     esp_set_tc(s, 0);
@@ -700,7 +700,7 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
         val = s->rregs[ESP_RINTR];
         s->rregs[ESP_RINTR] = 0;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
-        s->rregs[ESP_RSEQ] = SEQ_CD;
+        s->rregs[ESP_RSEQ] = SEQ_0;
         esp_lower_irq(s);
         if (s->deferred_complete) {
             esp_report_command_complete(s, s->deferred_status);
@@ -771,9 +771,6 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             /*s->ti_size = 0;*/
             s->ti_wptr = 0;
             s->ti_rptr = 0;
-            s->rregs[ESP_RINTR] = INTR_FC;
-            s->rregs[ESP_RSEQ] = 0;
-            s->rregs[ESP_RFLAGS] = 0;
             break;
         case CMD_RESET:
             trace_esp_mem_writeb_cmd_reset(val);
@@ -781,8 +778,8 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             break;
         case CMD_BUSRESET:
             trace_esp_mem_writeb_cmd_bus_reset(val);
-            s->rregs[ESP_RINTR] = INTR_RST;
             if (!(s->wregs[ESP_CFG1] & CFG1_RESREPT)) {
+                s->rregs[ESP_RINTR] |= INTR_RST;
                 esp_raise_irq(s);
             }
             break;
@@ -793,12 +790,12 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         case CMD_ICCS:
             trace_esp_mem_writeb_cmd_iccs(val);
             write_response(s);
-            s->rregs[ESP_RINTR] = INTR_FC;
+            s->rregs[ESP_RINTR] |= INTR_FC;
             s->rregs[ESP_RSTAT] |= STAT_MI;
             break;
         case CMD_MSGACC:
             trace_esp_mem_writeb_cmd_msgacc(val);
-            s->rregs[ESP_RINTR] = INTR_DC;
+            s->rregs[ESP_RINTR] |= INTR_DC;
             s->rregs[ESP_RSEQ] = 0;
             s->rregs[ESP_RFLAGS] = 0;
             esp_raise_irq(s);
@@ -806,7 +803,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         case CMD_PAD:
             trace_esp_mem_writeb_cmd_pad(val);
             s->rregs[ESP_RSTAT] = STAT_TC;
-            s->rregs[ESP_RINTR] = INTR_FC;
+            s->rregs[ESP_RINTR] |= INTR_FC;
             s->rregs[ESP_RSEQ] = 0;
             break;
         case CMD_SATN:
-- 
2.20.1


