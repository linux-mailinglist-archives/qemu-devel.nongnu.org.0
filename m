Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F94359FE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:27:16 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPfe-0003D6-LD
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZN-0005TA-9N; Thu, 21 Oct 2021 00:20:46 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:54523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZL-0006tM-11; Thu, 21 Oct 2021 00:20:44 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p31Pfz4xd8; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=66aDyVN+FKDVcYoPjyeyWUlv2EqM0jIOVBJdqqk/Qx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bsj9Rteabtr4jOYi+xKbzVCdq5Dz1Gds8wvpw/wBukXcBFDMJNxeVGbTdf4Shfy17
 dCri5Puy2DVeyadJ/QGMICAq+eYZ+rfWPNJAaFPIwHLwfouotHQiKb9LUdIbYjL0qB
 hSmMKxeUyB3t9MZl3EmkxnWiwzI81ZMThYt1FJ2Y=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/25] target/ppc: Use tcg_constant_i64() in gen_brh()
Date: Thu, 21 Oct 2021 15:20:05 +1100
Message-Id: <20211021042027.345405-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The mask of the Byte-Reverse Halfword opcode is a read-only
constant. We can avoid using a TCG temporary by moving the
mask to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211003141711.3673181-3-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0258c1be16..98f304302e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7569,18 +7569,16 @@ static void gen_brw(DisasContext *ctx)
 /* brh */
 static void gen_brh(DisasContext *ctx)
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_constant_i64(0x00ff00ff00ff00ffull);
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
 
-    tcg_gen_movi_i64(t0, 0x00ff00ff00ff00ffull);
     tcg_gen_shri_i64(t1, cpu_gpr[rS(ctx->opcode)], 8);
-    tcg_gen_and_i64(t2, t1, t0);
-    tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], t0);
+    tcg_gen_and_i64(t2, t1, mask);
+    tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], mask);
     tcg_gen_shli_i64(t1, t1, 8);
     tcg_gen_or_i64(cpu_gpr[rA(ctx->opcode)], t1, t2);
 
-    tcg_temp_free_i64(t0);
     tcg_temp_free_i64(t1);
     tcg_temp_free_i64(t2);
 }
-- 
2.31.1


