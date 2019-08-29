Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA1A15F1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:29:09 +0200 (CEST)
Received: from localhost ([::1]:47780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Hfu-00076d-UM
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3HcU-0005Kw-6x
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3HcR-0005Pj-19
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:34 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45363 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i3HcQ-0005Lc-Gi
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:30 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 233CE1A21B0;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F09CC1A21EC;
 Thu, 29 Aug 2019 12:25:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:24:57 +0200
Message-Id: <1567074313-22998-16-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 15/31] target/mips: Clean up handling of CP0
 register 14
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

Clean up handling of CP0 register 14.

Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1567009614-12438-16-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/cpu.h       | 1 +
 target/mips/translate.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 4fce05a..2a9c6d5 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -361,6 +361,7 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG13__NESTEDEXC       5
 /* CP0 Register 14 */
 #define CP0_REG14__EPC             0
+#define CP0_REG14__NESTEDEPC       2
 /* CP0 Register 15 */
 #define CP0_REG15__PRID            0
 #define CP0_REG15__EBASE           1
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 4da08e1..efedced 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7212,7 +7212,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_14:
         switch (sel) {
-        case 0:
+        case CP0_REG14__EPC:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "EPC";
@@ -7946,7 +7946,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_14:
         switch (sel) {
-        case 0:
+        case CP0_REG14__EPC:
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
             register_name = "EPC";
             break;
@@ -8687,7 +8687,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_14:
         switch (sel) {
-        case 0:
+        case CP0_REG14__EPC:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
             register_name = "EPC";
             break;
@@ -9409,7 +9409,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_14:
         switch (sel) {
-        case 0:
+        case CP0_REG14__EPC:
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
             register_name = "EPC";
             break;
-- 
2.7.4


