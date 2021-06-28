Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD30C3B5F8E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:05:08 +0200 (CEST)
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrsp-00033h-Iy
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmr-00035g-Fe
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmc-00062Y-UY
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u8so8127372wrq.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RABFqhzl9f2Mh12yS8Vn8Uhm8ZnA4Hkbm9eeIy1APuI=;
 b=Sm5sTPr59h/D4TxiozbmXoaUTWtuPiCylm3xsMJbvPNcx/Rprpu/HANOxVRNj3x0Y1
 EwFX6Um4IbtpotJlP5zaj8R0oSSzJLxMEuY++w68ATj2NOpQnDUH/8ZBWLwTKH3Bfwsf
 rxIAX73aqlwImflziQgil1oJ3RJk/1LUNIIdqwrXEql+1o8Fiey2t9zzYEe+jmhW6BTi
 KQmM8bbcWRzmJk268UroMRzsRGG60nwsC+69Bep3IFy1Zn/cGAMEW7aP/9R9wOND4/HV
 N69onAjEMd5V2uztmTO+6IGTCw/g/627htucwHLCU4sH+77maJWsYjREVwX21VB9xrlT
 vMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RABFqhzl9f2Mh12yS8Vn8Uhm8ZnA4Hkbm9eeIy1APuI=;
 b=Lm17Cx7EughUgbsnfXzA1RXwuTRTPEtNkLq2W/7cjRSH3TgQoBzWPCh4k6UFcQYHaz
 cONIRK8xkUTSiroa/dB2dV5WgHfgeXuk6xu22AjPb2PvwWjFJ2f5H+/+01FAxE3qm/dG
 IVn9c18QTh3x6dUHazAGPEVbYxkcD7BIrCppaVBxXcsXUDq3cB4rKoSXS/56oTEtYKI7
 e/ZBz0cUG7RBLQByXDQmXV51cicRfRDO/vnSXKbjl4rLSUkBzjWfjD3NRQ+e3y+bQosP
 DuFTfqwgq+SV0evfl8LgChTDFcbbQjMTra/pbC21X3kIEKwpecm5RBD/Cl4hH/DqOhr2
 goLQ==
X-Gm-Message-State: AOAM532DN7aiJzAvVfzlLuVUSamKTbKiSKL6GiwZbcmiFrk6w9FKXuTZ
 xvgrcumIjq6a1HjwqGbti9AONg==
X-Google-Smtp-Source: ABdhPJys4TF0Ihn3KqEehbr6uBcS1kPk0HaQIOgb2VgSkz8krt4iLIYOU9Il6qlvPpHf6jMTikWQpA==
X-Received: by 2002:a05:6000:1109:: with SMTP id
 z9mr27635163wrw.301.1624888721642; 
 Mon, 28 Jun 2021 06:58:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/18] target/arm: Implement MVE logical immediate insns
Date: Mon, 28 Jun 2021 14:58:23 +0100
Message-Id: <20210628135835.6690-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Implement the MVE logical-immediate insns (VMOV, VMVN,
VORR and VBIC). These have essentially the same encoding
as their Neon equivalents, and we implement the decode
in the same way.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  4 +++
 target/arm/mve.decode      | 17 +++++++++++++
 target/arm/mve_helper.c    | 24 ++++++++++++++++++
 target/arm/translate-mve.c | 50 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 4bbb9b3ae2c..5248dbe825a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -355,3 +355,7 @@ DEF_HELPER_FLAGS_3(mve_vaddvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vmovi, TCG_CALL_NO_WG, void, env, ptr, i64)
+DEF_HELPER_FLAGS_3(mve_vandi, TCG_CALL_NO_WG, void, env, ptr, i64)
+DEF_HELPER_FLAGS_3(mve_vorri, TCG_CALL_NO_WG, void, env, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d9ece7be5da..caeb016c12f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -26,10 +26,14 @@
 # VQDMULL has size in bit 28: 0 for 16 bit, 1 for 32 bit
 %size_28 28:1 !function=plus_1
 
+# 1imm format immediate
+%imm_28_16_0 28:1 16:3 0:4
+
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
 &2op qd qm qn size
 &2scalar qd qn rm size
+&1imm qd imm cmode op
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -41,6 +45,7 @@
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 @2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
      size=%size_28
+@1imm .... .... .... .... .... cmode:4 .. op:1 . .... &1imm qd=%qd imm=%imm_28_16_0
 
 # The _rev suffix indicates that Vn and Vm are reversed. This is
 # the case for shifts. In the Arm ARM these insns are documented
@@ -258,3 +263,15 @@ VADDV            111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rd
 # Predicate operations
 %mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
+
+# Logical immediate operations (1 reg and modified-immediate)
+
+# The cmode/op bits here decode VORR/VBIC/VMOV/VMVN, but
+# not in a way we can conveniently represent in decodetree without
+# a lot of repetition:
+# VORR: op=0, (cmode & 1) && cmode < 12
+# VBIC: op=1, (cmode & 1) && cmode < 12
+# VMOV: everything else
+# So we have a single decode line and check the cmode/op in the
+# trans function.
+Vimm_1r 111 . 1111 1 . 00 0 ... ... 0 .... 0 1 . 1 .... @1imm
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 85a552fe070..e6ced144673 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -323,6 +323,30 @@ DO_1OP(vnegw, 4, int32_t, DO_NEG)
 DO_1OP(vfnegh, 8, uint64_t, DO_FNEGH)
 DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
 
+/*
+ * 1 operand immediates: Vda is destination and possibly also one source.
+ * All these insns work at 64-bit widths.
+ */
+#define DO_1OP_IMM(OP, FN)                                              \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vda, uint64_t imm)    \
+    {                                                                   \
+        uint64_t *da = vda;                                             \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / 8; e++, mask >>= 8) {                      \
+            mergemask(&da[H8(e)], FN(da[H8(e)], imm), mask);            \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_MOVI(N, I) (I)
+#define DO_ANDI(N, I) ((N) & (I))
+#define DO_ORRI(N, I) ((N) | (I))
+
+DO_1OP_IMM(vmovi, DO_MOVI)
+DO_1OP_IMM(vandi, DO_ANDI)
+DO_1OP_IMM(vorri, DO_ORRI)
+
 #define DO_2OP(OP, ESIZE, TYPE, FN)                                     \
     void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
                                 void *vd, void *vn, void *vm)           \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index e9a5442a724..f435a1cfd97 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -34,6 +34,7 @@ typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -787,3 +788,52 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
     mve_update_eci(s);
     return true;
 }
+
+static bool do_1imm(DisasContext *s, arg_1imm *a, MVEGenOneOpImmFn *fn)
+{
+    TCGv_ptr qd;
+    uint64_t imm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    imm = asimd_imm_const(a->imm, a->cmode, a->op);
+
+    qd = mve_qreg_ptr(a->qd);
+    fn(cpu_env, qd, tcg_constant_i64(imm));
+    tcg_temp_free_ptr(qd);
+    mve_update_eci(s);
+    return true;
+}
+
+static bool trans_Vimm_1r(DisasContext *s, arg_1imm *a)
+{
+    /* Handle decode of cmode/op here between VORR/VBIC/VMOV */
+    MVEGenOneOpImmFn *fn;
+
+    if ((a->cmode & 1) && a->cmode < 12) {
+        if (a->op) {
+            /*
+             * For op=1, the immediate will be inverted by asimd_imm_const(),
+             * so the VBIC becomes a logical AND operation.
+             */
+            fn = gen_helper_mve_vandi;
+        } else {
+            fn = gen_helper_mve_vorri;
+        }
+    } else {
+        /* There is one unallocated cmode/op combination in this space */
+        if (a->cmode == 15 && a->op == 1) {
+            return false;
+        }
+        /* asimd_imm_const() sorts out VMVNI vs VMOVI for us */
+        fn = gen_helper_mve_vmovi;
+    }
+    return do_1imm(s, a, fn);
+}
-- 
2.20.1


