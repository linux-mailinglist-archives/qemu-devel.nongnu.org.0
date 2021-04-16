Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EBD36287D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:18:34 +0200 (CEST)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTz7-0001qY-SE
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThr-0003yV-KY
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThY-0004RU-18
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id r13so10725167pjf.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+sb1OiK3PXbPdK4EXbSsWp1dZgv4+0of5bsvTMZpO2o=;
 b=crx4Egj6hYxckLtJLYC7oOPbYhoUB+moSqF5lyTy3vFl6U7fnrbPgJzdmxEdrYfHAk
 UIiJjJsyMmz4dCkoIXex8DVGtzcSHGNmeTl1adL1ApMBtB2Zav/avtzDRBSL+Q37zrXz
 xzYhZhIy50JjgBmGQNOrFLZY4lVT3bsIcGhKsOQ/e2aLmmqBTHce//NgNMXhjhnAOXbz
 Z+uPAq1zavW1yjqYJTfBb/zivRbYpNWa3gIN1Dg+PDOnNevg3+25P5R6aMO4k24hH19i
 f4P0aW8oy3XYWN1V6YSy92iJQbh0IsDWJRFr/FYqERBuxvgPuUnBVHI+gfwDp3TisUh/
 KOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+sb1OiK3PXbPdK4EXbSsWp1dZgv4+0of5bsvTMZpO2o=;
 b=qr4ytU55XTBtoDqH9EZQzGGMlS9mMak64J2KgBq1sbY2B7DfVgU9Xdnu1GLTqOBCCL
 l+CgN5RHYLnnoaBtBeBbd+ewEdf4RXSS2o8Lra1s5tjQAGjr4zNS0joeDQcMLogIhhA6
 FM25jObGkGMUDR1efM1DcmqvzZF0L3mFiets/jy5dBjTjEaGEO9Aa5ING2D8VVF3gzLg
 GY4xbZHfrkxr+sUjwMFuS4Fsr/8JgEnYRfgIKIFh3zaq6Y+tS3rTVlAn7cdr+8ajPsXB
 90waE6ElS2x0EdPI75lCQQYoh4e3za8FTTXwSH/+N0OnATsphxQBbPW+J1bItUvZ+ZjM
 rN+w==
X-Gm-Message-State: AOAM531cI52J23FMi0nuq8YA6tUHjT9/PpYBwZYqJDx2j4Q/b5MHwv0C
 kPPdvC7bQAL9gbI6ys2TwlQpO6ECqCLFxg==
X-Google-Smtp-Source: ABdhPJxlOTQfXfbMoXrIyf+Jq4Ya2wOfVl1ISeUNL6A4PmQRabH0Ib8aU5d4VCJ91k+O8LFRn1NMOg==
X-Received: by 2002:a17:90a:f0d5:: with SMTP id
 fa21mr11168701pjb.59.1618599621788; 
 Fri, 16 Apr 2021 12:00:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/30] target/arm: Enforce alignment for VLDn (all lanes)
Date: Fri, 16 Apr 2021 11:59:50 -0700
Message-Id: <20210416185959.1520974-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix alignment for n in {2, 4}.
---
 target/arm/translate.h          |  1 +
 target/arm/translate.c          | 15 +++++++++++++
 target/arm/translate-neon.c.inc | 37 +++++++++++++++++++++++++--------
 3 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 0c60b83b3d..ccf60c96d8 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -204,6 +204,7 @@ void arm_test_cc(DisasCompare *cmp, int cc);
 void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
+MemOp pow2_align(unsigned i);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c2970521c0..0420c0b0ce 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -908,6 +908,21 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #define IS_USER_ONLY 0
 #endif
 
+MemOp pow2_align(unsigned i)
+{
+    static const MemOp mop_align[] = {
+        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16,
+        /*
+         * FIXME: TARGET_PAGE_BITS_MIN affects TLB_FLAGS_MASK such
+         * that 256-bit alignment (MO_ALIGN_32) cannot be supported:
+         * see get_alignment_bits(). Enforce only 128-bit alignment for now.
+         */
+        MO_ALIGN_16
+    };
+    g_assert(i < ARRAY_SIZE(mop_align));
+    return mop_align[i];
+}
+
 /*
  * Abstractions of "generate code to do a guest load/store for
  * AArch32", where a vaddr is always 32 bits (and is zero
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 18d9042130..9c2b076027 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -522,6 +522,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     int size = a->size;
     int nregs = a->n + 1;
     TCGv_i32 addr, tmp;
+    MemOp mop, align;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -532,18 +533,33 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         return false;
     }
 
+    align = 0;
     if (size == 3) {
         if (nregs != 4 || a->a == 0) {
             return false;
         }
         /* For VLD4 size == 3 a == 1 means 32 bits at 16 byte alignment */
-        size = 2;
-    }
-    if (nregs == 1 && a->a == 1 && size == 0) {
-        return false;
-    }
-    if (nregs == 3 && a->a == 1) {
-        return false;
+        size = MO_32;
+        align = MO_ALIGN_16;
+    } else if (a->a) {
+        switch (nregs) {
+        case 1:
+            if (size == 0) {
+                return false;
+            }
+            align = MO_ALIGN;
+            break;
+        case 2:
+            align = pow2_align(size + 1);
+            break;
+        case 3:
+            return false;
+        case 4:
+            align = pow2_align(size + 2);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 
     if (!vfp_access_check(s)) {
@@ -556,12 +572,12 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
      */
     stride = a->t ? 2 : 1;
     vec_size = nregs == 1 ? stride * 8 : 8;
-
+    mop = size | align;
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
@@ -577,6 +593,9 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         }
         tcg_gen_addi_i32(addr, addr, 1 << size);
         vd += stride;
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1


