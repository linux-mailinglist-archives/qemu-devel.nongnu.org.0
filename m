Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94544A67F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 06:57:39 +0100 (CET)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkK8Y-00007E-PH
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 00:57:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3U-0004Rp-Ng; Tue, 09 Nov 2021 00:52:25 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=52285
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3O-0006cv-FF; Tue, 09 Nov 2021 00:52:22 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn5tp7z4xcF; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=3ZVI6bbEbQ5bVps6XHzp05OKdMn7hiVXT4ofLQhGbKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pnNX09RxAIVzJ/rtEHbmjv7G2LYNRLlt4RIf9eO8JjvfpenN29fvWGBsW0A8Nb5gN
 0p2A0Kgxt9k1dOGzA8+yogO+pbEme3QazkkbSRSGGFgIyUlyWhgTYcYR/h4KPQAZYl
 PZrdB5eybvHKinBXn0end6oNDd4Ca4YWvrdJiPBE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 01/54] target/ppc: introduce do_ea_calc
Date: Tue,  9 Nov 2021 16:51:11 +1100
Message-Id: <20211109055204.230765-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fernando Eckhardt Valle <phervalle@gmail.com>

The do_ea_calc function will calculate the effective address(EA)
according to PowerIsa 3.1. With that, it was replaced part of
do_ldst() that calculates the EA by this new function.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fernando Eckhardt Valle (pherde) <phervalle@gmail.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-2-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c                     | 14 ++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 10 +---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 518337bcb7..b3264aab58 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3197,6 +3197,20 @@ static inline void gen_align_no_le(DisasContext *ctx)
                       (ctx->opcode & 0x03FF0000) | POWERPC_EXCP_ALIGN_LE);
 }
 
+static TCGv do_ea_calc(DisasContext *ctx, int ra, TCGv displ)
+{
+    TCGv ea = tcg_temp_new();
+    if (ra) {
+        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
+    } else {
+        tcg_gen_mov_tl(ea, displ);
+    }
+    if (NARROW_MODE(ctx)) {
+        tcg_gen_ext32u_tl(ea, ea);
+    }
+    return ea;
+}
+
 /***                             Integer load                              ***/
 #define DEF_MEMOP(op) ((op) | ctx->default_tcg_memop_mask)
 #define BSWAP_MEMOP(op) ((op) | (ctx->default_tcg_memop_mask ^ MO_BSWAP))
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 2e2518ee15..caef5d89cd 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -51,15 +51,7 @@ static bool do_ldst(DisasContext *ctx, int rt, int ra, TCGv displ, bool update,
     }
     gen_set_access_type(ctx, ACCESS_INT);
 
-    ea = tcg_temp_new();
-    if (ra) {
-        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
-    } else {
-        tcg_gen_mov_tl(ea, displ);
-    }
-    if (NARROW_MODE(ctx)) {
-        tcg_gen_ext32u_tl(ea, ea);
-    }
+    ea = do_ea_calc(ctx, ra, displ);
     mop ^= ctx->default_tcg_memop_mask;
     if (store) {
         tcg_gen_qemu_st_tl(cpu_gpr[rt], ea, ctx->mem_idx, mop);
-- 
2.33.1


