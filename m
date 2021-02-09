Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C0315782
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:11:42 +0100 (CET)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZML-0005tt-VY
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ykw-0006Cj-VT
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57022
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yko-0002ts-O5
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:33:02 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Ykx-0007pt-JF; Tue, 09 Feb 2021 19:33:08 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:30:05 +0000
Message-Id: <20210209193018.31339-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 29/42] esp: remove pdma_origin from ESPState
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
index 5dcd4cd651..7671cc398d 100644
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
 
     return val;
@@ -166,23 +148,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
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
 
     dmalen--;
@@ -232,7 +201,6 @@ static uint32_t get_cmd(ESPState *s)
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
@@ -522,7 +489,6 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
         } else {
-            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -545,7 +511,6 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -562,7 +527,6 @@ static void esp_do_dma(ESPState *s)
             s->async_len -= len;
             s->ti_size -= len;
             esp_set_tc(s, esp_get_tc(s) - len);
-            set_pdma(s, TI);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
 
@@ -899,24 +863,6 @@ static bool esp_mem_accepts(void *opaque, hwaddr addr,
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
 static bool esp_is_before_version_5(void *opaque, int version_id)
 {
     ESPState *s = ESP(opaque);
@@ -971,10 +917,6 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription * []) {
-        &vmstate_esp_pdma,
-        NULL
-    }
 };
 
 static void sysbus_esp_mem_write(void *opaque, hwaddr addr,
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index a8d5bf8a63..6618f4e091 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -15,11 +15,6 @@ typedef void (*ESPDMAMemoryReadWriteFunc)(void *opaque, uint8_t *buf, int len);
 
 typedef struct ESPState ESPState;
 
-enum pdma_origin_id {
-    TI,
-    ASYNC,
-};
-
 #define TYPE_ESP "esp"
 OBJECT_DECLARE_SIMPLE_TYPE(ESPState, ESP)
 
@@ -55,7 +50,6 @@ struct ESPState {
     ESPDMAMemoryReadWriteFunc dma_memory_write;
     void *dma_opaque;
     void (*dma_cb)(ESPState *s);
-    int pdma_origin;
     void (*pdma_cb)(ESPState *s);
 
     uint8_t mig_version_id;
-- 
2.20.1


