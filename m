Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A231538F7B4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:49:39 +0200 (CEST)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMCQ-0002xL-Mh
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYK-0000D3-RF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:12 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-000466-VP
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:12 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n6-20020a17090ac686b029015d2f7aeea8so12277297pjt.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LkYL6oLmF6Ik5JttTbaNom5I8sHRj4wI+YARoykw1E=;
 b=D+eWJZWG+Hmy7/cZ8YxYljkmWrnneUWQ9a/bgdcevayXkmn+9IVf7SQCTcXiTnh/3Z
 mulvQwv/a2wKvr6MLlDLvskdpB1KioIxoiYrdFFkSZteOlB2d/EAB5p6DLvdpjqFkF1N
 7zKpyJv5viYaxHRx6kRWqcsi75yw+h1BkHXd3l4cQHDoKdxI32yp6CXpr9peCsYkzb7D
 iXoGt9y8MWZqjzn0kBVRCJqGNBPUDXPckQ4s6QmHBtFTVpwefacMTnZvAGelhTNd+L+9
 Mac6oZjtomioiUQ3lL/yJlKisOMJbWMTDdQ76QI5kyXDMmZrTrIXa84ygzN9TXyZ597i
 uSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LkYL6oLmF6Ik5JttTbaNom5I8sHRj4wI+YARoykw1E=;
 b=Jgj0HwSwJurXIvvFd52laKrUG79SR7EEkKmaeewVgsmHeJTl+gq2RyhrRYReY1Tetg
 1HwY19oKlo58JBEb7YUuIuvgPAfN6PhYf9kAgP3NdwN7RnqAV4NUdjVPYBfe66BfnfHU
 bLiVw9lObAQ0viaMphmnNaMC85dYTfbrlBgKQRhNqPOjjEleAoyMZYpCdbKjsTFmHc13
 vwojGnmZuNenNJOhG+4Jp06himOUhvAiukTtlsH06w3Hiv/A57iwpdrvBF2mZsypdUaE
 6mjKTYRfGNM7kytzkligDrsE6vhml/KRCUvbmuSrg4pwY8A4kd37aBKTo/KlQkbtwZ8L
 gEGQ==
X-Gm-Message-State: AOAM533d7uwYupsF1ShEGHXYfkSfKIhcwPEcjV2ZT7I/NczMFSXh3PbI
 k241enJwtyBITO7IsUhMQ3EmvJToXKrvvg==
X-Google-Smtp-Source: ABdhPJyknisWuaKB1eVgbZgH3P9CDsAH15BHfgBeYsfjHdwrThAY6kr0Jf8QaM7lbE12AHrtWbFtKQ==
X-Received: by 2002:a17:90a:af85:: with SMTP id
 w5mr27163936pjq.115.1621904860009; 
 Mon, 24 May 2021 18:07:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 66/92] target/arm: Implement SVE mixed sign dot product
 (indexed)
Date: Mon, 24 May 2021 18:03:32 -0700
Message-Id: <20210525010358.152808-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Macroize the helpers.
---
 target/arm/cpu.h           |  5 +++++
 target/arm/helper.h        |  4 ++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    |  2 ++
 5 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 595bc6349d..0a41142d35 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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
index e7c463fff5..e4c6458f98 100644
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
index 0339410cf7..c6b32a3f69 100644
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
index b454f50a6b..30894a4143 100644
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
index 1c4266a9c0..f128b41eac 100644
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
2.25.1


