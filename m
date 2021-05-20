Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74C38B362
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:39:08 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljklP-0005I1-2c
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbQ-0007sQ-Jl
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbN-0000eJ-RG
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j14so16366992wrq.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iTEJUgdnofezBKJEQUNY/AOGiONLkshkAXK+NJ4lu5o=;
 b=rA9L1IWEdQz6kRbbzmoSooSzA92L02WPC9zEgHfrLfaVYd0vQSH60iccARN20e8n+p
 tnb04dfNU9jMPc0cJ3rK4oNKQX6W2+TtU7ZxfsIIbXJ9pmDaEBnDvmX6kxwir1ZKHBfX
 eFZ2PuAfOTA0SINxFfefiCYJvU57w4Ht7jZioaZBF7bcY19rLrvfQGHksxmwKy853o1j
 pKDNnqr8A+5lZOVYz7JkFFgXmRIPXEyMxf+7oaQatDAnUScHCO2e++RsL9kui8hpr6yY
 Yi7AyqYVVKh8JDKWDQIAtTlLQV4tvaHh/WwPD+yI4RVsPOtsEUJ3F1yOGVLCnKqAivi3
 2emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iTEJUgdnofezBKJEQUNY/AOGiONLkshkAXK+NJ4lu5o=;
 b=byAHomcU3aVnun0rz3j8hbunjS6c6JxXw9zTN8/ucxB2XviK8qG1ujPzT9YIDnVJVD
 N9pydXw4UqVvhY8ExGHDvJIGM2hjYEDJMZEgo0bSMyvjoHMzHKGVX6YdBhXYDdSgQ4CU
 BxM7QXaq0p9kO9DmKdF1Sfw9MbVI4YuALxq9gYBh/C/IwlL6rZgYGkmHl4COiCs7PxoS
 +f5sZdpgc4tyN2Nnnkv6eyAD6H7Yb4nXRjlTbls1T1+H/Xc7PcSSBJgidEghuFBuognk
 J9gqnnwJxef6Dw6Uzy9QPF+HfX7sYuY0SQpmiZZFlxvMD3liO5fBsLfGsZEVfObCq+V3
 VQ/g==
X-Gm-Message-State: AOAM530vXTxrPo9ZbK6Sg1bNfsxzZNNQGseBD69Ie592ZABpxgiHcjcn
 rMEDKl2AMhJ8z6klKvbB0hwoqA==
X-Google-Smtp-Source: ABdhPJzAyBsXOiy9eWYpeAO+zzu2krdOv41qgJdxDZ/U5OHsrwTX5MVuVtFVDy5OSV4k2lU0gJxwmA==
X-Received: by 2002:adf:e384:: with SMTP id e4mr4806630wrm.347.1621524524477; 
 Thu, 20 May 2021 08:28:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/9] target/arm: Move fpsp/fpdp isar check into callers of
 do_vfp_2op_sp/dp
Date: Thu, 20 May 2021 16:28:34 +0100
Message-Id: <20210520152840.24453-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The do_vfp_2op_sp() and do_vfp_2op_dp() functions currently check
whether floating point is supported via the aa32_fpdp_v2 and
aa32_fpsp_v2 isar checks.  For v8.1M MVE support, the VMOV_reg trans
functions (but not any of the others) need to update this to also
allow the insn if MVE is implemented.  Move the check out of the do_
function and into its callsites (which are all implemented via the
DO_VFP_2OP macro), so we have a place to change the check for the
VMOV insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 2202f8985d2..89246a284aa 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -1925,9 +1925,7 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
     int veclen = s->vec_len;
     TCGv_i32 f0, fd;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
-        return false;
-    }
+    /* Note that the caller must check the aa32_fpsp_v2 feature. */
 
     if (!dc_isar_feature(aa32_fpshvec, s) &&
         (veclen != 0 || s->vec_stride != 0)) {
@@ -2002,6 +2000,8 @@ static bool do_vfp_2op_hp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
      */
     TCGv_i32 f0;
 
+    /* Note that the caller must check the aa32_fp16_arith feature */
+
     if (!dc_isar_feature(aa32_fp16_arith, s)) {
         return false;
     }
@@ -2030,9 +2030,7 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
     int veclen = s->vec_len;
     TCGv_i64 f0, fd;
 
-    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
-        return false;
-    }
+    /* Note that the caller must check the aa32_fpdp_v2 feature. */
 
     /* UNDEF accesses to D16-D31 if they don't exist */
     if (!dc_isar_feature(aa32_simd_r32, s) && ((vd | vm) & 0x10)) {
@@ -2810,23 +2808,26 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     return true;
 }
 
-#define DO_VFP_2OP(INSN, PREC, FN)                              \
+#define DO_VFP_2OP(INSN, PREC, FN, CHECK)                       \
     static bool trans_##INSN##_##PREC(DisasContext *s,          \
                                       arg_##INSN##_##PREC *a)   \
     {                                                           \
+        if (!dc_isar_feature(CHECK, s)) {                       \
+            return false;                                       \
+        }                                                       \
         return do_vfp_2op_##PREC(s, FN, a->vd, a->vm);          \
     }
 
-DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32)
-DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64)
+DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32, aa32_fpsp_v2)
+DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64, aa32_fpdp_v2)
 
-DO_VFP_2OP(VABS, hp, gen_helper_vfp_absh)
-DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss)
-DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd)
+DO_VFP_2OP(VABS, hp, gen_helper_vfp_absh, aa32_fp16_arith)
+DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss, aa32_fpsp_v2)
+DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd, aa32_fpdp_v2)
 
-DO_VFP_2OP(VNEG, hp, gen_helper_vfp_negh)
-DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs)
-DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd)
+DO_VFP_2OP(VNEG, hp, gen_helper_vfp_negh, aa32_fp16_arith)
+DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs, aa32_fpsp_v2)
+DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd, aa32_fpdp_v2)
 
 static void gen_VSQRT_hp(TCGv_i32 vd, TCGv_i32 vm)
 {
@@ -2843,9 +2844,9 @@ static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
     gen_helper_vfp_sqrtd(vd, vm, cpu_env);
 }
 
-DO_VFP_2OP(VSQRT, hp, gen_VSQRT_hp)
-DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp)
-DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp)
+DO_VFP_2OP(VSQRT, hp, gen_VSQRT_hp, aa32_fp16_arith)
+DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp, aa32_fpsp_v2)
+DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp, aa32_fpdp_v2)
 
 static bool trans_VCMP_hp(DisasContext *s, arg_VCMP_sp *a)
 {
-- 
2.20.1


