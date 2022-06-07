Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBC541A15
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:29:04 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygl5-0004Ep-74
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwj-0006fR-UR
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwd-0008H2-Ts
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n8so15830127plh.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLhEtT1/nTLlSv9LvyTfCAlXFFVthWxXJJJuxXy+WV8=;
 b=QqJGY5QblnLvGjE4peOVpEDriH2n1rj9Hq50h8FlcnoJg4Jtnq9etr2+aaqIDomYVG
 GqcKAGwf6zIv7SsFrOHWAFqtyBnxiyGFVyW6KR7ymxF/MTLMfhymxVAOq/TTk1lm5qgI
 0QvsxCuJu8gcwBVgjBEeJUcqMSVvNo2RCs5xAXXvxVjzK5qpFDrz0nN60BLebn8bBgxh
 CSTKeSnedetLyr1aSN4cXOtufbQUA+vlZwof4enXOlZXx5lxYlNrVXwYUGQuVjaObbbu
 thZ1KUFaIduUZ7omk3E3De10sAf0PvbWOUsc9+0iNMhuy935anqc+Z4AlFRImSJkcwdw
 bBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLhEtT1/nTLlSv9LvyTfCAlXFFVthWxXJJJuxXy+WV8=;
 b=KlgEwqV0FcOfN7L7az5IGSBYl4roFNxjj6NraTPK6WHuyZe2gnrSQyITD6AZoeUxmS
 CTo+e48irNH/4x1Hv8VVR92adoSuih1amYDJEx5ctjXiFFrdtvGz4Rw22UWbR7PvpXeP
 uHB1cjVcEnik+8e4KMOooE5yp3ubbc9CB3z1Ef7WpSeBTpRmMZm0XObUDek9PttUFUlE
 Kw/XmpbA2FRXakTqEatKK+9VyLtmJFD9m/fvgHOvKIAgUrrF7tPAIGgawkXNxyK5oLza
 FdyS9t4h5InIN0YNX3K3oGtMne40e9e19lPlS+20cw8STatf0GFO5h4AzyMN50+0MWQj
 ajIQ==
X-Gm-Message-State: AOAM530ftfwdJKLqt+0qqKP8Iq+Ft+wHW/v/MjcMhMDvQa51KdjYrz99
 cDT8pxJKeCL2qSRER2PeKTSq23L7j0feWQ==
X-Google-Smtp-Source: ABdhPJxPWTsW77MWopvLCxqdqQeaMjyfPJsoqxLbx2TbfNIMPMdjjY3E9K/XMFwKipwqfOVTmqSwXg==
X-Received: by 2002:a17:902:7b8b:b0:168:9498:a0f9 with SMTP id
 w11-20020a1709027b8b00b001689498a0f9mr5631pll.39.1654634214346; 
 Tue, 07 Jun 2022 13:36:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 50/71] target/arm: Implement FMOPA, FMOPS (non-widening)
Date: Tue,  7 Jun 2022 13:32:45 -0700
Message-Id: <20220607203306.657998-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme_helper.c    | 67 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 33 +++++++++++++++++++
 target/arm/sme.decode      |  9 +++++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 6f0fce7e2c..727095a3eb 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -119,3 +119,8 @@ DEF_HELPER_FLAGS_5(sme_addha_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 799e44c047..62d9690cae 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
+#include "fpu/softfloat.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
@@ -897,3 +898,69 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
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
+
+    bool save_dn = get_default_nan_mode(vst);
+    set_default_nan_mode(true, vst);
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
+
+    set_default_nan_mode(save_dn, vst);
+}
+
+void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint64_t neg = (uint64_t)simd_data(desc) << 63;
+    uint64_t *za = vza, *zn = vzn, *zm = vzm;
+    uint8_t *pn = vpn, *pm = vpm;
+
+    bool save_dn = get_default_nan_mode(vst);
+    set_default_nan_mode(true, vst);
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
+            uint64_t n = zn[row] ^ neg;
+
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    uint64_t *a = &za_row[col];
+                    *a = float64_muladd(n, zm[col], *a, 0, vst);
+                }
+            }
+        }
+    }
+
+    set_default_nan_mode(save_dn, vst);
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index e9676b2415..e6e4541e76 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -273,3 +273,36 @@ TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
 TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
+
+static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
+                            gen_helper_gvec_5_ptr *fn)
+{
+    uint32_t desc = simd_desc(s->svl, s->svl, a->sub);
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
+TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst,
+           a, MO_32, gen_helper_sme_fmopa_s)
+TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
+           a, MO_64, gen_helper_sme_fmopa_d)
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
-- 
2.34.1


