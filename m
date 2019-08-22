Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89C99277
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:47:01 +0200 (CEST)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lYR-0006HU-Li
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP7-0004k3-UX
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP3-0007qr-2o
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:21 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48218 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lOv-0007j1-4H
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:11 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D5B981A20B9;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id B1CD61A205C;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:38 +0200
Message-Id: <1566473750-17743-15-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 14/26] target/mips: Clean up handling of CP0
 register 17
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

Clean up handling of CP0 register 17.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7878fcb..51c8d29 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6671,12 +6671,12 @@ static void gen_mfhc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_17:
         switch (sel) {
-        case 0:
+        case CP0_REG17__LLADDR:
             gen_mfhc0_load64(arg, offsetof(CPUMIPSState, CP0_LLAddr),
                              ctx->CP0_LLAddr_shift);
             register_name = "LLAddr";
             break;
-        case 1:
+        case CP0_REG17__MAAR:
             CP0_CHECK(ctx->mrp);
             gen_helper_mfhc0_maar(arg, cpu_env);
             register_name = "MAAR";
@@ -6772,7 +6772,7 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_17:
         switch (sel) {
-        case 0:
+        case CP0_REG17__LLADDR:
             /*
              * LLAddr is read-only (the only exception is bit 0 if LLB is
              * supported); the CP0_LLAddr_rw_bitmask does not seem to be
@@ -6781,7 +6781,7 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
              */
             register_name = "LLAddr";
             break;
-        case 1:
+        case CP0_REG17__MAAR:
             CP0_CHECK(ctx->mrp);
             gen_helper_mthc0_maar(cpu_env, arg);
             register_name = "MAAR";
@@ -7332,16 +7332,16 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_17:
         switch (sel) {
-        case 0:
+        case CP0_REG17__LLADDR:
             gen_helper_mfc0_lladdr(arg, cpu_env);
             register_name = "LLAddr";
             break;
-        case 1:
+        case CP0_REG17__MAAR:
             CP0_CHECK(ctx->mrp);
             gen_helper_mfc0_maar(arg, cpu_env);
             register_name = "MAAR";
             break;
-        case 2:
+        case CP0_REG17__MAARI:
             CP0_CHECK(ctx->mrp);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_MAARI));
             register_name = "MAARI";
@@ -8071,16 +8071,16 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_17:
         switch (sel) {
-        case 0:
+        case CP0_REG17__LLADDR:
             gen_helper_mtc0_lladdr(cpu_env, arg);
             register_name = "LLAddr";
             break;
-        case 1:
+        case CP0_REG17__MAAR:
             CP0_CHECK(ctx->mrp);
             gen_helper_mtc0_maar(cpu_env, arg);
             register_name = "MAAR";
             break;
-        case 2:
+        case CP0_REG17__MAARI:
             CP0_CHECK(ctx->mrp);
             gen_helper_mtc0_maari(cpu_env, arg);
             register_name = "MAARI";
@@ -8816,16 +8816,16 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_17:
         switch (sel) {
-        case 0:
+        case CP0_REG17__LLADDR:
             gen_helper_dmfc0_lladdr(arg, cpu_env);
             register_name = "LLAddr";
             break;
-        case 1:
+        case CP0_REG17__MAAR:
             CP0_CHECK(ctx->mrp);
             gen_helper_dmfc0_maar(arg, cpu_env);
             register_name = "MAAR";
             break;
-        case 2:
+        case CP0_REG17__MAARI:
             CP0_CHECK(ctx->mrp);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_MAARI));
             register_name = "MAARI";
@@ -9537,16 +9537,16 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_17:
         switch (sel) {
-        case 0:
+        case CP0_REG17__LLADDR:
             gen_helper_mtc0_lladdr(cpu_env, arg);
             register_name = "LLAddr";
             break;
-        case 1:
+        case CP0_REG17__MAAR:
             CP0_CHECK(ctx->mrp);
             gen_helper_mtc0_maar(cpu_env, arg);
             register_name = "MAAR";
             break;
-        case 2:
+        case CP0_REG17__MAARI:
             CP0_CHECK(ctx->mrp);
             gen_helper_mtc0_maari(cpu_env, arg);
             register_name = "MAARI";
-- 
2.7.4


