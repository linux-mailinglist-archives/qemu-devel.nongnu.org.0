Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82872AE261
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 23:00:26 +0100 (CET)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcbgf-00010S-LT
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 17:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcbbG-0007im-9u
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:54:50 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:14116)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcbbB-0002cS-7N
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:54:50 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AALrblo095295;
 Tue, 10 Nov 2020 22:53:37 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AALrbxs028066; Tue, 10 Nov 2020 22:53:37 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AALraeB028065;
 Tue, 10 Nov 2020 22:53:36 +0100
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 v3 2/4] hw/net/can/ctucan: Avoid unused value in
 ctucan_send_ready_buffers()
Date: Tue, 10 Nov 2020 22:52:48 +0100
Message-Id: <96562ba01919479f7f311050e914419ed3c2f194.1605044619.git.pisa@cmp.felk.cvut.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1605044619.git.pisa@cmp.felk.cvut.cz>
References: <cover.1605044619.git.pisa@cmp.felk.cvut.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AALrblo095295
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605650019.10731@7y1gp9Ofs2U+1lucnbn/Qg
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 16:54:16
X-ACL-Warn: Detected OS   = ???
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
Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Ondrej Ille <ondrej.ille@gmail.com>,
 =?UTF-8?q?Jan=20Charv=C3=A1t?= <charvj10@fel.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that in ctucan_send_ready_buffers() we
set buff_st_mask = 0xf << (i * 4) inside the loop, but then
we never use it before overwriting it later.

The only thing we use the mask for is as part of the code that is
inserting the new buff_st field into tx_status.  That is more
comprehensibly written using deposit32(), so do that and drop the
mask variable entirely.

We also update the buff_st local variable at multiple points
during this function, but nothing can ever see these
intermediate values, so just drop those, write the final
TXT_TOK as a fixed constant value, and collapse the only
remaining set/use of buff_st down into an extract32().

Fixes: Coverity CID 1432869
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
---
 hw/net/can/ctucan_core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index 8486f429d7..f49c76261c 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -240,8 +240,6 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
     uint8_t *pf;
     int buff2tx_idx;
     uint32_t tx_prio_max;
-    unsigned int buff_st;
-    uint32_t buff_st_mask;
 
     if (!s->mode_settings.s.ena) {
         return;
@@ -256,10 +254,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         for (i = 0; i < CTUCAN_CORE_TXBUF_NUM; i++) {
             uint32_t prio;
 
-            buff_st_mask = 0xf << (i * 4);
-            buff_st = (s->tx_status.u32 >> (i * 4)) & 0xf;
-
-            if (buff_st != TXT_RDY) {
+            if (extract32(s->tx_status.u32, i * 4, 4) != TXT_RDY) {
                 continue;
             }
             prio = (s->tx_priority.u32 >> (i * 4)) & 0x7;
@@ -271,10 +266,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         if (buff2tx_idx == -1) {
             break;
         }
-        buff_st_mask = 0xf << (buff2tx_idx * 4);
-        buff_st = (s->tx_status.u32 >> (buff2tx_idx * 4)) & 0xf;
         int_stat.u32 = 0;
-        buff_st = TXT_RDY;
         pf = s->tx_buffer[buff2tx_idx].data;
         ctucan_buff2frame(pf, &frame);
         s->status.s.idle = 0;
@@ -283,12 +275,11 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         s->status.s.idle = 1;
         s->status.s.txs = 0;
         s->tx_fr_ctr.s.tx_fr_ctr_val++;
-        buff_st = TXT_TOK;
         int_stat.s.txi = 1;
         int_stat.s.txbhci = 1;
         s->int_stat.u32 |= int_stat.u32 & ~s->int_mask.u32;
-        s->tx_status.u32 = (s->tx_status.u32 & ~buff_st_mask) |
-                        (buff_st << (buff2tx_idx * 4));
+        s->tx_status.u32 = deposit32(s->tx_status.u32,
+                                     buff2tx_idx * 4, 4, TXT_TOK);
     } while (1);
 }
 
-- 
2.20.1


