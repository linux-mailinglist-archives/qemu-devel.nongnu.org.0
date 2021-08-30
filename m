Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFB3FB13D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:33:41 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKarP-0001lQ-6u
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj5-0003Y7-5N
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:24:59 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj2-0007OX-Lx
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:24:58 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso9237599pjq.4
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F58SeAxGB7PKULQSwHHCAVlZK8XKIUVE/QzEDGWTyVQ=;
 b=kdBg05Fh53vwLVapq/YArP71nagkqT7L82cPKQqvTrQR2HKYQn3kVK6VC66B78VNKb
 OhPr2dnheYLKXyJ/BKBItuS9CPRdcb/On7BzDIHE3kzHqViwNbHSvvLEZqIKNhXWKs+o
 hpNcpKr7fNwolEJQb7g825yt0bT+7pzbIe0PV3CPrxKg0134ktPmkzzQgJA6zXAvNEmj
 +H6P5asWXbsnWoo1NO4drkAqlUmhbtuUfMGNO+sCXDDsVm5JFCU0/xV4m6c/tv+tSbBe
 CFbkpOcUK+Ak0PIHFbOlNO9EoKR3uyQzcE3UlQCbda55t2c7myVFxwM+SbUnhbaX0DQN
 Rsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F58SeAxGB7PKULQSwHHCAVlZK8XKIUVE/QzEDGWTyVQ=;
 b=jMu6H41Ief80u5fOMNtGu6cDuiMNAcLNNEiUMUBxGj8cz5ImYZkLwwHmnDJXLBfmGz
 DN+0VFH/YZMONM0TUkvwYGpaO/kMadDB8HkrRMoaLI4X2ymyERJfKe6JLFoYsws2T6cP
 wapuq9jH02iaIOepJhg/8pByeMxlBqVkqdlFjSKEoaEki3b6G8uJkiPvjxjz9SNkHvyF
 tCalHimkbgNINznhB7pHUOfVzc9/MERDxwFpSKywKpMiI00LnEK9pcyCgnhXRK0jeTrl
 eqzPRxeIwDG3XGoBbzlryBLADLy9PVCxmvi+HNR+ScrpeZT8Uf0UF/IR8z3V1OMkol38
 6wwg==
X-Gm-Message-State: AOAM533uqZq+xpbIGULMV+zKuFjNWumlDB4kAaEZ4ajCah2Hksps42RY
 1f+545uqe1v3ThG5LtmP9JYmkECR/e8+9A==
X-Google-Smtp-Source: ABdhPJzMSpRBiiE56TJCcWhSxBZt7zwzIUX4OHSyRA6CGyC8l5bapHhjTCAeGqV+ddvxi1Sqbfu2PQ==
X-Received: by 2002:a17:90b:1b44:: with SMTP id
 nv4mr25230135pjb.192.1630304695238; 
 Sun, 29 Aug 2021 23:24:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:24:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/48] tcg/optimize: Remove do_default label
Date: Sun, 29 Aug 2021 23:24:06 -0700
Message-Id: <20210830062451.639572-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Break the final cleanup clause out of the main switch
statement.  When fully folding an opcode to mov/movi,
use "continue" to process the next opcode, else break
to fall into the final cleanup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 190 ++++++++++++++++++++++++-------------------------
 1 file changed, 94 insertions(+), 96 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index bc0e6f14d2..e436be7b48 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1146,16 +1146,16 @@ void tcg_optimize(TCGContext *s)
         switch (opc) {
         CASE_OP_32_64_VEC(mov):
             tcg_opt_gen_mov(s, op, op->args[0], op->args[1]);
-            break;
+            continue;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
                 tmp = arg_info(op->args[1])->val;
                 tmp = dup_const(TCGOP_VECE(op), tmp);
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         case INDEX_op_dup2_vec:
             assert(TCG_TARGET_REG_BITS == 32);
@@ -1163,13 +1163,13 @@ void tcg_optimize(TCGContext *s)
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0],
                                  deposit64(arg_info(op->args[1])->val, 32, 32,
                                            arg_info(op->args[2])->val));
-                break;
+                continue;
             } else if (args_are_copies(op->args[1], op->args[2])) {
                 op->opc = INDEX_op_dup_vec;
                 TCGOP_VECE(op) = MO_32;
                 nb_iargs = 1;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(not):
         CASE_OP_32_64(neg):
@@ -1187,9 +1187,9 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(bswap16):
         CASE_OP_32_64(bswap32):
@@ -1198,9 +1198,9 @@ void tcg_optimize(TCGContext *s)
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           op->args[2]);
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(add):
         CASE_OP_32_64(sub):
@@ -1228,9 +1228,9 @@ void tcg_optimize(TCGContext *s)
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           arg_info(op->args[2])->val);
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(clz):
         CASE_OP_32_64(ctz):
@@ -1242,9 +1242,9 @@ void tcg_optimize(TCGContext *s)
                 } else {
                     tcg_opt_gen_mov(s, op, op->args[0], op->args[2]);
                 }
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(deposit):
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1252,27 +1252,27 @@ void tcg_optimize(TCGContext *s)
                                 op->args[3], op->args[4],
                                 arg_info(op->args[2])->val);
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(extract):
             if (arg_is_const(op->args[1])) {
                 tmp = extract64(arg_info(op->args[1])->val,
                                 op->args[2], op->args[3]);
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(sextract):
             if (arg_is_const(op->args[1])) {
                 tmp = sextract64(arg_info(op->args[1])->val,
                                  op->args[2], op->args[3]);
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(extract2):
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1287,40 +1287,40 @@ void tcg_optimize(TCGContext *s)
                                     ((uint32_t)v2 << (32 - shr)));
                 }
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(setcond):
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[3]);
             if (tmp != 2) {
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(brcond):
             tmp = do_constant_folding_cond(opc, op->args[0],
                                            op->args[1], op->args[2]);
-            if (tmp != 2) {
-                if (tmp) {
-                    memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                    op->opc = INDEX_op_br;
-                    op->args[0] = op->args[3];
-                } else {
-                    tcg_op_remove(s, op);
-                }
+            switch (tmp) {
+            case 0:
+                tcg_op_remove(s, op);
+                continue;
+            case 1:
+                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
+                op->opc = opc = INDEX_op_br;
+                op->args[0] = op->args[3];
                 break;
             }
-            goto do_default;
+            break;
 
         CASE_OP_32_64(movcond):
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[5]);
             if (tmp != 2) {
                 tcg_opt_gen_mov(s, op, op->args[0], op->args[4-tmp]);
-                break;
+                continue;
             }
             if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
                 uint64_t tv = arg_info(op->args[3])->val;
@@ -1330,7 +1330,7 @@ void tcg_optimize(TCGContext *s)
                 if (fv == 1 && tv == 0) {
                     cond = tcg_invert_cond(cond);
                 } else if (!(tv == 1 && fv == 0)) {
-                    goto do_default;
+                    break;
                 }
                 op->args[3] = cond;
                 op->opc = opc = (opc == INDEX_op_movcond_i32
@@ -1338,7 +1338,7 @@ void tcg_optimize(TCGContext *s)
                                  : INDEX_op_setcond_i64);
                 nb_iargs = 2;
             }
-            goto do_default;
+            break;
 
         case INDEX_op_add2_i32:
         case INDEX_op_sub2_i32:
@@ -1363,9 +1363,9 @@ void tcg_optimize(TCGContext *s)
                 rh = op->args[1];
                 tcg_opt_gen_movi(s, &ctx, op, rl, (int32_t)a);
                 tcg_opt_gen_movi(s, &ctx, op2, rh, (int32_t)(a >> 32));
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         case INDEX_op_mulu2_i32:
             if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
@@ -1379,39 +1379,40 @@ void tcg_optimize(TCGContext *s)
                 rh = op->args[1];
                 tcg_opt_gen_movi(s, &ctx, op, rl, (int32_t)r);
                 tcg_opt_gen_movi(s, &ctx, op2, rh, (int32_t)(r >> 32));
-                break;
+                continue;
             }
-            goto do_default;
+            break;
 
         case INDEX_op_brcond2_i32:
             tmp = do_constant_folding_cond2(&op->args[0], &op->args[2],
                                             op->args[4]);
-            if (tmp != 2) {
-                if (tmp) {
-            do_brcond_true:
-                    memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                    op->opc = INDEX_op_br;
-                    op->args[0] = op->args[5];
-                } else {
+            if (tmp == 0) {
             do_brcond_false:
-                    tcg_op_remove(s, op);
-                }
-            } else if ((op->args[4] == TCG_COND_LT
-                        || op->args[4] == TCG_COND_GE)
-                       && arg_is_const(op->args[2])
-                       && arg_info(op->args[2])->val == 0
-                       && arg_is_const(op->args[3])
-                       && arg_info(op->args[3])->val == 0) {
+                tcg_op_remove(s, op);
+                continue;
+            }
+            if (tmp == 1) {
+            do_brcond_true:
+                op->opc = opc = INDEX_op_br;
+                op->args[0] = op->args[5];
+                break;
+            }
+            if ((op->args[4] == TCG_COND_LT || op->args[4] == TCG_COND_GE)
+                 && arg_is_const(op->args[2])
+                 && arg_info(op->args[2])->val == 0
+                 && arg_is_const(op->args[3])
+                 && arg_info(op->args[3])->val == 0) {
                 /* Simplify LT/GE comparisons vs zero to a single compare
                    vs the high word of the input.  */
             do_brcond_high:
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                op->opc = INDEX_op_brcond_i32;
+                op->opc = opc = INDEX_op_brcond_i32;
                 op->args[0] = op->args[1];
                 op->args[1] = op->args[3];
                 op->args[2] = op->args[4];
                 op->args[3] = op->args[5];
-            } else if (op->args[4] == TCG_COND_EQ) {
+                break;
+            }
+            if (op->args[4] == TCG_COND_EQ) {
                 /* Simplify EQ comparisons where one of the pairs
                    can be simplified.  */
                 tmp = do_constant_folding_cond(INDEX_op_brcond_i32,
@@ -1428,7 +1429,7 @@ void tcg_optimize(TCGContext *s)
                 if (tmp == 0) {
                     goto do_brcond_false;
                 } else if (tmp != 1) {
-                    goto do_default;
+                    break;
                 }
             do_brcond_low:
                 memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
@@ -1436,7 +1437,9 @@ void tcg_optimize(TCGContext *s)
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
                 op->args[3] = op->args[5];
-            } else if (op->args[4] == TCG_COND_NE) {
+                break;
+            }
+            if (op->args[4] == TCG_COND_NE) {
                 /* Simplify NE comparisons where one of the pairs
                    can be simplified.  */
                 tmp = do_constant_folding_cond(INDEX_op_brcond_i32,
@@ -1455,9 +1458,6 @@ void tcg_optimize(TCGContext *s)
                 } else if (tmp == 1) {
                     goto do_brcond_true;
                 }
-                goto do_default;
-            } else {
-                goto do_default;
             }
             break;
 
@@ -1467,12 +1467,13 @@ void tcg_optimize(TCGContext *s)
             if (tmp != 2) {
             do_setcond_const:
                 tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
-            } else if ((op->args[5] == TCG_COND_LT
-                        || op->args[5] == TCG_COND_GE)
-                       && arg_is_const(op->args[3])
-                       && arg_info(op->args[3])->val == 0
-                       && arg_is_const(op->args[4])
-                       && arg_info(op->args[4])->val == 0) {
+                continue;
+            }
+            if ((op->args[5] == TCG_COND_LT || op->args[5] == TCG_COND_GE)
+                 && arg_is_const(op->args[3])
+                 && arg_info(op->args[3])->val == 0
+                 && arg_is_const(op->args[4])
+                 && arg_info(op->args[4])->val == 0) {
                 /* Simplify LT/GE comparisons vs zero to a single compare
                    vs the high word of the input.  */
             do_setcond_high:
@@ -1482,7 +1483,9 @@ void tcg_optimize(TCGContext *s)
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
                 op->args[3] = op->args[5];
-            } else if (op->args[5] == TCG_COND_EQ) {
+                break;
+            }
+            if (op->args[5] == TCG_COND_EQ) {
                 /* Simplify EQ comparisons where one of the pairs
                    can be simplified.  */
                 tmp = do_constant_folding_cond(INDEX_op_setcond_i32,
@@ -1499,7 +1502,7 @@ void tcg_optimize(TCGContext *s)
                 if (tmp == 0) {
                     goto do_setcond_high;
                 } else if (tmp != 1) {
-                    goto do_default;
+                    break;
                 }
             do_setcond_low:
                 reset_temp(op->args[0]);
@@ -1507,7 +1510,9 @@ void tcg_optimize(TCGContext *s)
                 op->opc = INDEX_op_setcond_i32;
                 op->args[2] = op->args[3];
                 op->args[3] = op->args[5];
-            } else if (op->args[5] == TCG_COND_NE) {
+                break;
+            }
+            if (op->args[5] == TCG_COND_NE) {
                 /* Simplify NE comparisons where one of the pairs
                    can be simplified.  */
                 tmp = do_constant_folding_cond(INDEX_op_setcond_i32,
@@ -1526,14 +1531,21 @@ void tcg_optimize(TCGContext *s)
                 } else if (tmp == 1) {
                     goto do_setcond_const;
                 }
-                goto do_default;
-            } else {
-                goto do_default;
             }
             break;
 
-        case INDEX_op_call:
-            if (!(tcg_call_flags(op)
+        default:
+            break;
+        }
+
+        /* Some of the folding above can change opc. */
+        opc = op->opc;
+        def = &tcg_op_defs[opc];
+        if (def->flags & TCG_OPF_BB_END) {
+            memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
+        } else {
+            if (opc == INDEX_op_call &&
+                !(tcg_call_flags(op)
                   & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
                 for (i = 0; i < nb_globals; i++) {
                     if (test_bit(i, ctx.temps_used.l)) {
@@ -1541,29 +1553,15 @@ void tcg_optimize(TCGContext *s)
                     }
                 }
             }
-            goto do_reset_output;
 
-        default:
-        do_default:
-            /* Default case: we know nothing about operation (or were unable
-               to compute the operation result) so no propagation is done.
-               We trash everything if the operation is the end of a basic
-               block, otherwise we only trash the output args.  "z_mask" is
-               the non-zero bits mask for the first output arg.  */
-            if (def->flags & TCG_OPF_BB_END) {
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-            } else {
-        do_reset_output:
-                for (i = 0; i < nb_oargs; i++) {
-                    reset_temp(op->args[i]);
-                    /* Save the corresponding known-zero bits mask for the
-                       first output argument (only one supported so far). */
-                    if (i == 0) {
-                        arg_info(op->args[i])->z_mask = z_mask;
-                    }
+            for (i = 0; i < nb_oargs; i++) {
+                reset_temp(op->args[i]);
+                /* Save the corresponding known-zero bits mask for the
+                   first output argument (only one supported so far). */
+                if (i == 0) {
+                    arg_info(op->args[i])->z_mask = z_mask;
                 }
             }
-            break;
         }
 
         /* Eliminate duplicate and redundant fence instructions.  */
-- 
2.25.1


