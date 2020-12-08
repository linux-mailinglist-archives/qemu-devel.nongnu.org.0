Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF32D322F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:29:23 +0100 (CET)
Received: from localhost ([::1]:58374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhjm-0006gK-Dz
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ9-0007vb-5A
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:51 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ6-0006Ot-5C
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id b62so16619438otc.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNC0T7rNjPLMZzj0tvfPEhRFtAoFlS8LhMxO6R/0Cws=;
 b=F6Lsk1+l8Jol8vQAIWR1r1vsSCKU8+NN3l8pc1Tmf3PLGceCmWXBEQH/LoSPG/089Q
 fjaTem7G7sMf+TxU2Wzd17YLrrE3dOT/pDhlMm1fgAFLYe1UxODOZ3HAK0kt37RX1aIP
 sJTGIXvIv2pMdRViRAcBTEfFy0YCV81j4ssKrJ5Fz5mLVpMPm8M9UU7ymUWVEFFG3jSW
 kfOoS5gpu5zkC0O4xD2Zg3nXwMTEP7NEKWMUJzySl6kYzWTVYCSKdz9YzzfXUJIl7nQv
 z3Df2/MyRa0iVOGYIjwCT81AO/CPfE0/BpbVVnPQMsOr05gSWwSzKm3CXgevSqqiEUji
 SM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNC0T7rNjPLMZzj0tvfPEhRFtAoFlS8LhMxO6R/0Cws=;
 b=bq/r5AuCKqnZI+w8+8OqEglYWilEVcT0uqf6veURhJREjZgXdFeiqDUfc+GNVWfi+h
 H5CcoxiR1DGYvJPwaKxB/ib8nEVqJkLLPDzck5BnpvKBvFTW+04kdEalQCdC0+P8KzT9
 A2QgikPmTTR41W/cW1fVeSI/7umI99gaxTpqUY5o/mTnLxKjxmR4RGddaJMhEFljg/3F
 WtJd9l6vsGI6gum2QnbYlf7ZeZMglkMBdK5ZrwocSVMQ4BxIOGmmvBcYB3ixmu7nuSNL
 zwFUZqOav3y1Vy8hGwH5KCYuGidTFjOBhZOdNCgG5b78HosMi1JmYBm7H3qz183NYYfI
 /AqQ==
X-Gm-Message-State: AOAM531cKmOMRxMgUcV8FzyMtKFw5AXkBf/+zbAypM0e7PrVU8tpWwxu
 04F7Cy+ZLlmMBpXA+z6hhZu6KvpYeAX29hU6
X-Google-Smtp-Source: ABdhPJyiJSBW2JWDqDIij1Ou5bZ23luEyTDFhagpG5QwC91bFSesVwDTblWTD6S4Z2CnQHAyDXXiqg==
X-Received: by 2002:a9d:550a:: with SMTP id l10mr17371770oth.357.1607450506679; 
 Tue, 08 Dec 2020 10:01:46 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] target/arm: Enforce alignment for VLDn/VSTn
 (multiple)
Date: Tue,  8 Dec 2020 12:01:09 -0600
Message-Id: <20201208180118.157911-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h          |  1 +
 target/arm/translate.c          | 15 +++++++++++++++
 target/arm/translate-neon.c.inc | 27 ++++++++++++++++++++++-----
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 22a4b15d45..c1ec661afb 100644
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
index c7e01ea73a..7455118ff5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -875,6 +875,21 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
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
index 7cb89b18e0..4dab01ae18 100644
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


