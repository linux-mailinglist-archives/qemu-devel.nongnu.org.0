Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535BE3300DD
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:31:43 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsZS-00030j-CH
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsG6-0002Y5-Vb
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:11:43 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43722
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsG4-00088v-6n
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:11:42 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsFo-0002V5-3t; Sun, 07 Mar 2021 12:11:28 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:37 +0000
Message-Id: <20210307120850.10418-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 29/42] esp: remove pdma_origin from ESPState
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-30-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 74 +++++--------------------------------------
 include/hw/scsi/esp.h |  6 ----
 2 files changed, 8 insertions(+), 72 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index aa897a4ebd..79b84e31d3 100644
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
 
@@ -898,24 +862,6 @@ static bool esp_mem_accepts(void *opaque, hwaddr addr,
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
@@ -970,10 +916,6 @@ const VMStateDescription vmstate_esp = {
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
index dbbbb3fc52..91f8ffd6c8 100644
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


