Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8B3156FE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:44:43 +0100 (CET)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YwE-0002Hf-Nc
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YjT-0004ap-Ek
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:31 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56848
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YjR-0002N6-SY
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:31 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yjk-0007pt-O3; Tue, 09 Feb 2021 19:31:53 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:48 +0000
Message-Id: <20210209193018.31339-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 12/42] esp: remove dma_counter from ESPState
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

The value of dma_counter is set once at the start of the transfer and remains
the same until the transfer is complete. This allows the check in esp_transfer_data
to be simplified since dma_left will always be non-zero until the transfer is
completed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c         | 4 +---
 include/hw/scsi/esp.h | 3 ---
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 02b7876394..6c495b29c0 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -229,7 +229,6 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
     if (datalen != 0) {
         s->rregs[ESP_RSTAT] = STAT_TC;
         s->dma_left = 0;
-        s->dma_counter = 0;
         if (datalen > 0) {
             s->rregs[ESP_RSTAT] |= STAT_DI;
         } else {
@@ -543,7 +542,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
     s->async_buf = scsi_req_get_buf(req);
     if (s->dma_left) {
         esp_do_dma(s);
-    } else if (s->dma_counter != 0 && s->ti_size <= 0) {
+    } else if (s->ti_size <= 0) {
         /*
          * If this was the last part of a DMA transfer then the
          * completion interrupt is deferred to here.
@@ -562,7 +561,6 @@ static void handle_ti(ESPState *s)
     }
 
     dmalen = esp_get_tc(s);
-    s->dma_counter = dmalen;
 
     if (s->do_cmd) {
         minlen = (dmalen < ESP_CMDBUF_SZ) ? dmalen : ESP_CMDBUF_SZ;
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 7d92471c5b..b313ef27f2 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -50,9 +50,6 @@ struct ESPState {
 
     /* The amount of data left in the current DMA transfer.  */
     uint32_t dma_left;
-    /* The size of the current DMA transfer.  Zero if no transfer is in
-       progress.  */
-    uint32_t dma_counter;
     int dma_enabled;
 
     uint32_t async_len;
-- 
2.20.1


