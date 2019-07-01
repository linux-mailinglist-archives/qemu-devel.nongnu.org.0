Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6963207C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jun 2019 20:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hX8pt-000427-MC
	for lists+qemu-devel@lfdr.de; Sat, 01 Jun 2019 14:34:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hX8nR-0002sL-Lc
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 14:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hX8nQ-0005t4-EG
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 14:32:01 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59824 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hX8nQ-0005Pw-7e
	for qemu-devel@nongnu.org; Sat, 01 Jun 2019 14:32:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 6A0011A1D83;
	Sat,  1 Jun 2019 20:30:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 402261A1D39;
	Sat,  1 Jun 2019 20:30:55 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Jun 2019 20:30:40 +0200
Message-Id: <1559413846-4402-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559413846-4402-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559413846-4402-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 2/8] target/mips: Add emulation of MMI
 instruction PCPYLD
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>

Add emulation of MMI instruction PCPYLD. The emulation is implemented
using TCG front end operations directly to achieve better performance.

Signed-off-by: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Message-Id: <1551712405-2530-3-git-send-email-mateja.marjanovic@rt-rk.com>
---
 target/mips/translate.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 704eb2b..b4fcbb1 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24419,6 +24419,45 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
     }
 }
 
+/*
+ *  PCPYLD rd, rs, rt
+ *
+ *    Parallel Copy Lower Doubleword
+ *
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *  +-----------+---------+---------+---------+---------+-----------+
+ *  |    MMI    |   rs    |   rt    |   rd    | PCPYLD  |    MMI2   |
+ *  +-----------+---------+---------+---------+---------+-----------+
+ */
+static void gen_mmi_pcpyld(DisasContext *ctx)
+{
+    uint32_t rs, rt, rd;
+    uint32_t opcode;
+
+    opcode = ctx->opcode;
+
+    rs = extract32(opcode, 21, 5);
+    rt = extract32(opcode, 16, 5);
+    rd = extract32(opcode, 11, 5);
+
+    if (rd == 0) {
+        /* nop */
+    } else {
+        if (rs == 0) {
+            tcg_gen_movi_i64(cpu_mmr[rd], 0);
+        } else {
+            tcg_gen_mov_i64(cpu_mmr[rd], cpu_gpr[rs]);
+        }
+        if (rt == 0) {
+            tcg_gen_movi_i64(cpu_gpr[rd], 0);
+        } else {
+            if (rd != rt) {
+                tcg_gen_mov_i64(cpu_gpr[rd], cpu_gpr[rt]);
+            }
+        }
+    }
+}
+
 #endif
 
 
@@ -27433,7 +27472,6 @@ static void decode_mmi2(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_2_PINTH:     /* TODO: MMI_OPC_2_PINTH */
     case MMI_OPC_2_PMULTW:    /* TODO: MMI_OPC_2_PMULTW */
     case MMI_OPC_2_PDIVW:     /* TODO: MMI_OPC_2_PDIVW */
-    case MMI_OPC_2_PCPYLD:    /* TODO: MMI_OPC_2_PCPYLD */
     case MMI_OPC_2_PMADDH:    /* TODO: MMI_OPC_2_PMADDH */
     case MMI_OPC_2_PHMADH:    /* TODO: MMI_OPC_2_PHMADH */
     case MMI_OPC_2_PAND:      /* TODO: MMI_OPC_2_PAND */
@@ -27448,6 +27486,9 @@ static void decode_mmi2(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_2_PROT3W:    /* TODO: MMI_OPC_2_PROT3W */
         generate_exception_end(ctx, EXCP_RI); /* TODO: MMI_OPC_CLASS_MMI2 */
         break;
+    case MMI_OPC_2_PCPYLD:
+        gen_mmi_pcpyld(ctx);
+        break;
     default:
         MIPS_INVAL("TX79 MMI class MMI2");
         generate_exception_end(ctx, EXCP_RI);
-- 
2.7.4


