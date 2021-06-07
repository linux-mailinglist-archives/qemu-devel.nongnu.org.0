Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E157039E53B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:23:12 +0200 (CEST)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIxz-00080f-G7
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaj-0007bs-75
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:09 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaI-0007yy-PD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so125952wmk.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rdP9+7JlYEzrxLr9eGsR6KrxjEDczbLT9FYDCtT1so=;
 b=XmLZzoQELFuox6ArF7gy+F0Q/p0LW8EkD78YLbPPXfumchL4qBJ4udyhuRnHSpKWK/
 ve+u7esFsOTX4AZ4O4D/GW7MkCWh1vT4IAg87tobidzcqHTlHWzPGXHV6QsWQpjNUYar
 C7KSdJQD2Lpj21Jy33jKbMtSlHW3UwzsrAZEFQh6y5EWJOlayF9NSVSMHGcXmclLgutD
 wVKCljiIi8Biv24X5UruDVHJ5Zddu5hHuHaLnDBXKrfLiltnM6k6+dTiscEstigQs19R
 hlGDFYkvU0XwJYQPOJFXVjvg+grCcvq+MLg9ZlDvS9OfXKmSiVw96A8NvIzVDc2g5ULs
 o4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rdP9+7JlYEzrxLr9eGsR6KrxjEDczbLT9FYDCtT1so=;
 b=i8CI8WvBXZXZ8vrrQEOm+Jw6oET/fFlhHLdU0HKKgKZkQEnd053l8l2g9sqfeVxNFY
 965DnKBU6Qk/7yXQfKBtOWDlEVGlnOnDfZbdh3g/kls06r7dYiuP9Muz7rJnaIQ0mSu/
 oi6io9Xie2/o8i6aAjgtQmDZyt0qsxAl2iozF5Fv/JAgtmVWAFDGsPKdlppnG1m7IAjo
 DYXt2Iu9kGaYX65EwMMrUn7HUhrIHMN61udHNSo9SdG4FfzWMZ0rZcEKbrUGCjiUeQ/1
 ElErm4Psmzgj97/wKN93ENKnHDiRivxBPkt6e/tCltQtGld7bQlxeDD1SryLsnIbv9OP
 PJsg==
X-Gm-Message-State: AOAM531psDC3zdorjp5cgmU1uqd+a/aVohDZY2Jovyd96WJj4V018y7i
 jI/IRs6iiwKqu3Ab7vKIfkHQHA==
X-Google-Smtp-Source: ABdhPJzUZOjTbehyfAIrldpUcl87Gpg1vKLRbnJ7R6Q+COA2LEE/ezFBkety5z8qGPtnFICvP4veoQ==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr73613wmg.160.1623085120671;
 Mon, 07 Jun 2021 09:58:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/55] target/arm: Implement MVE VAND, VBIC, VORR, VORN, VEOR
Date: Mon,  7 Jun 2021 17:57:47 +0100
Message-Id: <20210607165821.9892-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  9 +++++++++
 target/arm/mve_helper.c    | 28 ++++++++++++++++++++++++++
 target/arm/translate-mve.c | 41 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index ece9c481367..ad09170c9cf 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -65,3 +65,9 @@ DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
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
index a5ed4e01e33..6b3d4dbf2da 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -306,3 +306,31 @@ DO_1OP(vnegw, 4, int32_t, H4, DO_NEG)
 
 DO_1OP(vfnegh, 2, uint16_t, H2, DO_FNEG)
 DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
+
+#define DO_2OP(OP, ESIZE, TYPE, H, FN)                                  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            TYPE r = FN(n[H(e)], m[H(e)]);                              \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (r & bytemask);                                  \
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
+DO_2OP(vand, 1, uint8_t, H1, DO_AND)
+DO_2OP(vbic, 1, uint8_t, H1, DO_BIC)
+DO_2OP(vorr, 1, uint8_t, H1, DO_ORR)
+DO_2OP(vorn, 1, uint8_t, H1, DO_ORN)
+DO_2OP(veor, 1, uint8_t, H1, DO_EOR)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b4fc4054fe1..0e0fa252364 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -30,6 +30,7 @@
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -322,3 +323,43 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+{
+    TCGv_ptr qd, qn, qm;
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


