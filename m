Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1A6A3AD6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:50:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIS-0004M4-GD; Mon, 27 Feb 2023 00:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIK-00046N-8a
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:28 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWII-00053X-7P
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:27 -0500
Received: by mail-pl1-x643.google.com with SMTP id bh1so5530322plb.11
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IEezoZfJQNe6XCATjLvrmBK8hrTlzOfAXX1KwxpEYxg=;
 b=Cueij7K9HsNdTRop7fJC2iIMDj8bivUR5bAl9bPPYLMpN8X4bsvwzsWVThQF4iRxcj
 mSVPcp1QDxEapnVUJPZOIblxOphQEeCJTz97oiQpK3XlEDxE3Q1IlVLGL3jpsbCBQHU1
 kmwcB1sSpTL/+9H6DWth6N9QAp//aw/8owPgmfXvVh+2pDBKyecY6Luz+bdzQSQHMEuI
 fgqzofG29GgUfasCdV9ezH97tGhlAO8A/nFUR0WUhWQ/8JMGzaZJp/sjpc9TYhLixrc4
 hekJLs67AfiTz7VgJF4ov5k/n5XjfLtQ6cQcEi4yCAryD2pQ86QpVy/ZCQd3FxmF/Spc
 TSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IEezoZfJQNe6XCATjLvrmBK8hrTlzOfAXX1KwxpEYxg=;
 b=jmunqOdRR6m3RtAzPI1Trtug1sRJu1EWQmoDAPClctdM+keO/QQPBPxzRLdrHApkes
 8iZyDIuiSSa57hn4NlEICzEso/ABhPdyMwDnLvURb47eKqsVu/pOZpTqx0YKFaBhKzyC
 JQJ6FC6ajYN6nFZktS5PUkqvAgtUPZjEd7tKmF4nbmh/RchcJjOKCSGZZiCEIZEhEcb8
 q266ArXKWBhQYY2ru88tN6eoOzOhioaxhdijUzyY0O7CIS4Vh4+B7BWz+KnKnRKeH7RV
 0hC+/jW2jYAt07gZ48ex0ZpbTOCRWtUuzddaJA2sJoSY90BezL6EQIPTJ6tTvuP08YRk
 pw1w==
X-Gm-Message-State: AO0yUKVMVXe199fTfL6coXSunDSLcrVtdP/kLKvDSm2EWEGvnEm9ts2I
 TpuowWXjmvzZy8svWwgXDi/n3H4h4zlWxMsoHvvWMQ==
X-Google-Smtp-Source: AK7set9SolTglDcpO4vOh9rRbqkEFjhcVqLwuoWHfIix4W6eA421POajiB3OgJSuEzaeGAwy+Xq7lg==
X-Received: by 2002:a05:6a20:258d:b0:cc:88af:12ab with SMTP id
 k13-20020a056a20258d00b000cc88af12abmr10407124pzd.28.1677476604528; 
 Sun, 26 Feb 2023 21:43:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 15/70] target/hexagon: Use tcg_constant_* for
 gen_constant_from_imm
Date: Sun, 26 Feb 2023 19:41:38 -1000
Message-Id: <20230227054233.390271-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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

Rename from gen_tmp_value_from_imm to match gen_constant vs gen_tmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 0b401f7dbe..6fb5f31cf7 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -325,9 +325,9 @@ HexValue gen_tmp_value(Context *c,
     return rvalue;
 }
 
-static HexValue gen_tmp_value_from_imm(Context *c,
-                                       YYLTYPE *locp,
-                                       HexValue *value)
+static HexValue gen_constant_from_imm(Context *c,
+                                      YYLTYPE *locp,
+                                      HexValue *value)
 {
     HexValue rvalue;
     assert(value->type == IMMEDIATE);
@@ -338,11 +338,11 @@ static HexValue gen_tmp_value_from_imm(Context *c,
     rvalue.is_dotnew = false;
     rvalue.tmp.index = c->inst.tmp_count;
     /*
-     * Here we output the call to `tcg_const_i<width>` in
+     * Here we output the call to `tcg_constant_i<width>` in
      * order to create the temporary value. Note, that we
      * add a cast
      *
-     *   `tcg_const_i<width>`((int<width>_t) ...)`
+     *   `tcg_constant_i<width>`((int<width>_t) ...)`
      *
      * This cast is required to avoid implicit integer
      * conversion warnings since all immediates are
@@ -350,7 +350,7 @@ static HexValue gen_tmp_value_from_imm(Context *c,
      * integer is 32-bit.
      */
     OUT(c, locp, "TCGv_i", &rvalue.bit_width, " tmp_", &c->inst.tmp_count);
-    OUT(c, locp, " = tcg_const_i", &rvalue.bit_width,
+    OUT(c, locp, " = tcg_constant_i", &rvalue.bit_width,
         "((int", &rvalue.bit_width, "_t) (", value, "));\n");
 
     c->inst.tmp_count++;
@@ -395,8 +395,7 @@ HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
 HexValue rvalue_materialize(Context *c, YYLTYPE *locp, HexValue *rvalue)
 {
     if (rvalue->type == IMMEDIATE) {
-        HexValue res = gen_tmp_value_from_imm(c, locp, rvalue);
-        return res;
+        return gen_constant_from_imm(c, locp, rvalue);
     }
     return *rvalue;
 }
-- 
2.34.1


