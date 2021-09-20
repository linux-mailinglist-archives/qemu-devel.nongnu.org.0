Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B74116E9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:28:16 +0200 (CEST)
Received: from localhost ([::1]:57314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKHH-0002cp-0M
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9l-0002sU-J1
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9Q-0000xD-M4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t8so23199511wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2kQXJvsGgZieDZeANleNNFDtrgmioKh0HnKcjwchoi4=;
 b=xce5iJFxD1Vbzfp9LJWivRdLP6TXj0DaSEfElM5LAsRCAAlO6tzT0QehTtl6SoZGy6
 9NoMkHtg3TV5qVcuGSUM7+TjJs7pzgp5WwSyMZ1i4w4M/Im69RDtgrgboBX+jQuAJry6
 aj2DXi0zpGGCR6DSB8l1zTYeddKFheVzgz+IMygqgyTdG6eo5juOh040cX+PVEMRbU0L
 JN5OCBpXCPYTqbqAtNtZeJapUVgHBKReeaSnE51nVSiDOwjI23rhKW02gvv6sN2eYCNh
 /eHAB52a5b3D42gyw3zHhOW48phoXV33kNehrEPReXXaEwvSC7Bl5BBpGYNpZ8e2lEkO
 oygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2kQXJvsGgZieDZeANleNNFDtrgmioKh0HnKcjwchoi4=;
 b=WYB7SmdYGoA8RBeUnxMiU9bA+Q4V9WWSQhH4AWXZwXfvdx50tAoEWlfD07JVqoju7A
 HqSQga+UKKq+MIZH+//9AbgMD4XpkbEGMUGzuulNgAh6eQFyGEkG7rEZLzWpH25+jPfk
 aH7DdfbC9GOHsNr+PROJ/wq8lQ5BXpYKI8Ab6RxVLPScxcjm/xHCasF2ZOUWjhFfujeE
 w10XTQagPMSb4v5wuPxLeSny08EBVxy28/ltfADpi9eV6KZzVxUnd9FIuVYepJ6hiNah
 7tC9HrVO7HDxjCXl/qLt9cKBE0hYA1sS06iGsnagmAEIpnItqNXg6dzBud2Fm7Ek3Aa9
 zT6w==
X-Gm-Message-State: AOAM531FC2+t2TjDAnVURkXO5GPZRr4sAcWVJJslAaGbFMNCnlCtzSH3
 QKeyYgBjkaoGTKLdTcxNZa8rfTHITMs27A==
X-Google-Smtp-Source: ABdhPJwq4l3o89v1P16V/Dv/rA+uQzfTJutdfbmkIgOyFUVRaw3tUhSrX09NnG/JY+NvFsnYkYAaQQ==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr22286664wmk.192.1632147607271; 
 Mon, 20 Sep 2021 07:20:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/27] target/arm: Optimize MVE VSHL, VSHR immediate forms
Date: Mon, 20 Sep 2021 15:19:44 +0100
Message-Id: <20210920141947.5537-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Optimize the MVE VSHL and VSHR immediate forms by using TCG vector
ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-10-peter.maydell@linaro.org
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


