Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C358D5367C8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:58:54 +0200 (CEST)
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug6n-0002ZB-SO
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueff-0001te-0J
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefR-0005KA-67
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so7794849pja.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZvF0gCpjgCEEUQm15Do1bYuoKhukCy6DHKNjEq+MH8=;
 b=GtZ5o1cAgAxU8VF6gXTRaVzNjjLv/ZbiQBHqzNyOBg8pBVhlyOGFosdv+BBPCZA4YC
 GZ+TEafQz3F7j6qeY7x1WMS6dq++VYFYcvNnN2Hm+DoBwfR4FndCJRg1LSAFdvmNg8pL
 zrEz1fW5U6jsBtTnYJMgDQHSQOnlmr1FZ1X9r06fHvwRdFgtFDgomKt1gEYs+iewDsbY
 32clOGvtb2oCtiBqeI9aLTPs+6Yl/X4GZ3avjHWkUh73vXwETIkghfeFrgOnarcyZqFF
 qHruRvpeb9vWLZwwD1qr04J4cJdOdNtbBUGCmXiaAU9G0FppzvhMU6oftqirQsSz/NvL
 PLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ZvF0gCpjgCEEUQm15Do1bYuoKhukCy6DHKNjEq+MH8=;
 b=DVVqxKGrlMnmaarETmXd+rBIzdT3MNwj05I0Dln9K0B1jUDi8vJpQMQOO4c6j7443Q
 lxpyQ/JezCb03asuzw1SwOzW6PcmtGqy2Ka6sjhtNYcx08GfHKJ0C6hdazUtBXkdcM/r
 iYB6VKCaYTPv9CTiiaTdzsR3tQeNeJJDzclENlOgBlrN69N6FH1SLEER4b1EvveYGSaB
 l4RsaV9LPg0L8pV2FfzJpYSOVnBXxtZpdfhn6uLAM49ihPfj7VXTXiVB/Bnapml8XU7/
 +atRWe+QmbuBEk+s/8k0r0etoM2xNoPa8tP/OF55kSE/g0sPJyH6+SMg5FrTIXOJUSb2
 O6aA==
X-Gm-Message-State: AOAM530zuykZM2F1ACtWbmDOawQt3yp7MH61QqOJ/OYzW7G0wTiHszG+
 TXKc+TuIALctQq1/xd5aK0Nz3gZkRQQMVg==
X-Google-Smtp-Source: ABdhPJzEFH8WhyHG79MmUqGa8w4SUBLJ7UoUlMpqCiT1WZ9X1rRfm4awPfdR8dhShqqz5kuUzGSBRg==
X-Received: by 2002:a17:90a:4587:b0:1de:c6ee:80f with SMTP id
 v7-20020a17090a458700b001dec6ee080fmr9645894pjg.196.1653675991919; 
 Fri, 27 May 2022 11:26:31 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 089/114] target/arm: Move null function and sve check into
 do_reduce
Date: Fri, 27 May 2022 11:18:42 -0700
Message-Id: <20220527181907.189259-90-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 target/arm/translate-sve.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 11e4b4e1e4..0d71072f83 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3572,15 +3572,24 @@ TRANS_FEAT(FMUL_zzx, aa64_sve, gen_gvec_fpst_zzz,
 typedef void gen_helper_fp_reduce(TCGv_i64, TCGv_ptr, TCGv_ptr,
                                   TCGv_ptr, TCGv_i32);
 
-static void do_reduce(DisasContext *s, arg_rpr_esz *a,
+static bool do_reduce(DisasContext *s, arg_rpr_esz *a,
                       gen_helper_fp_reduce *fn)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned p2vsz = pow2ceil(vsz);
-    TCGv_i32 t_desc = tcg_constant_i32(simd_desc(vsz, vsz, p2vsz));
+    unsigned vsz, p2vsz;
+    TCGv_i32 t_desc;
     TCGv_ptr t_zn, t_pg, status;
     TCGv_i64 temp;
 
+    if (fn == NULL) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    p2vsz = pow2ceil(vsz);
+    t_desc = tcg_constant_i32(simd_desc(vsz, vsz, p2vsz));
     temp = tcg_temp_new_i64();
     t_zn = tcg_temp_new_ptr();
     t_pg = tcg_temp_new_ptr();
@@ -3596,23 +3605,18 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
 
     write_fp_dreg(s, a->rd, temp);
     tcg_temp_free_i64(temp);
+    return true;
 }
 
 #define DO_VPZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)                \
 {                                                                        \
-    static gen_helper_fp_reduce * const fns[3] = {                       \
-        gen_helper_sve_##name##_h,                                       \
+    static gen_helper_fp_reduce * const fns[4] = {                       \
+        NULL, gen_helper_sve_##name##_h,                                 \
         gen_helper_sve_##name##_s,                                       \
         gen_helper_sve_##name##_d,                                       \
     };                                                                   \
-    if (a->esz == 0) {                                                   \
-        return false;                                                    \
-    }                                                                    \
-    if (sve_access_check(s)) {                                           \
-        do_reduce(s, a, fns[a->esz - 1]);                                \
-    }                                                                    \
-    return true;                                                         \
+    return do_reduce(s, a, fns[a->esz]);                                 \
 }
 
 DO_VPZ(FADDV, faddv)
-- 
2.34.1


