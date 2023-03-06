Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E327A6AB3E6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyg-0005PW-4H; Sun, 05 Mar 2023 19:45:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxm-0002z6-M5
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:27 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0007MA-LZ
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: by mail-pl1-x635.google.com with SMTP id h8so8488346plf.10
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M5J8IE+Tzx1nCjwUNFXkckIACiGEU4gVAzpY6t4tKs=;
 b=lsuhEX5V+FRZUYOqs1bwwKStIGEWUpRuQdQnuXaAXR6e0bGNfQmqjEbUAwh+u6DbVU
 10OWgFRIetUp+HHsfILc6a/sL8hMJjtJ1Wu5QPw06MxTT8LmYfOR2gDUG43cZIjztjVi
 lWs2OiLH3D/XlyQYUmrK82bjvdOFtq6zhnDfC5vtC+4YJY2UrevMfOtA9635Brbzpuj/
 cPF+RAYT+p5zEcuEEskZZJC+lA0eKl7lU9QkHajXkLnvAXNtSV05q/kpNV/GKMKG8CUq
 sqHbobgYtXYHt7hqAMxj8CJaAmWMTfs1AH6uf4H982Q64L8qZkSi/+FChYIEQpat1TQf
 TtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/M5J8IE+Tzx1nCjwUNFXkckIACiGEU4gVAzpY6t4tKs=;
 b=zhfzjwYS19V7g1opK4bXha4iEYckFj0xSuxlPKRx0hqO93F0uZxF2khETywr82fyF7
 K+MOrnjX9lJggq51hdpxaIGTqqZtD6an9APR7esr4YufvQu4JuTksegbD7LBbSALMlOK
 +LN3ozUkgh5WGe6KQDptVEqhGx50rbKOntAtwMVFQCHb/U6tnA5SHe8NHgBLvs3wjBu/
 zpPfbOCWjacXspfuzznE0aiw/ExkEzNQq+QVXD781fTlwkOYr8QXc36yaKBw69dBo9aY
 RR/DyVuoIAzyWNXcW7RhlrZFuAf8Y0XHhXLPk4DqhQzvtMfRkXNH5KGmYypYBlS2Uq37
 7Gqw==
X-Gm-Message-State: AO0yUKXEQ+1/FGqmn9ZANktuC0aoo7afdHwdmmjFdnF0EWpO0pl6ZGRD
 MRoKweORHAsxafwKGiC/EMdwdYiW1+h28JvaK/VM3w==
X-Google-Smtp-Source: AK7set8YPPPWdRbOWggCAob/PJlW0/kQlhnq1bnko5mr9It4HcUQemqHUKOnhEYZV+M5gIc/4eAOsQ==
X-Received: by 2002:a05:6a20:8e0a:b0:c7:6a98:5bd8 with SMTP id
 y10-20020a056a208e0a00b000c76a985bd8mr12975802pzj.0.1678063458425; 
 Sun, 05 Mar 2023 16:44:18 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 70/84] target/hexagon/idef-parser: Use gen_tmp for LPCFG
Date: Sun,  5 Mar 2023 16:39:40 -0800
Message-Id: <20230306003954.1866998-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

The GET_USR_FIELD macro initializes the output, so the initial assignment
of zero is discarded.  This is the only use of get_tmp_value outside of
parser-helper.c, so make it static.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.h | 6 ------
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 target/hexagon/idef-parser/idef-parser.y    | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.h b/target/hexagon/idef-parser/parser-helpers.h
index 4c89498f5b..1239d23a6a 100644
--- a/target/hexagon/idef-parser/parser-helpers.h
+++ b/target/hexagon/idef-parser/parser-helpers.h
@@ -154,12 +154,6 @@ HexValue gen_tmp(Context *c,
                  unsigned bit_width,
                  HexSignedness signedness);
 
-HexValue gen_tmp_value(Context *c,
-                       YYLTYPE *locp,
-                       const char *value,
-                       unsigned bit_width,
-                       HexSignedness signedness);
-
 HexValue gen_imm_value(Context *c __attribute__((unused)),
                        YYLTYPE *locp,
                        int value,
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 6fb5f31cf7..be979dac86 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -305,7 +305,7 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-HexValue gen_tmp_value(Context *c,
+static HexValue gen_tmp_value(Context *c,
                        YYLTYPE *locp,
                        const char *value,
                        unsigned bit_width,
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index fae291e5f8..c784726d41 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -783,7 +783,7 @@ rvalue : FAIL
          }
        | LPCFG
          {
-             $$ = gen_tmp_value(c, &@1, "0", 32, UNSIGNED);
+             $$ = gen_tmp(c, &@1, 32, UNSIGNED);
              OUT(c, &@1, "GET_USR_FIELD(USR_LPCFG, ", &$$, ");\n");
          }
        | EXTRACT '(' rvalue ',' rvalue ')'
-- 
2.34.1


