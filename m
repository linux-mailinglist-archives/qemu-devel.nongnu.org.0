Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3692350
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:19:32 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgdG-0003XF-JA
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTp-0002Ay-Fq
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTm-0002lX-Oa
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:45 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:58066 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTm-0002bq-8i
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id CD1961A21E3;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 0298C1A21CB;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:08:08 +0200
Message-Id: <1566216496-17375-30-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 29/37] target/mips: Clean up handling of CP0
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
Cc: arikalo@wavecomp.com, philmd@redhat.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 17.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 729b84d..ed6d567 100644
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


