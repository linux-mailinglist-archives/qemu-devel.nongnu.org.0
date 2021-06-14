Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3E73A6B20
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:59:14 +0200 (CEST)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsozZ-0004gL-8p
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFG-0002sm-OW
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:25 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEs-0000gU-BA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id b205so7635219wmb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CuUBxqujHm8QCKa7cQqZQUkEViUoee0ETxRIxxKg5ew=;
 b=DwdxJYSc2xC9z31qTiATXVfqKmNptbtowJWxBNs/B95iilMr4yeeQaRtcJu1EB9J9H
 /bgqyNScwQDOvnBjhqp9ZFvlufhTSda/6lMqjiuS2EzJ1Td+l/l3lNUcsyBlVKWl6lLa
 NXMW/USrEvtFm4j6sLO4UOPPkDeTlIhXXw5sl8AXUR+qu6a6HV5KWlOpVvE1I70vf+Hu
 3SPrWdpKsgAuiNjsXp4YTQ9n5UfcqIsTl4u+SIAUd/2wQwLSommOGdIbp6+Zk7XxNz1+
 Dc82OP6lTewVcFAjbKqEE7EdNO8mxUQqF0WNQ1vZehoGYyddrYrRUwAqe2QuJ5UAuLnd
 LzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CuUBxqujHm8QCKa7cQqZQUkEViUoee0ETxRIxxKg5ew=;
 b=DKd7oRc7qsPvpPLv+7RYFbXLlALjfqvMsW+R0zpFHIolV3Z/095dMLayluVV4PPl65
 H7eOOXQCZa/DZ/VjOj91TT/oaHzSTKAxFSQ30sQfuAna7sUmRKcagh7t2gc6dbVB3985
 vaE99Ho3FpUdUuZvokSdavOnE2QSJgH9aRTCDMX8/gj6S8X1pW9/V8V8kYT1J58AyG68
 jZq35c/Q0H1Dnaqo9IBgud1bQ+jdfomT6Kavhv+UA+07DffUhCTFnVi58zMR9ax6RFRa
 rZQPaWCLn9qf7w66XXwHuyrTQy9gIUdfwAvBt/0vDzgqaeMu3MhFZDYvlhsNRa7g3Z04
 UYDw==
X-Gm-Message-State: AOAM532QIOsEbttl3fJIHqvPnblLjjDbzcb03h+fk463Py6gMnVmUvYj
 uF8VWAYPG0d81znlTO4wKSs/nw==
X-Google-Smtp-Source: ABdhPJx7zoBDBq7SNUv9TFJkhDMoZ3xptOTV7fFihl34doHdlhqPch8FyJSC++0PueFJDMGeCryUHQ==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr16870800wmc.71.1623683456882; 
 Mon, 14 Jun 2021 08:10:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 57/57] target/arm: Make VMOV scalar <-> gpreg beatwise for
 MVE
Date: Mon, 14 Jun 2021 16:10:07 +0100
Message-Id: <20210614151007.4545-58-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h |  2 +
 target/arm/translate-mve.c |  4 +-
 target/arm/translate-vfp.c | 77 +++++++++++++++++++++++++++++++++++---
 3 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 0a0053949f5..e160c7d42f0 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -46,6 +46,8 @@ long neon_full_reg_offset(unsigned reg);
 long neon_element_offset(int reg, int element, MemOp memop);
 void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 void clear_eci_state(DisasContext *s);
+bool mve_eci_check(DisasContext *s);
+void mve_update_and_store_eci(DisasContext *s);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 3d54ad1270a..43763e90762 100644
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
index 01e26a246d6..0bdacba394c 100644
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
@@ -575,14 +617,26 @@ static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
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
 
@@ -608,14 +662,25 @@ static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
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


