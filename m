Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDB315757
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:03:18 +0100 (CET)
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZED-0006cb-0H
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YjY-0004oW-Qu
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:36 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56858
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YjW-0002Pf-RQ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:36 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yjp-0007pt-KQ; Tue, 09 Feb 2021 19:31:58 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:49 +0000
Message-Id: <20210209193018.31339-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 13/42] esp: remove dma_left from ESPState
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

The ESP device already keeps track of the remaining bytes left to transfer via
its TC (transfer counter) register which is decremented for each byte that
is transferred across the SCSI bus.

Switch the transfer logic to use the value of TC instead of dma_left and then
remove dma_left completely, adding logic to the vmstate_esp post_load() function
to transfer the old dma_left value to the TC register during migration from
older versions.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 47 ++++++++++++++++++++++++++++---------------
 include/hw/scsi/esp.h |  5 +++--
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 6c495b29c0..fcc99f5fe4 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -228,7 +228,7 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
     s->ti_size = datalen;
     if (datalen != 0) {
         s->rregs[ESP_RSTAT] = STAT_TC;
-        s->dma_left = 0;
+        esp_set_tc(s, 0);
         if (datalen > 0) {
             s->rregs[ESP_RSTAT] |= STAT_DI;
         } else {
@@ -382,6 +382,7 @@ static void do_dma_pdma_cb(ESPState *s)
 {
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
     int len = s->pdma_cur - s->pdma_start;
+
     if (s->do_cmd) {
         s->ti_size = 0;
         s->cmdlen = 0;
@@ -389,7 +390,6 @@ static void do_dma_pdma_cb(ESPState *s)
         do_cmd(s, s->cmdbuf);
         return;
     }
-    s->dma_left -= len;
     s->async_buf += len;
     s->async_len -= len;
     if (to_device) {
@@ -404,7 +404,7 @@ static void do_dma_pdma_cb(ESPState *s)
          * complete the DMA operation immediately.  Otherwise defer
          * until the scsi layer has completed.
          */
-        if (to_device || s->dma_left != 0 || s->ti_size == 0) {
+        if (to_device || esp_get_tc(s) != 0 || s->ti_size == 0) {
             return;
         }
     }
@@ -418,7 +418,7 @@ static void esp_do_dma(ESPState *s)
     uint32_t len;
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
 
-    len = s->dma_left;
+    len = esp_get_tc(s);
     if (s->do_cmd) {
         /*
          * handle_ti_cmd() case: esp_do_dma() is called only from
@@ -468,7 +468,7 @@ static void esp_do_dma(ESPState *s)
             return;
         }
     }
-    s->dma_left -= len;
+    esp_set_tc(s, esp_get_tc(s) - len);
     s->async_buf += len;
     s->async_len -= len;
     if (to_device) {
@@ -483,7 +483,7 @@ static void esp_do_dma(ESPState *s)
          * complete the DMA operation immediately.  Otherwise defer
          * until the scsi layer has completed.
          */
-        if (to_device || s->dma_left != 0 || s->ti_size == 0) {
+        if (to_device || esp_get_tc(s) != 0 || s->ti_size == 0) {
             return;
         }
     }
@@ -499,7 +499,6 @@ static void esp_report_command_complete(ESPState *s, uint32_t status)
         trace_esp_command_complete_unexpected();
     }
     s->ti_size = 0;
-    s->dma_left = 0;
     s->async_len = 0;
     if (status) {
         trace_esp_command_complete_fail();
@@ -535,12 +534,13 @@ void esp_command_complete(SCSIRequest *req, uint32_t status,
 void esp_transfer_data(SCSIRequest *req, uint32_t len)
 {
     ESPState *s = req->hba_private;
+    uint32_t dmalen = esp_get_tc(s);
 
     assert(!s->do_cmd);
-    trace_esp_transfer_data(s->dma_left, s->ti_size);
+    trace_esp_transfer_data(dmalen, s->ti_size);
     s->async_len = len;
     s->async_buf = scsi_req_get_buf(req);
-    if (s->dma_left) {
+    if (dmalen) {
         esp_do_dma(s);
     } else if (s->ti_size <= 0) {
         /*
@@ -571,7 +571,6 @@ static void handle_ti(ESPState *s)
     }
     trace_esp_handle_ti(minlen);
     if (s->dma) {
-        s->dma_left = minlen;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
         esp_do_dma(s);
     } else if (s->do_cmd) {
@@ -824,6 +823,14 @@ static const VMStateDescription vmstate_esp_pdma = {
     }
 };
 
+static bool esp_is_before_version_5(void *opaque, int version_id)
+{
+    ESPState *s = ESP(opaque);
+
+    version_id = MIN(version_id, s->mig_version_id);
+    return version_id < 5;
+}
+
 static int esp_pre_save(void *opaque)
 {
     ESPState *s = ESP(opaque);
@@ -836,6 +843,12 @@ static int esp_post_load(void *opaque, int version_id)
 {
     ESPState *s = ESP(opaque);
 
+    version_id = MIN(version_id, s->mig_version_id);
+
+    if (version_id < 5) {
+        esp_set_tc(s, s->mig_dma_left);
+    }
+
     s->mig_version_id = vmstate_esp.version_id;
     return 0;
 }
@@ -861,7 +874,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_BUFFER_START_MIDDLE_V(cmdbuf, ESPState, 16, 4),
         VMSTATE_UINT32(cmdlen, ESPState),
         VMSTATE_UINT32(do_cmd, ESPState),
-        VMSTATE_UINT32(dma_left, ESPState),
+        VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * []) {
@@ -904,12 +917,11 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = ESP(&sysbus->esp);
-    uint32_t dmalen;
+    uint32_t dmalen = esp_get_tc(s);
     uint8_t *buf = get_pdma_buf(s);
 
     trace_esp_pdma_write(size);
 
-    dmalen = esp_get_tc(s);
     if (dmalen == 0 || s->pdma_len == 0) {
         return;
     }
@@ -939,27 +951,30 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = ESP(&sysbus->esp);
+    uint32_t dmalen = esp_get_tc(s);
     uint8_t *buf = get_pdma_buf(s);
     uint64_t val = 0;
 
     trace_esp_pdma_read(size);
 
-    if (s->pdma_len == 0) {
+    if (dmalen == 0 || s->pdma_len == 0) {
         return 0;
     }
     switch (size) {
     case 1:
         val = buf[s->pdma_cur++];
         s->pdma_len--;
+        dmalen--;
         break;
     case 2:
         val = buf[s->pdma_cur++];
         val = (val << 8) | buf[s->pdma_cur++];
         s->pdma_len -= 2;
+        dmalen -= 2;
         break;
     }
-
-    if (s->pdma_len == 0 && s->pdma_cb) {
+    esp_set_tc(s, dmalen);
+    if (dmalen == 0 || (s->pdma_len == 0 && s->pdma_cb)) {
         esp_lower_drq(s);
         s->pdma_cb(s);
         s->pdma_cb = NULL;
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index b313ef27f2..9fad320513 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -48,8 +48,6 @@ struct ESPState {
     uint32_t cmdlen;
     uint32_t do_cmd;
 
-    /* The amount of data left in the current DMA transfer.  */
-    uint32_t dma_left;
     int dma_enabled;
 
     uint32_t async_len;
@@ -67,6 +65,9 @@ struct ESPState {
     void (*pdma_cb)(ESPState *s);
 
     uint8_t mig_version_id;
+
+    /* Legacy fields for vmstate_esp version < 5 */
+    uint32_t mig_dma_left;
 };
 
 #define TYPE_SYSBUS_ESP "sysbus-esp"
-- 
2.20.1


