Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EC16A2845
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:22:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqfP-0007LC-1E; Sat, 25 Feb 2023 04:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqej-0006Aj-8e
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:50 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeg-0002Cs-JR
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:48 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso5182574pjb.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0sQ5YuWprkz3a/t8VbhHIE1j8bAvSjApJDRfd/okKA=;
 b=rX9hzoglEeAzMqg9SSWir3nXuG4pDnFEsAoAsgwzVjEDDzx77i4j8rQQUnw7y1uYow
 nJwxMww3t+2kMySuaf2jSXOqcRrtRQI7FDC9ogFj0rP5AM22gKXKnVIOtQv43+t7fkch
 1VWuPMmvk9D3xYwPXezY/RwI8x4ODjyfOU62eMx6dA8MgGR/nh0oDh0GxJwV5nwUpJmK
 ypR3Y1NxLpJSoSmX9dJ276YgwN3GHJV04ovzbHhjL4ZD2Tg1vfycEoRc1tFb+GJI+FYj
 lNaeBzs8O5GNbWmX2yq3KlaFXTbVOKj1j+B5JG4XeGUarVdh7gxpRpXw9dofr/H7GBow
 WegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0sQ5YuWprkz3a/t8VbhHIE1j8bAvSjApJDRfd/okKA=;
 b=jxgfW66KblNpfRdye++w3jNPKCZz2yifmwr6buYzR5qxRwDG9npSU1zDspj2G0aEw0
 29xiwhQRFAnlLV4ak9LqYPzYgKjpzxQk4rG7BD0ejC5/wRoHxxpoxqSioS2rXg/z20iG
 mUKGrANa7CMJQDvAB8gVGt8lsqVvq7e0D11AISI+ODVLZQZJ5c5Kw4hqcl9Fn/Odrf98
 TBVv8BFi1jxIT5uiXacxvyahamgSCjq/UfeqBTkHUSuXGXMuZGji/RqZdnYgGtq1tTdC
 RqOYz8lg7PnD0U7dnGwrJSOoNeirzh0gjxPS5gdufZcfskTP0L9DwAIS4yB1BkKz0C5C
 tG3g==
X-Gm-Message-State: AO0yUKUMjbI1J7Ke6f0XZS8XmHjXoXbrN4MFhlotys00ohz2lQThlh8s
 jbdxU1ae2CX4v+LtItTnsZJA7HhAY9ZeKciUSMPnsA==
X-Google-Smtp-Source: AK7set93h9MxJKIkyWFIqVjHrHaulzYC/4fIMCT1flOQmrQCXi8f2Wb8FOkles18J9ZN/tdNCnmenQ==
X-Received: by 2002:a17:903:1d2:b0:19a:a815:2868 with SMTP id
 e18-20020a17090301d200b0019aa8152868mr20914299plh.44.1677316545224; 
 Sat, 25 Feb 2023 01:15:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 28/76] target/hexagon/idef-parser: Drop HexValue.is_manual
Date: Fri, 24 Feb 2023 23:13:39 -1000
Message-Id: <20230225091427.1817156-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/idef-parser.h    |  1 -
 target/hexagon/idef-parser/parser-helpers.c | 16 ----------------
 target/hexagon/idef-parser/idef-parser.y    |  2 --
 3 files changed, 19 deletions(-)

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
index 59d3e52728..b98c21f40f 100644
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
@@ -319,7 +317,6 @@ HexValue gen_tmp_local(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_temp_new_i", &bit_width, "();\n");
@@ -340,7 +337,6 @@ HexValue gen_tmp_value(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_const_i", &bit_width, "(", value, ");\n");
@@ -359,7 +355,6 @@ static HexValue gen_tmp_value_from_imm(Context *c,
     rvalue.bit_width = value->bit_width;
     rvalue.signedness = value->signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     /*
      * Here we output the call to `tcg_const_i<width>` in
@@ -395,7 +390,6 @@ HexValue gen_imm_value(Context *c __attribute__((unused)),
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.imm.type = VALUE;
     rvalue.imm.value = value;
     return rvalue;
@@ -410,7 +404,6 @@ HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
     memset(&rvalue, 0, sizeof(HexValue));
     rvalue.type = IMMEDIATE;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.imm.type = QEMU_TMP;
@@ -1262,15 +1255,12 @@ void gen_rdeposit_op(Context *c,
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
 
@@ -1430,8 +1420,6 @@ HexValue gen_convround(Context *c,
     HexValue and;
     HexValue src_p1;
 
-    src_m.is_manual = true;
-
     and = gen_bin_op(c, locp, ANDB_OP, &src_m, &mask);
     src_p1 = gen_bin_op(c, locp, ADD_OP, &src_m, &one);
 
@@ -1589,10 +1577,6 @@ HexValue gen_round(Context *c,
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


