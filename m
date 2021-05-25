Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C046C3905E6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:53:15 +0200 (CEST)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZMo-00066x-MG
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbz-0004Px-Ri
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbr-0004nz-1A
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id z17so32610506wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3hHFLXOhwo1SHuJN2fDwiLLAgANSUIwXyV+DSoEl2jQ=;
 b=TfsCqlJuuS/p+z81g++uD6vGan5Ee0++kLOjtXmz6X0GR4xT28yoOH7wc4GCXD7t5j
 Z1QOi1R6thSGGdVqb2erH0k/uZSHVI/StNCuDy3Tpyz+C6zxYtSMM9PEL2yK3e992O6k
 FZseIERG2+87OCAsU8K4IKzYKePi2ZI4y9A8Wptl/nmMadDvVAdAFetIZ5qZrWgRJiZS
 7xN356ErtcYmEqJoveRiWnkFskVpcSNbsDGY87OhjN37mIFsTzbQnU3eeidoGHiSyLTH
 WLDF8eUIvaIN5bRc7JwMRy9gm8179rSJRBHHoeZmqSJHz7M7ZqMsIv9YdA9NSoaH5R9b
 wCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hHFLXOhwo1SHuJN2fDwiLLAgANSUIwXyV+DSoEl2jQ=;
 b=fF6Y1VcQFrogBQzuhSGDGYBGghOV/BooWAMxlcUTfs8JlADLs1YBN/FrryDaiX7mrO
 9eLW5GuoHBmVJUdcquZYHhGzyg28T8Adqy6keCcyYOQ/HTxy5dM2QaVzUtGx8fqRfVEa
 IIJ3LuidzPwanFtUV+YRBlA8S7dyusLoa+fKiC0UEX7BiQ+EEIzCa8EZWX/37wg9sY67
 h4Qv3kS7ra4XZTciBQKjTVNUeLpgTBQelunSMtg0snQG3RZQL0Rt4h4+jeeClr22uf+z
 T4cyRNvt75K2CLdEA59/EW0BrP/WyCDnbcyj34hVkBxN/KyDOeqD3mkIBZMsA3FR6tJK
 QLwQ==
X-Gm-Message-State: AOAM531mbMEXDPBmEtsDPhi79yfUjLE/V0weYoVSULTbSjep+ODihubx
 I/C07ULSNYoeQ0nsa1XcJ+wCVVp9HSQKKeSD
X-Google-Smtp-Source: ABdhPJziIwvE/0lSGsryUKry/BPOQZxk+sBBq5fipOJ2NrAK3UDCP4jG8wJ//w0bVeRMr8fUiJrD9w==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr28035310wrn.337.1621955081676; 
 Tue, 25 May 2021 08:04:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 078/114] target/arm: Implement SVE2 saturating multiply-add
 (indexed)
Date: Tue, 25 May 2021 16:02:48 +0100
Message-Id: <20210525150324.32370-79-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-57-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  9 +++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index fe67574741f..08398800bd7 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2679,3 +2679,12 @@ DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1956d96ad54..8d2709d3cc0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -30,6 +30,8 @@
 %size_23        23:2
 %dtype_23_13    23:2 13:2
 %index3_22_19   22:1 19:2
+%index3_19_11   19:2 11:1
+%index2_20_11   20:1 11:1
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz     22:2 5:5 !function=tszimm_esz
@@ -261,6 +263,12 @@
 @rrxr_1         ........ .. . index:1 rm:4 ...... rn:5 rd:5 \
                 &rrxr_esz ra=%reg_movprfx
 
+# Three registers and a scalar by N-bit index, alternate
+@rrxr_3a        ........ .. ... rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index3_19_11
+@rrxr_2a        ........ .. ..  rm:4 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index2_20_11
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -799,6 +807,16 @@ SQRDMLSH_zzxz_h 01000100 0. 1 ..... 000101 ..... .....   @rrxr_3 esz=1
 SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
 SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
 
+# SVE2 saturating multiply-add (indexed)
+SQDMLALB_zzxw_s 01000100 10 1 ..... 0010.0 ..... .....   @rrxr_3a esz=2
+SQDMLALB_zzxw_d 01000100 11 1 ..... 0010.0 ..... .....   @rrxr_2a esz=3
+SQDMLALT_zzxw_s 01000100 10 1 ..... 0010.1 ..... .....   @rrxr_3a esz=2
+SQDMLALT_zzxw_d 01000100 11 1 ..... 0010.1 ..... .....   @rrxr_2a esz=3
+SQDMLSLB_zzxw_s 01000100 10 1 ..... 0011.0 ..... .....   @rrxr_3a esz=2
+SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
+SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
+SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 11d4a2a7228..b80bd15085b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1535,6 +1535,36 @@ DO_ZZXZ(sve2_sqrdmlsh_idx_d, int64_t,   , DO_SQRDMLSH_D)
 
 #undef DO_ZZXZ
 
+#define DO_ZZXW(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + idx));                          \
+        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
+            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
+            TYPEW aa = *(TYPEW *)(va + HW(i + j));                        \
+            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm, aa);                  \
+        }                                                                 \
+    }                                                                     \
+}
+
+#define DO_SQDMLAL_S(N, M, A)  DO_SQADD_S(A, do_sqdmull_s(N, M))
+#define DO_SQDMLAL_D(N, M, A)  do_sqadd_d(A, do_sqdmull_d(N, M))
+
+DO_ZZXW(sve2_sqdmlal_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLAL_S)
+DO_ZZXW(sve2_sqdmlal_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLAL_D)
+
+#define DO_SQDMLSL_S(N, M, A)  DO_SQSUB_S(A, do_sqdmull_s(N, M))
+#define DO_SQDMLSL_D(N, M, A)  do_sqsub_d(A, do_sqdmull_d(N, M))
+
+DO_ZZXW(sve2_sqdmlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLSL_S)
+DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
+
+#undef DO_ZZXW
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b31a4d1fb24..3e7f310d595 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3905,6 +3905,25 @@ DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
 
 #undef DO_SVE2_RRXR
 
+#define DO_SVE2_RRXR_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)          \
+    {                                                           \
+        return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->rd, \
+                                 (a->index << 1) | TOP, FUNC);  \
+    }
+
+DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
+
+#undef DO_SVE2_RRXR_TB
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.20.1


