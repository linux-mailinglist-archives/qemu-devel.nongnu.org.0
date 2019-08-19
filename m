Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A5923A4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:40:06 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgx8-0008WE-Vt
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTx-0002Mu-Sr
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hzgTw-0002rx-6p
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:53 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59119 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hzgTv-0002io-PE
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:09:52 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id F3EE41A21A3;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 24F121A2131;
 Mon, 19 Aug 2019 14:08:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:08:11 +0200
Message-Id: <1566216496-17375-33-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566216496-17375-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 32/37] target/mips: Clean up handling of CP0
 register 24
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

Clean up handling of CP0 register 24.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7e243f8..a3a9d34 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7453,7 +7453,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_24:
         switch (sel) {
-        case 0:
+        case CP0_REG24__DEPC:
             /* EJTAG support */
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
             tcg_gen_ext32s_tl(arg, arg);
@@ -8215,7 +8215,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_24:
         switch (sel) {
-        case 0:
+        case CP0_REG24__DEPC:
             /* EJTAG support */
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
             register_name = "DEPC";
@@ -8954,7 +8954,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_24:
         switch (sel) {
-        case 0:
+        case CP0_REG24__DEPC:
             /* EJTAG support */
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
             register_name = "DEPC";
@@ -9697,7 +9697,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_24:
         switch (sel) {
-        case 0:
+        case CP0_REG24__DEPC:
             /* EJTAG support */
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
             register_name = "DEPC";
-- 
2.7.4


