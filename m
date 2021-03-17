Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64633FBAB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:08:21 +0100 (CET)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfH2-0007Dk-WB
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBq-0002iT-U6
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:02:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35398
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBn-0005RQ-UC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:02:58 -0400
Received: from host86-148-103-84.range86-148.btcentralplus.com
 ([86.148.103.84] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBm-0006Bn-0a; Wed, 17 Mar 2021 23:03:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Wed, 17 Mar 2021 23:02:21 +0000
Message-Id: <20210317230223.24854-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.84
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 4/6] esp: don't underflow fifo when writing to the device
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

When writing to the device make sure that the fifo is not empty, otherwise the
fifo will underflow triggering an assert.

Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index ae362c9dfb..bb57125035 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -509,18 +509,20 @@ static void do_dma_pdma_cb(ESPState *s)
         /* Copy FIFO data to device */
         len = MIN(s->async_len, ESP_FIFO_SZ);
         len = MIN(len, fifo8_num_used(&s->fifo));
-        memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
-        s->async_buf += n;
-        s->async_len -= n;
-        s->ti_size += n;
-
-        if (n < len) {
-            /* Unaligned accesses can cause FIFO wraparound */
-            len = len - n;
+        if (len) {
             memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
             s->async_buf += n;
             s->async_len -= n;
             s->ti_size += n;
+
+            if (n < len) {
+                /* Unaligned accesses can cause FIFO wraparound */
+                len = len - n;
+                memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
+                s->async_buf += n;
+                s->async_len -= n;
+                s->ti_size += n;
+            }
         }
 
         if (s->async_len == 0) {
@@ -730,10 +732,12 @@ static void esp_do_nodma(ESPState *s)
 
     if (to_device) {
         len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
-        memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
-        s->async_buf += len;
-        s->async_len -= len;
-        s->ti_size += len;
+        if (len) {
+            memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
+            s->async_buf += len;
+            s->async_len -= len;
+            s->ti_size += len;
+        }
     } else {
         len = MIN(s->ti_size, s->async_len);
         len = MIN(len, fifo8_num_free(&s->fifo));
-- 
2.20.1


