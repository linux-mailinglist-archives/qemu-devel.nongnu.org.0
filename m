Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD465137E8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:13:49 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5q0-0000UG-7s
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K4-0005dK-48
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0006Tk-KL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id bg25so3069067wmb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mAowNSL4X4VULHaXzhATQEymmitY5zLiD+ZgpDe4khk=;
 b=LvkYsXNHjXlBMfvGpY330jprSbZv03wJhbhJMY2atfu5VmQU/EXtCCYlyj4k7YFYYa
 9smedINNLesewgKmIqAovPJEMEuzOv36TrzmayH6LrNImuqZm6Tkq0czaY8nVUqWl87Y
 uTlcd3JZs1YYhQpbKfpX1GV3gS+Ko2nCeHR9SfofesKGpp3V7veAaRE9Cd5q9jJ68Wny
 I6Q7XXE8EHViNLktbU5eHo4k5yvmVS2o+5vOsX/5OrHYOhNzG/PuoxrpGBx/e8kO/iQb
 SpCqcSG/E5cchEV3S5m04/WXaTSkHLYX3SpYkXL2qkuJ1QH8R4V+FyCNE97+4Uswrl/Z
 QhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mAowNSL4X4VULHaXzhATQEymmitY5zLiD+ZgpDe4khk=;
 b=GdLZd658T/TGREhoRTv0W82PsyFMTfhlFJUrA/4OQS6XDuyYvnsxrdYegzQb3jE84Q
 0jQMKEs6cXZX6liXNrA8iICuUpRulxHkoXSBoUS3OqpT6OomzFCmubdPjebw9C6g5OjF
 QqyOxZ1b3pNXdYePgorD5KEDs5vK0/HcDwGjsraI20RpQv2h+uuLCTHe5LLH4YXTbX1T
 M4Y4ptYpB+Db/5JSQjjOqmr/vWc1t0f1JUE84Rgg1WxEySjgERLf0f623cT4huRkua10
 Spb/52qgEsI9bJPkmqeD2ttoOMu2XfIJrJpwvtUkyoxYLUjR74pWgYkJG5Q4oOlB+zWP
 zK6Q==
X-Gm-Message-State: AOAM530O7l8m7S2U/4qDAS+x6SJPbIQUQ5Ex0coxyCy/a4btKfYRjaKh
 QuvL7bEo3B7x+Sy3KFFirz/Bvi2Ifhrj/A==
X-Google-Smtp-Source: ABdhPJza6b3ZE+/E83M/TP5ytgcAsPjCo49hJst53pWtDrCJ/dEER/3TDun9Edfl2IBKlMWJk7uM1w==
X-Received: by 2002:a05:600c:3503:b0:38f:fbd7:1f0d with SMTP id
 h3-20020a05600c350300b0038ffbd71f0dmr30869095wmq.170.1651156843352; 
 Thu, 28 Apr 2022 07:40:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/54] target/arm: Use tcg_constant for predicate descriptors
Date: Thu, 28 Apr 2022 15:39:49 +0100
Message-Id: <20220428143958.2451229-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

In these cases, 't' did double-duty as zero source and
temporary destination.  Split the two uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-46-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a684d489d2c..e812f910cec 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -282,13 +282,12 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
 {
     TCGv_ptr dptr = tcg_temp_new_ptr();
     TCGv_ptr gptr = tcg_temp_new_ptr();
-    TCGv_i32 t;
+    TCGv_i32 t = tcg_temp_new_i32();
 
     tcg_gen_addi_ptr(dptr, cpu_env, dofs);
     tcg_gen_addi_ptr(gptr, cpu_env, gofs);
-    t = tcg_const_i32(words);
 
-    gen_helper_sve_predtest(t, dptr, gptr, t);
+    gen_helper_sve_predtest(t, dptr, gptr, tcg_constant_i32(words));
     tcg_temp_free_ptr(dptr);
     tcg_temp_free_ptr(gptr);
 
@@ -1880,9 +1879,9 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
 
     tcg_gen_addi_ptr(t_pd, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->rn));
-    t = tcg_const_i32(desc);
+    t = tcg_temp_new_i32();
 
-    gen_fn(t, t_pd, t_pg, t);
+    gen_fn(t, t_pd, t_pg, tcg_constant_i32(desc));
     tcg_temp_free_ptr(t_pd);
     tcg_temp_free_ptr(t_pg);
 
@@ -3176,7 +3175,7 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    t = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    t = tcg_temp_new_i32();
     pd = tcg_temp_new_ptr();
     zn = tcg_temp_new_ptr();
     zm = tcg_temp_new_ptr();
@@ -3187,7 +3186,7 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
     tcg_gen_addi_ptr(zm, cpu_env, vec_full_reg_offset(s, a->rm));
     tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
 
-    gen_fn(t, pd, zn, zm, pg, t);
+    gen_fn(t, pd, zn, zm, pg, tcg_constant_i32(simd_desc(vsz, vsz, 0)));
 
     tcg_temp_free_ptr(pd);
     tcg_temp_free_ptr(zn);
@@ -3261,7 +3260,7 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    t = tcg_const_i32(simd_desc(vsz, vsz, a->imm));
+    t = tcg_temp_new_i32();
     pd = tcg_temp_new_ptr();
     zn = tcg_temp_new_ptr();
     pg = tcg_temp_new_ptr();
@@ -3270,7 +3269,7 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
     tcg_gen_addi_ptr(zn, cpu_env, vec_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
 
-    gen_fn(t, pd, zn, pg, t);
+    gen_fn(t, pd, zn, pg, tcg_constant_i32(simd_desc(vsz, vsz, a->imm)));
 
     tcg_temp_free_ptr(pd);
     tcg_temp_free_ptr(zn);
-- 
2.25.1


