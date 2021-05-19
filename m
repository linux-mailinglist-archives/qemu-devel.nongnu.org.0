Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E94B388B68
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:12:50 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJC5-0005b0-Hk
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7j-0002bn-HD
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37254
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7g-0003Hc-Mo
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:19 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7e-0001Gv-E6; Wed, 19 May 2021 11:08:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu, hpoussin@reactos.org
Date: Wed, 19 May 2021 11:08:01 +0100
Message-Id: <20210519100803.10293-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/5] esp: ensure PDMA write transfers are flushed from the
 FIFO to the target immediately
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

After each PDMA write transfer the MacOS CDROM driver waits until the FIFO is empty
(i.e. its contents have been written out to the SCSI bus) by polling the FIFO count
register until it reads 0. This doesn't work with the current PDMA write
implementation which waits until either the FIFO is full or the transfer is complete
before invoking the PDMA callback to process the FIFO contents.

Change the PDMA write transfer logic so that the PDMA callback is invoked after each
PDMA write to transfer the FIFO contents to the target buffer immediately, and hence
avoid getting stuck in the FIFO count register polling loop.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index f2fd4e443a..afb4a7f9f1 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -338,9 +338,9 @@ static void do_cmd(ESPState *s)
 
 static void satn_pdma_cb(ESPState *s)
 {
-    s->do_cmd = 0;
-    if (!fifo8_is_empty(&s->cmdfifo)) {
+    if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
         s->cmdfifo_cdb_offset = 1;
+        s->do_cmd = 0;
         do_cmd(s);
     }
 }
@@ -369,12 +369,9 @@ static void handle_satn(ESPState *s)
 
 static void s_without_satn_pdma_cb(ESPState *s)
 {
-    uint32_t len;
-
-    s->do_cmd = 0;
-    len = fifo8_num_used(&s->cmdfifo);
-    if (len) {
+    if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
         s->cmdfifo_cdb_offset = 0;
+        s->do_cmd = 0;
         do_busid_cmd(s, 0);
     }
 }
@@ -403,8 +400,7 @@ static void handle_s_without_atn(ESPState *s)
 
 static void satn_stop_pdma_cb(ESPState *s)
 {
-    s->do_cmd = 0;
-    if (!fifo8_is_empty(&s->cmdfifo)) {
+    if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
         trace_esp_handle_satn_stop(fifo8_num_used(&s->cmdfifo));
         s->do_cmd = 1;
         s->cmdfifo_cdb_offset = 1;
@@ -494,6 +490,11 @@ static void do_dma_pdma_cb(ESPState *s)
     uint32_t n;
 
     if (s->do_cmd) {
+        /* Ensure we have received complete command after SATN and stop */
+        if (esp_get_tc(s) || fifo8_is_empty(&s->cmdfifo)) {
+            return;
+        }
+
         s->ti_size = 0;
         s->do_cmd = 0;
         do_cmd(s);
@@ -1213,7 +1214,6 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = ESP(&sysbus->esp);
-    uint32_t dmalen;
 
     trace_esp_pdma_write(size);
 
@@ -1226,10 +1226,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         esp_pdma_write(s, val);
         break;
     }
-    dmalen = esp_get_tc(s);
-    if (dmalen == 0 || fifo8_num_free(&s->fifo) < 2) {
-        s->pdma_cb(s);
-    }
+    s->pdma_cb(s);
 }
 
 static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
-- 
2.20.1


