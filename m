Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E1513886
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:38:54 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6EH-00018c-88
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0005b4-Tq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jw-0006Rd-D2
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so7051288wrg.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oxBsLjBWF67ZQgabv8/DQjbiCvH28pekoKWs+cpSy50=;
 b=hJNI4VoOW3ZXaWbWIquKA8SqihAYU8GchTAUfX+oTbilHv/ELpQXb1Co+vsBarziKF
 LTGdpWku0hfHx+XYTsYdSETzVao+h8fdaRUD/MDMMgBaP1sROG7yi8PXVkNWM8VBlIeH
 aGFyqbXEvDhvNVFbzX3kjPkkZjAYDNMCr5Wx07qcig6IRI1frP2zoh8DJQEbKGrvvvKE
 tQLKSaUKQLK0O3s7ZZIAbdUcP8SoJzc117TaTHrrJswoWNwXPIeFvMBnOLMBOtl0bsL1
 VstSKxZrxbg+HcaXiRIrCpS2GUNBdvyr3uESS257syJ+khwrVfLsU4n8hVYcgrzimm9q
 3rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxBsLjBWF67ZQgabv8/DQjbiCvH28pekoKWs+cpSy50=;
 b=OfI9tUS3BA6U03k/VEJTTmgqkdhfOA4GqcS6ImpqWfN1HXNaU4Zw2C9zMPA4FEr4Vx
 8gyAD8LhrXxOSqL7rNuTogo38PVUx0APo1nFgPTtS2bbLEXlPx3yP0WL+vQPtGmAqKcM
 p80us9QF25NafslD0R5kSOkiH18eEYgJueBK4vGF/XBdn7olGT0DdzypNFIGMwkzNSo9
 Pg287IZ0zus18UO7AGww4cDZqu2pm616iRNaCxtLYb1QZB9iK4kc/X0/tiMTBcW7W1VK
 AkjFLmGANvtCVqy3XrOAehQGpVrNyRPTng/ujMGG5Gj6/zDKjcrtFFxey3n520l3VbFr
 1Rcg==
X-Gm-Message-State: AOAM531co+93m8aRgt0qRJgK4Tv6vq3vO3jjre+JQbmaL0wkaqiKRPxd
 vu4SsLAJOlS9/LDpM2RBZTvIkjzAaD8/hw==
X-Google-Smtp-Source: ABdhPJwxEpWBcpGudeB04XhhmorRhKKbk/o66fxgwoB0Av/xlq4DVupYkKFTcS0QoTDUTlAq/e/t6w==
X-Received: by 2002:a5d:4e92:0:b0:20a:cafc:ebf1 with SMTP id
 e18-20020a5d4e92000000b0020acafcebf1mr24601069wru.17.1651156837168; 
 Thu, 28 Apr 2022 07:40:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/54] target/arm: Use tcg_constant in SINCDEC, INCDEC
Date: Thu, 28 Apr 2022 15:39:41 +0100
Message-Id: <20220428143958.2451229-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-38-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8b173f5c4aa..9321457f31e 100644
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
2.25.1


