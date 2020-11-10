Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291442AE25B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 23:00:13 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcbgQ-0000ri-Ch
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 17:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcbb6-0007bj-Pe
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:54:40 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:14116)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcbb5-0002cS-1L
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:54:40 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AALrZM2095294;
 Tue, 10 Nov 2020 22:53:35 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AALrYqA028054; Tue, 10 Nov 2020 22:53:34 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AALrYHZ028053;
 Tue, 10 Nov 2020 22:53:34 +0100
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 v3 1/4] hw/net/can/ctucan: Don't allow guest to write
 off end of tx_buffer
Date: Tue, 10 Nov 2020 22:52:47 +0100
Message-Id: <94d4236dee6973978398e6e2a3a321b65a7d35be.1605044619.git.pisa@cmp.felk.cvut.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1605044619.git.pisa@cmp.felk.cvut.cz>
References: <cover.1605044619.git.pisa@cmp.felk.cvut.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AALrZM2095294
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605650019.03741@U0Ja59RiVa3UlzW+OwSn8Q
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

The ctucan device has 4 CAN bus cores, each of which has a set of 20
32-bit registers for writing the transmitted data. The registers are
however not contiguous; each core's buffers is 0x100 bytes after
the last.

We got the checks on the address wrong in the ctucan_mem_write()
function:
 * the first "is addr in range at all" check allowed
   addr == CTUCAN_CORE_MEM_SIZE, which is actually the first
   byte off the end of the range
 * the decode of addresses into core-number plus offset in the
   tx buffer for that core failed to check that the offset was
   in range, so the guest could write off the end of the
   tx_buffer[] array

NB: currently the values of CTUCAN_CORE_MEM_SIZE, CTUCAN_CORE_TXBUF_NUM,
etc, make "buff_num >= CTUCAN_CORE_TXBUF_NUM" impossible, but we
retain this as a runtime check rather than an assertion to permit
those values to be changed in future (in hardware they are
configurable synthesis parameters).

Fix the top level check, and check the offset is within the buffer.

Fixes: Coverity CID 1432874
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
---
 hw/net/can/ctucan_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index d20835cd7e..8486f429d7 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -303,7 +303,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
     DPRINTF("write 0x%02llx addr 0x%02x\n",
             (unsigned long long)val, (unsigned int)addr);
 
-    if (addr > CTUCAN_CORE_MEM_SIZE) {
+    if (addr >= CTUCAN_CORE_MEM_SIZE) {
         return;
     }
 
@@ -312,7 +312,9 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
         addr -= CTU_CAN_FD_TXTB1_DATA_1;
         buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
         addr %= CTUCAN_CORE_TXBUFF_SPAN;
-        if (buff_num < CTUCAN_CORE_TXBUF_NUM) {
+        addr &= ~3;
+        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) &&
+            (addr < sizeof(s->tx_buffer[buff_num].data))) {
             uint32_t *bufp = (uint32_t *)(s->tx_buffer[buff_num].data + addr);
             *bufp = cpu_to_le32(val);
         }
-- 
2.20.1


