Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0F38F7E5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:07:05 +0200 (CEST)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMTI-00011N-07
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYV-00010D-PP
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00045k-Ad
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:23 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so12188643pjb.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XMctm2RKiEZe0qpIRD8jYJj9Bl6nZP7KSASrSY1klRM=;
 b=zZt9YrEd8T4rWPShByx6VXRLfigihteLdMGCyXCGiD9H9o01gsdqK5hkzSWZ/QXguz
 QaDgo76mdgrxiIJbIexNyaGkGmEkEpPxSO+7HiTttPJUtSC+NJiQqoU5cqbgvoYDZeMF
 zWqd30dQt7FUIOwxqd6K062lVimOF2i78jee+LSxgFfhS01K4HPJAzS0mXfgAe5IIRQy
 Jlk6RCHaBeDonWzSQ0ZWRjnTQ94k4W6jQTCZciwEXZshgu9IIH2VedsQZpXJIxsRkfsN
 kglzHvldCHyLX6ayOWx/Lj7OW0Np9r1xUFBZcqE6mHe0Atwk05Ajqf/nWLu5k46Cg+37
 LWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMctm2RKiEZe0qpIRD8jYJj9Bl6nZP7KSASrSY1klRM=;
 b=YmuGRTkqbGYp0K886lTkfBSINDNegkouJzLiJIyXcycJX4eAWg0RdkXteITmLFfj9G
 Y3YtkCoYaq6moMgX5B1QUO95qtMeQeF9Ap3/4XbnS0szWsakUHn+Z6orqF0pq4CJ3InX
 8ePrV0PIpuHvYJUrjQwYpyER48Mcvzv2k7MBgHjA9e+c+eliVx/BMvtt0j3cr36/79+w
 gwSZo96KG64wj8ehvGFp6aVe3TyTaPUjQuHxTrtb/nDiblPvOI2LEKlCbc23UNuSBwMq
 0qEepj4zJthNDtozrYRVcRVBSUh41DPan1mUgQhQX7UfKvHe6+lqpN/KwUJ9sgXPdL5s
 vgjw==
X-Gm-Message-State: AOAM530PzHQve9DEbq06KYC7s6FlzwA0kcAiJxTSwXD8qbjae4f6Faoz
 ItrTI2+9XGbMo12UNqmqWBa9qh745wV7+Q==
X-Google-Smtp-Source: ABdhPJzGftP7KCxW+UPtiZC/xYCh2r1oSyLS9ZGw2LDjrttTFPLJyRzfwoBJczrJ8qbOENPhSsDKoA==
X-Received: by 2002:a17:90a:5288:: with SMTP id
 w8mr2015202pjh.170.1621904858429; 
 Mon, 24 May 2021 18:07:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 63/92] target/arm: Implement SVE2 complex integer dot
 product
Date: Mon, 24 May 2021 18:03:29 -0700
Message-Id: <20210525010358.152808-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Rebasing dropped from v6.
---
 target/arm/helper-sve.h    | 10 ++++
 target/arm/sve.decode      |  9 ++++
 target/arm/sve_helper.c    | 99 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 17 +++++++
 4 files changed, 135 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d6399a6d6e..efc9a7ccf1 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2724,3 +2724,13 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_cdot_zzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cdot_zzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_cdot_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cdot_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 42cf344ad6..0339410cf7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -789,6 +789,9 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+# SVE2 complex dot product (vectors)
+CDOT_zzzz       01000100 esz:2 0 rm:5 0001 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
 #### SVE Multiply - Indexed
 
 # SVE integer dot product (indexed)
@@ -823,6 +826,12 @@ SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
 SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
 SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 complex integer dot product (indexed)
+CDOT_zzxw_s     01000100 10 1 index:2 rm:3 0100 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx
+CDOT_zzxw_d     01000100 11 1 index:1 rm:4 0100 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx
+
 # SVE2 complex integer multiply-add (indexed)
 CMLA_zzxz_h     01000100 10 1 index:2 rm:3 0110 rot:2 rn:5 rd:5 \
                 ra=%reg_movprfx
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index eb083e4061..f9c2061260 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1527,6 +1527,105 @@ DO_CMLA_IDX_FUNC(sve2_sqrdcmlah_idx_s, int32_t, H4, DO_SQRDMLAH_S)
 #undef DO_SQRDMLAH_S
 #undef DO_SQRDMLAH_D
 
+/* Note N and M are 4 elements bundled into one unit. */
+static int32_t do_cdot_s(uint32_t n, uint32_t m, int32_t a,
+                         int sel_a, int sel_b, int sub_i)
+{
+    for (int i = 0; i <= 1; i++) {
+        int32_t elt1_r = (int8_t)(n >> (16 * i));
+        int32_t elt1_i = (int8_t)(n >> (16 * i + 8));
+        int32_t elt2_a = (int8_t)(m >> (16 * i + 8 * sel_a));
+        int32_t elt2_b = (int8_t)(m >> (16 * i + 8 * sel_b));
+
+        a += elt1_r * elt2_a + elt1_i * elt2_b * sub_i;
+    }
+    return a;
+}
+
+static int64_t do_cdot_d(uint64_t n, uint64_t m, int64_t a,
+                         int sel_a, int sel_b, int sub_i)
+{
+    for (int i = 0; i <= 1; i++) {
+        int64_t elt1_r = (int16_t)(n >> (32 * i + 0));
+        int64_t elt1_i = (int16_t)(n >> (32 * i + 16));
+        int64_t elt2_a = (int16_t)(m >> (32 * i + 16 * sel_a));
+        int64_t elt2_b = (int16_t)(m >> (32 * i + 16 * sel_b));
+
+        a += elt1_r * elt2_a + elt1_i * elt2_b * sub_i;
+    }
+    return a;
+}
+
+void HELPER(sve2_cdot_zzzz_s)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    int opr_sz = simd_oprsz(desc);
+    int rot = simd_data(desc);
+    int sel_a = rot & 1;
+    int sel_b = sel_a ^ 1;
+    int sub_i = (rot == 0 || rot == 3 ? -1 : 1);
+    uint32_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (int e = 0; e < opr_sz / 4; e++) {
+        d[e] = do_cdot_s(n[e], m[e], a[e], sel_a, sel_b, sub_i);
+    }
+}
+
+void HELPER(sve2_cdot_zzzz_d)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    int opr_sz = simd_oprsz(desc);
+    int rot = simd_data(desc);
+    int sel_a = rot & 1;
+    int sel_b = sel_a ^ 1;
+    int sub_i = (rot == 0 || rot == 3 ? -1 : 1);
+    uint64_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (int e = 0; e < opr_sz / 8; e++) {
+        d[e] = do_cdot_d(n[e], m[e], a[e], sel_a, sel_b, sub_i);
+    }
+}
+
+void HELPER(sve2_cdot_idx_s)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    int opr_sz = simd_oprsz(desc);
+    int rot = extract32(desc, SIMD_DATA_SHIFT, 2);
+    int idx = H4(extract32(desc, SIMD_DATA_SHIFT + 2, 2));
+    int sel_a = rot & 1;
+    int sel_b = sel_a ^ 1;
+    int sub_i = (rot == 0 || rot == 3 ? -1 : 1);
+    uint32_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (int seg = 0; seg < opr_sz / 4; seg += 4) {
+        uint32_t seg_m = m[seg + idx];
+        for (int e = 0; e < 4; e++) {
+            d[seg + e] = do_cdot_s(n[seg + e], seg_m, a[seg + e],
+                                   sel_a, sel_b, sub_i);
+        }
+    }
+}
+
+void HELPER(sve2_cdot_idx_d)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    int seg, opr_sz = simd_oprsz(desc);
+    int rot = extract32(desc, SIMD_DATA_SHIFT, 2);
+    int idx = extract32(desc, SIMD_DATA_SHIFT + 2, 2);
+    int sel_a = rot & 1;
+    int sel_b = sel_a ^ 1;
+    int sub_i = (rot == 0 || rot == 3 ? -1 : 1);
+    uint64_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (seg = 0; seg < opr_sz / 8; seg += 2) {
+        uint64_t seg_m = m[seg + idx];
+        for (int e = 0; e < 2; e++) {
+            d[seg + e] = do_cdot_d(n[seg + e], seg_m, a[seg + e],
+                                   sel_a, sel_b, sub_i);
+        }
+    }
+}
+
 #define DO_ZZXZ(NAME, TYPE, H, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
 {                                                                       \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 91aa2506de..b454f50a6b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3989,6 +3989,9 @@ DO_SVE2_RRXR_ROT(CMLA_zzxz_s, gen_helper_sve2_cmla_idx_s)
 DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_h, gen_helper_sve2_sqrdcmlah_idx_h)
 DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_s, gen_helper_sve2_sqrdcmlah_idx_s)
 
+DO_SVE2_RRXR_ROT(CDOT_zzxw_s, gen_helper_sve2_cdot_idx_s)
+DO_SVE2_RRXR_ROT(CDOT_zzxw_d, gen_helper_sve2_cdot_idx_d)
+
 #undef DO_SVE2_RRXR_ROT
 
 /*
@@ -8084,6 +8087,20 @@ static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
     return true;
 }
 
+static bool trans_CDOT_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s) || a->esz < MO_32) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_helper_gvec_4 *fn = (a->esz == MO_32
+                                 ? gen_helper_sve2_cdot_zzzz_s
+                                 : gen_helper_sve2_cdot_zzzz_d);
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->rot);
+    }
+    return true;
+}
+
 static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
 {
     static gen_helper_gvec_4 * const fns[] = {
-- 
2.25.1


