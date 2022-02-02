Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F94A6F15
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 11:44:09 +0100 (CET)
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFD7P-00072G-MZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 05:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1nFCwP-0004C9-Nq; Wed, 02 Feb 2022 05:32:50 -0500
Received: from mail09.asahi-net.or.jp ([202.224.55.49]:58618)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>)
 id 1nFCwK-0000Fv-Iy; Wed, 02 Feb 2022 05:32:45 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail09.asahi-net.or.jp (Postfix) with ESMTPA id 20F34418D7;
 Wed,  2 Feb 2022 19:30:32 +0900 (JST)
Received: from SIOS1075.flets-east.jp (b150065.dynamic.ppp.asahi-net.or.jp
 [202.213.150.65])
 by sakura.ysato.name (Postfix) with ESMTPSA id 656D31C01B8;
 Wed,  2 Feb 2022 19:30:32 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH v2] hw/rx: rx-gdbsim DTB load address aligned of 16byte.
Date: Wed,  2 Feb 2022 19:30:23 +0900
Message-Id: <20220202103023.788916-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.49;
 envelope-from=ysato@users.sourceforge.jp; helo=mail09.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel required alined address of DTB.
But missing align in dtb load function.
Fixed to load to the correct address.

v2 changes.
Use ROUND_DOWN macro.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rx/rx-gdbsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 75d1fec6ca..2356af83a0 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -142,7 +142,7 @@ static void rx_gdbsim_init(MachineState *machine)
                 exit(1);
             }
             /* DTB is located at the end of SDRAM space. */
-            dtb_offset = machine->ram_size - dtb_size;
+            dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16 - 1);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
             /* Set dtb address to R1 */
-- 
2.30.2


