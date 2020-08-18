Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2725247D46
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:23:32 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7t9n-0004JR-V2
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t63-00078k-M8; Tue, 18 Aug 2020 00:19:39 -0400
Received: from ozlabs.org ([203.11.71.1]:42489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t5z-0006JZ-Vn; Tue, 18 Aug 2020 00:19:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNZ03HTz9sTn; Tue, 18 Aug 2020 14:19:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724366;
 bh=l4MkVwUco+rCkcYPoEa1iA0fgIjbUKLLoqRdGoYQlHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Px5AKkQXxvxcquQxwRQPEDoSvxXaG59XzVZoFEgKMkWuqWEf1PdfOlaI9E/VAtPHQ
 FWvO6To4iGuHQqCAzjd4jOFdPZkw/yGqfs/DSeoyezF0J++DerqOO3qQ+NMpcUBYmm
 Bnxc8PIpaGj7O8CC/DWcQxIg4MX75vZyuqsC4GY8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/40] target/ppc: add byte-reverse br[dwh] instructions
Date: Tue, 18 Aug 2020 14:18:46 +1000
Message-Id: <20200818041922.251708-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 00:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Lijun Pan <ljp@linux.ibm.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lijun Pan <ljp@linux.ibm.com>

POWER ISA 3.1 introduces following byte-reverse instructions:
brd: Byte-Reverse Doubleword X-form
brw: Byte-Reverse Word X-form
brh: Byte-Reverse Halfword X-form

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
Message-Id: <20200701234344.91843-4-ljp@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4ce3d664b5..590c3e3bc7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6971,7 +6971,47 @@ static void gen_dform3D(DisasContext *ctx)
     return gen_invalid(ctx);
 }
 
+#if defined(TARGET_PPC64)
+/* brd */
+static void gen_brd(DisasContext *ctx)
+{
+    tcg_gen_bswap64_i64(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rS(ctx->opcode)]);
+}
+
+/* brw */
+static void gen_brw(DisasContext *ctx)
+{
+    tcg_gen_bswap64_i64(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rS(ctx->opcode)]);
+    tcg_gen_rotli_i64(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rA(ctx->opcode)], 32);
+
+}
+
+/* brh */
+static void gen_brh(DisasContext *ctx)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_movi_i64(t0, 0x00ff00ff00ff00ffull);
+    tcg_gen_shri_i64(t1, cpu_gpr[rS(ctx->opcode)], 8);
+    tcg_gen_and_i64(t2, t1, t0);
+    tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], t0);
+    tcg_gen_shli_i64(t1, t1, 8);
+    tcg_gen_or_i64(cpu_gpr[rA(ctx->opcode)], t1, t2);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+}
+#endif
+
 static opcode_t opcodes[] = {
+#if defined(TARGET_PPC64)
+GEN_HANDLER_E(brd, 0x1F, 0x1B, 0x05, 0x0000F801, PPC_NONE, PPC2_ISA310),
+GEN_HANDLER_E(brw, 0x1F, 0x1B, 0x04, 0x0000F801, PPC_NONE, PPC2_ISA310),
+GEN_HANDLER_E(brh, 0x1F, 0x1B, 0x06, 0x0000F801, PPC_NONE, PPC2_ISA310),
+#endif
 GEN_HANDLER(invalid, 0x00, 0x00, 0x00, 0xFFFFFFFF, PPC_NONE),
 GEN_HANDLER(cmp, 0x1F, 0x00, 0x00, 0x00400000, PPC_INTEGER),
 GEN_HANDLER(cmpi, 0x0B, 0xFF, 0xFF, 0x00400000, PPC_INTEGER),
-- 
2.26.2


