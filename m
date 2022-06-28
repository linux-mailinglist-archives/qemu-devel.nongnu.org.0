Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072655BE3E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:47:59 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o638o-0004PK-Bu
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k3-0002Ai-St
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:24 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k0-0003j6-K1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:23 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so11396492pjj.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29LaXGSIeD+aStIVxrUAaIR2rcKJR4yKHHPoRSoH0b4=;
 b=IsfDwIgFcusawBoVInqTSw1ID8KxgqSdjPqEdOqv5Z2R46wV8MEruo+rlSVp51XeP4
 wVsezjWpcIkrG/7njrS1YvfovI/q0KSeZz9fvIvp4Fak3MO5XxiYsQ/b5ZncVoAIxOr6
 u4kzwyyR9qRPmpUnGJDuxDu04GB4STxI8bztHL/nkmv8YrQVKaG9YeHkN7Ve7T1QvKiL
 BZ4paLNisvdoW0052vSBBxu50xpPN6HsG0io0GiDlpuSHNvglShLwi6H+YtUGalNF2Ya
 qYTX1VzdvPXE1aWzQlgM+UW19pAUT0vglnElGduf10FQ6CxGDWg2Ef+ES7J+7u0czwuw
 XILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29LaXGSIeD+aStIVxrUAaIR2rcKJR4yKHHPoRSoH0b4=;
 b=VqraRpdtu7NwVElEXiYTzhFW9WAa8Y/PsGiUkoDdB02kvE5fwEoEZ+ow5tgnKMVwYv
 fc2ykmVkx/bhB3Ru9A5YZiBx2vhLj08SqJqxID1Rnm+CDGTkG0FU6GMqpkzVKVYK07BT
 WA4weIzIco9ub2sG2ehN6Tdwu46t7jTN2ElTwCPeOv4zYA5dsFNJtYrbjtf/mvc3MR4T
 lXHMn8f6KZQFmy3LWr0bACZWC/72YWuwdwQGuhRaghSRf//rcl1DbhxMdJP6SkffED9j
 DUQOeRgc6/E4nLiPFUtGRc8cOZL+PGYgVdYDi5YWY1mXGLXBwJscOAMsuy9UQEMCLl1m
 +1tQ==
X-Gm-Message-State: AJIora9dZeFroYuPqE0RRvYkYV7OubQSCxxXzJj1/VkeB00nigS2UzZf
 stDY0TEp0HV+dzm0Uz19MY9zw7a1MnxSag==
X-Google-Smtp-Source: AGRyM1sDembIqkpyHqcGNWRJk242pbc1tH/74qBLrG9FdEfApyBpGM9iw3koxbAnsRqlOgfGznoTsw==
X-Received: by 2002:a17:903:2345:b0:16a:28ac:1c1b with SMTP id
 c5-20020a170903234500b0016a28ac1c1bmr3029705plh.106.1656390139422; 
 Mon, 27 Jun 2022 21:22:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 24/45] target/arm: Implement FMOPA, FMOPS (non-widening)
Date: Tue, 28 Jun 2022 09:50:56 +0530
Message-Id: <20220628042117.368549-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
index 61fe9e9dc8..31c53ad896 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
+#include "fpu/softfloat.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
@@ -898,3 +899,65 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
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
+                void *vza_row = vza + row * sizeof(ARMVectorReg);
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
+            uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
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
index 12995d6a46..1117a61f62 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -301,3 +301,35 @@ TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
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


