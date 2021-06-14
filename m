Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D903A6A3C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:28:30 +0200 (CEST)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoVp-0005tx-24
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEc-0001DS-CD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEQ-0000M8-BK
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id a20so14980737wrc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BG3l6HpQ+F3zgwYgP7tVO2hGIWUrFZp+43Gsm6LqDQk=;
 b=b4IyxXA3jQqscAwrDD6jCevFMTUUMcWq+lvNAa3sBGgqj4icczJRchR9gg4cVQVbD/
 92Zxcxmj6uz3CXT5DjnF11XqqbGe41sU3Q6oD1Suhu/ehIVT8pMiK5N3sG2hDcL4hafC
 w8R/LgZswqHnKtxnokI5HtN9bEchfkGkVKLMwXzFy/sK4DgvCTKnzJhJIi6ZB0c0kmal
 RX1Lde8ju9ndB5IVBpZnGe5TRh4enbZfq/rDjTxanz1vHmt4s9nSLmC+Yaj7K3inc3U3
 JPfQoeo8nAqtCGdf3MfFYK9jbRQ3Pqj+yS8PBH0WvqBySkS1T0+yxKpXw5l4J2hrP9M4
 RWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BG3l6HpQ+F3zgwYgP7tVO2hGIWUrFZp+43Gsm6LqDQk=;
 b=d9b4s9HSFMrH4y/NB7NnppeLwW9z9emBsZ9e7WbKvgkBFLozvL7J4PAKpOOH/2utQy
 Cov2ENKFGEO7xiT2Z778ur5eSv8mNdtaAohJx4Jo7Xlefkl3wvgPTflbsZXtyKBh6/Ew
 x3bmcoJO43ONNqQZ6IfkzmMbz6DR456+NLwYZF6OfUl/+z1bkhEduVryNB/jO8IQLFjX
 +qX7iLiXRVd0weEitnSoShu8Fco1OKlkW1sC0RNEvBtW9ZJewILiupFNvGpMTxKso6lq
 Hf590Y3pBduIyJjvh4Suf4NshrobFERBs02UptNb6axi/oFDCOE2ZLLRBqyOGQGDHOS9
 SkiA==
X-Gm-Message-State: AOAM533gyJpsbf2HH4JuR1LZyahLurCCmDZaEtFnURwPYW21tnpnvk2G
 avJnGLlQg6cWyPUQm5eswe3Y9w==
X-Google-Smtp-Source: ABdhPJwufIUz9qJiTiLUvvAGRS0g9dJnw5ssj0WBrbYnXq6cpmVZZgAPTxvphLDpq4d94BNMBmjn5w==
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr19218160wrh.257.1623683428890; 
 Mon, 14 Jun 2021 08:10:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/57] target/arm: Implement MVE VDUP
Date: Mon, 14 Jun 2021 16:09:32 +0100
Message-Id: <20210614151007.4545-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Implement the MVE VDUP insn, which duplicates a value from
a general-purpose register into every lane of a vector
register (subject to predication).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  2 ++
 target/arm/mve.decode      | 10 ++++++++++
 target/arm/mve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-mve.c | 27 +++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 733a54d2e3c..64c3f9e049e 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,8 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vdup, TCG_CALL_NO_WG, void, env, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vclsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 82cc0abcb82..09849917f5a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -21,6 +21,7 @@
 
 %qd 22:1 13:3
 %qm 5:1 1:3
+%qn 7:1 17:3
 
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
@@ -82,3 +83,12 @@ VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
 VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
 VNEG             1111 1111 1 . 11 .. 01 ... 0 0011 11 . 0 ... 0 @1op
 VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
+
+&vdup qd rt size
+# Qd is in the fields usually named Qn
+@vdup            .... .... . . .. ... . rt:4 .... . . . . .... qd=%qn &vdup
+
+# B and E bits encode size, which we decode here to the usual size values
+VDUP             1110 1110 1 1 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=0
+VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 1 1 0000 @vdup size=1
+VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a5fd43f8180..f464ec19eaf 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -260,6 +260,22 @@ static inline void unknown_mergemask_type(void *d, uint64_t r, uint16_t mask)
                  (int64_t *,  mergemask_sq),    \
                  unknown_mergemask_type)(D, R, M)
 
+void HELPER(mve_vdup)(CPUARMState *env, void *vd, uint32_t val)
+{
+    /*
+     * The generated code already replicated an 8 or 16 bit constant
+     * into the 32-bit value, so we only need to write the 32-bit
+     * value to all elements of the Qreg, allowing for predication.
+     */
+    uint32_t *d = vd;
+    uint16_t mask = mve_element_mask(env);
+    unsigned e;
+    for (e = 0; e < 16 / 4; e++, mask >>= 4) {
+        mergemask(&d[H4(e)], val, mask);
+    }
+    mve_advance_vpt(env);
+}
+
 #define DO_1OP(OP, ESIZE, TYPE, FN)                                     \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ad2e4af2844..c5f5d49d11b 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -162,6 +162,33 @@ DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
 DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
 DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
 
+static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
+{
+    TCGv_ptr qd;
+    TCGv_i32 rt;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd)) {
+        return false;
+    }
+    if (a->rt == 13 || a->rt == 15) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    rt = load_reg(s, a->rt);
+    gen_dup_i32(a->size, rt, rt);
+    gen_helper_mve_vdup(cpu_env, qd, rt);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_i32(rt);
+    mve_update_eci(s);
+    return true;
+}
+
 static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 {
     TCGv_ptr qd, qm;
-- 
2.20.1


