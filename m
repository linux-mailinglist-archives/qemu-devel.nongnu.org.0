Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D638F7C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:54:57 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMHX-0000BI-9T
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYV-0000xZ-7G
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:23 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00045b-AB
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:22 -0400
Received: by mail-pf1-x436.google.com with SMTP id c12so10686577pfl.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEjH7UlSwvzXygqFaMQUC9bmeZGdG0PhYsWn+uO15Hk=;
 b=B5uuerafa9TAHc2q8Kx816aHoCBZjfRmFmXVdXlcHqdwaUgLKVvDr9tT9msCUgqkcT
 Qe2OBPfz1WTYh+uLQuoMCxKe5Ai+NrHCKmby7qUybCE7Tzkr7EV3rEv7J4HDbCS2uj83
 FUxEPGyrnh+vKMd8eaeia+PcodeyY5IkmwcwixREDees0WNMfk+uR6c655Ywbmv103ct
 5Ne1geF3cDEWDnOkFE/YIexDG/xuQcbwaD4Wles7+a8obb9m5bKK+ApUii5/lkQHAkBV
 LIZnu9XdN9mD5Z/3H2+KnNzxwbOKsMxaPs0zNloptPjP8bfBlUfbxUyyfp6Igb3j74Eu
 PVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEjH7UlSwvzXygqFaMQUC9bmeZGdG0PhYsWn+uO15Hk=;
 b=D1dMAvbiVH3jhacq1nbZ6PXuU5akzu3gAyMMzMuICEKb9QeN5jP4DuCiCGL7MSjJqF
 qOEn/jqy3RQWqmNeHwVdYD9dcUgVcxKCtlxKfUeJ4k/elg6kstrsVWl7DNzoeudh0PIV
 xx6/vQWcZza/T18YlBNXZeR2Z9az5w8zagd1m63CoNKB3E19GUZIk5IYRxL/0D/AHNyt
 4tMg0zZMzMyt66m4A4SuYO/dDUqH6Ab9OY7sPV7BDerFW5bhc6nBGueR1vBO9u/Uqgh6
 bREu+MDr24ymUe7PNJgmhxm1kTq96a8fF6zlE0pdxoGW+19PbcRurntVp385wDJaEtd5
 kQAg==
X-Gm-Message-State: AOAM533HQwOColp6F8U1SfABIP5E5uNbJjTT2sZmNXWUZfOKA8m5zTKR
 goqf5XhO7eZWYikgzV+yoLGbHjBWNM3GEw==
X-Google-Smtp-Source: ABdhPJz4HEqeSn0Xvnlx4apwr3om3si0u2PStWy6/DR4lNTk8maRFDSIeDAZTqKP3wGgI2DfHEs7KA==
X-Received: by 2002:a63:f755:: with SMTP id f21mr16228688pgk.129.1621904857809; 
 Mon, 24 May 2021 18:07:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 62/92] target/arm: Implement SVE2 complex integer
 multiply-add (indexed)
Date: Mon, 24 May 2021 18:03:28 -0700
Message-Id: <20210525010358.152808-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Rebasing dropped from v6.
---
 target/arm/helper-sve.h    |  9 +++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 28 ++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 15 +++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3bec807e13..d6399a6d6e 100644
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
index 9c5761347a..42cf344ad6 100644
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
index 20ed2f34bc..eb083e4061 100644
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
index e8e2a4e948..91aa2506de 100644
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
2.25.1


