Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714B315741
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:58:03 +0100 (CET)
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Z98-0001Ji-JI
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yk1-0005KH-IN
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:05 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56910
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yjz-0002Yk-NZ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:05 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yk8-0007pt-6O; Tue, 09 Feb 2021 19:32:16 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:54 +0000
Message-Id: <20210209193018.31339-19-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 18/42] esp: accumulate SCSI commands for PDMA transfers in
 cmdbuf instead of pdma_buf
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

ESP SCSI commands are already accumulated in cmdbuf and so there is no need to
keep a separate pdma_buf buffer. Accumulate SCSI commands for PDMA transfers in
cmdbuf instead of pdma_buf so update cmdlen accordingly and change pdma_origin
for PDMA transfers to CMD which allows the PDMA origin to be removed.

This commit also removes a stray memcpy() from get_cmd() which is a no-op because
cmdlen is always zero at the start of a command.

Notionally the removal of pdma_buf from vmstate_esp_pdma also breaks migration
compatibility for the PDMA subsection until its complete removal by the end of
the series.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 56 +++++++++++++++++++------------------------
 include/hw/scsi/esp.h |  2 --
 2 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 7134c0aff4..b846f022fb 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -139,8 +139,6 @@ static void set_pdma(ESPState *s, enum pdma_origin_id origin,
 static uint8_t *get_pdma_buf(ESPState *s)
 {
     switch (s->pdma_origin) {
-    case PDMA:
-        return s->pdma_buf;
     case TI:
         return s->ti_buf;
     case CMD:
@@ -161,14 +159,12 @@ static uint8_t esp_pdma_read(ESPState *s)
     }
 
     switch (s->pdma_origin) {
-    case PDMA:
-        val = s->pdma_buf[s->pdma_cur++];
-        break;
     case TI:
         val = s->ti_buf[s->pdma_cur++];
         break;
     case CMD:
-        val = s->cmdbuf[s->pdma_cur++];
+        val = s->cmdbuf[s->cmdlen++];
+        s->pdma_cur++;
         break;
     case ASYNC:
         val = s->async_buf[s->pdma_cur++];
@@ -193,14 +189,12 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     }
 
     switch (s->pdma_origin) {
-    case PDMA:
-        s->pdma_buf[s->pdma_cur++] = val;
-        break;
     case TI:
         s->ti_buf[s->pdma_cur++] = val;
         break;
     case CMD:
-        s->cmdbuf[s->pdma_cur++] = val;
+        s->cmdbuf[s->cmdlen++] = val;
+        s->pdma_cur++;
         break;
     case ASYNC:
         s->async_buf[s->pdma_cur++] = val;
@@ -256,8 +250,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
         } else {
-            memcpy(s->pdma_buf, buf, dmalen);
-            set_pdma(s, PDMA, 0, dmalen);
+            set_pdma(s, CMD, 0, dmalen);
             esp_raise_drq(s);
             return 0;
         }
@@ -316,24 +309,24 @@ static void satn_pdma_cb(ESPState *s)
     if (get_cmd_cb(s) < 0) {
         return;
     }
-    if (s->pdma_cur != s->pdma_start) {
-        do_cmd(s, get_pdma_buf(s) + s->pdma_start);
+    s->do_cmd = 0;
+    if (s->cmdlen) {
+        do_cmd(s, s->cmdbuf);
     }
 }
 
 static void handle_satn(ESPState *s)
 {
-    uint8_t buf[32];
-    int len;
-
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_satn;
         return;
     }
     s->pdma_cb = satn_pdma_cb;
-    len = get_cmd(s, buf, sizeof(buf));
-    if (len) {
-        do_cmd(s, buf);
+    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
+    if (s->cmdlen) {
+        do_cmd(s, s->cmdbuf);
+    } else {
+        s->do_cmd = 1;
     }
 }
 
@@ -342,24 +335,24 @@ static void s_without_satn_pdma_cb(ESPState *s)
     if (get_cmd_cb(s) < 0) {
         return;
     }
-    if (s->pdma_cur != s->pdma_start) {
+    s->do_cmd = 0;
+    if (s->cmdlen) {
         do_busid_cmd(s, get_pdma_buf(s) + s->pdma_start, 0);
     }
 }
 
 static void handle_s_without_atn(ESPState *s)
 {
-    uint8_t buf[32];
-    int len;
-
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_s_without_atn;
         return;
     }
     s->pdma_cb = s_without_satn_pdma_cb;
-    len = get_cmd(s, buf, sizeof(buf));
-    if (len) {
-        do_busid_cmd(s, buf, 0);
+    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
+    if (s->cmdlen) {
+        do_busid_cmd(s, s->cmdbuf, 0);
+    } else {
+        s->do_cmd = 1;
     }
 }
 
@@ -368,7 +361,7 @@ static void satn_stop_pdma_cb(ESPState *s)
     if (get_cmd_cb(s) < 0) {
         return;
     }
-    s->cmdlen = s->pdma_cur - s->pdma_start;
+    s->do_cmd = 0;
     if (s->cmdlen) {
         trace_esp_handle_satn_stop(s->cmdlen);
         s->do_cmd = 1;
@@ -394,6 +387,8 @@ static void handle_satn_stop(ESPState *s)
         s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
         s->rregs[ESP_RSEQ] = SEQ_CD;
         esp_raise_irq(s);
+    } else {
+        s->do_cmd = 1;
     }
 }
 
@@ -865,11 +860,10 @@ static bool esp_pdma_needed(void *opaque)
 
 static const VMStateDescription vmstate_esp_pdma = {
     .name = "esp/pdma",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = esp_pdma_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_BUFFER(pdma_buf, ESPState),
         VMSTATE_INT32(pdma_origin, ESPState),
         VMSTATE_UINT32(pdma_len, ESPState),
         VMSTATE_UINT32(pdma_start, ESPState),
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 9fad320513..c323d43f70 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -16,7 +16,6 @@ typedef void (*ESPDMAMemoryReadWriteFunc)(void *opaque, uint8_t *buf, int len);
 typedef struct ESPState ESPState;
 
 enum pdma_origin_id {
-    PDMA,
     TI,
     CMD,
     ASYNC,
@@ -57,7 +56,6 @@ struct ESPState {
     ESPDMAMemoryReadWriteFunc dma_memory_write;
     void *dma_opaque;
     void (*dma_cb)(ESPState *s);
-    uint8_t pdma_buf[32];
     int pdma_origin;
     uint32_t pdma_len;
     uint32_t pdma_start;
-- 
2.20.1


