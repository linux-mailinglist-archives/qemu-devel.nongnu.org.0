Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD26A551896
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:14:35 +0200 (CEST)
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GIc-0002Yv-KP
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o3G9x-0006bl-01
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:05:37 -0400
Received: from mail.ispras.ru ([83.149.199.84]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o3G9u-0004Ya-4G
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:05:36 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id A230D40737D8;
 Mon, 20 Jun 2022 12:05:32 +0000 (UTC)
Subject: [PATCH v3 3/4] target/mips: implement Octeon-specific arithmetic
 instructions
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
Date: Mon, 20 Jun 2022 15:05:32 +0300
Message-ID: <165572673245.167724.17377788816335619000.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements several Octeon-specific instructions:
- BADDU
- DMUL
- EXTS/EXTS32
- CINS/CINS32
- POP/DPOP
- SEQ/SEQI
- SNE/SNEI

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

--

v3 changes:
   - Fixed length field for EXTS/CINS
     (bug found by Richard Henderson)
v2 changes:
   - Using existing tcg instructions for exts, cins, pop
     (suggested by Richard Henderson)
---
 target/mips/tcg/octeon.decode      |   26 ++++++
 target/mips/tcg/octeon_translate.c |  155 ++++++++++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)

diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index 8062715578..8929ad088e 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -13,3 +13,29 @@
 
 %bbit_p      28:1 16:5
 BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
+
+# Arithmetic
+# BADDU rd, rs, rt
+# DMUL rd, rs, rt
+# EXTS rt, rs, p, lenm1
+# EXTS32 rt, rs, p, lenm1
+# CINS rt, rs, p, lenm1
+# CINS32 rt, rs, p, lenm1
+# DPOP rd, rs
+# POP rd, rs
+# SEQ rd, rs, rt
+# SEQI rt, rs, immediate
+# SNE rd, rs, rt
+# SNEI rt, rs, immediate
+
+@r3          ...... rs:5 rt:5 rd:5 ..... ......
+%bitfield_p  0:1 6:5
+@bitfield    ...... rs:5 rt:5 lenm1:5 ..... ..... . p=%bitfield_p
+
+BADDU        011100 ..... ..... ..... 00000 101000 @r3
+DMUL         011100 ..... ..... ..... 00000 000011 @r3
+EXTS         011100 ..... ..... ..... ..... 11101 . @bitfield
+CINS         011100 ..... ..... ..... ..... 11001 . @bitfield
+POP          011100 rs:5 00000 rd:5 00000 10110 dw:1
+SEQNE        011100 rs:5 rt:5 rd:5 00000 10101 ne:1
+SEQNEI       011100 rs:5 rt:5 imm:s10 10111 ne:1
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 1558f74a8e..6a207d2e7e 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -44,3 +44,158 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     tcg_temp_free(t0);
     return true;
 }
+
+static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
+{
+    TCGv t0, t1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    tcg_gen_add_tl(t0, t0, t1);
+    tcg_gen_andi_i64(cpu_gpr[a->rd], t0, 0xff);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_DMUL(DisasContext *ctx, arg_DMUL *a)
+{
+    TCGv t0, t1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
+{
+    TCGv t0;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1 + 1);
+    gen_store_gpr(t0, a->rt);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
+{
+    TCGv t0;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1 + 1);
+    gen_store_gpr(t0, a->rt);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_POP(DisasContext *ctx, arg_POP *a)
+{
+    TCGv t0;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    if (!a->dw) {
+        tcg_gen_andi_i64(t0, t0, 0xffffffff);
+    }
+    tcg_gen_ctpop_tl(t0, t0);
+    gen_store_gpr(t0, a->rd);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_SEQNE(DisasContext *ctx, arg_SEQNE *a)
+{
+    TCGv t0, t1;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    if (a->ne) {
+        tcg_gen_setcond_tl(TCG_COND_NE, cpu_gpr[a->rd], t1, t0);
+    } else {
+        tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr[a->rd], t1, t0);
+    }
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_SEQNEI(DisasContext *ctx, arg_SEQNEI *a)
+{
+    TCGv t0;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+
+    /* Sign-extend to 64 bit value */
+    target_ulong imm = a->imm;
+    if (a->ne) {
+        tcg_gen_setcondi_tl(TCG_COND_NE, cpu_gpr[a->rt], t0, imm);
+    } else {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], t0, imm);
+    }
+
+    tcg_temp_free(t0);
+
+    return true;
+}


