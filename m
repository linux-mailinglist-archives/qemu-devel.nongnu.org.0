Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93143A1676
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:42:53 +0200 (CEST)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3HtE-0005Wq-BA
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hcf-0005S4-PJ
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hcd-0005oX-JO
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:45 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45436 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i3Hcc-0005QZ-Ia
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9C1481A21DA;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6247B1A21D6;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:25:08 +0200
Message-Id: <1567074313-22998-27-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 26/31] target/mips: Clean up handling of CP0
 register 27
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

Clean up handling of CP0 register 27.

Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1567009614-12438-27-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/translate.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a8ea952..c969c25 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7466,10 +7466,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_27:
         switch (sel) {
-        case 0:
-        case 1:
-        case 2:
-        case 3:
+        case CP0_REG27__CACHERR:
             tcg_gen_movi_tl(arg, 0); /* unimplemented */
             register_name = "CacheErr";
             break;
@@ -8224,10 +8221,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_27:
         switch (sel) {
-        case 0:
-        case 1:
-        case 2:
-        case 3:
+        case CP0_REG27__CACHERR:
             /* ignored */
             register_name = "CacheErr";
             break;
@@ -8955,10 +8949,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_27:
         switch (sel) {
         /* ignored */
-        case 0:
-        case 1:
-        case 2:
-        case 3:
+        case CP0_REG27__CACHERR:
             tcg_gen_movi_tl(arg, 0); /* unimplemented */
             register_name = "CacheErr";
             break;
@@ -9694,10 +9685,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_27:
         switch (sel) {
-        case 0:
-        case 1:
-        case 2:
-        case 3:
+        case CP0_REG27__CACHERR:
             /* ignored */
             register_name = "CacheErr";
             break;
-- 
2.7.4


