Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D44606BA
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 15:14:11 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrKwU-0003sg-56
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 09:14:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKhF-0006ND-Dy; Sun, 28 Nov 2021 08:58:25 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKh7-0004gU-Q2; Sun, 28 Nov 2021 08:58:24 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 8C169402B1;
 Sun, 28 Nov 2021 14:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638107870;
 bh=sqZ9IOjji13AUlaNgMP+FjBq8LBz8U8nlYTNx9i2JMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S20bHahZHc60KLbyh2CamRdfrchc3G8FYvJGRSCyGitsNTAEzZPuEK8lVCjp7KMSx
 9oPSWU7oVOAZFxeQa8ov4fougtmDmhh62s980Kwmpw3gX8+fUUxNpLLQDt7wswjJGH
 Yxx4K8H9XJDahnsjvubz40r0ZfyqI/jylW74E48V3co0nszG2m8LV/zWoe3UCHVcKa
 1iOLCzseAzFjLdavnhuWLjgNNisE9Levaui/DD2saT7l2pn1sxLijYmQXgFPe54Uwa
 9bfE3eHSuwzbws+XioWhBAhOakUz8tJ5DpYFkwgkb0A2NHMiP1oW9qDHE+q+gG1jN8
 UIV4sJXCeFDeA==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 7424860066;
 Sun, 28 Nov 2021 14:57:50 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 43D784006D;
 Sun, 28 Nov 2021 14:57:50 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 17/18] target/riscv: modification of the trans_csrxx for
 128-bit support
Date: Sun, 28 Nov 2021 14:57:18 +0100
Message-Id: <20211128135719.50444-18-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As opposed to the gen_arith and gen_shift generation helpers, the csr insns
do not have a common prototype, so the choice to generate 32/64 or 128-bit
helper calls is done in the trans_csrxx functions.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 205 ++++++++++++++++++------
 1 file changed, 160 insertions(+), 45 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index ca354130ec..3a0ae28fef 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -881,20 +881,78 @@ static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv mask)
     return do_csr_post(ctx);
 }
 
+static bool do_csrr_i128(DisasContext *ctx, int rd, int rc)
+{
+    TCGv destl = dest_gpr(ctx, rd);
+    TCGv desth = dest_gprh(ctx, rd);
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrr_i128(destl, cpu_env, csr);
+    tcg_gen_ld_tl(desth, cpu_env, offsetof(CPURISCVState, retxh));
+    gen_set_gpr128(ctx, rd, destl, desth);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrw_i128(DisasContext *ctx, int rc, TCGv srcl, TCGv srch)
+{
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrw_i128(cpu_env, csr, srcl, srch);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrrw_i128(DisasContext *ctx, int rd, int rc,
+                          TCGv srcl, TCGv srch, TCGv maskl, TCGv maskh)
+{
+    TCGv destl = dest_gpr(ctx, rd);
+    TCGv desth = dest_gprh(ctx, rd);
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrrw_i128(destl, cpu_env, csr, srcl, srch, maskl, maskh);
+    tcg_gen_ld_tl(desth, cpu_env, offsetof(CPURISCVState, retxh));
+    gen_set_gpr128(ctx, rd, destl, desth);
+    return do_csr_post(ctx);
+}
+
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
-
-    /*
-     * If rd == 0, the insn shall not read the csr, nor cause any of the
-     * side effects that might occur on a csr read.
-     */
-    if (a->rd == 0) {
-        return do_csrw(ctx, a->csr, src);
+    if (get_xl(ctx) < MXL_RV128) {
+        TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw(ctx, a->csr, src);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw(ctx, a->rd, a->csr, src, mask);
+    } else {
+        TCGv srcl = get_gpr(ctx, a->rs1, EXT_NONE);
+        TCGv srch = get_gprh(ctx, a->rs1);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw_i128(ctx, a->csr, srcl, srch);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, srcl, srch, mask, mask);
     }
-
-    TCGv mask = tcg_constant_tl(-1);
-    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
@@ -906,13 +964,24 @@ static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv maskl = get_gpr(ctx, a->rs1, EXT_ZERO);
+        TCGv maskh = get_gprh(ctx, a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, maskl, maskh);
     }
-
-    TCGv ones = tcg_constant_tl(-1);
-    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
-    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
 static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
@@ -924,28 +993,54 @@ static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv maskl = get_gpr(ctx, a->rs1, EXT_ZERO);
+        TCGv maskh = get_gprh(ctx, a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr,
+                             ctx->zero, ctx->zero, maskl, maskh);
     }
-
-    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
-    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
 
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    TCGv src = tcg_constant_tl(a->rs1);
-
-    /*
-     * If rd == 0, the insn shall not read the csr, nor cause any of the
-     * side effects that might occur on a csr read.
-     */
-    if (a->rd == 0) {
-        return do_csrw(ctx, a->csr, src);
+    if (get_xl(ctx) < MXL_RV128) {
+        TCGv src = tcg_constant_tl(a->rs1);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw(ctx, a->csr, src);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw(ctx, a->rd, a->csr, src, mask);
+    } else {
+        TCGv src = tcg_constant_tl(a->rs1);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw_i128(ctx, a->csr, src, ctx->zero);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, src, ctx->zero, mask, mask);
     }
-
-    TCGv mask = tcg_constant_tl(-1);
-    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
@@ -957,16 +1052,26 @@ static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, mask, ctx->zero);
     }
-
-    TCGv ones = tcg_constant_tl(-1);
-    TCGv mask = tcg_constant_tl(a->rs1);
-    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
-static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
+static bool trans_csrrci(DisasContext *ctx, arg_csrrci * a)
 {
     /*
      * If rs1 == 0, the insn shall not write to the csr at all, nor
@@ -975,10 +1080,20 @@ static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr,
+                             ctx->zero, ctx->zero, mask, ctx->zero);
     }
-
-    TCGv mask = tcg_constant_tl(a->rs1);
-    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
-- 
2.34.0


