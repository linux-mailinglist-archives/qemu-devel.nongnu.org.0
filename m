Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25172DB8BA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:04:46 +0100 (CET)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMBJ-0008DS-UD
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8z-0006UP-Uy
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:21 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8v-0000tx-E3
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:02:21 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w6so15648263pfu.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u120+DVpg45n1ziD1lZqn1EL9cn7+DYhSPkDIbFuH6U=;
 b=PrStDb81pmqcNxGAmmYLN8+gsHWA1md+ej9k6K7iBlzf5WhNR/8WqXYG22heHzHcAT
 vVgnxn0dNWT5vRrjOgCgNKBhwI8MYtgmcHdd/bT5/7sYqbEbVmCxUoZjLkbSbV10sIql
 P6Gr4xU1J8ABXtW+hTYsyrfnoTY5UAsCcRC8c5ZrfE+NVGZeoGeYMb9e38/dd1cmrLrm
 OlV+ic6OIIgOojq4v7gq7MvYbBwPbDh+zbkrY93otVFT/eiyxbzJBuBuU42cwenEQt/N
 H4ckE5re0vmmYop5AWIE7zNtctMKWzmBMtPy/2aCmBLnR2rohzmG2TP6IDw/Y0w7cg/k
 1xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u120+DVpg45n1ziD1lZqn1EL9cn7+DYhSPkDIbFuH6U=;
 b=JDGnbALN5J+LEau+jnGhY6lI76wOGMOCr3uSuU6YNTnUsWRMK7jdhbd4+VAwtzBFed
 x5oZxVgI28vfB/cQFBBZFbmjIm5TT5xXFch36XFJ7tmVwWshQQX+ug7fsKOBAj1L8I05
 yi67+o3iMbfu3NZkQUagvHGwwfLJRRfx7AUchYf0hW9omO/pCshDRp9rslBo03Peiy4a
 UYCupy+BxGfKyciJ8y4lk+mI/+T4is92cjJj5Ympl+MduIp0D1HXi6YnLxIraaIS2zO6
 d6flMxRfY2Fknj0U0p1B081g1Qhiw5hzIaEW1tkeb9BmeY5CtAY/6xMPnl4RXdj5O/Ub
 aIdw==
X-Gm-Message-State: AOAM530VeoaNkj5DDrnbrq2/PsjXj2Hfa6s/KVFbIa1aTHm6hQkPwaG+
 b/69PsH0ONusj3Q6xJ6tEEBgtkNQpg+b79BqPaQ=
X-Google-Smtp-Source: ABdhPJx7mww1ynzUf4y1DmgMRSiKQKDYxPSf+QzNDtvk+X2VveXCX9QH/4gr98pREwXYeHE19CFaBw==
X-Received: by 2002:a65:4582:: with SMTP id o2mr31278783pgq.97.1608084136071; 
 Tue, 15 Dec 2020 18:02:16 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 04/15] target/riscv: rvb: logic-with-negate
Date: Wed, 16 Dec 2020 10:01:29 +0800
Message-Id: <20201216020150.3157-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ac4d8395a45..85421dccb99 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 pcnt       011000 000010 ..... 001 ..... 0010011 @r2
+
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index f5930f2ad53..6016ceefd64 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_pcnt(DisasContext *ctx, arg_pcnt *a)
     return gen_unary(ctx, a, &tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_andn);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_orn);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_xnor);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4c9eb86e630..fb0b2fd0728 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -711,6 +711,27 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_andc_tl(ret, arg1, arg2);
+    tcg_temp_free(t);
+}
+
+static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_orc_tl(ret, arg1, arg2);
+    tcg_temp_free(t);
+}
+
+static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_eqv_tl(ret, arg1, arg2);
+    tcg_temp_free(t);
+}
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
-- 
2.17.1


