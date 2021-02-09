Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A02315751
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:01:36 +0100 (CET)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZCZ-0004ui-8Q
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkR-0005eZ-95
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:31 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56954
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkL-0002jG-On
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:31 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkY-0007pt-Db; Tue, 09 Feb 2021 19:32:38 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:59 +0000
Message-Id: <20210209193018.31339-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 23/42] esp: use ti_wptr/ti_rptr to manage the current FIFO
 position for PDMA
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

This eliminates the last user of the PDMA-specific pdma_cur variable which can
now be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 23 ++++++++---------------
 include/hw/scsi/esp.h |  1 -
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 691a2f4bdc..50503a6f53 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -127,11 +127,9 @@ static uint32_t esp_get_stc(ESPState *s)
     return dmalen;
 }
 
-static void set_pdma(ESPState *s, enum pdma_origin_id origin,
-                     uint32_t index, uint32_t len)
+static void set_pdma(ESPState *s, enum pdma_origin_id origin, uint32_t len)
 {
     s->pdma_origin = origin;
-    s->pdma_cur = index;
     s->pdma_len = len;
 }
 
@@ -146,11 +144,10 @@ static uint8_t esp_pdma_read(ESPState *s)
 
     switch (s->pdma_origin) {
     case TI:
-        val = s->ti_buf[s->pdma_cur++];
+        val = s->ti_buf[s->ti_rptr++];
         break;
     case CMD:
         val = s->cmdbuf[s->cmdlen++];
-        s->pdma_cur++;
         break;
     case ASYNC:
         val = s->async_buf[0];
@@ -158,7 +155,6 @@ static uint8_t esp_pdma_read(ESPState *s)
             s->async_len--;
             s->async_buf++;
         }
-        s->pdma_cur++;
         break;
     default:
         g_assert_not_reached();
@@ -182,11 +178,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
 
     switch (s->pdma_origin) {
     case TI:
-        s->ti_buf[s->pdma_cur++] = val;
+        s->ti_buf[s->ti_wptr++] = val;
         break;
     case CMD:
         s->cmdbuf[s->cmdlen++] = val;
-        s->pdma_cur++;
         break;
     case ASYNC:
         s->async_buf[0] = val;
@@ -194,7 +189,6 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
             s->async_len--;
             s->async_buf++;
         }
-        s->pdma_cur++;
         break;
     default:
         g_assert_not_reached();
@@ -249,7 +243,7 @@ static uint32_t get_cmd(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
         } else {
-            set_pdma(s, CMD, 0, dmalen);
+            set_pdma(s, CMD, dmalen);
             esp_raise_drq(s);
             return 0;
         }
@@ -412,7 +406,7 @@ static void write_response(ESPState *s)
             s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
         } else {
-            set_pdma(s, TI, 0, 2);
+            set_pdma(s, TI, 2);
             s->pdma_cb = write_response_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -480,7 +474,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
         } else {
-            set_pdma(s, CMD, s->cmdlen, len);
+            set_pdma(s, CMD, len);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -503,7 +497,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, ASYNC, 0, len);
+            set_pdma(s, ASYNC, len);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -512,7 +506,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_write) {
             s->dma_memory_write(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, ASYNC, 0, len);
+            set_pdma(s, ASYNC, len);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -858,7 +852,6 @@ static const VMStateDescription vmstate_esp_pdma = {
     .fields = (VMStateField[]) {
         VMSTATE_INT32(pdma_origin, ESPState),
         VMSTATE_UINT32(pdma_len, ESPState),
-        VMSTATE_UINT32(pdma_cur, ESPState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 578d936214..5908d59a0a 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -58,7 +58,6 @@ struct ESPState {
     void (*dma_cb)(ESPState *s);
     int pdma_origin;
     uint32_t pdma_len;
-    uint32_t pdma_cur;
     void (*pdma_cb)(ESPState *s);
 
     uint8_t mig_version_id;
-- 
2.20.1


