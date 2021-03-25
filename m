Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6B34874D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:06:11 +0100 (CET)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGK2-0003GA-Ov
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4n-000397-3C
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:26 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:22812)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4f-0002dD-RK
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640617; x=1648176617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TSAFuo83vntVSDsWqoXFqnIbKl7a0mI/Gs99Nlw5zrQ=;
 b=wZQFRliLGIBEcj/HywDNX0tDqE96ySP9NA8ehGv/1f6ubPZA9cqFFA3M
 B7Np0D2WcCtB6XcnxNGF3k48CQa1rFQs5jP0/qzLRgBdKYrT16PBIjY0o
 XItR0PJHkgN/s66dMgymyA2rqA4x+5FLH8W4+09N+UMveWJ5bZ+bV2d2C o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2021 19:50:13 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 24 Mar 2021 19:50:12 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id F24C0E3B; Wed, 24 Mar 2021 21:50:11 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/15] Hexagon (target/hexagon) decide if pred has been
 written at TCG gen time
Date: Wed, 24 Mar 2021 21:49:59 -0500
Message-Id: <1616640610-17319-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Multiple writes to the same preg are and'ed together.  Rather than
generating a runtime check, we can determine at TCG generation time
if the predicate has previously been written in the packet.

Test added to tests/tcg/hexagon/misc.c

Address feedback from Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg_funcs.py |  2 +-
 target/hexagon/genptr.c         | 22 +++++++++++++++-------
 target/hexagon/translate.c      |  9 +++++++--
 target/hexagon/translate.h      |  2 ++
 tests/tcg/hexagon/misc.c        | 19 +++++++++++++++++++
 5 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index db9f663..7ceb25b 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -316,7 +316,7 @@ def genptr_dst_write(f, tag, regtype, regid):
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
         if (regid in {"d", "e", "x"}):
-            f.write("    gen_log_pred_write(%s%sN, %s%sV);\n" % \
+            f.write("    gen_log_pred_write(ctx, %s%sN, %s%sV);\n" % \
                 (regtype, regid, regtype, regid))
             f.write("    ctx_log_pred_write(ctx, %s%sN);\n" % \
                 (regtype, regid))
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 349b949..9e9dfd5 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -122,20 +122,28 @@ static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
 #endif
 }
 
-static inline void gen_log_pred_write(int pnum, TCGv val)
+static inline void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val)
 {
     TCGv zero = tcg_const_tl(0);
     TCGv base_val = tcg_temp_new();
     TCGv and_val = tcg_temp_new();
     TCGv pred_written = tcg_temp_new();
 
-    /* Multiple writes to the same preg are and'ed together */
     tcg_gen_andi_tl(base_val, val, 0xff);
-    tcg_gen_and_tl(and_val, base_val, hex_new_pred_value[pnum]);
-    tcg_gen_andi_tl(pred_written, hex_pred_written, 1 << pnum);
-    tcg_gen_movcond_tl(TCG_COND_NE, hex_new_pred_value[pnum],
-                       pred_written, zero,
-                       and_val, base_val);
+
+    /*
+     * Section 6.1.3 of the Hexagon V67 Programmer's Reference Manual
+     *
+     * Multiple writes to the same preg are and'ed together
+     * If this is the first predicate write in the packet, do a
+     * straight assignment.  Otherwise, do an and.
+     */
+    if (!test_bit(pnum, ctx->pregs_written)) {
+        tcg_gen_mov_tl(hex_new_pred_value[pnum], base_val);
+    } else {
+        tcg_gen_and_tl(hex_new_pred_value[pnum],
+                       hex_new_pred_value[pnum], base_val);
+    }
     tcg_gen_ori_tl(hex_pred_written, hex_pred_written, 1 << pnum);
 
     tcg_temp_free(zero);
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 19b9bc7..2d7ec12 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -173,6 +173,7 @@ static void gen_start_packet(DisasContext *ctx, Packet *pkt)
     ctx->reg_log_idx = 0;
     bitmap_zero(ctx->regs_written, TOTAL_PER_THREAD_REGS);
     ctx->preg_log_idx = 0;
+    bitmap_zero(ctx->pregs_written, NUM_PREGS);
     for (i = 0; i < STORES_MAX; i++) {
         ctx->store_width[i] = 0;
     }
@@ -227,7 +228,7 @@ static void mark_implicit_pred_write(DisasContext *ctx, Insn *insn,
     }
 }
 
-static void mark_implicit_writes(DisasContext *ctx, Insn *insn)
+static void mark_implicit_reg_writes(DisasContext *ctx, Insn *insn)
 {
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_FP,  HEX_REG_FP);
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_SP,  HEX_REG_SP);
@@ -236,7 +237,10 @@ static void mark_implicit_writes(DisasContext *ctx, Insn *insn)
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_SA0, HEX_REG_SA0);
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_LC1, HEX_REG_LC1);
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_SA1, HEX_REG_SA1);
+}
 
+static void mark_implicit_pred_writes(DisasContext *ctx, Insn *insn)
+{
     mark_implicit_pred_write(ctx, insn, A_IMPLICIT_WRITES_P0, 0);
     mark_implicit_pred_write(ctx, insn, A_IMPLICIT_WRITES_P1, 1);
     mark_implicit_pred_write(ctx, insn, A_IMPLICIT_WRITES_P2, 2);
@@ -247,8 +251,9 @@ static void gen_insn(CPUHexagonState *env, DisasContext *ctx,
                      Insn *insn, Packet *pkt)
 {
     if (insn->generate) {
-        mark_implicit_writes(ctx, insn);
+        mark_implicit_reg_writes(ctx, insn);
         insn->generate(env, ctx, insn, pkt);
+        mark_implicit_pred_writes(ctx, insn);
     } else {
         gen_exception_end_tb(ctx, HEX_EXCP_INVALID_OPCODE);
     }
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 12506c8..0ecfbd7 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -34,6 +34,7 @@ typedef struct DisasContext {
     DECLARE_BITMAP(regs_written, TOTAL_PER_THREAD_REGS);
     int preg_log[PRED_WRITES_MAX];
     int preg_log_idx;
+    DECLARE_BITMAP(pregs_written, NUM_PREGS);
     uint8_t store_width[STORES_MAX];
     uint8_t s1_store_processed;
 } DisasContext;
@@ -60,6 +61,7 @@ static inline void ctx_log_pred_write(DisasContext *ctx, int pnum)
 {
     ctx->preg_log[ctx->preg_log_idx] = pnum;
     ctx->preg_log_idx++;
+    set_bit(pnum, ctx->pregs_written);
 }
 
 static inline bool is_preloaded(DisasContext *ctx, int num)
diff --git a/tests/tcg/hexagon/misc.c b/tests/tcg/hexagon/misc.c
index 458759f..e5d78b4 100644
--- a/tests/tcg/hexagon/misc.c
+++ b/tests/tcg/hexagon/misc.c
@@ -264,6 +264,22 @@ static long long creg_pair(int x, int y)
     return retval;
 }
 
+/* Check that predicates are auto-and'ed in a packet */
+static int auto_and(void)
+{
+    int retval;
+    asm ("r5 = #1\n\t"
+         "{\n\t"
+         "    p0 = cmp.eq(r1, #1)\n\t"
+         "    p0 = cmp.eq(r1, #2)\n\t"
+         "}\n\t"
+         "%0 = p0\n\t"
+         : "=r"(retval)
+         :
+         : "r5", "p0");
+    return retval;
+}
+
 int main()
 {
 
@@ -375,6 +391,9 @@ int main()
     res = test_clrtnew(2, 7);
     check(res, 7);
 
+    res = auto_and();
+    check(res, 0);
+
     puts(err ? "FAIL" : "PASS");
     return err;
 }
-- 
2.7.4


