Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9BC4A3F76
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:44:24 +0100 (CET)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETEV-0003JL-Ja
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1nETCX-0001AH-Nl
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:42:21 -0500
Received: from mail11.asahi-net.or.jp ([202.224.55.51]:41692)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1nETCV-0000vS-OD
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:42:21 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail11.asahi-net.or.jp (Postfix) with ESMTPA id DB9FF209B0;
 Mon, 31 Jan 2022 18:42:15 +0900 (JST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 34D521C0023;
 Mon, 31 Jan 2022 18:42:15 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/rx: rx-gdbsim: DTB load address fix.
Date: Mon, 31 Jan 2022 18:42:03 +0900
Message-Id: <20220131094203.772226-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.51;
 envelope-from=ysato@users.sourceforge.jp; helo=mail11.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel required alined address of DTB.
But missing align in dtb load function.
Fixed to load to the correct address.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/rx/rx-gdbsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 75d1fec6ca..f70472aeaf 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -143,6 +143,7 @@ static void rx_gdbsim_init(MachineState *machine)
             }
             /* DTB is located at the end of SDRAM space. */
             dtb_offset = machine->ram_size - dtb_size;
+            dtb_offset &= ~0x0f;
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
             /* Set dtb address to R1 */
-- 
2.30.2


