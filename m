Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA41513835
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:23:40 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5zX-00016P-8B
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0005b9-VZ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jw-0006RZ-Dj
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id w4so7051244wrg.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sLsR4LdrshsEV7YMPUFYckR+2cnWHfJuROYYRnmFPT8=;
 b=TKGYwUhLIA35xV0O35CrP8Kg1ZsmuuptXWuSDJyaEJyzcsXMtr9OfB/2PXxJVXUS31
 lUjLAWlzwaqP9uMR1y3H2qIilVUjRao3oQebv0bWnLawioPlbUHaQoQPAAKw3OhxBzRw
 ht9NPDIQ/OH201BASR1Ph8K50TK1/ZQmRiy1Y1NlFRThN+krS6zTHVY1zaRdoJDrUiEG
 bpT8GJGeu1etNsufpdtcCBp6J6z1H8i+nDAm8Vp9QyWJ1TOxczcLSe4Yd4ta4/tdA1/y
 8St52La1Cv5mw+7YggLfrwCuxplgOnZWgQBIJIL+RAAI8Bm/N8rn8BtnJn11kSjld+n6
 Xs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLsR4LdrshsEV7YMPUFYckR+2cnWHfJuROYYRnmFPT8=;
 b=6v6/x5HMUoVRGUn5q6DeRH47u9MhRr6ZY6AkplFim4X9incVKS7X5hIIuJu9/TXbTy
 4wDLzD/v83GiCmoLmYpAC4CpM3yBMSU6X381KnjfUGWnfARwaIyPSdXqh7GUqElHb0d4
 O6z1J92qJ0LSVM36XOJpK/B2IZvX1T2t5GGGcxZCp7x9h/YeA4dMKwSUU2WRMURS4C2c
 D4DqQsv5DCu2Oqpg9Cmfsy2aPoz0VCBiNiCibEGDvmk7FPjOZfa6geUXBEo3RVkJKQhQ
 HfBg38Xy8rhVB/4Nx4+xwraTi0wiNxhQCuUnzkMm/b2fOwLQHP7qqtamxO4Ts/B3Dhou
 QouA==
X-Gm-Message-State: AOAM532ZkG4BcMewjFVNWc0zBCudG+PSc/awq6p4i9YDMXtN2dcJI2tG
 Qb//hXidLwhbzrTdOAZHN6DIhbVQbrN3kg==
X-Google-Smtp-Source: ABdhPJwkQR1gkeGHuOnBKCD8ZgmTgVqIk5O3Hw+XO8D0lCXe23t5tBdw28hl316bymjgbLZd2LxnNA==
X-Received: by 2002:adf:ec51:0:b0:20a:cd42:fe3b with SMTP id
 w17-20020adfec51000000b0020acd42fe3bmr24226188wrn.719.1651156836429; 
 Thu, 28 Apr 2022 07:40:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/54] target/arm: Use tcg_constant for trans_INDEX_*
Date: Thu, 28 Apr 2022 15:39:40 +0100
Message-Id: <20220428143958.2451229-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Message-id: 20220426163043.100432-37-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 726cf88d7c5..8b173f5c4aa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1266,11 +1266,9 @@ static void do_index(DisasContext *s, int esz, int rd,
 static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 {
     if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_const_i64(a->imm1);
-        TCGv_i64 incr = tcg_const_i64(a->imm2);
+        TCGv_i64 start = tcg_constant_i64(a->imm1);
+        TCGv_i64 incr = tcg_constant_i64(a->imm2);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(start);
-        tcg_temp_free_i64(incr);
     }
     return true;
 }
@@ -1278,10 +1276,9 @@ static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
 {
     if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_const_i64(a->imm);
+        TCGv_i64 start = tcg_constant_i64(a->imm);
         TCGv_i64 incr = cpu_reg(s, a->rm);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(start);
     }
     return true;
 }
@@ -1290,9 +1287,8 @@ static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
 {
     if (sve_access_check(s)) {
         TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = tcg_const_i64(a->imm);
+        TCGv_i64 incr = tcg_constant_i64(a->imm);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(incr);
     }
     return true;
 }
-- 
2.25.1


