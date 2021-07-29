Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3404A3DA26B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:47:08 +0200 (CEST)
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94VH-0002y5-6n
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941E-00017F-MZ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940s-0001JF-V0
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id k4so3469506wms.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m3w3Ow7urHFvFZW+mQsIR7ooKiNtRVZse42MclMGtaw=;
 b=JfXN5HLS4gnwP1VUt8S00CCACP4/OUQ/rD4o+cbQkJCXWocxvBKosc5lOUPwj/V2t3
 3WKTrbL6YZRlBKiLj7QLeKl6UVW9q13s18ccwpZccuXlk+3yNmsfxV9Fx0Mbu9LYxkoQ
 FWsHAox2Gg7uVlqqwmPjJ15IbDglDpG2WlNcpiWO+qam3uo6Tdi+ydcJog9aOppnsKQa
 qjkf2qTJfraKubdgxWyfvatRqrRcdne72op1XnXG5xBK0V01Lpb5xk3gZ/Ihpl7eNi9x
 onRjtLs1SG+F8DFSaFj7yN1cichAJ8A/0aBGhwFCw7k2pdGQhRZin/IY9kXKsWZU/5Uk
 UViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3w3Ow7urHFvFZW+mQsIR7ooKiNtRVZse42MclMGtaw=;
 b=R6GS8BQ/EHg90taVJRbUk8K/yBvuBJ868mJeN53bI5Q3WFh9q8bDj28pIOCDlYignM
 DI5b4/usqaWrAV7y4tZGcIQtbnNdZMgBWvaIA8AazlJmvdE+B9dQFYNMrARYcUs+CflN
 2vgMGPO6kehhXy8SqZy4FyiidzL5Ul+tDiXZsFkW42q73XN2CXRVBVcUcorRTqlEIo91
 +S3um6J4XU3As+nDl2nnNu2Bi43F6BaluAdKQextg1fKWHmvk1ZmZJd5+9C1zAkRQBiw
 mGaJySMvkccd5hpWqv83MPzfXZVqiY78fPdJQS6EyuYhHF5n8i8rAJut9o993mSWJmQx
 pFpQ==
X-Gm-Message-State: AOAM533D5lF8D/vgjq55wDmXen08DtsBnB3PhBYnv/7O218rtbmdVM4F
 8i5Wqxagx7BfMG7Optw4QBrdFeGfYq1iOQ==
X-Google-Smtp-Source: ABdhPJxJzXOzwGTVX3woE7qOmAizW5fqnBrFjrHNjH3cwnlVc5bNGh48UmeG5JPIOwiM7iqXir2jzA==
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr13545369wmp.70.1627557341199; 
 Thu, 29 Jul 2021 04:15:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 32/53] target/arm: Implement MVE VCTP
Date: Thu, 29 Jul 2021 12:14:51 +0100
Message-Id: <20210729111512.16541-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  2 ++
 target/arm/translate-a32.h |  1 +
 target/arm/t32.decode      |  1 +
 target/arm/mve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-mve.c |  2 +-
 target/arm/translate.c     | 33 +++++++++++++++++++++++++++++++++
 6 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 8cb941912fc..b6cf3f0c94d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -121,6 +121,8 @@ DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index c22a00c5ed6..1752555a218 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2218,6 +2218,26 @@ void HELPER(mve_vpnot)(CPUARMState *env)
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
index cc2e58cfe2f..865d5acbe76 100644
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
index 80c282669f0..804a53279bd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8669,6 +8669,39 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
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


