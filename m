Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A4A370D6F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:48:02 +0200 (CEST)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDO5-0003FR-64
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKh-0001Ku-MS
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:31 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKf-0005CR-9c
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:31 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so4295466pjh.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exZ7GiFA5pPXMXe8dVROehinsUtAPvg6uCK8aQ+whzU=;
 b=l9Ivhy+I7HMopxHCEcxdD5g1DRpyIyU7d5l5oAi1lH6rmBx4+7gIQgQaqdrD54sOc9
 88dqbKrl4RuHLHgpFBvxXp/7pNYclcRoXL62km5nvPS8Ji5tPWh8dzlu7UzbiINVOtXK
 SdQJsH/lIaXxhrEru1HKZ2Xb/SntDTeM32iNnSc8JTMqDHRHFWEXB1Xr2ovr7M8jEzpu
 4MrPwQmkCbkuqu28bJ8L6evB6ZcuAqXjZ/r2rBL6tioPB4MEtrOjt9Hk+bHbA7XGnPPt
 KQvu+I+j0NAa39udq9rRx3kpJWk8Jig2zVde5lnhYaRqRM5jKlpZ7Wck8xetS3Gqab6a
 JOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exZ7GiFA5pPXMXe8dVROehinsUtAPvg6uCK8aQ+whzU=;
 b=eXmsdXUzwe4yyGadXSlgxz/Qk4PMilVl50qFy3cUQhr38YFDaPR+cO5k1ni56HAUQI
 qd8a+VClZq4ZDgrUTVsxH2RI71OZUTu/KHaQ4VT0p9ir6i01Gm2Ag8tbrB7ROOzkWhS/
 7hvopeU7wL3f/g6/Nh7OKmCMF5bxAEW3vu+6P9oI6kIaaWFGIfjrf9nvAQAoCCEe6yEj
 p6Vu0DG6Aa/PUuW+NcuStpxXEfeE4iydtRe+Dk40Zi9f0tlKR5GBgcAFP+JUpzzdOZLV
 8cjfvqLwP7kIife3ZgWMJWWgkx6N2fvrdRIzxUxXTMFtUXDef+AOWsNO4jyJKLMgtlA6
 rDaQ==
X-Gm-Message-State: AOAM530Ve45sEO+dyrGmVQqb3YF2bm6PBTTMjIpsFvR2br4sx2mSvcI0
 1axbwDAnf/ozQvmQu+kQbo7hi3ztjcNHpQ==
X-Google-Smtp-Source: ABdhPJwWXdJRxjmf8oJYe12pmEq+uiHo+XVYdpqf9ltncTq7Ws4jCzwJxwH45d0hSLeDMCTPFuV8zA==
X-Received: by 2002:a17:902:9b8b:b029:ee:bb74:7d46 with SMTP id
 y11-20020a1709029b8bb02900eebb747d46mr6504618plp.65.1619966667850; 
 Sun, 02 May 2021 07:44:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/31] Hexagon (target/hexagon) decide if pred has been
 written at TCG gen time
Date: Sun,  2 May 2021 07:43:59 -0700
Message-Id: <20210502144419.1659844-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Multiple writes to the same preg are and'ed together.  Rather than
generating a runtime check, we can determine at TCG generation time
if the predicate has previously been written in the packet.

Test added to tests/tcg/hexagon/misc.c

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-7-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.h      |  2 ++
 target/hexagon/genptr.c         | 22 +++++++++++++++-------
 target/hexagon/translate.c      |  9 +++++++--
 tests/tcg/hexagon/misc.c        | 19 +++++++++++++++++++
 target/hexagon/gen_tcg_funcs.py |  2 +-
 5 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 12506c8caf..0ecfbd7d52 100644
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
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 07d970fc6c..6b74344795 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -119,20 +119,28 @@ static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
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
index 9f2a531969..49ec8b76ed 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -172,6 +172,7 @@ static void gen_start_packet(DisasContext *ctx, Packet *pkt)
     ctx->reg_log_idx = 0;
     bitmap_zero(ctx->regs_written, TOTAL_PER_THREAD_REGS);
     ctx->preg_log_idx = 0;
+    bitmap_zero(ctx->pregs_written, NUM_PREGS);
     for (i = 0; i < STORES_MAX; i++) {
         ctx->store_width[i] = 0;
     }
@@ -226,7 +227,7 @@ static void mark_implicit_pred_write(DisasContext *ctx, Insn *insn,
     }
 }
 
-static void mark_implicit_writes(DisasContext *ctx, Insn *insn)
+static void mark_implicit_reg_writes(DisasContext *ctx, Insn *insn)
 {
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_FP,  HEX_REG_FP);
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_SP,  HEX_REG_SP);
@@ -235,7 +236,10 @@ static void mark_implicit_writes(DisasContext *ctx, Insn *insn)
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_SA0, HEX_REG_SA0);
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_LC1, HEX_REG_LC1);
     mark_implicit_reg_write(ctx, insn, A_IMPLICIT_WRITES_SA1, HEX_REG_SA1);
+}
 
+static void mark_implicit_pred_writes(DisasContext *ctx, Insn *insn)
+{
     mark_implicit_pred_write(ctx, insn, A_IMPLICIT_WRITES_P0, 0);
     mark_implicit_pred_write(ctx, insn, A_IMPLICIT_WRITES_P1, 1);
     mark_implicit_pred_write(ctx, insn, A_IMPLICIT_WRITES_P2, 2);
@@ -246,8 +250,9 @@ static void gen_insn(CPUHexagonState *env, DisasContext *ctx,
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
diff --git a/tests/tcg/hexagon/misc.c b/tests/tcg/hexagon/misc.c
index 458759f7b1..e5d78b471f 100644
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
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index db9f663a77..7ceb25b5f6 100755
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
-- 
2.25.1


