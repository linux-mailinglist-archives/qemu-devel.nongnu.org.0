Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9D53C0DD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:37:32 +0200 (CEST)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtRb-0005tL-Jb
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskG-0001cr-5f
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:49 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskC-0000uE-WD
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:43 -0400
Received: by mail-pf1-x431.google.com with SMTP id w21so5850085pfc.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9/P4k41tvaBx3FynADzNq0fNHgArONzp5FUlS6UNac=;
 b=EFMg04W1++2hdCw6/xl11577eFiJHLXPJMFV4slglvOPf2P5trJcAlDnWoTx0YRXwv
 61b/xeV0h0Qt6bwKZXNu2rl4oK95L+fONcQZrvjZDfsWYaJpJd7soBYsBX4m1plVoFsk
 UUEBTzaxSSGyZY/CsTsxuG9hMLgCyO0l3Vzk/ypRkE3+HQKSG5nqMw2yBOih+mOCRlN4
 Udyi9TJx6KG9OR6t7F1Mi4pYDlf//DT5zRQhUQW4XuGEurPNjt+pQos6LMxPSjU9xNE6
 MfLKXoaAD57Zattfx60TjI4uwMM1WMkyI7gKytpUq7fMwXP8rDQr9UUsHZP5ohQ2+wbN
 o5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9/P4k41tvaBx3FynADzNq0fNHgArONzp5FUlS6UNac=;
 b=TXEmL1QRxGBj/NSpaHa4UMrxqZ5J7PO8SDhP3AaSjHzBoP4JTeUUCWP52Yj1dOoFyv
 p2pPZZA38/rFZajUAE8AvPh67Yo3YWK9ccPJtMVI9HE79PT7bnBNTF0/ps8jQgx0fj/0
 mIvzE/HBO/pRRHIxolOMjogTk58zMSIK8DQ7vpWE8am53Iv5OJvLfwk0Xudtre4gv/20
 IlZbTFZ25d7auqdiJ923X+1DNmmXzE6gt21GjceEwSWLs4gE8q8zoiENangJjv2QSDKv
 FQrRwvRjPNay8UTmobUx+7YOAQifZ/ZXOMeAeH4bZTYlQlfSLS7OTmKJt4/zBhSzsx1N
 tTVw==
X-Gm-Message-State: AOAM5327g4PYURJMF9fKNQTduJHH1fdkpnCQI+fufjOV7Y0KJdtTNWEb
 l1LKc+st0XFv9Rz22TqOJUa3BW9lgzDKfA==
X-Google-Smtp-Source: ABdhPJwFzH14KgPRMVsHwOu8SNwWr3I7BxOH6rFKTIknJMIDdPTR0tUgxNbrukTjBqFDpPpRyudC6w==
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr5765553pgw.223.1654206759577; 
 Thu, 02 Jun 2022 14:52:39 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 51/71] target/arm: Implement BFMOPA, BFMOPS
Date: Thu,  2 Jun 2022 14:48:33 -0700
Message-Id: <20220602214853.496211-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
index 16655c86a2..69e4252abc 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -963,3 +963,55 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
 
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


