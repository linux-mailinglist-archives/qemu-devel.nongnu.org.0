Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC499268
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:44:47 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lWH-0004u8-3W
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP7-0004kD-VV
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP3-0007rv-IS
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:21 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48212 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lOw-0007ii-GI
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:12 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B64A51A2089;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 929651A2077;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:36 +0200
Message-Id: <1566473750-17743-13-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 12/26] target/mips: Clean up handling of CP0
 register 15
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

Clean up handling of CP0 register 15.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  1 +
 target/mips/translate.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index d61b8c0..3a8c560 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -363,6 +363,7 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG15__EBASE           1
 #define CP0_REG15__CDMMBASE        2
 #define CP0_REG15__CMGCRBASE       3
+#define CP0_REG15__BEVVA           4
 /* CP0 Register 16 */
 #define CP0_REG16__CONFIG          0
 #define CP0_REG16__CONFIG1         1
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 642c108..97a274a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7270,17 +7270,17 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_15:
         switch (sel) {
-        case 0:
+        case CP0_REG15__PRID:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PRid));
             register_name = "PRid";
             break;
-        case 1:
+        case CP0_REG15__EBASE:
             check_insn(ctx, ISA_MIPS32R2);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "EBase";
             break;
-        case 3:
+        case CP0_REG15__CMGCRBASE:
             check_insn(ctx, ISA_MIPS32R2);
             CP0_CHECK(ctx->cmgcr);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_CMGCRBase));
@@ -8007,11 +8007,11 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_15:
         switch (sel) {
-        case 0:
+        case CP0_REG15__PRID:
             /* ignored */
             register_name = "PRid";
             break;
-        case 1:
+        case CP0_REG15__EBASE:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_ebase(cpu_env, arg);
             register_name = "EBase";
@@ -8756,16 +8756,16 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_15:
         switch (sel) {
-        case 0:
+        case CP0_REG15__PRID:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PRid));
             register_name = "PRid";
             break;
-        case 1:
+        case CP0_REG15__EBASE:
             check_insn(ctx, ISA_MIPS32R2);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
             register_name = "EBase";
             break;
-        case 3:
+        case CP0_REG15__CMGCRBASE:
             check_insn(ctx, ISA_MIPS32R2);
             CP0_CHECK(ctx->cmgcr);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_CMGCRBase));
@@ -9482,11 +9482,11 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_15:
         switch (sel) {
-        case 0:
+        case CP0_REG15__PRID:
             /* ignored */
             register_name = "PRid";
             break;
-        case 1:
+        case CP0_REG15__EBASE:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_ebase(cpu_env, arg);
             register_name = "EBase";
-- 
2.7.4


