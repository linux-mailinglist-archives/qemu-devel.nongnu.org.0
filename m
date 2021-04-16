Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E203D362C40
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:08:00 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYVE-0007ww-05
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYND-0005T0-Iw
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:43 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYNA-0005hC-FN
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:43 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h11so1712876pfn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lVASvtsBblbStSZNmfD5xxhqdPNt/cEmCqHJFLMXkbU=;
 b=kT0LB1G54jAa8Yn10rPBR9qz5Mb6gGVMh08NZg5ypwrvmDZA7WV2SUBkJWc1HaZoU1
 WBSuv/AuqgZs75/PldwqNqqGELDI+wSVI87buQsY7W5a35lJgNaO5RJ3S0FY86sgGnS2
 koHVDVvgbfnhdaGquecpbfhMu+Wh0Np8pxqnU4UmwzSatK1j0Cx45VA+ClAWP7Mi+bWM
 tTDK0U7j7m5IQFxLR8NcA4DG6TThF1CAf42dghfV7jh4jCsyTt7p6LrJ3XqU+5OWyh75
 SCXy7xcWj5tY8a95GEKPdCIyYjKOcAY6S/OJ623l25h74f6jbBJPdkbSPITQw0cpC1AD
 PF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVASvtsBblbStSZNmfD5xxhqdPNt/cEmCqHJFLMXkbU=;
 b=r58ws/6qsdDSkL1LQDlaHkK8muDzS+kfDWEIWZ1DU8nyxKlpKKGfa94h+0pEQmxwZ5
 qs0lWTRTAuMsrAi+lIj3nWEfv5Ks7cgNl2ApjYWSS7At6Hik9H5vuusLA+psSLJqr3hI
 sLELjsmMCZxdixsWfSOpOoIa4HZesDWP7tGUSspzzCHWCyA3DfMYI5POH2uuL7a/hkPj
 Iix75udJPRzICvAiyuy9smO4gtDJ+C3tIcwUxCK5xre0D/eNSF3FmjPoxlVAl/LWT9GF
 7U3LPbPHX4+aBGmpVdvy2YNRxNNOmdri7MzX+X/EFsyD9vM6awvBz7oc/dGt0QvYjksc
 swGw==
X-Gm-Message-State: AOAM530DCrdADsriWSLS2Iq0eKI87payjR3KtZgcyNwfUx1GD1Jm38aG
 ylu/dtZbxczDcECwui3rzPAsZErHi0u0iw==
X-Google-Smtp-Source: ABdhPJw5m/6dVrdloBHVCZJfYBv1nPjmsiHgIQ1hEde2vzWLmkdhGv7LSz1NtmHkxYkytJf6n5gkNg==
X-Received: by 2002:a63:1347:: with SMTP id 7mr1269321pgt.112.1618617579236;
 Fri, 16 Apr 2021 16:59:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/11] target/arm: Implement bfloat widening fma (vector)
Date: Fri, 16 Apr 2021 16:59:26 -0700
Message-Id: <20210416235928.1631788-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
and VFMA{B,T}.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  3 +++
 target/arm/neon-shared.decode   |  3 +++
 target/arm/sve.decode           |  3 +++
 target/arm/translate-a64.c      | 13 +++++++++----
 target/arm/translate-sve.c      | 30 ++++++++++++++++++++++++++++++
 target/arm/vec_helper.c         | 16 ++++++++++++++++
 target/arm/translate-neon.c.inc |  9 +++++++++
 7 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 74f8bc766f..2c6f0cecfa 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1011,6 +1011,9 @@ DEF_HELPER_FLAGS_5(gvec_bfdot_idx, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_bfmmla, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 4e0a25d27c..b61addd98b 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -70,6 +70,9 @@ VUSMMLA        1111 1100 1.10 .... .... 1100 .1.0 .... \
 VMMLA_b16      1111 1100 0.00 .... .... 1100 .1.0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+VFMA_b16       1111 110 0 0.11 .... .... 1000 . q:1 . 1 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
 VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp size=1
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index aa8d5e4b8f..322bef24cf 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1578,6 +1578,9 @@ FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
 FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
 FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
 
+BFMLALB_zzzw    01100100 11 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
+
 ### SVE2 floating-point bfloat16 dot-product
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8636eac4a8..74794e3da3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12250,9 +12250,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_bf16, s);
         break;
-    case 0x1f: /* BFDOT */
+    case 0x1f:
         switch (size) {
-        case 1:
+        case 1: /* BFDOT */
+        case 3: /* BFMLAL{B,T} */
             feature = dc_isar_feature(aa64_bf16, s);
             break;
         default:
@@ -12346,11 +12347,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     case 0xd: /* BFMMLA */
         gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfmmla);
         return;
-    case 0xf: /* BFDOT */
+    case 0xf:
         switch (size) {
-        case 1:
+        case 1: /* BFDOT */
             gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
             break;
+        case 3: /* BFMLAL{B,T} */
+            gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, false, is_q,
+                              gen_helper_gvec_bfmlal);
+            break;
         default:
             g_assert_not_reached();
         }
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9ade521705..3af980caba 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8622,3 +8622,33 @@ static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
     }
     return true;
 }
+
+static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
+        unsigned vsz = vec_full_reg_size(s);
+
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           status, vsz, vsz, sel,
+                           gen_helper_gvec_bfmlal);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool trans_BFMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_BFMLAL_zzzw(s, a, false);
+}
+
+static bool trans_BFMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_BFMLAL_zzzw(s, a, true);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 623a0872f3..646a364c94 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2755,3 +2755,19 @@ void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_bfmlal)(void *vd, void *vn, void *vm, void *va,
+                         void *stat, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    intptr_t sel = simd_data(desc);
+    float32 *d = vd, *a = va;
+    bfloat16 *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        float32 nn = n[H2(i * 2 + sel)] << 16;
+        float32 mm = m[H2(i * 2 + sel)] << 16;
+        d[H4(i)] = float32_muladd(nn, mm, a[H4(i)], 0, stat);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 7ce65f691f..dd710c8450 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -4126,3 +4126,12 @@ static bool trans_VMMLA_b16(DisasContext *s, arg_VMMLA_b16 *a)
     return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
                         gen_helper_gvec_bfmmla);
 }
+
+static bool trans_VFMA_b16(DisasContext *s, arg_VFMA_b16 *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda_fpst(s, 7, a->vd, a->vn, a->vm, a->q, FPST_STD,
+                             gen_helper_gvec_bfmlal);
+}
-- 
2.25.1


