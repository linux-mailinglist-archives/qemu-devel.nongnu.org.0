Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A232AD4D0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:23:16 +0100 (CET)
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRk3-0005a8-2K
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgT-00022L-7V
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:33 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgR-0006pj-Ab
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:32 -0500
Received: by mail-wr1-x433.google.com with SMTP id p8so11438762wrx.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QJd5XkxKLkkgZry9ph7vylC1lYNWAIO4g+OAGMmxr1U=;
 b=EzbBqCRRw3PlsXXoedZ6ZxzXW0IUTH1NS24sSSwZFr7+Fq/Ket7TDfbVizZrOuzCMe
 CjhJ5c7VFfeRJMddZpDJuCeCU0ijCg42lA28oacFo7CKnbL3TOKRa+1zddz5CBqQPp+C
 45C0ip9i6+uW+BulrPr1+5Kc7GSxpNMHxG5202epACJyw37oV9GJCjmStlRnsYMZI9t1
 mOWbSdx3v0MivMSUyzlXlco4Z5rXZbRthIyp6yw7fxxSj3I3Rc/2hOuCeWX5kQw6buVX
 opsheFsJVKr6wMztxDhvlRlCUJkhdWRyU5hjHwfa9PvcVjwcRZv7iXHd2BmY2SrULGms
 PB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJd5XkxKLkkgZry9ph7vylC1lYNWAIO4g+OAGMmxr1U=;
 b=LjvBe6H7Q4NH3dwTtrHULUUiAN+XjEvpqYLhZMPmlw3ZcukMwTwarx0oTS0K3iRkrn
 rWJ4NIr+bGf7+y75bOkwcbhfeRtjg3wHyrzKEZpPXT9v50uSCcQOFhvJPwOpW+fMzJ1w
 3Wh6fJg+7zP6gzvVuZZyjJ/bYrK4vC6w+Rn0Gs346UdI1rPVlC96minvgW2UMprndCJb
 GJyK76ZGiL9JjgpU4RdQYIlUG9KEZ7ZZA8gMD/6CfRM+pm/EXymLJ/adp5Syyb3tTkt3
 dLnW+RV0zgrMyxMEdLnBZPzWHoK7TemFxXlKazDUg90PuRbd95mEMftKJzHfztNX38Xw
 JeRA==
X-Gm-Message-State: AOAM531jVgru8jWmBPrukKHb5h2bFSGrTqCQfMb0D/t/Xbpy6n531WAS
 2euYwl0099q5nJq/xH4BV6c1XL0cEZx5HQ==
X-Google-Smtp-Source: ABdhPJyC50N3lmpTorxeQxdheWHyAELH3BtHb6g2MtkO1ereUNBbqmgYz7J55t7oGjFevzLfZCCFuA==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr2615206wrt.322.1605007169523; 
 Tue, 10 Nov 2020 03:19:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] target/arm: Fix neon VTBL/VTBX for len > 1
Date: Tue, 10 Nov 2020 11:19:09 +0000
Message-Id: <20201110111917.29539-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

The helper function did not get updated when we reorganized
the vector register file for SVE.  Since then, the neon dregs
are non-sequential and cannot be simply indexed.

At the same time, make the helper function operate on 64-bit
quantities so that we do not have to call it twice.

Fixes: c39c2b9043e
Reported-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: use aa32_vfp_dreg() rather than opencoding]
Message-id: 20201105171126.88014-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             |  2 +-
 target/arm/op_helper.c          | 23 +++++++++--------
 target/arm/translate-neon.c.inc | 44 +++++++++++----------------------
 3 files changed, 29 insertions(+), 40 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 774d2cddb5c..ff8148ddc6b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -245,7 +245,7 @@ DEF_HELPER_FLAGS_2(rsqrte_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(rsqrte_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
 DEF_HELPER_FLAGS_1(recpe_u32, TCG_CALL_NO_RWG, i32, i32)
 DEF_HELPER_FLAGS_1(rsqrte_u32, TCG_CALL_NO_RWG, i32, i32)
-DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i32, i32, i32, ptr, i32)
+DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i64, env, i32, i64, i64)
 
 DEF_HELPER_3(shl_cc, i32, env, i32, i32)
 DEF_HELPER_3(shr_cc, i32, env, i32, i32)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index b1065216b2d..aa13b978c0d 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -68,21 +68,24 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     cpu_loop_exit_restore(cs, ra);
 }
 
-uint32_t HELPER(neon_tbl)(uint32_t ireg, uint32_t def, void *vn,
-                          uint32_t maxindex)
+uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
+                          uint64_t ireg, uint64_t def)
 {
-    uint32_t val, shift;
-    uint64_t *table = vn;
+    uint64_t tmp, val = 0;
+    uint32_t maxindex = ((desc & 3) + 1) * 8;
+    uint32_t base_reg = desc >> 2;
+    uint32_t shift, index, reg;
 
-    val = 0;
-    for (shift = 0; shift < 32; shift += 8) {
-        uint32_t index = (ireg >> shift) & 0xff;
+    for (shift = 0; shift < 64; shift += 8) {
+        index = (ireg >> shift) & 0xff;
         if (index < maxindex) {
-            uint32_t tmp = (table[index >> 3] >> ((index & 7) << 3)) & 0xff;
-            val |= tmp << shift;
+            reg = base_reg + (index >> 3);
+            tmp = *aa32_vfp_dreg(env, reg);
+            tmp = ((tmp >> ((index & 7) << 3)) & 0xff) << shift;
         } else {
-            val |= def & (0xff << shift);
+            tmp = def & (0xffull << shift);
         }
+        val |= tmp;
     }
     return val;
 }
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 59368cb2436..0ae95cb8df8 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -2861,9 +2861,8 @@ static bool trans_VEXT(DisasContext *s, arg_VEXT *a)
 
 static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
 {
-    int n;
-    TCGv_i32 tmp, tmp2, tmp3, tmp4;
-    TCGv_ptr ptr1;
+    TCGv_i64 val, def;
+    TCGv_i32 desc;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -2879,43 +2878,30 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
         return true;
     }
 
-    n = a->len + 1;
-    if ((a->vn + n) > 32) {
+    if ((a->vn + a->len + 1) > 32) {
         /*
          * This is UNPREDICTABLE; we choose to UNDEF to avoid the
          * helper function running off the end of the register file.
          */
         return false;
     }
-    n <<= 3;
-    tmp = tcg_temp_new_i32();
-    if (a->op) {
-        read_neon_element32(tmp, a->vd, 0, MO_32);
-    } else {
-        tcg_gen_movi_i32(tmp, 0);
-    }
-    tmp2 = tcg_temp_new_i32();
-    read_neon_element32(tmp2, a->vm, 0, MO_32);
-    ptr1 = vfp_reg_ptr(true, a->vn);
-    tmp4 = tcg_const_i32(n);
-    gen_helper_neon_tbl(tmp2, tmp2, tmp, ptr1, tmp4);
 
+    desc = tcg_const_i32((a->vn << 2) | a->len);
+    def = tcg_temp_new_i64();
     if (a->op) {
-        read_neon_element32(tmp, a->vd, 1, MO_32);
+        read_neon_element64(def, a->vd, 0, MO_64);
     } else {
-        tcg_gen_movi_i32(tmp, 0);
+        tcg_gen_movi_i64(def, 0);
     }
-    tmp3 = tcg_temp_new_i32();
-    read_neon_element32(tmp3, a->vm, 1, MO_32);
-    gen_helper_neon_tbl(tmp3, tmp3, tmp, ptr1, tmp4);
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(tmp4);
-    tcg_temp_free_ptr(ptr1);
+    val = tcg_temp_new_i64();
+    read_neon_element64(val, a->vm, 0, MO_64);
 
-    write_neon_element32(tmp2, a->vd, 0, MO_32);
-    write_neon_element32(tmp3, a->vd, 1, MO_32);
-    tcg_temp_free_i32(tmp2);
-    tcg_temp_free_i32(tmp3);
+    gen_helper_neon_tbl(val, cpu_env, desc, val, def);
+    write_neon_element64(val, a->vd, 0, MO_64);
+
+    tcg_temp_free_i64(def);
+    tcg_temp_free_i64(val);
+    tcg_temp_free_i32(desc);
     return true;
 }
 
-- 
2.20.1


