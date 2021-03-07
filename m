Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEDB330110
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:56:01 +0100 (CET)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIswy-0008IQ-3P
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsH9-0004GK-Sn
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43806
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsH7-0008QE-Vh
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:47 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGt-0002V5-0A; Sun, 07 Mar 2021 12:12:35 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:50 +0000
Message-Id: <20210307120850.10418-43-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 42/42] esp: add support for unaligned accesses
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

When the MacOS toolbox ROM transfers data from a target device to an unaligned
memory address, the first/last byte of a 16-bit transfer needs to be handled
separately. This means that the first byte is preloaded into the FIFO before
the transfer, or the last byte remains in the FIFO after the transfer.

The result of this is that the PDMA routines must be updated so that the FIFO
is loaded/unloaded if the last 16-bit word is used (rather than the last byte)
and any remaining byte from a FIFO wraparound is handled correctly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-43-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index f828e70865..507ab363bc 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -498,11 +498,22 @@ static void do_dma_pdma_cb(ESPState *s)
 
     if (to_device) {
         /* Copy FIFO data to device */
-        len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
+        len = MIN(s->async_len, ESP_FIFO_SZ);
+        len = MIN(len, fifo8_num_used(&s->fifo));
         memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
-        s->async_buf += len;
-        s->async_len -= len;
-        s->ti_size += len;
+        s->async_buf += n;
+        s->async_len -= n;
+        s->ti_size += n;
+
+        if (n < len) {
+            /* Unaligned accesses can cause FIFO wraparound */
+            len = len - n;
+            memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
+            s->async_buf += n;
+            s->async_len -= n;
+            s->ti_size += n;
+        }
+
         if (s->async_len == 0) {
             scsi_req_continue(s->current_req);
             return;
@@ -526,12 +537,18 @@ static void do_dma_pdma_cb(ESPState *s)
 
         if (esp_get_tc(s) != 0) {
             /* Copy device data to FIFO */
-            len = MIN(s->async_len, fifo8_num_free(&s->fifo));
+            len = MIN(s->async_len, esp_get_tc(s));
+            len = MIN(len, fifo8_num_free(&s->fifo));
             fifo8_push_all(&s->fifo, s->async_buf, len);
             s->async_buf += len;
             s->async_len -= len;
             s->ti_size -= len;
             esp_set_tc(s, esp_get_tc(s) - len);
+
+            if (esp_get_tc(s) == 0) {
+                /* Indicate transfer to FIFO is complete */
+                 s->rregs[ESP_RSTAT] |= STAT_TC;
+            }
             return;
         }
 
@@ -606,12 +623,29 @@ static void esp_do_dma(ESPState *s)
         if (s->dma_memory_write) {
             s->dma_memory_write(s->dma_opaque, s->async_buf, len);
         } else {
+            /* Adjust TC for any leftover data in the FIFO */
+            if (!fifo8_is_empty(&s->fifo)) {
+                esp_set_tc(s, esp_get_tc(s) - fifo8_num_used(&s->fifo));
+            }
+
             /* Copy device data to FIFO */
             len = MIN(len, fifo8_num_free(&s->fifo));
             fifo8_push_all(&s->fifo, s->async_buf, len);
             s->async_buf += len;
             s->async_len -= len;
             s->ti_size -= len;
+
+            /*
+             * MacOS toolbox uses a TI length of 16 bytes for all commands, so
+             * commands shorter than this must be padded accordingly
+             */
+            if (len < esp_get_tc(s) && esp_get_tc(s) <= ESP_FIFO_SZ) {
+                while (fifo8_num_used(&s->fifo) < ESP_FIFO_SZ) {
+                    esp_fifo_push(s, 0);
+                    len++;
+                }
+            }
+
             esp_set_tc(s, esp_get_tc(s) - len);
             s->pdma_cb = do_dma_pdma_cb;
             esp_raise_drq(s);
@@ -1160,7 +1194,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         break;
     }
     dmalen = esp_get_tc(s);
-    if (dmalen == 0 || fifo8_is_full(&s->fifo)) {
+    if (dmalen == 0 || fifo8_num_free(&s->fifo) < 2) {
         s->pdma_cb(s);
     }
 }
@@ -1183,7 +1217,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
         val = (val << 8) | esp_pdma_read(s);
         break;
     }
-    if (fifo8_is_empty(&s->fifo)) {
+    if (fifo8_num_used(&s->fifo) < 2) {
         s->pdma_cb(s);
     }
     return val;
-- 
2.20.1


