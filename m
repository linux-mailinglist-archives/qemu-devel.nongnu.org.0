Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BED35106B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:56:16 +0200 (CEST)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsBb-0004Py-8T
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5j-0005ia-A0
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:50:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57038
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5h-0000ur-Bt
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:50:10 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5n-0004IO-IM; Thu, 01 Apr 2021 08:50:19 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Thu,  1 Apr 2021 08:49:27 +0100
Message-Id: <20210401074933.9923-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 05/11] esp: introduce esp_fifo_pop_buf() and use it instead
 of fifo8_pop_buf()
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

The const pointer returned by fifo8_pop_buf() lies directly within the array used
to model the FIFO. Building with address sanitisers enabled shows that if the
caller expects a minimum number of bytes present then if the FIFO is nearly full,
the caller may unexpectedly access past the end of the array.

Introduce esp_fifo_pop_buf() which takes a destination buffer and performs a
memcpy() in it to guarantee that the caller cannot overwrite the FIFO array and
update all callers to use it. Similarly add underflow protection similar to
esp_fifo_push() and esp_fifo_pop() so that instead of triggering an assert()
the operation becomes a no-op.

Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index ce88866803..1aa2caf57d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -107,6 +107,7 @@ static void esp_fifo_push(Fifo8 *fifo, uint8_t val)
 
     fifo8_push(fifo, val);
 }
+
 static uint8_t esp_fifo_pop(Fifo8 *fifo)
 {
     if (fifo8_is_empty(fifo)) {
@@ -116,6 +117,23 @@ static uint8_t esp_fifo_pop(Fifo8 *fifo)
     return fifo8_pop(fifo);
 }
 
+static uint32_t esp_fifo_pop_buf(Fifo8 *fifo, uint8_t *dest, int maxlen)
+{
+    const uint8_t *buf;
+    uint32_t n;
+
+    if (maxlen == 0) {
+        return 0;
+    }
+
+    buf = fifo8_pop_buf(fifo, maxlen, &n);
+    if (dest) {
+        memcpy(dest, buf, n);
+    }
+
+    return n;
+}
+
 static uint32_t esp_get_tc(ESPState *s)
 {
     uint32_t dmalen;
@@ -240,11 +258,11 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
         if (dmalen == 0) {
             return 0;
         }
-        memcpy(buf, fifo8_pop_buf(&s->fifo, dmalen, &n), dmalen);
-        if (dmalen >= 3) {
+        n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
+        if (n >= 3) {
             buf[0] = buf[2] >> 5;
         }
-        fifo8_push_all(&s->cmdfifo, buf, dmalen);
+        fifo8_push_all(&s->cmdfifo, buf, n);
     }
     trace_esp_get_cmd(dmalen, target);
 
@@ -257,16 +275,16 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
 
 static void do_busid_cmd(ESPState *s, uint8_t busid)
 {
-    uint32_t n, cmdlen;
+    uint32_t cmdlen;
     int32_t datalen;
     int lun;
     SCSIDevice *current_lun;
-    uint8_t *buf;
+    uint8_t buf[ESP_CMDFIFO_SZ];
 
     trace_esp_do_busid_cmd(busid);
     lun = busid & 7;
     cmdlen = fifo8_num_used(&s->cmdfifo);
-    buf = (uint8_t *)fifo8_pop_buf(&s->cmdfifo, cmdlen, &n);
+    esp_fifo_pop_buf(&s->cmdfifo, buf, cmdlen);
 
     current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, lun);
     s->current_req = scsi_req_new(current_lun, 0, lun, buf, s);
@@ -299,13 +317,12 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
 static void do_cmd(ESPState *s)
 {
     uint8_t busid = fifo8_pop(&s->cmdfifo);
-    uint32_t n;
 
     s->cmdfifo_cdb_offset--;
 
     /* Ignore extended messages for now */
     if (s->cmdfifo_cdb_offset) {
-        fifo8_pop_buf(&s->cmdfifo, s->cmdfifo_cdb_offset, &n);
+        esp_fifo_pop_buf(&s->cmdfifo, NULL, s->cmdfifo_cdb_offset);
         s->cmdfifo_cdb_offset = 0;
     }
 
@@ -483,7 +500,7 @@ static void do_dma_pdma_cb(ESPState *s)
         /* Copy FIFO data to device */
         len = MIN(s->async_len, ESP_FIFO_SZ);
         len = MIN(len, fifo8_num_used(&s->fifo));
-        memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
+        n = esp_fifo_pop_buf(&s->fifo, s->async_buf, len);
         s->async_buf += n;
         s->async_len -= n;
         s->ti_size += n;
@@ -491,7 +508,7 @@ static void do_dma_pdma_cb(ESPState *s)
         if (n < len) {
             /* Unaligned accesses can cause FIFO wraparound */
             len = len - n;
-            memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
+            n = esp_fifo_pop_buf(&s->fifo, s->async_buf, len);
             s->async_buf += n;
             s->async_len -= n;
             s->ti_size += n;
@@ -667,7 +684,7 @@ static void esp_do_dma(ESPState *s)
 static void esp_do_nodma(ESPState *s)
 {
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
-    uint32_t cmdlen, n;
+    uint32_t cmdlen;
     int len;
 
     if (s->do_cmd) {
@@ -708,7 +725,7 @@ static void esp_do_nodma(ESPState *s)
 
     if (to_device) {
         len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
-        memcpy(s->async_buf, fifo8_pop_buf(&s->fifo, len, &n), len);
+        esp_fifo_pop_buf(&s->fifo, s->async_buf, len);
         s->async_buf += len;
         s->async_len -= len;
         s->ti_size += len;
-- 
2.20.1


