Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F939E597
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:37:30 +0200 (CEST)
Received: from localhost ([::1]:56558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJBo-0003D6-FF
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbU-0000W6-58
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:58 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIai-000890-V2
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g204so85709wmf.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBu3YA9+F6FYdoX63F7dNFFdaXyzuQNEsH4ibbS/t54=;
 b=qnqEO1Zhmlh/8VEJsGb4qHfibbLe9uDJzdgyQFF1QoZlNiTTNmyDyz5EYUNC8jasyc
 YnxEHmjBQgDcX6eFlgzEqQ6KeLGS4g4ZFNuOtfZMuBh0EliudSpIsGwQbr3Bt2ZXPxJ2
 Llt+esVTibsLRm9KMVm/yOFb+tVcKCVzp0T6vCvvXVaGXeqN4G6Wo6mE5Q5PQGMhuRhb
 UbOfPExoMHY5Px9PKR/Tlt3SAlWjUU4Tofb440W6KpikyAZRKBwd4t0Ljqgwg4YkquzU
 vPg2PeAz/FuL5GP8312RZ5I/Y+KFz0jc+wmd2SVQG6FNw/oUjC8fOlU3euYtf7TZlZl2
 qSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VBu3YA9+F6FYdoX63F7dNFFdaXyzuQNEsH4ibbS/t54=;
 b=HCFX6CYJkTy3ETu6iogRTzXLKgn3b47cWy8M/sm5V/Y62jU496MdQn2qJXIcfZW2tD
 zi45FcOp2K5D9PzCE8ugu190fyDRnKOx/SG/C8D5/gjEvLxD9rkg0YwD6eozgqhMurKn
 h+LSNPMsAMScFhTiPqP3c3MRHn79TmElMUp2zR0227WTOq6mSXlWsJ/x6sP/oO0QEFF3
 zQFatv5J6cWWJBSFHNNpgKXrGF96REE7HltqwfqGrldfVBWORPRSrMxdQREYfHjZva7u
 4AWr32hRsGhikEegUADF2gCC+GuQIrZ6F99aDRv5K1SIJPr+iFMJYTi+zf3Rvvk+xZJ4
 /+FQ==
X-Gm-Message-State: AOAM533KGL5OlurjT4wjHnqzTbUOUPcEkf9L0GGA1TB/giaxUBvw6YYa
 rz6Qp8zQU+tUZ9jMUcTMqr+Kvu3chNwCb1EL
X-Google-Smtp-Source: ABdhPJziYiiDgJ2Roh6PIByCRVgaq8XxetXdetAiLXMI3KBt5CYLtBB7FxqYfL+607E9MBEnDfowrg==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr65822wmr.41.1623085146946; 
 Mon, 07 Jun 2021 09:59:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 55/55] target/arm: Make VMOV scalar <-> gpreg beatwise for MVE
Date: Mon,  7 Jun 2021 17:58:21 +0100
Message-Id: <20210607165821.9892-56-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In a CPU with MVE, the VMOV (vector lane to general-purpose register)
and VMOV (general-purpose register to vector lane) insns are not
predicated, but they are subject to beatwise execution if they
are not in an IT block.

Since our implementation always executes all 4 beats in one tick,
this means only that we need to handle PSR.ECI:
 * we must do the usual check for bad ECI state
 * we must advance ECI state if the insn succeeds
 * if ECI says we should not be executing the beat corresponding
   to the lane of the vector register being accessed then we
   should skip performing the move

Note that if PSR.ECI is non-zero then we cannot be in an IT block.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h |  2 +
 target/arm/translate-mve.c |  4 +-
 target/arm/translate-vfp.c | 85 +++++++++++++++++++++++++++++++++++---
 3 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 0a0053949f5..6d384fc7966 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -46,6 +46,8 @@ long neon_full_reg_offset(unsigned reg);
 long neon_element_offset(int reg, int element, MemOp memop);
 void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 void clear_eci_state(DisasContext *s);
+bool mve_eci_check(DisasContext *s);
+void mve_update_eci(DisasContext *s);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 1794c50d0e8..b62e355a1a3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -49,7 +49,7 @@ static TCGv_ptr mve_qreg_ptr(unsigned reg)
     return ret;
 }
 
-static bool mve_eci_check(DisasContext *s)
+bool mve_eci_check(DisasContext *s)
 {
     /*
      * This is a beatwise insn: check that ECI is valid (not a
@@ -72,7 +72,7 @@ static bool mve_eci_check(DisasContext *s)
     }
 }
 
-static void mve_update_eci(DisasContext *s)
+void mve_update_eci(DisasContext *s)
 {
     /*
      * The helper function will always update the CPUState field,
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 6a572591ce9..b5bb8230cd9 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -553,6 +553,48 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     return true;
 }
 
+static bool mve_skip_vmov(DisasContext *s, int vn, int index, int size)
+{
+    /*
+     * In a CPU with MVE, the VMOV (vector lane to general-purpose register)
+     * and VMOV (general-purpose register to vector lane) insns are not
+     * predicated, but they are subject to beatwise execution if they are
+     * not in an IT block.
+     *
+     * Since our implementation always executes all 4 beats in one tick,
+     * this means only that if PSR.ECI says we should not be executing
+     * the beat corresponding to the lane of the vector register being
+     * accessed then we should skip performing the move, and that we need
+     * to do the usual check for bad ECI state and advance of ECI state.
+     *
+     * Note that if PSR.ECI is non-zero then we cannot be in an IT block.
+     *
+     * Return true if this VMOV scalar <-> gpreg should be skipped because
+     * the MVE PSR.ECI state says we skip the beat where the store happens.
+     */
+
+    /* Calculate the byte offset into Qn which we're going to access */
+    int ofs = (index << size) + ((vn & 1) * 8);
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+
+    switch (s->eci) {
+    case ECI_NONE:
+        return false;
+    case ECI_A0:
+        return ofs < 4;
+    case ECI_A0A1:
+        return ofs < 8;
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        return ofs < 12;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
 {
     /* VMOV scalar to general purpose register */
@@ -575,14 +617,30 @@ static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
         return false;
     }
 
+    if (dc_isar_feature(aa32_mve, s)) {
+        if (!mve_eci_check(s)) {
+            return true;
+        }
+    }
+
     if (!vfp_access_check(s)) {
         return true;
     }
 
-    tmp = tcg_temp_new_i32();
-    read_neon_element32(tmp, a->vn, a->index, a->size | (a->u ? 0 : MO_SIGN));
-    store_reg(s, a->rt, tmp);
+    if (!mve_skip_vmov(s, a->vn, a->index, a->size)) {
+        tmp = tcg_temp_new_i32();
+        read_neon_element32(tmp, a->vn, a->index,
+                            a->size | (a->u ? 0 : MO_SIGN));
+        store_reg(s, a->rt, tmp);
+    }
 
+    if (dc_isar_feature(aa32_mve, s)) {
+        TCGv_i32 eci;
+
+        mve_update_eci(s);
+        eci = tcg_const_i32(s->eci << 4);
+        store_cpu_field(eci, condexec_bits);
+    }
     return true;
 }
 
@@ -608,14 +666,29 @@ static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
         return false;
     }
 
+    if (dc_isar_feature(aa32_mve, s)) {
+        if (!mve_eci_check(s)) {
+            return true;
+        }
+    }
+
     if (!vfp_access_check(s)) {
         return true;
     }
 
-    tmp = load_reg(s, a->rt);
-    write_neon_element32(tmp, a->vn, a->index, a->size);
-    tcg_temp_free_i32(tmp);
+    if (!mve_skip_vmov(s, a->vn, a->index, a->size)) {
+        tmp = load_reg(s, a->rt);
+        write_neon_element32(tmp, a->vn, a->index, a->size);
+        tcg_temp_free_i32(tmp);
+    }
 
+    if (dc_isar_feature(aa32_mve, s)) {
+        TCGv_i32 eci;
+
+        mve_update_eci(s);
+        eci = tcg_const_i32(s->eci << 4);
+        store_cpu_field(eci, condexec_bits);
+    }
     return true;
 }
 
-- 
2.20.1


