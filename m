Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D413D6356
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:28:35 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83T0-0000aL-DL
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1m83Qc-0008G6-B6
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:26:06 -0400
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:34048)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1m83QY-00081R-98
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:26:06 -0400
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 16QGP1Wr095207;
 Mon, 26 Jul 2021 18:25:01 +0200 (CEST)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 16QGP1UM028124; Mon, 26 Jul 2021 18:25:01 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 16QGP0s5028121;
 Mon, 26 Jul 2021 18:25:00 +0200
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net/can: sja1000 fix buff2frame_bas for dlc out of std CAN
 8 bytes
Date: Mon, 26 Jul 2021 18:24:58 +0200
Message-Id: <20210726162458.26197-1-pisa@cmp.felk.cvut.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 16QGP1Wr095207
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1627921504.37022@0ZgaExImNT6bN1EfnNZV6w
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>, Qiang Ning <ningqiang1@huawei.com>,
 Jiri Novak <jnovak@fel.cvut.cz>, Oliver Hartkopp <socketcan@hartkopp.net>,
 Jin-Yang <jinyang.sia@gmail.com>, Ondrej Ille <ondrej.ille@gmail.com>,
 Jan Charvat <charvj10@fel.cvut.cz>, Jan Kiszka <jan.kiszka@siemens.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Problem reported by openEuler fuzz-sig group.

The buff2frame_bas function (hw\net\can\can_sja1000.c)
infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).

Reported-by: Qiang Ning <ningqiang1@huawei.com>
Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
---
 hw/net/can/can_sja1000.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 42d2f99dfb..64e81bff58 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -311,6 +311,10 @@ static void buff2frame_bas(const uint8_t *buff, qemu_can_frame *frame)
     }
     frame->can_dlc = buff[1] & 0x0f;
 
+    if (frame->can_dlc > 8) {
+        frame->can_dlc = 8;
+    }
+
     for (i = 0; i < frame->can_dlc; i++) {
         frame->data[i] = buff[2 + i];
     }
-- 
2.20.1


