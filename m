Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C987AB6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 14:59:45 +0200 (CEST)
Received: from localhost ([::1]:59183 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw4Ui-0007iU-P9
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 08:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53013)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hw4K3-0002Gb-9M
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 08:48:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hw4Jz-0001F7-MD
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 08:48:42 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52588 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hw4Jz-00019U-7N
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 08:48:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B30E81A21AF;
 Fri,  9 Aug 2019 14:48:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 969AE1A20C6;
 Fri,  9 Aug 2019 14:48:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri,  9 Aug 2019 14:46:50 +0200
Message-Id: <1565354819-1495-18-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565354819-1495-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1565354819-1495-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v7 17/26] target/mips: Clean up
 handling of CP0 register 1
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

Clean up handling of CP0 register 1.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  8 +++++++
 target/mips/translate.c | 64 ++++++++++++++++++++++++-------------------------
 2 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index e2f6844..597afa8 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -284,6 +284,14 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG00__MVPCONF1        3
 #define CP0_REG00__VPCONTROL       4
 /* CP0 Register 01 */
+#define CP0_REG01__RANDOM          0
+#define CP0_REG01__VPECONTROL      1
+#define CP0_REG01__VPECONF0        2
+#define CP0_REG01__VPECONF1        3
+#define CP0_REG01__YQMASK          4
+#define CP0_REG01__VPESCHEDULE     5
+#define CP0_REG01__VPESCHEFBACK    6
+#define CP0_REG01__VPEOPT          7
 /* CP0 Register 02 */
 #define CP0_REG02__ENTRYLO0        0
 /* CP0 Register 03 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 3cf4c53..dad32e9 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6883,42 +6883,42 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_01:
         switch (sel) {
-        case 0:
+        case CP0_REG01__RANDOM:
             CP0_CHECK(!(ctx->insn_flags & ISA_MIPS32R6));
             gen_helper_mfc0_random(arg, cpu_env);
             register_name = "Random";
             break;
-        case 1:
+        case CP0_REG01__VPECONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEControl));
             register_name = "VPEControl";
             break;
-        case 2:
+        case CP0_REG01__VPECONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEConf0));
             register_name = "VPEConf0";
             break;
-        case 3:
+        case CP0_REG01__VPECONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEConf1));
             register_name = "VPEConf1";
             break;
-        case 4:
+        case CP0_REG01__YQMASK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_YQMask));
             register_name = "YQMask";
             break;
-        case 5:
+        case CP0_REG01__VPESCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_VPESchedule));
             register_name = "VPESchedule";
             break;
-        case 6:
+        case CP0_REG01__VPESCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_VPEScheFBack));
             register_name = "VPEScheFBack";
             break;
-        case 7:
+        case CP0_REG01__VPEOPT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEOpt));
             register_name = "VPEOpt";
@@ -7651,43 +7651,43 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_01:
         switch (sel) {
-        case 0:
+        case CP0_REG01__RANDOM:
             /* ignored */
             register_name = "Random";
             break;
-        case 1:
+        case CP0_REG01__VPECONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpecontrol(cpu_env, arg);
             register_name = "VPEControl";
             break;
-        case 2:
+        case CP0_REG01__VPECONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpeconf0(cpu_env, arg);
             register_name = "VPEConf0";
             break;
-        case 3:
+        case CP0_REG01__VPECONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpeconf1(cpu_env, arg);
             register_name = "VPEConf1";
             break;
-        case 4:
+        case CP0_REG01__YQMASK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_yqmask(cpu_env, arg);
             register_name = "YQMask";
             break;
-        case 5:
+        case CP0_REG01__VPESCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             tcg_gen_st_tl(arg, cpu_env,
                           offsetof(CPUMIPSState, CP0_VPESchedule));
             register_name = "VPESchedule";
             break;
-        case 6:
+        case CP0_REG01__VPESCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             tcg_gen_st_tl(arg, cpu_env,
                           offsetof(CPUMIPSState, CP0_VPEScheFBack));
             register_name = "VPEScheFBack";
             break;
-        case 7:
+        case CP0_REG01__VPEOPT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpeopt(cpu_env, arg);
             register_name = "VPEOpt";
@@ -8403,42 +8403,42 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_01:
         switch (sel) {
-        case 0:
+        case CP0_REG01__RANDOM:
             CP0_CHECK(!(ctx->insn_flags & ISA_MIPS32R6));
             gen_helper_mfc0_random(arg, cpu_env);
             register_name = "Random";
             break;
-        case 1:
+        case CP0_REG01__VPECONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEControl));
             register_name = "VPEControl";
             break;
-        case 2:
+        case CP0_REG01__VPECONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEConf0));
             register_name = "VPEConf0";
             break;
-        case 3:
+        case CP0_REG01__VPECONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEConf1));
             register_name = "VPEConf1";
             break;
-        case 4:
+        case CP0_REG01__YQMASK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_YQMask));
             register_name = "YQMask";
             break;
-        case 5:
+        case CP0_REG01__VPESCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESchedule));
             register_name = "VPESchedule";
             break;
-        case 6:
+        case CP0_REG01__VPESCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPEScheFBack));
             register_name = "VPEScheFBack";
             break;
-        case 7:
+        case CP0_REG01__VPEOPT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPEOpt));
             register_name = "VPEOpt";
@@ -9125,41 +9125,41 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_01:
         switch (sel) {
-        case 0:
+        case CP0_REG01__RANDOM:
             /* ignored */
             register_name = "Random";
             break;
-        case 1:
+        case CP0_REG01__VPECONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpecontrol(cpu_env, arg);
             register_name = "VPEControl";
             break;
-        case 2:
+        case CP0_REG01__VPECONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpeconf0(cpu_env, arg);
             register_name = "VPEConf0";
             break;
-        case 3:
+        case CP0_REG01__VPECONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpeconf1(cpu_env, arg);
             register_name = "VPEConf1";
             break;
-        case 4:
+        case CP0_REG01__YQMASK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_yqmask(cpu_env, arg);
             register_name = "YQMask";
             break;
-        case 5:
+        case CP0_REG01__VPESCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESchedule));
             register_name = "VPESchedule";
             break;
-        case 6:
+        case CP0_REG01__VPESCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPEScheFBack));
             register_name = "VPEScheFBack";
             break;
-        case 7:
+        case CP0_REG01__VPEOPT:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_vpeopt(cpu_env, arg);
             register_name = "VPEOpt";
-- 
2.7.4


