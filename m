Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4DF388E68
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:55:26 +0200 (CEST)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLjR-0004bW-W3
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgR-00009Z-4K; Wed, 19 May 2021 08:52:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57343 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgN-0000u5-TC; Wed, 19 May 2021 08:52:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnW5Kzqz9sX1; Wed, 19 May 2021 22:51:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428719;
 bh=6iwrbQ9JnqGHFWlfOJv/R83ZAhZJzNl0tqe9pghKOzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XiBg4oRWjxLhX5GvcxwfLQW3lJuPzdV4MhEL2SVnOVSUnIQDksq5iOMDKkL0skHA/
 l1JyB2+PUSDtT7ZPxJwSYvkCymFbM52Q7oCSB8bTO2YN8tsQHUsBrskr1ORrd6/wAL
 jeToXF89mNL8kYfHw3KZGFYchGGt5x9Ivf2hf2jY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/48] target/ppc: Fold gen_*_xer into their callers
Date: Wed, 19 May 2021 22:51:03 +1000
Message-Id: <20210519125148.27720-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

folded gen_{read,write}_xer into their only callers, spr_{read,write}_xer

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210504140157.76066-2-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c          | 37 ---------------------------------
 target/ppc/translate_init.c.inc | 33 +++++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a6381208a5..a5e144d944 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4175,43 +4175,6 @@ static void gen_tdi(DisasContext *ctx)
 
 /***                          Processor control                            ***/
 
-static void gen_read_xer(DisasContext *ctx, TCGv dst)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-    tcg_gen_mov_tl(dst, cpu_xer);
-    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
-    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
-    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
-    tcg_gen_or_tl(t0, t0, t1);
-    tcg_gen_or_tl(dst, dst, t2);
-    tcg_gen_or_tl(dst, dst, t0);
-    if (is_isa300(ctx)) {
-        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
-        tcg_gen_or_tl(dst, dst, t0);
-        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
-        tcg_gen_or_tl(dst, dst, t0);
-    }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-
-static void gen_write_xer(TCGv src)
-{
-    /* Write all flags, while reading back check for isa300 */
-    tcg_gen_andi_tl(cpu_xer, src,
-                    ~((1u << XER_SO) |
-                      (1u << XER_OV) | (1u << XER_OV32) |
-                      (1u << XER_CA) | (1u << XER_CA32)));
-    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
-    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
-    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
-    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
-    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
-}
-
 /* mcrxr */
 static void gen_mcrxr(DisasContext *ctx)
 {
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 66e6a4a746..5fed4e2bc5 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -116,12 +116,41 @@ static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
 /* XER */
 static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
 {
-    gen_read_xer(ctx, cpu_gpr[gprn]);
+    TCGv dst = cpu_gpr[gprn];
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+    tcg_gen_mov_tl(dst, cpu_xer);
+    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
+    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
+    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_or_tl(dst, dst, t2);
+    tcg_gen_or_tl(dst, dst, t0);
+    if (is_isa300(ctx)) {
+        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
+        tcg_gen_or_tl(dst, dst, t0);
+        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
+        tcg_gen_or_tl(dst, dst, t0);
+    }
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
 }
 
 static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
 {
-    gen_write_xer(cpu_gpr[gprn]);
+    TCGv src = cpu_gpr[gprn];
+    /* Write all flags, while reading back check for isa300 */
+    tcg_gen_andi_tl(cpu_xer, src,
+                    ~((1u << XER_SO) |
+                      (1u << XER_OV) | (1u << XER_OV32) |
+                      (1u << XER_CA) | (1u << XER_CA32)));
+    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
+    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
+    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
+    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
+    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
 }
 
 /* LR */
-- 
2.31.1


