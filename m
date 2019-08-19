Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C25923DC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:52:46 +0200 (CEST)
Received: from localhost ([::1]:49574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzh9Q-0003lt-W9
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgU5-0002OA-TQ
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgU4-0002xj-F0
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:10:01 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59127 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTy-0002kc-0E
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:54 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 23D571A20A0;
 Mon, 19 Aug 2019 14:08:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 457081A2145;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:08:14 +0200
Message-Id: <1566216496-17375-36-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 35/37] target/mips: Clean up handling of CP0
 register 31
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
Cc: arikalo@wavecomp.com, philmd@redhat.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 31.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  2 +-
 target/mips/translate.c | 56 ++++++++++++++++++++++++-------------------------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index ef40552..46ffb84 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -592,7 +592,6 @@ struct CPUMIPSState {
  * CP0 Register 4
  */
     target_ulong CP0_Context;
-    target_ulong CP0_KScratch[MIPS_KSCRATCH_NUM];
     int32_t CP0_MemoryMapID;
 /*
  * CP0 Register 5
@@ -1003,6 +1002,7 @@ struct CPUMIPSState {
  * CP0 Register 31
  */
     int32_t CP0_DESAVE;
+    target_ulong CP0_KScratch[MIPS_KSCRATCH_NUM];
 
     /* We waste some space so we can handle shadow registers like TCs. */
     TCState tcs[MIPS_SHADOW_SET_MAX];
diff --git a/target/mips/translate.c b/target/mips/translate.c
index a8bd08a..1aa5338 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7582,17 +7582,17 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_31:
         switch (sel) {
-        case 0:
+        case CP0_REG31__DESAVE:
             /* EJTAG support */
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_DESAVE));
             register_name = "DESAVE";
             break;
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG31__KSCRATCH1:
+        case CP0_REG31__KSCRATCH2:
+        case CP0_REG31__KSCRATCH3:
+        case CP0_REG31__KSCRATCH4:
+        case CP0_REG31__KSCRATCH5:
+        case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
             tcg_gen_ld_tl(arg, cpu_env,
                           offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
@@ -8339,17 +8339,17 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_31:
         switch (sel) {
-        case 0:
+        case CP0_REG31__DESAVE:
             /* EJTAG support */
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_DESAVE));
             register_name = "DESAVE";
             break;
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG31__KSCRATCH1:
+        case CP0_REG31__KSCRATCH2:
+        case CP0_REG31__KSCRATCH3:
+        case CP0_REG31__KSCRATCH4:
+        case CP0_REG31__KSCRATCH5:
+        case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
             tcg_gen_st_tl(arg, cpu_env,
                           offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
@@ -9077,17 +9077,17 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_31:
         switch (sel) {
-        case 0:
+        case CP0_REG31__DESAVE:
             /* EJTAG support */
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_DESAVE));
             register_name = "DESAVE";
             break;
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG31__KSCRATCH1:
+        case CP0_REG31__KSCRATCH2:
+        case CP0_REG31__KSCRATCH3:
+        case CP0_REG31__KSCRATCH4:
+        case CP0_REG31__KSCRATCH5:
+        case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
             tcg_gen_ld_tl(arg, cpu_env,
                           offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
@@ -9821,17 +9821,17 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_31:
         switch (sel) {
-        case 0:
+        case CP0_REG31__DESAVE:
             /* EJTAG support */
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_DESAVE));
             register_name = "DESAVE";
             break;
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG31__KSCRATCH1:
+        case CP0_REG31__KSCRATCH2:
+        case CP0_REG31__KSCRATCH3:
+        case CP0_REG31__KSCRATCH4:
+        case CP0_REG31__KSCRATCH5:
+        case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
             tcg_gen_st_tl(arg, cpu_env,
                           offsetof(CPUMIPSState, CP0_KScratch[sel - 2]));
-- 
2.7.4


