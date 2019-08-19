Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAB79235A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:22:21 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgg0-0007Ba-Ek
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTo-00029b-Ia
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTm-0002kF-D2
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:44 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:58025 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTl-0002bJ-VJ
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 4B8AB1A2221;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id A45231A2070;
 Mon, 19 Aug 2019 14:08:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:07:59 +0200
Message-Id: <1566216496-17375-21-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 20/37] target/mips: Clean up handling of CP0
 register 5
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

Clean up handling of CP0 register 5.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  6 +++++
 target/mips/translate.c | 64 ++++++++++++++++++++++++-------------------------
 2 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index eebdc9f..2ab388b 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -312,6 +312,12 @@ typedef struct mips_def_t mips_def_t;
 /* CP0 Register 05 */
 #define CP0_REG05__PAGEMASK        0
 #define CP0_REG05__PAGEGRAIN       1
+#define CP0_REG05__SEGCTL0         2
+#define CP0_REG05__SEGCTL1         3
+#define CP0_REG05__SEGCTL2         4
+#define CP0_REG05__PWBASE          5
+#define CP0_REG05__PWFIELD         6
+#define CP0_REG05__PWSIZE          7
 /* CP0 Register 06 */
 #define CP0_REG06__WIRED           0
 /* CP0 Register 07 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6e65312..9d1e315 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7042,44 +7042,44 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_05:
         switch (sel) {
-        case 0:
+        case CP0_REG05__PAGEMASK:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PageMask));
             register_name = "PageMask";
             break;
-        case 1:
+        case CP0_REG05__PAGEGRAIN:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PageGrain));
             register_name = "PageGrain";
             break;
-        case 2:
+        case CP0_REG05__SEGCTL0:
             CP0_CHECK(ctx->sc);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl0));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "SegCtl0";
             break;
-        case 3:
+        case CP0_REG05__SEGCTL1:
             CP0_CHECK(ctx->sc);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl1));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "SegCtl1";
             break;
-        case 4:
+        case CP0_REG05__SEGCTL2:
             CP0_CHECK(ctx->sc);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl2));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "SegCtl2";
             break;
-        case 5:
+        case CP0_REG05__PWBASE:
             check_pw(ctx);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PWBase));
             register_name = "PWBase";
             break;
-        case 6:
+        case CP0_REG05__PWFIELD:
             check_pw(ctx);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PWField));
             register_name = "PWField";
             break;
-        case 7:
+        case CP0_REG05__PWSIZE:
             check_pw(ctx);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PWSize));
             register_name = "PWSize";
@@ -7783,42 +7783,42 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_05:
         switch (sel) {
-        case 0:
+        case CP0_REG05__PAGEMASK:
             gen_helper_mtc0_pagemask(cpu_env, arg);
             register_name = "PageMask";
             break;
-        case 1:
+        case CP0_REG05__PAGEGRAIN:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_pagegrain(cpu_env, arg);
             register_name = "PageGrain";
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 2:
+        case CP0_REG05__SEGCTL0:
             CP0_CHECK(ctx->sc);
             gen_helper_mtc0_segctl0(cpu_env, arg);
             register_name = "SegCtl0";
             break;
-        case 3:
+        case CP0_REG05__SEGCTL1:
             CP0_CHECK(ctx->sc);
             gen_helper_mtc0_segctl1(cpu_env, arg);
             register_name = "SegCtl1";
             break;
-        case 4:
+        case CP0_REG05__SEGCTL2:
             CP0_CHECK(ctx->sc);
             gen_helper_mtc0_segctl2(cpu_env, arg);
             register_name = "SegCtl2";
             break;
-        case 5:
+        case CP0_REG05__PWBASE:
             check_pw(ctx);
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_PWBase));
             register_name = "PWBase";
             break;
-        case 6:
+        case CP0_REG05__PWFIELD:
             check_pw(ctx);
             gen_helper_mtc0_pwfield(cpu_env, arg);
             register_name = "PWField";
             break;
-        case 7:
+        case CP0_REG05__PWSIZE:
             check_pw(ctx);
             gen_helper_mtc0_pwsize(cpu_env, arg);
             register_name = "PWSize";
@@ -8534,41 +8534,41 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_05:
         switch (sel) {
-        case 0:
+        case CP0_REG05__PAGEMASK:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PageMask));
             register_name = "PageMask";
             break;
-        case 1:
+        case CP0_REG05__PAGEGRAIN:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PageGrain));
             register_name = "PageGrain";
             break;
-        case 2:
+        case CP0_REG05__SEGCTL0:
             CP0_CHECK(ctx->sc);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl0));
             register_name = "SegCtl0";
             break;
-        case 3:
+        case CP0_REG05__SEGCTL1:
             CP0_CHECK(ctx->sc);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl1));
             register_name = "SegCtl1";
             break;
-        case 4:
+        case CP0_REG05__SEGCTL2:
             CP0_CHECK(ctx->sc);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl2));
             register_name = "SegCtl2";
             break;
-        case 5:
+        case CP0_REG05__PWBASE:
             check_pw(ctx);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_PWBase));
             register_name = "PWBase";
             break;
-        case 6:
+        case CP0_REG05__PWFIELD:
             check_pw(ctx);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_PWField));
             register_name = "PWField";
             break;
-        case 7:
+        case CP0_REG05__PWSIZE:
             check_pw(ctx);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_PWSize));
             register_name = "PWSize";
@@ -9255,41 +9255,41 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_05:
         switch (sel) {
-        case 0:
+        case CP0_REG05__PAGEMASK:
             gen_helper_mtc0_pagemask(cpu_env, arg);
             register_name = "PageMask";
             break;
-        case 1:
+        case CP0_REG05__PAGEGRAIN:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_pagegrain(cpu_env, arg);
             register_name = "PageGrain";
             break;
-        case 2:
+        case CP0_REG05__SEGCTL0:
             CP0_CHECK(ctx->sc);
             gen_helper_mtc0_segctl0(cpu_env, arg);
             register_name = "SegCtl0";
             break;
-        case 3:
+        case CP0_REG05__SEGCTL1:
             CP0_CHECK(ctx->sc);
             gen_helper_mtc0_segctl1(cpu_env, arg);
             register_name = "SegCtl1";
             break;
-        case 4:
+        case CP0_REG05__SEGCTL2:
             CP0_CHECK(ctx->sc);
             gen_helper_mtc0_segctl2(cpu_env, arg);
             register_name = "SegCtl2";
             break;
-        case 5:
+        case CP0_REG05__PWBASE:
             check_pw(ctx);
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_PWBase));
             register_name = "PWBase";
             break;
-        case 6:
+        case CP0_REG05__PWFIELD:
             check_pw(ctx);
             gen_helper_mtc0_pwfield(cpu_env, arg);
             register_name = "PWField";
             break;
-        case 7:
+        case CP0_REG05__PWSIZE:
             check_pw(ctx);
             gen_helper_mtc0_pwsize(cpu_env, arg);
             register_name = "PWSize";
-- 
2.7.4


