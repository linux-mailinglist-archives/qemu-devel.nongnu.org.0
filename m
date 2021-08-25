Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15B3F73BD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:53:16 +0200 (CEST)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqWx-0000CX-En
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGF-0003oe-HP
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGD-0005TF-6A
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id f5so35619203wrm.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NJAhFClF5w6TY6HD/a0cefoc3l/jviVuLtp+/3Lj16A=;
 b=ctktNCqpWieFyvtMM6te9e54fp+ovAOWGS2B9OY1LRTVSP5NNzmNLGo6PpEbld0TTx
 4eSItM+/U+XkVmLCrUkislhyuzT9xwQkKz/bq+xqaMWt64TWBYESgdLhRXFNh/ySgCcs
 ep+ZLSQ6OZQRMc/jQBuXvlgdYP3hnMqVHtv8oRltZym1FU+00zsU2/3CPjBGi3Gy55TL
 MplpeamRht5yOYZErCiAOaNXc8vzr7wk2vd6BUgJfydkN7UFGhVFap+evRY0QAKMZKpq
 GT2nrPY/OpFJtjzDcNcKDFh1531dEupaxZPGOK/tIIAiAZ/jivSiCslh4p6v7gA3DO6F
 zPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJAhFClF5w6TY6HD/a0cefoc3l/jviVuLtp+/3Lj16A=;
 b=bNIjbfAw98bQDlxvPRkCpnQW9DI/Uu+8uZjTgpV55E9nkS6+oq2U+iXckYgQ7ZsfA9
 A7+tksQOdF6WcVB2qLQWdGmesyFBKDtqec4uF8wHB4TvAdF2S5H9kg0jyE1+Kk0enmpP
 ZrOKqJ/ovMtKqfDSbFMjGIBVOQYXKd63Jzm5jOPdwWCW8YgpWRclgElFV+pt+ovwXdrO
 ZI9QR4uj1jBrd1gOlsZu0b7bj6WcUwV7yRRpe5mBL/tkuqSYr+ms/aMM1uZyEcuNp7R0
 4apheRgYPsqqMa3JJxxb6UCWQac9bvV6oYM0gJb4JKqoq6CVWz3B2vX+VPQymT6xGa2K
 1kTA==
X-Gm-Message-State: AOAM5313OXsOTIPwPnLH6v+LUm2d9fiJBcM4/nzdavn3I0HM9uB7Fumq
 0kbxwqwZkaEekm5F6Pg6ynZW/Z0L79QLpg==
X-Google-Smtp-Source: ABdhPJz1wNUTOis443zGOAcc2GvnLsFlrwSCdshDCVIfoaeOrw4aFPC1N7sHbHjgljted2P4WvTsPA==
X-Received: by 2002:adf:f645:: with SMTP id x5mr19252119wrp.353.1629887755663; 
 Wed, 25 Aug 2021 03:35:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/44] target/arm: Implement MVE integer min/max across vector
Date: Wed, 25 Aug 2021 11:35:11 +0100
Message-Id: <20210825103534.6936-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Implement the MVE integer min/max across vector insns
VMAXV, VMINV, VMAXAV and VMINAV, which find the maximum
from the vector elements and a general purpose register,
and store the maximum back into the general purpose
register.

These insns overlap with VRMLALDAVH (they use what would
be RdaHi=0b110).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 20 ++++++++++++
 target/arm/mve.decode      | 18 +++++++++--
 target/arm/mve_helper.c    | 66 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 48 +++++++++++++++++++++++++++
 4 files changed, 150 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0ee5ea3cabd..2c66fcba792 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -379,6 +379,26 @@ DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vmaxvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vminvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vaddlv_s, TCG_CALL_NO_WG, i64, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vaddlv_u, TCG_CALL_NO_WG, i64, env, ptr, i64)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index bdcd660aaf4..83dc0300d69 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -40,6 +40,7 @@
 &vcmp qm qn size mask
 &vcmp_scalar qn rm size mask
 &shl_scalar qda rm size
+&vmaxv qm rda size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -97,6 +98,8 @@
 @vcmp_scalar .... .... .. size:2 qn:3 . .... .... .... rm:4 &vcmp_scalar \
              mask=%mask_22_13
 
+@vmaxv .... .... .... size:2 .. rda:4 .... .... .... &vmaxv qm=%qm
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -314,8 +317,19 @@ VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
 
 VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
 
-VRMLALDAVH_S     1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
-VRMLALDAVH_U     1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+{
+  VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+}
+
+{
+  VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+}
 
 VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ac608fc524b..924ad7f2bdc 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1254,6 +1254,72 @@ DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
 
+/*
+ * Vector max/min across vector. Unlike VADDV, we must
+ * read ra as the element size, not its full width.
+ * We work with int64_t internally for simplicity.
+ */
+#define DO_VMAXMINV(OP, ESIZE, TYPE, RATYPE, FN)                \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
+                                    uint32_t ra_in)             \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm;                                           \
+        int64_t ra = (RATYPE)ra_in;                             \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            if (mask & 1) {                                     \
+                ra = FN(ra, m[H##ESIZE(e)]);                    \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }                                                           \
+
+#define DO_VMAXMINV_U(INSN, FN)                         \
+    DO_VMAXMINV(INSN##b, 1, uint8_t, uint8_t, FN)       \
+    DO_VMAXMINV(INSN##h, 2, uint16_t, uint16_t, FN)     \
+    DO_VMAXMINV(INSN##w, 4, uint32_t, uint32_t, FN)
+#define DO_VMAXMINV_S(INSN, FN)                         \
+    DO_VMAXMINV(INSN##b, 1, int8_t, int8_t, FN)         \
+    DO_VMAXMINV(INSN##h, 2, int16_t, int16_t, FN)       \
+    DO_VMAXMINV(INSN##w, 4, int32_t, int32_t, FN)
+
+/*
+ * Helpers for max and min of absolute values across vector:
+ * note that we only take the absolute value of 'm', not 'n'
+ */
+static int64_t do_maxa(int64_t n, int64_t m)
+{
+    if (m < 0) {
+        m = -m;
+    }
+    return MAX(n, m);
+}
+
+static int64_t do_mina(int64_t n, int64_t m)
+{
+    if (m < 0) {
+        m = -m;
+    }
+    return MIN(n, m);
+}
+
+DO_VMAXMINV_S(vmaxvs, DO_MAX)
+DO_VMAXMINV_U(vmaxvu, DO_MAX)
+DO_VMAXMINV_S(vminvs, DO_MIN)
+DO_VMAXMINV_U(vminvu, DO_MIN)
+/*
+ * VMAXAV, VMINAV treat the general purpose input as unsigned
+ * and the vector elements as signed.
+ */
+DO_VMAXMINV(vmaxavb, 1, int8_t, uint8_t, do_maxa)
+DO_VMAXMINV(vmaxavh, 2, int16_t, uint16_t, do_maxa)
+DO_VMAXMINV(vmaxavw, 4, int32_t, uint32_t, do_maxa)
+DO_VMAXMINV(vminavb, 1, int8_t, uint8_t, do_mina)
+DO_VMAXMINV(vminavh, 2, int16_t, uint16_t, do_mina)
+DO_VMAXMINV(vminavw, 4, int32_t, uint32_t, do_mina)
+
 #define DO_VADDLV(OP, TYPE, LTYPE)                              \
     uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
                                     uint64_t ra)                \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 44731fc4eb7..2fce74f86ab 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1321,3 +1321,51 @@ DO_VCMP(VCMPGE, vcmpge)
 DO_VCMP(VCMPLT, vcmplt)
 DO_VCMP(VCMPGT, vcmpgt)
 DO_VCMP(VCMPLE, vcmple)
+
+static bool do_vmaxv(DisasContext *s, arg_vmaxv *a, MVEGenVADDVFn fn)
+{
+    /*
+     * MIN/MAX operations across a vector: compute the min or
+     * max of the initial value in a general purpose register
+     * and all the elements in the vector, and store it back
+     * into the general purpose register.
+     */
+    TCGv_ptr qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qm) ||
+        !fn || a->rda == 13 || a->rda == 15) {
+        /* Rda cases are UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qm = mve_qreg_ptr(a->qm);
+    rda = load_reg(s, a->rda);
+    fn(rda, cpu_env, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VMAXV(INSN, FN)                                      \
+    static bool trans_##INSN(DisasContext *s, arg_vmaxv *a)     \
+    {                                                           \
+        static MVEGenVADDVFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_vmaxv(s, a, fns[a->size]);                    \
+    }
+
+DO_VMAXV(VMAXV_S, vmaxvs)
+DO_VMAXV(VMAXV_U, vmaxvu)
+DO_VMAXV(VMAXAV, vmaxav)
+DO_VMAXV(VMINV_S, vminvs)
+DO_VMAXV(VMINV_U, vminvu)
+DO_VMAXV(VMINAV, vminav)
-- 
2.20.1


