Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5618B992D9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 14:07:04 +0200 (CEST)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lrr-0007DW-DL
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 08:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lPO-0005E3-27
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lPI-00086Y-Tq
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:37 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48297 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lPI-0007lJ-84
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:32 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 1FF091A20AB;
 Thu, 22 Aug 2019 13:35:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id DA90F1A20A9;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:42 +0200
Message-Id: <1566473750-17743-19-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 18/26] target/mips: Clean up handling of CP0
 register 23
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

Clean up handling of CP0 register 23.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |   6 +++
 target/mips/translate.c | 126 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 89 insertions(+), 43 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 811986b..c14afcd 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -401,6 +401,12 @@ typedef struct mips_def_t mips_def_t;
 /* CP0 Register 22 */
 /* CP0 Register 23 */
 #define CP0_REG23__DEBUG           0
+#define CP0_REG23__TRACECONTROL    1
+#define CP0_REG23__TRACECONTROL2   2
+#define CP0_REG23__USERTRACEDATA1  3
+#define CP0_REG23__TRACEIBPC       4
+#define CP0_REG23__TRACEDBPC       5
+#define CP0_REG23__DEBUG2          6
 /* CP0 Register 24 */
 #define CP0_REG24__DEPC            0
 /* CP0 Register 25 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 175f6dc..4272948 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7418,25 +7418,34 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_23:
         switch (sel) {
-        case 0:
+        case CP0_REG23__DEBUG:
             gen_helper_mfc0_debug(arg, cpu_env); /* EJTAG support */
             register_name = "Debug";
             break;
-        case 1:
-//            gen_helper_mfc0_tracecontrol(arg); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL:
+            /* PDtrace support */
+            /* gen_helper_mfc0_tracecontrol(arg);  */
             register_name = "TraceControl";
             goto cp0_unimplemented;
-        case 2:
-//            gen_helper_mfc0_tracecontrol2(arg); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL2:
+            /* PDtrace support */
+            /* gen_helper_mfc0_tracecontrol2(arg); */
             register_name = "TraceControl2";
             goto cp0_unimplemented;
-        case 3:
-//            gen_helper_mfc0_usertracedata(arg); /* PDtrace support */
-            register_name = "UserTraceData";
+        case CP0_REG23__USERTRACEDATA1:
+            /* PDtrace support */
+            /* gen_helper_mfc0_usertracedata1(arg);*/
+            register_name = "UserTraceData1";
             goto cp0_unimplemented;
-        case 4:
-//            gen_helper_mfc0_tracebpc(arg); /* PDtrace support */
-            register_name = "TraceBPC";
+        case CP0_REG23__TRACEIBPC:
+            /* PDtrace support */
+            /* gen_helper_mfc0_traceibpc(arg);     */
+            register_name = "TraceIBPC";
+            goto cp0_unimplemented;
+        case CP0_REG23__TRACEDBPC:
+            /* PDtrace support */
+            /* gen_helper_mfc0_tracedbpc(arg);     */
+            register_name = "TraceDBPC";
             goto cp0_unimplemented;
         default:
             goto cp0_unimplemented;
@@ -8156,38 +8165,49 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_23:
         switch (sel) {
-        case 0:
+        case CP0_REG23__DEBUG:
             gen_helper_mtc0_debug(cpu_env, arg); /* EJTAG support */
             /* DISAS_STOP isn't good enough here, hflags may have changed. */
             gen_save_pc(ctx->base.pc_next + 4);
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Debug";
             break;
-        case 1:
-//            gen_helper_mtc0_tracecontrol(cpu_env, arg); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL:
+            /* PDtrace support */
+            /* gen_helper_mtc0_tracecontrol(cpu_env, arg);  */
             register_name = "TraceControl";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             goto cp0_unimplemented;
-        case 2:
-//            gen_helper_mtc0_tracecontrol2(cpu_env, arg); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL2:
+            /* PDtrace support */
+            /* gen_helper_mtc0_tracecontrol2(cpu_env, arg); */
             register_name = "TraceControl2";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             goto cp0_unimplemented;
-        case 3:
+        case CP0_REG23__USERTRACEDATA1:
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
-//            gen_helper_mtc0_usertracedata(cpu_env, arg); /* PDtrace support */
+            /* PDtrace support */
+            /* gen_helper_mtc0_usertracedata1(cpu_env, arg);*/
             register_name = "UserTraceData";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             goto cp0_unimplemented;
-        case 4:
-//            gen_helper_mtc0_tracebpc(cpu_env, arg); /* PDtrace support */
+        case CP0_REG23__TRACEIBPC:
+            /* PDtrace support */
+            /* gen_helper_mtc0_traceibpc(cpu_env, arg);     */
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
-            register_name = "TraceBPC";
+            register_name = "TraceIBPC";
+            goto cp0_unimplemented;
+        case CP0_REG23__TRACEDBPC:
+            /* PDtrace support */
+            /* gen_helper_mtc0_tracedbpc(cpu_env, arg);     */
+            /* Stop translation as we may have switched the execution mode */
+            ctx->base.is_jmp = DISAS_STOP;
+            register_name = "TraceDBPC";
             goto cp0_unimplemented;
         default:
             goto cp0_unimplemented;
@@ -8899,25 +8919,34 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_23:
         switch (sel) {
-        case 0:
+        case CP0_REG23__DEBUG:
             gen_helper_mfc0_debug(arg, cpu_env); /* EJTAG support */
             register_name = "Debug";
             break;
-        case 1:
-//            gen_helper_dmfc0_tracecontrol(arg, cpu_env); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL:
+            /* PDtrace support */
+            /* gen_helper_dmfc0_tracecontrol(arg, cpu_env);  */
             register_name = "TraceControl";
             goto cp0_unimplemented;
-        case 2:
-//            gen_helper_dmfc0_tracecontrol2(arg, cpu_env); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL2:
+            /* PDtrace support */
+            /* gen_helper_dmfc0_tracecontrol2(arg, cpu_env); */
             register_name = "TraceControl2";
             goto cp0_unimplemented;
-        case 3:
-//            gen_helper_dmfc0_usertracedata(arg, cpu_env); /* PDtrace support */
-            register_name = "UserTraceData";
+        case CP0_REG23__USERTRACEDATA1:
+            /* PDtrace support */
+            /* gen_helper_dmfc0_usertracedata1(arg, cpu_env);*/
+            register_name = "UserTraceData1";
             goto cp0_unimplemented;
-        case 4:
-//            gen_helper_dmfc0_tracebpc(arg, cpu_env); /* PDtrace support */
-            register_name = "TraceBPC";
+        case CP0_REG23__TRACEIBPC:
+            /* PDtrace support */
+            /* gen_helper_dmfc0_traceibpc(arg, cpu_env);     */
+            register_name = "TraceIBPC";
+            goto cp0_unimplemented;
+        case CP0_REG23__TRACEDBPC:
+            /* PDtrace support */
+            /* gen_helper_dmfc0_tracedbpc(arg, cpu_env);     */
+            register_name = "TraceDBPC";
             goto cp0_unimplemented;
         default:
             goto cp0_unimplemented;
@@ -9620,36 +9649,47 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_23:
         switch (sel) {
-        case 0:
+        case CP0_REG23__DEBUG:
             gen_helper_mtc0_debug(cpu_env, arg); /* EJTAG support */
             /* DISAS_STOP isn't good enough here, hflags may have changed. */
             gen_save_pc(ctx->base.pc_next + 4);
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Debug";
             break;
-        case 1:
-//            gen_helper_mtc0_tracecontrol(cpu_env, arg); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL:
+            /* PDtrace support */
+            /* gen_helper_mtc0_tracecontrol(cpu_env, arg);  */
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "TraceControl";
             goto cp0_unimplemented;
-        case 2:
-//            gen_helper_mtc0_tracecontrol2(cpu_env, arg); /* PDtrace support */
+        case CP0_REG23__TRACECONTROL2:
+            /* PDtrace support */
+            /* gen_helper_mtc0_tracecontrol2(cpu_env, arg); */
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "TraceControl2";
             goto cp0_unimplemented;
-        case 3:
-//            gen_helper_mtc0_usertracedata(cpu_env, arg); /* PDtrace support */
+        case CP0_REG23__USERTRACEDATA1:
+            /* PDtrace support */
+            /* gen_helper_mtc0_usertracedata1(cpu_env, arg);*/
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
-            register_name = "UserTraceData";
+            register_name = "UserTraceData1";
             goto cp0_unimplemented;
-        case 4:
-//            gen_helper_mtc0_tracebpc(cpu_env, arg); /* PDtrace support */
+        case CP0_REG23__TRACEIBPC:
+            /* PDtrace support */
+            /* gen_helper_mtc0_traceibpc(cpu_env, arg);     */
+            /* Stop translation as we may have switched the execution mode */
+            ctx->base.is_jmp = DISAS_STOP;
+            register_name = "TraceIBPC";
+            goto cp0_unimplemented;
+        case CP0_REG23__TRACEDBPC:
+            /* PDtrace support */
+            /* gen_helper_mtc0_tracedbpc(cpu_env, arg);     */
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
-            register_name = "TraceBPC";
+            register_name = "TraceDBPC";
             goto cp0_unimplemented;
         default:
             goto cp0_unimplemented;
-- 
2.7.4


