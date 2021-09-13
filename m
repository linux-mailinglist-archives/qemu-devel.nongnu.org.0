Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10084088CF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:12:15 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPiwg-00063o-VL
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifx-0007Vv-6b
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:57 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifq-0001vN-77
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so13725670wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3CtlRUa2Pflsx0SilrWyUarKoRlgAOB6ic9qq7mvCY=;
 b=tTShjKmCAJ3kxiBWpWRxGckXKlXC8lu0libaEs+REwWKMpNYnWaePVKsI3HpRx2QOE
 ibjzan6iX2FvoSwMZg8OqTqanNfozUSDLeaVfRYakmw5tudQmQLk2voSP5a7oKhuEqTZ
 LGGa0sEbtRzFa9Xw57CETuKLQbNvICLhb79AmxCxLRrsgPhMps/v06WhTSmb6Roflbsf
 cXwCzydX7AypCuohY2m8PtlzDzaoSWoYo50IZ4UdjVNzIFgLYC65L6SsFSEINr88TobA
 PIbQK5d82XDu/UpyPE86WdsPpgrg2YFZ/mA/Rn0IRdRD4AFZimUYQ+jncTd70E/ln1D0
 6DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3CtlRUa2Pflsx0SilrWyUarKoRlgAOB6ic9qq7mvCY=;
 b=4/EQ/fYALAO25CsdISk5qGx0HqQn+qda5dZuctaF0FWassf+zU2D8z9Zv2uCVbst8u
 NXe1Pz6y9HcZMujZ1KyIkJRM6535yUFbwTrtV2jKbVK478FKXyIcMJO9XgYjdhSVlT8A
 ebtK5cn2nGbj8nLBMkyVM28eIYl+wkTYq4u8fS1hdW90BQ8OMMlY+N2OnbeA4hcf9HXi
 IZtKa+0cpkjSAdIpM8fietYxqNPBfH84hGkRJj0dISU3EjBtlsZo+pnmGd7S7i1ahIxf
 ORL+fhsm/nFSfKwjVwYpxjQrX41HeJLZI3UTeU2l6FDEYWsPJ0AM8M8iLawCH8JCXDcs
 eEXg==
X-Gm-Message-State: AOAM531007TmnIzcXSyYW1SGxc8ph7hlQ3Vz17LjxakIQ3Zhrm1FnM4j
 aaOe91utcV0834/Jcu/Dnt4Zsw==
X-Google-Smtp-Source: ABdhPJymGhuL1a7Jps2kaRiEDklsBUdTUJgT0HKdKGLtLzJYtKVGkkEhzFgnZ411ovEwINFKwAB7+Q==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr2563253wrr.187.1631526888781; 
 Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] target/arm: Optimize MVE VSHL, VSHR immediate forms
Date: Mon, 13 Sep 2021 10:54:37 +0100
Message-Id: <20210913095440.13462-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize the MVE VSHL and VSHR immediate forms by using TCG vector
ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 83 +++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4583e22f21c..00fa4379a74 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1570,8 +1570,8 @@ static bool trans_Vimm_1r(DisasContext *s, arg_1imm *a)
     return do_1imm(s, a, fn);
 }
 
-static bool do_2shift(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
-                      bool negateshift)
+static bool do_2shift_vec(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
+                          bool negateshift, GVecGen2iFn vecfn)
 {
     TCGv_ptr qd, qm;
     int shift = a->shift;
@@ -1594,34 +1594,77 @@ static bool do_2shift(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
         shift = -shift;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qm, tcg_constant_i32(shift));
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && mve_no_predication(s)) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qm),
+              shift, 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qm, tcg_constant_i32(shift));
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_2SHIFT(INSN, FN, NEGATESHIFT)                         \
-    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
-    {                                                           \
-        static MVEGenTwoOpShiftFn * const fns[] = {             \
-            gen_helper_mve_##FN##b,                             \
-            gen_helper_mve_##FN##h,                             \
-            gen_helper_mve_##FN##w,                             \
-            NULL,                                               \
-        };                                                      \
-        return do_2shift(s, a, fns[a->size], NEGATESHIFT);      \
+static bool do_2shift(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
+                      bool negateshift)
+{
+    return do_2shift_vec(s, a, fn, negateshift, NULL);
+}
+
+#define DO_2SHIFT_VEC(INSN, FN, NEGATESHIFT, VECFN)                     \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)            \
+    {                                                                   \
+        static MVEGenTwoOpShiftFn * const fns[] = {                     \
+            gen_helper_mve_##FN##b,                                     \
+            gen_helper_mve_##FN##h,                                     \
+            gen_helper_mve_##FN##w,                                     \
+            NULL,                                                       \
+        };                                                              \
+        return do_2shift_vec(s, a, fns[a->size], NEGATESHIFT, VECFN);   \
     }
 
-DO_2SHIFT(VSHLI, vshli_u, false)
+#define DO_2SHIFT(INSN, FN, NEGATESHIFT)        \
+    DO_2SHIFT_VEC(INSN, FN, NEGATESHIFT, NULL)
+
+static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
+                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    /*
+     * We get here with a negated shift count, and we must handle
+     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
+     */
+    shift = -shift;
+    if (shift == (8 << vece)) {
+        shift--;
+    }
+    tcg_gen_gvec_sari(vece, dofs, aofs, shift, oprsz, maxsz);
+}
+
+static void do_gvec_shri_u(unsigned vece, uint32_t dofs, uint32_t aofs,
+                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    /*
+     * We get here with a negated shift count, and we must handle
+     * shifts by the element size, which tcg_gen_gvec_shri() does not do.
+     */
+    shift = -shift;
+    if (shift == (8 << vece)) {
+        tcg_gen_gvec_dup_imm(vece, dofs, oprsz, maxsz, 0);
+    } else {
+        tcg_gen_gvec_shri(vece, dofs, aofs, shift, oprsz, maxsz);
+    }
+}
+
+DO_2SHIFT_VEC(VSHLI, vshli_u, false, tcg_gen_gvec_shli)
 DO_2SHIFT(VQSHLI_S, vqshli_s, false)
 DO_2SHIFT(VQSHLI_U, vqshli_u, false)
 DO_2SHIFT(VQSHLUI, vqshlui_s, false)
 /* These right shifts use a left-shift helper with negated shift count */
-DO_2SHIFT(VSHRI_S, vshli_s, true)
-DO_2SHIFT(VSHRI_U, vshli_u, true)
+DO_2SHIFT_VEC(VSHRI_S, vshli_s, true, do_gvec_shri_s)
+DO_2SHIFT_VEC(VSHRI_U, vshli_u, true, do_gvec_shri_u)
 DO_2SHIFT(VRSHRI_S, vrshli_s, true)
 DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 
-- 
2.20.1


