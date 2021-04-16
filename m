Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE15362C38
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:03:47 +0200 (CEST)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYR8-0002kw-I7
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYNB-0005Oi-QT
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:47083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN9-0005gf-GZ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d124so19326398pfa.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDatyCKaDyEgD6dcplvCszLIvtluHr0ddoiz3pRDaeI=;
 b=e9uMr929Ijw6nUD/6sXwVV/XkuysLac2/IvDdluzx8zvRmc6neFqdU5pSX3eAHbPf6
 6wKN1RJ4Ci52vui8ls+NuIaXKmstCucsr24O2yl7tBzpSPNV8OjYTpG9461F31VmaBu3
 tAcKLITSzIvnbjys6/QC/pYsTtgp3fEeBzNxxiY9cszNo8Z6uB9u6bXTw9BdisRQbXii
 cSL1hagV2bfReq3UGI0SaIvK3kHnUiikladAl44lxrd7IdjPwkziYbROtF+8M8CbX63/
 EIkSxzMy1FTwz4PysPtff5Ba1DUp75SoOY7utpIdh35icJ9nGRYkpsETSah3woxdMUL1
 CsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fDatyCKaDyEgD6dcplvCszLIvtluHr0ddoiz3pRDaeI=;
 b=lXKetHFJeX6seqc7vfRsVCaclLa5oFwUzzDsHnjyEfkccUO/rv6MbJO4KcDF7SgA1r
 htVWmm0k6kmKW+oWWpZUHO30wUgnVZO5UchfFR5bF/Wh/kXPiZZcwmPNb+Tf3qucqrSv
 l1nuFA+VuM3azF5w9wCGRDh0kOVveAkKPurw+BjT2pQ+jIeMYNhKejAsXvE1OKWqjJAs
 VLLkyxA4pH2pnaKeJChjTwXg41+YSB1fH/Wwe9xA37l1CClXpwKG5Eri3PhZZyXnQjwh
 u9yOlTU29H+v/D8voBBqIxpRvrgAZGB1VBgTMytRhwF9roY1kR9sulTaWBla7w1BUXN+
 u2yA==
X-Gm-Message-State: AOAM533BEDySwDyGup0ESkd2np+NjnC5tFo1OIG6R6IBj/QSUeNFYi8x
 A7fgCowNWlR8verEy+PBkhsJB1k+OvlQPg==
X-Google-Smtp-Source: ABdhPJzmoZcU6rB5QRle/0B2W00FdYjIUEc9yiGvDIwBsQ6XwPELGp9vufmSz6FTZ7pMtKZd4YJEHw==
X-Received: by 2002:a62:824c:0:b029:21b:66f5:c813 with SMTP id
 w73-20020a62824c0000b029021b66f5c813mr9601350pfd.32.1618617578223; 
 Fri, 16 Apr 2021 16:59:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/11] target/arm: Implement bfloat16 matrix multiply
 accumulate
Date: Fri, 16 Apr 2021 16:59:25 -0700
Message-Id: <20210416235928.1631788-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

This is BFMMLA for both AArch64 AdvSIMD and SVE,
and VMMLA.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  3 +++
 target/arm/neon-shared.decode   |  2 ++
 target/arm/sve.decode           |  6 +++--
 target/arm/translate-a64.c      | 10 +++++++++
 target/arm/translate-sve.c      | 12 ++++++++++
 target/arm/vec_helper.c         | 40 +++++++++++++++++++++++++++++++++
 target/arm/translate-neon.c.inc |  9 ++++++++
 7 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index af0ee8f693..74f8bc766f 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1008,6 +1008,9 @@ DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
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
index d5e1e5d400..aa8d5e4b8f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1519,8 +1519,10 @@ SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
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
index f60afbbd06..8636eac4a8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12243,6 +12243,13 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -12336,6 +12343,9 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0xd: /* BFMMLA */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfmmla);
+        return;
     case 0xf: /* BFDOT */
         switch (size) {
         case 1:
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ef6828c632..9ade521705 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8610,3 +8610,15 @@ static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
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
index 3e26fb0e5f..623a0872f3 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2715,3 +2715,43 @@ void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
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
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index bb0adf4756..7ce65f691f 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -4117,3 +4117,12 @@ static bool trans_VUSMMLA(DisasContext *s, arg_VUSMMLA *a)
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
-- 
2.25.1


