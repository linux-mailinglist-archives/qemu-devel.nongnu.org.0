Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354732F1F98
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:36:35 +0100 (CET)
Received: from localhost ([::1]:34214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2zS-0002dW-AR
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S4-0006Nk-9s
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:04 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Ry-0006VL-C5
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:04 -0500
Received: by mail-pg1-x532.google.com with SMTP id c132so277283pga.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=aNNkL5kpHsitk+eokZ5wfjXV25BmxKQCerYTYVQndR6s82frYIutzN3vtQHwxsoJpI
 t91Hh74HJXBBn8kguYjZ8G78BeFJy9vl0HEXUJ6i61VRwUvhXSm6zlYp13gGkRDMEw0d
 aND7xadZR00v+WNIZRecqTLNOU+yMpLZ3kTrvJHjq4WM07oJ2wtR96rgR03VU85Y5AkS
 HWFVbEVtwdh5S1+1+bL3j7S6tV7mTS5MkISjRSPEpv5Q5S94pehbjFdOZUo8E47+q9fs
 MTAMkGY4U+NvDcEIoQ14LvJ/rHqRpOetS17CnD03IrUAZMi/KUMTvc64DduYIR6kQ6TK
 8/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZxTe0vrdv36w4KUhkfdQi48uXdXMfkmKMdEHX8Xoc08=;
 b=RuVTjJuKfjsyX85sf9GEZWHhVbt5VK3zTK/wloVdYTRggHHX7T+sR+YMPbpi3EUcte
 G4I4gOGHwSUgneDxlJvOn6CAoeBqAncI7Hhyo+MbAoPMbzZHwYFc5zAbP6ubdDRYAj9G
 vkSWjFQuTK7arQGRkqmynzr/Q5rnWHQICRqwIKBvM/3GUcvrP2gSzpPb0KTKniKnwPW3
 U5OXebKmbBcZsv5oqQNysFjVAzTMvb5Yu8+mcUZmfIvOCttA+jOeJpYxg/oiko0TOfTm
 BRNn+85/Yn67S8joIQdk74lflKx40RGgcMByX/HYTUZqdJenQ9dGyI7FlzUkFpqEmME3
 2jxA==
X-Gm-Message-State: AOAM533hHXi+fMOKldIYrl8EoJd1h00WpOCHGedcO3esBYZwyFJXMQto
 t/Z6rpKUh5+pQNEgkQzZmlUN8Ba+0lVfAQ==
X-Google-Smtp-Source: ABdhPJyjkCCVTiJ52SczjCei7M3fKRowvz84I2+lZkkEbr/CXo8TP8ecqxxlbtEpsQZpPfWcYSL79Q==
X-Received: by 2002:a62:7857:0:b029:19d:fe6a:3069 with SMTP id
 t84-20020a6278570000b029019dfe6a3069mr805550pfc.3.1610391716595; 
 Mon, 11 Jan 2021 11:01:56 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/30] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Mon, 11 Jan 2021 09:01:06 -1000
Message-Id: <20210111190113.303726-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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


