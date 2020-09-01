Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0195C259364
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 17:25:46 +0200 (CEST)
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD8AL-00041G-1y
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 11:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD83U-0007cg-4k
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:18:40 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD83R-0006As-Bm
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:18:39 -0400
Received: by mail-wm1-x342.google.com with SMTP id v4so1545931wmj.5
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CTE1otn/TaCLJJX6s6OO9/RItYMi7SYmI46uEtXhkWU=;
 b=ZNOjv+Va4BlBI6+//Lw8Q01JHApB17mUW5AglaMLFKM+eL6mB0TklvclUaaVztoiLg
 6P/kJhLDy0Nr8IJcyfUBamOfNvGOmEHlbMPBuzxxvGeMCchZ29xtFs0aM4b5DZHgWfEx
 AYOTkfJZ5RMDiMc2pcDwgLW08o9ld+XItPLsh7zAjEdWf45kJzAr36bdFTnmXNTtNPFH
 LOTHPUw1M2+/kw7jYAaZEmFnVGMV7f+7Vg9KF7OPmsjD0hq7Z+xgR28V6BKfGL7K7aOb
 hwELXfE8sMOZjYIBwCGPO4Uwy2F1u9QBbETvUT6/PJk9tKYivNSyhw2mrRkkMt1JBejY
 gI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CTE1otn/TaCLJJX6s6OO9/RItYMi7SYmI46uEtXhkWU=;
 b=R5EefTqqPJX3Xde5zBDKlJlLNwI9Yg+a0RyNgFnjYR6xcRTZMnKD2JBWZPS+blhiUr
 4Wezb2m7bQFuIXHhE88JDXdINb+Hk8wrrCqhPlSdt0oS1iLml7wm/W85hlmvXmiC8LAy
 l2UohOE1y3FhvQrnL/2qo+pIkAaqu/8JZ9b8Gee9c3OqkM8CS0UXcZ/p/LHL8NE/stTf
 Kbwbzk+WuhcPVy+Gjl5M7gUZos4vsZx+hEg80/Qej4+gafzV8VtWD0Dithe1cWgJkDow
 qc12etjmTtxbrKDZAoFAtcXwjl8V5pJ3qaGFApbY2b5A+e5YDs82P2mlx1c6HVEpMv1r
 1Czg==
X-Gm-Message-State: AOAM531xkaUvc0ioggudsTKA1q+Kqxaiuur1B6ggcv3iJiux+FfXyCdC
 JkI+IdroYd0V1tNslCDAGCfjCErCOWgQAo/P
X-Google-Smtp-Source: ABdhPJzy0hO9uQXB6J5FJkwYHGssbsM52V8knpOcHkTmfJHKPLzx5HTPbZfF/HS1dlZBp74MEl3yCg==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr2255222wmi.186.1598973515534; 
 Tue, 01 Sep 2020 08:18:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm2242317wma.4.2020.09.01.08.18.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:18:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/47] target/arm: Macroify uses of do_vfp_2op_sp() and
 do_vfp_2op_dp()
Date: Tue,  1 Sep 2020 16:17:43 +0100
Message-Id: <20200901151823.29785-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200901151823.29785-1-peter.maydell@linaro.org>
References: <20200901151823.29785-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

Macroify the uses of do_vfp_2op_sp() and do_vfp_2op_dp(); this will
make it easier to add the halfprec support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200828183354.27913-8-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c.inc | 49 ++++++++++------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index b5eb9d66b3d..f891d860bb9 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -2234,55 +2234,34 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     return true;
 }
 
-static bool trans_VMOV_reg_sp(DisasContext *s, arg_VMOV_reg_sp *a)
-{
-    return do_vfp_2op_sp(s, tcg_gen_mov_i32, a->vd, a->vm);
-}
+#define DO_VFP_2OP(INSN, PREC, FN)                              \
+    static bool trans_##INSN##_##PREC(DisasContext *s,          \
+                                      arg_##INSN##_##PREC *a)   \
+    {                                                           \
+        return do_vfp_2op_##PREC(s, FN, a->vd, a->vm);          \
+    }
 
-static bool trans_VMOV_reg_dp(DisasContext *s, arg_VMOV_reg_dp *a)
-{
-    return do_vfp_2op_dp(s, tcg_gen_mov_i64, a->vd, a->vm);
-}
+DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32)
+DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64)
 
-static bool trans_VABS_sp(DisasContext *s, arg_VABS_sp *a)
-{
-    return do_vfp_2op_sp(s, gen_helper_vfp_abss, a->vd, a->vm);
-}
+DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss)
+DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd)
 
-static bool trans_VABS_dp(DisasContext *s, arg_VABS_dp *a)
-{
-    return do_vfp_2op_dp(s, gen_helper_vfp_absd, a->vd, a->vm);
-}
-
-static bool trans_VNEG_sp(DisasContext *s, arg_VNEG_sp *a)
-{
-    return do_vfp_2op_sp(s, gen_helper_vfp_negs, a->vd, a->vm);
-}
-
-static bool trans_VNEG_dp(DisasContext *s, arg_VNEG_dp *a)
-{
-    return do_vfp_2op_dp(s, gen_helper_vfp_negd, a->vd, a->vm);
-}
+DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs)
+DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd)
 
 static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
 {
     gen_helper_vfp_sqrts(vd, vm, cpu_env);
 }
 
-static bool trans_VSQRT_sp(DisasContext *s, arg_VSQRT_sp *a)
-{
-    return do_vfp_2op_sp(s, gen_VSQRT_sp, a->vd, a->vm);
-}
-
 static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
 {
     gen_helper_vfp_sqrtd(vd, vm, cpu_env);
 }
 
-static bool trans_VSQRT_dp(DisasContext *s, arg_VSQRT_dp *a)
-{
-    return do_vfp_2op_dp(s, gen_VSQRT_dp, a->vd, a->vm);
-}
+DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp)
+DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp)
 
 static bool trans_VCMP_sp(DisasContext *s, arg_VCMP_sp *a)
 {
-- 
2.20.1


