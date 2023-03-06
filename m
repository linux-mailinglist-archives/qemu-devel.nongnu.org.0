Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7531A6AB407
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyS-0004Up-Di; Sun, 05 Mar 2023 19:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxk-0002u3-KB
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0007MT-Lj
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:24 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so11551820pjg.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqQ2BcCZ3kgjD9PONBkMQdY9pGsYGr5TJkgoV7UntP0=;
 b=sPN9nQ5Sai2vaqQwjhtnSG6ufChMul8iUK0oGdSRGHWE8VFklbnprHGIZ4lqgthRka
 plodMGK23XlizFMsWrjPf62WUq73tzIn4boaJqcR/su6pwkrqO+J5Hl2Uk4pj+fS0hIB
 6x0AJbBHXOD/3DGI2iFCYBsh3iEauLTK0s7vhTGwky/JJprmhBJZ8uBP7CKG9dSPClwv
 WKyZdSW9vbZljlcBknMZR9AQ+ahleURY2uQ5cKVy4PJyGoFhvwKs35vviTVDQKwhBBqV
 Ma2bLwZi/VDTCvOK6fkFUS+ERnMrWyaHLGyoSXRlj+H4mxfrIguZUiTIZ2Ng+VXfwkeI
 UqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqQ2BcCZ3kgjD9PONBkMQdY9pGsYGr5TJkgoV7UntP0=;
 b=Mcv1A0TUy/2hNPXP1/FKQEiZFjcypRQDWUvh7O04Q8NICUdQvgw+MfBDbe57SBiwTo
 UaSdKKemX11cv4AxhKELOScNOCY9LAdYY3FfLKoGa3wTWFiHQFYaUlm+hnCniRmku0mC
 2izZAc90NtxBs+Jk+PZK1tVf2g3ujouQl9eyRIY70AN7Xyh7us8siqk3VbxZA6SkL7WU
 bnoMAiDMQWd0lsRAkYpQM6g0N8H2F3Xpc9oNExk4bjUZM1QS5k0oeLVYJVwjztnDktQb
 BFl5ernewvyT4VraOCQNuelbodDHRj2QpQjcPknids1EdxR9I0F4KiYNlv6S7WU6LpMW
 ye/w==
X-Gm-Message-State: AO0yUKXWHg1rjapyixPQcJuUB9BiGGAS6Nz8K8PXrkgh7qu1s+fssPdL
 QWtcS2fVGsc1rtwOR1IGWQSTLGEUZqMZepi5MrjCJk/G
X-Google-Smtp-Source: AK7set8JomugxB66vcOk89noNQnd59TNRb5i8FFIxwyTUSdrQR+e3vfZZr3VKvnZ8rtoX0y2HTYooA==
X-Received: by 2002:a05:6a20:b061:b0:c7:320a:60b6 with SMTP id
 dx33-20020a056a20b06100b000c7320a60b6mr7433981pzb.26.1678063461119; 
 Sun, 05 Mar 2023 16:44:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 73/84] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Date: Sun,  5 Mar 2023 16:39:43 -0800
Message-Id: <20230306003954.1866998-74-richard.henderson@linaro.org>
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

We already have a temporary, res, which we can use for the intermediate
shift result.  Simplify the constant to -1 instead of 0xf*f.
This was the last use of gen_tmp_value, so remove it.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
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


