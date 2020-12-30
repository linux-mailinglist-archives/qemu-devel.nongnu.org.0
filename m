Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543E2E7A84
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:43:28 +0100 (CET)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuddH-0005NZ-Do
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYb-0000Ie-Aq
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:37 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50784
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYY-00022k-VB
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:36 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYY-00070L-Qy; Wed, 30 Dec 2020 15:38:38 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:28 +0000
Message-Id: <20201230153745.30241-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/25] esp: apply transfer length adjustment when STC is zero
 at TC load time
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

Perform the length adjustment whereby a value of 0 in the STC represents
a transfer length of 0x10000 at the point where the TC is loaded at the
start of a DMA command rather than just when a TI (Transfer Information)
command is executed. This better matches the description as given in the
datasheet.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index c716a97847..f38b4a2ecd 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -564,9 +564,6 @@ static void handle_ti(ESPState *s)
     }
 
     dmalen = esp_get_tc(s);
-    if (dmalen == 0) {
-        dmalen = 0x10000;
-    }
     s->dma_counter = dmalen;
 
     if (s->do_cmd) {
@@ -701,7 +698,11 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         if (val & CMD_DMA) {
             s->dma = 1;
             /* Reload DMA counter.  */
-            esp_set_tc(s, esp_get_stc(s));
+            if (esp_get_stc(s) == 0) {
+                esp_set_tc(s, 0x10000);
+            } else {
+                esp_set_tc(s, esp_get_stc(s));
+            }
         } else {
             s->dma = 0;
         }
-- 
2.20.1


