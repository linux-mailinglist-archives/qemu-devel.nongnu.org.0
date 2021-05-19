Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90B388B86
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:17:48 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJGt-0002WB-Ex
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7j-0002cF-NA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37264
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7h-0003I3-Hk
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:19 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7f-0001Gv-Ad; Wed, 19 May 2021 11:08:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu, hpoussin@reactos.org
Date: Wed, 19 May 2021 11:08:03 +0100
Message-Id: <20210519100803.10293-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 5/5] esp: correctly accumulate extended messages for PDMA
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

Commit 799d90d818 "esp: transition to message out phase after SATN and stop
command" added logic to correctly handle extended messages for DMA requests
but not for PDMA requests.

Apply the same logic in esp_do_dma() to do_dma_pdma_cb() so that extended
messages terminated with a PDMA request are accumulated correctly. This allows
the ESP device to respond correctly to the SDTR negotiation initiated by the
NetBSD ESP driver without causing errors and timeouts on boot.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index a6f7c6c1bf..2063bf1786 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -493,9 +493,26 @@ static void do_dma_pdma_cb(ESPState *s)
         }
 
         s->ti_size = 0;
-        s->do_cmd = 0;
-        do_cmd(s);
-        esp_lower_drq(s);
+        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
+            /* No command received */
+            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
+                return;
+            }
+
+            /* Command has been received */
+            s->do_cmd = 0;
+            do_cmd(s);
+        } else {
+            /*
+             * Extra message out bytes received: update cmdfifo_cdb_offset
+             * and then switch to commmand phase
+             */
+            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
+            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
+            s->rregs[ESP_RSEQ] = SEQ_CD;
+            s->rregs[ESP_RINTR] |= INTR_BS;
+            esp_raise_irq(s);
+        }
         return;
     }
 
-- 
2.20.1


