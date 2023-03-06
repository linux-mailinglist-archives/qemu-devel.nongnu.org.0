Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ECD6AB3D7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuf-0005d0-Om; Sun, 05 Mar 2023 19:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyu3-0004XP-Tb
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:35 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyu0-0006sn-5u
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:35 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so9706356pjn.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rz9k7o4d//+CtCPfl15T22J2m9D1OS7OQgm/BQ1mJE=;
 b=hFZkzlgB37Iwt8O+Lm7gTE073z0e7A082+fa4plp2WSq0A1DnKE7XLkQXPtxfFXy2D
 5sy7DZle1kKPWdvUNwmjAREVDzAqkqARL4a0dMs6saZ0dJHl6J1PDJc4TtYt96Vi0UFe
 yfiZu9BHnI6aWVGY4V0UN3uaf8uGBaI0/LOw5No2T0okJmBFtk/ECjyJ+QLWjaHzhzce
 TqVjLYpToHP/IwDKFkY/Euew8Lno5w6YtpqQ6nV0vBRP4eLzfAVbcW5gar1VZEWy+oa3
 C3H65dLwnZ0FTlhhVF8S46wtjgIWH+BtPevNG0D6icAgb70UtW7db9Yauor7kA6O9T4k
 NNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rz9k7o4d//+CtCPfl15T22J2m9D1OS7OQgm/BQ1mJE=;
 b=nrumDRuN4TxDD/EK2BZ9a4GXLZV8OezsrJvA4sKEkdHVJAYrnf1wiOl0jtYzS+a7ev
 d+LIl5/3jpu9Ky2Fgr7kqCENRkMV+OzbrVxMfsbB+pDE4zxk1YCrdcWNLfi1Ob6xdjsU
 lxdoZiSfqkdZ1539bbDdFk4BgBN1nHJ/QeQLe68Vp6QYic4FL7hlssv31P0ofk5rfxAQ
 LrO++MgkcJCBcmEGYgNaYT2+lLCtPkc2EX0/xVUzHP/IcZD4NHXgougltZm5QJ8kvW90
 MmpkjFmDh+fHCkYVaX0Ax0DCA9YR/95zzGsGAUWKkqmjBvaCanedhKGBybnNyB7Y87RL
 od7Q==
X-Gm-Message-State: AO0yUKUVhcYq5+fNa+P78wF9Zmb0JtP51OzmeiIfoL/kKcHgrnHZGgxC
 ZKHy7BtxyRgdT4U2T+hZpuIRWLGrMAqbbLSUgPw34cNm
X-Google-Smtp-Source: AK7set8ycea5QPmk3eKK7IZ6NJe5VVsMHwgYMGJLc0h3z8JTSP3sPKKP/hb33DvDt6iaU0RoHjr7eg==
X-Received: by 2002:a17:90a:7:b0:23a:6be8:9446 with SMTP id
 7-20020a17090a000700b0023a6be89446mr9777893pja.48.1678063230693; 
 Sun, 05 Mar 2023 16:40:30 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 39/84] target/hexagon/idef-parser: Drop HexValue.is_manual
Date: Sun,  5 Mar 2023 16:39:09 -0800
Message-Id: <20230306003954.1866998-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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

This field is no longer used.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/idef-parser.h    |  1 -
 target/hexagon/idef-parser/parser-helpers.c | 15 ---------------
 target/hexagon/idef-parser/idef-parser.y    |  2 --
 3 files changed, 18 deletions(-)

diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/idef-parser/idef-parser.h
index 5c49d4da3e..17d2ebfaf6 100644
--- a/target/hexagon/idef-parser/idef-parser.h
+++ b/target/hexagon/idef-parser/idef-parser.h
@@ -185,7 +185,6 @@ typedef struct HexValue {
     unsigned bit_width;         /**< Bit width of the rvalue                  */
     HexSignedness signedness;   /**< Unsigned flag for the rvalue             */
     bool is_dotnew;             /**< rvalue of predicate type is dotnew?      */
-    bool is_manual;             /**< Opt out of automatic freeing of params   */
 } HexValue;
 
 /**
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index bdbb8b6a5f..0b401f7dbe 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -278,7 +278,6 @@ static HexValue gen_constant(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = true;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_constant_i", &bit_width, "(", value, ");\n");
@@ -299,7 +298,6 @@ HexValue gen_tmp(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_temp_new_i", &bit_width, "();\n");
@@ -320,7 +318,6 @@ HexValue gen_tmp_value(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_const_i", &bit_width, "(", value, ");\n");
@@ -339,7 +336,6 @@ static HexValue gen_tmp_value_from_imm(Context *c,
     rvalue.bit_width = value->bit_width;
     rvalue.signedness = value->signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     /*
      * Here we output the call to `tcg_const_i<width>` in
@@ -375,7 +371,6 @@ HexValue gen_imm_value(Context *c __attribute__((unused)),
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.imm.type = VALUE;
     rvalue.imm.value = value;
     return rvalue;
@@ -390,7 +385,6 @@ HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
     memset(&rvalue, 0, sizeof(HexValue));
     rvalue.type = IMMEDIATE;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.imm.type = QEMU_TMP;
@@ -1242,15 +1236,12 @@ void gen_rdeposit_op(Context *c,
      */
     k64 = gen_bin_op(c, locp, SUB_OP, &k64, &width_m);
     mask = gen_bin_op(c, locp, LSR_OP, &mask, &k64);
-    begin_m.is_manual = true;
     mask = gen_bin_op(c, locp, ASL_OP, &mask, &begin_m);
-    mask.is_manual = true;
     value_m = gen_bin_op(c, locp, ASL_OP, &value_m, &begin_m);
     value_m = gen_bin_op(c, locp, ANDB_OP, &value_m, &mask);
 
     OUT(c, locp, "tcg_gen_not_i", &dst->bit_width, "(", &mask, ", ",
         &mask, ");\n");
-    mask.is_manual = false;
     res = gen_bin_op(c, locp, ANDB_OP, dst, &mask);
     res = gen_bin_op(c, locp, ORB_OP, &res, &value_m);
 
@@ -1410,8 +1401,6 @@ HexValue gen_convround(Context *c,
     HexValue and;
     HexValue src_p1;
 
-    src_m.is_manual = true;
-
     and = gen_bin_op(c, locp, ANDB_OP, &src_m, &mask);
     src_p1 = gen_bin_op(c, locp, ADD_OP, &src_m, &one);
 
@@ -1569,10 +1558,6 @@ HexValue gen_round(Context *c,
     b = gen_extend_op(c, locp, &src_width, 64, pos, UNSIGNED);
     b = rvalue_materialize(c, locp, &b);
 
-    /* Disable auto-free of values used more than once */
-    a.is_manual = true;
-    b.is_manual = true;
-
     n_m1 = gen_bin_op(c, locp, SUB_OP, &b, &one);
     shifted = gen_bin_op(c, locp, ASL_OP, &one, &n_m1);
     sum = gen_bin_op(c, locp, ADD_OP, &shifted, &a);
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index 59c93f85b4..fae291e5f8 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -534,7 +534,6 @@ rvalue : FAIL
              rvalue.imm.type = IMM_CONSTEXT;
              rvalue.signedness = UNSIGNED;
              rvalue.is_dotnew = false;
-             rvalue.is_manual = false;
              $$ = rvalue;
          }
        | var
@@ -693,7 +692,6 @@ rvalue : FAIL
          }
        | rvalue '?'
          {
-             $1.is_manual = true;
              Ternary t = { 0 };
              t.state = IN_LEFT;
              t.cond = $1;
-- 
2.34.1


