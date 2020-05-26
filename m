Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A2B1CB2CD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 17:29:06 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX4vx-0005rl-0Q
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 11:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4lO-00067B-PM
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:18:10 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4lL-00031K-Nd
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:18:10 -0400
Received: by mail-pl1-x641.google.com with SMTP id b8so836856plm.11
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8se14kJpotzBe1gBeAfalsCzpFa61zbk2HVh3S7WLCI=;
 b=mVFlRF9y7AodxJyh9q6F+CtEemS6rE12TjAD5hy1b+RDbrBcyVxtME0Hh8zfQecVIj
 sHRZdu4L2+QYkYzOVax9rtHbq5/VqPRPhI/xpiUjaH4T4kEBiNxzhdsVw0zxL9nFlkAq
 OMxiqi61HHX3PMq5zPmOo9GCzTcaZtYaLaBb2H6FxVyo73JsxVFdHDBu/80vcv/XV5L5
 Jz9GAm0Ct8/FzHtkYVB4AgVjYsVuMKuGRojD0E0KfsJOceKq+ShJM56JdBvbF5EFSpHH
 BeZzMsOWpZi2fG1YboMvihmMFDITE2XTW6NluB6OCpZRw39jxuPCNgamMS2ztrIe/6N+
 HGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8se14kJpotzBe1gBeAfalsCzpFa61zbk2HVh3S7WLCI=;
 b=sgRJ5yknrUdfzXx6RvXkO0GPK+CSmCHAAFqZBZMO7VFq5EyNjm5wftIUFgOY6XhDW9
 dNSmvE2Y1lJY4lsgWyEHqGdJtjIIxsVUcoy5Ax0ALMGCtPaEN0WUc20cfc/QiuBSSwHI
 u3kAXCjss85JUtZ1OAli1WR78hmSjt9jwNzxJqqSSRoTtmrOoEtSWzZDpFdk3p1O9Lrt
 9silI2u/I4+4AL4vHBBONs6bvMQcywZ5JjOvCxg+SxvesMpdAxKPHYNZC8ktVtbt2XOl
 Bey3RTz8/tgCnM3ah6gKbjo1kHFng6JlIArv3KHEStI4fBEzGM5Jot82EMkKrJPR1zlK
 dXwg==
X-Gm-Message-State: AGi0PuZ9UNrSxfZmAAKTLJ74cU0FRUcgXAd/+zg4s0v8hHEnnK1mlhNT
 6VHWNq+IIPNoZMUSVphyBlqUj3nlPOw=
X-Google-Smtp-Source: APiQypJd4g1qFwZEKa3k8f5Pp5x4fOUt20LRkCLq5vck/cAv6IprnJBsAoLUB9JBuleARLjrdrLA9w==
X-Received: by 2002:a17:90a:2323:: with SMTP id
 f32mr6540659pje.139.1588951083583; 
 Fri, 08 May 2020 08:18:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b5sm2125933pfb.190.2020.05.08.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 08:18:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/19] tcg/optimize: Use tcg_constant_internal with
 constant folding
Date: Fri,  8 May 2020 08:17:40 -0700
Message-Id: <20200508151747.6166-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508151747.6166-1-richard.henderson@linaro.org>
References: <20200508151747.6166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 106 ++++++++++++++++++++++---------------------------
 1 file changed, 48 insertions(+), 58 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index d36d7e1d7f..dd5187be31 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -178,37 +178,6 @@ static bool args_are_copies(TCGArg arg1, TCGArg arg2)
     return ts_are_copies(arg_temp(arg1), arg_temp(arg2));
 }
 
-static void tcg_opt_gen_movi(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg val)
-{
-    const TCGOpDef *def;
-    TCGOpcode new_op;
-    tcg_target_ulong mask;
-    TempOptInfo *di = arg_info(dst);
-
-    def = &tcg_op_defs[op->opc];
-    if (def->flags & TCG_OPF_VECTOR) {
-        new_op = INDEX_op_dupi_vec;
-    } else if (def->flags & TCG_OPF_64BIT) {
-        new_op = INDEX_op_movi_i64;
-    } else {
-        new_op = INDEX_op_movi_i32;
-    }
-    op->opc = new_op;
-    /* TCGOP_VECL and TCGOP_VECE remain unchanged.  */
-    op->args[0] = dst;
-    op->args[1] = val;
-
-    reset_temp(dst);
-    di->is_const = true;
-    di->val = val;
-    mask = val;
-    if (TCG_TARGET_REG_BITS > 32 && new_op == INDEX_op_movi_i32) {
-        /* High bits of the destination are now garbage.  */
-        mask |= ~0xffffffffull;
-    }
-    di->mask = mask;
-}
-
 static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
 {
     TCGTemp *dst_ts = arg_temp(dst);
@@ -259,6 +228,27 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     }
 }
 
+static void tcg_opt_gen_movi(TCGContext *s, TCGTempSet *temps_used,
+                             TCGOp *op, TCGArg dst, TCGArg val)
+{
+    const TCGOpDef *def = &tcg_op_defs[op->opc];
+    TCGType type;
+    TCGTemp *tv;
+
+    if (def->flags & TCG_OPF_VECTOR) {
+        type = TCGOP_VECL(op) + TCG_TYPE_V64;
+    } else if (def->flags & TCG_OPF_64BIT) {
+        type = TCG_TYPE_I64;
+    } else {
+        type = TCG_TYPE_I32;
+    }
+
+    /* Convert movi to mov with constant temp. */
+    tv = tcg_constant_internal(type, val);
+    init_ts_info(temps_used, tv);
+    tcg_opt_gen_mov(s, op, dst, temp_arg(tv));
+}
+
 static TCGArg do_constant_folding_2(TCGOpcode op, TCGArg x, TCGArg y)
 {
     uint64_t l64, h64;
@@ -621,7 +611,7 @@ void tcg_optimize(TCGContext *s)
     nb_temps = s->nb_temps;
     nb_globals = s->nb_globals;
 
-    bitmap_zero(temps_used.l, nb_temps);
+    memset(&temps_used, 0, sizeof(temps_used));
     for (i = 0; i < nb_temps; ++i) {
         s->temps[i].state_ptr = NULL;
     }
@@ -727,7 +717,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(rotr):
             if (arg_is_const(op->args[1])
                 && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1050,7 +1040,7 @@ void tcg_optimize(TCGContext *s)
 
         if (partmask == 0) {
             tcg_debug_assert(nb_oargs == 1);
-            tcg_opt_gen_movi(s, op, op->args[0], 0);
+            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
             continue;
         }
         if (affected == 0) {
@@ -1067,7 +1057,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(mulsh):
             if (arg_is_const(op->args[2])
                 && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1094,7 +1084,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
         CASE_OP_32_64_VEC(xor):
             if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1111,14 +1101,14 @@ void tcg_optimize(TCGContext *s)
             break;
         CASE_OP_32_64(movi):
         case INDEX_op_dupi_vec:
-            tcg_opt_gen_movi(s, op, op->args[0], op->args[1]);
+            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], op->args[1]);
             break;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
                 tmp = arg_info(op->args[1])->val;
                 tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1141,7 +1131,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_extrh_i64_i32:
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1171,7 +1161,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1182,7 +1172,7 @@ void tcg_optimize(TCGContext *s)
                 TCGArg v = arg_info(op->args[1])->val;
                 if (v != 0) {
                     tmp = do_constant_folding(opc, v, 0);
-                    tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 } else {
                     tcg_opt_gen_mov(s, op, op->args[0], op->args[2]);
                 }
@@ -1195,7 +1185,7 @@ void tcg_optimize(TCGContext *s)
                 tmp = deposit64(arg_info(op->args[1])->val,
                                 op->args[3], op->args[4],
                                 arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1204,7 +1194,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = extract64(arg_info(op->args[1])->val,
                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1213,7 +1203,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = sextract64(arg_info(op->args[1])->val,
                                  op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1229,7 +1219,7 @@ void tcg_optimize(TCGContext *s)
                     tmp = (int32_t)(((uint32_t)v1 >> op->args[3]) |
                                     ((uint32_t)v2 << (32 - op->args[3])));
                 }
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1238,7 +1228,7 @@ void tcg_optimize(TCGContext *s)
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[3]);
             if (tmp != 2) {
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1248,7 +1238,7 @@ void tcg_optimize(TCGContext *s)
                                            op->args[1], op->args[2]);
             if (tmp != 2) {
                 if (tmp) {
-                    bitmap_zero(temps_used.l, nb_temps);
+                    memset(&temps_used, 0, sizeof(temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[3];
                 } else {
@@ -1293,7 +1283,7 @@ void tcg_optimize(TCGContext *s)
                 uint64_t a = ((uint64_t)ah << 32) | al;
                 uint64_t b = ((uint64_t)bh << 32) | bl;
                 TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_movi_i32);
+                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
 
                 if (opc == INDEX_op_add2_i32) {
                     a += b;
@@ -1303,8 +1293,8 @@ void tcg_optimize(TCGContext *s)
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(s, op2, rh, (int32_t)(a >> 32));
+                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)a);
+                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(a >> 32));
                 break;
             }
             goto do_default;
@@ -1315,12 +1305,12 @@ void tcg_optimize(TCGContext *s)
                 uint32_t b = arg_info(op->args[3])->val;
                 uint64_t r = (uint64_t)a * b;
                 TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_movi_i32);
+                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(s, op2, rh, (int32_t)(r >> 32));
+                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)r);
+                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(r >> 32));
                 break;
             }
             goto do_default;
@@ -1331,7 +1321,7 @@ void tcg_optimize(TCGContext *s)
             if (tmp != 2) {
                 if (tmp) {
             do_brcond_true:
-                    bitmap_zero(temps_used.l, nb_temps);
+                    memset(&temps_used, 0, sizeof(temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[5];
                 } else {
@@ -1347,7 +1337,7 @@ void tcg_optimize(TCGContext *s)
                 /* Simplify LT/GE comparisons vs zero to a single compare
                    vs the high word of the input.  */
             do_brcond_high:
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[0] = op->args[1];
                 op->args[1] = op->args[3];
@@ -1373,7 +1363,7 @@ void tcg_optimize(TCGContext *s)
                     goto do_default;
                 }
             do_brcond_low:
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
@@ -1408,7 +1398,7 @@ void tcg_optimize(TCGContext *s)
                                             op->args[5]);
             if (tmp != 2) {
             do_setcond_const:
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
             } else if ((op->args[5] == TCG_COND_LT
                         || op->args[5] == TCG_COND_GE)
                        && arg_is_const(op->args[3])
@@ -1493,7 +1483,7 @@ void tcg_optimize(TCGContext *s)
                block, otherwise we only trash the output args.  "mask" is
                the non-zero bits mask for the first output arg.  */
             if (def->flags & TCG_OPF_BB_END) {
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
             } else {
         do_reset_output:
                 for (i = 0; i < nb_oargs; i++) {
-- 
2.20.1


