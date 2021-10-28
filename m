Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA743D98E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:53:42 +0200 (CEST)
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvXx-00054y-Eg
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvML-0004XS-Ap
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:41 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMI-00034r-Gl
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:41 -0400
Received: by mail-pf1-x434.google.com with SMTP id f11so4536859pfc.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCiW16Z93Q8GP5qo8+lTmLd72PtlWCvmdkPVOaTAXzA=;
 b=OdAGg41NbDyIKNm2fIDaQpCIB1QG5cw39zdr2kljuVK2pEZR9p65OxMznvT23Btdvo
 0toGwfY5HnlSxucl1mlVjetmvMTX8Yz4XsPT9SGoaEsoihqOL3J5Ge3ryucErREY7IS1
 O4cTM4htf0GLSDZnT1eBKcwX9h+OvQRdJD1amJx1i01v9/YOpjn8D9rDWXyN2B/zRA6o
 vjhm1aEz2HY/absNp11NaEfb5KGeaI7auJhGCpjferJGNXP/NgCwQToR056uXgOQNJ1h
 UogaJsVjQtFRsRKpR2Zpdy6COZ7kAradcAxrXC79uQOIW9O9JkxuUB0hNCFhm4gu1KPp
 oe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CCiW16Z93Q8GP5qo8+lTmLd72PtlWCvmdkPVOaTAXzA=;
 b=DDXTLw0LMo+gMeBUP3mStOFkTbTyNECn1GWN65Oo/W8XWYielGmII1xqYTJy2SLzGT
 +Q+nw1ZZs6EHbNOBH2F4BAzuaKO829dLyO/m58NTa5NWZRLxwzlOp4iCca89nJ2sdrQ/
 cXYYdzbxf2gRUMdZuaYNN/8ejd+AggOOjzVFrAlEmVBlDRcWF1e2DBkAQFx4mDlJ/X9l
 ZAzhmyVav6SuIAIOvNWxFhWYV6zFIujWLWH8RuzINVqEV9JmEJav52mev0y59GMP05+Y
 Pz7E4f0uExe6V6ddBuIMYfZZa0ZnelKB8/IXL1gAabit2rz4kaFw4JQ9sz1rPnK5BiEG
 dYjg==
X-Gm-Message-State: AOAM533OhesU4TIWq97pzk33KyS/dpkD8/h3NnxIPyUIc80Bjsnl+5iF
 ScfF4+6Fa6JXy1QzkwlmFytAzMaS0qfJqQ==
X-Google-Smtp-Source: ABdhPJzwbtVwKDVLmyFLwxrLN3y0wT4JzASC5jn0Sq4qJArx8QiajzjsnfQycKp5s2tkkY0jmRUf3A==
X-Received: by 2002:a05:6a00:1142:b0:47c:2e92:87a0 with SMTP id
 b2-20020a056a00114200b0047c2e9287a0mr1469467pfm.59.1635388897198; 
 Wed, 27 Oct 2021 19:41:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/56] tcg/optimize: Split out OptContext
Date: Wed, 27 Oct 2021 19:40:42 -0700
Message-Id: <20211028024131.1492790-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide what will become a larger context for splitting
the very large tcg_optimize function.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 77 ++++++++++++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 148e360fc6..b76991215e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -44,6 +44,10 @@ typedef struct TempOptInfo {
     uint64_t z_mask;  /* mask bit is 0 if and only if value bit is 0 */
 } TempOptInfo;
 
+typedef struct OptContext {
+    TCGTempSet temps_used;
+} OptContext;
+
 static inline TempOptInfo *ts_info(TCGTemp *ts)
 {
     return ts->state_ptr;
@@ -90,15 +94,15 @@ static void reset_temp(TCGArg arg)
 }
 
 /* Initialize and activate a temporary.  */
-static void init_ts_info(TCGTempSet *temps_used, TCGTemp *ts)
+static void init_ts_info(OptContext *ctx, TCGTemp *ts)
 {
     size_t idx = temp_idx(ts);
     TempOptInfo *ti;
 
-    if (test_bit(idx, temps_used->l)) {
+    if (test_bit(idx, ctx->temps_used.l)) {
         return;
     }
-    set_bit(idx, temps_used->l);
+    set_bit(idx, ctx->temps_used.l);
 
     ti = ts->state_ptr;
     if (ti == NULL) {
@@ -122,9 +126,9 @@ static void init_ts_info(TCGTempSet *temps_used, TCGTemp *ts)
     }
 }
 
-static void init_arg_info(TCGTempSet *temps_used, TCGArg arg)
+static void init_arg_info(OptContext *ctx, TCGArg arg)
 {
-    init_ts_info(temps_used, arg_temp(arg));
+    init_ts_info(ctx, arg_temp(arg));
 }
 
 static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
@@ -229,7 +233,7 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     }
 }
 
-static void tcg_opt_gen_movi(TCGContext *s, TCGTempSet *temps_used,
+static void tcg_opt_gen_movi(TCGContext *s, OptContext *ctx,
                              TCGOp *op, TCGArg dst, uint64_t val)
 {
     const TCGOpDef *def = &tcg_op_defs[op->opc];
@@ -246,7 +250,7 @@ static void tcg_opt_gen_movi(TCGContext *s, TCGTempSet *temps_used,
 
     /* Convert movi to mov with constant temp. */
     tv = tcg_constant_internal(type, val);
-    init_ts_info(temps_used, tv);
+    init_ts_info(ctx, tv);
     tcg_opt_gen_mov(s, op, dst, temp_arg(tv));
 }
 
@@ -605,7 +609,7 @@ void tcg_optimize(TCGContext *s)
 {
     int nb_temps, nb_globals, i;
     TCGOp *op, *op_next, *prev_mb = NULL;
-    TCGTempSet temps_used;
+    OptContext ctx = {};
 
     /* Array VALS has an element for each temp.
        If this temp holds a constant then its value is kept in VALS' element.
@@ -615,7 +619,6 @@ void tcg_optimize(TCGContext *s)
     nb_temps = s->nb_temps;
     nb_globals = s->nb_globals;
 
-    memset(&temps_used, 0, sizeof(temps_used));
     for (i = 0; i < nb_temps; ++i) {
         s->temps[i].state_ptr = NULL;
     }
@@ -634,14 +637,14 @@ void tcg_optimize(TCGContext *s)
             for (i = 0; i < nb_oargs + nb_iargs; i++) {
                 TCGTemp *ts = arg_temp(op->args[i]);
                 if (ts) {
-                    init_ts_info(&temps_used, ts);
+                    init_ts_info(&ctx, ts);
                 }
             }
         } else {
             nb_oargs = def->nb_oargs;
             nb_iargs = def->nb_iargs;
             for (i = 0; i < nb_oargs + nb_iargs; i++) {
-                init_arg_info(&temps_used, op->args[i]);
+                init_arg_info(&ctx, op->args[i]);
             }
         }
 
@@ -720,7 +723,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(rotr):
             if (arg_is_const(op->args[1])
                 && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1085,7 +1088,7 @@ void tcg_optimize(TCGContext *s)
 
         if (partmask == 0) {
             tcg_debug_assert(nb_oargs == 1);
-            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
+            tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
             continue;
         }
         if (affected == 0) {
@@ -1102,7 +1105,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(mulsh):
             if (arg_is_const(op->args[2])
                 && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1129,7 +1132,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
         CASE_OP_32_64_VEC(xor):
             if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1149,7 +1152,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = arg_info(op->args[1])->val;
                 tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1157,7 +1160,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_dup2_vec:
             assert(TCG_TARGET_REG_BITS == 32);
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0],
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0],
                                  deposit64(arg_info(op->args[1])->val, 32, 32,
                                            arg_info(op->args[2])->val));
                 break;
@@ -1183,7 +1186,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_extrh_i64_i32:
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1194,7 +1197,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           op->args[2]);
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1224,7 +1227,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1235,7 +1238,7 @@ void tcg_optimize(TCGContext *s)
                 TCGArg v = arg_info(op->args[1])->val;
                 if (v != 0) {
                     tmp = do_constant_folding(opc, v, 0);
-                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                    tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 } else {
                     tcg_opt_gen_mov(s, op, op->args[0], op->args[2]);
                 }
@@ -1248,7 +1251,7 @@ void tcg_optimize(TCGContext *s)
                 tmp = deposit64(arg_info(op->args[1])->val,
                                 op->args[3], op->args[4],
                                 arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1257,7 +1260,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = extract64(arg_info(op->args[1])->val,
                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1266,7 +1269,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = sextract64(arg_info(op->args[1])->val,
                                  op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1283,7 +1286,7 @@ void tcg_optimize(TCGContext *s)
                     tmp = (int32_t)(((uint32_t)v1 >> shr) |
                                     ((uint32_t)v2 << (32 - shr)));
                 }
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1292,7 +1295,7 @@ void tcg_optimize(TCGContext *s)
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[3]);
             if (tmp != 2) {
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1302,7 +1305,7 @@ void tcg_optimize(TCGContext *s)
                                            op->args[1], op->args[2]);
             if (tmp != 2) {
                 if (tmp) {
-                    memset(&temps_used, 0, sizeof(temps_used));
+                    memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[3];
                 } else {
@@ -1358,8 +1361,8 @@ void tcg_optimize(TCGContext *s)
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(a >> 32));
+                tcg_opt_gen_movi(s, &ctx, op, rl, (int32_t)a);
+                tcg_opt_gen_movi(s, &ctx, op2, rh, (int32_t)(a >> 32));
                 break;
             }
             goto do_default;
@@ -1374,8 +1377,8 @@ void tcg_optimize(TCGContext *s)
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(r >> 32));
+                tcg_opt_gen_movi(s, &ctx, op, rl, (int32_t)r);
+                tcg_opt_gen_movi(s, &ctx, op2, rh, (int32_t)(r >> 32));
                 break;
             }
             goto do_default;
@@ -1386,7 +1389,7 @@ void tcg_optimize(TCGContext *s)
             if (tmp != 2) {
                 if (tmp) {
             do_brcond_true:
-                    memset(&temps_used, 0, sizeof(temps_used));
+                    memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[5];
                 } else {
@@ -1402,7 +1405,7 @@ void tcg_optimize(TCGContext *s)
                 /* Simplify LT/GE comparisons vs zero to a single compare
                    vs the high word of the input.  */
             do_brcond_high:
-                memset(&temps_used, 0, sizeof(temps_used));
+                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[0] = op->args[1];
                 op->args[1] = op->args[3];
@@ -1428,7 +1431,7 @@ void tcg_optimize(TCGContext *s)
                     goto do_default;
                 }
             do_brcond_low:
-                memset(&temps_used, 0, sizeof(temps_used));
+                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
@@ -1463,7 +1466,7 @@ void tcg_optimize(TCGContext *s)
                                             op->args[5]);
             if (tmp != 2) {
             do_setcond_const:
-                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
             } else if ((op->args[5] == TCG_COND_LT
                         || op->args[5] == TCG_COND_GE)
                        && arg_is_const(op->args[3])
@@ -1533,7 +1536,7 @@ void tcg_optimize(TCGContext *s)
             if (!(tcg_call_flags(op)
                   & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
                 for (i = 0; i < nb_globals; i++) {
-                    if (test_bit(i, temps_used.l)) {
+                    if (test_bit(i, ctx.temps_used.l)) {
                         reset_ts(&s->temps[i]);
                     }
                 }
@@ -1548,7 +1551,7 @@ void tcg_optimize(TCGContext *s)
                block, otherwise we only trash the output args.  "z_mask" is
                the non-zero bits mask for the first output arg.  */
             if (def->flags & TCG_OPF_BB_END) {
-                memset(&temps_used, 0, sizeof(temps_used));
+                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
             } else {
         do_reset_output:
                 for (i = 0; i < nb_oargs; i++) {
-- 
2.25.1


