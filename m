Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914A3300FD
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:44:54 +0100 (CET)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsmD-0007VA-AN
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGk-0003TU-1E
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43766
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGe-0008Ik-6v
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:21 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGO-0002V5-OC; Sun, 07 Mar 2021 12:12:05 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:44 +0000
Message-Id: <20210307120850.10418-37-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 36/42] esp: add maxlen parameter to get_cmd()
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

Some guests use a mixture of DMA and non-DMA transfers in combination with the
SATN and stop command to transfer message out phase and command phase bytes to
the target. Prepare for the next commit by adding a maxlen parameter to
get_cmd() to allow partial transfers.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-37-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 4ac299651f..23fcaa90c1 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -194,7 +194,7 @@ static int esp_select(ESPState *s)
     return 0;
 }
 
-static uint32_t get_cmd(ESPState *s)
+static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
 {
     uint8_t *buf = s->cmdbuf;
     uint32_t dmalen;
@@ -202,8 +202,8 @@ static uint32_t get_cmd(ESPState *s)
 
     target = s->wregs[ESP_WBUSID] & BUSID_DID;
     if (s->dma) {
-        dmalen = esp_get_tc(s);
-        if (dmalen > ESP_CMDBUF_SZ) {
+        dmalen = MIN(esp_get_tc(s), maxlen);
+        if (dmalen == 0) {
             return 0;
         }
         if (s->dma_memory_read) {
@@ -216,12 +216,14 @@ static uint32_t get_cmd(ESPState *s)
             return 0;
         }
     } else {
-        dmalen = s->ti_size;
-        if (dmalen > TI_BUFSZ) {
+        dmalen = MIN(s->ti_size, maxlen);
+        if (dmalen == 0) {
             return 0;
         }
         memcpy(buf, s->ti_buf, dmalen);
-        buf[0] = buf[2] >> 5;
+        if (dmalen >= 3) {
+            buf[0] = buf[2] >> 5;
+        }
     }
     trace_esp_get_cmd(dmalen, target);
 
@@ -290,7 +292,7 @@ static void handle_satn(ESPState *s)
         return;
     }
     s->pdma_cb = satn_pdma_cb;
-    cmdlen = get_cmd(s);
+    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
     if (cmdlen > 0) {
         s->cmdlen = cmdlen;
         do_cmd(s);
@@ -320,7 +322,7 @@ static void handle_s_without_atn(ESPState *s)
         return;
     }
     s->pdma_cb = s_without_satn_pdma_cb;
-    cmdlen = get_cmd(s);
+    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
     if (cmdlen > 0) {
         s->cmdlen = cmdlen;
         do_busid_cmd(s, s->cmdbuf, 0);
@@ -355,7 +357,7 @@ static void handle_satn_stop(ESPState *s)
         return;
     }
     s->pdma_cb = satn_stop_pdma_cb;
-    cmdlen = get_cmd(s);
+    cmdlen = get_cmd(s, ESP_CMDBUF_SZ);
     if (cmdlen > 0) {
         trace_esp_handle_satn_stop(s->cmdlen);
         s->cmdlen = cmdlen;
-- 
2.20.1


