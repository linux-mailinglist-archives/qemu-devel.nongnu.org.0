Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5D3A6A85
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:34:46 +0200 (CEST)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsobt-0004wI-4H
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEc-0001Ef-UX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoER-0000MS-5D
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f2so14931353wri.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaU7b86mWBJMJuthuzxTN7h9xsxQm0YXfIFwo6BHtWE=;
 b=xxZHWErxhP4Iie6toNOQkjp1v7agQirFKiSVPjBK3Tr7gaaXnmeAmzZYkzEk0+BTLF
 k4+HBGHkCRLHluk0D+gp+kVaeZDJnQKHAo0vxf1f9U1+KnuUqtA9jwKTbxwx8iLMPN0v
 0Os8Q2l2mOHJ5Rd5sl9FwD9cSmIa3ZX29V9IPDd/F+7FO/7JqGl1s1VH7t3KQQTmTlRi
 RKV+duge4caidL16GCvrRNdEeca/1uW6EBAZyUIIDjFoUBMYNMpnebRWesW+zhY1BVVD
 vslHiFo8gXz6FaEagyYB8LaGxkaQ9PQyTsbyGMHu+AHilLX3G0NQ/YpR1xl4b9UJA9kT
 PUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UaU7b86mWBJMJuthuzxTN7h9xsxQm0YXfIFwo6BHtWE=;
 b=SqsboQTQ6P375ReDWfW0xYw/2lH4Zidb7+WIfSTqYtfzme4kOTgntIcMwgxQxsG7yO
 J2GYE+xrBycNFei2b9HVbmL7VkYQg6edI4Llp9wUboLQQP58+Y/2Qp+pylhkqJ/HI/Qq
 I+i5Fn/OXT8gaqbDklCFqeipKfN0nCsBDoqYv0T2ZPXom0XDAjjwk0IhMXnGoFXHbJBp
 fB5uOr/6UpVK7e45LxFDqk3TVBphjrlv4NNFzK/pULQKKGHEoZUZOfBMQxp6uzD60kRA
 WiYqCx7lHAe2zcSZ4ZrShzXiXidzVWzpegRemTYlaCXNs7fajkfQEQ6jVOZHVhPzck3O
 kYTg==
X-Gm-Message-State: AOAM5334+EVqQQegHlkEL6T3kbnJBe4P3A8v+YBdGApkPsbjivl3xHBh
 m3A5cTr6/YzgDqvOdJOEDVy2Gw==
X-Google-Smtp-Source: ABdhPJyT9AxZ2NSJXL1JfGyTS+9pKR0X6w6C8H6zqy6/q9NNTfiTlt5brOajaOm+HEKHJ7mLTuUGDg==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr19258149wrw.158.1623683429636; 
 Mon, 14 Jun 2021 08:10:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/57] target/arm: Implement MVE VAND, VBIC, VORR, VORN,
 VEOR
Date: Mon, 14 Jun 2021 16:09:33 +0100
Message-Id: <20210614151007.4545-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Implement the MVE vector logical operations operating
on two registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  9 +++++++++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 64c3f9e049e..01b6123f250 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -63,3 +63,9 @@ DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vand, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 09849917f5a..332e0b8d1d6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -25,6 +25,7 @@
 
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
+&2op qd qm qn size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -32,6 +33,7 @@
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
+@2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 # Vector loads and stores
 
@@ -68,6 +70,13 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
 
+# Vector 2-op
+VAND             1110 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VBIC             1110 1111 0 . 01 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VORR             1110 1111 0 . 10 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VORN             1110 1111 0 . 11 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VEOR             1111 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f464ec19eaf..94064e68660 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -337,3 +337,29 @@ DO_1OP(vnegw, 4, int32_t, DO_NEG)
 /* We can do these 64 bits at a time */
 DO_1OP(vfnegh, 8, uint64_t, DO_FNEGH)
 DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
+
+#define DO_2OP(OP, ESIZE, TYPE, FN)                                     \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)],                                  \
+                      FN(n[H##ESIZE(e)], m[H##ESIZE(e)]), mask);        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_AND(N, M)  ((N) & (M))
+#define DO_BIC(N, M)  ((N) & ~(M))
+#define DO_ORR(N, M)  ((N) | (M))
+#define DO_ORN(N, M)  ((N) | ~(M))
+#define DO_EOR(N, M)  ((N) ^ (M))
+
+DO_2OP(vand, 8, uint64_t, DO_AND)
+DO_2OP(vbic, 8, uint64_t, DO_BIC)
+DO_2OP(vorr, 8, uint64_t, DO_ORR)
+DO_2OP(vorn, 8, uint64_t, DO_ORN)
+DO_2OP(veor, 8, uint64_t, DO_EOR)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c5f5d49d11b..2c78dde42b3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -30,6 +30,7 @@
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -294,3 +295,39 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+{
+    TCGv_ptr qd, qn, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qn | a->qm) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qn, qm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_LOGIC(INSN, HELPER)                                  \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        return do_2op(s, a, HELPER);                            \
+    }
+
+DO_LOGIC(VAND, gen_helper_mve_vand)
+DO_LOGIC(VBIC, gen_helper_mve_vbic)
+DO_LOGIC(VORR, gen_helper_mve_vorr)
+DO_LOGIC(VORN, gen_helper_mve_vorn)
+DO_LOGIC(VEOR, gen_helper_mve_veor)
-- 
2.20.1


