Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47D38F7F0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:09:53 +0200 (CEST)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMW0-0007tu-DC
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb8-0006MN-N3
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLax-0005tt-Km
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:06 -0400
Received: by mail-pg1-x52a.google.com with SMTP id m190so21418710pga.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YyP6MM/F+rXrYTyaSgrJ+8NstjNzUT49MS/gVveZWao=;
 b=VNf+F/nkWyGQkza1s0tTQAq57YbPDC9kbKdYnjXQOHn4CqHLTjBTValDZ7CQu/7Gn8
 D1f5yhLUWbGsPR+DkKVxe0DbsLj00hd7IZKutqRa3yCXAbca01bApTrweZkZIYHWYoJa
 lB6SPWpjrSDWrY5E3cPkC+hXGkitQaq9Xp86YNBTeSgKMQ5PgiyOVFNaNjfpCK9FvzEI
 q0TIpibQJeZXOy1eRzvae/g/MXIIGwYYEuDB7+R4IeJtEzm5cjACyteaVAGlvFEWQPv0
 8dXzU2dwI3atiT6BlPA/fO8j7v1Frcn8V+Zgpej9p3lE+n8UoXwFIv1pg115i26rPG1I
 Qi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YyP6MM/F+rXrYTyaSgrJ+8NstjNzUT49MS/gVveZWao=;
 b=m8UIOnAA3qOR5lUudOD6s9x1JexPwsd+K617HKETh2mjDARRA0z+G+dq6+MAHDc2+2
 m+NMLIDxw8Pm+agpt8YocQZVto/5AhM6Ppn22RSD2RSIznNezmntaVARhOlevJxRMVPc
 auochLtdifayhNaE2s0ZXV1tbSrrrT50BG8ucpHdW3GlW9KafbJovB9OPIACVl54X9kf
 P3uvB+yVAyuUw+wqvHL/Ea5Vgd05YWY1ug3k86cQ9FrKw3xL0EIOMDgEesOP+Qg0fAo4
 AtWD+sabH7VV70HAtg0d8poRqtVwRn4Q7gVlDD+VFTkjXAxt6crw2AIK6tafZgYgYGBT
 oAxQ==
X-Gm-Message-State: AOAM533DeufE+UwGoxZWglkpRuTBBiIfR6QpR9VS2nYC95GyVBUqgMdp
 FsNmkuzPy5q39ZyOoqSSntWQyvEPfDhbig==
X-Google-Smtp-Source: ABdhPJybn7GjygMhSlsZQSaRncL6ytxLp7/hd3fOzCEOvtJnwYH5oCYMr7cZ2UNWqd3rn16tHePmqg==
X-Received: by 2002:a63:5126:: with SMTP id f38mr3181875pgb.402.1621905053791; 
 Mon, 24 May 2021 18:10:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 87/92] target/arm: Split out do_neon_ddda
Date: Mon, 24 May 2021 18:03:53 -0700
Message-Id: <20210525010358.152808-88-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Split out a helper that can handle the 4-register
format for helpers shared with SVE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c | 90 ++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 52 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 9f7a88aab1..dfa33912ab 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -151,6 +151,36 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
     }
 }
 
+static bool do_neon_ddda(DisasContext *s, int q, int vd, int vn, int vm,
+                         int data, gen_helper_gvec_4 *fn_gvec)
+{
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (((vd | vn | vm) & 0x10) && !dc_isar_feature(aa32_simd_r32, s)) {
+        return false;
+    }
+
+    /*
+     * UNDEF accesses to odd registers for each bit of Q.
+     * Q will be 0b111 for all Q-reg instructions, otherwise
+     * when we have mixed Q- and D-reg inputs.
+     */
+    if (((vd & 1) * 4 | (vn & 1) * 2 | (vm & 1)) & q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    int opr_sz = q ? 16 : 8;
+    tcg_gen_gvec_4_ool(vfp_reg_offset(1, vd),
+                       vfp_reg_offset(1, vn),
+                       vfp_reg_offset(1, vm),
+                       vfp_reg_offset(1, vd),
+                       opr_sz, opr_sz, data, fn_gvec);
+    return true;
+}
+
 static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
                               int data, ARMFPStatusFlavour fp_flavour,
                               gen_helper_gvec_4_ptr *fn_gvec_ptr)
@@ -241,35 +271,13 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 
 static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 {
-    int opr_sz;
-    gen_helper_gvec_4 *fn_gvec;
-
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vn | a->vm | a->vd) & a->q) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    opr_sz = (1 + a->q) * 8;
-    fn_gvec = a->u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
-    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       opr_sz, opr_sz, 0, fn_gvec);
-    return true;
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        a->u
+                        ? gen_helper_gvec_udot_b
+                        : gen_helper_gvec_sdot_b);
 }
 
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
@@ -323,35 +331,13 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
-    gen_helper_gvec_4 *fn_gvec;
-    int opr_sz;
-
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vd | a->vn) & a->q) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
-    opr_sz = (1 + a->q) * 8;
-    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       opr_sz, opr_sz, a->index, fn_gvec);
-    return true;
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        a->u
+                        ? gen_helper_gvec_udot_idx_b
+                        : gen_helper_gvec_sdot_idx_b);
 }
 
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
-- 
2.25.1


