Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22528332C67
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:42:26 +0100 (CET)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfRB-0000h2-5H
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefl-000507-3n
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:25 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefe-0001Hp-Pz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:24 -0500
Received: by mail-oi1-x229.google.com with SMTP id v192so7849974oia.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPQnPJ7DMhJJR2d+A/Ri0b5LMFWa1kAHZRSsfJazyFE=;
 b=CGklaU2VC4z9nSnobL5Chl81RexnvQ2fhx0iuuwEO1vQFMPRe+lGtL1opZysUkbOds
 BjsY1/mEJARUwC7o4pH65C4ZGeAKUFT3slYIpOVLkxTEerNyxy3kribuzp1dk6k59lw6
 E/ChaWqEzD+DrVAqfF6Ta/Bz8+wQZmxBiwmTmIEr3K3FW9qzX6/Lq8hhLU437dHCWVcj
 sQclWVkrpDdzA3hiKCs7c9dbtst3MsVREp6W/u9TFYP6ev5mkMvmjkj+it9g7dAIWHkZ
 6r/taznM880SlJ6KNaMCM3ISsc9tO2z19htYGGWDQ4ZSIzmuyZla3YzLlAmXVrsWY8k8
 flGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPQnPJ7DMhJJR2d+A/Ri0b5LMFWa1kAHZRSsfJazyFE=;
 b=sj5rIG3Uyc8Sa3J7FK75hWtGSS4BPyjfvaz7hEi24hkmJ6LfHWRMZgrt5rpLn86KK1
 H6IhjYMKFMTOg87HE51+Jjyez5n4hJqTUGwtrRL+lsWThhcWy4+OKHjvA249EnOnTEwx
 B2JF3xRgp9nj3Fg2nMtCY4j7Wl0hgEriFr3ZFzz5I4TrVyEUAVHcz/sLU3wkKg7LTJgB
 kB77AHaC20IcROlcQQ9n04j4Kdwa3VSXzHhNCOEF7Xi6BLpJNhnAweKEYHsYALSX32Ox
 tqhn9GaeiKgTBrTWXlrwYynGzPImD3pp3Jv0W032eqci4QpnrFXilRg+GUy9ggsV7TSj
 a3gw==
X-Gm-Message-State: AOAM530HfUyzVEjoZuA8C0y+BS4Pol/adu9wtC5SOlN56EsqQTJq9avJ
 brbfu2Xy8WWtsd9tskWM4et4SmPzxAIo0CB2
X-Google-Smtp-Source: ABdhPJzx22I8KOesJOPxeMQHNPHe/hq4YtQuKa0CTb3cl+rx1wZ+R3I44vEKjUJe6GjpY3AWnJPBNQ==
X-Received: by 2002:aca:44d6:: with SMTP id r205mr3416941oia.104.1615305197748; 
 Tue, 09 Mar 2021 07:53:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 8/8] target/arm: Update sve reduction vs simd_desc
Date: Tue,  9 Mar 2021 07:53:05 -0800
Message-Id: <20210309155305.11301-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the reduction operations, we intentionally increase maxsz to
the next power of 2, so as to fill out the reduction tree correctly.
Since e2e7168a214b, oprsz must equal maxsz, with exceptions for small
vectors, so this triggers an assertion for vector sizes > 32 that are
not themselves a power of 2.

Pass the power-of-two value in the simd_data field instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 2 +-
 target/arm/translate-sve.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6f4bc3a3cc..fd6c58f96a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2896,7 +2896,7 @@ static TYPE NAME##_reduce(TYPE *data, float_status *status, uintptr_t n) \
 }                                                                     \
 uint64_t HELPER(NAME)(void *vn, void *vg, void *vs, uint32_t desc)    \
 {                                                                     \
-    uintptr_t i, oprsz = simd_oprsz(desc), maxsz = simd_maxsz(desc);  \
+    uintptr_t i, oprsz = simd_oprsz(desc), maxsz = simd_data(desc);   \
     TYPE data[sizeof(ARMVectorReg) / sizeof(TYPE)];                   \
     for (i = 0; i < oprsz; ) {                                        \
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2420cd741b..0eefb61214 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3440,7 +3440,7 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
 {
     unsigned vsz = vec_full_reg_size(s);
     unsigned p2vsz = pow2ceil(vsz);
-    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, p2vsz, 0));
+    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, vsz, p2vsz));
     TCGv_ptr t_zn, t_pg, status;
     TCGv_i64 temp;
 
-- 
2.25.1


