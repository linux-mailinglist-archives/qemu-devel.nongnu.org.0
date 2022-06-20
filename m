Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4098552395
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:10:30 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lr3-0003ZC-OH
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0006Nc-JG
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:15 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaC-0001NP-VB
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:08 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so10896574pgc.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yb7Jdt2eUCklyOzRyEhryBZyN2wrwtY71ksWotD5vWk=;
 b=OFFOzXYjgqEs88g1T+8Fi6vwfUeg4L7XsFlTdqcfs90LbfS0aUouEZIx432ezFiE3P
 iX9+VyDJUFtGRo+82sgcYKHBZch3nEvd32BlI5ps3/L1cKHw/HraFOmlUBvSTHecKxL3
 jURoKRwexhWRvJozBHbAPpH07XZ8PS6MMDjXPLg7lYqdBLs1TOAh5FznInjK2AGIhfej
 3Q6Sc0SJ9rlKIlwBCTr17/vvoEuTyRusFGh3NSJlQhV4ffKepM9IjLTwHDAzprs/2YY7
 YfsIa/cybviVX0eK+Boax4rjTxPij5OeBFOKP4rr24KwKZSPQ1fWroBhk+zqhN57gyYV
 PAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yb7Jdt2eUCklyOzRyEhryBZyN2wrwtY71ksWotD5vWk=;
 b=d7oyvgwge48AoLjveNJDqOcH/TVv95Wt1jf3rMh7bn7fx5ktkfBa+heLpN2xHlx2Lr
 XorIbKBV5LT1jk286p3WJxfDmO10cGos4BudoJiPIrdu5eb1QXI/SCxwgZD6Z7+bVK/N
 6uMuOGJh4bbvDqLkZ93a6hDjFzR6CIyzWCfzjm2xVWhrqHD0Et6lQtX9nfdmIiFArOg9
 yYqkOZlnOK9hJD+ZV1zXPQ4ZqeZezCyWLzGja3FQloWmfFWDH/i/VHaoLGS4X9vaj7qN
 YrlWS67Q+8naw7+2XRvKgTLmzmyEswrzIUHDvdoWeqmtYY1YZhOXjgUtV88EczkvCyMn
 4WzA==
X-Gm-Message-State: AJIora/AMRQMDqDvTzK2AZoek1cTjMH1Bpho4/WJmE07jJoLoulKiIKo
 BzqQe1Qkz/YKjB+oW1R8+3avRO8vQg34+A==
X-Google-Smtp-Source: AGRyM1tCgo55xqDWWOgUlgktQZS4qucqKCoY0QL0egXnrxdfXHHrIw8VMbXAe2QS/tPLBgkkczl2kA==
X-Received: by 2002:a05:6a00:1a56:b0:51b:f1af:c2e8 with SMTP id
 h22-20020a056a001a5600b0051bf1afc2e8mr25468597pfv.48.1655747583218; 
 Mon, 20 Jun 2022 10:53:03 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 31/51] target/arm: Implement BFMOPA, BFMOPS
Date: Mon, 20 Jun 2022 10:52:15 -0700
Message-Id: <20220620175235.60881-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
 target/arm/sme.decode      |  2 ++
 target/arm/sme_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 29 +++++++++++++++++++++
 4 files changed, 85 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 727095a3eb..6b36542133 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -124,3 +124,5 @@ DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index ba4774d174..afd9c0dffd 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -73,3 +73,5 @@ ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
 
 FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
+
+BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 62d9690cae..61bab73cb7 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -964,3 +964,55 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
 
     set_default_nan_mode(save_dn, vst);
 }
+
+/*
+ * Alter PAIR as needed for controlling predicates being false,
+ * and for NEG on an enabled row element.
+ */
+static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
+{
+    pair ^= neg;
+    if (!(pg & 1)) {
+        pair &= 0xffff0000u;
+    }
+    if (!(pg & 4)) {
+        pair &= 0x0000ffffu;
+    }
+    return pair;
+}
+
+void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
+                        void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 15;
+    uint16_t *pn = vpn, *pm = vpm;
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
+                        *a = bfdotadd(*a, n, m);
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
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index e6e4541e76..581bf9174f 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -274,6 +274,32 @@ TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
 
+static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
+                       gen_helper_gvec_5 *fn)
+{
+    uint32_t desc = simd_desc(s->svl, s->svl, a->sub);
+    TCGv_ptr za, zn, zm, pn, pm;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    /* Sum XZR+zad to find ZAd. */
+    za = get_tile_rowcol(s, esz, 31, a->zad, false);
+    zn = vec_full_reg_ptr(s, a->zn);
+    zm = vec_full_reg_ptr(s, a->zm);
+    pn = pred_full_reg_ptr(s, a->pn);
+    pm = pred_full_reg_ptr(s, a->pm);
+
+    fn(za, zn, zm, pn, pm, tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(za);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pn);
+    tcg_temp_free_ptr(pm);
+    return true;
+}
+
 static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
                             gen_helper_gvec_5_ptr *fn)
 {
@@ -306,3 +332,6 @@ TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst,
            a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
            a, MO_64, gen_helper_sme_fmopa_d)
+
+/* TODO: FEAT_EBF16 */
+TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
-- 
2.34.1


