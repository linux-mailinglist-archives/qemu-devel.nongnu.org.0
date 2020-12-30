Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C972E7ACB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:56:40 +0100 (CET)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudq3-0003Y1-5v
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYm-0000Wh-AD
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50808
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYk-00025Z-8g
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:48 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYg-00070L-Vu; Wed, 30 Dec 2020 15:38:49 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:30 +0000
Message-Id: <20201230153745.30241-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/25] esp: remove dma_left from ESPState
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
remove dma_left completely.

In order to preserve migration bump the version of vmstate_sysbus_esp_scsi to
2 and add a post_load function to transfer the old dma_left value to the TC
register.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 47 +++++++++++++++++++++++++++----------------
 include/hw/scsi/esp.h |  5 +++--
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 5b47d035ab..69fed3cb22 100644
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
@@ -384,6 +384,7 @@ static void do_dma_pdma_cb(ESPState *s)
 {
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
     int len = s->pdma_cur - s->pdma_start;
+
     if (s->do_cmd) {
         s->ti_size = 0;
         s->cmdlen = 0;
@@ -391,7 +392,6 @@ static void do_dma_pdma_cb(ESPState *s)
         do_cmd(s, s->cmdbuf);
         return;
     }
-    s->dma_left -= len;
     s->async_buf += len;
     s->async_len -= len;
     if (to_device) {
@@ -406,7 +406,7 @@ static void do_dma_pdma_cb(ESPState *s)
          * complete the DMA operation immediately.  Otherwise defer
          * until the scsi layer has completed.
          */
-        if (to_device || s->dma_left != 0 || s->ti_size == 0) {
+        if (to_device || esp_get_tc(s) != 0 || s->ti_size == 0) {
             return;
         }
     }
@@ -420,7 +420,7 @@ static void esp_do_dma(ESPState *s)
     uint32_t len;
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
 
-    len = s->dma_left;
+    len = esp_get_tc(s);
     if (s->do_cmd) {
         /*
          * handle_ti_cmd() case: esp_do_dma() is called only from
@@ -470,7 +470,7 @@ static void esp_do_dma(ESPState *s)
             return;
         }
     }
-    s->dma_left -= len;
+    esp_set_tc(s, esp_get_tc(s) - len);
     s->async_buf += len;
     s->async_len -= len;
     if (to_device) {
@@ -485,7 +485,7 @@ static void esp_do_dma(ESPState *s)
          * complete the DMA operation immediately.  Otherwise defer
          * until the scsi layer has completed.
          */
-        if (to_device || s->dma_left != 0 || s->ti_size == 0) {
+        if (to_device || esp_get_tc(s) != 0 || s->ti_size == 0) {
             return;
         }
     }
@@ -501,7 +501,6 @@ static void esp_report_command_complete(ESPState *s, uint32_t status)
         trace_esp_command_complete_unexpected();
     }
     s->ti_size = 0;
-    s->dma_left = 0;
     s->async_len = 0;
     if (status) {
         trace_esp_command_complete_fail();
@@ -538,12 +537,13 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
 {
     ESPState *s = req->hba_private;
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
+    uint32_t dmalen = esp_get_tc(s);
 
     assert(!s->do_cmd);
-    trace_esp_transfer_data(s->dma_left, s->ti_size);
+    trace_esp_transfer_data(dmalen, s->ti_size);
     s->async_len = len;
     s->async_buf = scsi_req_get_buf(req);
-    if (s->dma_left) {
+    if (dmalen) {
         esp_do_dma(s);
     } else if (to_device) {
         /*
@@ -574,7 +574,6 @@ static void handle_ti(ESPState *s)
     }
     trace_esp_handle_ti(minlen);
     if (s->dma) {
-        s->dma_left = minlen;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
         esp_do_dma(s);
     } else if (s->do_cmd) {
@@ -846,7 +845,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_BUFFER_START_MIDDLE_V(cmdbuf, ESPState, 16, 4),
         VMSTATE_UINT32(cmdlen, ESPState),
         VMSTATE_UINT32(do_cmd, ESPState),
-        VMSTATE_UINT32(dma_left, ESPState),
+        VMSTATE_UINT32(mig_dma_left, ESPState),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * []) {
@@ -887,12 +886,11 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = &sysbus->esp;
-    uint32_t dmalen;
+    uint32_t dmalen = esp_get_tc(s);
     uint8_t *buf = get_pdma_buf(s);
 
     trace_esp_pdma_write(size);
 
-    dmalen = esp_get_tc(s);
     if (dmalen == 0 || s->pdma_len == 0) {
         return;
     }
@@ -922,27 +920,30 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = &sysbus->esp;
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
@@ -1012,10 +1013,22 @@ static void sysbus_esp_hard_reset(DeviceState *dev)
     esp_hard_reset(&sysbus->esp);
 }
 
+static int sysbus_esp_scsi_post_load(void *opaque, int version_id)
+{
+    ESPState *s = opaque;
+
+    if (version_id < 2) {
+        esp_set_tc(s, s->mig_dma_left);
+    }
+
+    return 1;
+}
+
 static const VMStateDescription vmstate_sysbus_esp_scsi = {
     .name = "sysbusespscsi",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
+    .post_load = sysbus_esp_scsi_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(esp, SysBusESPState, 0, vmstate_esp, ESPState),
         VMSTATE_END_OF_LIST()
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index b307f5d261..f45bbde23c 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -43,8 +43,6 @@ struct ESPState {
     uint32_t cmdlen;
     uint32_t do_cmd;
 
-    /* The amount of data left in the current DMA transfer.  */
-    uint32_t dma_left;
     int dma_enabled;
 
     uint32_t async_len;
@@ -60,6 +58,9 @@ struct ESPState {
     uint32_t pdma_start;
     uint32_t pdma_cur;
     void (*pdma_cb)(ESPState *s);
+
+    /* Legacy field for vmstate_sysbus_esp_scsi version < 2 */
+    uint32_t mig_dma_left;
 };
 
 #define TYPE_ESP "esp"
-- 
2.20.1


