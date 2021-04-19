Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA614364C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:51:41 +0200 (CEST)
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYart-0004cm-1Q
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQp-0007rq-V4
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:44 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQn-0002iS-Uw
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:43 -0400
Received: by mail-qv1-xf32.google.com with SMTP id ef17so11886797qvb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFpRdpzIBHPgybwqUXYjnSl/F8QbD35R7VDxiD3dIh0=;
 b=z4citvcf7SJ4+AlXsBjHBAI690LkbKBCbGi84U9ZEatF3YxyNZp7KvzBxGWRJ3VcoF
 9scjC1idVm88Vbuz8oZIPUc6Hhc/3J4zzmw/tpMdgxUuQDaVln/NJSKU2QoYiapr1MCG
 zeC2bL0rAggMSGDMB6iAS1lJ4aezIANTh9QJmZreUlJxZdxRhuemkFdjYxTNusjPW7R9
 FIj/1npJ2AAJQ7TTvsTnuW2vCAvxdlV5UG5WKxNnEY1EZ9JkIQ42C96DWTaZALcj3oQ5
 givvRZAUy9hSBxgPZw0OWy4arNVczs5mMPJY59s9yJa9QsKrMf29xetQr4AdMULrp9H3
 ch7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFpRdpzIBHPgybwqUXYjnSl/F8QbD35R7VDxiD3dIh0=;
 b=Aekmh//0ZOOPSIEpAyK07y5IyP/4XvHduToQyiFwVC4wOURacGfC00vYVKhB43GYtQ
 k+zqZMhZ3IKA67MZcPqfyBjJRwlbS5ypcShjQIvnd9g76Vtz3vR4DEUFdac9txnrR2Gc
 a/ZVm7IGTczCO/ory2lhBUanVKhMbwDsW61OZ5SUjesmXjxuNjeyl/3VO2w+pD7l/cMX
 7Bi7GrKe2DIqTWaQ9eTYQFu65UhH0yfsMS1Y/MiMDfco/5jBt8KHxBBtIiB3iCPRepKK
 HI6VS7S2NO2l5JWiqTDI+cp1GZCwzr/dT50xXFlXUQ92nE9VRvxWm1p1U9z0kMkEtd9b
 q14w==
X-Gm-Message-State: AOAM530cNAVlTFz4euj5at1stzpF7rexCrptDgZ3SmgkD6JDfFQDfBGv
 IsShA6D/EJn8IF3qcBnlrVWijS4KfWVJQfFF
X-Google-Smtp-Source: ABdhPJyak/v721/TUCsVSmFExW8uaqY+TNFDa0UMvEJkao3Q8ZRt47Kr0mUSrZOW93/hocqorpJ4EA==
X-Received: by 2002:ad4:4ccd:: with SMTP id i13mr23867024qvz.60.1618863821002; 
 Mon, 19 Apr 2021 13:23:41 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/31] target/arm: Enforce alignment for VLDn/VSTn
 (multiple)
Date: Mon, 19 Apr 2021 13:22:49 -0700
Message-Id: <20210419202257.161730-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 9c2b076027..e706c37c80 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -429,7 +429,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 {
     /* Neon load/store multiple structures */
     int nregs, interleave, spacing, reg, n;
-    MemOp endian = s->be_data;
+    MemOp mop, align, endian;
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
@@ -473,20 +473,36 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
+
+    /* Enforce alignment requested by the instruction */
+    if (a->align) {
+        align = pow2_align(a->align + 2); /* 4 ** a->align */
+    } else {
+        align = s->align_mem ? MO_ALIGN : 0;
+    }
+
     /*
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
     if (interleave == 1 && endian == MO_LE) {
+        /* Retain any natural alignment. */
+        if (align == MO_ALIGN) {
+            align = pow2_align(size);
+        }
         size = 3;
     }
+
     tmp64 = tcg_temp_new_i64();
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
+
+    mop = endian | size | align;
     for (reg = 0; reg < nregs; reg++) {
         for (n = 0; n < 8 >> size; n++) {
             int xs;
@@ -494,15 +510,16 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx, mop);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx, mop);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
+
+                /* Subsequent memory operations inherit alignment */
+                mop &= ~MO_AMASK;
             }
         }
     }
-- 
2.25.1


