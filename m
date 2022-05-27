Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C95353674B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:03:07 +0200 (CEST)
Received: from localhost ([::1]:50614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufEo-0002Iw-LT
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYd-00071M-8y
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:31 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYa-0003bU-Dd
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:30 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n8so4818929plh.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0/ND+qB6tNKDRo2+/VUSnu4TobvBFfTAPV+oE3bzos=;
 b=nIjoUzkWvT2rWwRhLjWf4O1/EULz5OyYJRsH/DDnvj0NwKibd7G3MOlSJa/9My+f2L
 uEgdVwfKrYhNtVuB0HEzWbj2V6g7FHh53laldSFAcUTYorFs+XhSYJOwsUrlFN+iQiyP
 yZUU6N46w6Xjw0FUweRAUjguzRYIw2uZOMfvLPfhC368jJR+oWZfeclAzxJpmaem3hK7
 OfmnHgSZzWDLgd0TFQctt8tTiaOpFyh5vu8opb5y5WfkWtWVAnMMW+zZ/H6ZPzQtUPwh
 gri2LrJ22Zduw7NpeO9KbBWqFnREhyipbdjpwZIrNx6teSE0sXSRPNGCNE0eVoWncKDB
 o7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0/ND+qB6tNKDRo2+/VUSnu4TobvBFfTAPV+oE3bzos=;
 b=YzmfIZrUmr31TRCMEynvsEAv7FQLXKb+QafFDbiTmjO9eVie3yH5APSiNjvfIXI85k
 AbYPaAeoIheb7wRIxZhhuz9B2+0urr6YkBxhRWdtvT7eA9j96jL+ldKhk7+W0mf3jq6g
 oUVfMsz2AZhxg0qzF7xvYHxh16Akfukiz/y60LUzFGtOrZLBZcE5lT8u5I3umsMD1G1i
 /k8PkH0Pw9HxtK3GbtHii0oQ4yFp7y4Dz0/7NhXLnZlktKGO6xkpyt5bOhi2/MnV6mMA
 nuQ1yRn6KULVcnQ4ERPVxXNYrUTRJ2Yj4sHdUkKeCFdqks8gIE1EqnbAWyImAz+Xyx01
 CLdQ==
X-Gm-Message-State: AOAM533dGq7uPSoM/x94zr5Y6b2QOrXa65jbGjWV5E45yfMkQQ/9ODSR
 rkQLOftnTYQMa32rBTi6YxKhhFrr14Chpw==
X-Google-Smtp-Source: ABdhPJxvoR17fjlHlqmZewhy42mc/NRt+TO92E1KI2tW52hQWTOPiZ3h4sMHT8LIXy3ss4hvUNyqOw==
X-Received: by 2002:a17:903:2305:b0:163:64c7:f9ff with SMTP id
 d5-20020a170903230500b0016364c7f9ffmr13070567plh.46.1653675567078; 
 Fri, 27 May 2022 11:19:27 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 019/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zzp
Date: Fri, 27 May 2022 11:17:32 -0700
Message-Id: <20220527181907.189259-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b4307f062c..e81c2de37f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -206,14 +206,20 @@ static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
 }
 
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
-static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
+static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       pred_full_reg_offset(s, pg),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           pred_full_reg_offset(s, pg),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
@@ -801,13 +807,7 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 
 static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
 }
 
 #define DO_ZPZ(NAME, name) \
@@ -986,20 +986,13 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
         gen_helper_sve_movz_b, gen_helper_sve_movz_h,
         gen_helper_sve_movz_s, gen_helper_sve_movz_d,
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
 static bool do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
                         gen_helper_gvec_3 *fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
 }
 
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
-- 
2.34.1


