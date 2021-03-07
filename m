Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02D3300E3
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:36:26 +0100 (CET)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIse1-0000oW-9J
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGW-0003HV-Oq
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:10 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43752
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGT-0008Fl-V8
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:08 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGE-0002V5-HL; Sun, 07 Mar 2021 12:11:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:42 +0000
Message-Id: <20210307120850.10418-35-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 34/42] esp: remove old deferred command completion mechanism
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

Commit ea84a44250 "scsi: esp: Defer command completion until previous interrupts
have been handled" provided a mechanism to delay the command completion interrupt
until ESP_RINTR is read after the command has completed.

With the previous fixes for latching the ESP_RINTR bits and deferring the setting
of the command completion interrupt for incoming data to the SCSI callback, this
workaround is no longer required and can be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-35-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 35 +++++++++--------------------------
 include/hw/scsi/esp.h |  4 ++--
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 0eecc1d05c..eb6681ca66 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -568,18 +568,20 @@ static void esp_do_dma(ESPState *s)
     esp_lower_drq(s);
 }
 
-static void esp_report_command_complete(ESPState *s, uint32_t status)
+void esp_command_complete(SCSIRequest *req, size_t resid)
 {
+    ESPState *s = req->hba_private;
+
     trace_esp_command_complete();
     if (s->ti_size != 0) {
         trace_esp_command_complete_unexpected();
     }
     s->ti_size = 0;
     s->async_len = 0;
-    if (status) {
+    if (req->status) {
         trace_esp_command_complete_fail();
     }
-    s->status = status;
+    s->status = req->status;
     s->rregs[ESP_RSTAT] = STAT_ST;
     esp_dma_done(s);
     esp_lower_drq(s);
@@ -590,23 +592,6 @@ static void esp_report_command_complete(ESPState *s, uint32_t status)
     }
 }
 
-void esp_command_complete(SCSIRequest *req, size_t resid)
-{
-    ESPState *s = req->hba_private;
-
-    if (s->rregs[ESP_RSTAT] & STAT_INT) {
-        /*
-         * Defer handling command complete until the previous
-         * interrupt has been handled.
-         */
-        trace_esp_command_complete_deferred();
-        s->deferred_status = req->status;
-        s->deferred_complete = true;
-        return;
-    }
-    esp_report_command_complete(s, req->status);
-}
-
 void esp_transfer_data(SCSIRequest *req, uint32_t len)
 {
     ESPState *s = req->hba_private;
@@ -733,10 +718,6 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
         s->rregs[ESP_RSEQ] = SEQ_0;
         esp_lower_irq(s);
-        if (s->deferred_complete) {
-            esp_report_command_complete(s, s->deferred_status);
-            s->deferred_complete = false;
-        }
         break;
     case ESP_TCHI:
         /* Return the unique id if the value has never been written */
@@ -944,8 +925,10 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_UINT32(ti_wptr, ESPState),
         VMSTATE_BUFFER(ti_buf, ESPState),
         VMSTATE_UINT32(status, ESPState),
-        VMSTATE_UINT32(deferred_status, ESPState),
-        VMSTATE_BOOL(deferred_complete, ESPState),
+        VMSTATE_UINT32_TEST(mig_deferred_status, ESPState,
+                            esp_is_before_version_5),
+        VMSTATE_BOOL_TEST(mig_deferred_complete, ESPState,
+                          esp_is_before_version_5),
         VMSTATE_UINT32(dma, ESPState),
         VMSTATE_PARTIAL_BUFFER(cmdbuf, ESPState, 16),
         VMSTATE_BUFFER_START_MIDDLE_V(cmdbuf, ESPState, 16, 4),
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 61bc317a4c..7d88fa0f92 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -30,8 +30,6 @@ struct ESPState {
     int32_t ti_size;
     uint32_t ti_rptr, ti_wptr;
     uint32_t status;
-    uint32_t deferred_status;
-    bool deferred_complete;
     uint32_t dma;
     uint8_t ti_buf[TI_BUFSZ];
     SCSIBus bus;
@@ -57,6 +55,8 @@ struct ESPState {
 
     /* Legacy fields for vmstate_esp version < 5 */
     uint32_t mig_dma_left;
+    uint32_t mig_deferred_status;
+    bool mig_deferred_complete;
 };
 
 #define TYPE_SYSBUS_ESP "sysbus-esp"
-- 
2.20.1


