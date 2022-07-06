Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A9568310
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:13:39 +0200 (CEST)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o916I-00035K-0a
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lc-0006O2-I7
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:24 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90La-0000gp-QG
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:24 -0400
Received: by mail-pg1-x533.google.com with SMTP id s206so13467818pgs.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Nd7aoiJ0a4Om5oS4WouR0rEr++9q5c771YPccSG4HM=;
 b=LoK1pMNZaCDE+QaIRjGwGTG7mcJb+2/vEi3wvhOKPh/7Vv3JBjSa50j1zF1eSA2508
 mbfYZFpDmaCykCnbSwSfYw88ojLBxHD+Q3IZivaJNaB7vnclzNYPHb4JSyNiwgS585Wn
 mx3tK+gnm/+/d8FRuvZShSp8VG14IWR/574j6uQ7G5EV95nHzjJBUAUV2Q0eN0KwT/rp
 59dwk6Y8JtgpPY1dUoxNgGTbwxa4W+PVkZg8k5x2TiVJPjk7c4XWAyIjlnZ54HEr/Teh
 1ADCi0XrliyesGyOevUs9OCIStlYgeXQ7eAN78PQnZD/5+1IxUzWRf8dSQboSqqKpjYo
 YXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Nd7aoiJ0a4Om5oS4WouR0rEr++9q5c771YPccSG4HM=;
 b=8C7EZjxJFVDsR0J9Ob4QUL+wkU49cj//eZXGBqHsZ+dbjqnGBKZTodvwA1ykpBs3Fw
 YIdA5iNEl97akV8RyhrR4pPVoJNIgEDt4Ebh3H1WjRF43x2rO0FOcfQxY8b0gkrjF5Xf
 t17zHD3/CpVDuh0UYPLPk0ag01zUDtnjYcUqu3etYp1c/kgkk8mOLWOcB0zSXzx85dg4
 QMYo0FLAhKGDl50zIKESJhVubBAUtVkhXjQvCmjf0fbZk95JofNpLC5XAhg4kTXb3ZST
 IljLVrrLo9RSyTcoeMnEaV2E3+qPeWOYkpoM1B0sl7ApNmxw66EX6lp1l6ykI1s6qbEJ
 Eepw==
X-Gm-Message-State: AJIora8h568j5TRNX4HRcimwPyNAczo5EO/nJbVSKsp6V0Vb6NzEsdQM
 vUmI0XvGAMylvA4Z0uyH/vPGTVikaOxJ072t
X-Google-Smtp-Source: AGRyM1sxAJteggezRohQga3Os0cHRzna5IhhqUYhFQw8I9Jo4o1XvL0zqwT/Nd3VExs4JtFE06dKIw==
X-Received: by 2002:a63:7b18:0:b0:40c:9f14:981 with SMTP id
 w24-20020a637b18000000b0040c9f140981mr34108077pgc.176.1657095921415; 
 Wed, 06 Jul 2022 01:25:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 24/45] target/arm: Implement FMOPA, FMOPS (non-widening)
Date: Wed,  6 Jul 2022 13:53:50 +0530
Message-Id: <20220706082411.1664825-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme.decode      |  9 ++++++
 target/arm/sme_helper.c    | 63 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 32 +++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 753e9e624c..f50d0fe1d6 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -120,3 +120,8 @@ DEF_HELPER_FLAGS_5(sme_addha_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 8cb6c4053c..ba4774d174 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -64,3 +64,12 @@ ADDHA_s         11000000 10 01000 0 ... ... ..... 000 ..        @adda_32
 ADDVA_s         11000000 10 01000 1 ... ... ..... 000 ..        @adda_32
 ADDHA_d         11000000 11 01000 0 ... ... ..... 00 ...        @adda_64
 ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
+
+### SME Outer Product
+
+&op             zad zn zm pm pn sub:bool
+@op_32          ........ ... zm:5 pm:3 pn:3 zn:5 sub:1 .. zad:2 &op
+@op_64          ........ ... zm:5 pm:3 pn:3 zn:5 sub:1 .  zad:3 &op
+
+FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 10b7c1ad68..78ba34f3d2 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
+#include "fpu/softfloat.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
@@ -918,3 +919,65 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
         }
     }
 }
+
+void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 31;
+    uint16_t *pn = vpn, *pm = vpm;
+    float_status fpst = *(float_status *)vst;
+
+    set_default_nan_mode(true, &fpst);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            if (pa & 1) {
+                void *vza_row = vza + tile_vslice_offset(row);
+                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
+
+                for (col = 0; col < oprsz; ) {
+                    uint16_t pb = pm[H2(col >> 4)];
+                    do {
+                        if (pb & 1) {
+                            uint32_t *a = vza_row + col;
+                            uint32_t *m = vzm + col;
+                            *a = float32_muladd(n, *m, *a, 0, vst);
+                        }
+                        col += 4;
+                        pb >>= 4;
+                    } while (col & 15);
+                }
+            }
+            row += 4;
+            pa >>= 4;
+        } while (row & 15);
+    }
+}
+
+void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint64_t neg = (uint64_t)simd_data(desc) << 63;
+    uint64_t *za = vza, *zn = vzn, *zm = vzm;
+    uint8_t *pn = vpn, *pm = vpm;
+    float_status fpst = *(float_status *)vst;
+
+    set_default_nan_mode(true, &fpst);
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            uint64_t *za_row = &za[tile_vslice_index(row)];
+            uint64_t n = zn[row] ^ neg;
+
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    uint64_t *a = &za_row[col];
+                    *a = float64_muladd(n, zm[col], *a, 0, &fpst);
+                }
+            }
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index d3b9cdd5c4..fa8f343a7d 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -298,3 +298,35 @@ TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
 TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
+
+static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
+                            gen_helper_gvec_5_ptr *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, a->sub);
+    TCGv_ptr za, zn, zm, pn, pm, fpst;
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
+    fpst = fpstatus_ptr(FPST_FPCR);
+
+    fn(za, zn, zm, pn, pm, fpst, tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(za);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pn);
+    tcg_temp_free_ptr(pm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
+TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
-- 
2.34.1


