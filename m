Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D8541B7D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:48:27 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh3p-0000jJ-K0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwq-00070F-G1
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwe-0008Dz-V4
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:07 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso16469132pjg.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVICy9Y6fCRdAU+92OA2KWmzp+fTiCj9J1NJfjmnfMI=;
 b=x7b6obt2+2220WwOtOo2MIQkFth2X3/w6L3TIHptmadFMYSL5aZDCnTtjAlpzr10cM
 gBYydCtGdVMo4X2XZr2bdxH8BiZq/b9QHyK5tYAgGcsK4rz6rsVbsPg4TBOF48NA1H10
 gBWd7mX3BckQpGB7dKfRyCxeMFZCci/wUj2Lz3SVCf8eJMgNRj5obnhUwfSI5J6b2rL8
 MJwmbxzXlBextiub6IOYjdNKWHlo/Yo1e1NHvDImzJlnt17WDY5qJodoDOJhpsVILmkQ
 E95Tq2V8853b8/ygWDyXvmqUCDFuzZ0ek7G5FXqO+7EZ9xntfbdzXpygvJ98T7dFQZO5
 oAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVICy9Y6fCRdAU+92OA2KWmzp+fTiCj9J1NJfjmnfMI=;
 b=0+2TYTUOrxe/WEgbwVkb9j351nXC0O5gqJ4jgEhiW8T5NLxFD9xzpc5co9405bKn3z
 Ve5G17e8jhUWoaSIi70aPoSgCyxrfYLkL/U5+Tl3hN+k1sTRRi611BkIHZXOgujmvLiW
 gVzeD7D4NyL23f3SitDInocf+tlmr2qA5lBRxYLPkpAgGDPcQruo9+JA9cZkUrE5QFzZ
 gTsJYEssyKyJdSz6td4K9t/dWdbtKpjreHy+6tQUP97hnOb0zOFZpCldWgRk5XBPZru9
 qrb4yDRSgIEoBWE8S50R6r/UyW2xfRYvc8y1N3NDEJMHslfImTnolHyrOo05U4zVzee1
 z60w==
X-Gm-Message-State: AOAM530aXcNZwiMcpNUNLcErpzlaOZxlX8FDTrTcD/gK0l30/7ylyib1
 DWD34FOgdHP6GN1j9Kjf09MefvQgPtkO+A==
X-Google-Smtp-Source: ABdhPJweiEPtdpGd0SMhmXe4oeds2197jb+P/AnGeHDuG1aMZ+j4EDuCrkWC78Pogez3d4CLokvs6w==
X-Received: by 2002:a17:902:ab42:b0:165:7d40:fa80 with SMTP id
 ij2-20020a170902ab4200b001657d40fa80mr30861706plb.43.1654634216205; 
 Tue, 07 Jun 2022 13:36:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 52/71] target/arm: Implement FMOPA, FMOPS (widening)
Date: Tue,  7 Jun 2022 13:32:47 -0700
Message-Id: <20220607203306.657998-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/arm/sme_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  2 ++
 target/arm/sme.decode      |  1 +
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
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index afd9c0dffd..e8d27fd8a0 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -75,3 +75,4 @@ FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
-- 
2.34.1


