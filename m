Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728E6A6646
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCip-0004B3-UG; Tue, 28 Feb 2023 22:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002YA-Ex
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiV-0004L0-6H
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:20 -0500
Received: by mail-pl1-x643.google.com with SMTP id i5so10880036pla.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twlEPAJquMS0mpaPteFMRsqTEd1ZaBldmK6QCUBGdsA=;
 b=YBX63yhFFkIQenQXFyvG+IFqEwqc1g6BFijFN/jNrUpymOfh0VD3oawJeN/smhSsyE
 7dM1VEHLEk5c53rwTZC2QDbiznvwbS0i4A1KOjr4wTUlq52gqCtI7/zD6HJeQySk18//
 +EwV9nJWfW+hlhtCV7b8uKU1lrhwtwGmEGeevPSovEHUmTU54OoXCrZkfTIrhHA/EZxv
 0Fljl+V2vaQKFSlNdIMiuvvU+WjKxfLTaJJCB7xVXoCI15XOZS0YYrCJk0pcadmmFokK
 F34/db9Mu37Yg0dQyiIA9cu2vq8/Q9TgPJQpk0y6seNialRFCFo6dGw5+emrF4mxV9iR
 M0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twlEPAJquMS0mpaPteFMRsqTEd1ZaBldmK6QCUBGdsA=;
 b=jTCnHjhsn8B32aVgJqzuXcElob178JXvxzIRtD312ZFtzG4SB7SyG3LMIWmfXDcbEG
 WnHdx5TpsIUpfhTCSPXiGHVFBkD2V8lheIDnO8HiH8CDBQcIcc1gpsI3zWpRue+/EOng
 iWM+ipXJW30Nvj6gaTkWIuT+uiinMJSIpzwzkT7BmzSeYDKsIslOVqu98Phqi2bi3nTL
 LEpxK3DBdt5rvXE0zut5v4JqBYMaYL5imt1sA568+FnRixFs0Mpqztj3/MFWYJj+Nuxc
 njJuws9CBKs5H0IhKr2IpQJ6rfmaCXOMz+NpvM4fJfi3QBkn8XyAJ9mUNUoQcgiHtFT6
 hpqw==
X-Gm-Message-State: AO0yUKXcX1/9LTCPlLcJHHeWky7G/FN1sfkfG8eT0HVmBm/jyO/h2kcp
 qG9pm42x/tb9efVq/+8INqvbW9iB16Tts/IGxlbP3Q==
X-Google-Smtp-Source: AK7set8A+9WcOCggS2pbI9TXgkyYkmTp1FZDVq0oG8WGC2cQX3xq0kl6Vr5bCQX1e9mOSFscKheQxw==
X-Received: by 2002:a17:902:778f:b0:19d:137c:2ad2 with SMTP id
 o15-20020a170902778f00b0019d137c2ad2mr4087271pll.52.1677639677907; 
 Tue, 28 Feb 2023 19:01:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 54/62] target/hexagon/idef-parser: Drop gen_tmp_local
Date: Tue, 28 Feb 2023 16:56:35 -1000
Message-Id: <20230301025643.1227244-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is now equivalent to gen_tmp.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


