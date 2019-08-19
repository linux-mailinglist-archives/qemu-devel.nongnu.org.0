Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417D92374
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:29:44 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgn8-0005xV-WA
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTq-0002CR-Gg
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTm-0002lb-Oc
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:46 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:58059 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTm-0002bl-8t
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id CA9B71A2128;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D6A211A21A3;
 Mon, 19 Aug 2019 14:08:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:08:05 +0200
Message-Id: <1566216496-17375-27-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 26/37] target/mips: Clean up handling of CP0
 register 12
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

Clean up handling of CP0 register 12.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  3 +++
 target/mips/translate.c | 32 ++++++++++++++++----------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5e08b78..d61b8c0 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -349,6 +349,9 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG12__STATUS          0
 #define CP0_REG12__INTCTL          1
 #define CP0_REG12__SRSCTL          2
+#define CP0_REG12__SRSMAP          3
+#define CP0_REG12__VIEW_IPL        4
+#define CP0_REG12__SRSMAP2         5
 #define CP0_REG12__GUESTCTL0       6
 #define CP0_REG12__GTOFFSET        7
 /* CP0 Register 13 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 07251a4..863bd39 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7224,21 +7224,21 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_12:
         switch (sel) {
-        case 0:
+        case CP0_REG12__STATUS:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Status));
             register_name = "Status";
             break;
-        case 1:
+        case CP0_REG12__INTCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_IntCtl));
             register_name = "IntCtl";
             break;
-        case 2:
+        case CP0_REG12__SRSCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSCtl));
             register_name = "SRSCtl";
             break;
-        case 3:
+        case CP0_REG12__SRSMAP:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             register_name = "SRSMap";
@@ -7944,7 +7944,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_12:
         switch (sel) {
-        case 0:
+        case CP0_REG12__STATUS:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_status(cpu_env, arg);
             /* DISAS_STOP isn't good enough here, hflags may have changed. */
@@ -7952,21 +7952,21 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Status";
             break;
-        case 1:
+        case CP0_REG12__INTCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_intctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "IntCtl";
             break;
-        case 2:
+        case CP0_REG12__SRSCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "SRSCtl";
             break;
-        case 3:
+        case CP0_REG12__SRSMAP:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             /* Stop translation as we may have switched the execution mode */
@@ -8711,21 +8711,21 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_12:
         switch (sel) {
-        case 0:
+        case CP0_REG12__STATUS:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Status));
             register_name = "Status";
             break;
-        case 1:
+        case CP0_REG12__INTCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_IntCtl));
             register_name = "IntCtl";
             break;
-        case 2:
+        case CP0_REG12__SRSCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSCtl));
             register_name = "SRSCtl";
             break;
-        case 3:
+        case CP0_REG12__SRSMAP:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             register_name = "SRSMap";
@@ -9419,7 +9419,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_12:
         switch (sel) {
-        case 0:
+        case CP0_REG12__STATUS:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_status(cpu_env, arg);
             /* DISAS_STOP isn't good enough here, hflags may have changed. */
@@ -9427,21 +9427,21 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Status";
             break;
-        case 1:
+        case CP0_REG12__INTCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_intctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "IntCtl";
             break;
-        case 2:
+        case CP0_REG12__SRSCTL:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "SRSCtl";
             break;
-        case 3:
+        case CP0_REG12__SRSMAP:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             /* Stop translation as we may have switched the execution mode */
-- 
2.7.4


