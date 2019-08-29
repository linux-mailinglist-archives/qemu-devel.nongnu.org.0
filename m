Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE3A1601
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:32:58 +0200 (CEST)
Received: from localhost ([::1]:47810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Hjd-0002Vc-C9
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3HcR-0005GX-9D
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3HcP-0005KE-3B
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:30 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45249 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i3HcO-0005GB-Gm
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:28 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9ECD81A2198;
 Thu, 29 Aug 2019 12:25:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 731971A1E16;
 Thu, 29 Aug 2019 12:25:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:24:46 +0200
Message-Id: <1567074313-22998-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 04/31] target/mips: Clean up handling of CP0
 register 3
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 3.

Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1567009614-12438-5-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/cpu.h       |  1 +
 target/mips/translate.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 466f72a..d5b7103 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -302,6 +302,7 @@ typedef struct mips_def_t mips_def_t;
 /* CP0 Register 03 */
 #define CP0_REG03__ENTRYLO1        0
 #define CP0_REG03__GLOBALNUM       1
+#define CP0_REG03__TCOPT           7
 /* CP0 Register 04 */
 #define CP0_REG04__CONTEXT         0
 #define CP0_REG04__USERLOCAL       2
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 66c6207..059f53e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6647,7 +6647,7 @@ static void gen_mfhc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_03:
         switch (sel) {
-        case 0:
+        case CP0_REG03__ENTRYLO1:
             CP0_CHECK(ctx->hflags & MIPS_HFLAG_ELPA);
             gen_mfhc0_entrylo(arg, offsetof(CPUMIPSState, CP0_EntryLo1));
             register_name = "EntryLo1";
@@ -6728,7 +6728,7 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_03:
         switch (sel) {
-        case 0:
+        case CP0_REG03__ENTRYLO1:
             CP0_CHECK(ctx->hflags & MIPS_HFLAG_ELPA);
             tcg_gen_andi_tl(arg, arg, mask);
             gen_mthc0_entrylo(arg, offsetof(CPUMIPSState, CP0_EntryLo1));
@@ -6947,7 +6947,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_03:
         switch (sel) {
-        case 0:
+        case CP0_REG03__ENTRYLO1:
             {
                 TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_ld_i64(tmp, cpu_env,
@@ -6964,7 +6964,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             }
             register_name = "EntryLo1";
             break;
-        case 1:
+        case CP0_REG03__GLOBALNUM:
             CP0_CHECK(ctx->vp);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_GlobalNumber));
             register_name = "GlobalNumber";
@@ -7695,11 +7695,11 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_03:
         switch (sel) {
-        case 0:
+        case CP0_REG03__ENTRYLO1:
             gen_helper_mtc0_entrylo1(cpu_env, arg);
             register_name = "EntryLo1";
             break;
-        case 1:
+        case CP0_REG03__GLOBALNUM:
             CP0_CHECK(ctx->vp);
             /* ignored */
             register_name = "GlobalNumber";
@@ -8440,11 +8440,11 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_03:
         switch (sel) {
-        case 0:
+        case CP0_REG03__ENTRYLO1:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EntryLo1));
             register_name = "EntryLo1";
             break;
-        case 1:
+        case CP0_REG03__GLOBALNUM:
             CP0_CHECK(ctx->vp);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_GlobalNumber));
             register_name = "GlobalNumber";
@@ -9153,11 +9153,11 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_03:
         switch (sel) {
-        case 0:
+        case CP0_REG03__ENTRYLO1:
             gen_helper_dmtc0_entrylo1(cpu_env, arg);
             register_name = "EntryLo1";
             break;
-        case 1:
+        case CP0_REG03__GLOBALNUM:
             CP0_CHECK(ctx->vp);
             /* ignored */
             register_name = "GlobalNumber";
-- 
2.7.4


