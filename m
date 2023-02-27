Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB046A3ACB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:48:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWET-0000Zm-5V; Mon, 27 Feb 2023 00:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDG-0003Tp-Aj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:19 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDC-000315-Py
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:13 -0500
Received: by mail-pf1-x444.google.com with SMTP id cp12so2040945pfb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFzuw10fPpVdZT8YHItC/Ct7hZDecHi/kBTYhZQX5Yc=;
 b=saUlNmAiPUlLxAbmr2ChMTkrmHqhis+3yd55SQnZO9n3SYyLn03AA3qsUukQ6XjLKi
 bN2xzDxLEM2/L3Lq/CtOYautj55z6KUKYrHpw15LxNV1WfBJmdAAATH+HmCdV7QK5t6u
 CJ4M5j5uHZuG577nzuxnx0yBnhWkNgpKQL68CAXUrBnWp0kbIVlXjrgNdjJYA3sU/7Pb
 6/pqHKifXapmrhsZXzvLb7MtfumR//4fjfAUDE/Ojo9lEynyY8oLBJxavG6+r/PQMOaL
 vxjB0L1OxbmS6pwz0c+6anB5Ff8ECIxKdiNf9qqn6BxCdzSrg+BseC5P1DLpC4Ywhd9Y
 Cfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFzuw10fPpVdZT8YHItC/Ct7hZDecHi/kBTYhZQX5Yc=;
 b=xCxdmVXXgm2O3vkeJtcf2qEk85CJrOwHLqgu/+LHHW3OtQcnEGzD0sfptYR4CsUHHN
 niLnlCTj2GN817RHfC0DEzSeZqBRe+tP8skYGsGjeysA6mLGt5Ux7d0x4xu/TKPoymif
 CcC5xLq2ZJ6j9EH65T/RlQMdvfdhn2TFDYIndjJxf/hi5LL9faYDN1HvAGqyV970kSe/
 L93VlcCHI2RXE6SWFHycT9ugXYfgd9PMK6lbMzl0Dl7LoeIPWw9ikUs8UuQEGuvIdBLL
 JUCDtzoftZ5kRjGnVPXFqcWb3NNEDi6AEtGdXts7mYY1hOnAREu5HnxOs7dip7u7BSqY
 i1bw==
X-Gm-Message-State: AO0yUKWHPln/CFefASPDQ9/nxqOLbzKVTGsQpt7Rjus8YEI2vSiiXtBV
 x4BCSGuaY5UTHjhw1H3+g3xrdQNr+kqsp2Rwx8ltkQ==
X-Google-Smtp-Source: AK7set9E3saBB4rhs8Y+GOHzaJYo5+8eXobzZvrrpsez8UJDdH67eDLLQEuiW12zFiUOA8ZtMn+BSg==
X-Received: by 2002:aa7:98c3:0:b0:5a8:4ba7:5840 with SMTP id
 e3-20020aa798c3000000b005a84ba75840mr21645028pfm.26.1677476289091; 
 Sun, 26 Feb 2023 21:38:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Date: Sun, 26 Feb 2023 19:36:53 -1000
Message-Id: <20230227053701.368744-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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

This is now equivalent to gen_tmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index dfb9c65b52..3025040640 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -307,26 +307,6 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-HexValue gen_tmp_local(Context *c,
-                       YYLTYPE *locp,
-                       unsigned bit_width,
-                       HexSignedness signedness)
-{
-    HexValue rvalue;
-    assert(bit_width == 32 || bit_width == 64);
-    memset(&rvalue, 0, sizeof(HexValue));
-    rvalue.type = TEMP;
-    rvalue.bit_width = bit_width;
-    rvalue.signedness = signedness;
-    rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
-    rvalue.tmp.index = c->inst.tmp_count;
-    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
-        " = tcg_temp_new_i", &bit_width, "();\n");
-    c->inst.tmp_count++;
-    return rvalue;
-}
-
 HexValue gen_tmp_value(Context *c,
                        YYLTYPE *locp,
                        const char *value,
@@ -2161,8 +2141,8 @@ HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat,
     assert_signedness(c, locp, sat->signedness);
 
     unsigned_str = (sat->signedness == UNSIGNED) ? "u" : "";
-    res = gen_tmp_local(c, locp, value->bit_width, sat->signedness);
-    ovfl = gen_tmp_local(c, locp, 32, sat->signedness);
+    res = gen_tmp(c, locp, value->bit_width, sat->signedness);
+    ovfl = gen_tmp(c, locp, 32, sat->signedness);
     OUT(c, locp, "gen_sat", unsigned_str, "_", bit_suffix, "_ovfl(");
     OUT(c, locp, &ovfl, ", ", &res, ", ", value, ", ", &width->imm.value,
         ");\n");
-- 
2.34.1


