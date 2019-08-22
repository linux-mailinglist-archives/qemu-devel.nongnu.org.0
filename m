Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26999278
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:47:30 +0200 (CEST)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lYu-0007R5-Op
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP7-0004jo-RV
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP3-0007rh-Dj
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:21 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48183 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lOw-0007hq-Dt
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:12 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 76F391A1513;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4B8721A203D;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:30 +0200
Message-Id: <1566473750-17743-7-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 06/26] target/mips: Clean up handling of CP0
 register 7
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

Clean up handling of CP0 register 7.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index cdcc1cc..abbb924 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7130,7 +7130,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_07:
         switch (sel) {
-        case 0:
+        case CP0_REG07__HWRENA:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_HWREna));
             register_name = "HWREna";
@@ -7869,7 +7869,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_07:
         switch (sel) {
-        case 0:
+        case CP0_REG07__HWRENA:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_hwrena(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
@@ -8619,7 +8619,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_07:
         switch (sel) {
-        case 0:
+        case CP0_REG07__HWRENA:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_HWREna));
             register_name = "HWREna";
@@ -9340,7 +9340,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_07:
         switch (sel) {
-        case 0:
+        case CP0_REG07__HWRENA:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_hwrena(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
-- 
2.7.4


