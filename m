Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17053C0E1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:41:33 +0200 (CEST)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtVV-000499-03
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskI-0001dA-4e
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskD-0000uU-Mi
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:44 -0400
Received: by mail-pl1-x636.google.com with SMTP id w3so5508804plp.13
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jaLSxCdfXBjAEEFrDF/LiYn6nOvGZYPG2MzO42FnVJ8=;
 b=KAyMkH19KY/Pm2RFkuqWb3Qye0mJCAMve9qqpl4bcuroGDuzPzj6Eenp1rxYW86c3A
 NhXi1VYeyEMHeovBhn7gMlO3FG/8OVnsjetOZ0hqpJquij9eaniT4suQ190ltnPSv1QE
 1NJ3PT45n8cp7lEWWD/CqHo325jPrVJVZw2dP3q+zIMgh0G9+yl5LB+6M8eA80cNemCT
 PPBHNJfF+WIa4AtrKdSJhROfScsPqq3BV/eS0lzq5hp703cUL1T/A/mOGBHIldrUSNkP
 XmxkX0ig3b5/QDckmCrTTCL0M2OgCtjqufNhREtUzcqaUnQGd0HqqmlQxyJ2Cg1Zo69F
 bW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaLSxCdfXBjAEEFrDF/LiYn6nOvGZYPG2MzO42FnVJ8=;
 b=IzvDJlz7cblMjRHJtQ7hA5c1lal/Hc2IrtLylmpD9c5eBYCpQEHDgMUz/IFGxGZDW6
 xKpSpWkFFxZK1k0MEw7RsDFQicqhH9Rez/9Vo7jtk/gplVL5CxuyxLcFnYNiC1LZLFEP
 ezYNTTkIMWeyidWDu0QSG7museiYCDZPzKuhYFG/Y8+MeW09vEwXVJYPi3ufM0Tdu4Zd
 Kn/9y0IkwFNqeUQIm4LVIdsJvjlOilKUONB3KcdKJCiA86AM9qa566fpUzRFnK2gIx0R
 6ZVdKmZfNB/94gVM4aj+JrdZ0bBLfl6GK3Kf37SlgYSH1n2r6+JkCAcG9adxzs4uBKii
 uShw==
X-Gm-Message-State: AOAM532raHEkW61mw9QifXl3lMUOxQ4/2PUM24fmeifO+cZsecjvlKxS
 TeUQVlmaPNpyLfXXiKVXKaq3C1FmXRdLBA==
X-Google-Smtp-Source: ABdhPJwCjDpoXQma+9jWl85MASGwiY8VMcWwZJ0dmpJATC8Mv3/TbUUJyH343P8l0Ak9mnb4vc2ihQ==
X-Received: by 2002:a17:902:d64e:b0:163:5074:c130 with SMTP id
 y14-20020a170902d64e00b001635074c130mr7126494plh.125.1654206760283; 
 Thu, 02 Jun 2022 14:52:40 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 52/71] target/arm: Implement FMOPA, FMOPS (widening)
Date: Thu,  2 Jun 2022 14:48:34 -0700
Message-Id: <20220602214853.496211-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  1 +
 target/arm/sme_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  2 ++
 4 files changed, 79 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 6b36542133..ecc957be14 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -120,6 +120,8 @@ DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_7(sme_fmopa_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index afd9c0dffd..e8d27fd8a0 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -75,3 +75,4 @@ FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 69e4252abc..0807fbc708 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -980,6 +980,80 @@ static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
     return pair;
 }
 
+static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
+                          float_status *s)
+{
+    float64 e1r = float16_to_float64(e1 & 0xffff, true, s);
+    float64 e1c = float16_to_float64(e1 >> 16, true, s);
+    float64 e2r = float16_to_float64(e2 & 0xffff, true, s);
+    float64 e2c = float16_to_float64(e2 >> 16, true, s);
+    float64 t64;
+    float32 t32;
+
+    /*
+     * The ARM pseudocode function FPDot performs both multiplies
+     * and the add with a single rounding operation.  Emulate this
+     * by performing the first multiply in round-to-odd, then doing
+     * the second multiply as fused multiply-add, and rounding to
+     * float32 all in one step.
+     */
+    FloatRoundMode old_rm = get_float_rounding_mode(s);
+    set_float_rounding_mode(float_round_to_odd, s);
+
+    t64 = float64_mul(e1r, e2r, s);
+
+    set_float_rounding_mode(old_rm, s);
+
+    t64 = float64r32_muladd(e1c, e2c, t64, 0, s);
+
+    /* This conversion is exact, because we've already rounded. */
+    t32 = float64_to_float32(t64, s);
+
+    /* The final accumulation step is not fused. */
+    return float32_add(sum, t32, s);
+}
+
+void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 15;
+    uint16_t *pn = vpn, *pm = vpm;
+
+    bool save_dn = get_default_nan_mode(vst);
+    set_default_nan_mode(true, vst);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            void *vza_row = vza + row * sizeof(ARMVectorReg);
+            uint32_t n = *(uint32_t *)(vzn + row);
+
+            n = f16mop_adj_pair(n, pa, neg);
+
+            for (col = 0; col < oprsz; ) {
+                uint16_t pb = pm[H2(col >> 4)];
+                do {
+                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {
+                        uint32_t *a = vza_row + col;
+                        uint32_t m = *(uint32_t *)(vzm + col);
+
+                        m = f16mop_adj_pair(m, pb, neg);
+                        *a = f16_dotadd(*a, n, m, vst);
+
+                        col += 4;
+                        pb >>= 4;
+                    }
+                } while (col & 15);
+            }
+            row += 4;
+            pa >>= 4;
+        } while (row & 15);
+    }
+
+    set_default_nan_mode(save_dn, vst);
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
                         void *vpm, uint32_t desc)
 {
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 581bf9174f..847f2274b1 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -328,6 +328,8 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     return true;
 }
 
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst,
+           a, MO_32, gen_helper_sme_fmopa_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst,
            a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
-- 
2.34.1


