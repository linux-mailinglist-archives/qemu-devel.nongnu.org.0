Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67822315786
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:13:18 +0100 (CET)
Received: from localhost ([::1]:40540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZNt-0007sX-EL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YlR-0006fm-1i
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:33 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57102
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YlP-00036c-6a
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:32 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YlX-0007pt-Ub; Tue, 09 Feb 2021 19:33:44 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:13 +0000
Message-Id: <20210209193018.31339-38-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 37/42] esp: transition to message out phase after SATN and
 stop command
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

The SCSI bus should remain in the message out phase after the SATN and stop
command rather than transitioning to the command phase. A new ESPState variable
cmdbuf_cdb_offset is added which stores the offset of the CDB from the start
of cmdbuf when accumulating extended message out phase data.

Currently any extended message out data is discarded in do_cmd() before the CDB
is processed in do_busid_cmd().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 72 ++++++++++++++++++++++++++++++++++---------
 include/hw/scsi/esp.h |  2 ++
 2 files changed, 60 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 058b482fda..5a66b7d710 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -272,13 +272,15 @@ static void do_cmd(ESPState *s)
     uint8_t *buf = s->cmdbuf;
     uint8_t busid = buf[0];
 
-    do_busid_cmd(s, &buf[1], busid);
+    /* Ignore extended messages for now */
+    do_busid_cmd(s, &buf[s->cmdbuf_cdb_offset], busid);
 }
 
 static void satn_pdma_cb(ESPState *s)
 {
     s->do_cmd = 0;
     if (s->cmdlen) {
+        s->cmdbuf_cdb_offset = 1;
         do_cmd(s);
     }
 }
@@ -295,6 +297,7 @@ static void handle_satn(ESPState *s)
     cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
     if (cmdlen > 0) {
         s->cmdlen = cmdlen;
+        s->cmdbuf_cdb_offset = 1;
         do_cmd(s);
     } else if (cmdlen == 0) {
         s->cmdlen = 0;
@@ -309,6 +312,7 @@ static void s_without_satn_pdma_cb(ESPState *s)
 {
     s->do_cmd = 0;
     if (s->cmdlen) {
+        s->cmdbuf_cdb_offset = 0;
         do_busid_cmd(s, s->cmdbuf, 0);
     }
 }
@@ -325,6 +329,7 @@ static void handle_s_without_atn(ESPState *s)
     cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
     if (cmdlen > 0) {
         s->cmdlen = cmdlen;
+        s->cmdbuf_cdb_offset = 0;
         do_busid_cmd(s, s->cmdbuf, 0);
     } else if (cmdlen == 0) {
         s->cmdlen = 0;
@@ -341,6 +346,7 @@ static void satn_stop_pdma_cb(ESPState *s)
     if (s->cmdlen) {
         trace_esp_handle_satn_stop(s->cmdlen);
         s->do_cmd = 1;
+        s->cmdbuf_cdb_offset = 1;
         s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
         s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
@@ -357,21 +363,22 @@ static void handle_satn_stop(ESPState *s)
         return;
     }
     s->pdma_cb = satn_stop_pdma_cb;
-    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
+    cmdlen = get_cmd(s, 1);
     if (cmdlen > 0) {
-        trace_esp_handle_satn_stop(s->cmdlen);
+        trace_esp_handle_satn_stop(cmdlen);
         s->cmdlen = cmdlen;
         s->do_cmd = 1;
-        s->rregs[ESP_RSTAT] = STAT_CD;
+        s->cmdbuf_cdb_offset = 1;
+        s->rregs[ESP_RSTAT] = STAT_MO;
         s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
-        s->rregs[ESP_RSEQ] = SEQ_CD;
+        s->rregs[ESP_RSEQ] = SEQ_MO;
         esp_raise_irq(s);
     } else if (cmdlen == 0) {
         s->cmdlen = 0;
         s->do_cmd = 1;
-        /* Target present, but no cmd yet - switch to command phase */
-        s->rregs[ESP_RSEQ] = SEQ_CD;
-        s->rregs[ESP_RSTAT] = STAT_CD;
+        /* Target present, switch to message out phase */
+        s->rregs[ESP_RSEQ] = SEQ_MO;
+        s->rregs[ESP_RSTAT] = STAT_MO;
     }
 }
 
@@ -511,9 +518,27 @@ static void esp_do_dma(ESPState *s)
         }
         trace_esp_handle_ti_cmd(s->cmdlen);
         s->ti_size = 0;
-        s->cmdlen = 0;
-        s->do_cmd = 0;
-        do_cmd(s);
+        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
+            /* No command received */
+            if (s->cmdbuf_cdb_offset == s->cmdlen) {
+                return;
+            }
+
+            /* Command has been received */
+            s->cmdlen = 0;
+            s->do_cmd = 0;
+            do_cmd(s);
+        } else {
+            /*
+             * Extra message out bytes received: update cmdbuf_cdb_offset
+             * and then switch to commmand phase
+             */
+            s->cmdbuf_cdb_offset = s->cmdlen;
+            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
+            s->rregs[ESP_RSEQ] = SEQ_CD;
+            s->rregs[ESP_RINTR] |= INTR_BS;
+            esp_raise_irq(s);
+        }
         return;
     }
     if (s->async_len == 0) {
@@ -662,9 +687,27 @@ static void handle_ti(ESPState *s)
     } else if (s->do_cmd) {
         trace_esp_handle_ti_cmd(s->cmdlen);
         s->ti_size = 0;
-        s->cmdlen = 0;
-        s->do_cmd = 0;
-        do_cmd(s);
+        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
+            /* No command received */
+            if (s->cmdbuf_cdb_offset == s->cmdlen) {
+                return;
+            }
+
+            /* Command has been received */
+            s->cmdlen = 0;
+            s->do_cmd = 0;
+            do_cmd(s);
+        } else {
+            /*
+             * Extra message out bytes received: update cmdbuf_cdb_offset
+             * and then switch to commmand phase
+             */
+            s->cmdbuf_cdb_offset = s->cmdlen;
+            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
+            s->rregs[ESP_RSEQ] = SEQ_CD;
+            s->rregs[ESP_RINTR] |= INTR_BS;
+            esp_raise_irq(s);
+        }
     }
 }
 
@@ -951,6 +994,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT32(do_cmd, ESPState),
         VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
         VMSTATE_BOOL_TEST(data_in_ready, ESPState, esp_is_version_5),
+        VMSTATE_UINT8_TEST(cmdbuf_cdb_offset, ESPState, esp_is_version_5),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 5e68908fcb..6f3bf4a0ce 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -37,6 +37,7 @@ struct ESPState {
     SCSIRequest *current_req;
     uint8_t cmdbuf[ESP_CMDBUF_SZ];
     uint32_t cmdlen;
+    uint8_t cmdbuf_cdb_offset;
     uint32_t do_cmd;
 
     bool data_in_ready;
@@ -136,6 +137,7 @@ struct SysBusESPState {
 #define INTR_RST 0x80
 
 #define SEQ_0 0x0
+#define SEQ_MO 0x1
 #define SEQ_CD 0x4
 
 #define CFG1_RESREPT 0x40
-- 
2.20.1


