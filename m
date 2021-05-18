Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54338821D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:29:04 +0200 (CEST)
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7Gx-0005Dq-Ds
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lj7DP-0000BH-Vc; Tue, 18 May 2021 17:25:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49852
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lj7DN-0001Tt-0K; Tue, 18 May 2021 17:25:23 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lj7DO-0002vs-Mp; Tue, 18 May 2021 22:25:23 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org, pbonzini@redhat.com,
 fam@euphon.net, laurent@vivier.eu
Date: Tue, 18 May 2021 22:25:11 +0100
Message-Id: <20210518212511.21688-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518212511.21688-1-mark.cave-ayland@ilande.co.uk>
References: <20210518212511.21688-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/2] esp: only set ESP_RSEQ at the start of the select sequence
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

When processing a command to select a target and send a CDB, the ESP device
maintains a sequence step register so that if an error occurs the host can
determine which part of the selection/CDB submission sequence failed.

The old Linux 2.6 driver is really pedantic here: it checks the sequence step
register even if a command succeeds and complains loudly on the console if the
sequence step register doesn't match the expected bus phase and interrupt flags.

This reason this mismatch occurs is because the ESP emulation currently doesn't
update the bus phase until the next TI (Transfer Information) command and so the
cleared sequence step register is considered invalid for the stale bus phase.

Normally this isn't an issue as the host only checks the sequence step register
if an error occurs but the old Linux 2.6 driver does this in several places
causing a large stream of "esp0: STEP_ASEL for tgt 0" messages to appear on the
console during the boot process.

Fix this by not clearing the sequence step register when reading the interrupt
register and clearing the DMA status, so the guest sees a valid sequence step
and bus phase combination at the end of the command phase. No other change is
required since the sequence step register is correctly updated throughout the
selection/CDB submission sequence once one of the select commands is issued.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 1b9e48a5bd ("esp: implement non-DMA transfers in PDMA mode")
---
 hw/scsi/esp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 000e45a624..18d4d56392 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -481,7 +481,6 @@ static void esp_dma_done(ESPState *s)
 {
     s->rregs[ESP_RSTAT] |= STAT_TC;
     s->rregs[ESP_RINTR] |= INTR_BS;
-    s->rregs[ESP_RSEQ] = 0;
     s->rregs[ESP_RFLAGS] = 0;
     esp_set_tc(s, 0);
     esp_raise_irq(s);
@@ -917,7 +916,15 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
         val = s->rregs[ESP_RINTR];
         s->rregs[ESP_RINTR] = 0;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
-        s->rregs[ESP_RSEQ] = SEQ_0;
+        /*
+         * According to the datasheet ESP_RSEQ should be cleared, but as the
+         * emulation currently defers information transfers to the next TI
+         * command leave it for now so that pedantic guests such as the old
+         * Linux 2.6 driver see the correct flags before the next SCSI phase
+         * transition.
+         *
+         * s->rregs[ESP_RSEQ] = SEQ_0;
+         */
         esp_lower_irq(s);
         break;
     case ESP_TCHI:
-- 
2.20.1


