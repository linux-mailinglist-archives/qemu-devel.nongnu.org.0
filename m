Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E983A6AAF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:42:04 +0200 (CEST)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoix-0001fd-Mq
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFF-0002rJ-VS
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEr-0000g1-I1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so182712wms.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mSg0/6I7Qs3yqDbJB+Mu6MH+DLX1rnbi5n8qCyx4cSE=;
 b=M2FsavkjgnZb6Jxa+jLqRc66MslKNdvzUrZp9fJO57uG4FPznWwW+H0ipq5AW4iGcX
 2ixxlNNALJgUXNcqb4WUgejcwf46JDrKX6Jm2q7Qiyk9YKqbyL7RUZBje/iKLcHZXsRp
 A/YwFO6DhJAhxe/gJqgqurpehQth0lJxakAWvdiBXobpaE4VdhC255ei03CyOy9RCNXw
 ApDUbPPfd4TddFwftLGEpMqN3jEz1sodhLA0ozbuZ0rN0rcA7NlacCIFvi9R2PnhVjbQ
 SxL1b6nT9sRSxvfMPJqiAApeyAD0EEHbcjY+k1/7JazZhoTsjNGu20Z+B5wVaQm/b2Hn
 cTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mSg0/6I7Qs3yqDbJB+Mu6MH+DLX1rnbi5n8qCyx4cSE=;
 b=Ug9XcjeRKTQHEkyCetQlNNTL8EswpEZmEYEWki0lkZccW3Uo+2PFVdIi9wFAM2BXaY
 JcR7R5Wsm8DgEo8ZE3ECiLBMIylehRmwxC9SOWeO1iKdS3GQ0pQrjkdHBW+QoSUyiHWB
 /1KBf/Kbk4TbcIQY5zWEK9Wb2JHdXR59rNyOnTwamaa59pM9kcsoh8Q+U8K4MgcqQ1OQ
 hYNmbiRcofB+4Q/hVZj0cP4Rnd0p0fZrvNoFFy+JCjB7otfsQWnChnUVNZVRiSBn1+wM
 FDgHcYF7CXXC/dpdatAuDRnXT/YFN7VPMbcQAFUwYX5CS++VSTXAJ5Hz0DPGyakLYLK6
 Taeg==
X-Gm-Message-State: AOAM531BPOGwLtQrcteZMVHiF1wkcujz9p2hyD6y4xZNRI4erHqbxHEB
 VL58Cha9RgGvf0LqRldJT5Uv3g==
X-Google-Smtp-Source: ABdhPJyHBEQHVi3URi1X6gxSYYLfUWujwdmm4F0r9caygnGhJKwhRBM8BOTDzR6VXuAurJocKpdDLg==
X-Received: by 2002:a05:600c:2905:: with SMTP id
 i5mr10488284wmd.91.1623683456104; 
 Mon, 14 Jun 2021 08:10:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 56/57] target/arm: Implement MVE VADDV
Date: Mon, 14 Jun 2021 16:10:06 +0100
Message-Id: <20210614151007.4545-57-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VADDV insn, which performs an addition
across vector lanes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    | 24 +++++++++++++++++++++
 target/arm/translate-mve.c | 43 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 161308b67e6..4bbb9b3ae2c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -348,3 +348,10 @@ DEF_HELPER_FLAGS_4(mve_vrmlaldavhuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_3(mve_vaddvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 695097dcca4..d9ece7be5da 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -252,6 +252,8 @@ VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+# Vector add across vector
+VADDV            111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
 
 # Predicate operations
 %mask_22_13      22:1 13:3
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e5b8016e377..20931f317ba 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1149,3 +1149,27 @@ DO_LDAVH(vrmlaldavhuw, 4, uint32_t, false, int128_add, int128_add, int128_make64
 
 DO_LDAVH(vrmlsldavhsw, 4, int32_t, false, int128_add, int128_sub, int128_makes64)
 DO_LDAVH(vrmlsldavhxsw, 4, int32_t, true, int128_add, int128_sub, int128_makes64)
+
+/* Vector add across vector */
+#define DO_VADDV(OP, ESIZE, TYPE)                               \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
+                                    uint32_t ra)                \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm;                                           \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            if (mask & 1) {                                     \
+                ra += m[H##ESIZE(e)];                           \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }                                                           \
+
+DO_VADDV(vaddvsb, 1, uint8_t)
+DO_VADDV(vaddvsh, 2, uint16_t)
+DO_VADDV(vaddvsw, 4, uint32_t)
+DO_VADDV(vaddvub, 1, uint8_t)
+DO_VADDV(vaddvuh, 2, uint16_t)
+DO_VADDV(vaddvuw, 4, uint32_t)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ca619dad14a..3d54ad1270a 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -33,6 +33,7 @@ typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
+typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -743,3 +744,45 @@ static bool trans_VPST(DisasContext *s, arg_VPST *a)
     mve_update_and_store_eci(s);
     return true;
 }
+
+static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
+{
+    /* VADDV: vector add across vector */
+    static MVEGenVADDVFn * const fns[4][2] = {
+        { gen_helper_mve_vaddvsb, gen_helper_mve_vaddvub },
+        { gen_helper_mve_vaddvsh, gen_helper_mve_vaddvuh },
+        { gen_helper_mve_vaddvsw, gen_helper_mve_vaddvuw },
+        { NULL, NULL }
+    };
+    TCGv_ptr qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        a->size == 3) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * This insn is subject to beat-wise execution. Partial execution
+     * of an A=0 (no-accumulate) insn which does not execute the first
+     * beat must start with the current value of Rda, not zero.
+     */
+    if (a->a || mve_skip_first_beat(s)) {
+        /* Accumulate input from Rda */
+        rda = load_reg(s, a->rda);
+    } else {
+        /* Accumulate starting at zero */
+        rda = tcg_const_i32(0);
+    }
+
+    qm = mve_qreg_ptr(a->qm);
+    fns[a->size][a->u](rda, cpu_env, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qm);
+
+    mve_update_eci(s);
+    return true;
+}
-- 
2.20.1


