Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42C37024C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:40:59 +0200 (CEST)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZwY-00074y-Ud
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZin-0000JA-Qm
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiW-000687-A5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b21so8728458plz.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dY9xjD1cw8e6w0AiGk+0Ct4FwwuYvpBMTDUl5kU++c=;
 b=Y6tNz0hhb+Zns2iMX7899pgCoPTB3fF7nMdXYqhpcVRN+EUHk0SeKhrNgDzg5RVrje
 5/f2mN+HAlUfa7d54OPgZbRQ5Jj8TOMTYhq2m/auS0uMAgAf6gggzqh5XZas6VXEObve
 o4sJveLG6/+zuD7hR7Rw/gNbBJf2s2dzZY5PXmdR3mJywryp8lx2MXS2PVcNEgYIidCD
 Sfl5QOi583WMwh+aw7isNDQu5Z/he/N/D4CgzxpDQiA5EsDEHaY47d4Fsw6vbar24wQC
 bksRbsIaU9qFi0Wq/JT+ifG88LsLGnupiPNan2zwCy3IlNzcfouP1jzEQ9y7BieUFXf7
 6H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dY9xjD1cw8e6w0AiGk+0Ct4FwwuYvpBMTDUl5kU++c=;
 b=A9+3gNud5+uNI1VFJ720flagtQTs6sOD1SgtAuWFg70Uni+yk6rNJHMbw4FBJ5NCIr
 rcs9jo1Cq3KNMPMhxkexM8G1k69DnccJ8aEk44xRuS+OlGZZ7PFFVJJ7n03hzpNaVjdv
 XdDqPsvbR9SsGvqAsGjYUSFklG9TPAsVtwrc/Be0j1+nlXbyTDWO+34CS3h9Mij8/X2b
 Kn3u/WRkrOb9VcAFsc3plWWHYzC6NUCOv9w4GP33NjRnWNDXDvNKO3Fgtc6+K4oThIGa
 AAU/m3CVb6bt5dZMJtTXcn2oqxXuMHIupqHh8JG30bPaQFdDcnVEaY2nDen/s2RRf4OB
 /jYw==
X-Gm-Message-State: AOAM530VmHtp1uaJWrqN1mvHPN1DBrR23iBttDX28kjWKHKn2ESd37kN
 EW6n08p8rbqznTMsPQ+flgr4eygPm6M4Kw==
X-Google-Smtp-Source: ABdhPJyF2mR+6GL0FoQ7doFoi/nWQ4GsuCCXSL3AELTgA4ECPl2ng9/6BNgn22ONpXvCwJdWs7q9kA==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id
 lb14mr16170090pjb.115.1619814386527; 
 Fri, 30 Apr 2021 13:26:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 25/82] target/arm: Implement SVE2 floating-point pairwise
Date: Fri, 30 Apr 2021 13:25:13 -0700
Message-Id: <20210430202610.1136687-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Load all inputs before writing any output (laurent desnogues)
---
 target/arm/helper-sve.h    | 35 +++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 +++++++
 target/arm/sve_helper.c    | 46 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 25 +++++++++++++++++++++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b302203ce8..a033b5f6b2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2443,3 +2443,38 @@ DEF_HELPER_FLAGS_3(sve2_uqxtnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 19866ec4c6..9c75ac94c0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1284,3 +1284,11 @@ UQXTNB          01000101 .. 1 ..... 010 010 ..... .....  @rd_rn_tszimm_shl
 UQXTNT          01000101 .. 1 ..... 010 011 ..... .....  @rd_rn_tszimm_shl
 SQXTUNB         01000101 .. 1 ..... 010 100 ..... .....  @rd_rn_tszimm_shl
 SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 floating-point pairwise operations
+
+FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
+FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
+FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
+FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
+FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7dca67785a..11f228144c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -890,6 +890,52 @@ DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
 #undef DO_ZPZZ_PAIR
 #undef DO_ZPZZ_PAIR_D
 
+#define DO_ZPZZ_PAIR_FP(NAME, TYPE, H, OP)                              \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,               \
+                  void *status, uint32_t desc)                          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; ) {                                         \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            TYPE n0 = *(TYPE *)(vn + H(i));                             \
+            TYPE m0 = *(TYPE *)(vm + H(i));                             \
+            TYPE n1 = *(TYPE *)(vn + H(i + sizeof(TYPE)));              \
+            TYPE m1 = *(TYPE *)(vm + H(i + sizeof(TYPE)));              \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(n0, n1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(m0, m1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_h, float16, H1_2, float16_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_s, float32, H1_4, float32_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_d, float64,     , float64_add)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_h, float16, H1_2, float16_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_s, float32, H1_4, float32_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_d, float64,     , float64_maxnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_h, float16, H1_2, float16_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_s, float32, H1_4, float32_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_d, float64,     , float64_minnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_h, float16, H1_2, float16_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_s, float32, H1_4, float32_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_d, float64,     , float64_max)
+
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_h, float16, H1_2, float16_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_s, float32, H1_4, float32_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_d, float64,     , float64_min)
+
+#undef DO_ZPZZ_PAIR_FP
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b8ced82e4e..1670bcadb1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6697,3 +6697,28 @@ static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
     };
     return do_sve2_narrow_extract(s, a, ops);
 }
+
+static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
+                            gen_helper_gvec_4_ptr *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzz_fp(s, a, fn);
+}
+
+#define DO_SVE2_ZPZZ_FP(NAME, name)                                         \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                         \
+        NULL,                            gen_helper_sve2_##name##_zpzz_h,   \
+        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d    \
+    };                                                                      \
+    return do_sve2_zpzz_fp(s, a, fns[a->esz]);                              \
+}
+
+DO_SVE2_ZPZZ_FP(FADDP, faddp)
+DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
+DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
+DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
+DO_SVE2_ZPZZ_FP(FMINP, fminp)
-- 
2.25.1


