Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF93AB440
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:04:47 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrhO-0006ak-VT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxU-0002uc-8O
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxG-0007JP-5D
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a11so6524719wrt.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hStj6zof4ZIVqXLILY6nUnm8m7n+pOxOXy95R7wxh4g=;
 b=sln994PNpe2dB93XhabIX2iRykqKJx/XOxuSbRLdD/MVjEjh9X4h2Q6DI2uQmOXusH
 aEhjUEci5DXJ70g3z+tIipOwjqPtd4U3OWmMo7rBYWM7p36EDPY/rNawmfgjRDoJCniJ
 CmQ6H3bBZEGBfEyhvcVcBQf0BW6kE4rxHqJCzb9T78xDooof6yQTcKpISlF6uZf99hWK
 0wdXdEtOLbY76MpG42RJ8+nxnMDnrNH8q7PD+b1do2i7CEJKBN1jV7TdJvt+Spgf6/UC
 lYyloIOteMBPNhJmZVDNp0ltrAYTZJC8JJJsIY5AQx/XOQGTZBo8sNM4FoifdkJVfgb5
 kfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hStj6zof4ZIVqXLILY6nUnm8m7n+pOxOXy95R7wxh4g=;
 b=IaT3hk6wHQ/yHWuvXuBsov2ThOzQ/pLKfkZZ36BvqA7NVMXocxfRTDFnB/WAncw5gc
 I28iKF45tKIs4s9tUa6vtntA/OFG3MuyVDUrGbhRHmNavWFrdYVHeNLIu0DBCitm3ABI
 YRDdTpU28OD85YaZcvXK2WYrbcWFWgWMijiqX9PFVLDvXJBtQdiioMCvseSAn1umuumC
 7u8YVsx3E7iy8jmNR1tTPBs197kQqYIQzfi/LQ28N+kioSIQRTZ9zrtSwOLnMG8R1mdf
 gsMdChtAcO9JSgk5xkMjI5CkjRGy5VcK8JzjPk1wl4gO75gnbBa9Uvt/9Zu6bY4q1ubJ
 lUCA==
X-Gm-Message-State: AOAM530MqC6EDXy3W0bQFWPidpIm85n5GFXxIWWbbX3edHn+BEf4EccC
 wYevTEBa4c3yLUKH7FNF7AVFZXc/JmI17g==
X-Google-Smtp-Source: ABdhPJwZ+VMWrxjzjdfvh42y/ZGAdUIRAiUkmPgsivA1QWw/kfR8cVzglXSVwfFeh6SRkF3HuAGd5w==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr5294553wrk.216.1623932224283; 
 Thu, 17 Jun 2021 05:17:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:17:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 43/44] target/arm: Implement MVE VADDV
Date: Thu, 17 Jun 2021 13:16:27 +0100
Message-Id: <20210617121628.20116-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
index fb002465413..e45f8a21e73 100644
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
index 73c15f41333..04d84e88461 100644
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


