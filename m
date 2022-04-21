Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00B50AAE6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:43:31 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheaI-0004Oc-9x
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWT-0005hC-Oq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:33 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWS-00072n-2M
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:33 -0400
Received: by mail-pg1-x529.google.com with SMTP id h5so5721283pgc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fBvMdhyQyGT4XBuYWcE8QFdmjK0EoeDOCL9zswq18nM=;
 b=D4WmLUtbc92lCbmUF/06WzUzXDKEXRBYkKcLlOrAgotWUDC7UFZzpCJ2hJXuisaRvS
 AX51d48apmEUZioMS9iWFEIgM4bm47Eky2bREXbc/J+80BivgVVBFfWIwKlSODPJf4ui
 aW2NLmsdjlvvd1JSwHafMp98MVKWnBkJQYjENQmCyqEDvBaev7lsJ4fKRZPAAwCZC5sX
 HRMXCcRFDSahJg9YY/APTSern9cCWI4xUAhP3wwLU1QdoXEwvgdcBrpQHaIat3SlSzxX
 3TYqQRPTJRNbMVkb/gFA0CKU0cU1hmpKNEWV2dQ2GAVbYZoXTs45a/Tec6x2ulrH8uOt
 UyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fBvMdhyQyGT4XBuYWcE8QFdmjK0EoeDOCL9zswq18nM=;
 b=yn2tveWNzDxXqmSWOQKaUilsnwoyyxwvHIVxrYLMcX2IlnaTjbol/e+0OjHG8Oi++Y
 ygnF2mo6RogaOYjVRfeK6LmqCdMO1rdgkRd4BSKAwL0SQsTYp046YbyagUNRMfYQ8pu4
 x2zji9K5aF+ChShw3oG6w3lrijueuv1clPcWF/z/sCy/2q1O4I5+PkWDzopjBaK8/hjw
 iCzB8UZog+m0nJgARIxwzSmKU6wFb7hm9xF32cFHlFL+cJlAjwsYyyxPSwxsK8aqo4po
 GRP9w+hL+U2kX5amrsLJ3LUoqMoyMHhkcnrI5dF7ssFut3UtVwQ0Jwle3T3S6IP/5kXU
 06Yw==
X-Gm-Message-State: AOAM531ciifOZMUGiWeR5KYe/y+x70H/bUqcX6Bk9Kz5kSWes4gWWXjh
 qj5ttTuoAs/EaeBsAOOHVP0OLbkuv4bIhg==
X-Google-Smtp-Source: ABdhPJxRLzQOyaoaBvlzZYPVq2Dpgi5LV47hs+iaHJG8/wTyJ7+Ysnbuydn/xIxg/AQ7VuJ7pXbVhQ==
X-Received: by 2002:a63:3e0a:0:b0:3aa:646f:f445 with SMTP id
 l10-20020a633e0a000000b003aa646ff445mr1212226pga.30.1650577170679; 
 Thu, 21 Apr 2022 14:39:30 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm73977pfi.42.2022.04.21.14.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:39:30 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/xtensa: use tcg_contatnt_* for numeric literals
Date: Thu, 21 Apr 2022 14:39:12 -0700
Message-Id: <20220421213917.368830-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421213917.368830-1-jcmvbkbc@gmail.com>
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace tcg_const_* for numeric literals with tcg_constant_*.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index f4dac27507fd..3379fc1fc774 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -306,16 +306,14 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
-    TCGv_i32 tmp = tcg_const_i32(32);
     if (!dc->sar_m32_allocated) {
         dc->sar_m32 = tcg_temp_local_new_i32();
         dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
-    tcg_gen_sub_i32(cpu_SR[SAR], tmp, dc->sar_m32);
+    tcg_gen_sub_i32(cpu_SR[SAR], tcg_constant_i32(32), dc->sar_m32);
     dc->sar_5bit = false;
     dc->sar_m32_5bit = true;
-    tcg_temp_free(tmp);
 }
 
 static void gen_exception(DisasContext *dc, int excp)
@@ -1957,11 +1955,10 @@ static void translate_mov(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movcond(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
 
     tcg_gen_movcond_i32(par[0], arg[0].out,
                         arg[2].in, zero, arg[1].in, arg[0].in);
-    tcg_temp_free(zero);
 }
 
 static void translate_movi(DisasContext *dc, const OpcodeArg arg[],
@@ -1973,7 +1970,7 @@ static void translate_movi(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movp(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_andi_i32(tmp, arg[2].in, 1 << arg[2].imm);
@@ -1981,7 +1978,6 @@ static void translate_movp(DisasContext *dc, const OpcodeArg arg[],
                         arg[0].out, tmp, zero,
                         arg[1].in, arg[0].in);
     tcg_temp_free(tmp);
-    tcg_temp_free(zero);
 }
 
 static void translate_movsp(DisasContext *dc, const OpcodeArg arg[],
@@ -6444,7 +6440,7 @@ static void translate_compare_d(DisasContext *dc, const OpcodeArg arg[],
         [COMPARE_OLE] = gen_helper_ole_d,
         [COMPARE_ULE] = gen_helper_ule_d,
     };
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 res = tcg_temp_new_i32();
     TCGv_i32 set_br = tcg_temp_new_i32();
     TCGv_i32 clr_br = tcg_temp_new_i32();
@@ -6456,7 +6452,6 @@ static void translate_compare_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i32(TCG_COND_NE,
                         arg[0].out, res, zero,
                         set_br, clr_br);
-    tcg_temp_free(zero);
     tcg_temp_free(res);
     tcg_temp_free(set_br);
     tcg_temp_free(clr_br);
@@ -6476,7 +6471,7 @@ static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
         [COMPARE_ULE] = gen_helper_ule_s,
     };
     OpcodeArg arg32[3];
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 res = tcg_temp_new_i32();
     TCGv_i32 set_br = tcg_temp_new_i32();
     TCGv_i32 clr_br = tcg_temp_new_i32();
@@ -6490,7 +6485,6 @@ static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
                         arg[0].out, res, zero,
                         set_br, clr_br);
     put_f32_i2(arg, arg32, 1, 2);
-    tcg_temp_free(zero);
     tcg_temp_free(res);
     tcg_temp_free(set_br);
     tcg_temp_free(clr_br);
@@ -6666,14 +6660,13 @@ static void translate_mov_s(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movcond_d(DisasContext *dc, const OpcodeArg arg[],
                                 const uint32_t par[])
 {
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     TCGv_i64 arg2 = tcg_temp_new_i64();
 
     tcg_gen_ext_i32_i64(arg2, arg[2].in);
     tcg_gen_movcond_i64(par[0], arg[0].out,
                         arg2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(arg2);
 }
 
@@ -6681,12 +6674,11 @@ static void translate_movcond_s(DisasContext *dc, const OpcodeArg arg[],
                                 const uint32_t par[])
 {
     if (arg[0].num_bits == 32) {
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 zero = tcg_constant_i32(0);
 
         tcg_gen_movcond_i32(par[0], arg[0].out,
                             arg[2].in, zero,
                             arg[1].in, arg[0].in);
-        tcg_temp_free(zero);
     } else {
         translate_movcond_d(dc, arg, par);
     }
@@ -6695,7 +6687,7 @@ static void translate_movcond_s(DisasContext *dc, const OpcodeArg arg[],
 static void translate_movp_d(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     TCGv_i32 tmp1 = tcg_temp_new_i32();
     TCGv_i64 tmp2 = tcg_temp_new_i64();
 
@@ -6704,7 +6696,6 @@ static void translate_movp_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i64(par[0],
                         arg[0].out, tmp2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i32(tmp1);
     tcg_temp_free_i64(tmp2);
 }
@@ -6713,7 +6704,7 @@ static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
     if (arg[0].num_bits == 32) {
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 zero = tcg_constant_i32(0);
         TCGv_i32 tmp = tcg_temp_new_i32();
 
         tcg_gen_andi_i32(tmp, arg[2].in, 1 << arg[2].imm);
@@ -6721,7 +6712,6 @@ static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
                             arg[0].out, tmp, zero,
                             arg[1].in, arg[0].in);
         tcg_temp_free(tmp);
-        tcg_temp_free(zero);
     } else {
         translate_movp_d(dc, arg, par);
     }
-- 
2.30.2


