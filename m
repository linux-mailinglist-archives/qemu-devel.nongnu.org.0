Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C836F2E7A7C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:41:50 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudbh-0002Yz-NP
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYs-0000ik-Lh
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50820
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYr-00027T-8M
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:54 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYn-00070L-9x; Wed, 30 Dec 2020 15:38:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:31 +0000
Message-Id: <20201230153745.30241-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/25] esp: remove minlen restriction in handle_ti
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

The limiting of DMA transfers to the maximum size of the available data is already
handled by esp_do_dma() and do_dma_pdma_cb().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 69fed3cb22..39c5eeb57c 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -556,7 +556,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
 
 static void handle_ti(ESPState *s)
 {
-    uint32_t dmalen, minlen;
+    uint32_t dmalen;
 
     if (s->dma && !s->dma_enabled) {
         s->dma_cb = handle_ti;
@@ -564,16 +564,8 @@ static void handle_ti(ESPState *s)
     }
 
     dmalen = esp_get_tc(s);
-
-    if (s->do_cmd) {
-        minlen = (dmalen < ESP_CMDBUF_SZ) ? dmalen : ESP_CMDBUF_SZ;
-    } else if (s->ti_size < 0) {
-        minlen = (dmalen < -s->ti_size) ? dmalen : -s->ti_size;
-    } else {
-        minlen = (dmalen < s->ti_size) ? dmalen : s->ti_size;
-    }
-    trace_esp_handle_ti(minlen);
     if (s->dma) {
+        trace_esp_handle_ti(dmalen);
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
         esp_do_dma(s);
     } else if (s->do_cmd) {
-- 
2.20.1


