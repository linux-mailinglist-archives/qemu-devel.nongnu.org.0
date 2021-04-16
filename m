Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9C362A79
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:41:12 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWD9-0001XI-WF
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVch-0004ss-Hk
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:33 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcS-0001Ig-2J
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:30 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so17051146pji.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfgjxN5v8ydM/Pn6KFDCWVXjiic+OopJ/aa+kcSpENo=;
 b=fLVA8DEY/ShW/mkiKk3EeKD1sIEdOjy+SGrKnK3eDefyAEY1wQ6Snm7c9XFVo3/dgE
 PoSEV7YSesUZOjcLxXFxC2luDFHuq21qu12z5/R0QICZFbzlvIe9l+W/+KrSC5HjpY7u
 wb7o1oehqYIZt7q/ZYxOSKja4BWVuTJld5jGaxnPs/OlxADJZn/yPPwRY+QT/jnkR13B
 RbjBJ3liCVZxvFvUBwJNpO/K/8NzPYgOgBLUxlae/SulnIr/P6OUiYK2G+Hd3gW6r6jB
 HwUq8wV6HWnZYy15T0fj9OY8o+M2u8oyBmShux/bBsBpOoBU4aOb/4UcPlX4sONy33I6
 34Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tfgjxN5v8ydM/Pn6KFDCWVXjiic+OopJ/aa+kcSpENo=;
 b=S9z2/b/oRGpupXY7ZERoJ7eIFbDdGbIM2JpGmXfDYgi5Hlcp0MaL6ad3p6G+lajRgJ
 FnviO9H5zFwklzjxn15kh+U0VgVuQtsFc1ogmISflz9/Q3sYmyXl3Qf/gW9/cwJGyC3Q
 ayJMboovA7O1Z7hZ3+fnXhIyt5QvZaXUwmlNlDIGUntMUu2Xwg78ZfxI6oH0/QpbsYvt
 wpgQyq7RALgSqPu0CkGX15KOQfrR0oiTR+BUxHGxLRxcHDSXOgBX1ayDHe4QI18u9FEp
 VkdhTR8dNP5uZaHCri4A2Qyg2jj+0P4Wz4taKTP6DP9UethgBNwHlxQQmDfQ8UlTfIz4
 d4Zw==
X-Gm-Message-State: AOAM533MKhtBftw/Wt1/YUJ4OTROPyqWE8c8NF5lUcrv0KmMwV7Eyy43
 jscIxqIhMbSlXrsPSY9eqR2Se2MA2mAKcQ==
X-Google-Smtp-Source: ABdhPJx0oCyzic7LBV9adpOMNy+VPjC9RxLPY9hDDG1qhnUtsX/Qo+roZI1fZWrSxtFCkS7enyYmcA==
X-Received: by 2002:a17:902:e812:b029:eb:59d9:e550 with SMTP id
 u18-20020a170902e812b02900eb59d9e550mr11235959plg.26.1618606994775; 
 Fri, 16 Apr 2021 14:03:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 33/81] target/arm: Implement SVE2 MATCH, NMATCH
Date: Fri, 16 Apr 2021 14:01:52 -0700
Message-Id: <20210416210240.1591291-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200415145915.2859-1-steplong@quicinc.com>
[rth: Expanded comment for do_match2]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Apply esz_mask to input pg to fix output flags.
---
 target/arm/helper-sve.h    | 10 ++++++
 target/arm/sve.decode      |  5 +++
 target/arm/sve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 22 +++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index df617e3351..11dc6870de 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2509,6 +2509,16 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bf673e2f16..47fca5e12d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1320,6 +1320,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+### SVE2 Character Match
+
+MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
+NMATCH          01000101 .. 1 ..... 100 ... ..... 1 .... @pd_pg_rn_rm
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b0598f9097..010d8b260a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6842,3 +6842,67 @@ void HELPER(sve2_nbsl)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
         d[i] = ~((n[i] & k[i]) | (m[i] & ~k[i]));
     }
 }
+
+/*
+ * Returns true if m0 or m1 contains the low uint8_t/uint16_t in n.
+ * See hasless(v,1) from
+ *   https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord
+ */
+static inline bool do_match2(uint64_t n, uint64_t m0, uint64_t m1, int esz)
+{
+    int bits = 8 << esz;
+    uint64_t ones = dup_const(esz, 1);
+    uint64_t signs = ones << (bits - 1);
+    uint64_t cmp0, cmp1;
+
+    cmp1 = dup_const(esz, n);
+    cmp0 = cmp1 ^ m0;
+    cmp1 = cmp1 ^ m1;
+    cmp0 = (cmp0 - ones) & ~cmp0;
+    cmp1 = (cmp1 - ones) & ~cmp1;
+    return (cmp0 | cmp1) & signs;
+}
+
+static inline uint32_t do_match(void *vd, void *vn, void *vm, void *vg,
+                                uint32_t desc, int esz, bool nmatch)
+{
+    uint16_t esz_mask = pred_esz_masks[esz];
+    intptr_t opr_sz = simd_oprsz(desc);
+    uint32_t flags = PREDTEST_INIT;
+    intptr_t i, j, k;
+
+    for (i = 0; i < opr_sz; i += 16) {
+        uint64_t m0 = *(uint64_t *)(vm + i);
+        uint64_t m1 = *(uint64_t *)(vm + i + 8);
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3)) & esz_mask;
+        uint16_t out = 0;
+
+        for (j = 0; j < 16; j += 8) {
+            uint64_t n = *(uint64_t *)(vn + i + j);
+
+            for (k = 0; k < 8; k += 1 << esz) {
+                if (pg & (1 << (j + k))) {
+                    bool o = do_match2(n >> (k * 8), m0, m1, esz);
+                    out |= (o ^ nmatch) << (j + k);
+                }
+            }
+        }
+        *(uint16_t *)(vd + H1_2(i >> 3)) = out;
+        flags = iter_predtest_fwd(out, pg, flags);
+    }
+    return flags;
+}
+
+#define DO_PPZZ_MATCH(NAME, ESZ, INV)                                         \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
+{                                                                             \
+    return do_match(vd, vn, vm, vg, desc, ESZ, INV);                          \
+}
+
+DO_PPZZ_MATCH(sve2_match_ppzz_b, MO_8, false)
+DO_PPZZ_MATCH(sve2_match_ppzz_h, MO_16, false)
+
+DO_PPZZ_MATCH(sve2_nmatch_ppzz_b, MO_8, true)
+DO_PPZZ_MATCH(sve2_nmatch_ppzz_h, MO_16, true)
+
+#undef DO_PPZZ_MATCH
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ab290b9025..bdf1da8424 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7462,6 +7462,28 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
+                               gen_helper_gvec_flags_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_ppzz_flags(s, a, fn);
+}
+
+#define DO_SVE2_PPZZ_MATCH(NAME, name)                                      \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                       \
+        gen_helper_sve2_##name##_ppzz_b, gen_helper_sve2_##name##_ppzz_h,   \
+        NULL,                            NULL                               \
+    };                                                                      \
+    return do_sve2_ppzz_flags(s, a, fns[a->esz]);                           \
+}
+
+DO_SVE2_PPZZ_MATCH(MATCH, match)
+DO_SVE2_PPZZ_MATCH(NMATCH, nmatch)
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1


