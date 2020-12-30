Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6795E2E7AC1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:53:17 +0100 (CET)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudmm-0007hE-DI
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZU-0001NY-Sn
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:32 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50894
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZQ-0002FU-Hg
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:32 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZH-00070L-EW; Wed, 30 Dec 2020 15:39:21 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:39 +0000
Message-Id: <20201230153745.30241-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 19/25] esp: use in-built TC to determine PDMA transfer length
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

Real hardware simply counts down using the in-built TC to determine when the
the PDMA request is complete. Use the TC to determine the PDMA transfer length
which then enables us to remove the redundant pdma_len variable.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 28 +++++++++++++---------------
 include/hw/scsi/esp.h |  1 -
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index b43d0941f0..35cc274747 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -127,10 +127,9 @@ static uint32_t esp_get_stc(ESPState *s)
     return dmalen;
 }
 
-static void set_pdma(ESPState *s, enum pdma_origin_id origin, uint32_t len)
+static void set_pdma(ESPState *s, enum pdma_origin_id origin)
 {
     s->pdma_origin = origin;
-    s->pdma_len = len;
 }
 
 static uint8_t esp_pdma_read(ESPState *s)
@@ -138,7 +137,7 @@ static uint8_t esp_pdma_read(ESPState *s)
     uint32_t dmalen = esp_get_tc(s);
     uint8_t val;
 
-    if (dmalen == 0 || s->pdma_len == 0) {
+    if (dmalen == 0) {
         return 0;
     }
 
@@ -161,7 +160,6 @@ static uint8_t esp_pdma_read(ESPState *s)
     }
 
     s->ti_size--;
-    s->pdma_len--;
     dmalen--;
     esp_set_tc(s, dmalen);
 
@@ -172,7 +170,7 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
 {
     uint32_t dmalen = esp_get_tc(s);
 
-    if (dmalen == 0 || s->pdma_len == 0) {
+    if (dmalen == 0) {
         return;
     }
 
@@ -195,7 +193,6 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     }
 
     s->ti_size++;
-    s->pdma_len--;
     dmalen--;
     esp_set_tc(s, dmalen);
 }
@@ -242,7 +239,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
         } else {
-            set_pdma(s, CMD, dmalen);
+            set_pdma(s, CMD);
             esp_raise_drq(s);
             return 0;
         }
@@ -404,7 +401,7 @@ static void write_response(ESPState *s)
             s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
             s->rregs[ESP_RSEQ] = SEQ_CD;
         } else {
-            set_pdma(s, TI, 2);
+            set_pdma(s, TI);
             s->pdma_cb = write_response_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -474,7 +471,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
         } else {
-            set_pdma(s, CMD, len);
+            set_pdma(s, CMD);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -497,7 +494,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, ASYNC, len);
+            set_pdma(s, ASYNC);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -506,7 +503,7 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_write) {
             s->dma_memory_write(s->dma_opaque, s->async_buf, len);
         } else {
-            set_pdma(s, ASYNC, len);
+            set_pdma(s, ASYNC);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
             return;
@@ -852,7 +849,6 @@ static const VMStateDescription vmstate_esp_pdma = {
     .needed = esp_pdma_needed,
     .fields = (VMStateField[]) {
         VMSTATE_INT32(pdma_origin, ESPState),
-        VMSTATE_UINT32(pdma_len, ESPState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -917,6 +913,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = &sysbus->esp;
+    uint32_t dmalen;
 
     trace_esp_pdma_write(size);
 
@@ -929,7 +926,8 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         esp_pdma_write(s, val);
         break;
     }
-    if (s->pdma_len == 0 && s->pdma_cb) {
+    dmalen = esp_get_tc(s);
+    if (dmalen == 0 && s->pdma_cb) {
         esp_lower_drq(s);
         s->pdma_cb(s);
         s->pdma_cb = NULL;
@@ -946,7 +944,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
 
     trace_esp_pdma_read(size);
 
-    if (dmalen == 0 || s->pdma_len == 0) {
+    if (dmalen == 0) {
         return 0;
     }
     switch (size) {
@@ -959,7 +957,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
         break;
     }
     dmalen = esp_get_tc(s);
-    if (dmalen == 0 || (s->pdma_len == 0 && s->pdma_cb)) {
+    if (dmalen == 0 && s->pdma_cb) {
         esp_lower_drq(s);
         s->pdma_cb(s);
         s->pdma_cb = NULL;
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 292136344a..ecad5d8471 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -52,7 +52,6 @@ struct ESPState {
     void *dma_opaque;
     void (*dma_cb)(ESPState *s);
     int pdma_origin;
-    uint32_t pdma_len;
     void (*pdma_cb)(ESPState *s);
 
     /* Legacy field for vmstate_sysbus_esp_scsi version < 2 */
-- 
2.20.1


