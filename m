Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0233905F7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:56:39 +0200 (CEST)
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZQ6-0005XF-3G
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc5-0004mA-JH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:57 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbw-0004tq-Ny
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so6762375wmq.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uoYuHsS6aTM5s1PRtr2a3YZug1F8ERsJ4YhwDb9v1t0=;
 b=SmVSak5mkSEEAR2mL9le2yuAAOJz3LvVkWdhhz4Qat+zAt7Nga22CCFgnPD2epU7Dt
 77w45+rVzVZHo6f/L+lcxVI50Xn4PA2KYUviXQ4XmJv9SYWvTHZ8khwueUMN/kcfbulF
 2/KuuuKEHzYYIy21maJ04IfzCpSLJXvu8uSyODyCFpfaxwhNrNaQwd+9PuiysBJqeYs5
 n/M3jSfdJUOVLtZZ+HOqiI09MNjBkuQcEe9Z9H0aiF9rytJ4fnZ6RAcdw7yzhG8gdq/m
 txnWqMXkMfgJUh8cGqZ0G7IhEORklD6z4r0Ght58Cm+Gm6cRfSxOX6nDMu34NK86jDp1
 8sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uoYuHsS6aTM5s1PRtr2a3YZug1F8ERsJ4YhwDb9v1t0=;
 b=Ai+vjpJHvfcysXpx2Wc1XHFQtyvpX+D0fEULV5pQpRYtPa5RPLnpAjMKNQlMGTcdeh
 6VEVu37dLq3QLnNQ4yld6KolwV67VYu7Pc3tjLL2mUivgWKB4OIdfDaRxJrOpBxamQAu
 HM1hifT4ThOu3VBsh43HF+UEH0oBtkGlDmfBfs0jf4fSJsKOGNwF1Ropaaav+LdDeDRe
 V6Pgjr7Ee9urZjczoecN2nob7yBl9ZHUAxENhCNIJTyPcbWStfuGa81yEnS1tvKsGjX5
 IApudXJ2VvneGxJf4gABEzyJnCkybuMuwaI8bFqZZWy78aW8BBUnY+/GsomB13LTCyJ0
 vD/A==
X-Gm-Message-State: AOAM533wNZK0ZhfNFDHasfwtuBCf7rXGYdBGIheizH0OKzkBWPa7y+gT
 qQPBCHphzsrBBakp8v8+/pIpkm7W0ZRBQN37
X-Google-Smtp-Source: ABdhPJw7X0O5EJCdq2IjoQYhp8Ao9jS4qPkCSWCDgMUNIGp0spjX5exH0bsucvGL5cm0AJwl3SRWcA==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr4273628wmq.169.1621955087020; 
 Tue, 25 May 2021 08:04:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 085/114] target/arm: Implement SVE2 complex integer dot product
Date: Tue, 25 May 2021 16:02:55 +0100
Message-Id: <20210525150324.32370-86-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-64-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 10 ++++
 target/arm/sve.decode      |  9 ++++
 target/arm/sve_helper.c    | 99 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 17 +++++++
 4 files changed, 135 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d6399a6d6e2..efc9a7ccf18 100644
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
index 42cf344ad64..0339410cf76 100644
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
index eb083e40612..f9c20612602 100644
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
index 91aa2506de1..b454f50a6b7 100644
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
2.20.1


