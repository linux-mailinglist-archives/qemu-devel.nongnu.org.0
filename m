Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF92D926A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:06:59 +0100 (CET)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog4Y-0006nl-NW
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwV-0005H0-QR; Sun, 13 Dec 2020 23:58:40 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:58423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwS-0004rr-Ue; Sun, 13 Dec 2020 23:58:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfr5qQjz9sW4; Mon, 14 Dec 2020 15:58:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921892;
 bh=4N37ribSsNuMu5SlA8toR+wuJmA1sgvekuvmlDm/WJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eMTIeslK19m781DdoRx5a79oKSLgfdFJldB8UgT8/IhljH8KiqWzG9ZfW5BuCOCn0
 kLjV8N5szTsJ2oNyGAAkTwN2y3yavHDNduppn/k3bB//8083LxZPDj8E++XyHqEo9q
 tvcEZ2OGNVOuNPQ96nFecn2XY6eaXh//8B1PP4E8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 14/30] ppc/translate: Rewrite gen_lxvdsx to use gvec primitives
Date: Mon, 14 Dec 2020 15:57:51 +1100
Message-Id: <20201214045807.41003-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

Make the implementation match the lxvwsx one.
The code is now shorter smaller and potentially faster as the
translation will use the host SIMD capabilities if available.

No functional change.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Message-Id: <a463dea379da4cb3a22de49c678932f74fb15dd7.1604912739.git.thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.c.inc | 46 ++++++++++++++---------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 075f063e98..b817d31260 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -75,29 +75,6 @@ static void gen_lxvd2x(DisasContext *ctx)
     tcg_temp_free_i64(t0);
 }
 
-static void gen_lxvdsx(DisasContext *ctx)
-{
-    TCGv EA;
-    TCGv_i64 t0;
-    TCGv_i64 t1;
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
-    t0 = tcg_temp_new_i64();
-    t1 = tcg_temp_new_i64();
-    gen_set_access_type(ctx, ACCESS_INT);
-    EA = tcg_temp_new();
-    gen_addr_reg_index(ctx, EA);
-    gen_qemu_ld64_i64(ctx, t0, EA);
-    set_cpu_vsrh(xT(ctx->opcode), t0);
-    tcg_gen_mov_i64(t1, t0);
-    set_cpu_vsrl(xT(ctx->opcode), t1);
-    tcg_temp_free(EA);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-}
-
 static void gen_lxvw4x(DisasContext *ctx)
 {
     TCGv EA;
@@ -169,6 +146,29 @@ static void gen_lxvwsx(DisasContext *ctx)
     tcg_temp_free_i32(data);
 }
 
+static void gen_lxvdsx(DisasContext *ctx)
+{
+    TCGv EA;
+    TCGv_i64 data;
+
+    if (unlikely(!ctx->vsx_enabled)) {
+        gen_exception(ctx, POWERPC_EXCP_VSXU);
+        return;
+    }
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+
+    gen_addr_reg_index(ctx, EA);
+
+    data = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
+    tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
+
+    tcg_temp_free(EA);
+    tcg_temp_free_i64(data);
+}
+
 static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
                           TCGv_i64 inh, TCGv_i64 inl)
 {
-- 
2.29.2


