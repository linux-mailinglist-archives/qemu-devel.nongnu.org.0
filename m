Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE53C7198
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:57:17 +0200 (CEST)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IuS-0004Ut-5T
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibi-0000Du-Rq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:56 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibb-0003ka-Mh
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso2405383wmj.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gzlJnyMrAHKkx+BzpZ7aFiX7hVIlIkOtXpndBsdqVDU=;
 b=fyL9kYmLHS0panODdQJ1HznzgaPj4CvG7lLCY19bQYtXRRACR9rmf2A8ekIP9RCsfa
 gjF3PHapA1fR4gnzGbI0gC/iNKa0L8lAfpIS3LS9nFZ/Q9CYUDBYoNFyMlcdsqTTy+sC
 xM209QduJaeuzil/hVx2ma+veMOshY9twm1Em3/KYkgtVVYlbaPN9bd/m9HIwkxZICCI
 RAh8ko4mGJbYGJmSAsCM8Y5fTE1PStMKqVDsRZDi2OgV5SLfJLqTE3moBOcJfnuT2slB
 JFKkVoY/cH/DY0VcAL6MA8W6/V4MEvubfogZslEY6U2FOr5bpCoeknauYx4YE7JSwssH
 N0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gzlJnyMrAHKkx+BzpZ7aFiX7hVIlIkOtXpndBsdqVDU=;
 b=dYkUCvDdlg0JL5YFvnzVOj1Vd7GxC+20IA1uB7U+GMxyue+k0flrMrLy9xQwIJR1k1
 rSHwVLMjxuQ2dof5Hr0o/AjEkNwSV1AxJTKYltmkLQZT5h+xmJUk2W/UNnZJUX2TS8Fh
 YeJ+4Xv+idskSkXtIx8Z0UirzqJfswy/G46UH/MBH/rpUdPuIIwXA9qGEYQxpIOJltGd
 TxMzamcrtaJPBPxryub9ZVFTzZoX4d/N/A9JDb1FtJAbw5vFK4HgeeAx1fXuFWhtyZZ2
 h7D7BGv3MtCCC2KSmS4UpkbEymDkuzjWkZcgXsEm0jwJ+BUKs0dWS1u9ynGSp6odvtqh
 scRg==
X-Gm-Message-State: AOAM530dW++eGkwFBrYhycH+mdUEfnKzhgle4tQCuXbI+bU7it8c7zT/
 oyQa06WwL/EWOt3aCr5ZSN1rEQ==
X-Google-Smtp-Source: ABdhPJxaw7QMCVu1IWGdNAZbPV7I/CECIddoXfhfX7lYWAjlBTacY3QR48EcOoYhcUGTGGzeTC1hhg==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr5135904wmg.63.1626183465698; 
 Tue, 13 Jul 2021 06:37:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 22/34] target/arm: Implement MVE narrowing moves
Date: Tue, 13 Jul 2021 14:37:14 +0100
Message-Id: <20210713133726.26842-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Implement the MVE narrowing move insns VMOVN, VQMOVN and VQMOVUN.
These take a double-width input, narrow it (possibly saturating) and
store the result to either the top or bottom half of the output
element.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 20 ++++++++++
 target/arm/mve.decode      | 12 ++++++
 target/arm/mve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 22 +++++++++++
 4 files changed, 132 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5c3f8a26df0..84aa9de6e06 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -80,6 +80,26 @@ DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovnth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovunbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovunbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovuntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovunth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovnbsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovnbsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovnbub, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovnbuh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntub, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntuh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vand, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index bf6cf6f8383..79c529e762f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -153,6 +153,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VQMOVUNB       111 0 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_BS      111 0 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
+
   VMULH_S        111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -160,6 +163,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VMOVNB         111 1 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_BU      111 1 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
+
   VMULH_U        111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -167,6 +173,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VQMOVUNT       111 0 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_TS      111 0 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
+
   VRMULH_S       111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -174,6 +183,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VMOVNT         111 1 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_TU      111 1 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
+
   VRMULH_U       111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4eb5dbce6d7..725fe64a348 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1668,6 +1668,84 @@ DO_VSHRN_SAT_UH(vqrshrnb_uh, vqrshrnt_uh, DO_RSHRN_UH)
 DO_VSHRN_SAT_SB(vqrshrunbb, vqrshruntb, DO_RSHRUN_B)
 DO_VSHRN_SAT_SH(vqrshrunbh, vqrshrunth, DO_RSHRUN_H)
 
+#define DO_VMOVN(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE)                   \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        LTYPE *m = vm;                                                  \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        mask >>= ESIZE * TOP;                                           \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)],                       \
+                      m[H##LESIZE(le)], mask);                          \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VMOVN(vmovnbb, false, 1, uint8_t, 2, uint16_t)
+DO_VMOVN(vmovnbh, false, 2, uint16_t, 4, uint32_t)
+DO_VMOVN(vmovntb, true, 1, uint8_t, 2, uint16_t)
+DO_VMOVN(vmovnth, true, 2, uint16_t, 4, uint32_t)
+
+#define DO_VMOVN_SAT(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)           \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        LTYPE *m = vm;                                                  \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        bool qc = false;                                                \
+        unsigned le;                                                    \
+        mask >>= ESIZE * TOP;                                           \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            TYPE r = FN(m[H##LESIZE(le)], &sat);                        \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);             \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VMOVN_SAT_UB(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 1, uint8_t, 2, uint16_t, FN)       \
+    DO_VMOVN_SAT(TOP, true, 1, uint8_t, 2, uint16_t, FN)
+
+#define DO_VMOVN_SAT_UH(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 2, uint16_t, 4, uint32_t, FN)      \
+    DO_VMOVN_SAT(TOP, true, 2, uint16_t, 4, uint32_t, FN)
+
+#define DO_VMOVN_SAT_SB(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 1, int8_t, 2, int16_t, FN)         \
+    DO_VMOVN_SAT(TOP, true, 1, int8_t, 2, int16_t, FN)
+
+#define DO_VMOVN_SAT_SH(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 2, int16_t, 4, int32_t, FN)        \
+    DO_VMOVN_SAT(TOP, true, 2, int16_t, 4, int32_t, FN)
+
+#define DO_VQMOVN_SB(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), INT8_MIN, INT8_MAX, SATP)
+#define DO_VQMOVN_UB(N, SATP)                           \
+    do_sat_bhs((uint64_t)(N), 0, UINT8_MAX, SATP)
+#define DO_VQMOVUN_B(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), 0, UINT8_MAX, SATP)
+
+#define DO_VQMOVN_SH(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), INT16_MIN, INT16_MAX, SATP)
+#define DO_VQMOVN_UH(N, SATP)                           \
+    do_sat_bhs((uint64_t)(N), 0, UINT16_MAX, SATP)
+#define DO_VQMOVUN_H(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), 0, UINT16_MAX, SATP)
+
+DO_VMOVN_SAT_SB(vqmovnbsb, vqmovntsb, DO_VQMOVN_SB)
+DO_VMOVN_SAT_SH(vqmovnbsh, vqmovntsh, DO_VQMOVN_SH)
+DO_VMOVN_SAT_UB(vqmovnbub, vqmovntub, DO_VQMOVN_UB)
+DO_VMOVN_SAT_UH(vqmovnbuh, vqmovntuh, DO_VQMOVN_UH)
+DO_VMOVN_SAT_SB(vqmovunbb, vqmovuntb, DO_VQMOVUN_B)
+DO_VMOVN_SAT_SH(vqmovunbh, vqmovunth, DO_VQMOVUN_H)
+
 uint32_t HELPER(mve_vshlc)(CPUARMState *env, void *vd, uint32_t rdm,
                            uint32_t shift)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c304b8d6e41..ba5b7809b09 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -275,6 +275,28 @@ DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
 DO_1OP(VNEG, vneg)
 
+/* Narrowing moves: only size 0 and 1 are valid */
+#define DO_VMOVN(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        static MVEGenOneOpFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            NULL,                                               \
+            NULL,                                               \
+        };                                                      \
+        return do_1op(s, a, fns[a->size]);                      \
+    }
+
+DO_VMOVN(VMOVNB, vmovnb)
+DO_VMOVN(VMOVNT, vmovnt)
+DO_VMOVN(VQMOVUNB, vqmovunb)
+DO_VMOVN(VQMOVUNT, vqmovunt)
+DO_VMOVN(VQMOVN_BS, vqmovnbs)
+DO_VMOVN(VQMOVN_TS, vqmovnts)
+DO_VMOVN(VQMOVN_BU, vqmovnbu)
+DO_VMOVN(VQMOVN_TU, vqmovntu)
+
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
     static MVEGenOneOpFn * const fns[] = {
-- 
2.20.1


