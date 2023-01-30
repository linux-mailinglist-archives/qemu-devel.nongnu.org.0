Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6BF681C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGL-0000Dm-GR; Mon, 30 Jan 2023 16:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGD-0008Uw-FY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:18 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG6-0005TH-Gu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:14 -0500
Received: by mail-pf1-x435.google.com with SMTP id n2so8773231pfo.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSZ93NVjOlsJYs+Stnm1Qc6iqCekYJyqCbNnbkt4a10=;
 b=RPAkL56HzGTFTafafSZNEGBMk0/vyWqtnwtUQJNTWjb1cR8AY0K6sve6gm71FitD8h
 D++y5IkbxOL49eTlVJMzYnh0wvMImIo5Tyh6rLJ39AnfFb+pvzh+Bzl6AQ3txoEVCxI0
 H74K17cVu/GjYtVGX82zGiazztafN6V3rK5YbyFvIfxvwjxL+vHQRdIf2CnzmPpPvp5A
 LhSOwZ45Psf/fgie5Uq3BJ0FYbMR47/TdgLVlrLwptfbJb1oIgQvWdlwJe/wqBNBlsI4
 gflgRmFTatrg88GJGMb+KtF7ABvIk+jyL74ZKUeBuhNfa3RPQqhK2WNxUL8wYehE6TvY
 e1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rSZ93NVjOlsJYs+Stnm1Qc6iqCekYJyqCbNnbkt4a10=;
 b=WxgMAqqHklGcNHX87Y8QtWTe7pTL1kIVLOLyzn5Y8wIa8aYp1lPV1TGcA+I6SuFMWM
 KMbdy5LPmMo2LoVUMfiJDF+h/dOxQwzIA9se8GToyyKiPAjKJTc6UUyH7jqRdUSEnlzF
 2SQlU9ng9Son0v+yDy3SXY+halaWpTf2NWXmH8pOtCYtSgtu/MPS7vO4TGzTS9B26nkh
 YRo68zIYXhKrA58GOtolSMdpAR9FESyCYxC58WhPsABcdWdMPN37GJKQ25p5p1Qmpu7m
 7ZUdYa2910JeUtxYP9abPRMvidj/8cpE/U4U6gdPQ88cXlLFG/hHVwZXTtuRfbxH79XG
 vxgQ==
X-Gm-Message-State: AO0yUKWBpKTh0kf5qXefTF/YPetbcQvVdSqgkN2ZXMiGDhlOm9DaG2O5
 MinYr/pGV98Fc6qYRHllZTHf9XnTiuN55s/W
X-Google-Smtp-Source: AK7set8JPXuv9PIspvKLZ+p/cUWsSu99/EbbR80HC3jPOt5qAIXldvSyKODUs6/aU0lsHyy/YGRQeA==
X-Received: by 2002:aa7:98c6:0:b0:590:7526:713f with SMTP id
 e6-20020aa798c6000000b005907526713fmr17946261pfm.25.1675112406608; 
 Mon, 30 Jan 2023 13:00:06 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 16/27] target/arm: Drop copies in gen_sve_{ldr,str}
Date: Mon, 30 Jan 2023 10:59:24 -1000
Message-Id: <20230130205935.1157347-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since we now get TEMP_TB temporaries by default, we no longer
need to make copies across these loops.  These were the only
uses of new_tmp_a64_local(), so remove that as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 -
 target/arm/translate-a64.c |  6 ------
 target/arm/translate-sve.c | 32 --------------------------------
 3 files changed, 39 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index ad3762d1ac..ca24c39dbe 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -19,7 +19,6 @@
 #define TARGET_ARM_TRANSLATE_A64_H
 
 TCGv_i64 new_tmp_a64(DisasContext *s);
-TCGv_i64 new_tmp_a64_local(DisasContext *s);
 TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6678894ec7..aed8b2eed1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -436,12 +436,6 @@ TCGv_i64 new_tmp_a64(DisasContext *s)
     return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
 }
 
-TCGv_i64 new_tmp_a64_local(DisasContext *s)
-{
-    assert(s->tmp_a64_count < TMP_A64_MAX);
-    return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_local_new_i64();
-}
-
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 {
     TCGv_i64 t = new_tmp_a64(s);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 621a2abb22..02150d93e8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4344,17 +4344,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4370,11 +4359,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /*
@@ -4445,17 +4429,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4471,11 +4444,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /* Predicate register stores can be any multiple of 2.  */
-- 
2.34.1


