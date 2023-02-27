Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138A6A3BFC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIn-0005OF-06; Mon, 27 Feb 2023 00:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIU-0004bO-UT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:40 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIS-00057x-W2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:38 -0500
Received: by mail-pf1-x441.google.com with SMTP id b20so2798531pfo.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFwp7rJLT3ezFoTtdpkm7g7WVshe2Fl4tPXf7GfT8CY=;
 b=Xys5m/BhbJaiCezwG82ZLYx/sXlKRyOWp1V43O+ESWxJ3q7z7L/1IWSXsz/lgCVpB2
 I8KNFl3Fu088dUar4wziVBNBRYCKoU3hQV5TH+h90k7dGz6S/tMJLB3XJqDSv8qh/E4f
 ghr49G7CYMIg+goESjyPWoDAbhfvQq4mCgU1R9EPILtsWX/UcB3oBtFaILFttPoHz+sY
 TMEHDTSYROdZv8CIOiqtdgN0wOHReaW9Y+WFNprr4rrDSCnOV9CTtkKDMxTEfvM45a89
 97D1MlecNJU0s/ZlDE8qVbvid6Z0MBRFJLDXUN7k5m586rIVYX1dkRRjtf2eryG8N77y
 QxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFwp7rJLT3ezFoTtdpkm7g7WVshe2Fl4tPXf7GfT8CY=;
 b=EM3/9tv95qWClcOTubnWKgNRRS6q5QyiSmWdpdlDMfz9YQtm19oUaqRJhdGCla98v0
 1S+tnqnzqBCWOLYUSfxVBPtle9UUIX5gkvQR0G6gaRdapeLXMPEoZevCbT+NmepdqzAi
 ilatXD4qD9uaoOv0N2ng6bvO4qwOfd8Ujl3Ia2qknf2r3X6qdFd74CDjjKu3hcGkfupV
 /j+PwKxXY088hIHNeYMP3HulTcEvFZvh5HWO0bwSvE3nKmaEKUxGUeGfNUnyA0SSGJIK
 6iOOJbm+QDVFzeQiWIEEJmqaGvhpjzQE9ZPw7Uy+YiLsXX8/dKIp5laZQ/4WpBAbUcQO
 Lh/w==
X-Gm-Message-State: AO0yUKW9reZRk+YR/ucdlLq98M++vNRgyKgW0Ql48TNGK+uDcsJc5heU
 9maRcHT14790rvmFcUF39fy8ZMOfgBxyjTPpVCmxCA==
X-Google-Smtp-Source: AK7set8Rtcnirnn4zrZSrRGGY5iZBqATjlxAkru+dJEDU7IMIE+hPyNLIzT+4ftnI2iQsGnwmAmx/w==
X-Received: by 2002:aa7:9a1b:0:b0:590:921d:5740 with SMTP id
 w27-20020aa79a1b000000b00590921d5740mr20538709pfj.13.1677476615305; 
 Sun, 26 Feb 2023 21:43:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Date: Sun, 26 Feb 2023 19:41:42 -1000
Message-Id: <20230227054233.390271-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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

We already have a temporary, res, which we can use for the intermediate
shift result.  Simplify the constant to -1 instead of 0xf*f.
This was the last use of gen_tmp_value, so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 30 +++------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index c0e6f2190c..e1a55412c8 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -305,26 +305,6 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-static HexValue gen_tmp_value(Context *c,
-                       YYLTYPE *locp,
-                       const char *value,
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
-    rvalue.tmp.index = c->inst.tmp_count;
-    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
-        " = tcg_const_i", &bit_width, "(", value, ");\n");
-    c->inst.tmp_count++;
-    return rvalue;
-}
-
 static HexValue gen_constant_from_imm(Context *c,
                                       YYLTYPE *locp,
                                       HexValue *value)
@@ -1120,15 +1100,11 @@ static HexValue gen_extend_tcg_width_op(Context *c,
     OUT(c, locp, "tcg_gen_subfi_i", &dst_width);
     OUT(c, locp, "(", &shift, ", ", &dst_width, ", ", &src_width_m, ");\n");
     if (signedness == UNSIGNED) {
-        const char *mask_str = (dst_width == 32)
-            ? "0xffffffff"
-            : "0xffffffffffffffff";
-        HexValue mask = gen_tmp_value(c, locp, mask_str,
-                                     dst_width, UNSIGNED);
+        HexValue mask = gen_constant(c, locp, "-1", dst_width, UNSIGNED);
         OUT(c, locp, "tcg_gen_shr_i", &dst_width, "(",
-            &mask, ", ", &mask, ", ", &shift, ");\n");
+            &res, ", ", &mask, ", ", &shift, ");\n");
         OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
-            &res, ", ", value, ", ", &mask, ");\n");
+            &res, ", ", &res, ", ", value, ");\n");
     } else {
         OUT(c, locp, "tcg_gen_shl_i", &dst_width, "(",
             &res, ", ", value, ", ", &shift, ");\n");
-- 
2.34.1


