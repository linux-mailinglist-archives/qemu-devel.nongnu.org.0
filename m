Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A11FEA6C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 06:53:07 +0200 (CEST)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlmXy-0003Pb-Gp
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 00:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBZ-0000In-6t
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:29:57 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBX-0002wh-6b
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:29:56 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x22so2205693pfn.3
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWcKhmTwg0LtC7my7xC9nsPzz33Zf3o1o5YsEKc7UlQ=;
 b=IbZ8nSbewXfzBLyJeC0FHEnvuqcKi8LcIq5G0J2S+yhUczOykXwp3gaQhvlMivvFTR
 YsMWXVS98/CehxuGPHcPfaI4OADneudceB4H1XKnaRVbYVVTZOPQ9u3aeFDcOBDaD3iC
 UbpQ7XXj7/var1RcfGOAE0HpIFj8zE2X+VDgR6bpT9agEnftCpbexUKm8aRrfaM5jCuM
 S5tzO5diag9bgkHsefLUyQvnhIZ0K7WIHu0I7NjhhHvZIfyCj+7t3K84KkV1GVUqJVCE
 Ckt7zQbWmDmix73eyDskveSG56MawGM4ozdVJdPiBKae6z8PRb5wUBTo/8R9H4sx1gRX
 fbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWcKhmTwg0LtC7my7xC9nsPzz33Zf3o1o5YsEKc7UlQ=;
 b=n6mCvtF4iuP0HEBD6DFcvOY2NSsFX+YtxFR1FteQWgFK0W7asRBkPEL+4/leNkncl7
 6Nq4Ev3jK2X6UZ2P6m4cVU/993ya8XYfn3DRFoqU6E3WGu4t3/RZ50ZprLWoMg+VqC8P
 xdYIPlxyk+4s82/q4e7nJUA6s1Q6OvzLIovG7ovgLdqZuyjFocWgfvmHqb1VWSnvMI73
 NRXQz4NjaUmJ9QlowDQ6ndUn2lKkk/kczuF3Q/Cfw9Z4bQFUXm8FflA7o68bK+SyqvuR
 PCsfH3XcXe2FJNmfh5nZpnthBeBBXKGtooV7kPyKPYzVtIIZgC5RozDx8nzHcQhf8hCZ
 atxA==
X-Gm-Message-State: AOAM531QaITItzMf39f4kM4v233VDF9J9KZp3ZRvAvOVyJnIc5aeN9jb
 LqyYvRZ6SzEtfOt4fLdicUKaZdPulRU=
X-Google-Smtp-Source: ABdhPJx2S5PrNQl8xlLEEOsDpWBQhESF+DuAsb3qDAfLBkJB/48nu0l6ThqCVwRpfuaXFAJtfw7q/g==
X-Received: by 2002:a05:6a00:148c:: with SMTP id
 v12mr1887656pfu.171.1592454593306; 
 Wed, 17 Jun 2020 21:29:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j17sm1157899pgk.66.2020.06.17.21.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 048/100] target/arm: Implement SVE2 MATCH, NMATCH
Date: Wed, 17 Jun 2020 21:25:52 -0700
Message-Id: <20200618042644.1685561-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
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
index 7e159fd0ef..78172cb281 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2021,6 +2021,16 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
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
index a50afd40c2..2207693d28 100644
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
index c690e86d1d..31538e4720 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6440,3 +6440,67 @@ void HELPER(sve2_nbsl)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
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
index 6fada01d22..15546d9ad2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7023,6 +7023,28 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
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


