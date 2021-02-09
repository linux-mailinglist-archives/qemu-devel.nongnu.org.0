Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35623315700
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:46:08 +0100 (CET)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yxb-0003MY-A6
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yj7-0004FB-Uu
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:10 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56786
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yiy-000273-Tw
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:09 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YjG-0007pt-4f; Tue, 09 Feb 2021 19:31:24 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:42 +0000
Message-Id: <20210209193018.31339-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 06/42] esp: fix esp_reg_read() trace event
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

Move the trace event to the end of the function so that it correctly reports
the returned value if it doesn't come directly from the rregs array.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/esp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 9951472ee6..c36cb0f238 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -595,9 +595,8 @@ static void parent_esp_reset(ESPState *s, int irq, int level)
 
 uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
 {
-    uint32_t old_val;
+    uint32_t val;
 
-    trace_esp_mem_readb(saddr, s->rregs[saddr]);
     switch (saddr) {
     case ESP_FIFO:
         if ((s->rregs[ESP_RSTAT] & STAT_PIO_MASK) == 0) {
@@ -612,13 +611,14 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
             s->ti_rptr = 0;
             s->ti_wptr = 0;
         }
+        val = s->rregs[ESP_FIFO];
         break;
     case ESP_RINTR:
         /*
          * Clear sequence step, interrupt register and all status bits
          * except TC
          */
-        old_val = s->rregs[ESP_RINTR];
+        val = s->rregs[ESP_RINTR];
         s->rregs[ESP_RINTR] = 0;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -627,16 +627,22 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
             esp_report_command_complete(s, s->deferred_status);
             s->deferred_complete = false;
         }
-        return old_val;
+        break;
     case ESP_TCHI:
         /* Return the unique id if the value has never been written */
         if (!s->tchi_written) {
-            return s->chip_id;
+            val = s->chip_id;
+        } else {
+            val = s->rregs[saddr];
         }
+        break;
     default:
+        val = s->rregs[saddr];
         break;
     }
-    return s->rregs[saddr];
+
+    trace_esp_mem_readb(saddr, val);
+    return val;
 }
 
 void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
-- 
2.20.1


