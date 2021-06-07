Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9E39E5E0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:49:14 +0200 (CEST)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJNB-0006lB-HG
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbN-0000Kd-Ow
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIag-00087F-HM
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso103349wmh.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42h1syOUzxLZUA1XvuU+cSxInBYhE+Glir21t9O+DZY=;
 b=xA6ZkOgvzwx7cTE6WMwhT0EtuQD85vbOKaodkUJoqlwxWYWpEx38NYTP6EEvuUUAzp
 y+kqKzLHAGLmPpiLix8MsQE56o6wwVos0e0d1bRdGize3xnvEuIzTqTMbEJKWZqD3ELs
 tJujSUZzGFa4uH42uxTEBsqMNsraxG/zhucJmSBwoSpHTPYGoSi5PAm5b3x6uvQqf6HG
 fXpZHRQ7hXBLJz8cIcnMQa/8LrMlEbi/Yp9cIJ5hfFAXprn0YFg1OI71B7+viZFVGTIk
 m6b1KKsBCD6NBVX/PlyaemwPLl9w0NI2t5IBh/TLfLlxAxJnNUSJwLQK1Sl3t/3sVCQO
 9bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42h1syOUzxLZUA1XvuU+cSxInBYhE+Glir21t9O+DZY=;
 b=PVwTHQdvtq/yzrtDA1NYaIGc9pwpsPfK+mwdTqLHvJPbeGxUSs3eer5CjpelYQFraV
 60Pmz5nxDnq6yro3rFnA3XYuzB1rlE4Yk15fVQOBHtQAT+Hp75nF0rvnGTolIeKohA+L
 DMdNvtB8bYXZpiMaLfL7wTGooX6SN87iBjx0Titsmd6p6pPDGNJJo8FZralcaVtZQF5G
 EhpJqKv35x68C8NOgLfb0jO2mXBgfWG9yFnQpCSpYVUcMWjOXlm/ymZRtLrWXN/nyZkJ
 JFa15JaHW/dARNf4x6ftYielv+WjaHLHfd0tjhIgtMOFMYlDrsJ48cxR2MsLO2AvsTPr
 BtmQ==
X-Gm-Message-State: AOAM53386JJhQaArYnGkMQr2gVJD1ER6w4IAz9Su2ZuINBOk2kmBW5lJ
 vROvLDW/9LAH9NjPQ4xADZbrTQ==
X-Google-Smtp-Source: ABdhPJzelOuYvG62PrURa3ktgNuFV00R/40ciF1FndV1xJ1ZZDvxW4eSqMSO25Hj6RWuV02CBWDA8Q==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr53591wmq.121.1623085143850; 
 Mon, 07 Jun 2021 09:59:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 51/55] target/arm: Implement MVE VADC, VSBC
Date: Mon,  7 Jun 2021 17:58:17 +0100
Message-Id: <20210607165821.9892-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VADC and VSBC insns.  These perform an
add-with-carry or subtract-with-carry of the 32-bit elements in each
lane of the input vectors, where the carry-out of each add is the
carry-in of the next.  The initial carry input is either 1 or is from
FPSCR.C; the carry out at the end is written back to FPSCR.C.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  3 ++
 target/arm/mve.decode      |  6 ++++
 target/arm/mve_helper.c    | 30 +++++++++++++++++
 target/arm/translate-mve.c | 69 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 108 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index cd2cc6252f8..686e5d9a39b 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -248,6 +248,9 @@ DEF_HELPER_FLAGS_4(mve_vrhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_5(mve_vadc, TCG_CALL_NO_WG, i32, env, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(mve_vsbc, TCG_CALL_NO_WG, i32, env, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 6b969902df0..6a4aae7a1fc 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -30,6 +30,7 @@
 &1op qd qm size
 &2op qd qm qn size
 &2scalar qd qn rm size
+&vadc qd qm qn i
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -42,6 +43,8 @@
 @2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
      size=%size_28
 
+@vadc .... .... .... .... ... i:1 .... .... .... &vadc qd=%qd qm=%qm qn=%qn
+
 # The _rev suffix indicates that Vn and Vm are reversed. This is
 # the case for shifts. In the Arm ARM these insns are documented
 # with the Vm and Vn fields in their usual places, but in the
@@ -160,6 +163,9 @@ VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
+VADC             1110 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+VSBC             1111 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c9434479604..e07f12c8389 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -580,6 +580,36 @@ DO_2OP_U(vrshlu, DO_VRSHLU)
 DO_2OP_S(vrhadds, DO_RHADD_S)
 DO_2OP_U(vrhaddu, DO_RHADD_U)
 
+#define DO_VADC(OP, INV)                                                \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,         \
+                                    void *vn, void *vm, uint32_t nzcv)  \
+    {                                                                   \
+        uint32_t *d = vd, *n = vn, *m = vm;                             \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        int carry = (nzcv & FPCR_C) ? 1 : 0;                            \
+        /* If we do no additions at all the flags are preserved */      \
+        bool updates_flags = (mask & 0x1111) != 0;                      \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
+            uint64_t r = (uint64_t)n[H4(e)] + INV(m[H4(e)]) + carry;    \
+            if (mask & 1) {                                             \
+                carry = r >> 32;                                        \
+            }                                                           \
+            uint64_t bytemask = mask_to_bytemask4(mask);                \
+            d[H4(e)] &= ~bytemask;                                      \
+            d[H4(e)] |= (r & bytemask);                                 \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        if (updates_flags) {                                            \
+            nzcv = carry ? FPCR_C : 0;                                  \
+        }                                                               \
+        return nzcv;                                                    \
+    }
+
+/* VSBC differs only in inverting op2 before the additiona */
+DO_VADC(vadc, )
+DO_VADC(vsbc, DO_NOT)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9a88583385f..2ed499a6de2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -33,6 +33,7 @@ typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
+typedef void MVEGenADCFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -737,3 +738,71 @@ static bool trans_VPST(DisasContext *s, arg_VPST *a)
     }
     return true;
 }
+
+static bool do_vadc(DisasContext *s, arg_vadc *a, MVEGenADCFn fn,
+                    uint32_t fixed_carry)
+{
+    /*
+     * VADC and VSBC: these perform an add-with-carry or subtract-with-carry
+     * of the 32-bit elements in each lane of the input vectors, where the
+     * carry-out of each add is the carry-in of the next.  The initial carry
+     * input is either fixed (for the I variant: 0 for VADCI, 1 for VSBCI,
+     * passed in as fixed_carry) or is from FPSCR.C; the carry out at the
+     * end is written back to FPSCR.C.
+     */
+
+    TCGv_ptr qd, qn, qm;
+    TCGv_i32 nzcv, fpscr;
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (a->qd > 7 || a->qn > 7 || a->qm > 7 || !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * This insn is subject to beat-wise execution.  Partial execution
+     * of an I=1 (initial carry input fixed) insn which does not
+     * execute the first beat must start with the current FPSCR.NZCV
+     * value, not the fixed constant input.
+     */
+    if (a->i && !mve_skip_first_beat(s)) {
+        /* Carry input is 0 (VADCI) or 1 (VSBCI), NZV zeroed */
+        nzcv = tcg_const_i32(fixed_carry);
+    } else {
+        /* Carry input from existing NZCV flag values */
+        nzcv = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(nzcv, nzcv, FPCR_NZCV_MASK);
+    }
+    qd = mve_qreg_ptr(a->qd);
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+    fn(nzcv, cpu_env, qd, qn, qm, nzcv);
+    fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+    tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
+    tcg_gen_or_i32(fpscr, fpscr, nzcv);
+    store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
+    tcg_temp_free_i32(nzcv);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+static bool trans_VADC(DisasContext *s, arg_vadc *a)
+{
+    return do_vadc(s, a, gen_helper_mve_vadc, 0);
+}
+
+static bool trans_VSBC(DisasContext *s, arg_vadc *a)
+{
+    return do_vadc(s, a, gen_helper_mve_vsbc, FPCR_C);
+}
-- 
2.20.1


