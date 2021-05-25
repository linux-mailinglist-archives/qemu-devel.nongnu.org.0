Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748939063F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:10:26 +0200 (CEST)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZdR-0000zM-B2
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc7-0004qF-Vz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc3-0004y1-Ku
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id n4so6684255wrw.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yH7WhiyRoEXGcm6/Gco7Ste1wikrK4FVbwx3UIBSUek=;
 b=iXOW+mN38XCnWRQ3eGOjqVrrGp6r5ZysQCdEObsn6y0tfn0ydxjjD8biRLFu0/ZpJ5
 jN2pyeY0g2lroDJZPQ1+bnKqEanOiaJaDV2CptDmFAkaJfJF7J2UNnKYNXc9I+QscGjA
 RdDs2rmtC7h6TOccWulVH43g1Kkzw6+nSzovkfQ1AlQ/FYS8TvCzp0Tik/bOdmueCvl4
 jpWdYZuc6w1mGn8a00NmkZzZyyPLvu/rK13/K04tokmbEBNY6jdNsNpbMejO+N03v4Om
 rYtc+mSaVOkhs+UCnDq6T85zMzQnQW5Q5iBwhISkiUyENoGF53X9p8q0hJTeYW3DCrEY
 rvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yH7WhiyRoEXGcm6/Gco7Ste1wikrK4FVbwx3UIBSUek=;
 b=KAHJPO8HY5b067DF0X9xE8ueQ7w6cCs9dWdy87Qhx/TSmr02l8ABtEMKDu98VvJJgz
 JcQ81Y5X/iDT4POHGlTrI1zLLEKQVlPlmikWbwXRYYORW0docQMv4JTk7fSEByDp2S2K
 1IFV/zttxX7AzbE5ah1J5Z9WcdE1jqVe+7YEhNM1FaNifxgLg6QN17SBEfYa6Nm+Gn9r
 Uq979cYX8ZmCyN4WCGxGKSrcDVD55DGZPoH4g8+bs5WQUyNnyZarOEDsBdwx9Uew0iGX
 WjFQiQ0OlwyyATQIaAdB7jgVsghbjX/WkL4+1m0fZL6Ob/YR1efsJW9euIIEjldD5wml
 UyiA==
X-Gm-Message-State: AOAM5328EyPPesDU+uTVTINAVTZnxezg3swab5U5fQUqcHFYqmXOD+zA
 jOYrvgwd2JHl67PFaav7fD1AjvXtVDcPE5nP
X-Google-Smtp-Source: ABdhPJzeeoqXi60BY+VUIMQCyc1T92+yX8PiTjYBQb5xS+hQ8uhRaPxO0mxKNAbcTl73YkdSWWxVTQ==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr28043440wrn.368.1621955094185; 
 Tue, 25 May 2021 08:04:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 088/114] target/arm: Implement SVE mixed sign dot product
 (indexed)
Date: Tue, 25 May 2021 16:02:58 +0100
Message-Id: <20210525150324.32370-89-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-67-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/helper.h        |  4 ++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    |  2 ++
 5 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7ad79ff42cd..dcdde85f866 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4256,6 +4256,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa64_sve_f32mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
diff --git a/target/arm/helper.h b/target/arm/helper.h
index e7c463fff57..e4c6458f989 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -621,6 +621,10 @@ DEF_HELPER_FLAGS_5(gvec_sdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sudot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0339410cf76..c6b32a3f69d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -816,6 +816,10 @@ SQRDMLSH_zzxz_h 01000100 0. 1 ..... 000101 ..... .....   @rrxr_3 esz=1
 SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
 SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
 
+# SVE mixed sign dot product (indexed)
+USDOT_zzxw_s    01000100 10 1 ..... 000110 ..... .....   @rrxr_2 esz=2
+SUDOT_zzxw_s    01000100 10 1 ..... 000111 ..... .....   @rrxr_2 esz=2
+
 # SVE2 saturating multiply-add (indexed)
 SQDMLALB_zzxw_s 01000100 10 1 ..... 0010.0 ..... .....   @rrxr_3a esz=2
 SQDMLALB_zzxw_d 01000100 11 1 ..... 0010.0 ..... .....   @rrxr_2a esz=3
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b454f50a6b7..30894a4143b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3838,6 +3838,22 @@ DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
 DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
 DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
+static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, gen_helper_gvec_sudot_idx_b);
+}
+
+static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, gen_helper_gvec_usdot_idx_b);
+}
+
 #undef DO_RRXR
 
 static bool do_sve2_zzz_data(DisasContext *s, int rd, int rn, int rm, int data,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 1c4266a9c09..f128b41eaca 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -598,6 +598,8 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
 
 DO_DOT_IDX(gvec_sdot_idx_b, int32_t, int8_t, int8_t, H4)
 DO_DOT_IDX(gvec_udot_idx_b, uint32_t, uint8_t, uint8_t, H4)
+DO_DOT_IDX(gvec_sudot_idx_b, int32_t, int8_t, uint8_t, H4)
+DO_DOT_IDX(gvec_usdot_idx_b, int32_t, uint8_t, int8_t, H4)
 DO_DOT_IDX(gvec_sdot_idx_h, int64_t, int16_t, int16_t, )
 DO_DOT_IDX(gvec_udot_idx_h, uint64_t, uint16_t, uint16_t, )
 
-- 
2.20.1


