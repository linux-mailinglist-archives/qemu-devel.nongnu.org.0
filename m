Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125AC9925F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:41:37 +0200 (CEST)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lTE-0000Om-12
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP7-0004ib-CU
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lOt-0007jv-Tr
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:15 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48182 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lOs-0007hm-O9
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:06 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 96F0A1A204B;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 645391A2073;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:33 +0200
Message-Id: <1566473750-17743-10-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 09/26] target/mips: Clean up handling of CP0
 register 10
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
Cc: aurelien@aurel32.net, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 10.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       | 1 +
 target/mips/translate.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index c7fdf1d..5e08b78 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -341,6 +341,7 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG10__ENTRYHI         0
 #define CP0_REG10__GUESTCTL1       4
 #define CP0_REG10__GUESTCTL2       5
+#define CP0_REG10__GUESTCTL3       6
 /* CP0 Register 11 */
 #define CP0_REG11__COMPARE         0
 #define CP0_REG11__GUESTCTL0EXT    4
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f8baa95..b376103 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7202,7 +7202,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_10:
         switch (sel) {
-        case 0:
+        case CP0_REG10__ENTRYHI:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EntryHi));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "EntryHi";
@@ -7923,7 +7923,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_10:
         switch (sel) {
-        case 0:
+        case CP0_REG10__ENTRYHI:
             gen_helper_mtc0_entryhi(cpu_env, arg);
             register_name = "EntryHi";
             break;
@@ -8690,7 +8690,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_10:
         switch (sel) {
-        case 0:
+        case CP0_REG10__ENTRYHI:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EntryHi));
             register_name = "EntryHi";
             break;
@@ -9396,7 +9396,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_10:
         switch (sel) {
-        case 0:
+        case CP0_REG10__ENTRYHI:
             gen_helper_mtc0_entryhi(cpu_env, arg);
             register_name = "EntryHi";
             break;
-- 
2.7.4


