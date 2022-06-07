Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC2541C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:57:18 +0200 (CEST)
Received: from localhost ([::1]:47038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhCP-0004Hn-Dp
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfws-00077U-I5
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:10 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwg-0008I6-9N
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y196so16509350pfb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3dYy/A12nx0G1t49jYKdalrUiIu02UDHCUpuUcsXPY=;
 b=YytLFE4J+SP/ubtkWeW6OIeAUeuukVU2wnxaQLQcgqanDZGQvXRJLyRqG0vJvRcFrn
 usCeGCnIm8rvmymdMW66JBNBmS4mmaaLLhyun+9K9egEUhJclTx1azWPeRN3DL8XO+WY
 2p/lNe1p6aFHMDxyRl300fbAXBSbdfpI3Eka5N+FvwQczdm+9a8XddhXsqAMNWFfIZeH
 oQdksqCLJadZiSnRqEBY3QdnyTglpPs19umlApQoi3txDTNqMiMBi6E0oesOX62aQxjX
 drstlRItTJRJSfzZxPvSV54BwIpXzAG3u+LKH6K0D24iCN1yfR2880UPC8RjliS+b+F/
 1h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3dYy/A12nx0G1t49jYKdalrUiIu02UDHCUpuUcsXPY=;
 b=U6EcZk5x3sMDgmyH3zEW8cHNV72jGiwUacE/nGB21koHsOBykh7ol4qEFbXih7bAfT
 z1rpaciw95W8gexCElBNQa6whYJ3Kwjr8GGUacLsr+4Sk3E1av1fBOPkHw+EGqcC4lPh
 zJ370DGW5SgYJGvh8bqjtIe3jm2OJY78MLp4n2cOH8TY+sl6ChNvJF08zuGE3iVkbxjI
 jdS1g82XpQOwGACsYTLxB8EFtKtQUlxVb2+1dyUq22dtTBApgO9KF3tGwCdX4m6J4/TR
 vzzVK9mpnfiD1V/V0PBn8cHvE50zB0IpN6jyt+KlE+WDlgyhPHfF2aJnsHZRYML1djPD
 8xng==
X-Gm-Message-State: AOAM532tO9MghXl1RO14cXYls0adc5tAZYo3ZtNNIUqp3jhIQgYLH2MK
 S4+LQAXn/iOEf5FV4BNJZdJl2k3b9PwA+A==
X-Google-Smtp-Source: ABdhPJwtsXSSZ2sYI0PKxo4bIB5XghuZk1f9L58ozqhEMGOujRt9EMGfmT2lZt3L2bBt5mN1spK08A==
X-Received: by 2002:a05:6a00:1745:b0:51b:de90:aefb with SMTP id
 j5-20020a056a00174500b0051bde90aefbmr25278053pfc.11.1654634216902; 
 Tue, 07 Jun 2022 13:36:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 53/71] target/arm: Implement SME integer outer product
Date: Tue,  7 Jun 2022 13:32:48 -0700
Message-Id: <20220607203306.657998-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

This is SMOPA, SUMOPA, USMOPA_s, UMOPA, for both Int8 and Int16.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    | 16 ++++++++
 target/arm/sme_helper.c    | 82 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 14 +++++++
 target/arm/sme.decode      | 10 +++++
 4 files changed, 122 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index ecc957be14..31562551ee 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -128,3 +128,19 @@ DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_smopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_umopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_sumopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_usmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_smopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_umopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_sumopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_usmopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 6863a204d4..f1c7e6ae56 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -1090,3 +1090,85 @@ void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
         } while (row & 15);
     }
 }
+
+typedef uint64_t IMOPFn(uint64_t, uint64_t, uint64_t, uint8_t, bool);
+
+static inline void do_imopa(uint64_t *za, uint64_t *zn, uint64_t *zm,
+                            uint8_t *pn, uint8_t *pm,
+                            uint32_t desc, IMOPFn *fn)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    bool neg = simd_data(desc);
+
+    for (row = 0; row < oprsz; ++row) {
+        uint8_t pa = pn[H1(row)];
+        uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
+        uint64_t n = zn[row];
+
+        for (col = 0; col < oprsz; ++col) {
+            uint8_t pb = pm[H1(col)];
+            uint64_t *a = &za_row[col];
+
+            *a = fn(n, zm[col], *a, pa & pb, neg);
+        }
+    }
+}
+
+#define DEF_IMOP_32(NAME, NTYPE, MTYPE) \
+static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
+{                                                                           \
+    uint32_t sum0 = 0, sum1 = 0;                                            \
+    /* Apply P to N as a mask, making the inactive elements 0. */           \
+    n &= expand_pred_b(p);                                                  \
+    sum0 += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                              \
+    sum0 += (NTYPE)(n >> 8) * (MTYPE)(m >> 8);                              \
+    sum0 += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                            \
+    sum0 += (NTYPE)(n >> 24) * (MTYPE)(m >> 24);                            \
+    sum1 += (NTYPE)(n >> 32) * (MTYPE)(m >> 32);                            \
+    sum1 += (NTYPE)(n >> 40) * (MTYPE)(m >> 40);                            \
+    sum1 += (NTYPE)(n >> 48) * (MTYPE)(m >> 48);                            \
+    sum1 += (NTYPE)(n >> 56) * (MTYPE)(m >> 56);                            \
+    if (neg) {                                                              \
+        sum0 = (uint32_t)a - sum0, sum1 = (uint32_t)(a >> 32) - sum1;       \
+    } else {                                                                \
+        sum0 = (uint32_t)a + sum0, sum1 = (uint32_t)(a >> 32) + sum1;       \
+    }                                                                       \
+    return ((uint64_t)sum1 << 32) | sum0;                                   \
+}
+
+#define DEF_IMOP_64(NAME, NTYPE, MTYPE) \
+static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
+{                                                                           \
+    uint64_t sum = 0;                                                       \
+    /* Apply P to N as a mask, making the inactive elements 0. */           \
+    n &= expand_pred_h(p);                                                  \
+    sum += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                               \
+    sum += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                             \
+    sum += (NTYPE)(n >> 32) * (MTYPE)(m >> 32);                             \
+    sum += (NTYPE)(n >> 48) * (MTYPE)(m >> 48);                             \
+    return neg ? a - sum : a + sum;                                         \
+}
+
+DEF_IMOP_32(smopa_s, int8_t, int8_t)
+DEF_IMOP_32(umopa_s, uint8_t, uint8_t)
+DEF_IMOP_32(sumopa_s, int8_t, uint8_t)
+DEF_IMOP_32(usmopa_s, uint8_t, int8_t)
+
+DEF_IMOP_64(smopa_d, int16_t, int16_t)
+DEF_IMOP_64(umopa_d, uint16_t, uint16_t)
+DEF_IMOP_64(sumopa_d, int16_t, uint16_t)
+DEF_IMOP_64(usmopa_d, uint16_t, int16_t)
+
+#define DEF_IMOPH(NAME) \
+    void HELPER(sme_##NAME)(void *vza, void *vzn, void *vzm, void *vpn,      \
+                            void *vpm, uint32_t desc)                        \
+    { do_imopa(vza, vzn, vzm, vpn, vpm, desc, NAME); }
+
+DEF_IMOPH(smopa_s)
+DEF_IMOPH(umopa_s)
+DEF_IMOPH(sumopa_s)
+DEF_IMOPH(usmopa_s)
+DEF_IMOPH(smopa_d)
+DEF_IMOPH(umopa_d)
+DEF_IMOPH(sumopa_d)
+DEF_IMOPH(usmopa_d)
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 847f2274b1..4aa0aff25c 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -337,3 +337,17 @@ TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
 
 /* TODO: FEAT_EBF16 */
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
+
+TRANS_FEAT(SMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_smopa_s)
+TRANS_FEAT(UMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_umopa_s)
+TRANS_FEAT(SUMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_sumopa_s)
+TRANS_FEAT(USMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_usmopa_s)
+
+TRANS_FEAT(SMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_smopa_d)
+TRANS_FEAT(UMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_umopa_d)
+TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_sumopa_d)
+TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_usmopa_d)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index e8d27fd8a0..628804e37a 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -76,3 +76,13 @@ FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
+
+SMOPA_s         1010000 0 10 0 ..... ... ... ..... . 00 ..      @op_32
+SUMOPA_s        1010000 0 10 1 ..... ... ... ..... . 00 ..      @op_32
+USMOPA_s        1010000 1 10 0 ..... ... ... ..... . 00 ..      @op_32
+UMOPA_s         1010000 1 10 1 ..... ... ... ..... . 00 ..      @op_32
+
+SMOPA_d         1010000 0 11 0 ..... ... ... ..... . 0 ...      @op_64
+SUMOPA_d        1010000 0 11 1 ..... ... ... ..... . 0 ...      @op_64
+USMOPA_d        1010000 1 11 0 ..... ... ... ..... . 0 ...      @op_64
+UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
-- 
2.34.1


