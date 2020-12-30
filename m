Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E712E7ACA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:56:28 +0100 (CET)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudpr-00035f-92
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZo-0001jJ-Cv
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:52 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50946
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZm-0002JT-JA
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:52 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZb-00070L-1K; Wed, 30 Dec 2020 15:39:43 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:44 +0000
Message-Id: <20201230153745.30241-25-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 24/25] esp: remove pdma_origin from ESPState
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

Now that all data is transferred via the FIFO (ti_buf) there is no need to track
the source buffer being used for the data transfer. This also eliminates the
need for a separate subsection for PDMA state migration.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 74 +++++--------------------------------------
 include/hw/scsi/esp.h |  6 ----
 2 files changed, 8 insertions(+), 72 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index d2a70998aa..773fe09c49 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -127,32 +127,14 @@ static uint32_t esp_get_stc(ESPState *s)
     return dmalen;
 }
 
-static void set_pdma(ESPState *s, enum pdma_origin_id origin)
-{
-    s->pdma_origin = origin;
-}
-
 static uint8_t esp_pdma_read(ESPState *s)
 {
     uint8_t val;
 
-    switch (s->pdma_origin) {
-    case TI:
-        if (s->do_cmd) {
-            val = s->cmdbuf[s->cmdlen++];
-        } else {
-            val = s->ti_buf[s->ti_rptr++];
-        }
-        break;
-    case ASYNC:
-        val = s->async_buf[0];
-        if (s->async_len > 0) {
-            s->async_len--;
-            s->async_buf++;
-        }
-        break;
-    default:
-        g_assert_not_reached();
+    if (s->do_cmd) {
+        val = s->cmdbuf[s->cmdlen++];
+    } else {
+        val = s->ti_buf[s->ti_rptr++];
     }
 
     s->ti_size--;
@@ -168,23 +150,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
         return;
     }
 
-    switch (s->pdma_origin) {
-    case TI:
-        if (s->do_cmd) {
-            s->cmdbuf[s->cmdlen++] = val;
-        } else {
-            s->ti_buf[s->ti_wptr++] = val;
-        }
-        break;
-    case ASYNC:
-        s->async_buf[0] = val;
-        if (s->async_len > 0) {
-            s->async_len--;
-            s->async_buf++;
-        }
-        break;
-    default:
-        g_assert_not_reached();
+    if (s->do_cmd) {
+        s->cmdbuf[s->cmdlen++] = val;
+    } else {
+        s->ti_buf[s->ti_wptr++] = val;
     }
 
     s->ti_size++;
@@ -234,7 +203,6 @@ static int32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
         } else {
-            set_pdma(s, TI);
             if (esp_select(s) < 0) {
                 return -1;
             }
@@ -411,7 +379,6 @@ static void write_response(ESPState *s)
             s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
         } else {
-            set_pdma(s, TI);
             s->pdma_cb = write_response_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -524,7 +491,6 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
         } else {
-            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -547,7 +513,6 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -563,7 +528,6 @@ static void esp_do_dma(ESPState *s)
             s->async_buf += len;
             s->async_len -= len;
             esp_set_tc(s, esp_get_tc(s) - len);
-            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
 
@@ -901,24 +865,6 @@ static bool esp_mem_accepts(void *opaque, hwaddr addr,
     return (size == 1) || (is_write && size == 4);
 }
 
-static bool esp_pdma_needed(void *opaque)
-{
-    ESPState *s = opaque;
-    return s->dma_memory_read == NULL && s->dma_memory_write == NULL &&
-           s->dma_enabled;
-}
-
-static const VMStateDescription vmstate_esp_pdma = {
-    .name = "esp/pdma",
-    .version_id = 2,
-    .minimum_version_id = 2,
-    .needed = esp_pdma_needed,
-    .fields = (VMStateField[]) {
-        VMSTATE_INT32(pdma_origin, ESPState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 const VMStateDescription vmstate_esp = {
     .name = "esp",
     .version_id = 4,
@@ -941,10 +887,6 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT32(mig_dma_left, ESPState),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription * []) {
-        &vmstate_esp_pdma,
-        NULL
-    }
 };
 
 static void sysbus_esp_mem_write(void *opaque, hwaddr addr,
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index b8170e58ca..45c15e0650 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -15,11 +15,6 @@ typedef void (*ESPDMAMemoryReadWriteFunc)(void *opaque, uint8_t *buf, int len);
 
 typedef struct ESPState ESPState;
 
-enum pdma_origin_id {
-    TI,
-    ASYNC,
-};
-
 struct ESPState {
     uint8_t rregs[ESP_REGS];
     uint8_t wregs[ESP_REGS];
@@ -50,7 +45,6 @@ struct ESPState {
     ESPDMAMemoryReadWriteFunc dma_memory_write;
     void *dma_opaque;
     void (*dma_cb)(ESPState *s);
-    int pdma_origin;
     void (*pdma_cb)(ESPState *s);
 
     /* Legacy field for vmstate_sysbus_esp_scsi version < 2 */
-- 
2.20.1


