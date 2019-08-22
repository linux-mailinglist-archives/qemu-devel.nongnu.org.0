Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BAF99289
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:49:20 +0200 (CEST)
Received: from localhost ([::1]:41378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lag-000151-JR
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP7-0004j5-IA
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lOr-0007hU-KZ
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:16 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:36801 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lOq-0006xW-Vo
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:05 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 644381A2059;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2F8D41A204B;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:27 +0200
Message-Id: <1566473750-17743-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 03/26] target/mips: Clean up handling of CP0
 register 2
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

Clean up handling of CP0 register 2.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  7 ++++++
 target/mips/translate.c | 64 ++++++++++++++++++++++++-------------------------
 2 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 597afa8..eebdc9f 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -294,6 +294,13 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG01__VPEOPT          7
 /* CP0 Register 02 */
 #define CP0_REG02__ENTRYLO0        0
+#define CP0_REG02__TCSTATUS        1
+#define CP0_REG02__TCBIND          2
+#define CP0_REG02__TCRESTART       3
+#define CP0_REG02__TCHALT          4
+#define CP0_REG02__TCCONTEXT       5
+#define CP0_REG02__TCSCHEDULE      6
+#define CP0_REG02__TCSCHEFBACK     7
 /* CP0 Register 03 */
 #define CP0_REG03__ENTRYLO1        0
 #define CP0_REG03__GLOBALNUM       1
diff --git a/target/mips/translate.c b/target/mips/translate.c
index e350545..6e65312 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6929,7 +6929,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_02:
         switch (sel) {
-        case 0:
+        case CP0_REG02__ENTRYLO0:
             {
                 TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_ld_i64(tmp, cpu_env,
@@ -6946,37 +6946,37 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             }
             register_name = "EntryLo0";
             break;
-        case 1:
+        case CP0_REG02__TCSTATUS:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tcstatus(arg, cpu_env);
             register_name = "TCStatus";
             break;
-        case 2:
+        case CP0_REG02__TCBIND:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tcbind(arg, cpu_env);
             register_name = "TCBind";
             break;
-        case 3:
+        case CP0_REG02__TCRESTART:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tcrestart(arg, cpu_env);
             register_name = "TCRestart";
             break;
-        case 4:
+        case CP0_REG02__TCHALT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tchalt(arg, cpu_env);
             register_name = "TCHalt";
             break;
-        case 5:
+        case CP0_REG02__TCCONTEXT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tccontext(arg, cpu_env);
             register_name = "TCContext";
             break;
-        case 6:
+        case CP0_REG02__TCSCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tcschedule(arg, cpu_env);
             register_name = "TCSchedule";
             break;
-        case 7:
+        case CP0_REG02__TCSCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tcschefback(arg, cpu_env);
             register_name = "TCScheFBack";
@@ -7698,41 +7698,41 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_02:
         switch (sel) {
-        case 0:
+        case CP0_REG02__ENTRYLO0:
             gen_helper_mtc0_entrylo0(cpu_env, arg);
             register_name = "EntryLo0";
             break;
-        case 1:
+        case CP0_REG02__TCSTATUS:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcstatus(cpu_env, arg);
             register_name = "TCStatus";
             break;
-        case 2:
+        case CP0_REG02__TCBIND:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcbind(cpu_env, arg);
             register_name = "TCBind";
             break;
-        case 3:
+        case CP0_REG02__TCRESTART:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcrestart(cpu_env, arg);
             register_name = "TCRestart";
             break;
-        case 4:
+        case CP0_REG02__TCHALT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tchalt(cpu_env, arg);
             register_name = "TCHalt";
             break;
-        case 5:
+        case CP0_REG02__TCCONTEXT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tccontext(cpu_env, arg);
             register_name = "TCContext";
             break;
-        case 6:
+        case CP0_REG02__TCSCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcschedule(cpu_env, arg);
             register_name = "TCSchedule";
             break;
-        case 7:
+        case CP0_REG02__TCSCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcschefback(cpu_env, arg);
             register_name = "TCScheFBack";
@@ -8449,41 +8449,41 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_02:
         switch (sel) {
-        case 0:
+        case CP0_REG02__ENTRYLO0:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EntryLo0));
             register_name = "EntryLo0";
             break;
-        case 1:
+        case CP0_REG02__TCSTATUS:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tcstatus(arg, cpu_env);
             register_name = "TCStatus";
             break;
-        case 2:
+        case CP0_REG02__TCBIND:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_tcbind(arg, cpu_env);
             register_name = "TCBind";
             break;
-        case 3:
+        case CP0_REG02__TCRESTART:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_dmfc0_tcrestart(arg, cpu_env);
             register_name = "TCRestart";
             break;
-        case 4:
+        case CP0_REG02__TCHALT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_dmfc0_tchalt(arg, cpu_env);
             register_name = "TCHalt";
             break;
-        case 5:
+        case CP0_REG02__TCCONTEXT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_dmfc0_tccontext(arg, cpu_env);
             register_name = "TCContext";
             break;
-        case 6:
+        case CP0_REG02__TCSCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_dmfc0_tcschedule(arg, cpu_env);
             register_name = "TCSchedule";
             break;
-        case 7:
+        case CP0_REG02__TCSCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_dmfc0_tcschefback(arg, cpu_env);
             register_name = "TCScheFBack";
@@ -9170,41 +9170,41 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_02:
         switch (sel) {
-        case 0:
+        case CP0_REG02__ENTRYLO0:
             gen_helper_dmtc0_entrylo0(cpu_env, arg);
             register_name = "EntryLo0";
             break;
-        case 1:
+        case CP0_REG02__TCSTATUS:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcstatus(cpu_env, arg);
             register_name = "TCStatus";
             break;
-        case 2:
+        case CP0_REG02__TCBIND:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcbind(cpu_env, arg);
             register_name = "TCBind";
             break;
-        case 3:
+        case CP0_REG02__TCRESTART:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcrestart(cpu_env, arg);
             register_name = "TCRestart";
             break;
-        case 4:
+        case CP0_REG02__TCHALT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tchalt(cpu_env, arg);
             register_name = "TCHalt";
             break;
-        case 5:
+        case CP0_REG02__TCCONTEXT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tccontext(cpu_env, arg);
             register_name = "TCContext";
             break;
-        case 6:
+        case CP0_REG02__TCSCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcschedule(cpu_env, arg);
             register_name = "TCSchedule";
             break;
-        case 7:
+        case CP0_REG02__TCSCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_tcschefback(cpu_env, arg);
             register_name = "TCScheFBack";
-- 
2.7.4


