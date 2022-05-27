Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF55367E9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:10:43 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugIC-0002QS-QF
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefT-0001hi-AA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:36 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefQ-0005Jt-3t
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:35 -0400
Received: by mail-pg1-x52d.google.com with SMTP id x12so4567274pgj.7
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/lNk2qkqgQ+rmGqQqN5rCG4jy7r+6S9uqaRalzDtp8=;
 b=O5x8Lah4/nSLBYNucKZrXWYCou8bVB6w726Zu2mJ2dCKAv2+kC/Ccy+NMuMnYbLKNr
 oqZODBKucG/UaGWR/+mgD6xxU+ZZWUdr/OrmTYwqSwi/b39rCiqCkVQJJW+o8T6dkO0n
 t+TYidnMGj8iiorMhX3mF/pJ/FctI4gMtrI0PJA+GP2euPFY8IwvJq1Kjy5etX9S388d
 ryTJKkJpsd6G8g8x2EwTRNb0//bMmaddBgikylzfHcEC4C7QMKKHdk05rrkOcxfK8tqc
 DVV6YJIBkup1w7ZTMYnWkMsAgdg6uyqu9TknvS/bTCZWzOmaJjY9y1qDJ/gYRgbPQ+B0
 2XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/lNk2qkqgQ+rmGqQqN5rCG4jy7r+6S9uqaRalzDtp8=;
 b=GOD/TCWgWmWHHjjyflYLQljb8wDuSXj8vQ7kOWc72PZeNtvbCvOL2bDeynrxFxWSuw
 oejQbuoU/VqESWdZrslmbbDPw+tDUnYaAWJ+QAG4FlLo5sXQ2Y1uHkrBiI1hBLRHlM4G
 4/Q56uM4CTFOHASEw7kFBEVVZrrMFdqNSQ2eiM9sG4LUxabJD82GyLsiAGbdEaxvgvP3
 bnY5FBcecLcvQv42+wIsIe0+aiY2jXEDmGA7LF3r2EjLFHD3z6lM7LUpHtpuIsEeD035
 /2YKUYjGKAru/LICW3UP5/MZeJPJZjrIVT+7mGFIadb0Qu0xrbgSx9wEYWhURzorHIf2
 D86A==
X-Gm-Message-State: AOAM532+FrQRzUaFSxLnTAmV4kZRxdvpk78IJ8t/l4Fkfm6L56QIAG+l
 HyhkgI6M47Si8AOk9IbwHQfkU7mykPQ/eQ==
X-Google-Smtp-Source: ABdhPJybRZICIi93DBOwvM9Pa12kq0hRB5XEuV8tfMdOF9Br/N0jLhRzszSF6W6du0mBtR54v5KYDg==
X-Received: by 2002:a63:d301:0:b0:3c1:7361:b260 with SMTP id
 b1-20020a63d301000000b003c17361b260mr38809558pgg.367.1653675990689; 
 Fri, 27 May 2022 11:26:30 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 088/114] target/arm: Use TRANS_FEAT for FTMAD
Date: Fri, 27 May 2022 11:18:41 -0700
Message-Id: <20220527181907.189259-89-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 29fcc8b014..11e4b4e1e4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3715,28 +3715,13 @@ DO_PPZ(FCMNE_ppz0, fcmne0)
  *** SVE floating-point trig multiply-add coefficient
  */
 
-static bool trans_FTMAD(DisasContext *s, arg_FTMAD *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_ftmad_h,
-        gen_helper_sve_ftmad_s,
-        gen_helper_sve_ftmad_d,
-    };
-
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           status, vsz, vsz, a->imm, fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_3_ptr * const ftmad_fns[4] = {
+    NULL,                   gen_helper_sve_ftmad_h,
+    gen_helper_sve_ftmad_s, gen_helper_sve_ftmad_d,
+};
+TRANS_FEAT(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
+           ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Accumulating Reduction Group
-- 
2.34.1


