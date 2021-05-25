Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0383F390CB4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:04:53 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg6V-00074Y-Vx
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0X-0002uJ-4P
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:41 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0H-0004qF-Mc
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:40 -0400
Received: by mail-pf1-x431.google.com with SMTP id q25so6730369pfn.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MzWGJSozIBbfglC7WTEZiiQbdD24PRiuEVX0rE+xf2I=;
 b=RSAU7bT1myypfKClb1iEVWrdjz4IJmRuO31kSm724tuTi5X4AyIcHC1szuzLFUz4QS
 nRhkdmEqXU6r2S/THqhgK66kNIkv57xCrFSDpjKjHbUeHCrPe7J109W3oJLtfut0GjaU
 OziN3lYx1t1zZ/aTIfao94pu1pJ/C6mGfeGaTotM3YATE/ANH5Wrc61x++paFPyfQb+s
 J4+s+AcIAI+0hW8MOT56vlGgDb0pV4kKBK9coXRUho2PwtTidaPLpnm2buICZ8vU1okZ
 EEeWXLDhY0gbrIvv6dIjp0KSPsYngp5jkjBAEiKWIav3LvxdMhipoSF97sBhG4kJPs3N
 3Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MzWGJSozIBbfglC7WTEZiiQbdD24PRiuEVX0rE+xf2I=;
 b=M7iSAeknBN8lkYGMEq3QibEVMzjUx6d6Yf6SjwcmqA5KVgzXhQD4DNA8/rq+1SEZ3/
 OPV0wOVoSSbXN+W0tXkNkt2wVkTQrVTGacB02C8oxuqLhd0vSntB/0qEcFYDRrbqpb14
 f1uLQwCjuoPhSMn8Nmhg2eN3JeBKUZr5AHGknJIOe2mOD/jJVGqkCG1qqEnbE4yAhDDb
 5P8Kh7WUUYOIOMk8UFVdSz7sXiAZ4in0RN+TIOD1eB0eBFThQ5c028eZSS6Xp/K4R1y2
 Dcb4ZF5ZXAPeOi1jSitb2uIdwEl2qBhJLgakWM2JmY+BB9CGEHlqD7UlIb87cQfPg5jq
 hdfA==
X-Gm-Message-State: AOAM532uzm1hx4CNk040v7ZZuQzp06l2kqpWbsq84lPP/6q68zH2LYkS
 g84c1OIsw4u8SM9iNz1cIft3dN+gImSjZQ==
X-Google-Smtp-Source: ABdhPJzioJ8ydxO543qtpOyAxZZY5JLCt+AbryDv25/zq1cy0mvZPDFqfMQGT2hgIHB1bBxx5OOzBA==
X-Received: by 2002:a62:148e:0:b029:2e4:e5a5:7e33 with SMTP id
 136-20020a62148e0000b02902e4e5a57e33mr24155847pfu.9.1621983504399; 
 Tue, 25 May 2021 15:58:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] target/arm: Implement bfloat widening fma (vector)
Date: Tue, 25 May 2021 15:58:14 -0700
Message-Id: <20210525225817.400336-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
and VFMA{B,T}.BF16 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h           |  3 +++
 target/arm/neon-shared.decode |  3 +++
 target/arm/sve.decode         |  3 +++
 target/arm/translate-a64.c    | 13 +++++++++----
 target/arm/translate-neon.c   |  9 +++++++++
 target/arm/translate-sve.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/vec_helper.c       | 16 ++++++++++++++++
 7 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index af75d7f25f..36b3c9dd2d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1010,6 +1010,9 @@ DEF_HELPER_FLAGS_5(gvec_bfdot_idx, TCG_CALL_NO_RWG,
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
index 6c17898dee..5281164eea 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1627,6 +1627,9 @@ FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
 FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
 FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
 
+BFMLALB_zzzw    01100100 11 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
+
 ### SVE2 floating-point bfloat16 dot-product
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9f8dae90ba..2a99e015ca 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12235,9 +12235,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -12331,11 +12332,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 9d227a1e13..4d0c2494dc 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -4135,3 +4135,12 @@ static bool trans_VMMLA_b16(DisasContext *s, arg_VMMLA_b16 *a)
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4f575dc334..ba8f5d7b7d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8689,3 +8689,33 @@ static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
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
index 27e9bdd329..d82736b5e6 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2512,3 +2512,19 @@ void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
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
-- 
2.25.1


