Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E864A166B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:40:08 +0200 (CEST)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3HqY-0002GP-LP
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hcf-0005S1-O6
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hcd-0005op-Me
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:45 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45428 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i3Hcc-0005Pp-Gw
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 512C51A225B;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 1F27A1A21DA;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:25:01 +0200
Message-Id: <1567074313-22998-20-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 19/31] target/mips: Clean up handling of CP0
 register 18
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

Clean up handling of CP0 register 18.

Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1567009614-12438-20-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/cpu.h       | 20 +++++++++-------
 target/mips/translate.c | 64 ++++++++++++++++++++++++-------------------------
 2 files changed, 44 insertions(+), 40 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index d6405ad..d6ea111 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -192,14 +192,14 @@ typedef struct mips_def_t mips_def_t;
  *     Register 16       Register 17       Register 18       Register 19
  *     -----------       -----------       -----------       -----------
  *
- * 0   Config            LLAddr            WatchLo           WatchHi
- * 1   Config1           MAAR              WatchLo           WatchHi
- * 2   Config2           MAARI             WatchLo           WatchHi
- * 3   Config3                             WatchLo           WatchHi
- * 4   Config4                             WatchLo           WatchHi
- * 5   Config5                             WatchLo           WatchHi
- * 6                                       WatchLo           WatchHi
- * 7                                       WatchLo           WatchHi
+ * 0   Config            LLAddr            WatchLo0          WatchHi
+ * 1   Config1           MAAR              WatchLo1          WatchHi
+ * 2   Config2           MAARI             WatchLo2          WatchHi
+ * 3   Config3                             WatchLo3          WatchHi
+ * 4   Config4                             WatchLo4          WatchHi
+ * 5   Config5                             WatchLo5          WatchHi
+ * 6                                       WatchLo6          WatchHi
+ * 7                                       WatchLo7          WatchHi
  *
  *
  *     Register 20       Register 21       Register 22       Register 23
@@ -386,6 +386,10 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG18__WATCHLO1        1
 #define CP0_REG18__WATCHLO2        2
 #define CP0_REG18__WATCHLO3        3
+#define CP0_REG18__WATCHLO4        4
+#define CP0_REG18__WATCHLO5        5
+#define CP0_REG18__WATCHLO6        6
+#define CP0_REG18__WATCHLO7        7
 /* CP0 Register 19 */
 #define CP0_REG19__WATCHHI0        0
 #define CP0_REG19__WATCHHI1        1
diff --git a/target/mips/translate.c b/target/mips/translate.c
index edeaaad..6a11e8d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7305,14 +7305,14 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_18:
         switch (sel) {
-        case 0:
-        case 1:
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG18__WATCHLO0:
+        case CP0_REG18__WATCHLO1:
+        case CP0_REG18__WATCHLO2:
+        case CP0_REG18__WATCHLO3:
+        case CP0_REG18__WATCHLO4:
+        case CP0_REG18__WATCHLO5:
+        case CP0_REG18__WATCHLO6:
+        case CP0_REG18__WATCHLO7:
             CP0_CHECK(ctx->CP0_Config1 & (1 << CP0C1_WR));
             gen_helper_1e0i(mfc0_watchlo, arg, sel);
             register_name = "WatchLo";
@@ -8040,14 +8040,14 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_18:
         switch (sel) {
-        case 0:
-        case 1:
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG18__WATCHLO0:
+        case CP0_REG18__WATCHLO1:
+        case CP0_REG18__WATCHLO2:
+        case CP0_REG18__WATCHLO3:
+        case CP0_REG18__WATCHLO4:
+        case CP0_REG18__WATCHLO5:
+        case CP0_REG18__WATCHLO6:
+        case CP0_REG18__WATCHLO7:
             CP0_CHECK(ctx->CP0_Config1 & (1 << CP0C1_WR));
             gen_helper_0e1i(mtc0_watchlo, arg, sel);
             register_name = "WatchLo";
@@ -8777,14 +8777,14 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_18:
         switch (sel) {
-        case 0:
-        case 1:
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG18__WATCHLO0:
+        case CP0_REG18__WATCHLO1:
+        case CP0_REG18__WATCHLO2:
+        case CP0_REG18__WATCHLO3:
+        case CP0_REG18__WATCHLO4:
+        case CP0_REG18__WATCHLO5:
+        case CP0_REG18__WATCHLO6:
+        case CP0_REG18__WATCHLO7:
             CP0_CHECK(ctx->CP0_Config1 & (1 << CP0C1_WR));
             gen_helper_1e0i(dmfc0_watchlo, arg, sel);
             register_name = "WatchLo";
@@ -9494,14 +9494,14 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_18:
         switch (sel) {
-        case 0:
-        case 1:
-        case 2:
-        case 3:
-        case 4:
-        case 5:
-        case 6:
-        case 7:
+        case CP0_REG18__WATCHLO0:
+        case CP0_REG18__WATCHLO1:
+        case CP0_REG18__WATCHLO2:
+        case CP0_REG18__WATCHLO3:
+        case CP0_REG18__WATCHLO4:
+        case CP0_REG18__WATCHLO5:
+        case CP0_REG18__WATCHLO6:
+        case CP0_REG18__WATCHLO7:
             CP0_CHECK(ctx->CP0_Config1 & (1 << CP0C1_WR));
             gen_helper_0e1i(mtc0_watchlo, arg, sel);
             register_name = "WatchLo";
-- 
2.7.4


