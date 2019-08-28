Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653CA07DD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 18:52:44 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i31Bb-0006FE-Aj
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 12:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30nF-0007HH-6C
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30nD-0008EX-1k
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:32 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57916 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i30n9-0007zs-1g
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id ED3B71A22C2;
 Wed, 28 Aug 2019 18:27:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id BA61B1A22D7;
 Wed, 28 Aug 2019 18:27:00 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 18:26:52 +0200
Message-Id: <1567009614-12438-29-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 28/30] target/mips: Clean up handling of CP0
 register 29
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 29.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       | 22 ++++++++++-------
 target/mips/translate.c | 64 ++++++++++++++++++++++++-------------------------
 2 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index b71b6f4..d309ad8 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -235,12 +235,12 @@ typedef struct mips_def_t mips_def_t;
  *
  * 0   DataLo            DataHi            ErrorEPC          DESAVE
  * 1   TagLo             TagHi
- * 2   DataLo1           DataHi                              KScratch<n>
- * 3   TagLo1            TagHi                               KScratch<n>
- * 4   DataLo2           DataHi                              KScratch<n>
- * 5   TagLo2            TagHi                               KScratch<n>
- * 6   DataLo3           DataHi                              KScratch<n>
- * 7   TagLo3            TagHi                               KScratch<n>
+ * 2   DataLo1           DataHi1                             KScratch<n>
+ * 3   TagLo1            TagHi1                              KScratch<n>
+ * 4   DataLo2           DataHi2                             KScratch<n>
+ * 5   TagLo2            TagHi2                              KScratch<n>
+ * 6   DataLo3           DataHi3                             KScratch<n>
+ * 7   TagLo3            TagHi3                              KScratch<n>
  *
  */
 #define CP0_REGISTER_00     0
@@ -438,8 +438,14 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG28__TAGLO3          6
 #define CP0_REG28__DATALO3         7
 /* CP0 Register 29 */
-#define CP0_REG29__IDATAHI         1
-#define CP0_REG29__DDATAHI         3
+#define CP0_REG29__TAGHI           0
+#define CP0_REG29__DATAHI          1
+#define CP0_REG29__TAGHI1          2
+#define CP0_REG29__DATAHI1         3
+#define CP0_REG29__TAGHI2          4
+#define CP0_REG29__DATAHI2         5
+#define CP0_REG29__TAGHI3          6
+#define CP0_REG29__DATAHI3         7
 /* CP0 Register 30 */
 #define CP0_REG30__ERROREPC        0
 /* CP0 Register 31 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 807151b..2cb132a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7549,17 +7549,17 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_29:
         switch (sel) {
-        case 0:
-        case 2:
-        case 4:
-        case 6:
+        case CP0_REG29__TAGHI:
+        case CP0_REG29__TAGHI1:
+        case CP0_REG29__TAGHI2:
+        case CP0_REG29__TAGHI3:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_TagHi));
             register_name = "TagHi";
             break;
-        case 1:
-        case 3:
-        case 5:
-        case 7:
+        case CP0_REG29__DATAHI:
+        case CP0_REG29__DATAHI1:
+        case CP0_REG29__DATAHI2:
+        case CP0_REG29__DATAHI3:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_DataHi));
             register_name = "DataHi";
             break;
@@ -8304,17 +8304,17 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_29:
         switch (sel) {
-        case 0:
-        case 2:
-        case 4:
-        case 6:
+        case CP0_REG29__TAGHI:
+        case CP0_REG29__TAGHI1:
+        case CP0_REG29__TAGHI2:
+        case CP0_REG29__TAGHI3:
             gen_helper_mtc0_taghi(cpu_env, arg);
             register_name = "TagHi";
             break;
-        case 1:
-        case 3:
-        case 5:
-        case 7:
+        case CP0_REG29__DATAHI:
+        case CP0_REG29__DATAHI1:
+        case CP0_REG29__DATAHI2:
+        case CP0_REG29__DATAHI3:
             gen_helper_mtc0_datahi(cpu_env, arg);
             register_name = "DataHi";
             break;
@@ -9041,17 +9041,17 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_29:
         switch (sel) {
-        case 0:
-        case 2:
-        case 4:
-        case 6:
+        case CP0_REG29__TAGHI:
+        case CP0_REG29__TAGHI1:
+        case CP0_REG29__TAGHI2:
+        case CP0_REG29__TAGHI3:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_TagHi));
             register_name = "TagHi";
             break;
-        case 1:
-        case 3:
-        case 5:
-        case 7:
+        case CP0_REG29__DATAHI:
+        case CP0_REG29__DATAHI1:
+        case CP0_REG29__DATAHI2:
+        case CP0_REG29__DATAHI3:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_DataHi));
             register_name = "DataHi";
             break;
@@ -9782,17 +9782,17 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_29:
         switch (sel) {
-        case 0:
-        case 2:
-        case 4:
-        case 6:
+        case CP0_REG29__TAGHI:
+        case CP0_REG29__TAGHI1:
+        case CP0_REG29__TAGHI2:
+        case CP0_REG29__TAGHI3:
             gen_helper_mtc0_taghi(cpu_env, arg);
             register_name = "TagHi";
             break;
-        case 1:
-        case 3:
-        case 5:
-        case 7:
+        case CP0_REG29__DATAHI:
+        case CP0_REG29__DATAHI1:
+        case CP0_REG29__DATAHI2:
+        case CP0_REG29__DATAHI3:
             gen_helper_mtc0_datahi(cpu_env, arg);
             register_name = "DataHi";
             break;
-- 
2.7.4


