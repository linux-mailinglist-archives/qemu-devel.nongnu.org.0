Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D45633FBB1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:11:07 +0100 (CET)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfJi-0008TV-Av
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBu-0002pd-Oh
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:03:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35410
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBs-0005TR-UC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:03:02 -0400
Received: from host86-148-103-84.range86-148.btcentralplus.com
 ([86.148.103.84] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBs-0006Bn-E9; Wed, 17 Mar 2021 23:03:05 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Wed, 17 Mar 2021 23:02:22 +0000
Message-Id: <20210317230223.24854-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.84
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 5/6] esp: always check current_req is not NULL before use
 in DMA callbacks
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
---
 hw/scsi/esp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index bb57125035..d7b81b7608 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -505,6 +505,10 @@ static void do_dma_pdma_cb(ESPState *s)
         return;
     }
 
+    if (!s->current_req) {
+        return;
+    }
+
     if (to_device) {
         /* Copy FIFO data to device */
         len = MIN(s->async_len, ESP_FIFO_SZ);
@@ -538,11 +542,9 @@ static void do_dma_pdma_cb(ESPState *s)
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
 
@@ -616,6 +618,9 @@ static void esp_do_dma(ESPState *s)
         }
         return;
     }
+    if (!s->current_req) {
+        return;
+    }
     if (s->async_len == 0) {
         /* Defer until data is available.  */
         return;
@@ -725,6 +730,10 @@ static void esp_do_nodma(ESPState *s)
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


