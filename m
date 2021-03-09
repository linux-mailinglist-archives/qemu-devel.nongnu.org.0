Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D7332E5A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:36:00 +0100 (CET)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhD6-00072a-07
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8S-0000mq-IP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:04 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:33977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf86-0002tU-R2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:04 -0500
Received: by mail-oi1-x230.google.com with SMTP id x78so15566466oix.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WagiVrDfUgMksBOhokHdQsJkyD0LF4+ZrDTc70WJHXM=;
 b=PNVqX2QFLjutgz74hzJHUwhuoveZ0LoTQOQi/EHylwnRhgRKw9cqqSNHsyYfJRCKuz
 yiOAr4D1dPSucfUayf3xY9LTP3Oa1fRtsDgYemmkL0DdVUkb6/AtPTEyi1UAIxhHWKrk
 dJfP5q1tA/WpZKJMVVJ5HVNhWFD3l6xT3wxAdevi9m0GdpRZ6L18tcLlFjVGu//1yx/c
 KPh0UWvUc+WMjFiL+MqUN2jA/1P1zsfHcdSmKe8vQ3DIR68Av7OTwudKtKbAoBHk/kcx
 YIrpuDg38vSGJiSLvRWXKJJgcd5t314ufHw0+DYsb1MStTtsyym6u71i7UGlOo/UlnBX
 Aikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WagiVrDfUgMksBOhokHdQsJkyD0LF4+ZrDTc70WJHXM=;
 b=dqvBeHtxgRUMSOyo9XyK4ocuMptGO8rd/BDelnIhXYiKnXxfUJJrIVmllGaW0xOayz
 Gp5ZOD46kAhYGFjQIzNsSZhJfe/cgiCsipolJVnNubbSVTQyTTOcgJt+vHZG1+OiufoK
 jr408CRpf7RaIRbfO/NT++rzKjcUFEg5DSkU/Fae6dufRFktB8pyXg9adS3J0k73y7J6
 ++4Dz0ZMdZuXd92UU70aQeKMIWh1VeCF9c/8eqc/YrtXwwgxk2xJhfeW5AUyV4QPan02
 95UZ7VwLVd9qHPUROkmA8XW7m3HkXFDZVUSilYeQdW7mHhrzspaPW19AbDWdLlBuYTsi
 lr8A==
X-Gm-Message-State: AOAM530crL5lmtv0dh3kfjNTn0D2amBnRSeahDWn6SR2fA9dDFNo8adM
 JtptVK76kLZoPGuApSGW2cebTdtV4+iOdmXX
X-Google-Smtp-Source: ABdhPJzAyUWwVYrMRylfKRWlN07dLoJ0mwppze0uyRzH5ZdtXH4Z4M956GV91Pv6/1Xkg6kl3PAx5g==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr3572899oib.40.1615306961818; 
 Tue, 09 Mar 2021 08:22:41 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 77/78] target/arm: Implement SVE2 complex integer dot
 product
Date: Tue,  9 Mar 2021 08:20:40 -0800
Message-Id: <20210309162041.23124-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 10 ++++
 target/arm/sve.decode      |  9 ++++
 target/arm/sve_helper.c    | 99 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 17 +++++++
 4 files changed, 135 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 43ee4238de..955d14b7ac 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2784,3 +2784,13 @@ DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(flogb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(flogb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(flogb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
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
index b5c53b4c40..289a3576c3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -811,6 +811,9 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+# SVE2 complex dot product (vectors)
+CDOT_zzzz       01000100 esz:2 0 rm:5 0001 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
 #### SVE Multiply - Indexed
 
 # SVE integer dot product (indexed)
@@ -849,6 +852,12 @@ SQDMLSLB_zzxw_d 01000100 .. 1 ..... 0011.0 ..... .....          @rrxw_d
 SQDMLSLT_zzxw_s 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_s
 SQDMLSLT_zzxw_d 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_d
 
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
index d08da9fdc1..0a583b9898 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1592,6 +1592,105 @@ void HELPER(sve2_sqrdcmlah_idx_s)(void *vd, void *vn, void *vm,
     do_cmla_idx_s(vd, vn, vm, va, desc, do_sqrdcmlah_s);
 }
 
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
index af2c6fbb9e..3c44a0d182 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4147,6 +4147,9 @@ DO_SVE2_RRXR_ROT(CMLA_zzxz_s, gen_helper_sve2_cmla_idx_s)
 DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_h, gen_helper_sve2_sqrdcmlah_idx_h)
 DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_s, gen_helper_sve2_sqrdcmlah_idx_s)
 
+DO_SVE2_RRXR_ROT(CDOT_zzxw_s, gen_helper_sve2_cdot_idx_s)
+DO_SVE2_RRXR_ROT(CDOT_zzxw_d, gen_helper_sve2_cdot_idx_d)
+
 #undef DO_SVE2_RRXR_ROT
 
 /*
@@ -8351,6 +8354,20 @@ static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
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


