Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE65585A70
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 14:32:32 +0200 (CEST)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHldv-0000SN-Pe
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 08:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlYy-0004NQ-I5
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 08:27:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlYw-0002G8-6r
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 08:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FzqEmNUvZaMnYSzVcR2bU2YESYx3Lp0BIU8dj6YHjbQ=; b=dO25YRV9E+XftlLTgNkA1XC6Nu
 QfA5qr9Mjem1xLFijPgZda06zpbaaZadASkZ2bA6dkQpSSAMe5q6KiF/76It6gnuq1ChM+Pq7REXq
 cYywzrb7GBIbbmgaEB/4NOI0KSZBCRcdNMsGTAxkult022yLAh/2O9hhK5nE8kTqTzcjxOJr9PCzV
 xCcWEoCjQ4ii8MoudX6OiKYOg/dSMPjdTybZSdmwZd5QfPlfE5A3s+RBaJGaXObvuwy5DErUL2RqP
 Iv53NOqO9QJ75ckGim7EYxGsGuCUDmrnQqcvMJygOwwEm00aShNWs3aFiuSY+cYaCNBk64ilsuPZX
 Fs/6OqbAD9VpnGPtPYQ6/53vm2XGMf99wjshA48PlH3XQzm4vlvH2BzCStHuxpVzKba35BkRfH7bF
 2n0lan6ribaE9mAHK3yMTi/htr7Yf/PSaKfgVnnorR65bKVlj6CBKGvPkUtruMvFY/LtJgoxwiARC
 ceS4IuCiK809HstV5s23njtjHfzHjGIW5zPS57yJR+1hZ+GE6/Rex7FXJgyAviwYMFqF7D5ZEYy9b
 SQD3ru79WurgpoRNMgUnbsbtCgnFPfR6c7XhHPTDX7CZVJTaWTeehN81x+4DcM9Y3vxE1q7QT59/a
 kCjpt0cxoH6uhR6N0HWxQt7Ygq9LZB5BPsY5q6OnA=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oHlXP-0006Ru-5d; Sat, 30 Jul 2022 13:25:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, fam@euphon.net, alxndr@bu.edu, qemu-devel@nongnu.org
Date: Sat, 30 Jul 2022 13:26:56 +0100
Message-Id: <20220730122656.253448-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220730122656.253448-1-mark.cave-ayland@ilande.co.uk>
References: <20220730122656.253448-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-7.1 2/2] scsi-disk: ensure block size is non-zero and
 changes limited to bits 8-15
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The existing code assumes that the block size can be generated from p[1] << 8
in multiple places which ignores the top and bottom 8 bits. If the block size
is allowed to be set to an arbitrary value then this causes a mismatch
between the value written by the guest in the block descriptor and the value
subsequently read back using READ CAPACITY causing the guest to generate
requests that can crash QEMU.

For now restrict block size changes to bits 8-15 and also ignore requests to
set the block size to 0 which causes the SCSI emulation to crash in at least
one place with a divide by zero error.

Fixes: 356c4c441e ("scsi-disk: allow MODE SELECT block descriptor to set the block size")
Closes: https://gitlab.com/qemu-project/qemu/-/issues/1112
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 3027ac3b1e..efee6739f9 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1591,7 +1591,7 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     int cmd = r->req.cmd.buf[0];
     int len = r->req.cmd.xfer;
     int hdr_len = (cmd == MODE_SELECT ? 4 : 8);
-    int bd_len;
+    int bd_len, bs;
     int pass;
 
     if ((r->req.cmd.buf[1] & 0x11) != 0x10) {
@@ -1617,9 +1617,19 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     }
 
     /* Allow changing the block size */
-    if (bd_len && p[6] != (s->qdev.blocksize >> 8)) {
-        s->qdev.blocksize = p[6] << 8;
-        trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+    if (bd_len) {
+        bs = p[5] << 16 | p[6] << 8 | p[7];
+
+        /*
+         * Since the existing code only checks/updates bits 8-15 of the block
+         * size, restrict ourselves to the same requirement for now to ensure
+         * that a block size set by a block descriptor and then read back by
+         * a subsequent SCSI command will be the same
+         */
+        if (bs && !(bs & ~0xff00) && bs != s->qdev.blocksize) {
+            s->qdev.blocksize = bs;
+            trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+        }
     }
 
     len -= bd_len;
-- 
2.30.2


