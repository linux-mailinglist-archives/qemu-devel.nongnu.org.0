Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C606B435A08
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:33:00 +0200 (CEST)
Received: from localhost ([::1]:43840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPlD-0000hN-T5
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZO-0005Te-P3; Thu, 21 Oct 2021 00:20:46 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:58969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZL-0006tL-10; Thu, 21 Oct 2021 00:20:46 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p2lpSz4xbY; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=K8Bd/Kl/s5smcnQyubqNNSoEJGapJYr+XZh9hhgHrKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZmpRh96Wxsf8Cxw1ujqLdNF9zNO8n2KHk7oPSglrtiNXD0kksPRfCxj4WbGFMStAD
 +0oz7DU/6qDBo8lCpBI4bxUI9o2xHmkLrCB+9FW1OMbjnhh0s4vPRPmJ9W4ASbxLmb
 jnBn5nBX1H9zMfasuVhMEfRZCc0eQRehI/nptKfo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/25] target/ppc: Use tcg_constant_i32() in gen_setb()
Date: Thu, 21 Oct 2021 15:20:04 +1100
Message-Id: <20211021042027.345405-3-david@gibson.dropbear.id.au>
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

Avoid using TCG temporaries for the -1 and 8 constant values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211003141711.3673181-2-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c3c6cb9589..0258c1be16 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5068,19 +5068,15 @@ static void gen_mtspr(DisasContext *ctx)
 static void gen_setb(DisasContext *ctx)
 {
     TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t8 = tcg_temp_new_i32();
-    TCGv_i32 tm1 = tcg_temp_new_i32();
+    TCGv_i32 t8 = tcg_constant_i32(8);
+    TCGv_i32 tm1 = tcg_constant_i32(-1);
     int crf = crfS(ctx->opcode);
 
     tcg_gen_setcondi_i32(TCG_COND_GEU, t0, cpu_crf[crf], 4);
-    tcg_gen_movi_i32(t8, 8);
-    tcg_gen_movi_i32(tm1, -1);
     tcg_gen_movcond_i32(TCG_COND_GEU, t0, cpu_crf[crf], t8, tm1, t0);
     tcg_gen_ext_i32_tl(cpu_gpr[rD(ctx->opcode)], t0);
 
     tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(t8);
-    tcg_temp_free_i32(tm1);
 }
 #endif
 
-- 
2.31.1


