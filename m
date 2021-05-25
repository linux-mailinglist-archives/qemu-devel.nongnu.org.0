Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DABC38F7A6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:43:32 +0200 (CEST)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llM6V-0005tJ-Li
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLVA-0002P4-M5
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:56 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUb-0001sd-V8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v14so18677987pgi.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NEJph6bPv2fQDS20YrndVl2KdexL9NoqSHsy7DSwOvU=;
 b=b+JR2hPEtjy72FzsrUkgOFumx2VPy9X1k+SMv8mIuie/5UgLIjq9w/JDJasxBjF75l
 UMw28bkVcyMtRdZiurSmecblvSIOS1O24eyA1Mlrkm6ry2+LpMPNWHUqKLqN7EuOjv5/
 oc/QAEraE1syfZ+39K6CZJt59BqxW2G6dYti34WEi1xleJ3+/60mU8gentRfLt1P0Lr2
 N3DSrVaK0U7f3QrCYENBfQm7WkgED1MOWOHZ6+Dqj31pDZT2OTDwZdBqaxlUFaopisrE
 J2w2hP00x/aaP+aZZ8xKo57c2lCLSo8gMEAcQcDIgZLAYGo31z1XRpfA3aO3KK3vrk+b
 bKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NEJph6bPv2fQDS20YrndVl2KdexL9NoqSHsy7DSwOvU=;
 b=WSC1oFeKwDNDiGHvsYOwRX23LrszakNTDrja8LeZrJxt+8SkLx8dyH3thUvWop0Gz/
 BK/Bju8UH8tfLr0Jc4maK0EDBK0zIUf+9O2IOHC/xpg23ONCK9VaIpW5ufhrbYb1JJbF
 nTf8/DFg7SHLugIO3Qan3dnilGyf7AlThG0B9FZOVGSQndtuxgBq5Q44rHpvomPUv1Im
 LlyCwnDCwof00vXIIBTRPUOd0icd7p67Q4b8nmw2vbbUcCRvtbLBHYFkOJ8HeFREeMH2
 bDwZvdPmqVyfnhKXI2z7p8EPW9cdrmS5We7+3w5qeTEytK6BhqJweFRhUcZnIGQa73Nc
 6MEA==
X-Gm-Message-State: AOAM5322tr9IderS+NB/R9fJ6+14Sd+yACXewzpi5IArs0g/3j/571by
 FaFqA2LgbpZdPdkK7IH4g/jGVkj7UCcUEw==
X-Google-Smtp-Source: ABdhPJwhadzhcZERW6MNA+/mDZDR+nJP6RuXX8nNWjG9o6XRrAHlOZXhALaSwvsNemZtxIrzr7HKdw==
X-Received: by 2002:a63:5c17:: with SMTP id q23mr16459424pgb.168.1621904660573; 
 Mon, 24 May 2021 18:04:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 34/92] target/arm: Implement SVE2 saturating multiply-add
 long
Date: Mon, 24 May 2021 18:03:00 -0700
Message-Id: <20210525010358.152808-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 14 ++++++++++
 target/arm/sve_helper.c    | 30 +++++++++++++++++++++
 target/arm/translate-sve.c | 54 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 11dc6870de..d8f390617c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2559,3 +2559,17 @@ DEF_HELPER_FLAGS_5(sve2_bcax, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl1n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl2n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_nbsl, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 47fca5e12d..52f615b39e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1332,3 +1332,17 @@ FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
 FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
 FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
 FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
+
+#### SVE Integer Multiply-Add (unpredicated)
+
+## SVE2 saturating multiply-add long
+
+SQDMLALB_zzzw   01000100 .. 0 ..... 0110 00 ..... .....  @rda_rn_rm
+SQDMLALT_zzzw   01000100 .. 0 ..... 0110 01 ..... .....  @rda_rn_rm
+SQDMLSLB_zzzw   01000100 .. 0 ..... 0110 10 ..... .....  @rda_rn_rm
+SQDMLSLT_zzzw   01000100 .. 0 ..... 0110 11 ..... .....  @rda_rn_rm
+
+## SVE2 saturating multiply-add interleaved long
+
+SQDMLALBT       01000100 .. 0 ..... 00001 0 ..... .....  @rda_rn_rm
+SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f3250165da..ad211249ca 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1405,6 +1405,36 @@ void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
 }
 
+#define DO_SQDMLAL(NAME, TYPEW, TYPEN, HW, HN, DMUL_OP, SUM_OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    int sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                       \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));                       \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));                       \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                              \
+        *(TYPEW *)(vd + HW(i)) = SUM_OP(aa, DMUL_OP(nn, mm));           \
+    }                                                                   \
+}
+
+DO_SQDMLAL(sve2_sqdmlal_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQADD_H)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQADD_S)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqadd_d)
+
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQSUB_H)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQSUB_S)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqsub_d)
+
+#undef DO_SQDMLAL
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0ac2aeef09..7e23d1cad3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7508,3 +7508,57 @@ DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
 DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
 DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
 DO_SVE2_ZPZZ_FP(FMINP, fminp)
+
+/*
+ * SVE Integer Multiply-Add (unpredicated)
+ */
+
+static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
+        gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool do_sqdmlsl_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
+        gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool trans_SQDMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLALBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, true);
+}
+
+static bool trans_SQDMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, true);
+}
-- 
2.25.1


