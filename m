Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F23B5FA2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:09:17 +0200 (CEST)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrwq-0003vG-2p
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrn6-0003RS-6j
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmk-000665-So
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l8so12635386wry.13
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LkoOH3ETnKTeal6J43R20gkNbw1izsYxj80GkABOwHE=;
 b=hu+no2bAZi4Go5AtDKgL4n4jrgFUmW9jMYncAjEqjapToLdGcK3cDS6yjs3zseMR1Z
 BrLVpktUyTAL7jnn8xpbIIb0mtptFHHpFvJ87gEw9ix6CLfDlyiRp4aL7CWXiDgW1+fl
 /6F7Ebxxzryfu74hLU6cXh2hpOouHNtgW9LoVnvzCEVEV7/3wLsl0piWl7DKfAHS7fTd
 gaqbeZtQJav2QHkdmdttLzFZ9FzSA3NM4fXfiPPI+7b4DuJT7JI5J2VeyMevYx0gIXs2
 tiGHAg0x5dsMRilAfwsSRPJcnftLA1Tcidz245IxNHohjAEPghlDIAVbG1DSqLH00cD5
 1G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkoOH3ETnKTeal6J43R20gkNbw1izsYxj80GkABOwHE=;
 b=th/C4gNiFozMksxw3tMwfoNbyxZne6r4QFNCe9J7FTmOMtNJUfmR5COphDMzxM8+wQ
 o+moaURlQl6Y+Sbeod5NcdxDJvz6LLgoSs1u0ZX1+E53ec5sVUg9XdkcIltCAzXdisMX
 HJzKZlnULOriax6Fw1cuj/LrHoOongl4EzppNZHfNPqHJ3t9fA/eJGA5uhTaaCRkpHxq
 WsPphgWd3Aa0wh0kX16lqDzddgGW9nj3rx4kD31mofFANc08RFMQoEBZfF1pG9xfXGkR
 XNjvsEH596hOV6AoBEZ7JN/D7CQKDB+A4efepqpWiCRhIJqVEzjIgnDcAzeLSx629vm/
 Cj6Q==
X-Gm-Message-State: AOAM532zVcp9/71Imci377VWdDPwiDFmGClSTROb0XA9hYIs/+RZOapa
 aEo1rr990AT0oP11KzKa4YQM1xx78NBeB1EK
X-Google-Smtp-Source: ABdhPJxnck/NiZoRljJ0UetM+XMdR1dpdTaDECZn6T+gPtTYHYWvlRPQx7LilL7RFRPh3mXl5olSxQ==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr26801530wry.175.1624888727136; 
 Mon, 28 Jun 2021 06:58:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/18] target/arm: Implement MVE VADDLV
Date: Mon, 28 Jun 2021 14:58:31 +0100
Message-Id: <20210628135835.6690-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the MVE VADDLV insn; this is similar to VADDV, except
that it accumulates 32-bit elements into a 64-bit accumulator
stored in a pair of general-purpose registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  3 ++
 target/arm/mve.decode      |  6 +++-
 target/arm/mve_helper.c    | 19 ++++++++++++
 target/arm/translate-mve.c | 63 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index d414b6309d5..cf5ba860f2f 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -356,6 +356,9 @@ DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vaddlv_s, TCG_CALL_NO_WG, i64, env, ptr, i64)
+DEF_HELPER_FLAGS_3(mve_vaddlv_u, TCG_CALL_NO_WG, i64, env, ptr, i64)
+
 DEF_HELPER_FLAGS_3(mve_vmovi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vandi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vorri, TCG_CALL_NO_WG, void, env, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 914b108c379..595d97568eb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -307,7 +307,11 @@ VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
 # Vector add across vector
-VADDV            111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
+{
+  VADDV          111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
+  VADDLV         111 u:1 1110 1 ... 1001 ... 0 1111 00 a:1 0 qm:3 0 \
+                 rdahi=%rdahi rdalo=%rdalo
+}
 
 # Predicate operations
 %mask_22_13      22:1 13:3
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 9d4a07c1c0c..37af94bd9ea 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1189,6 +1189,25 @@ DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
 
+#define DO_VADDLV(OP, TYPE, LTYPE)                              \
+    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
+                                    uint64_t ra)                \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm;                                           \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {              \
+            if (mask & 1) {                                     \
+                ra += (LTYPE)m[H4(e)];                          \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }                                                           \
+
+DO_VADDLV(vaddlv_s, int32_t, int64_t)
+DO_VADDLV(vaddlv_u, uint32_t, uint64_t)
+
 /* Shifts by immediate */
 #define DO_2SHIFT(OP, ESIZE, TYPE, FN)                          \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,     \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 460dff260fe..a2a45036a0b 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -790,6 +790,69 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
     return true;
 }
 
+static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
+{
+    /*
+     * Vector Add Long Across Vector: accumulate the 32-bit
+     * elements of the vector into a 64-bit result stored in
+     * a pair of general-purpose registers.
+     * No need to check Qm's bank: it is only 3 bits in decode.
+     */
+    TCGv_ptr qm;
+    TCGv_i64 rda;
+    TCGv_i32 rdalo, rdahi;
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    /*
+     * rdahi == 13 is UNPREDICTABLE; rdahi == 15 is a related
+     * encoding; rdalo always has bit 0 clear so cannot be 13 or 15.
+     */
+    if (a->rdahi == 13 || a->rdahi == 15) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * This insn is subject to beat-wise execution. Partial execution
+     * of an A=0 (no-accumulate) insn which does not execute the first
+     * beat must start with the current value of RdaHi:RdaLo, not zero.
+     */
+    if (a->a || mve_skip_first_beat(s)) {
+        /* Accumulate input from RdaHi:RdaLo */
+        rda = tcg_temp_new_i64();
+        rdalo = load_reg(s, a->rdalo);
+        rdahi = load_reg(s, a->rdahi);
+        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_temp_free_i32(rdalo);
+        tcg_temp_free_i32(rdahi);
+    } else {
+        /* Accumulate starting at zero */
+        rda = tcg_const_i64(0);
+    }
+
+    qm = mve_qreg_ptr(a->qm);
+    if (a->u) {
+        gen_helper_mve_vaddlv_u(rda, cpu_env, qm, rda);
+    } else {
+        gen_helper_mve_vaddlv_s(rda, cpu_env, qm, rda);
+    }
+    tcg_temp_free_ptr(qm);
+
+    rdalo = tcg_temp_new_i32();
+    rdahi = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(rdalo, rda);
+    tcg_gen_extrh_i64_i32(rdahi, rda);
+    store_reg(s, a->rdalo, rdalo);
+    store_reg(s, a->rdahi, rdahi);
+    tcg_temp_free_i64(rda);
+    mve_update_eci(s);
+    return true;
+}
+
 static bool do_1imm(DisasContext *s, arg_1imm *a, MVEGenOneOpImmFn *fn)
 {
     TCGv_ptr qd;
-- 
2.20.1


