Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0760816CC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 12:18:22 +0200 (CEST)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hua4M-0002M8-3o
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 06:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1huZx8-0005vh-HL
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 06:10:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1huZx7-0002st-DY
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 06:10:54 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:44839 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1huZx7-0002i8-61
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 06:10:53 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8FB7A1A217D;
 Mon,  5 Aug 2019 12:09:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4024D1A211A;
 Mon,  5 Aug 2019 12:09:36 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 12:09:16 +0200
Message-Id: <1564999760-27438-19-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564999760-27438-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564999760-27438-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v6 18/22] target/mips: Clean up
 handling of CP0 register 26
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
 target/mips/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 28ce30d..4db9712 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7494,7 +7494,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG00__ERRCTL:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_ErrCtl));
             register_name = "ErrCtl";
             break;
@@ -8244,7 +8244,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
        break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG00__ERRCTL:
             gen_helper_mtc0_errctl(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "ErrCtl";
@@ -8974,7 +8974,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG00__ERRCTL:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_ErrCtl));
             register_name = "ErrCtl";
             break;
@@ -9706,7 +9706,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_26:
         switch (sel) {
-        case 0:
+        case CP0_REG00__ERRCTL:
             gen_helper_mtc0_errctl(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "ErrCtl";
-- 
2.7.4


