Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2436AB41F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:54:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyL-0004LZ-3e; Sun, 05 Mar 2023 19:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxk-0002u2-KE
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0007M1-LM
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:24 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so7368719pja.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+Ta6rrppFf/6kZnAGXoEQVlqShSzDNxBGECEUneH1U=;
 b=h7ADF0x9AN/dDfz2c1RLRlfhBuM3aji3C4fbtdcs78Ufea6XkkrKSM8R3akwPd/lRX
 7hK7shZD7pz5MSwTnGMWZfgyORfNX/RaKpCxK+zRyvA7E0Ar0vXL4C2SYuJkEAJBLQQv
 Kb9tnKP7x2Ardha+DEp18QNK4ZMVM0zie5VnZccqgTVqFJ7BFhQqczHbotCUYa/E3Iod
 7zjB7mDf3Ra8VvaB0nbV22WeH3abRYi6k1kPz6do5Q/nBvUMyOta5XiTC1cmvIF3CMrC
 p7JDvWn2KfarIGN8XGWRIk3JfNuftv8ZVyb3r/gbJM2Rve35fYuAKwFBaVTEuy05pCdL
 BAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+Ta6rrppFf/6kZnAGXoEQVlqShSzDNxBGECEUneH1U=;
 b=Jk9/Zbbhg9ZsGPrH7imxLkGro72ycVZLbe4OBxGRSHQzcefSvj8c1RiylB+bsFaHXH
 tX98lOydOjopt61uYevQWNdUit4L/hXJtVhvOpWJ4vgiQtcjxLJ9+4chTm2t2ShAPgjr
 B/+MxuDLkY9/HJgwzQ2YzvQUe/a+1ebu6fC2aOv7cE9MX15gCZfk1Ut1D+QoVD7xKtW3
 8l6O25mgdcskG5OnIT3cuZsHGwBw2nyAHegwfB2TJvMKHoVuCnU1UZeoWEC93WvPLTug
 /+Gxw4Lh9WrWs1KfyufbxvyfzPDNxhZQvIDjrDg86PBv0g2cwbpZf05mzA8wC4tz16p2
 uXxQ==
X-Gm-Message-State: AO0yUKVrBo3X4KEPK/kKfiM7gCoIrkJmU89oyJtWuiih6az7vjkXOukU
 tDLATNL4Z3QVdFWd7LkGC+f491T8dwhieMW4AA9JHXlZ
X-Google-Smtp-Source: AK7set8Toh3R2g5CfCDN59zSSW/zky+M7dtdjzFOFgejTT78Cirl6kDjurzOZRUQgoxuyz4rBzzlbw==
X-Received: by 2002:a05:6a20:9146:b0:bb:b903:d836 with SMTP id
 x6-20020a056a20914600b000bbb903d836mr10387503pzc.54.1678063457564; 
 Sun, 05 Mar 2023 16:44:17 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 69/84] target/hexagon: Use tcg_constant_* for
 gen_constant_from_imm
Date: Sun,  5 Mar 2023 16:39:39 -0800
Message-Id: <20230306003954.1866998-70-richard.henderson@linaro.org>
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

Rename from gen_tmp_value_from_imm to match gen_constant vs gen_tmp.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
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


