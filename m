Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E846156BCE6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:28:17 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ptw-0007v3-Qc
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj8-0003lu-6k
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:06 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj5-0002OV-Fi
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:05 -0400
Received: by mail-pl1-x631.google.com with SMTP id f11so4046191plr.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixcykaZZg1mCTysoeSKW2RpHUNDMDNdzI+zk42sFn7c=;
 b=UoT9a7/Smv+7RB0kDwvFFPXGKWOuarfIZVa+4/1/esYU6G//Rctw+DteF735oJUZ3W
 SjD467ZBPFkPGaC7GgPPcd2oVmDAe/t3XHaX+PGFglwrt8fzo4F6YMHA+YhKD8dRkiYD
 vqjyz7LiDDmaTJ7EQiJlfB8wihi9ZsjRjvgx9GLdZA1FF8bFkxvRwlgB4GA5/drmPuHz
 r0FlmJGaoE7FNg3zJFy2qrKzhyx3FWRVArr4vUAGU2kO3GletjqKXK9OeBQcYJp9LOJj
 xkb2VhBaUPtkJ+X6xPevmHtebpDsG0IKSSxyVs6mrfVwBORg3ffhiuuKVexMW6juB09O
 7acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ixcykaZZg1mCTysoeSKW2RpHUNDMDNdzI+zk42sFn7c=;
 b=bXBBVGR/EhduCQF7t37TTjYgIyGrRk9EbydCu/KJTAYw4nt0XYZOZM5wTEJCVpcCLj
 WxspdblESrPmFFvgox0I505kAdgD+VrUbDzQvTLh6Zo8BP2T0tILTyw5aIiq50lI7Hwx
 3HKRTHDNZnrYsB12uU9lzJFu3Vg3EzzfXv+g50aSR1y9FAJP70KXEmAYJMswcwaEaHmG
 OR1GcQWut+CbEGTHjL6LVXQjZtAW7ft0i0xLpt7zmp72tYk8oMNWz4XMBce41FEb6xgg
 bkfN0u9FLjQZHDQGtaC4BTlkwpZFKxl3393r+HUpIwqlLM0p94B55ifQ6ZUCkMNzyGn/
 wL1w==
X-Gm-Message-State: AJIora8BItcQkW2j2Fm+aN+kHeGPH8Acdd+BKP1g17TWK2mgAqHLHffP
 uiJi2kjQiMCB6plVpBUTIo2TdSAl1sUOIOAs
X-Google-Smtp-Source: AGRyM1v4Edq/qlbICBypHfTDnSfBZT3p5GWckyf7+HI+4pBylVSs7IJE6C1RG5OpDqe6vpMGNMVSUQ==
X-Received: by 2002:a17:90a:f415:b0:1ef:8811:e0c7 with SMTP id
 ch21-20020a17090af41500b001ef8811e0c7mr376547pjb.130.1657293422127; 
 Fri, 08 Jul 2022 08:17:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 25/45] target/arm: Implement BFMOPA, BFMOPS
Date: Fri,  8 Jul 2022 20:45:20 +0530
Message-Id: <20220708151540.18136-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 target/arm/sme_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 30 ++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index f50d0fe1d6..1d68fb8c74 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -125,3 +125,5 @@ DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
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
index 7dc76b6a1c..690a53eee2 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -987,3 +987,59 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
         }
     }
 }
+
+/*
+ * Alter PAIR as needed for controlling predicates being false,
+ * and for NEG on an enabled row element.
+ */
+static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
+{
+    /*
+     * The pseudocode uses a conditional negate after the conditional zero.
+     * It is simpler here to unconditionally negate before conditional zero.
+     */
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
+    uint32_t neg = simd_data(desc) * 0x80008000u;
+    uint16_t *pn = vpn, *pm = vpm;
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t prow = pn[H2(row >> 4)];
+        do {
+            void *vza_row = vza + tile_vslice_offset(row);
+            uint32_t n = *(uint32_t *)(vzn + H1_4(row));
+
+            n = f16mop_adj_pair(n, prow, neg);
+
+            for (col = 0; col < oprsz; ) {
+                uint16_t pcol = pm[H2(col >> 4)];
+                do {
+                    if (prow & pcol & 0b0101) {
+                        uint32_t *a = vza_row + H1_4(col);
+                        uint32_t m = *(uint32_t *)(vzm + H1_4(col));
+
+                        m = f16mop_adj_pair(m, pcol, 0);
+                        *a = bfdotadd(*a, n, m);
+
+                        col += 4;
+                        pcol >>= 4;
+                    }
+                } while (col & 15);
+            }
+            row += 4;
+            prow >>= 4;
+        } while (row & 15);
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index fa8f343a7d..ecb7583c55 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -299,6 +299,33 @@ TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
 
+static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
+                       gen_helper_gvec_5 *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, a->sub);
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
@@ -330,3 +357,6 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
 
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
+
+/* TODO: FEAT_EBF16 */
+TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
-- 
2.34.1


