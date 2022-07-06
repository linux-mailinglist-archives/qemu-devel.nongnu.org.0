Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E091656835C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:26:18 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91IX-00034j-Uw
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Li-0006Ru-EE
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:30 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lg-0000gD-Ke
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b7so3233110pfb.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lb8gvBs4PPSZA3dl0aQFL5IUdDDY/vtWudRXQbe3gfQ=;
 b=wy71BRs9PrjNWAjzfpSxb1lMLu1pCIpfYUE1LnSohviOMVpq9NiUuAn03Z0iiIrHjS
 CON7gIPzHuSI40BZrYviObIwT05wTwKHEwFgkbHUxwStaQQbPq+hFthFRnx6LlR9/+7Y
 mA/R58d0g8AwgRWv3Oy4Z+PkxcmnL5MoOzyVolMt+gz1Wa85hcSq5ABgX5ZFNIjDbSq0
 m9BWqUZ9I8OZzpIpAYDXQHv6Jh6h1ZqWDAycI44BPDy4RuqujcFcVGrwB5vZkZSUOVJG
 YpBovAIMXTjvgDV2gU4PH/pBMKooQRuHHhFx2u/DEQ8QMzwQj/hbo0kdXBk6bbwDosC+
 GSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lb8gvBs4PPSZA3dl0aQFL5IUdDDY/vtWudRXQbe3gfQ=;
 b=GE3japF+iL2mfJXgqGJ1WrSvT0yrjZUaj3dQYKlwCF2+R3JobEbu6YnRlnHM5aU8G8
 6XiQqcK25/p6dBFOXQUJgSmvoXG8RH+AJFo3ixaNcsrOV1/IQxy7+lpg8009+auwRRZK
 z92LJCHCS9Vry4n1zaj6LYBBOw9YSu3/NU1nimgCMSS7WnWfbaMcExHhwAtb6Bpw/l0u
 E3kEOE5L5IE56Cu8Thlkf48AMeQKCWGaNV34Lj8DKkTPfPHbJJpf+QkVx5F0ZWRJHbOe
 icNMrW2AdSVHPxpY5SwRtYU7P2V9BNrLCMP2pBngpUwkzHwOISW53K4uB/je3DaKw6Fw
 ZW2w==
X-Gm-Message-State: AJIora9Kcn8/cDBgFIPuwTEQUG5sxLUn5f+CPCz6CdGrgnRU7mjHqF5y
 2FDpbPQSfRNIH19S87B+LHAEywZc4IwZW1NJ
X-Google-Smtp-Source: AGRyM1szAesdqlpYtTclYgAsT1HOmEeIZw/VUCDqmJT0tzZ/xTs5aK7tuOmzNyA1cCIuuHracRYZPQ==
X-Received: by 2002:a63:b105:0:b0:3fd:a875:d16 with SMTP id
 r5-20020a63b105000000b003fda8750d16mr33198803pgf.209.1657095927821; 
 Wed, 06 Jul 2022 01:25:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 26/45] target/arm: Implement FMOPA, FMOPS (widening)
Date: Wed,  6 Jul 2022 13:53:52 +0530
Message-Id: <20220706082411.1664825-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/arm/sme_helper.c    | 68 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  1 +
 4 files changed, 72 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 1d68fb8c74..4d5d05db3a 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -121,6 +121,8 @@ DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
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
index 4b437bb913..e92f53ecab 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -998,6 +998,74 @@ static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
     return pair;
 }
 
+static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
+                          float_status *s_std, float_status *s_odd)
+{
+    float64 e1r = float16_to_float64(e1 & 0xffff, true, s_std);
+    float64 e1c = float16_to_float64(e1 >> 16, true, s_std);
+    float64 e2r = float16_to_float64(e2 & 0xffff, true, s_std);
+    float64 e2c = float16_to_float64(e2 >> 16, true, s_std);
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
+    t64 = float64_mul(e1r, e2r, s_odd);
+    t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
+
+    /* This conversion is exact, because we've already rounded. */
+    t32 = float64_to_float32(t64, s_std);
+
+    /* The final accumulation step is not fused. */
+    return float32_add(sum, t32, s_std);
+}
+
+void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 15;
+    uint16_t *pn = vpn, *pm = vpm;
+    float_status fpst_odd, fpst_std = *(float_status *)vst;
+
+    set_default_nan_mode(true, &fpst_std);
+    fpst_odd = fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            void *vza_row = vza + tile_vslice_offset(row);
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
+                        *a = f16_dotadd(*a, n, m, &fpst_std, &fpst_odd);
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
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
                         void *vpm, uint32_t desc)
 {
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index ecb7583c55..c2953b22ce 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -355,6 +355,7 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     return true;
 }
 
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
 
-- 
2.34.1


