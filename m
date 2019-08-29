Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF6A1678
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:42:55 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3HtF-0005QB-GI
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hch-0005SS-Nd
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i3Hcd-0005pP-OG
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:47 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45420 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i3Hcc-0005PS-Im
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:25:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 2529D1A220B;
 Thu, 29 Aug 2019 12:25:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id E8CB11A21A8;
 Thu, 29 Aug 2019 12:25:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:24:56 +0200
Message-Id: <1567074313-22998-15-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567074313-22998-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 14/31] target/mips: Clean up handling of CP0
 register 13
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

Clean up handling of CP0 register 13.

Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1567009614-12438-15-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/cpu.h       | 2 ++
 target/mips/translate.c | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 061effb..4fce05a 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -357,6 +357,8 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG12__GTOFFSET        7
 /* CP0 Register 13 */
 #define CP0_REG13__CAUSE           0
+#define CP0_REG13__VIEW_RIPL       4
+#define CP0_REG13__NESTEDEXC       5
 /* CP0 Register 14 */
 #define CP0_REG14__EPC             0
 /* CP0 Register 15 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index fb9c719..4da08e1 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7202,7 +7202,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_13:
         switch (sel) {
-        case 0:
+        case CP0_REG13__CAUSE:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Cause));
             register_name = "Cause";
             break;
@@ -7928,7 +7928,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_13:
         switch (sel) {
-        case 0:
+        case CP0_REG13__CAUSE:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_cause(cpu_env, arg);
             /*
@@ -8677,7 +8677,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_13:
         switch (sel) {
-        case 0:
+        case CP0_REG13__CAUSE:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Cause));
             register_name = "Cause";
             break;
@@ -9391,7 +9391,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_13:
         switch (sel) {
-        case 0:
+        case CP0_REG13__CAUSE:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_cause(cpu_env, arg);
             /*
-- 
2.7.4


