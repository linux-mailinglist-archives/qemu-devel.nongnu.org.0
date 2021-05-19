Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FAA388B6A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:13:41 +0200 (CEST)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJCm-0005jN-IX
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7k-0002fE-Nq
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37242
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7g-0003H9-QH
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:20 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7Z-0001Gv-IV; Wed, 19 May 2021 11:08:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu, hpoussin@reactos.org
Date: Wed, 19 May 2021 11:07:59 +0100
Message-Id: <20210519100803.10293-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/5] esp: allow non-DMA callback in esp_transfer_data()
 initial transfer
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

The current implementation only resumes DMA transfers when incoming data is
received from the target device, but this is also required for non-DMA transfers
with the next set of non-DMA changes.

Rather than duplicate the DMA/non-DMA dispatch logic in the initial transfer
section, update the code so that the initial transfer section can just
fallthrough to the main DMA/non-DMA dispatch logic.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index b668acef82..a611718769 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -804,16 +804,6 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
         s->rregs[ESP_RSTAT] |= STAT_TC;
         s->rregs[ESP_RINTR] |= INTR_BS;
         esp_raise_irq(s);
-
-        /*
-         * If data is ready to transfer and the TI command has already
-         * been executed, start DMA immediately. Otherwise DMA will start
-         * when host sends the TI command
-         */
-        if (s->ti_size && (s->rregs[ESP_CMD] == (CMD_TI | CMD_DMA))) {
-            esp_do_dma(s);
-        }
-        return;
     }
 
     if (s->ti_cmd == 0) {
@@ -827,7 +817,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
         return;
     }
 
-    if (s->ti_cmd & CMD_DMA) {
+    if (s->ti_cmd == (CMD_TI | CMD_DMA)) {
         if (dmalen) {
             esp_do_dma(s);
         } else if (s->ti_size <= 0) {
@@ -838,7 +828,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
             esp_dma_done(s);
             esp_lower_drq(s);
         }
-    } else {
+    } else if (s->ti_cmd == CMD_TI) {
         esp_do_nodma(s);
     }
 }
-- 
2.20.1


