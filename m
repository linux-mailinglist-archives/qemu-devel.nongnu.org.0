Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325951051D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:18:15 +0200 (CEST)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOpK-00046e-C7
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO63-0003BG-AE
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:39 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-0003yM-64
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:26 -0400
Received: by mail-pg1-x52a.google.com with SMTP id i62so4321944pgd.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbs3KJK7K3c2itFwMrF6zlwFkUuhQKPhP0rTJMiuIOk=;
 b=Rma344yO0AWoZRqmX1snpseo0Dj3xLhpKcDEcV7812Z9WuQxH8OpfqKYsXs2HYnmbL
 A1zvRuTqbl/KqpUlAtF2iQD5z0zDfWFH6e4O6zLBEG48OTXLfDcvD+SSDmDsObUBEgQj
 xe3WMwHdx4/BPki0xxfMRVDftXIXquje9w/o4QMUBtZWDJq0n0TORQ11zbhFh5PrTrYE
 aUqcahEaC+YOgJwZqDlODT0z1BFHZZkY2wly6beOuu+P7oqmHS+Z4H1kT+8bgmviTRlC
 WtaD7I9tDQCYJ/t5/kDCo4DMl2UHbQCMzsbv1rrU0WX2RyYXN8zvkduoH8WJTKiGGv2B
 TdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbs3KJK7K3c2itFwMrF6zlwFkUuhQKPhP0rTJMiuIOk=;
 b=B9e4KU7lAFPuto6PVerpxePq3HsIzmYFrB8bMRJvs9eK/LJMzLEDpCRkgfIBLfA8xd
 7QPmiibvclz+F5Vc4/tbxrDGfNwq3qKTOnpA8fROgxdPq4myf8qHkHsvvjQ8UQhrV6az
 gLPuDwBON1wi0xzedJw8N6D5xXq9d0ptyqyrYl9e8ugi/D7C70S/YDxdq3GVSUpcnCqv
 OBko6AFTEFNnYjQ29E26lmrOmxdqYsQ/KaKgVvui8oq7sGY2e5sirwZM73UookJCsJad
 lrc/OkU7bF9phinWHMq/WZ8mOMZATQ0B13jCWYqK+AmL7BZlYwAntq9qrwXfoR1HLu6T
 Z2Pw==
X-Gm-Message-State: AOAM530E+IjETPCs+7ACxQKndVgx/EEY8TaJhF690cMwfBXctH9DB2Y1
 YOjSpOisJNjKJQKN4pBf99jQtJKJ+3dEYw==
X-Google-Smtp-Source: ABdhPJzDzRQ0tck9SwCUOxuKP72rfBkfrDO9qioW9Jnh2cbMa1Dw0H1Uv7KiYzvvyLApuKlnq/9pzw==
X-Received: by 2002:a05:6a00:198c:b0:505:c18b:3184 with SMTP id
 d12-20020a056a00198c00b00505c18b3184mr24929206pfl.82.1650990679444; 
 Tue, 26 Apr 2022 09:31:19 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/47] target/arm: Use tcg_constant in SINCDEC, INCDEC
Date: Tue, 26 Apr 2022 09:30:33 -0700
Message-Id: <20220426163043.100432-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 target/arm/translate-sve.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8b173f5c4a..9321457f31 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2103,9 +2103,7 @@ static bool trans_SINCDEC_r_32(DisasContext *s, arg_incdec_cnt *a)
             tcg_gen_ext32s_i64(reg, reg);
         }
     } else {
-        TCGv_i64 t = tcg_const_i64(inc);
-        do_sat_addsub_32(reg, t, a->u, a->d);
-        tcg_temp_free_i64(t);
+        do_sat_addsub_32(reg, tcg_constant_i64(inc), a->u, a->d);
     }
     return true;
 }
@@ -2122,9 +2120,7 @@ static bool trans_SINCDEC_r_64(DisasContext *s, arg_incdec_cnt *a)
     TCGv_i64 reg = cpu_reg(s, a->rd);
 
     if (inc != 0) {
-        TCGv_i64 t = tcg_const_i64(inc);
-        do_sat_addsub_64(reg, t, a->u, a->d);
-        tcg_temp_free_i64(t);
+        do_sat_addsub_64(reg, tcg_constant_i64(inc), a->u, a->d);
     }
     return true;
 }
@@ -2141,11 +2137,10 @@ static bool trans_INCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 
     if (inc != 0) {
         if (sve_access_check(s)) {
-            TCGv_i64 t = tcg_const_i64(a->d ? -inc : inc);
             tcg_gen_gvec_adds(a->esz, vec_full_reg_offset(s, a->rd),
                               vec_full_reg_offset(s, a->rn),
-                              t, fullsz, fullsz);
-            tcg_temp_free_i64(t);
+                              tcg_constant_i64(a->d ? -inc : inc),
+                              fullsz, fullsz);
         }
     } else {
         do_mov_z(s, a->rd, a->rn);
@@ -2165,9 +2160,8 @@ static bool trans_SINCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 
     if (inc != 0) {
         if (sve_access_check(s)) {
-            TCGv_i64 t = tcg_const_i64(inc);
-            do_sat_addsub_vec(s, a->esz, a->rd, a->rn, t, a->u, a->d);
-            tcg_temp_free_i64(t);
+            do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
+                              tcg_constant_i64(inc), a->u, a->d);
         }
     } else {
         do_mov_z(s, a->rd, a->rn);
-- 
2.34.1


