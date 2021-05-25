Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9A38F803
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:19:00 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMep-00045z-5A
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYV-0000yx-JL
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXt-00047w-Dg
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:23 -0400
Received: by mail-pl1-x62a.google.com with SMTP id t9so7067022ply.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgZhxU07vdbFbL3Rra8/VVNowuJ8Xs/CdPm7YJWJNXI=;
 b=M8kpUrSjJ5a0hwd/HrgMt2/H2Nz8ZqvBEadKqHxhvqXxdvvCoxgQGEEMUBPX26Ej/8
 EyjW8JoYob5en2CYK5NxHrcq8R00QsfRnua5EE0NuFuI3oZ3TjwFHY05ueHsNJgbURld
 oiTLnNc41kaOXnsiFebR/mOB+pAiJMOzsvu1RtL6z5PBcY7ZAYnLe56m4WI6F/AhmtMM
 xQSK6UXOyoddW4XjuRvpyYrKiaxgdogO3HpenGh4/7xEFZbuZuOYGS7H9/3EENVRAFoD
 mvuYksnJwf6TELtDXxWITBeZYNjrHUrYHga9fVhcwdVJrKJ6Cqb/V5tLAHDP//Ft+xTz
 NtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgZhxU07vdbFbL3Rra8/VVNowuJ8Xs/CdPm7YJWJNXI=;
 b=Qjt8Rt1SoDeeu83Dz5Mrp41r3vgYH7jrCEKEpodUICQvy7n8uOjKNUAROT8sXqc45U
 dj3OiRVpQHATs20LoUC0LRUgwqw31v+zjJDbOA/haeR10oD6HKlIcA0VEPUxq5VfMvhy
 e7bVG3IBYqcuKAyZNIUqWV6Tgej9Rb6v1KtObLf0blG8Xb645kPDzECzv+1USkf9u8mk
 wcSuq+XKSnJjwkeZl/jQv76aWU2DkPXsZJ9yzmY0XeTXcq+4JY2dLI+8QB58YE4JUyv+
 JE7UF0Eb/JJSUdCLJb3RN3zP+MIvSOQjRSIPmgtY4i3Uz8ZQxMZAETsFcc9VfyJ7VcG8
 LocA==
X-Gm-Message-State: AOAM533Bkx4qlCxwMlPiqXlt7l/PODKuoNQZsuToUm2qqRF9GLCl2XUf
 PFOQkTrcC0mE5dzNU3OhtrbjL/gdzkaRyw==
X-Google-Smtp-Source: ABdhPJyYedMgoSoVE7TRRHCjF/oWUEWZt7uTBJJFrUBGOKu2KERCr5K2faBhuYgyQ5cA/y0CwaQGuA==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id
 oc11mr27749617pjb.156.1621904863964; 
 Mon, 24 May 2021 18:07:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 72/92] target/arm: Implement SVE2 FCVTNT
Date: Mon, 24 May 2021 18:03:38 -0700
Message-Id: <20210525010358.152808-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Fix big-endian indexing.
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index cdff155ead..7aa365d565 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2744,3 +2744,8 @@ DEF_HELPER_FLAGS_5(sve2_cdot_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_cdot_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fdeb7b106b..94cdc6ff15 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1580,3 +1580,7 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4b05e2e427..d44bcfa44a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7602,3 +7602,23 @@ void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+#define DO_FCVTNT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t,     , H1_4, float64_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9a6f7c87c1..700b02814c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8246,3 +8246,19 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     }
     return true;
 }
+
+static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
+}
+
+static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1


