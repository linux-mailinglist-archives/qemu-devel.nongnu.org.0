Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A832DD11
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:32:23 +0100 (CET)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwW6-0000xn-Fl
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEu-0001Qb-JC
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:14:37 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40260
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEs-0006k9-CD
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:14:36 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwEd-0008MJ-7Y; Thu, 04 Mar 2021 22:14:22 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Thu,  4 Mar 2021 22:10:57 +0000
Message-Id: <20210304221103.6369-37-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 36/42] esp: add maxlen parameter to get_cmd()
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


