Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E29A39A5B3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:27:38 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqC1-0006ZN-Ah
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkp-0000gt-4J
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkn-00075n-0P
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id g204so3705288wmf.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eUx6yMvYeVEyQOg6iQGEWlrRdiPFSRwrc8Kv/X8CupI=;
 b=Zjjt4sINv+TCixbKtCQL01ocmRAZ+OVRXaQVsjgchVOJlVMQChtjs47SlTSMlcwIQ8
 EHHr9KW89VzaqvzLt+ZoxJt0ui6qGFS2yVrNOOUf3xRtN58Mhr5MPFSqkkjRug5/ROzM
 G/jGKZhL96sWP4hWherF9alZl+I96kFSHqZE2csEBnJv5T1gAWLl2RaGwqTLzrxqcoEy
 xHHxs2VQ4WABZEzfzFkOJRzu9jdD9jODzoXct1Jc0l7SMFWUVyLn37Jj0QfwAJr+MPMh
 LUh1H4JVdfc0FnEWbefz6QnPCDbvP41Hua8UN8DH/Kcomdc1zpQc23nsQhGjKXCVvhB0
 RB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUx6yMvYeVEyQOg6iQGEWlrRdiPFSRwrc8Kv/X8CupI=;
 b=lH1MUBxIQbcQ83YBqBy3m0hMnUh0/d3/bZ7HtZhq69PV0U+6OJKHeWTPFvBKfQaIAz
 P0iaRME2gvEsPMPgt3V4nJf9e7RmshBZ37qk6tDA16Js/AbB6nZrVti886cExThfUDzv
 S/oH/y5HlASjhbnyEwEUjhtvXRFQduwqKw1hc2LkKiQDmeVyn/f+rE7l7f5hhLLTvf6E
 RS09a56h7KZDJan8OtebyKc6LasKg681lPJQg+VTyhfMXRLxvGdcdS9j+E+0yqaONYOu
 B5vG5f7rlT2ydvjEW0UFQJdAPiZtg60J1Z9bOWiC8NqJNK2VE5/DbXGDVD7Fl4F+0Sj3
 os6A==
X-Gm-Message-State: AOAM533NWLPmQ9NUStU5F4n5CyJvqkaqlwPINMDjss/2tyeeP5QGmw8B
 fVSakdAHQ82qnVEntWbDevxZ299US7DCW1Ni
X-Google-Smtp-Source: ABdhPJy7iXnZNi3/d8JXwn7UN0RoP/toymAVYeZn7EqI+vZRL+nL1Eca+UaL3pMUgCKreRzOJXuCmg==
X-Received: by 2002:a1c:9a84:: with SMTP id
 c126mr37435372wme.160.1622735967628; 
 Thu, 03 Jun 2021 08:59:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/45] target/arm: Implement bfloat widening fma (vector)
Date: Thu,  3 Jun 2021 16:58:43 +0100
Message-Id: <20210603155904.26021-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
and VFMA{B,T}.BF16 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index af75d7f25f2..36b3c9dd2d0 100644
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
index 4e0a25d27c1..b61addd98b7 100644
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
index 6c17898deed..5281164eeae 100644
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
index 9ce2f5a7d43..8dcb15ac0f7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12242,9 +12242,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -12338,11 +12339,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
index 9d227a1e13d..4d0c2494dc5 100644
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
index 4f575dc3343..ba8f5d7b7db 100644
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
index 27e9bdd3299..d82736b5e66 100644
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
2.20.1


