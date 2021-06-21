Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE93AF1C9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:19:44 +0200 (CEST)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNaJ-0008J7-Tk
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnh-0008KW-J0
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnc-0007pG-Fu
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:29 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m18so20388056wrv.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7aGajrBzXELbWBHFm+0iHnjamqVXc32gyW/y/78R7c0=;
 b=piuuYQ1c8kb7b3n7hrvZsRAmZmwciEaz9EnngF+lAnwP8mqJHxUIXVxuFOGn5uknCF
 d4uBsu5og01D0d17dK3AfOxXbaKnbfVhzWJNB2ICbsWIUFlUGJ3vb+PWcM6JFu9WMjfw
 YUz39iwt+d5L95eB5TBwDljmwwZsfH2O2mYGW4xwPUffs6XK8Uq5LHAvMFx8czHKm3k3
 oyhwt3rFVTdsLl2sqSCxaspUwK7yiWg11Klq30XU+MG/yJwZlCJA8QamL3nIHlaJ5miG
 +hg6P+eBLYZrnN8yava07pNXzd4+nLMlEoRI7g2QbFJoAv5oSkioeXdP4BWMacSia3OU
 YZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7aGajrBzXELbWBHFm+0iHnjamqVXc32gyW/y/78R7c0=;
 b=ijUmwVmz2+EgkIo2omDC4CcJqE7Qx4qx0eJpgkH9OAM9f4A8TpLmtTPWHsCmiPwCZd
 bJlJFRNbGhuNXuv0isv+OMhQfDFafeRx5khT9Pd4Rb0PxwIfbPnMsuCqnoqRf+IEmFuZ
 FYDpvXAbgtH66IIz0uZgcfVXaruSRmmBC+05AJ1jZbT1/7JAEaUC4hrD+g2K+tbmVsNl
 DZYRx0fjHHoraGj/H8gnhPmKPh2Mk7dpvB4E7AqHMgXhuoGn6piaiWBLv1nHZU3eLbsi
 jAiMc+Tp4TowQDzwmW9GxjR/41+JF8OQIONOBTLJrDOYMkgMjJUTIVuICNr0t/xNh/nZ
 O1ow==
X-Gm-Message-State: AOAM533KutU9ka0Vn5S+bCJ3g1gk8Krka5JGMnSNlj0Re5I1mvc7xqm3
 u3oEJTEY7bHN8vq3ef9EQs6jPfyHSq8ObCvL
X-Google-Smtp-Source: ABdhPJxjghYx/EzCtTzTedcCCfv7xTbzTge4XPsejhS7vaR3H7yjHjcBfHsYcZOXsXQ375zX901G/A==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr8605295wrw.240.1624292963288; 
 Mon, 21 Jun 2021 09:29:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 55/57] target/arm: Make VMOV scalar <-> gpreg beatwise for MVE
Date: Mon, 21 Jun 2021 17:28:31 +0100
Message-Id: <20210621162833.32535-56-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-45-peter.maydell@linaro.org
---
 target/arm/translate-a32.h |  2 +
 target/arm/translate-mve.c |  4 +-
 target/arm/translate-vfp.c | 77 +++++++++++++++++++++++++++++++++++---
 3 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 23264053006..6dfcafe1796 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -47,6 +47,8 @@ long neon_full_reg_offset(unsigned reg);
 long neon_element_offset(int reg, int element, MemOp memop);
 void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 void clear_eci_state(DisasContext *s);
+bool mve_eci_check(DisasContext *s);
+void mve_update_and_store_eci(DisasContext *s);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 04d84e88461..67462bdf27d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -57,7 +57,7 @@ static bool mve_check_qreg_bank(DisasContext *s, int qmask)
     return qmask < 8;
 }
 
-static bool mve_eci_check(DisasContext *s)
+bool mve_eci_check(DisasContext *s)
 {
     /*
      * This is a beatwise insn: check that ECI is valid (not a
@@ -91,7 +91,7 @@ static void mve_update_eci(DisasContext *s)
     }
 }
 
-static void mve_update_and_store_eci(DisasContext *s)
+void mve_update_and_store_eci(DisasContext *s)
 {
     /*
      * For insns which don't call a helper function that will call
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 86e43c02dcd..b2991e21ec7 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -581,6 +581,48 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
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
@@ -603,14 +645,26 @@ static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
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
+        mve_update_and_store_eci(s);
+    }
     return true;
 }
 
@@ -636,14 +690,25 @@ static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
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
+        mve_update_and_store_eci(s);
+    }
     return true;
 }
 
-- 
2.20.1


