Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB02D53679C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:40:46 +0200 (CEST)
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufpE-0005fj-TN
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003b0-6w
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec4-0004Q7-5D
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:17 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j6so4958386pfe.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jZwbSGmDVYYUKOSscWs7GEbJo3Q7mHcBlc9ur8AKu8=;
 b=AcsHLLZDL58b1WREfGXaqo0VcnYB+NUJbFlIUEIhNZL2z5V6D/TAroDGTzDFEj/u/u
 AHjbowdmlUJD6kqS6nA2xMN4IWRIbTlmxHGX1vbX/AJDZchKdFCJHSQjIoRv0M8iLNOV
 cmvD6FLH62KJJH7IafMkMbj8sQrf2KIOe79qn2GLf5JW/jor9zWq4CDCUZB4RlNgChYw
 SbWqf5jzURngI9C8r00PhdqmGBG/5GrGVwiV61eE7RME2tlzbXYoMLjc1se+RBFr1Fuk
 oHKmUNYj/JwG7Pgo6UvfjbeV08nCoVosTdGKaFFe0Ir9RuC3nLHC3DlSoz8dVaU09zij
 5Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0jZwbSGmDVYYUKOSscWs7GEbJo3Q7mHcBlc9ur8AKu8=;
 b=wERXq5u2ufAaD8Lk/8eDXkwcOqYEF1W8JVgxWUcM0tPLqpsNUx0vP7oHtcqUZuftAV
 U3I/z+o4Nf3lf/9RAAKITKfRSHGFW07Rp7nRVy13mGaKt5AkDvTCNrAbknsEULtrg3xV
 cm0L+FySfO1ZUvLXyWqdQARKqqZ3hb8S3swZF5y4td5zluI3scdO+sEdY7zR/0GoXXKa
 bMColgsCcgfXwf9wRtxiuKH8fjj3e+BEZQ0GAdPNaawwrgqLYWou1WhDMYkOsyXH3jaX
 F3G+YyvTNQwtfArQZQNb+yyu9UhZVmq6dVsz81DvE7c29ELPIRsQ0wsicAuUyHmmbGiG
 98mQ==
X-Gm-Message-State: AOAM5312ywp/V1BGlXBLoIaJM1VKOsXH9nv66QNBUY7mKcGLvKrIfsrn
 cMxq8nB22xoIlZOHw09s+9ZjJbtrtWXSxg==
X-Google-Smtp-Source: ABdhPJxcBMhVGQ+ok2MNbH4sp6BaF3maPXmCoDzTzl+NEMX37OdVHccgzdZVy951EIuGnNTBpc/I9w==
X-Received: by 2002:a65:6e0d:0:b0:3c6:12af:15b4 with SMTP id
 bd13-20020a656e0d000000b003c612af15b4mr38271772pgb.338.1653675781843; 
 Fri, 27 May 2022 11:23:01 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 057/114] target/arm: Move sve zip high_ofs into simd_data
Date: Fri, 27 May 2022 11:18:10 -0700
Message-Id: <20220527181907.189259-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

This is in line with how we treat uzp, and will
eliminate the special case code during translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    |  6 ++++--
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e0f9aa9983..3bdcd4ce9d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3382,6 +3382,7 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
 {                                                                    \
     intptr_t oprsz = simd_oprsz(desc);                               \
+    intptr_t odd_ofs = simd_data(desc);                              \
     intptr_t i, oprsz_2 = oprsz / 2;                                 \
     ARMVectorReg tmp_n, tmp_m;                                       \
     /* We produce output faster than we consume input.               \
@@ -3393,8 +3394,9 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
         vm = memcpy(&tmp_m, vm, oprsz_2);                            \
     }                                                                \
     for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
-        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
-        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
+        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
+        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) =                    \
+            *(TYPE *)(vm + odd_ofs + H(i));                          \
     }                                                                \
     if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                \
         memset(vd + oprsz - 16, 0, 16);                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1e6bcedb9d..c2ced3e2bb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2298,9 +2298,9 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
         unsigned vsz = vec_full_reg_size(s);
         unsigned high_ofs = high ? vsz / 2 : 0;
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn) + high_ofs,
-                           vec_full_reg_offset(s, a->rm) + high_ofs,
-                           vsz, vsz, 0, fns[a->esz]);
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, high_ofs, fns[a->esz]);
     }
     return true;
 }
@@ -2324,9 +2324,9 @@ static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
         unsigned vsz = vec_full_reg_size(s);
         unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn) + high_ofs,
-                           vec_full_reg_offset(s, a->rm) + high_ofs,
-                           vsz, vsz, 0, gen_helper_sve2_zip_q);
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, high_ofs, gen_helper_sve2_zip_q);
     }
     return true;
 }
-- 
2.34.1


