Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0F9238B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:35:17 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgsW-0001iF-6U
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTy-0002Nr-Fc
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTw-0002sc-EE
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:53 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59121 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTw-0002j0-2r
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:52 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 21A321A208C;
 Mon, 19 Aug 2019 14:08:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2F79D1A2136;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:08:12 +0200
Message-Id: <1566216496-17375-34-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 33/37] target/mips: Clean up handling of CP0
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
Cc: arikalo@wavecomp.com, philmd@redhat.com, amarkovic@wavecomp.com
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
index 64dddd0..ef40552 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -411,7 +411,7 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG25__PERFCTL3        6
 #define CP0_REG25__PERFCNT3        7
 /* CP0 Register 26 */
-#define CP0_REG00__ERRCTL          0
+#define CP0_REG26__ERRCTL          0
 /* CP0 Register 27 */
 #define CP0_REG27__CACHERR         0
 /* CP0 Register 28 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index a3a9d34..9025a50 100644
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


