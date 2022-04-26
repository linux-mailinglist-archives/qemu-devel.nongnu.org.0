Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEFA510538
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:20:44 +0200 (CEST)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOrj-0000r9-L3
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO91-0002St-DY
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8z-0004NV-Id
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:31 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 bd19-20020a17090b0b9300b001d98af6dcd1so2598360pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Afr+fFSTar2ikBbmWUyJU+wGoh0H9JIJV+912Nb1UHs=;
 b=XQACcMmhJzmWZIGcg5Yp1vN0pLjo4DomsvhGBBNm/6Gl+e+eIhBX+hPF3PTk8HvFod
 9DjXX33CMjmciqHOUPEg3GSQTonAa0VWxez5YNM1QNYN6QGcDpBssMr/qHedC+U/JSLG
 qZLnXwJVJa9/fcO6Qc9x+6fCIrtObb8ksPi4I0Xj+Fdkzrt57AIwAoBBGU1/17dH8leX
 XY9wvNbB6IMs+OWL5KDQx1d9Y4mRoESAtL4zO1WS6+yQGu7x//E3RC4OTtzJsqpkgxyV
 cUieWuEVaL+guzowb0tQPvWu9/ScxiZl9UkW4jPswlcYcFn6BqsHVRVx+3UWDcT1G6Rt
 hnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Afr+fFSTar2ikBbmWUyJU+wGoh0H9JIJV+912Nb1UHs=;
 b=SkdHJwstQP7ARnUv+aQVtWkxZrTtyZQJCtcE6cJZV6vAOAuyX15XtO35hPO5Gq6+qX
 JsQm3dpnvzbziQEqel12/s7TI4fr3mcQsICzmxIIUBcjFPNzkV8/AW8R064Lh4qEiUvJ
 gHJBXTkXoceXnQ80jvdVOObUM9Q6QCp9xpBF/j0Jc0cLcnCkni2E+fngJE3w/yFrVdQa
 C3czk3GaBgiSM8INwgVJvsCbzrPomRgAOZeVs2/oDQwTBmcNyfWw1i65y2GqFt9tpLhf
 kgoKtUt8x5EHcpTW8GXrfcUCBA2gnCm01U74IW5q5tPLDN6dVn3NjziklQnggbW8wgAj
 ol+A==
X-Gm-Message-State: AOAM530hjPOsWj2P0T8TKGS0pHXGqXnu9Dm3ZUj7e35IK5gW1+6vcQIV
 JZkGNK27caCUmExu0IeqXvuECZoWwoANzw==
X-Google-Smtp-Source: ABdhPJyVitotPkT46a1g5IV3NrR3QnTz5mEoZB5bIiSK0NmIvYbLSP7yX5iSzTXdczJTWfDjliEHIA==
X-Received: by 2002:a17:90a:af98:b0:1d4:67d4:d122 with SMTP id
 w24-20020a17090aaf9800b001d467d4d122mr27750778pjq.166.1650990868180; 
 Tue, 26 Apr 2022 09:34:28 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 46/47] target/arm: Use tcg_constant for do_brk{2,3}
Date: Tue, 26 Apr 2022 09:30:42 -0700
Message-Id: <20220426163043.100432-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In these cases, 't' did double-duty as zero source and
temporary destination.  Split the two uses and narrow
the scope of the temp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e812f910ce..82bf094447 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3322,7 +3322,7 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr m = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
@@ -3330,16 +3330,17 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, m, g, t);
+        TCGv_i32 t = tcg_temp_new_i32();
+        fn_s(t, d, n, m, g, desc);
         do_pred_flags(t);
+        tcg_temp_free_i32(t);
     } else {
-        fn(d, n, m, g, t);
+        fn(d, n, m, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
     tcg_temp_free_ptr(m);
     tcg_temp_free_ptr(g);
-    tcg_temp_free_i32(t);
     return true;
 }
 
@@ -3356,22 +3357,23 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     TCGv_ptr d = tcg_temp_new_ptr();
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, g, t);
+        TCGv_i32 t = tcg_temp_new_i32();
+        fn_s(t, d, n, g, desc);
         do_pred_flags(t);
+        tcg_temp_free_i32(t);
     } else {
-        fn(d, n, g, t);
+        fn(d, n, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
     tcg_temp_free_ptr(g);
-    tcg_temp_free_i32(t);
     return true;
 }
 
-- 
2.34.1


