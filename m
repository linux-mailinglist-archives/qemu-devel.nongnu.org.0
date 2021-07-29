Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DEF3DA241
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:36:47 +0200 (CEST)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94LG-0002HK-3G
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941K-0001Cu-BD
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940w-0001M4-QR
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d8so6456775wrm.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=alz44QktxpBv/sFgB1FXFqYrKdqALX0LQcZ0bcLunZg=;
 b=PQLzQrZOxRCaA+NE4M3nsIcmIADxv3K5+iWTDZ1hJBnI2afvgGrMNkfUIgT8kdxosu
 4g4xoiAkB0fKIxC5jJzqFfICHUoD4EqSjpKTALGM7ny5bsGe/VriHHuxc8ht15XvePb0
 GUSj+XpfRH5Wrgzo6MutULnwuBaAVoDJWV0mh4gNc4lvsn6ZPJMmaye8Wa2moRaajI1o
 3kO00sqsCsTaW2JHDyhBru5ZqZc3/yQT0U1SSHhOAJ/0baGUSy2+iyN5FoLhhH5Mfi5s
 8s1xwEvcaFh22xEu47DHBHQwbnQoB+rRJMBJaIYILsV1n371OospJoizdvrwqolgLs7C
 y5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alz44QktxpBv/sFgB1FXFqYrKdqALX0LQcZ0bcLunZg=;
 b=P70iUesjiz3uCBF18E2+SMmSG+p+e3l98O9J6ngMH6xoH8futJrigFENjg8zj6eB0F
 N23s2UGsPDZyoPcBdYE9HCJDSEnikhZahFg8MbI2nDKEHMdHcI4saH5vtLCu+VbcbOyh
 icBSA0FiDzOfDnfMq7qa/XYMrCGscKPR2emTUrcBKEUNt1zs+Q+b5Dkfmq4+KaJb3X+L
 0nJTvoKqeqH7RQSVYPidEPurQouuE6Texok2MPrEtdGii3KZp6lx1/C9GJPUQdC9aLis
 KAg40qRc4VRFebat76aVm8FZ4Zr6U7kIJc12kxfoudM5Y+Onsx3CVripAbh667+AkrLH
 9QZQ==
X-Gm-Message-State: AOAM530o4frtjb4zMwJRX2ZpfqGUZHBZH3X3D1t8tRz+lLRp6FLijsKZ
 uwPCsWDSRMiQ6ekic/NleJSTcw==
X-Google-Smtp-Source: ABdhPJwM8YFc1gey54/ltdLRSXBBU1d1rJ9f0FSfQMp8PeeYhhv6100F+8vgvplt9MIK8xZ2A+WhNg==
X-Received: by 2002:adf:82e6:: with SMTP id 93mr4205936wrc.47.1627557345129;
 Thu, 29 Jul 2021 04:15:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 36/53] target/arm: Implement MVE VADD (floating-point)
Date: Thu, 29 Jul 2021 12:14:55 +0100
Message-Id: <20210729111512.16541-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VADD (floating-point) insn.  Handling of this is
similar to the 2-operand integer insns, except that we must take care
to only update the floating point exception status if the least
significant bit of the predicate mask for each element is active.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h     |  3 +++
 target/arm/translate.h      |  6 ++++++
 target/arm/mve.decode       | 10 ++++++++++
 target/arm/mve_helper.c     | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c  | 17 +++++++++++++++++
 target/arm/translate-neon.c |  6 ------
 6 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 3db9b15f121..32fd2e1f9be 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -410,6 +410,9 @@ DEF_HELPER_FLAGS_4(mve_vhcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfadds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 241596c5bda..8636c20c3b4 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -181,6 +181,12 @@ static inline int rsub_8(DisasContext *s, int x)
     return 8 - x;
 }
 
+static inline int neon_3same_fp_size(DisasContext *s, int x)
+{
+    /* Convert 0==fp32, 1==fp16 into a MO_* value */
+    return MO_32 - x;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 87446816293..e211cb016c6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -26,6 +26,10 @@
 # VQDMULL has size in bit 28: 0 for 16 bit, 1 for 32 bit
 %size_28 28:1 !function=plus_1
 
+# 2 operand fp insns have size in bit 20: 1 for 16 bit, 0 for 32 bit,
+# like Neon FP insns.
+%2op_fp_size 20:1 !function=neon_3same_fp_size
+
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
 
@@ -118,6 +122,9 @@
 
 @vmaxv .... .... .... size:2 .. rda:4 .... .... .... &vmaxv qm=%qm
 
+@2op_fp .... .... .... .... .... .... .... .... &2op \
+        qd=%qd qn=%qn qm=%qm size=%2op_fp_size
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -615,3 +622,6 @@ VCMPGE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 0 0 .... @vcmp_scalar
 VCMPLT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 0 0 .... @vcmp_scalar
 VCMPGT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 1 0 .... @vcmp_scalar
 VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
+
+# 2-operand FP
+VADD_fp           1110 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c2826eb5f9f..ff087e9d3a4 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
+#include "fpu/softfloat.h"
 
 static uint16_t mve_eci_mask(CPUARMState *env)
 {
@@ -2798,3 +2799,39 @@ DO_VMAXMINA(vmaxaw, 4, int32_t, uint32_t, DO_MAX)
 DO_VMAXMINA(vminab, 1, int8_t, uint8_t, DO_MIN)
 DO_VMAXMINA(vminah, 2, int16_t, uint16_t, DO_MIN)
 DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
+
+/*
+ * 2-operand floating point. Note that if an element is partially
+ * predicated we must do the FP operation to update the non-predicated
+ * bytes, but we must be careful to avoid updating the FP exception
+ * state unless byte 0 of the element was unpredicated.
+ */
+#define DO_2OP_FP(OP, ESIZE, TYPE, FN)                                  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r;                                                         \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], fpst);               \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_2OP_FP(vfaddh, 2, uint16_t, float16_add)
+DO_2OP_FP(vfadds, 4, uint32_t, float32_add)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 78229c44c68..d2c40ede564 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -831,6 +831,23 @@ static bool trans_VSBCI(DisasContext *s, arg_2op *a)
     return do_2op(s, a, gen_helper_mve_vsbci);
 }
 
+#define DO_2OP_FP(INSN, FN)                                     \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        static MVEGenTwoOpFn * const fns[] = {                  \
+            NULL,                                               \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##s,                             \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_2op(s, a, fns[a->size]);                      \
+    }
+
+DO_2OP_FP(VADD_fp, vfadd)
+
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
 {
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index c53ab20fa48..dd43de558e4 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -28,12 +28,6 @@
 #include "translate.h"
 #include "translate-a32.h"
 
-static inline int neon_3same_fp_size(DisasContext *s, int x)
-{
-    /* Convert 0==fp32, 1==fp16 into a MO_* value */
-    return MO_32 - x;
-}
-
 /* Include the generated Neon decoder */
 #include "decode-neon-dp.c.inc"
 #include "decode-neon-ls.c.inc"
-- 
2.20.1


