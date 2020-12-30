Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072082E7AB0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:51:43 +0100 (CET)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudlF-0005KR-NY
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYR-0000GK-2G
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:27 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50754
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYN-0001zu-FY
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:26 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYL-00070L-RG; Wed, 30 Dec 2020 15:38:25 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:25 +0000
Message-Id: <20201230153745.30241-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/25] esp: determine transfer direction directly from SCSI
 phase
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

The transfer direction is currently determined by checking the sign of ti_size
but as this series progresses ti_size can be zero at the end of the transfer.

Use the SCSI phase to determine the transfer direction as used in other SCSI
controller implementations.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 619c3e9e28..7169294437 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -356,7 +356,7 @@ static void esp_dma_done(ESPState *s)
 
 static void do_dma_pdma_cb(ESPState *s)
 {
-    int to_device = (s->ti_size < 0);
+    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
     int len = s->pdma_cur - s->pdma_start;
     if (s->do_cmd) {
         s->ti_size = 0;
@@ -392,7 +392,7 @@ static void do_dma_pdma_cb(ESPState *s)
 static void esp_do_dma(ESPState *s)
 {
     uint32_t len;
-    int to_device;
+    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
 
     len = s->dma_left;
     if (s->do_cmd) {
@@ -425,7 +425,6 @@ static void esp_do_dma(ESPState *s)
     if (len > s->async_len) {
         len = s->async_len;
     }
-    to_device = (s->ti_size < 0);
     if (to_device) {
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, s->async_buf, len);
-- 
2.20.1


