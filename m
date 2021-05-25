Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D15390636
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:07:54 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZay-0003Mj-AL
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc4-0004hq-F7
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbv-0004tI-RB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so6461163wme.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LBZNw9tFh5H+IgkEalGDxrfUPUgqpoIGig/MbU5IL5M=;
 b=s6ClR2HRmRmI+7BT1ByKRyH1em4m6y35cUSfa/L6khVVsfZf3ju5DB3WjWOErsIT1S
 yZfQTuW62+t0Cj8cjRO/9bOpMpTDcbL8SgMdjpq6mayR6tFCmlCBpFrB+AWbl1ketRid
 MflHGrsDYWTJ3oc9E8iD/ascc6qJVwVrD86b8QznZB5iU1NoZOcvnY5J9NzGrUUZFKD9
 xZjdY8jALgILIrVYWkWYKNLJxBudjc5Eo4sYmD3qMJH5jxPDSHV2h/JeAbTUaBaBlS/V
 jeF/FqNOD/OWQ2ZQj9IfC9hPwVOlDfgn/EXA/bdc9zPUQ6dRJY1ezXZNAW9HGSuzg1rS
 gePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBZNw9tFh5H+IgkEalGDxrfUPUgqpoIGig/MbU5IL5M=;
 b=oxwWiWKR5bGbtQ+hAG9ZFUg7e7Ze+3ccIE9DcHZGXzeRXB2ioc9pdTkeB1MxxYT1Ip
 ArFSljFIsAwBIZq8hLpbl2cMxAa58uznypeRk2MUsagP4KqR7BGE5Tv0KrI8FmOXa93s
 36vcAB5Ar2zYbmilxo0KaVw2WeIDPjuHBHgfi165PEohKRak7BbRbL3sTRX5OsrOK+3a
 ITt0CoY0qwutHdAb9Dy7l1vLwmZ1NZ4JDteuxlX58MqH0s+0OLYRly1WQnoM1tOm37ph
 hIfi48Pr2+qrlqApXJBi/6zGJsJ2nPlq6tOOUKC7BaLH+p06bTbdosfYgUWlVApiUh1I
 +LHQ==
X-Gm-Message-State: AOAM533qSU300/BH/bBzMPJW9TardFK8X5S6NniDoHjxZ4F6822vJoka
 W9mET2lEmiZFWXsxC385N7bk5L/XpRL6tVzH
X-Google-Smtp-Source: ABdhPJyks0I2QTJs/uwvGYLfQjK1EfspB79lHiNQMWon4NIppNetMaGkn814eVaNrvA/T1mWyrCJEg==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr4387811wmg.146.1621955086303; 
 Tue, 25 May 2021 08:04:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 084/114] target/arm: Implement SVE2 complex integer
 multiply-add (indexed)
Date: Tue, 25 May 2021 16:02:54 +0100
Message-Id: <20210525150324.32370-85-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Message-id: 20210525010358.152808-63-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  9 +++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 28 ++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 15 +++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3bec807e134..d6399a6d6e2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2715,3 +2715,12 @@ DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_cmla_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9c5761347ad..42cf344ad64 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -823,6 +823,18 @@ SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
 SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
 SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 complex integer multiply-add (indexed)
+CMLA_zzxz_h     01000100 10 1 index:2 rm:3 0110 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx
+CMLA_zzxz_s     01000100 11 1 index:1 rm:4 0110 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx
+
+# SVE2 complex saturating integer multiply-add (indexed)
+SQRDCMLAH_zzxz_h  01000100 10 1 index:2 rm:3 0111 rot:2 rn:5 rd:5 \
+                  ra=%reg_movprfx
+SQRDCMLAH_zzxz_s  01000100 11 1 index:1 rm:4 0111 rot:2 rn:5 rd:5 \
+                  ra=%reg_movprfx
+
 # SVE2 multiply-add long (indexed)
 SMLALB_zzxw_s   01000100 10 1 ..... 1000.0 ..... .....   @rrxr_3a esz=2
 SMLALB_zzxw_d   01000100 11 1 ..... 1000.0 ..... .....   @rrxr_2a esz=3
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 20ed2f34bcc..eb083e40612 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1492,8 +1492,36 @@ DO_CMLA_FUNC(sve2_sqrdcmlah_zzzz_h, int16_t, H2, DO_SQRDMLAH_H)
 DO_CMLA_FUNC(sve2_sqrdcmlah_zzzz_s, int32_t, H4, DO_SQRDMLAH_S)
 DO_CMLA_FUNC(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
 
+#define DO_CMLA_IDX_FUNC(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)    \
+{                                                                           \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                                \
+    int rot = extract32(desc, SIMD_DATA_SHIFT, 2);                          \
+    int idx = extract32(desc, SIMD_DATA_SHIFT + 2, 2) * 2;                  \
+    int sel_a = rot & 1, sel_b = sel_a ^ 1;                                 \
+    bool sub_r = rot == 1 || rot == 2;                                      \
+    bool sub_i = rot >= 2;                                                  \
+    TYPE *d = vd, *n = vn, *m = vm, *a = va;                                \
+    for (i = 0; i < oprsz / sizeof(TYPE); i += 16 / sizeof(TYPE)) {         \
+        TYPE elt2_a = m[H(i + idx + sel_a)];                                \
+        TYPE elt2_b = m[H(i + idx + sel_b)];                                \
+        for (j = 0; j < 16 / sizeof(TYPE); j += 2) {                        \
+            TYPE elt1_a = n[H(i + j + sel_a)];                              \
+            d[H2(i + j)] = OP(elt1_a, elt2_a, a[H(i + j)], sub_r);          \
+            d[H2(i + j + 1)] = OP(elt1_a, elt2_b, a[H(i + j + 1)], sub_i);  \
+        }                                                                   \
+    }                                                                       \
+}
+
+DO_CMLA_IDX_FUNC(sve2_cmla_idx_h, int16_t, H2, DO_CMLA)
+DO_CMLA_IDX_FUNC(sve2_cmla_idx_s, int32_t, H4, DO_CMLA)
+
+DO_CMLA_IDX_FUNC(sve2_sqrdcmlah_idx_h, int16_t, H2, DO_SQRDMLAH_H)
+DO_CMLA_IDX_FUNC(sve2_sqrdcmlah_idx_s, int32_t, H4, DO_SQRDMLAH_S)
+
 #undef DO_CMLA
 #undef DO_CMLA_FUNC
+#undef DO_CMLA_IDX_FUNC
 #undef DO_SQRDMLAH_B
 #undef DO_SQRDMLAH_H
 #undef DO_SQRDMLAH_S
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e8e2a4e948f..91aa2506de1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3976,6 +3976,21 @@ DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
 
 #undef DO_SVE2_RRXR_TB
 
+#define DO_SVE2_RRXR_ROT(NAME, FUNC) \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)       \
+    {                                                              \
+        return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra,    \
+                                 (a->index << 2) | a->rot, FUNC);  \
+    }
+
+DO_SVE2_RRXR_ROT(CMLA_zzxz_h, gen_helper_sve2_cmla_idx_h)
+DO_SVE2_RRXR_ROT(CMLA_zzxz_s, gen_helper_sve2_cmla_idx_s)
+
+DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_h, gen_helper_sve2_sqrdcmlah_idx_h)
+DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_s, gen_helper_sve2_sqrdcmlah_idx_s)
+
+#undef DO_SVE2_RRXR_ROT
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.20.1


