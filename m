Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44A735D314
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:28:37 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW52q-00072s-RL
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vn-0002xe-DT
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44050
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4ve-0002gE-Kc
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:19 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vn-0004Dc-Kg; Mon, 12 Apr 2021 23:21:23 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 12 Apr 2021 23:20:37 +0100
Message-Id: <20210412222048.22818-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
References: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 02/13] esp: always check current_req is not NULL before use in
 DMA callbacks
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

After issuing a SCSI command the SCSI layer can call the SCSIBusInfo .cancel
callback which resets both current_req and current_dev to NULL. If any data
is left in the transfer buffer (async_len != 0) then the next TI (Transfer
Information) command will attempt to reference the NULL pointer causing a
segfault.

Buglink: https://bugs.launchpad.net/qemu/+bug/1910723
Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210407195801.685-2-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index d87e1a63db..a79196f3f3 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -496,6 +496,10 @@ static void do_dma_pdma_cb(ESPState *s)
         return;
     }
 
+    if (!s->current_req) {
+        return;
+    }
+
     if (to_device) {
         /* Copy FIFO data to device */
         len = MIN(s->async_len, ESP_FIFO_SZ);
@@ -527,11 +531,9 @@ static void do_dma_pdma_cb(ESPState *s)
         return;
     } else {
         if (s->async_len == 0) {
-            if (s->current_req) {
-                /* Defer until the scsi layer has completed */
-                scsi_req_continue(s->current_req);
-                s->data_in_ready = false;
-            }
+            /* Defer until the scsi layer has completed */
+            scsi_req_continue(s->current_req);
+            s->data_in_ready = false;
             return;
         }
 
@@ -604,6 +606,9 @@ static void esp_do_dma(ESPState *s)
         }
         return;
     }
+    if (!s->current_req) {
+        return;
+    }
     if (s->async_len == 0) {
         /* Defer until data is available.  */
         return;
@@ -713,6 +718,10 @@ static void esp_do_nodma(ESPState *s)
         return;
     }
 
+    if (!s->current_req) {
+        return;
+    }
+
     if (s->async_len == 0) {
         /* Defer until data is available.  */
         return;
-- 
2.20.1


