Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB26AB3BE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyup-0006r6-5z; Sun, 05 Mar 2023 19:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyu2-0004XH-V5
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:35 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytz-0006sb-Kf
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:34 -0500
Received: by mail-pl1-x642.google.com with SMTP id n6so8512861plf.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0egupEKuwVTnq48SO6j/Sjs8tYxcPPG7fR/ZqojonA4=;
 b=u98Mj6W8Y4yUnA6PwasfqnqMBLAgCGs3HYujkYwtQ7rg2fL8/M+5P/WyE0UbvLKmaC
 AU6r9xjM0qJag3Vr+PVkE9ejTJaP2Zxogxgml40RFV8NDjD+feSORsfttPkxppEDvYsZ
 mrq5CJO/vTDb9uri75FCdv/f9MnN+I+YLTNYuvzmQAYWv+M7LPhBIR7JDmgTWXEokCtu
 kUnVksPyupBFoECr+lDAm5+x7lCk9LvlCoi+gaSTu/V5tKnRwN8Um/h/xekK+V6sWRtS
 23smZ+Zu3pPD+/yL/Rt0uUzqJn4h+gkoQiGSle3mJo87rwOKI+nbLUdP1ljFKT7drhQH
 M1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0egupEKuwVTnq48SO6j/Sjs8tYxcPPG7fR/ZqojonA4=;
 b=10K7yynj+IdOw5F3vv+0tbPggJvME9FwWzHMDsdoPpF3o6s54LVqsyZJk6ecsM+ovo
 4seQOOQdzCnOTIWUQvTNh35VLcLxzxfqzqKF42gDKT5GACqsb80GRFFzYH12cS4LiMvU
 sROvOtMEwfL7+Sm5NqveggbhKTrZpn//IvHzpuOcgoKs+EDeOcAi4/IccTG+RSJPfbke
 aZ5fTxF4YalDYOD+mhu1460SJtppNna2sRu4/0HfI858fJ6Og2xv/ADjd7CQJ6dOlc3n
 BtK4CmVbwnNuJU9Vi5asgl65Saht3KqbCvpNxTdFyFAoVSDKhVLGeayUIzeJ2G2JjPUX
 9UvA==
X-Gm-Message-State: AO0yUKVRmhHxshfFTMrAr/yWfc2DNsbplRFNEHuuhzgjZEt+E1ZllCEU
 SK6wisw0FTcCmSYp+O7YAdc3sHBm1iO3NgGSkVgXkk0/
X-Google-Smtp-Source: AK7set+eesKM8usq3dTTCExnPC5F1k+NSG8Gd1O1Qvlr1wXGxQJuk+thGnZysZbZQemiPQtj7bX3Fw==
X-Received: by 2002:a17:90a:fb0e:b0:234:13a3:6e67 with SMTP id
 it14-20020a17090afb0e00b0023413a36e67mr9760697pjb.12.1678063229862; 
 Sun, 05 Mar 2023 16:40:29 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 38/84] target/hexagon/idef-parser: Drop tcg_temp_free
Date: Sun,  5 Mar 2023 16:39:08 -0800
Message-Id: <20230306003954.1866998-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries.
This removes gen_rvalue_free, gen_rvalue_free_manual and
free_variables, whose only purpose was to emit tcg_temp_free.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/README.rst       |   8 --
 target/hexagon/idef-parser/parser-helpers.h |   4 -
 target/hexagon/idef-parser/parser-helpers.c | 142 --------------------
 target/hexagon/idef-parser/idef-parser.y    |  10 --
 4 files changed, 164 deletions(-)

diff --git a/target/hexagon/idef-parser/README.rst b/target/hexagon/idef-parser/README.rst
index c230fec124..debeddfde5 100644
--- a/target/hexagon/idef-parser/README.rst
+++ b/target/hexagon/idef-parser/README.rst
@@ -31,7 +31,6 @@ idef-parser will compile the above code into the following code:
        TCGv_i32 tmp_0 = tcg_temp_new_i32();
        tcg_gen_add_i32(tmp_0, RsV, RtV);
        tcg_gen_mov_i32(RdV, tmp_0);
-       tcg_temp_free_i32(tmp_0);
    }
 
 The output of the compilation process will be a function, containing the
@@ -102,12 +101,6 @@ The result of the addition is now stored in the temporary, we move it into the
 correct destination register. This code may seem inefficient, but QEMU will
 perform some optimizations on the tinycode, reducing the unnecessary copy.
 
-::
-
-   tcg_temp_free_i32(tmp_0);
-
-Finally, we free the temporary we used to hold the addition result.
-
 Parser Input
 ------------
 
@@ -524,7 +517,6 @@ instruction,
         TCGv_i32 tmp_0 = tcg_temp_new_i32();
         tcg_gen_add_i32(tmp_0, RsV, RsV);
         tcg_gen_mov_i32(RdV, tmp_0);
-        tcg_temp_free_i32(tmp_0);
     }
 
 Here the bug, albeit hard to spot, is in ``tcg_gen_add_i32(tmp_0, RsV, RsV);``
diff --git a/target/hexagon/idef-parser/parser-helpers.h b/target/hexagon/idef-parser/parser-helpers.h
index 2766296417..4c89498f5b 100644
--- a/target/hexagon/idef-parser/parser-helpers.h
+++ b/target/hexagon/idef-parser/parser-helpers.h
@@ -169,8 +169,6 @@ HexValue gen_imm_value(Context *c __attribute__((unused)),
 HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
                           HexSignedness signedness);
 
-void gen_rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue);
-
 HexValue rvalue_materialize(Context *c, YYLTYPE *locp, HexValue *rvalue);
 
 HexValue gen_rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue);
@@ -365,8 +363,6 @@ void emit_footer(Context *c);
 
 void track_string(Context *c, GString *s);
 
-void free_variables(Context *c, YYLTYPE *locp);
-
 void free_instruction(Context *c);
 
 void assert_signedness(Context *c,
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 3025040640..bdbb8b6a5f 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -398,25 +398,10 @@ HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
     return rvalue;
 }
 
-void gen_rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue)
-{
-    if (rvalue->type == TEMP && !rvalue->is_manual) {
-        const char *bit_suffix = (rvalue->bit_width == 64) ? "i64" : "i32";
-        OUT(c, locp, "tcg_temp_free_", bit_suffix, "(", rvalue, ");\n");
-    }
-}
-
-static void gen_rvalue_free_manual(Context *c, YYLTYPE *locp, HexValue *rvalue)
-{
-    rvalue->is_manual = false;
-    gen_rvalue_free(c, locp, rvalue);
-}
-
 HexValue rvalue_materialize(Context *c, YYLTYPE *locp, HexValue *rvalue)
 {
     if (rvalue->type == IMMEDIATE) {
         HexValue res = gen_tmp_value_from_imm(c, locp, rvalue);
-        gen_rvalue_free(c, locp, rvalue);
         return res;
     }
     return *rvalue;
@@ -445,7 +430,6 @@ HexValue gen_rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue)
         const char *sign_suffix = is_unsigned ? "u" : "";
         OUT(c, locp, "tcg_gen_ext", sign_suffix,
             "_i32_i64(", &res, ", ", rvalue, ");\n");
-        gen_rvalue_free(c, locp, rvalue);
         return res;
     }
 }
@@ -460,7 +444,6 @@ HexValue gen_rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue)
         if (rvalue->bit_width == 64) {
             HexValue res = gen_tmp(c, locp, 32, rvalue->signedness);
             OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", rvalue, ");\n");
-            gen_rvalue_free(c, locp, rvalue);
             return res;
         }
     }
@@ -587,11 +570,6 @@ HexValue gen_bin_cmp(Context *c,
         fprintf(stderr, "Error in evalutating immediateness!");
         abort();
     }
-
-    /* Free operands */
-    gen_rvalue_free(c, locp, &op1_m);
-    gen_rvalue_free(c, locp, &op2_m);
-
     return res;
 }
 
@@ -627,8 +605,6 @@ static void gen_simple_op(Context *c, YYLTYPE *locp, unsigned bit_width,
             "(", res, ", ", op1, ", ", op2, ");\n");
         break;
     }
-    gen_rvalue_free(c, locp, op1);
-    gen_rvalue_free(c, locp, op2);
 }
 
 static void gen_sub_op(Context *c, YYLTYPE *locp, unsigned bit_width,
@@ -658,8 +634,6 @@ static void gen_sub_op(Context *c, YYLTYPE *locp, unsigned bit_width,
             "(", res, ", ", op1, ", ", op2, ");\n");
     } break;
     }
-    gen_rvalue_free(c, locp, op1);
-    gen_rvalue_free(c, locp, op2);
 }
 
 static void gen_asl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
@@ -711,10 +685,7 @@ static void gen_asl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
         OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
         OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2_m, ", ", &edge);
         OUT(c, locp, ", ", &zero, ", ", res, ");\n");
-        gen_rvalue_free(c, locp, &edge);
     }
-    gen_rvalue_free(c, locp, &op1_m);
-    gen_rvalue_free(c, locp, &op2_m);
 }
 
 static void gen_asr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
@@ -769,11 +740,7 @@ static void gen_asr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
         OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
         OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2_m, ", ", &edge);
         OUT(c, locp, ", ", &tmp, ", ", res, ");\n");
-        gen_rvalue_free(c, locp, &edge);
-        gen_rvalue_free(c, locp, &tmp);
     }
-    gen_rvalue_free(c, locp, &op1_m);
-    gen_rvalue_free(c, locp, &op2_m);
 }
 
 static void gen_lsr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
@@ -815,10 +782,7 @@ static void gen_lsr_op(Context *c, YYLTYPE *locp, unsigned bit_width,
         OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
         OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2_m, ", ", &edge);
         OUT(c, locp, ", ", &zero, ", ", res, ");\n");
-        gen_rvalue_free(c, locp, &edge);
     }
-    gen_rvalue_free(c, locp, &op1_m);
-    gen_rvalue_free(c, locp, &op2_m);
 }
 
 /*
@@ -847,9 +811,6 @@ static void gen_andl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
         tmp2 = gen_bin_cmp(c, locp, TCG_COND_NE, op2, &zero);
         OUT(c, locp, "tcg_gen_and_", bit_suffix,
             "(", res, ", ", &tmp1, ", ", &tmp2, ");\n");
-        gen_rvalue_free_manual(c, locp, &zero);
-        gen_rvalue_free(c, locp, &tmp1);
-        gen_rvalue_free(c, locp, &tmp2);
         break;
     }
 }
@@ -892,8 +853,6 @@ static void gen_minmax_op(Context *c, YYLTYPE *locp, unsigned bit_width,
         OUT(c, locp, res, ", ", op1, ", ", &op2_m, ");\n");
         break;
     }
-    gen_rvalue_free(c, locp, &op1_m);
-    gen_rvalue_free(c, locp, &op2_m);
 }
 
 /* Code generation functions */
@@ -1055,7 +1014,6 @@ HexValue gen_cast_op(Context *c,
                     &res, ", ", src, ");\n");
             }
         }
-        gen_rvalue_free(c, locp, src);
         return res;
     }
 }
@@ -1115,8 +1073,6 @@ static HexValue gen_extend_imm_width_op(Context *c,
         if (need_guarding) {
             OUT(c, locp, "}\n");
         }
-
-        gen_rvalue_free(c, locp, value);
         return res;
     } else {
         /*
@@ -1141,8 +1097,6 @@ static HexValue gen_extend_imm_width_op(Context *c,
                 ", 0);\n");
             OUT(c, locp, "}\n");
         }
-
-        gen_rvalue_free(c, locp, value);
         return res;
     }
 }
@@ -1182,7 +1136,6 @@ static HexValue gen_extend_tcg_width_op(Context *c,
             &mask, ", ", &mask, ", ", &shift, ");\n");
         OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
             &res, ", ", value, ", ", &mask, ");\n");
-        gen_rvalue_free(c, locp, &mask);
     } else {
         OUT(c, locp, "tcg_gen_shl_i", &dst_width, "(",
             &res, ", ", value, ", ", &shift, ");\n");
@@ -1194,10 +1147,6 @@ static HexValue gen_extend_tcg_width_op(Context *c,
     OUT(c, locp, &src_width_m, ", ", &zero, ", ", &zero, ", ", &res,
         ");\n");
 
-    gen_rvalue_free(c, locp, &src_width_m);
-    gen_rvalue_free(c, locp, value);
-    gen_rvalue_free(c, locp, &shift);
-
     return res;
 }
 
@@ -1316,9 +1265,6 @@ void gen_rdeposit_op(Context *c,
         dst);
     OUT(c, locp, ", ", &width_m, ", ", &zero, ", ", &res, ", ", dst,
         ");\n");
-
-    gen_rvalue_free(c, locp, width);
-    gen_rvalue_free(c, locp, &res);
 }
 
 void gen_deposit_op(Context *c,
@@ -1352,8 +1298,6 @@ void gen_deposit_op(Context *c,
     value_m = rvalue_materialize(c, locp, &value_m);
     OUT(c, locp, "tcg_gen_deposit_i", &bit_width, "(", dst, ", ", dst, ", ");
     OUT(c, locp, &value_m, ", ", index, " * ", &width, ", ", &width, ");\n");
-    gen_rvalue_free(c, locp, index);
-    gen_rvalue_free(c, locp, &value_m);
 }
 
 HexValue gen_rextract_op(Context *c,
@@ -1366,7 +1310,6 @@ HexValue gen_rextract_op(Context *c,
     HexValue res = gen_tmp(c, locp, bit_width, UNSIGNED);
     OUT(c, locp, "tcg_gen_extract_i", &bit_width, "(", &res);
     OUT(c, locp, ", ", src, ", ", &begin, ", ", &width, ");\n");
-    gen_rvalue_free(c, locp, src);
     return res;
 }
 
@@ -1399,12 +1342,8 @@ HexValue gen_extract_op(Context *c,
         const char *sign_suffix = (extract->signedness == UNSIGNED) ? "u" : "";
         OUT(c, locp, "tcg_gen_ext", sign_suffix, "_i32_i64(",
             &tmp, ", ", &res, ");\n");
-        gen_rvalue_free(c, locp, &res);
         res = tmp;
     }
-
-    gen_rvalue_free(c, locp, src);
-    gen_rvalue_free(c, locp, index);
     return res;
 }
 
@@ -1422,8 +1361,6 @@ void gen_write_reg(Context *c, YYLTYPE *locp, HexValue *reg, HexValue *value)
         locp,
         "ctx_log_reg_write(ctx, ", &reg->reg.id,
         ");\n");
-    gen_rvalue_free(c, locp, reg);
-    gen_rvalue_free(c, locp, &value_m);
 }
 
 void gen_assign(Context *c,
@@ -1458,8 +1395,6 @@ void gen_assign(Context *c,
     const char *imm_suffix = (value_m.type == IMMEDIATE) ? "i" : "";
     OUT(c, locp, "tcg_gen_mov", imm_suffix, "_i", &bit_width,
         "(", dst, ", ", &value_m, ");\n");
-
-    gen_rvalue_free(c, locp, &value_m);
 }
 
 HexValue gen_convround(Context *c,
@@ -1484,12 +1419,6 @@ HexValue gen_convround(Context *c,
     OUT(c, locp, ", ", &and, ", ", &mask, ", ");
     OUT(c, locp, &src_p1, ", ", &src_m, ");\n");
 
-    /* Free src but use the original `is_manual` value */
-    gen_rvalue_free(c, locp, src);
-
-    /* Free the rest of the values */
-    gen_rvalue_free(c, locp, &src_p1);
-
     return res;
 }
 
@@ -1515,9 +1444,6 @@ static HexValue gen_convround_n_b(Context *c,
     OUT(c, locp, "tcg_gen_add_i64(", &res);
     OUT(c, locp, ", ", &res, ", ", &tmp_64, ");\n");
 
-    gen_rvalue_free(c, locp, &tmp);
-    gen_rvalue_free(c, locp, &tmp_64);
-
     return res;
 }
 
@@ -1540,10 +1466,6 @@ static HexValue gen_convround_n_c(Context *c,
     OUT(c, locp, "tcg_gen_add_i64(", &res);
     OUT(c, locp, ", ", &res, ", ", &tmp_64, ");\n");
 
-    gen_rvalue_free(c, locp, &one);
-    gen_rvalue_free(c, locp, &tmp);
-    gen_rvalue_free(c, locp, &tmp_64);
-
     return res;
 }
 
@@ -1614,18 +1536,6 @@ HexValue gen_convround_n(Context *c,
     OUT(c, locp, "tcg_gen_shr_i64(", &res);
     OUT(c, locp, ", ", &res, ", ", &n_64, ");\n");
 
-    gen_rvalue_free(c, locp, &src_casted);
-    gen_rvalue_free(c, locp, &pos_casted);
-
-    gen_rvalue_free(c, locp, &r1);
-    gen_rvalue_free(c, locp, &r2);
-    gen_rvalue_free(c, locp, &r3);
-
-    gen_rvalue_free(c, locp, &cond);
-    gen_rvalue_free(c, locp, &cond_64);
-    gen_rvalue_free(c, locp, &mask);
-    gen_rvalue_free(c, locp, &n_64);
-
     res = gen_rvalue_truncate(c, locp, &res);
     return res;
 }
@@ -1671,10 +1581,6 @@ HexValue gen_round(Context *c,
     OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &b, ", ", &zero);
     OUT(c, locp, ", ", &a, ", ", &sum, ");\n");
 
-    gen_rvalue_free_manual(c, locp, &a);
-    gen_rvalue_free_manual(c, locp, &b);
-    gen_rvalue_free(c, locp, &sum);
-
     return res;
 }
 
@@ -1700,9 +1606,6 @@ void gen_circ_op(Context *c,
         ", ",
         modifier);
     OUT(c, locp, ", ", &cs, ");\n");
-    gen_rvalue_free(c, locp, &increment_m);
-    gen_rvalue_free(c, locp, modifier);
-    gen_rvalue_free(c, locp, &cs);
 }
 
 HexValue gen_locnt_op(Context *c, YYLTYPE *locp, HexValue *src)
@@ -1718,7 +1621,6 @@ HexValue gen_locnt_op(Context *c, YYLTYPE *locp, HexValue *src)
         &res, ", ", &src_m, ");\n");
     OUT(c, locp, "tcg_gen_clzi_i", bit_suffix, "(", &res, ", ", &res, ", ");
     OUT(c, locp, bit_suffix, ");\n");
-    gen_rvalue_free(c, locp, &src_m);
     return res;
 }
 
@@ -1732,7 +1634,6 @@ HexValue gen_ctpop_op(Context *c, YYLTYPE *locp, HexValue *src)
     src_m = rvalue_materialize(c, locp, &src_m);
     OUT(c, locp, "tcg_gen_ctpop_i", bit_suffix,
         "(", &res, ", ", &src_m, ");\n");
-    gen_rvalue_free(c, locp, &src_m);
     return res;
 }
 
@@ -1751,8 +1652,6 @@ HexValue gen_rotl(Context *c, YYLTYPE *locp, HexValue *src, HexValue *width)
     amount = rvalue_materialize(c, locp, &amount);
     OUT(c, locp, "tcg_gen_rotl_", suffix, "(",
         &res, ", ", src, ", ", &amount, ");\n");
-    gen_rvalue_free(c, locp, src);
-    gen_rvalue_free(c, locp, &amount);
 
     return res;
 }
@@ -1777,10 +1676,6 @@ HexValue gen_carry_from_add(Context *c,
     OUT(c, locp, "tcg_gen_add2_i64(", &res, ", ", &cf, ", ", &res, ", ", &cf);
     OUT(c, locp, ", ", &op2_m, ", ", &zero, ");\n");
 
-    gen_rvalue_free(c, locp, &op1_m);
-    gen_rvalue_free(c, locp, &op2_m);
-    gen_rvalue_free(c, locp, &op3_m);
-    gen_rvalue_free(c, locp, &res);
     return cf;
 }
 
@@ -1845,7 +1740,6 @@ void gen_inst_code(Context *c, YYLTYPE *locp)
                 c->inst.name->str,
                 c->inst.error_count);
     } else {
-        free_variables(c, locp);
         c->implemented_insn++;
         fprintf(c->enabled_file, "%s\n", c->inst.name->str);
         emit_footer(c);
@@ -1875,10 +1769,7 @@ void gen_pred_assign(Context *c, YYLTYPE *locp, HexValue *left_pred,
         OUT(c, locp, "gen_log_pred_write(ctx, ", pred_id, ", ", left_pred,
             ");\n");
         OUT(c, locp, "ctx_log_pred_write(ctx, ", pred_id, ");\n");
-        gen_rvalue_free(c, locp, left_pred);
     }
-    /* Free temporary value */
-    gen_rvalue_free(c, locp, &r);
 }
 
 void gen_cancel(Context *c, YYLTYPE *locp)
@@ -1928,8 +1819,6 @@ void gen_load(Context *c, YYLTYPE *locp, HexValue *width,
         OUT(c, locp, "(TCGv) ");
     }
     OUT(c, locp, dst, ", ", ea, ", ctx->mem_idx);\n");
-    /* If the var in EA was truncated it is now a tmp HexValue, so free it. */
-    gen_rvalue_free(c, locp, ea);
 }
 
 void gen_store(Context *c, YYLTYPE *locp, HexValue *width, HexValue *ea,
@@ -1943,9 +1832,6 @@ void gen_store(Context *c, YYLTYPE *locp, HexValue *width, HexValue *ea,
     src_m = rvalue_materialize(c, locp, &src_m);
     OUT(c, locp, "gen_store", &mem_width, "(cpu_env, ", ea, ", ", &src_m);
     OUT(c, locp, ", insn->slot);\n");
-    gen_rvalue_free(c, locp, &src_m);
-    /* If the var in ea was truncated it is now a tmp HexValue, so free it. */
-    gen_rvalue_free(c, locp, ea);
 }
 
 void gen_sethalf(Context *c, YYLTYPE *locp, HexCast *sh, HexValue *n,
@@ -1982,11 +1868,6 @@ void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
     OUT(c, locp, "tcg_gen_deposit_i32(", dst, ", ", dst,
         ", ", &tmp, ", ");
     OUT(c, locp, lo, ", ", &len, ");\n");
-
-    gen_rvalue_free(c, locp, &tmp);
-    gen_rvalue_free(c, locp, hi);
-    gen_rvalue_free(c, locp, lo);
-    gen_rvalue_free(c, locp, value);
 }
 
 unsigned gen_if_cond(Context *c, YYLTYPE *locp, HexValue *cond)
@@ -1999,7 +1880,6 @@ unsigned gen_if_cond(Context *c, YYLTYPE *locp, HexValue *cond)
     bit_suffix = (cond->bit_width == 64) ? "i64" : "i32";
     OUT(c, locp, "tcg_gen_brcondi_", bit_suffix, "(TCG_COND_EQ, ", cond,
         ", 0, if_label_", &c->inst.if_count, ");\n");
-    gen_rvalue_free(c, locp, cond);
     return c->inst.if_count++;
 }
 
@@ -2090,7 +1970,6 @@ static inline HexValue gen_rvalue_simple_unary(Context *c, YYLTYPE *locp,
         res = gen_tmp(c, locp, bit_width, value->signedness);
         OUT(c, locp, tcg_code, "_i", &bit_width, "(", &res, ", ", value,
             ");\n");
-        gen_rvalue_free(c, locp, value);
     }
     return res;
 }
@@ -2116,7 +1995,6 @@ HexValue gen_rvalue_notl(Context *c, YYLTYPE *locp, HexValue *value)
         OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
         OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", value, ", ", &zero);
         OUT(c, locp, ", ", &one, ", ", &zero, ");\n");
-        gen_rvalue_free(c, locp, value);
     }
     return res;
 }
@@ -2147,7 +2025,6 @@ HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat,
     OUT(c, locp, &ovfl, ", ", &res, ", ", value, ", ", &width->imm.value,
         ");\n");
     OUT(c, locp, "gen_set_usr_field_if(USR_OVF,", &ovfl, ");\n");
-    gen_rvalue_free(c, locp, value);
 
     return res;
 }
@@ -2162,9 +2039,6 @@ HexValue gen_rvalue_fscr(Context *c, YYLTYPE *locp, HexValue *value)
     OUT(c, locp, "tcg_gen_concat_i32_i64(",
         &key, ", ", &frame_key, ", ", &frame_key, ");\n");
     OUT(c, locp, "tcg_gen_xor_i64(", &res, ", ", value, ", ", &key, ");\n");
-    gen_rvalue_free(c, locp, &key);
-    gen_rvalue_free(c, locp, &frame_key);
-    gen_rvalue_free(c, locp, value);
     return res;
 }
 
@@ -2186,7 +2060,6 @@ HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *value)
     res = gen_tmp(c, locp, value->bit_width, value->signedness);
     *value = rvalue_materialize(c, locp, value);
     OUT(c, locp, "gen_helper_fbrev(", &res, ", ", value, ");\n");
-    gen_rvalue_free(c, locp, value);
     return res;
 }
 
@@ -2198,7 +2071,6 @@ HexValue gen_rvalue_ternary(Context *c, YYLTYPE *locp, HexValue *cond,
     unsigned bit_width = (is_64bit) ? 64 : 32;
     HexValue zero = gen_constant(c, locp, "0", bit_width, UNSIGNED);
     HexValue res = gen_tmp(c, locp, bit_width, UNSIGNED);
-    Ternary *ternary = NULL;
 
     if (is_64bit) {
         *cond = gen_rvalue_extend(c, locp, cond);
@@ -2216,13 +2088,8 @@ HexValue gen_rvalue_ternary(Context *c, YYLTYPE *locp, HexValue *cond,
     OUT(c, locp, ", ", true_branch, ", ", false_branch, ");\n");
 
     assert(c->ternary->len > 0);
-    ternary = &g_array_index(c->ternary, Ternary, c->ternary->len - 1);
-    gen_rvalue_free_manual(c, locp, &ternary->cond);
     g_array_remove_index(c->ternary, c->ternary->len - 1);
 
-    gen_rvalue_free(c, locp, cond);
-    gen_rvalue_free(c, locp, true_branch);
-    gen_rvalue_free(c, locp, false_branch);
     return res;
 }
 
@@ -2301,15 +2168,6 @@ void track_string(Context *c, GString *s)
     g_array_append_val(c->inst.strings, s);
 }
 
-void free_variables(Context *c, YYLTYPE *locp)
-{
-    for (unsigned i = 0; i < c->inst.allocated->len; ++i) {
-        Var *var = &g_array_index(c->inst.allocated, Var, i);
-        const char *suffix = var->bit_width == 64 ? "i64" : "i32";
-        OUT(c, locp, "tcg_temp_free_", suffix, "(", var->name->str, ");\n");
-    }
-}
-
 void free_instruction(Context *c)
 {
     assert(!is_inside_ternary(c));
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index c14cb39500..59c93f85b4 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -269,9 +269,6 @@ statements : statements statement
 statement : control_statement
           | var_decl ';'
           | rvalue ';'
-            {
-                gen_rvalue_free(c, &@1, &$1);
-            }
           | code_block
           | ';'
           ;
@@ -347,7 +344,6 @@ assign_statement : lvalue '=' rvalue
                        $3 = gen_rvalue_truncate(c, &@1, &$3);
                        $3 = rvalue_materialize(c, &@1, &$3);
                        OUT(c, &@1, "gen_write_new_pc(", &$3, ");\n");
-                       gen_rvalue_free(c, &@1, &$3); /* Free temporary value */
                    }
                  | LOAD '(' IMM ',' IMM ',' SIGN ',' var ',' lvalue ')'
                    {
@@ -376,7 +372,6 @@ assign_statement : lvalue '=' rvalue
                        $3 = gen_rvalue_truncate(c, &@1, &$3);
                        $3 = rvalue_materialize(c, &@1, &$3);
                        OUT(c, &@1, "SET_USR_FIELD(USR_LPCFG, ", &$3, ");\n");
-                       gen_rvalue_free(c, &@1, &$3);
                    }
                  | DEPOSIT '(' rvalue ',' rvalue ',' rvalue ')'
                    {
@@ -421,10 +416,6 @@ control_statement : frame_check
                   ;
 
 frame_check : FCHK '(' rvalue ',' rvalue ')' ';'
-              {
-                  gen_rvalue_free(c, &@1, &$3);
-                  gen_rvalue_free(c, &@1, &$5);
-              }
             ;
 
 cancel_statement : LOAD_CANCEL
@@ -774,7 +765,6 @@ rvalue : FAIL
              @1.last_column = @6.last_column;
              $$ = gen_tmp(c, &@1, 32, UNSIGNED);
              OUT(c, &@1, "gen_read_ireg(", &$$, ", ", &$3, ", ", &$6, ");\n");
-             gen_rvalue_free(c, &@1, &$3);
          }
        | CIRCADD '(' rvalue ',' rvalue ',' rvalue ')'
          {
-- 
2.34.1


