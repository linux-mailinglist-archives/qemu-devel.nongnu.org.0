Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C8A076F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 18:34:28 +0200 (CEST)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i30tv-00044i-Bd
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 12:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30mo-0006tr-SQ
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30mm-0007oA-WC
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:06 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:55278 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i30mm-0007m5-H2
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 235A71A22A6;
 Wed, 28 Aug 2019 18:27:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D92CF1A22A1;
 Wed, 28 Aug 2019 18:26:59 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 18:26:31 +0200
Message-Id: <1567009614-12438-8-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 07/30] target/mips: Clean up handling of CP0
 register 6
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 6.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  6 ++++++
 target/mips/translate.c | 56 ++++++++++++++++++++++++-------------------------
 2 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 248f7df..74a760e 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -323,6 +323,12 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG05__PWSIZE          7
 /* CP0 Register 06 */
 #define CP0_REG06__WIRED           0
+#define CP0_REG06__SRSCONF0        1
+#define CP0_REG06__SRSCONF1        2
+#define CP0_REG06__SRSCONF2        3
+#define CP0_REG06__SRSCONF3        4
+#define CP0_REG06__SRSCONF4        5
+#define CP0_REG06__PWCTL           6
 /* CP0 Register 07 */
 #define CP0_REG07__HWRENA          0
 /* CP0 Register 08 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 4395345..451805f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7091,36 +7091,36 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_06:
         switch (sel) {
-        case 0:
+        case CP0_REG06__WIRED:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Wired));
             register_name = "Wired";
             break;
-        case 1:
+        case CP0_REG06__SRSCONF0:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf0));
             register_name = "SRSConf0";
             break;
-        case 2:
+        case CP0_REG06__SRSCONF1:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf1));
             register_name = "SRSConf1";
             break;
-        case 3:
+        case CP0_REG06__SRSCONF2:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf2));
             register_name = "SRSConf2";
             break;
-        case 4:
+        case CP0_REG06__SRSCONF3:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf3));
             register_name = "SRSConf3";
             break;
-        case 5:
+        case CP0_REG06__SRSCONF4:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf4));
             register_name = "SRSConf4";
             break;
-        case 6:
+        case CP0_REG06__PWCTL:
             check_pw(ctx);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PWCtl));
             register_name = "PWCtl";
@@ -7831,36 +7831,36 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_06:
         switch (sel) {
-        case 0:
+        case CP0_REG06__WIRED:
             gen_helper_mtc0_wired(cpu_env, arg);
             register_name = "Wired";
             break;
-        case 1:
+        case CP0_REG06__SRSCONF0:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf0(cpu_env, arg);
             register_name = "SRSConf0";
             break;
-        case 2:
+        case CP0_REG06__SRSCONF1:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf1(cpu_env, arg);
             register_name = "SRSConf1";
             break;
-        case 3:
+        case CP0_REG06__SRSCONF2:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf2(cpu_env, arg);
             register_name = "SRSConf2";
             break;
-        case 4:
+        case CP0_REG06__SRSCONF3:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf3(cpu_env, arg);
             register_name = "SRSConf3";
             break;
-        case 5:
+        case CP0_REG06__SRSCONF4:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf4(cpu_env, arg);
             register_name = "SRSConf4";
             break;
-        case 6:
+        case CP0_REG06__PWCTL:
             check_pw(ctx);
             gen_helper_mtc0_pwctl(cpu_env, arg);
             register_name = "PWCtl";
@@ -8582,36 +8582,36 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_06:
         switch (sel) {
-        case 0:
+        case CP0_REG06__WIRED:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Wired));
             register_name = "Wired";
             break;
-        case 1:
+        case CP0_REG06__SRSCONF0:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf0));
             register_name = "SRSConf0";
             break;
-        case 2:
+        case CP0_REG06__SRSCONF1:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf1));
             register_name = "SRSConf1";
             break;
-        case 3:
+        case CP0_REG06__SRSCONF2:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf2));
             register_name = "SRSConf2";
             break;
-        case 4:
+        case CP0_REG06__SRSCONF3:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf3));
             register_name = "SRSConf3";
             break;
-        case 5:
+        case CP0_REG06__SRSCONF4:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf4));
             register_name = "SRSConf4";
             break;
-        case 6:
+        case CP0_REG06__PWCTL:
             check_pw(ctx);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PWCtl));
             register_name = "PWCtl";
@@ -9304,36 +9304,36 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_06:
         switch (sel) {
-        case 0:
+        case CP0_REG06__WIRED:
             gen_helper_mtc0_wired(cpu_env, arg);
             register_name = "Wired";
             break;
-        case 1:
+        case CP0_REG06__SRSCONF0:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf0(cpu_env, arg);
             register_name = "SRSConf0";
             break;
-        case 2:
+        case CP0_REG06__SRSCONF1:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf1(cpu_env, arg);
             register_name = "SRSConf1";
             break;
-        case 3:
+        case CP0_REG06__SRSCONF2:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf2(cpu_env, arg);
             register_name = "SRSConf2";
             break;
-        case 4:
+        case CP0_REG06__SRSCONF3:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf3(cpu_env, arg);
             register_name = "SRSConf3";
             break;
-        case 5:
+        case CP0_REG06__SRSCONF4:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsconf4(cpu_env, arg);
             register_name = "SRSConf4";
             break;
-        case 6:
+        case CP0_REG06__PWCTL:
             check_pw(ctx);
             gen_helper_mtc0_pwctl(cpu_env, arg);
             register_name = "PWCtl";
-- 
2.7.4


