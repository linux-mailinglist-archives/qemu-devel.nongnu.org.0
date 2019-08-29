Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026EAA15F2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:29:14 +0200 (CEST)
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Hg0-0007FD-SN
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3HcR-0005HK-Tv
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3HcP-0005LA-CW
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:31 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45214 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i3HcO-0005FY-QR
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 752561A2196;
 Thu, 29 Aug 2019 12:25:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 536921A20FA;
 Thu, 29 Aug 2019 12:25:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:24:43 +0200
Message-Id: <1567074313-22998-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 01/31] target/mips: Clean up handling of CP0
 register 0
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

Clean up handling of CP0 register 0.

Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1567009614-12438-2-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/cpu.h       |  3 +++
 target/mips/translate.c | 40 ++++++++++++++++++++--------------------
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 1fd4a18..42d0e44 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -277,6 +277,9 @@ typedef struct mips_def_t mips_def_t;
 
 /* CP0 Register 00 */
 #define CP0_REG00__INDEX           0
+#define CP0_REG00__MVPCONTROL      1
+#define CP0_REG00__MVPCONF0        2
+#define CP0_REG00__MVPCONF1        3
 #define CP0_REG00__VPCONTROL       4
 /* CP0 Register 01 */
 /* CP0 Register 02 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8ebde6f..c3fcfb4 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6813,26 +6813,26 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     switch (reg) {
     case CP0_REGISTER_00:
         switch (sel) {
-        case 0:
+        case CP0_REG00__INDEX:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Index));
             register_name = "Index";
             break;
-        case 1:
+        case CP0_REG00__MVPCONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_mvpcontrol(arg, cpu_env);
             register_name = "MVPControl";
             break;
-        case 2:
+        case CP0_REG00__MVPCONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_mvpconf0(arg, cpu_env);
             register_name = "MVPConf0";
             break;
-        case 3:
+        case CP0_REG00__MVPCONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_mvpconf1(arg, cpu_env);
             register_name = "MVPConf1";
             break;
-        case 4:
+        case CP0_REG00__VPCONTROL:
             CP0_CHECK(ctx->vp);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPControl));
             register_name = "VPControl";
@@ -7573,26 +7573,26 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     switch (reg) {
     case CP0_REGISTER_00:
         switch (sel) {
-        case 0:
+        case CP0_REG00__INDEX:
             gen_helper_mtc0_index(cpu_env, arg);
             register_name = "Index";
             break;
-        case 1:
+        case CP0_REG00__MVPCONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_mvpcontrol(cpu_env, arg);
             register_name = "MVPControl";
             break;
-        case 2:
+        case CP0_REG00__MVPCONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             /* ignored */
             register_name = "MVPConf0";
             break;
-        case 3:
+        case CP0_REG00__MVPCONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             /* ignored */
             register_name = "MVPConf1";
             break;
-        case 4:
+        case CP0_REG00__VPCONTROL:
             CP0_CHECK(ctx->vp);
             /* ignored */
             register_name = "VPControl";
@@ -8319,26 +8319,26 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     switch (reg) {
     case CP0_REGISTER_00:
         switch (sel) {
-        case 0:
+        case CP0_REG00__INDEX:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Index));
             register_name = "Index";
             break;
-        case 1:
+        case CP0_REG00__MVPCONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_mvpcontrol(arg, cpu_env);
             register_name = "MVPControl";
             break;
-        case 2:
+        case CP0_REG00__MVPCONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_mvpconf0(arg, cpu_env);
             register_name = "MVPConf0";
             break;
-        case 3:
+        case CP0_REG00__MVPCONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mfc0_mvpconf1(arg, cpu_env);
             register_name = "MVPConf1";
             break;
-        case 4:
+        case CP0_REG00__VPCONTROL:
             CP0_CHECK(ctx->vp);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPControl));
             register_name = "VPControl";
@@ -9033,26 +9033,26 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     switch (reg) {
     case CP0_REGISTER_00:
         switch (sel) {
-        case 0:
+        case CP0_REG00__INDEX:
             gen_helper_mtc0_index(cpu_env, arg);
             register_name = "Index";
             break;
-        case 1:
+        case CP0_REG00__MVPCONTROL:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             gen_helper_mtc0_mvpcontrol(cpu_env, arg);
             register_name = "MVPControl";
             break;
-        case 2:
+        case CP0_REG00__MVPCONF0:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             /* ignored */
             register_name = "MVPConf0";
             break;
-        case 3:
+        case CP0_REG00__MVPCONF1:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
             /* ignored */
             register_name = "MVPConf1";
             break;
-        case 4:
+        case CP0_REG00__VPCONTROL:
             CP0_CHECK(ctx->vp);
             /* ignored */
             register_name = "VPControl";
-- 
2.7.4


