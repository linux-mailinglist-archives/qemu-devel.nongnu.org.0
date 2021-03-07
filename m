Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87AF3300E1
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:34:35 +0100 (CET)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIscE-00071f-S5
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEM-0000e4-UX
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:56 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43596
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEK-0007c9-Qt
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:54 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsED-0002V5-La; Sun, 07 Mar 2021 12:09:50 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:16 +0000
Message-Id: <20210307120850.10418-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 08/42] esp: determine transfer direction directly from SCSI
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-9-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index e0676ae790..5365523f6b 100644
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


