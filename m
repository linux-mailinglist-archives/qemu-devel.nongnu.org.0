Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E36F4292
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:21:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3h-0000fA-Jt; Tue, 02 May 2023 07:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3e-0000dK-2G
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3b-0003F8-RL
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so21781105e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026427; x=1685618427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ee+/tZtVXx1HapVlpwz6x03LyQaqO+PtTzdE1w9ii1A=;
 b=le8Xs9Pl+NaJ/z3rk1AUbsD9rFF+L/g/N3jCMcQ2t+r2PLhc4cAu8ouRBBTm0y2GYS
 pqYDGXCVHi0aiBoh+5JGBactqSE+sPNIbuY3zz9IPl7TN4JMrUoS6MC8fZlGy+/sT5og
 jqHpB9bBA+Pr7qxHkgXALpzkL8Gqbkb1qM54bb30xveaNxCBPgVOnCbvACPAXzx96Q6c
 v41SnACGPHGWTmdrmMCZaD5LG8a4GBBipVqiwQwHBdakHX6qmBK6sASmBVHwnTqkHUkn
 3qj+IaQoKks+FdbWklPVpK5f9RWoC3+lddjReQIGbXzvnPJPz341OcUY5DmfvRguoDwB
 jd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026427; x=1685618427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ee+/tZtVXx1HapVlpwz6x03LyQaqO+PtTzdE1w9ii1A=;
 b=SE3B12E9ZxhcOD3hlWuSonUqBzGmlGzw/XjNMpsDhHUKwpH4ham6lchJXSnYwv9+15
 TmvI5S+JLbAoGuG8hV7K/1Tqug9diMXlD2wD+uAt6ldOYWKoLCC2gMcXSFdw+99Lz3iW
 o/C5i/mtyoTlN+VenlX1IsW9icxpExvlIZ/pp5W4arzSXa9JcBLdxiqlt3vUeEVSuG6C
 CqalCZLZpo9BFjgDUUEpKYYHY9nLSIyzg1U0L88jQj6fdxFYfLV5T4DgFLOCza/D9s3D
 SM+uiS8nFgghcRvOvsKqIO/Tpa8ODH8zzGaFJfSbSK0MY+bYpyITl1tVHhe9+wTXh5aW
 m9Yg==
X-Gm-Message-State: AC+VfDwjwUYBWZ91nc1HXGQFf/ygVplpZyjctMXlO028PsepUgHNYIFe
 K6fJsGh62wLjV3TCO3WxmB2aLI58Igt8dbMeagygwA==
X-Google-Smtp-Source: ACHHUZ5qMBLCDn3nIKnOFe9ykJOHaWbGJe0tBrJas22UVSzi+3j0W7F1vnd869sneG3Qix6BmJRWzQ==
X-Received: by 2002:a1c:7502:0:b0:3ef:6b97:f0c3 with SMTP id
 o2-20020a1c7502000000b003ef6b97f0c3mr12530716wmc.15.1683026427634; 
 Tue, 02 May 2023 04:20:27 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [PULL 05/12] tcg: Add tcg_gen_gvec_andcs
Date: Tue,  2 May 2023 12:20:16 +0100
Message-Id: <20230502112023.776823-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Add tcg expander and helper functions for and-compliment
vector with scalar operand.

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Message-Id: <20230428144757.57530-10-lawrence.hunter@codethink.co.uk>
[rth: Split out of larger patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h      |  1 +
 include/tcg/tcg-op-gvec.h    |  2 ++
 accel/tcg/tcg-runtime-gvec.c | 11 +++++++++++
 tcg/tcg-op-gvec.c            | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index e141a6ab24..b8e6421c8a 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -217,6 +217,7 @@ DEF_HELPER_FLAGS_4(gvec_nor, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_eqv, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_ands, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_andcs, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_xors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_ors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 
diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 28cafbcc5c..6d58683171 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -330,6 +330,8 @@ void tcg_gen_gvec_ori(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 void tcg_gen_gvec_ands(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_xors(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index ac7d28c251..97399493d5 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -550,6 +550,17 @@ void HELPER(gvec_ands)(void *d, void *a, uint64_t b, uint32_t desc)
     clear_high(d, oprsz, desc);
 }
 
+void HELPER(gvec_andcs)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
+        *(uint64_t *)(d + i) = *(uint64_t *)(a + i) & ~b;
+    }
+    clear_high(d, oprsz, desc);
+}
+
 void HELPER(gvec_xors)(void *d, void *a, uint64_t b, uint32_t desc)
 {
     intptr_t oprsz = simd_oprsz(desc);
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 047a832f44..9c14908a46 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2761,6 +2761,23 @@ void tcg_gen_gvec_andi(unsigned vece, uint32_t dofs, uint32_t aofs,
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ands);
 }
 
+void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
+{
+    static GVecGen2s g = {
+        .fni8 = tcg_gen_andc_i64,
+        .fniv = tcg_gen_andc_vec,
+        .fno = gen_helper_gvec_andcs,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+        .vece = MO_64
+    };
+
+    TCGv_i64 tmp = tcg_temp_ebb_new_i64();
+    tcg_gen_dup_i64(vece, tmp, c);
+    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
+    tcg_temp_free_i64(tmp);
+}
+
 static const GVecGen2s gop_xors = {
     .fni8 = tcg_gen_xor_i64,
     .fniv = tcg_gen_xor_vec,
-- 
2.34.1


