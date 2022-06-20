Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38695523A6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:14:19 +0200 (CEST)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Luk-0001wN-US
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0006Nf-KN
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:15 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaD-0001Xb-CT
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id d13so10358877plh.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2TEsEbls40NHQDsc591MofVw8ZCv8hOnEn3wvy2CZKc=;
 b=dLTITGAw3l0e6M7xAT8nEN/DuCqhDVpZutQVvhsk5Bd5hQUA6VeFPl1XI5xKZl03Xy
 pABndmiDH1pMP0Xwhk3vXJBGGferhkVqQwbIYV3W3xEGLolyiJMSA9GBWtUuJbVd7NpB
 JbAlPZOqBjkW3Yh3UozK9JWRzX1EOvpFLFWnuYhLh1ZwQ7VL0SI/l7TqSBM7gTLvXcVp
 DinurmruWqNwtKQKvgPal9GDdEugS+hWEYbjsG44ANkou24W7+T9K4BHu+9FCqMyiQRz
 VjEZhGWJZZDGV1cD+629CZL/qViwhFC7rWYobSkUG844M4Tz4PgPYDvd4FSgBbrZieis
 AvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2TEsEbls40NHQDsc591MofVw8ZCv8hOnEn3wvy2CZKc=;
 b=oGRGFG+1/p8D6OT+/pMRS72ugxCjhlulFxzAFFYG2ajNDzvpIuytwCSKcq3pes+z6C
 0tRh1NIgHdhvNJov4gpW3Ukxl60r2cxCn3UXisPbXn1KqEWVqWEFqOC2iM7TdO1a+GfZ
 /SI2NFJ8M2D93Rqgx/ULrkhsiDlcRoQBu+qi/Zx7LWTzUTndMZa1/Cgwnx5upjQgoadA
 pazZgKh/MI2a7jeyl4zOwjsR9uEWmlIE9qeAVswgEt8SKeK1HdrxCBGsox4M+HWJy8zW
 rKr2+TnoiORXv2Ue0X9NMT577gDYkamDreBtP00NNDMtCpLu6GupJSWp7K8WyKcoG/Jf
 sKJw==
X-Gm-Message-State: AJIora9AMGonmuUFHrGwSqCco9n53skiP5dXPuufhnuycSfcxqryWweM
 mX9oqeRgUn5BusdKWTXB8Xrah5BCniqfcg==
X-Google-Smtp-Source: AGRyM1u0cVra5a1A4zxBB5Fjue3mF6z5ZmsQuuIVQqyyVYdq3uKfMtj9+/7opQGx5NwFpR6tqNcSRg==
X-Received: by 2002:a17:902:b218:b0:168:de55:dfba with SMTP id
 t24-20020a170902b21800b00168de55dfbamr24571044plr.134.1655747584106; 
 Mon, 20 Jun 2022 10:53:04 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 32/51] target/arm: Implement FMOPA, FMOPS (widening)
Date: Mon, 20 Jun 2022 10:52:16 -0700
Message-Id: <20220620175235.60881-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 61bab73cb7..6863a204d4 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -981,6 +981,80 @@ static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
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


