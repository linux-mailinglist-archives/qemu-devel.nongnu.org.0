Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951A3905CF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:47:41 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZHP-0002pN-0G
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbi-0003b5-Td
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbP-0004UG-Er
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id x8so32603237wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Uc+LeeIHhZqjArDXksJs82ud4cd8qMluybL6pNpvmg0=;
 b=jy6LHUAXhksSl8Y5W8yxQJBly+HfKXGmVvFZ2XYG72gbS8EJ+iYlNJruQVDUVPsNg4
 PtOjkHk6S4uHy5kYvMv5iHX+zGMHIxpVfwgRJzszZu5b9odXj/VAwJacCzqb8xa46wXS
 xwZl+XPgL/1xkl9FHSPz6h+Y+iP7LXgcqublMvmZqaESd7K5TfN0/Q21V/ivjZU6iABV
 QdUCJeEzuCy5M5Y1+4dgFGbaiQ6HkSiHCHs4ZnCSpAAUEE/jEhhBFAU2WrA9CsWsCPUR
 nLlp7AdGJ3m/VLjFBlQovdkckHTDpIqqjn5UseLGF8C5eeSfKba2AmrPRMYu01nXxN4H
 AT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uc+LeeIHhZqjArDXksJs82ud4cd8qMluybL6pNpvmg0=;
 b=qCRL+7UNZko4iI9jVdP6NqEOKgV/m/hmwEG79xNXxdWtjyB9Fgqeit7XI5x5vdex1l
 0V57k3+noNBwBPR7PMyhhi0JBoJkLkohaEHtEwYKo+u4CUYSC08pA9PJqxWmu7O0b6qd
 v71ZD7Z0p2KzNbiSq9aWcV/ncvRQQGpGyUO5iXa/zLqGMHW1dBuQLQs9khNUsb3pyY22
 k/qjA5kOOb9nAwMgXZklXvYi/j5Pt0iNTTzviR8Fdpzrmlun4VuHEh7fbL4xcte7ZmvQ
 KDGsNPVRonbbFW2AApi4OYTWDAdnvSGOnrYJHrAXsfGk1MxuO2zNGlOINfMtP3EmugT/
 qc6g==
X-Gm-Message-State: AOAM530dwtZhgiAFPWBb2/XUzZZ30TJvt/vIcEnENnjhUp9qzyTbPkRW
 BhLQC3AXnqIyNQDjGWa4cNYoUw/ktBizXmCo
X-Google-Smtp-Source: ABdhPJyAlt6Fn/Em0eS44gKnubGoLcUvyj4kOBPkc8KMWJ2rTKXr2Cx0CaJfJXcIej3mvnx5ukGVcA==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr28138037wrp.425.1621955053938; 
 Tue, 25 May 2021 08:04:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 053/114] target/arm: Implement SVE2 WHILERW, WHILEWR
Date: Tue, 25 May 2021 16:02:23 +0100
Message-Id: <20210525150324.32370-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Message-id: 20210525010358.152808-32-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  3 ++
 target/arm/translate-sve.c | 67 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ae853d21f2e..f3659075180 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -702,6 +702,9 @@ CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 # SVE integer compare scalar count and limit
 WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
+# SVE2 pointer conflict compare
+WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a55e747514f..64aecc2db46 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3218,6 +3218,73 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     return true;
 }
 
+static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
+{
+    TCGv_i64 op0, op1, diff, t1, tmax;
+    TCGv_i32 t2, t3;
+    TCGv_ptr ptr;
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc = 0;
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    op0 = read_cpu_reg(s, a->rn, 1);
+    op1 = read_cpu_reg(s, a->rm, 1);
+
+    tmax = tcg_const_i64(vsz);
+    diff = tcg_temp_new_i64();
+
+    if (a->rw) {
+        /* WHILERW */
+        /* diff = abs(op1 - op0), noting that op0/1 are unsigned. */
+        t1 = tcg_temp_new_i64();
+        tcg_gen_sub_i64(diff, op0, op1);
+        tcg_gen_sub_i64(t1, op1, op0);
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
+        tcg_temp_free_i64(t1);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op1 == op0, diff == 0, and the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
+    } else {
+        /* WHILEWR */
+        tcg_gen_sub_i64(diff, op1, op0);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op0 >= op1, diff <= 0, the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
+    }
+
+    /* Bound to the maximum.  */
+    tcg_gen_umin_i64(diff, diff, tmax);
+    tcg_temp_free_i64(tmax);
+
+    /* Since we're bounded, pass as a 32-bit type.  */
+    t2 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(t2, diff);
+    tcg_temp_free_i64(diff);
+
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    t3 = tcg_const_i32(desc);
+
+    ptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
+
+    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    do_pred_flags(t2);
+
+    tcg_temp_free_ptr(ptr);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+    return true;
+}
+
 /*
  *** SVE Integer Wide Immediate - Unpredicated Group
  */
-- 
2.20.1


