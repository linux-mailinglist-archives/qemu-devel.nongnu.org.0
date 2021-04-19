Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4882364CBE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:05:02 +0200 (CEST)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYb4n-0000Iq-VA
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQx-0007wY-6k
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:51 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:37801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQp-0002kY-JH
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:50 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id h15so7736773qvu.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=TtYpPdbgWfreAnJpgwHYNOa14LJ6lt0tSsbAv4dPkG2NVEVIwlC+KPOE18I3PaMaUO
 TJVkhclL9RuyM6YkGOMfV2O9oAYhZ8gtJR4OR9Ruk7l67Ht7T4oQuvpTPOlVEbIHAaZA
 MNoIRnrHgK7JM9xLCHleQi52DAhJEZqAk+/NHtOHe6G+aAULjD25WupoPWqNlYFj2lqG
 aQzXV7PW9aSCmZFfOAc5zkAzTNdHENgKXjiwyKbHnn/wAkIEL63MW+nYDGY7a9pOB0OC
 VVW/hRn9RDhMqM0/xHOtDSbghXJePLUFsomU1VRHW4U5hYN8K14nY6BZlZNHSqIRfOrA
 TsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=hopWNUZDkUedlItDABsv54l1PD0OuU512DafPqbg0YY2w2OUS7B9bBTMtXhBru8kaj
 JaaDkdBHYerM0080BT7RVXQD5ND0dpjvN9neIZlW9SRYQA/Za4toVVHfZhqdvelaToPz
 VTZ+2U0w8PMyV1ZLh2nVWjOxG3VLsiweVD3VnyvCB1RxP2h4QiBJ4bNIgwRnLifhnys8
 HkEh/4+t3TrnfYCUqUeHZjnEmuub8q6aqlsd5zUM52M80IrkqiUb+FobBpsngjGRg/Mp
 0PrZLIkmbFKp/BFW1+sco3e27RvKcnK52FVahW7ftvq7ficrBJtEGgdoqRX1uPdHRZc+
 rCiA==
X-Gm-Message-State: AOAM533wVbV/oNYEAIxA0Qe6VaXgl+L0/9IZn9niYEktX2pWJ33VIdp8
 GmnWfV6RLT5pWbN0hzRvlzzIG5Wlc6JhNei+
X-Google-Smtp-Source: ABdhPJyh/QkkXNPThWr37GID+sbPSZCVuaZcZx4rtU0wFta5ulYgcS9mFkRovdeePefqjvdqAWRQxw==
X-Received: by 2002:a05:6214:176a:: with SMTP id
 et10mr23354359qvb.23.1618863822653; 
 Mon, 19 Apr 2021 13:23:42 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/31] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Mon, 19 Apr 2021 13:22:50 -0700
Message-Id: <20210419202257.161730-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 48 ++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index e706c37c80..a02b8369a1 100644
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
2.25.1


