Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB4351071
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:58:34 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsDp-0006yO-CD
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs63-0005qY-J2
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:50:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57056
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5r-00012W-DJ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:50:27 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRs5w-0004IO-VH; Thu, 01 Apr 2021 08:50:29 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Thu,  1 Apr 2021 08:49:29 +0100
Message-Id: <20210401074933.9923-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 07/11] esp: don't underflow cmdfifo in do_cmd()
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

If the guest tries to execute a CDB when cmdfifo is not empty before the start
of the message out phase then clearing the message out phase data will cause
cmdfifo to underflow due to cmdfifo_cdb_offset being larger than the amount of
data within.

Since this can only occur by issuing deliberately incorrect instruction
sequences, ensure that the maximum length of esp_fifo_pop_buf() is limited to
the size of the data within cmdfifo.

Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 4decbbfc29..7f49522e1d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -319,13 +319,15 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
 
 static void do_cmd(ESPState *s)
 {
-    uint8_t busid = fifo8_pop(&s->cmdfifo);
+    uint8_t busid = esp_fifo_pop(&s->cmdfifo);
+    int len;
 
     s->cmdfifo_cdb_offset--;
 
     /* Ignore extended messages for now */
     if (s->cmdfifo_cdb_offset) {
-        esp_fifo_pop_buf(&s->cmdfifo, NULL, s->cmdfifo_cdb_offset);
+        len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
+        esp_fifo_pop_buf(&s->cmdfifo, NULL, len);
         s->cmdfifo_cdb_offset = 0;
     }
 
-- 
2.20.1


