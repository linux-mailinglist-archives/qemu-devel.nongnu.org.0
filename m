Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5E261D9BD
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 12:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orHbI-0004Fi-SX; Sat, 05 Nov 2022 07:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1orHbD-0004CY-Hc; Sat, 05 Nov 2022 07:44:31 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1orHbB-0005mI-ME; Sat, 05 Nov 2022 07:44:31 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id B9771DA08BC;
 Sat,  5 Nov 2022 12:44:25 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 9C0644621B3; Sat,  5 Nov 2022 12:44:25 +0100 (CET)
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH for-7.2] accel/tcg: Suppress compiler warning with flag
 -Wclobbered
Date: Sat,  5 Nov 2022 12:44:24 +0100
Message-Id: <20221105114424.622563-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At least some versions of gcc show a warning when compiler flag -Wclobbered
is used (tested with gcc on Debian bookworm i386 and with cross gcc for
Windows on Debian bullseye).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 accel/tcg/translate-all.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 921944a5ab..90191d97ec 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -743,6 +743,8 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 /* Called with mmap_lock held for user mode emulation.  */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wclobbered"
 TranslationBlock *tb_gen_code(CPUState *cpu,
                               target_ulong pc, target_ulong cs_base,
                               uint32_t flags, int cflags)
@@ -1020,6 +1022,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
     return tb;
 }
+#pragma GCC diagnostic pop
 
 /* user-mode: call with mmap_lock held */
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
-- 
2.30.2


