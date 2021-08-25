Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E93F73D7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:57:37 +0200 (CEST)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqbA-0005qo-5G
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGM-0004Ib-Sm
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGL-0005aI-3D
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso3401553wmj.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m3w3Ow7urHFvFZW+mQsIR7ooKiNtRVZse42MclMGtaw=;
 b=OPTbOkKjy/FtPtH+7fAGyk6XJWKtXz4CthArruwOdNfzDVbL3B2UzFcYVgj02UaSMy
 xFoWpm57tTGQvF7pCoxrbEow2Ge2ndUB0tuDlJrMUmL23n/itwsKJakRbLvFZSfQISjy
 6ZmOLwBmmFkQDsVJsuLFfy7dgcf41NU9qQDmsv3VmUnnxBDjNLuxlsMlohrHydIozm+z
 fnbHJNTfAHvO98wWKddRL62gtNYmwN6MbW5sPWH6fEUdWck57ffyuC26mGlONx8mLRiV
 XAitN+PDrTWltDjq/+ntkqXDiWBNN2X4kZId/d2hFsapUozbPAgK1E6vLRylfImVoySu
 D7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3w3Ow7urHFvFZW+mQsIR7ooKiNtRVZse42MclMGtaw=;
 b=eAsSDkWlNHtUCuH+3/BcwhXsIkbRC+175gPLDK5RqKTLfSa8UCfPNsyOAOkmm6hyfF
 uUEm2nwxKuyOte20dZDSjQKcYwFuCLbwftuxyRuWcbT0fBK2u/EK6rRP9X7731E4UqA/
 vovCxqVYR2LcuyU2b/Neqp1C+KRQ8cWrIufJuGcclcKwbAqtj7S4dEY7ZTV51pbqyplZ
 SIM1ixcxmHDboc/XKbjI/r1IPIH0MSbNHlWIUUQIU19M9YL4rb5eflo15SABSRWG9IIE
 s4TTQ0KjPukc5GPvQ8LavhkX0m0l53TbHqkxBvI1qUNJugdxBT0j1vshbatoY3wVEN3u
 f6FA==
X-Gm-Message-State: AOAM533xUvi4sdFHOnI3C9fdAb70XYhLn6W7zUex21LBP7lOqgoPXy5W
 P5M2l6Kl/AH4hxlQrf57TEq2pLW1dzPUbw==
X-Google-Smtp-Source: ABdhPJyyD7EVZ0t/gN/S2tFibtnUBchqZjmM2knErCWiYhCdtDdYb6JyQbcrK0Ui8/8JUrkzwijXlQ==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr2812357wml.82.1629887763739; 
 Wed, 25 Aug 2021 03:36:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/44] target/arm: Implement MVE VCTP
Date: Wed, 25 Aug 2021 11:35:22 +0100
Message-Id: <20210825103534.6936-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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


