Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619BF2AE24F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 22:59:47 +0100 (CET)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcbg1-0000jN-Rf
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 16:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcbao-0007Sg-PL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:54:27 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:25113)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcbam-0002b2-14
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:54:22 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AALr61Z095268;
 Tue, 10 Nov 2020 22:53:06 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AALr6Tb027990; Tue, 10 Nov 2020 22:53:06 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AALr6rt027989;
 Tue, 10 Nov 2020 22:53:06 +0100
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 v3 0/4] hw/net/can/ctucan: fix Coverity and other
 issues
Date: Tue, 10 Nov 2020 22:52:46 +0100
Message-Id: <cover.1605044619.git.pisa@cmp.felk.cvut.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AALr61Z095268
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605649993.15196@+8KMR/wdLci5fbxfyurI4g
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

Credit for finding and fixes goes to Peter Maydell

This patchset fixes a couple of issues spotted by Coverity:
 * incorrect address checks meant the guest could write off the
   end of the tx_buffer arrays
 * we had an unused value in ctucan_send_ready_buffers()
and also some I noticed while reading the code:
 * we don't adjust the device's non-portable use of bitfields
   on bigendian hosts
 * we should use stl_le_p() rather than casting uint_t* to
   uint32_t*

Tested with "make check" only.

Changes v1->v2: don't assert() the can't-happen case in patch 1,
to allow for future adjustment of #defines that correspond to
h/w synthesis parameters.

Changes v2->v3: minnor corrections of range checking,
support for unaligned and partial word writes into Tx
buffers. Tested on x86_64 guest on x86_64 host and bige-edian
MIPS guest on x86_64 host Pavel Pisa.

Peter Maydell (4):
  hw/net/can/ctucan: Don't allow guest to write off end of tx_buffer
  hw/net/can/ctucan: Avoid unused value in ctucan_send_ready_buffers()
  hw/net/can/ctucan_core: Handle big-endian hosts
  hw/net/can/ctucan_core: Use stl_le_p to write to tx_buffers

 hw/net/can/ctucan_core.c | 23 +++++++----------------
 hw/net/can/ctucan_core.h |  3 +--
 2 files changed, 8 insertions(+), 18 deletions(-)

-- 
2.20.1


