Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885CDA1787
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:57:56 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3I7n-0005Ss-Ff
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hcn-0005XR-S4
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hcm-00064B-2d
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:53 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45744 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i3Hcl-0005jT-Q4
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:51 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B3D3E1A21E3;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 81B461A226C;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:25:11 +0200
Message-Id: <1567074313-22998-30-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 29/31] target/mips: Clean up handling of CP0
 register 30
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

Clean up handling of CP0 register 30.

Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1567009614-12438-30-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6d6fda6..93f7a20 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7521,7 +7521,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_30:
         switch (sel) {
-        case 0:
+        case CP0_REG30__ERROREPC:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_ErrorEPC));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "ErrorEPC";
@@ -8272,7 +8272,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
        break;
     case CP0_REGISTER_30:
         switch (sel) {
-        case 0:
+        case CP0_REG30__ERROREPC:
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_ErrorEPC));
             register_name = "ErrorEPC";
             break;
@@ -8999,7 +8999,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_30:
         switch (sel) {
-        case 0:
+        case CP0_REG30__ERROREPC:
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_ErrorEPC));
             register_name = "ErrorEPC";
             break;
@@ -9736,7 +9736,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_30:
         switch (sel) {
-        case 0:
+        case CP0_REG30__ERROREPC:
             tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_ErrorEPC));
             register_name = "ErrorEPC";
             break;
-- 
2.7.4


