Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703D56839F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:36:41 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Sa-0000Gn-Mv
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lf-0006Qc-S2
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:28 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Le-0000he-69
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:27 -0400
Received: by mail-pg1-x534.google.com with SMTP id j184so2808196pge.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x1EMK+9mWFwOGuXDAQlgUoQoDotScJuxq9dzCcNCSVk=;
 b=m7LkWGiy6uKRtv4m90EpYRWLCWUXL3+didGiHwWLwa5dA56N2l7xSKol22hEaRigJg
 qQgOyhG8iCIe7d9ZjQbis4ec3lVOeOCYUC+0iiiKF1HY0ahWhUsEIpJcbcEzYUrg4mot
 iBaMLM+6zVcHWNHSInPYVOhbdKiKu/0xWgILFXMvAgrS6OAmhCAH6UIBHcRl8vEKyg4g
 S+vLPBJ4e1+VHAGluK1NHF1jGOR/OggFodPO7ixCqLC1alKQ0X0lJRAYeD07NY7swDpg
 jWuEA+r41YoFAXI0Nrt8WcL995WOvk0GuOIC8wZye8rG5VebxkNEDCNjzA1WmUXIBzpo
 yl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1EMK+9mWFwOGuXDAQlgUoQoDotScJuxq9dzCcNCSVk=;
 b=NPeR9BqJPreC2Zp6g/8HYUNTJL0aOhduy7MGxcUr7kH/b9tJOpE5h45ysdXFRgw5SN
 MkyXmp5IAeaR5cZaTaIO7aS386QjUz/jyHPFaCWZHl2JHpC1ltuu52EA7DEseUMfDKKO
 KYpx5nF8e5kgdKdJgZuBCZh7mGRFd+/l0CxgZm1tpuypQbyekSAO702WEymj1zG6upWE
 dkx5EpGYhVuORYCsjt5ZdYT8YEuBsOJwl0OAdTjBrHQ1bWeYdTNYBNglee84hPCWs1bW
 5jIgdHYds5OrF86UjU9aS1jRojUJI2IBua57NALDRV1MNCZhcRHzmLg64gmt53torQUl
 5HFA==
X-Gm-Message-State: AJIora9CXeF60n/MUXFfH5+CTdTT8pY6UFjOq0vRGZdn51GmnWh1xiWO
 Jdr3ndjKzfQGJ7m+JgSN1HcypZMauyUdMMcN
X-Google-Smtp-Source: AGRyM1u/vwmTbchj4NtHMPAo+co3/4XvwoyraxhVmPzJ+C9QhEDPlPvZrYed6MX0nZawSoXQ6gKgNg==
X-Received: by 2002:a63:bf4d:0:b0:40c:4060:f6d with SMTP id
 i13-20020a63bf4d000000b0040c40600f6dmr33998070pgo.254.1657095924278; 
 Wed, 06 Jul 2022 01:25:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 25/45] target/arm: Implement BFMOPA, BFMOPS
Date: Wed,  6 Jul 2022 13:53:51 +0530
Message-Id: <20220706082411.1664825-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
 target/arm/sme.decode      |  2 ++
 target/arm/sme_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 30 ++++++++++++++++++++++
 4 files changed, 86 insertions(+)

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
index 78ba34f3d2..4b437bb913 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -981,3 +981,55 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
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


