Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694435104F0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:09:56 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOhH-0007BN-Gn
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8y-0002H2-1k
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:28 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8v-0004Ll-79
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:27 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so2657140pjq.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gu1w/jO8eoHTj1LzEHCTAVluXbeXXyayJtWHm0r4IXU=;
 b=qGvheP2zI4iWipBg7NqOIpEoSeU7le9kW5tMi7Uul0X+9GyUmiBS6/le3nGmVqobjY
 hMda/8RULY9KDTcNbIWn8ZTwes+7jJKV8HnmMhIk1LS6yJYfPlJnv/Lpzn/uUInrKNrU
 O8LJu6ZCcUYvZLa5RiwvQQCoyjiPNfNJQLWTGyDNP+qSV3UFW2ntqgQqsiozwR1Pb7C9
 UjAPqBvB0F2LlPj9z+9mR0wX0LUuKLTlyLSVZ4ujwpAuEUjte9E4fPaeRbnFWGDvwoKj
 ieN16im0+dk6eZDU/Wsql9LfVsEPjKPMyaNmBAHhiYtv8zHFSJxOp9NxbDPgEpMA7kLd
 RT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gu1w/jO8eoHTj1LzEHCTAVluXbeXXyayJtWHm0r4IXU=;
 b=DV3qHgG0WgnLP0MejUywmZsVD9bV4vTQD0oAF4++OIWIm9DGLNhS9Ug+qDS48l7vfj
 D9x1+vkHpLfIV0HsUvYCBQYwJOZmCeTBxDfBlsYzX59baI3usZ/4iUvTO8eOHpge56SG
 rnIYOz5L6unuWfukiOPwsASzurwX8Fiaua4miEZnhM+LiC5FZWKJVJ7G+kH95AxSQAnV
 8gadJ1h5JkOf+YYYntVZPkyG1f/D6nbGsRjYuCoRMPolhn+xaF0MKKjBbg1FYCCJVXpx
 15Pre8E9vspP4nkLJJgs3mryWZ+w0hjdZEQy1OqEbWNMyjPZj5kvPDJKMJEqPmuiOFZ9
 iHXg==
X-Gm-Message-State: AOAM531cuJWlL6t4/JmnZ3Nhyd0mMIe+i/4lzs1VICDftWR5FQ27GWh+
 DHPYtkP6m0CCks7zCOBolD0L2lYOnwlZCA==
X-Google-Smtp-Source: ABdhPJw96+Xx2uGc8OEdRqM9JzmCnY5dk1f/LtSSIWz6SF1X1oTDrwU41p72F4ENr/cVCNKHrakJbQ==
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr27748993pjb.232.1650990863845; 
 Tue, 26 Apr 2022 09:34:23 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/47] target/arm: Use tcg_constant in WHILE
Date: Tue, 26 Apr 2022 09:30:37 -0700
Message-Id: <20220426163043.100432-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7a39ed0c06..727f5cca36 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3568,7 +3568,7 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 {
     TCGv_i64 op0, op1, t0, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3624,7 +3624,7 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
         }
     }
 
-    tmax = tcg_const_i64(vsz >> a->esz);
+    tmax = tcg_constant_i64(vsz >> a->esz);
     if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
@@ -3644,7 +3644,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(t0, t0, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Set the count to zero if the condition is false.  */
     tcg_gen_movi_i64(t1, 0);
@@ -3661,28 +3660,26 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
     if (a->lt) {
-        gen_helper_sve_whilel(t2, ptr, t2, t3);
+        gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     } else {
-        gen_helper_sve_whileg(t2, ptr, t2, t3);
+        gen_helper_sve_whileg(t2, ptr, t2, tcg_constant_i32(desc));
     }
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
     TCGv_i64 op0, op1, diff, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3697,7 +3694,7 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     op0 = read_cpu_reg(s, a->rn, 1);
     op1 = read_cpu_reg(s, a->rm, 1);
 
-    tmax = tcg_const_i64(vsz);
+    tmax = tcg_constant_i64(vsz);
     diff = tcg_temp_new_i64();
 
     if (a->rw) {
@@ -3723,7 +3720,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(diff, diff, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Since we're bounded, pass as a 32-bit type.  */
     t2 = tcg_temp_new_i32();
@@ -3732,17 +3728,15 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
-    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
-- 
2.34.1


