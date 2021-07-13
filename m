Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB393C71BF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:03:06 +0200 (CEST)
Received: from localhost ([::1]:42842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3J05-0000Gc-Jx
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibt-0000W4-8B
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibi-0003qR-RG
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id l7so29613268wrv.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jcneWcHtRSIWZQaKInlpxUM3P5jf//GWQwWQ0tWibxQ=;
 b=VLLBm8gzy+J77EPIHFW42M3zd3AfUbT2GcsCckWaLh8SURn9o8j+YwUvnSdsuk5e26
 nc9jqmgr4pay/VBhOG/JGxStW7KJD1xsNR5YykBujOSGBHMxFz3kgBFYKaUHMCumq53l
 +l/pHZ3ITgNNTLwIcHtUQqpDblxyrZVfjjhEIDt0bvE35hD5Vx8VK+1fIeiSJviNd0MA
 7CacftQNpqE10Ovb/7sIcVFKuYLnrLCVGI23u7+9ETJ7KkTPRVQgWkUAqK4ZDC/DgEME
 otYsUMciM45ubOOXqHC5dz4oUtX0iKRJbgKx6BCf8RUe3Pr7W688y5KeBYRu+G7uAlXV
 DLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcneWcHtRSIWZQaKInlpxUM3P5jf//GWQwWQ0tWibxQ=;
 b=X7zaAY5p5RizHvgfLhhJPBVucW0f0ztQDCRU1YbaPtwwfUBVDOaB7kM3y44TJvawdi
 Z0XCIHUN5H+osy9btlElobjL0Cpis9/CqMLxOaWlondFtrhPQZCvzLzQ/hVHn3krGhJD
 6+rdRspoNthgsH8J28MVwAxTfYmj9rY+2QWiq9iXMQ9S/9BTa9GZld4fxEYl+3l7zFvP
 N7xjaRRf8QrY16sZb5gAodvIa/MDme5u5ZVmYdfKBj+onW/yFHkbxJ/zs9EwlSjbZv4c
 908g/dTkXNCZGwU6I17BrZ7PmtjYjxS0uDDMyedLTPdO2nrAwk8qjCNPLX4+ZhjtE0cA
 NqvA==
X-Gm-Message-State: AOAM53202ZuA9p9DkKyqFvA+2W9mtX6tJc2hfMPHbZmPPEi4oPObLeNt
 BuTPfOm0mciHFMmCTq3QEpUOCg==
X-Google-Smtp-Source: ABdhPJwW7RYDsb1ajKd3dsrRi/any7DBm2NZnDjhRSqaIN4/PsQgJqdcVO77BdryfUHxqcqO6VT5EA==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr5919155wrs.170.1626183473595; 
 Tue, 13 Jul 2021 06:37:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 31/34] target/arm: Implement MVE VCTP
Date: Tue, 13 Jul 2021 14:37:23 +0100
Message-Id: <20210713133726.26842-32-peter.maydell@linaro.org>
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

Implement the MVE VCTP insn, which sets the VPR.P0 predicate bits so
as to predicate any element at index Rn or greater is predicated.  As
with VPNOT, this insn itself is predicable and subject to beatwise
execution.

The calculation of the mask is the same as is used to determine
ltpmask in mve_element_mask(), but we precalculate masklen in
generated code to avoid having to have 4 helpers specialized by size.

We put the decode line in with the low-overhead-loop insns in
t32.decode because it's logically part of that collection of insn
patterns, even though it is an MVE only insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  2 ++
 target/arm/translate-a32.h |  1 +
 target/arm/t32.decode      |  1 +
 target/arm/mve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-mve.c |  2 +-
 target/arm/translate.c     | 33 +++++++++++++++++++++++++++++++++
 6 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5844bb891ed..55f9151ccbf 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -125,6 +125,8 @@ DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vpsel, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_1(mve_vpnot, TCG_CALL_NO_WG, void, env)
 
+DEF_HELPER_FLAGS_2(mve_vctp, TCG_CALL_NO_WG, void, env, i32)
+
 DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 6f4d65ddb00..88f15df60e8 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -48,6 +48,7 @@ long neon_element_offset(int reg, int element, MemOp memop);
 void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 void clear_eci_state(DisasContext *s);
 bool mve_eci_check(DisasContext *s);
+void mve_update_eci(DisasContext *s);
 void mve_update_and_store_eci(DisasContext *s);
 bool mve_skip_vmov(DisasContext *s, int vn, int index, int size);
 
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 2d47f31f143..78fadef9d62 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -748,5 +748,6 @@ BL               1111 0. .......... 11.1 ............         @branch24
       # This is DLSTP
       DLS        1111 0 0000 0 size:2 rn:4 1110 0000 0000 0001
     }
+    VCTP         1111 0 0000 0 size:2 rn:4 1110 1000 0000 0001
   ]
 }
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 6efb3c69636..210e70d1727 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2231,6 +2231,26 @@ void HELPER(mve_vpnot)(CPUARMState *env)
     mve_advance_vpt(env);
 }
 
+/*
+ * VCTP: P0 unexecuted bits unchanged, predicated bits zeroed,
+ * otherwise set according to value of Rn. The calculation of
+ * newmask here works in the same way as the calculation of the
+ * ltpmask in mve_element_mask(), but we have pre-calculated
+ * the masklen in the generated code.
+ */
+void HELPER(mve_vctp)(CPUARMState *env, uint32_t masklen)
+{
+    uint16_t mask = mve_element_mask(env);
+    uint16_t eci_mask = mve_eci_mask(env);
+    uint16_t newmask;
+
+    assert(masklen <= 16);
+    newmask = masklen ? MAKE_64BIT_MASK(0, masklen) : 0;
+    newmask &= mask;
+    env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) | (newmask & eci_mask);
+    mve_advance_vpt(env);
+}
+
 #define DO_1OP_SAT(OP, ESIZE, TYPE, FN)                                 \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index be961864ada..be5a3e1a1f5 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -93,7 +93,7 @@ bool mve_eci_check(DisasContext *s)
     }
 }
 
-static void mve_update_eci(DisasContext *s)
+void mve_update_eci(DisasContext *s)
 {
     /*
      * The helper function will always update the CPUState field,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 28e478927df..e0b0cabc39f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8677,6 +8677,39 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
     return true;
 }
 
+static bool trans_VCTP(DisasContext *s, arg_VCTP *a)
+{
+    /*
+     * M-profile Create Vector Tail Predicate. This insn is itself
+     * predicated and is subject to beatwise execution.
+     */
+    TCGv_i32 rn_shifted, masklen;
+
+    if (!dc_isar_feature(aa32_mve, s) || a->rn == 13 || a->rn == 15) {
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * We pre-calculate the mask length here to avoid having
+     * to have multiple helpers specialized for size.
+     * We pass the helper "rn <= (1 << (4 - size)) ? (rn << size) : 16".
+     */
+    rn_shifted = tcg_temp_new_i32();
+    masklen = load_reg(s, a->rn);
+    tcg_gen_shli_i32(rn_shifted, masklen, a->size);
+    tcg_gen_movcond_i32(TCG_COND_LEU, masklen,
+                        masklen, tcg_constant_i32(1 << (4 - a->size)),
+                        rn_shifted, tcg_constant_i32(16));
+    gen_helper_mve_vctp(cpu_env, masklen);
+    tcg_temp_free_i32(masklen);
+    tcg_temp_free_i32(rn_shifted);
+    mve_update_eci(s);
+    return true;
+}
 
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
-- 
2.20.1


