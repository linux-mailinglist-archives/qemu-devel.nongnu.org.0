Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C536F8F2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:10:20 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR2J-0003PE-FX
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUR-0007sa-DR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:21 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUE-0001OP-7B
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so1392575wmb.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xv8sD118HVsdOFITYFq6DC+q9hManJBUC0l6aIfLdv4=;
 b=TZqz9YhnL5BB+hLBp1YeRLCFfvRmMmoZgB3wH9zHLtSrLf/C8P5R08lFDkNtr8Tk+c
 B1CGu52BPOLdF3Dq3Ocf6Mi0eanlQ4YSU6Kg7+xVX45DY98O/1JDt3XPT8k4qNwtr2zL
 AgPonvSupX5sZc/5LDhpbO58PwbXrPMQl35hERN/6Yuay5SWk0RlhIE/2YqVnJdqFjtO
 fthUDELJLXnGb1NKNpJb9LyC7vurosEKsYdil4FLHWO+wkpe5ACXA8xHVX1Q2H3aDN8l
 cFTo1l3Tu1QeuxBOQaasvIspNCPifJBGZrgrqKxmnYM1vNKdS2dekF3uzhxuCBlVQFuS
 fkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xv8sD118HVsdOFITYFq6DC+q9hManJBUC0l6aIfLdv4=;
 b=bOAIM9Qofi2Dx4QOkV2CI4msH/BRbfJK4s0VIkfeS9CJdLc0a9kBs7ppv3ucIspV9j
 mAnI1BtUsYpCnlwsSdpemvOr+fDdf0jbIy4rsZbM+hVrc7I+K+319mjqPcicfExQyuMs
 NxFkGuC4YkY5kFrhrb8K9cu0aWynIm0YzbmwbEZe/FoYKdHh1LZI0adB+Jb7AtWw9rrI
 LSIiNhBfOmZDZtOYC4axjwLZYZBkG3eACoH14Lb5q8RqpMwpbbGZZzpDOqwOq5yHAsTj
 9VMw7GJiJdhB+SzSU2h5/2HrpdmLTHTCEtET/jCEEiHduQ12Bj1cuw0/bzQNT2iUTfj/
 aouA==
X-Gm-Message-State: AOAM53285Hvu5w1nTrG1/rq0P6pSHnEF9JIa4sQgKjoILVUatcYijfQV
 KQXK5eNxpxa13NjHX6aF75wNKJRgZSNKjGoB
X-Google-Smtp-Source: ABdhPJzV7+rD3ktGsAVx8y2PemkHDioNA2MlgQnj5f9ZRVf0a0RXTN3L8Vvliy5HXHrqqfNMFfUhnw==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr15957420wmi.105.1619778904195; 
 Fri, 30 Apr 2021 03:35:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/43] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Fri, 30 Apr 2021 11:34:28 +0100
Message-Id: <20210430103437.4140-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Message-id: 20210419202257.161730-25-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c.inc | 48 ++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index e706c37c80a..a02b8369a1d 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -629,6 +629,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     int nregs = a->n + 1;
     int vd = a->vd;
     TCGv_i32 addr, tmp;
+    MemOp mop;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -678,23 +679,58 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         return true;
     }
 
+    /* Pick up SCTLR settings */
+    mop = finalize_memop(s, a->size);
+
+    if (a->align) {
+        MemOp align_op;
+
+        switch (nregs) {
+        case 1:
+            /* For VLD1, use natural alignment. */
+            align_op = MO_ALIGN;
+            break;
+        case 2:
+            /* For VLD2, use double alignment. */
+            align_op = pow2_align(a->size + 1);
+            break;
+        case 4:
+            if (a->size == MO_32) {
+                /*
+                 * For VLD4.32, align = 1 is double alignment, align = 2 is
+                 * quad alignment; align = 3 is rejected above.
+                 */
+                align_op = pow2_align(a->size + a->align);
+            } else {
+                /* For VLD4.8 and VLD.16, we want quad alignment. */
+                align_op = pow2_align(a->size + 2);
+            }
+            break;
+        default:
+            /* For VLD3, the alignment field is zero and rejected above. */
+            g_assert_not_reached();
+        }
+
+        mop = (mop & ~MO_AMASK) | align_op;
+    }
+
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
-    /*
-     * TODO: if we implemented alignment exceptions, we should check
-     * addr against the alignment encoded in a->align here.
-     */
+
     for (reg = 0; reg < nregs; reg++) {
         if (a->l) {
-            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), a->size);
+            gen_aa32_ld_internal_i32(s, tmp, addr, get_mem_index(s), mop);
             neon_store_element(vd, a->reg_idx, a->size, tmp);
         } else { /* Store */
             neon_load_element(tmp, vd, a->reg_idx, a->size);
-            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), a->size);
+            gen_aa32_st_internal_i32(s, tmp, addr, get_mem_index(s), mop);
         }
         vd += a->stride;
         tcg_gen_addi_i32(addr, addr, 1 << a->size);
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(tmp);
-- 
2.20.1


