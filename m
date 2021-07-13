Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C983C7180
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:54:37 +0200 (CEST)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Irs-0007pz-Va
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibk-0000EI-NA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibc-0003m4-HG
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id r11so25256647wro.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N/+JKeJsZGjzhojHp2ciBdin+H8CvA1X0pN/mFvf1cM=;
 b=grWAjetmP49U5AJQgS7hMy1LQMbdfRknzzzeHKTPScOy9/IooAkJ1ANaZDGT7QnDyd
 bqSQ3bXdVZu/OQpREhwbM2SbNbTf5M7O0OaY1MaaeO2bfDrHFB0ujIipt5RVYoMw7rRn
 sa7xf0hcD/K+zmrjlBs635O3ADbZE7KUZN0qh78cy0SHCRjzqcWlLdDmUOK/435giQJz
 v0vvWleHWL6sYXVi6yw55/eNIXTRkeBxAxHki/hcLyMh8xxTGgg7fY9OTx/KwH29ihjb
 hdvJkkNhDYhhwUMIEN2/SwnDP5utFsVd5tNJnxR5o3/Ofds7v8JpyeC8QULilyM1uHzv
 g73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/+JKeJsZGjzhojHp2ciBdin+H8CvA1X0pN/mFvf1cM=;
 b=dd5UADBUCtGE52SDtxF9l8oJJ2hDLp8zwH7bK7WK9Qt4qerQMbA/RsJyMxL1CeG94U
 rgUikVnJ7qIwNQpF9Hpbur+RElF5/Ksppr7x/doD7POHosLv0GD7cWgCRMGNk4ZwMW4L
 ibs+fbwJO+psBPTdq8nc0IWLFtRvFldJoXRjtK9CR6LsZrsVyaN4YLtbLDywEsDtTUX2
 +guTaaAmMRgrh4UVSmtb4f7JeiM1tBS6Qg1bKImqk8DPNEOZzg/QmfRQk330f4TIDwyB
 Zi2ywIb6mJa8c5ypKZfksUFyqSurnHvpwmBueg9fu2ly9pVqoWET0vk2/QKQTq89kstn
 Rlvg==
X-Gm-Message-State: AOAM5330I2G6htM20QS0rmOozXJ92DsfIXvbCXesVDtFO0s+hJp5r/ll
 cOX4VN4IPbr8H0bR2vFFWj9M+Tj0KPM59sfU
X-Google-Smtp-Source: ABdhPJxiMBhrXWqepvvapgjvSo4EHSglJhgNvIxpljHiO/QIJMiQt+E+SWfw+ZrotdRppq7bTd2q3Q==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr5838514wrn.304.1626183467247; 
 Tue, 13 Jul 2021 06:37:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 24/34] target/arm: Implement MVE VMLADAV and VMLSLDAV
Date: Tue, 13 Jul 2021 14:37:16 +0100
Message-Id: <20210713133726.26842-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
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

Implement the MVE VMLADAV and VMLSLDAV insns.  Like the VMLALDAV and
VMLSLDAV insns already implemented, these accumulate multiplied
vector elements; but they accumulate a 32-bit result rather than a
64-bit one.

Note that these encodings overlap with what would be RdaHi=0b111 for
VMLALDAV, VMLSLDAV, VRMLALDAVH and VRMLSLDAVH.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 17 ++++++++++
 target/arm/mve.decode      | 33 +++++++++++++++++---
 target/arm/mve_helper.c    | 41 ++++++++++++++++++++++++
 target/arm/translate-mve.c | 64 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 150 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 84aa9de6e06..088bdd3ca50 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -400,6 +400,23 @@ DEF_HELPER_FLAGS_4(mve_vrmlaldavhuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
+DEF_HELPER_FLAGS_4(mve_vmladavsb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavub, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavuh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavuw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vmladavsxb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsxh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsxw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavxb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavxh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavxw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vaddvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 79c529e762f..0c4708ea988 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -320,32 +320,55 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 %size_16 16:1 !function=plus_1
 
 &vmlaldav rdahi rdalo size qn qm x a
+&vmladav rda size qn qm x a
 
 @vmlaldav        .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
 @vmlaldav_nosz   .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
-VMLALDAV_S       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
-VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+@vmladav         .... .... .... ... . ... x:1 .... . . a:1 . qm:3 . \
+                 qn=%qn rda=%rdalo size=%size_16 &vmladav
+@vmladav_nosz    .... .... .... ... . ... x:1 .... . . a:1 . qm:3 . \
+                 qn=%qn rda=%rdalo size=0 &vmladav
 
-VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
+{
+  VMLADAV_S      1110 1110 1111  ... . ... . 1110 . 0 . 0 ... 0 @vmladav
+  VMLALDAV_S     1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+}
+{
+  VMLADAV_U      1111 1110 1111  ... . ... . 1110 . 0 . 0 ... 0 @vmladav
+  VMLALDAV_U     1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+}
+
+{
+  VMLSDAV        1110 1110 1111  ... . ... . 1110 . 0 . 0 ... 1 @vmladav
+  VMLSLDAV       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
+}
+
+{
+  VMLSDAV        1111 1110 1111  ... 0 ... . 1110 . 0 . 0 ... 1 @vmladav_nosz
+  VRMLSLDAVH     1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
+}
+
+VMLADAV_S        1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
+VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 
 {
   VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
   VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VMLADAV_S      1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }
 
 {
   VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }
 
-VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
-
 # Scalar operations
 
 VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 725fe64a348..8b70362f012 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1201,6 +1201,47 @@ DO_LDAV(vmlsldavxsh, 2, int16_t, true, +=, -=)
 DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
 DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
 
+/*
+ * Multiply add dual accumulate ops
+ */
+#define DO_DAV(OP, ESIZE, TYPE, XCHG, EVENACC, ODDACC) \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
+                                    void *vm, uint32_t a)               \
+    {                                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE *n = vn, *m = vm;                                          \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if (mask & 1) {                                             \
+                if (e & 1) {                                            \
+                    a ODDACC                                            \
+                        n[H##ESIZE(e - 1 * XCHG)] * m[H##ESIZE(e)];     \
+                } else {                                                \
+                    a EVENACC                                           \
+                        n[H##ESIZE(e + 1 * XCHG)] * m[H##ESIZE(e)];     \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        return a;                                                       \
+    }
+
+#define DO_DAV_S(INSN, XCHG, EVENACC, ODDACC)           \
+    DO_DAV(INSN##b, 1, int8_t, XCHG, EVENACC, ODDACC)   \
+    DO_DAV(INSN##h, 2, int16_t, XCHG, EVENACC, ODDACC)  \
+    DO_DAV(INSN##w, 4, int32_t, XCHG, EVENACC, ODDACC)
+
+#define DO_DAV_U(INSN, XCHG, EVENACC, ODDACC)           \
+    DO_DAV(INSN##b, 1, uint8_t, XCHG, EVENACC, ODDACC)  \
+    DO_DAV(INSN##h, 2, uint16_t, XCHG, EVENACC, ODDACC) \
+    DO_DAV(INSN##w, 4, uint32_t, XCHG, EVENACC, ODDACC)
+
+DO_DAV_S(vmladavs, false, +=, +=)
+DO_DAV_U(vmladavu, false, +=, +=)
+DO_DAV_S(vmlsdav, false, +=, -=)
+DO_DAV_S(vmladavsx, true, +=, +=)
+DO_DAV_S(vmlsdavx, true, +=, -=)
+
 /*
  * Rounding multiply add long dual accumulate high. In the pseudocode
  * this is implemented with a 72-bit internal accumulator value of which
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 22b178296f4..67b9c07447a 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -46,6 +46,7 @@ typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TC
 typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenVABAVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenDualAccOpFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -766,6 +767,69 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
     return do_long_dual_acc(s, a, fns[a->x]);
 }
 
+static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
+{
+    TCGv_ptr qn, qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qn) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+
+    /*
+     * This insn is subject to beat-wise execution. Partial execution
+     * of an A=0 (no-accumulate) insn which does not execute the first
+     * beat must start with the current rda value, not 0.
+     */
+    if (a->a || mve_skip_first_beat(s)) {
+        rda = load_reg(s, a->rda);
+    } else {
+        rda = tcg_const_i32(0);
+    }
+
+    fn(rda, cpu_env, qn, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_DUAL_ACC(INSN, FN)                                           \
+    static bool trans_##INSN(DisasContext *s, arg_vmladav *a)           \
+    {                                                                   \
+        static MVEGenDualAccOpFn * const fns[4][2] = {                  \
+            { gen_helper_mve_##FN##b, gen_helper_mve_##FN##xb },        \
+            { gen_helper_mve_##FN##h, gen_helper_mve_##FN##xh },        \
+            { gen_helper_mve_##FN##w, gen_helper_mve_##FN##xw },        \
+            { NULL, NULL },                                             \
+        };                                                              \
+        return do_dual_acc(s, a, fns[a->size][a->x]);                   \
+    }
+
+DO_DUAL_ACC(VMLADAV_S, vmladavs)
+DO_DUAL_ACC(VMLSDAV, vmlsdav)
+
+static bool trans_VMLADAV_U(DisasContext *s, arg_vmladav *a)
+{
+    static MVEGenDualAccOpFn * const fns[4][2] = {
+        { gen_helper_mve_vmladavub, NULL },
+        { gen_helper_mve_vmladavuh, NULL },
+        { gen_helper_mve_vmladavuw, NULL },
+        { NULL, NULL },
+    };
+    return do_dual_acc(s, a, fns[a->size][a->x]);
+}
+
 static void gen_vpst(DisasContext *s, uint32_t mask)
 {
     /*
-- 
2.20.1


