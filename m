Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E26390CB3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:04:48 +0200 (CEST)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg6R-0006kd-3O
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0V-0002o6-BH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:39 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0G-0004q5-WA
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:38 -0400
Received: by mail-pf1-x431.google.com with SMTP id d16so24759178pfn.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=trxPjj9YPWlGNS1qfuLuCmIlNFTHPX2pZLXqEV/0snQ=;
 b=WTT+UX3M5diBDbGx+YVKzndhZeIfu/PFjasvW0eLDIBfq6hjIZEvS8wOGrAoSaulmK
 OINax1E8dGPr3tlrkiB0TW+qSNYeLv7gET3xtUujI/nn3GaD1Y+315WZ5zxyacRh3fH7
 10kYWux1qYXFDMMMlMx0gwh3q3f5u015VpMnVc5qMDOQJoFKkCbAVbOjHwCZgVWr9IDn
 JthZ3RA65PZuG9HZihHiJJEIWA+u9I6ZpYrhuVggoASbxriPb9EMmywbfW6XiLNJHVCF
 OpBXntOWSDqyPRO9tDvOfiqyZBm2AB5zQQvNDjYqhl0k0h5EsX92AL5jKQ9Wu4CIchTk
 uF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=trxPjj9YPWlGNS1qfuLuCmIlNFTHPX2pZLXqEV/0snQ=;
 b=BEvjbJIpu/UAW3U7Dn0EInDedI+NokEgj94QVekGU2eq+5+JbWGkbjgMNaJ48KdtNA
 hGZ5VcMjdgO8wpyowABC/lmCu9OzDZO0LDy1suZQLVVbTOe9YCsOihRKATGagvnu+3BJ
 iPXJCcB9z3088ZihJtYD8iU1AzKFlpRCJ/hkRydsP/t8MEyADgstBzOHjLmDEaXIsgpf
 LhkODRt/KCpyZcLtnPJOFgDGqKav22V4iB5LRzVnHohpSzkbsL1uuVfGSbenVmuff2U/
 0HSEynFv2pMKtdI94Kpv/zeaaU86ZD7OmwAA5trzdWfYJAKVWVDdmxLZ/q2YrtUgb1IU
 S0+Q==
X-Gm-Message-State: AOAM532OlomPuHet2HX4kl13rjVG6cHy/Ab9pCrf3/BCFPTC8OPMsKwP
 XmWLBpJQ3pSVDgb5y9Lmp6Umsc675aj8Kg==
X-Google-Smtp-Source: ABdhPJys0E2b7EcJQmatssCHAyugbdErB/wXi019aTbO+DVeqR8fuRZsVpDhSbj1ccvvpAFyCznGTg==
X-Received: by 2002:a62:d409:0:b029:27d:338:1cca with SMTP id
 a9-20020a62d4090000b029027d03381ccamr32271285pfh.25.1621983503628; 
 Tue, 25 May 2021 15:58:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] target/arm: Implement bfloat16 matrix multiply
 accumulate
Date: Tue, 25 May 2021 15:58:13 -0700
Message-Id: <20210525225817.400336-9-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is BFMMLA for both AArch64 AdvSIMD and SVE,
and VMMLA.BF16 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h           |  3 +++
 target/arm/neon-shared.decode |  2 ++
 target/arm/sve.decode         |  6 +++--
 target/arm/translate-a64.c    | 10 +++++++++
 target/arm/translate-neon.c   |  9 ++++++++
 target/arm/translate-sve.c    | 12 ++++++++++
 target/arm/vec_helper.c       | 42 ++++++++++++++++++++++++++++++++++-
 7 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 376c1cef0f..af75d7f25f 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1007,6 +1007,9 @@ DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_bfdot_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_bfmmla, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index fa3cf14e3a..4e0a25d27c 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -67,6 +67,8 @@ VUMMLA         1111 1100 0.10 .... .... 1100 .1.1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 VUSMMLA        1111 1100 1.10 .... .... 1100 .1.0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VMMLA_b16      1111 1100 0.00 .... .... 1100 .1.0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp size=1
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 51f87e8937..6c17898dee 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1568,8 +1568,10 @@ SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 
 ### SVE2 floating point matrix multiply accumulate
-
-FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
+{
+  BFMMLA        01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
+  FMMLA         01100100 .. 1 ..... 111 001 ..... .....  @rda_rn_rm
+}
 
 ### SVE2 Memory Gather Load Group
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1df931cef5..9f8dae90ba 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12228,6 +12228,13 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_fcma, s);
         break;
+    case 0x1d: /* BFMMLA */
+        if (size != MO_16 || !is_q) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = dc_isar_feature(aa64_bf16, s);
+        break;
     case 0x1f: /* BFDOT */
         switch (size) {
         case 1:
@@ -12321,6 +12328,9 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0xd: /* BFMMLA */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfmmla);
+        return;
     case 0xf: /* BFDOT */
         switch (size) {
         case 1:
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 8099767792..9d227a1e13 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -4126,3 +4126,12 @@ static bool trans_VUSMMLA(DisasContext *s, arg_VUSMMLA *a)
     return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
                         gen_helper_gvec_usmmla_b);
 }
+
+static bool trans_VMMLA_b16(DisasContext *s, arg_VMMLA_b16 *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_bfmmla);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6f02030635..4f575dc334 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8677,3 +8677,15 @@ static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
     }
     return true;
 }
+
+static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfmmla,
+                          a->rd, a->rn, a->rm, a->ra, 0);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 74a497f38c..27e9bdd329 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2385,7 +2385,7 @@ static void do_mmla_b(void *vd, void *vn, void *vm, void *va, uint32_t desc,
          * Process the entire segment at once, writing back the
          * results only after we've consumed all of the inputs.
          *
-         * Key to indicies by column:
+         * Key to indices by column:
          *          i   j                  i             j
          */
         sum0 = a[H4(0 + 0)];
@@ -2472,3 +2472,43 @@ void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t s, opr_sz = simd_oprsz(desc);
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    for (s = 0; s < opr_sz / 4; s += 4) {
+        float32 sum00, sum01, sum10, sum11;
+
+        /*
+         * Process the entire segment at once, writing back the
+         * results only after we've consumed all of the inputs.
+         *
+         * Key to indicies by column:
+         *               i   j           i   k             j   k
+         */
+        sum00 = a[s + H4(0 + 0)];
+        sum00 = bfdotadd(sum00, n[s + H4(0 + 0)], m[s + H4(0 + 0)]);
+        sum00 = bfdotadd(sum00, n[s + H4(0 + 1)], m[s + H4(0 + 1)]);
+
+        sum01 = a[s + H4(0 + 1)];
+        sum01 = bfdotadd(sum01, n[s + H4(0 + 0)], m[s + H4(2 + 0)]);
+        sum01 = bfdotadd(sum01, n[s + H4(0 + 1)], m[s + H4(2 + 1)]);
+
+        sum10 = a[s + H4(2 + 0)];
+        sum10 = bfdotadd(sum10, n[s + H4(2 + 0)], m[s + H4(0 + 0)]);
+        sum10 = bfdotadd(sum10, n[s + H4(2 + 1)], m[s + H4(0 + 1)]);
+
+        sum11 = a[s + H4(2 + 1)];
+        sum11 = bfdotadd(sum11, n[s + H4(2 + 0)], m[s + H4(2 + 0)]);
+        sum11 = bfdotadd(sum11, n[s + H4(2 + 1)], m[s + H4(2 + 1)]);
+
+        d[s + H4(0 + 0)] = sum00;
+        d[s + H4(0 + 1)] = sum01;
+        d[s + H4(2 + 0)] = sum10;
+        d[s + H4(2 + 1)] = sum11;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.25.1


