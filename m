Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E007992AE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:56:35 +0200 (CEST)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lhg-0002EA-No
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lPO-0005EK-2v
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lPK-00088A-2H
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:37 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:49969 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lPJ-0007rA-3R
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:33 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 4254B1A20C2;
 Thu, 22 Aug 2019 13:35:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 090071A20D6;
 Thu, 22 Aug 2019 13:35:59 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:45 +0200
Message-Id: <1566473750-17743-22-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 21/26] target/mips: Clean up handling of CP0
 register 26
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

Clean up handling of CP0 register 26.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       | 2 +-
 target/mips/translate.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index c14afcd..80c896b 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -419,7 +419,7 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG25__PERFCTL3        6
 #define CP0_REG25__PERFCNT3        7
 /* CP0 Register 26 */
-#define CP0_REG00__ERRCTL          0
+#define CP0_REG26__ERRCTL          0
 /* CP0 Register 27 */
 #define CP0_REG27__CACHERR         0
 /* CP0 Register 28 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 55d1d95..f7e33f6 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7503,7 +7503,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG26__ERRCTL:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_ErrCtl));
             register_name = "ErrCtl";
             break;
@@ -8264,7 +8264,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
        break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG26__ERRCTL:
             gen_helper_mtc0_errctl(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "ErrCtl";
@@ -9003,7 +9003,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG26__ERRCTL:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_ErrCtl));
             register_name = "ErrCtl";
             break;
@@ -9746,7 +9746,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG26__ERRCTL:
             gen_helper_mtc0_errctl(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "ErrCtl";
-- 
2.7.4


