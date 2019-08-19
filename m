Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B606B923AD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:42:27 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgzR-00010u-Ms
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTq-0002By-54
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTm-0002l8-LP
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:45 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:58067 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTm-0002bs-6l
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E463F1A2230;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id EBEEB1A20A0;
 Mon, 19 Aug 2019 14:08:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:08:07 +0200
Message-Id: <1566216496-17375-29-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 28/37] target/mips: Clean up handling of CP0
 register 16
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

Clean up handling of CP0 register 16.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  3 ++-
 target/mips/translate.c | 60 ++++++++++++++++++++++++-------------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 3a8c560..625d364 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -371,7 +371,8 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG16__CONFIG3         3
 #define CP0_REG16__CONFIG4         4
 #define CP0_REG16__CONFIG5         5
-#define CP0_REG00__CONFIG7         7
+#define CP0_REG16__CONFIG6         6
+#define CP0_REG16__CONFIG7         7
 /* CP0 Register 17 */
 #define CP0_REG17__LLADDR          0
 #define CP0_REG17__MAAR            1
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9d3996d..729b84d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7293,36 +7293,36 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_16:
         switch (sel) {
-        case 0:
+        case CP0_REG16__CONFIG:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config0));
             register_name = "Config";
             break;
-        case 1:
+        case CP0_REG16__CONFIG1:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config1));
             register_name = "Config1";
             break;
-        case 2:
+        case CP0_REG16__CONFIG2:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config2));
             register_name = "Config2";
             break;
-        case 3:
+        case CP0_REG16__CONFIG3:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config3));
             register_name = "Config3";
             break;
-        case 4:
+        case CP0_REG16__CONFIG4:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config4));
             register_name = "Config4";
             break;
-        case 5:
+        case CP0_REG16__CONFIG5:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config5));
             register_name = "Config5";
             break;
         /* 6,7 are implementation dependent */
-        case 6:
+        case CP0_REG16__CONFIG6:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config6));
             register_name = "Config6";
             break;
-        case 7:
+        case CP0_REG16__CONFIG7:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config7));
             register_name = "Config7";
             break;
@@ -8022,45 +8022,45 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_16:
         switch (sel) {
-        case 0:
+        case CP0_REG16__CONFIG:
             gen_helper_mtc0_config0(cpu_env, arg);
             register_name = "Config";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 1:
+        case CP0_REG16__CONFIG1:
             /* ignored, read only */
             register_name = "Config1";
             break;
-        case 2:
+        case CP0_REG16__CONFIG2:
             gen_helper_mtc0_config2(cpu_env, arg);
             register_name = "Config2";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 3:
+        case CP0_REG16__CONFIG3:
             gen_helper_mtc0_config3(cpu_env, arg);
             register_name = "Config3";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 4:
+        case CP0_REG16__CONFIG4:
             gen_helper_mtc0_config4(cpu_env, arg);
             register_name = "Config4";
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 5:
+        case CP0_REG16__CONFIG5:
             gen_helper_mtc0_config5(cpu_env, arg);
             register_name = "Config5";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             break;
         /* 6,7 are implementation dependent */
-        case 6:
+        case CP0_REG16__CONFIG6:
             /* ignored */
             register_name = "Config6";
             break;
-        case 7:
+        case CP0_REG16__CONFIG7:
             /* ignored */
             register_name = "Config7";
             break;
@@ -8777,36 +8777,36 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_16:
         switch (sel) {
-        case 0:
+        case CP0_REG16__CONFIG:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config0));
             register_name = "Config";
             break;
-        case 1:
+        case CP0_REG16__CONFIG1:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config1));
             register_name = "Config1";
             break;
-        case 2:
+        case CP0_REG16__CONFIG2:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config2));
             register_name = "Config2";
             break;
-        case 3:
+        case CP0_REG16__CONFIG3:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config3));
             register_name = "Config3";
             break;
-        case 4:
+        case CP0_REG16__CONFIG4:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config4));
             register_name = "Config4";
             break;
-        case 5:
+        case CP0_REG16__CONFIG5:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config5));
             register_name = "Config5";
             break;
        /* 6,7 are implementation dependent */
-        case 6:
+        case CP0_REG16__CONFIG6:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config6));
             register_name = "Config6";
             break;
-        case 7:
+        case CP0_REG16__CONFIG7:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config7));
             register_name = "Config7";
             break;
@@ -9497,33 +9497,33 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_16:
         switch (sel) {
-        case 0:
+        case CP0_REG16__CONFIG:
             gen_helper_mtc0_config0(cpu_env, arg);
             register_name = "Config";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 1:
+        case CP0_REG16__CONFIG1:
             /* ignored, read only */
             register_name = "Config1";
             break;
-        case 2:
+        case CP0_REG16__CONFIG2:
             gen_helper_mtc0_config2(cpu_env, arg);
             register_name = "Config2";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 3:
+        case CP0_REG16__CONFIG3:
             gen_helper_mtc0_config3(cpu_env, arg);
             register_name = "Config3";
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             break;
-        case 4:
+        case CP0_REG16__CONFIG4:
             /* currently ignored */
             register_name = "Config4";
             break;
-        case 5:
+        case CP0_REG16__CONFIG5:
             gen_helper_mtc0_config5(cpu_env, arg);
             register_name = "Config5";
             /* Stop translation as we may have switched the execution mode */
-- 
2.7.4


