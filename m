Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADEA3156FD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:44:13 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yvk-0001ab-46
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ykf-00066X-CP
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:50 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57002
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ykd-0002og-F8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:45 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ykm-0007pt-8F; Tue, 09 Feb 2021 19:32:57 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:03 +0000
Message-Id: <20210209193018.31339-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 27/42] esp: fix PDMA target selection
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

Currently the target selection for PDMA is done after the SCSI command has been
delivered which is not correct. Perform target selection as part of the initial
get_cmd() call when the command is submitted: if no target is present, don't
raise DRQ.

If the target is present then switch to the command phase since the MacOS toolbox
ROM checks for this before attempting to submit the SCSI command.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 53 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 6736e7142c..b7ab5a5592 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -243,6 +243,9 @@ static uint32_t get_cmd(ESPState *s)
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
         } else {
             set_pdma(s, TI);
+            if (esp_select(s) < 0) {
+                return -1;
+            }
             esp_raise_drq(s);
             return 0;
         }
@@ -257,7 +260,7 @@ static uint32_t get_cmd(ESPState *s)
     trace_esp_get_cmd(dmalen, target);
 
     if (esp_select(s) < 0) {
-        return 0;
+        return -1;
     }
     return dmalen;
 }
@@ -299,9 +302,6 @@ static void do_cmd(ESPState *s)
 
 static void satn_pdma_cb(ESPState *s)
 {
-    if (esp_select(s) < 0) {
-        return;
-    }
     s->do_cmd = 0;
     if (s->cmdlen) {
         do_cmd(s);
@@ -310,24 +310,28 @@ static void satn_pdma_cb(ESPState *s)
 
 static void handle_satn(ESPState *s)
 {
+    int32_t cmdlen;
+
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_satn;
         return;
     }
     s->pdma_cb = satn_pdma_cb;
-    s->cmdlen = get_cmd(s);
-    if (s->cmdlen) {
+    cmdlen = get_cmd(s);
+    if (cmdlen > 0) {
+        s->cmdlen = cmdlen;
         do_cmd(s);
-    } else {
+    } else if (cmdlen == 0) {
+        s->cmdlen = 0;
         s->do_cmd = 1;
+        /* Target present, but no cmd yet - switch to command phase */
+        s->rregs[ESP_RSEQ] = SEQ_CD;
+        s->rregs[ESP_RSTAT] = STAT_CD;
     }
 }
 
 static void s_without_satn_pdma_cb(ESPState *s)
 {
-    if (esp_select(s) < 0) {
-        return;
-    }
     s->do_cmd = 0;
     if (s->cmdlen) {
         do_busid_cmd(s, s->cmdbuf, 0);
@@ -336,24 +340,28 @@ static void s_without_satn_pdma_cb(ESPState *s)
 
 static void handle_s_without_atn(ESPState *s)
 {
+    int32_t cmdlen;
+
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_s_without_atn;
         return;
     }
     s->pdma_cb = s_without_satn_pdma_cb;
-    s->cmdlen = get_cmd(s);
-    if (s->cmdlen) {
+    cmdlen = get_cmd(s);
+    if (cmdlen > 0) {
+        s->cmdlen = cmdlen;
         do_busid_cmd(s, s->cmdbuf, 0);
-    } else {
+    } else if (cmdlen == 0) {
+        s->cmdlen = 0;
         s->do_cmd = 1;
+        /* Target present, but no cmd yet - switch to command phase */
+        s->rregs[ESP_RSEQ] = SEQ_CD;
+        s->rregs[ESP_RSTAT] = STAT_CD;
     }
 }
 
 static void satn_stop_pdma_cb(ESPState *s)
 {
-    if (esp_select(s) < 0) {
-        return;
-    }
     s->do_cmd = 0;
     if (s->cmdlen) {
         trace_esp_handle_satn_stop(s->cmdlen);
@@ -367,21 +375,28 @@ static void satn_stop_pdma_cb(ESPState *s)
 
 static void handle_satn_stop(ESPState *s)
 {
+    int32_t cmdlen;
+
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_satn_stop;
         return;
     }
     s->pdma_cb = satn_stop_pdma_cb;
-    s->cmdlen = get_cmd(s);
-    if (s->cmdlen) {
+    cmdlen = get_cmd(s);
+    if (cmdlen > 0) {
         trace_esp_handle_satn_stop(s->cmdlen);
+        s->cmdlen = cmdlen;
         s->do_cmd = 1;
         s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
         s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
         esp_raise_irq(s);
-    } else {
+    } else if (cmdlen == 0) {
+        s->cmdlen = 0;
         s->do_cmd = 1;
+        /* Target present, but no cmd yet - switch to command phase */
+        s->rregs[ESP_RSEQ] = SEQ_CD;
+        s->rregs[ESP_RSTAT] = STAT_CD;
     }
 }
 
-- 
2.20.1


