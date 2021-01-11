Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604EB2F1F43
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:27:17 +0100 (CET)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2qS-0003YC-D4
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S1-0006Ie-Gv
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:01 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rw-0006U4-4f
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:01 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 11so505335pfu.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gI6n7dLB7XLtHhFDNYLn0HNXyfFPFeAguyByIHv96Vo=;
 b=H2US+6FGscw7XPuS7oWuGqdIbv/MZibBhXx9iKHEm9Izo9SkwsNPV1YY+rWVFuoYUe
 lAfac76gmJW5PyE23GCQEV40PIdURba+3IgxYS8c0FbZqLpbdaV8WLemeKCObn6gV53u
 5KSfA/qqd+rrflpg1KkxMT/mG9Sn/A6KBBpg1UL78m0D+kiBvgEOUikK78ggjaF/0ghn
 O2Gyx6m61x4rmZ/uo6uAtzvYZ/lqasC6NJGbpKZ6+vPMmjGBRk/wQ1IZ/EoNkWy5XUUI
 9nXn5jaA/0000XqKt+8W+bwNgpZeXryYbNFzWqnb3es4q/9gw5lAzmjlxojYA5o4a2Ce
 HuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gI6n7dLB7XLtHhFDNYLn0HNXyfFPFeAguyByIHv96Vo=;
 b=QXsLYP9rZ3Jkhz65qzO8nf7H/FGqwAQruLa6H3p/YZ3OzPIhb07UG6NOhp4M7FZ7uX
 5z1mGsAzb4srQ4/W1zDLz01bWoVFEVb4Xo/bSxVxbXCpqubb1Smh/NFQ7WJm7HxhHLVr
 ILu2KdymcIN/xU1MPVlizN3HjURrbDQqufZC/zSMeNHq159A+5n7aaKnW3eyqjt7Hlm7
 iUIHhjhWTGA5x91zwUPnLA7e1GOavVRuOhCKQSp+Sx33XCMg5dpR3rn5TpcIri+6DjOk
 M7TiALVRnkSylR9R9ChfyqUpTBw4L+6VQiuml5U15rQ4CEshvCIYx5cj84JPdc2EK6oN
 034Q==
X-Gm-Message-State: AOAM532kDKOrHzH+uYgAqDB4HeuIGI3Dy4U6z/YkGXLjoHL8AGEttz3F
 vwmjSTjgXbk8dE2jkn7vtw1f1zAf10jI/A==
X-Google-Smtp-Source: ABdhPJx71CI1Y4b4Daft4xqZNAtwgcyjri4BJD7Hz02/QCERA2jxVuBYrdU2CRSiII7VWOpiVa9pyw==
X-Received: by 2002:aa7:9e52:0:b029:19e:6c32:30d4 with SMTP id
 z18-20020aa79e520000b029019e6c3230d4mr798916pfq.21.1610391713002; 
 Mon, 11 Jan 2021 11:01:53 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/30] target/arm: Enforce alignment for VLDn (all lanes)
Date: Mon, 11 Jan 2021 09:01:04 -1000
Message-Id: <20210111190113.303726-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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
index 3057d102f2..8baa465a53 100644
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


