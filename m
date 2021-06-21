Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58C43AEFC4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:39:44 +0200 (CEST)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMxb-0001wK-Qu
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn0-00072k-G4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmy-0007Vy-Di
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j21-20020a05600c1c15b02901dde2accccbso399725wms.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IPvyj3nuEwWon9lsaUm/iDVltXo00UpQXhVAA71IjNQ=;
 b=T3IkF0ZGzqdyZlf/1i+6RG3GUP1hb6NV976iY+bC2UyqaK7sQzcyW2+iGE23AW5qvf
 h3o7Ic2N1cU9bIHjD9z21976lTarbRLnKh9/n8HPeN3N72thd8VlrAhHTWXzPUSX96SJ
 1jC19FqnDSJ8CZoAsKThLfXBZPU11iv8AXvEASb7UVot7La4TplNlQGagVtITKoPH/vT
 b9JVz24RSYGhRexTay3rzkmyu5Sl9I8q1zIEPfnEX7qRkKGrAv/PK5Yef1kyPqbARauP
 WVJYNOiLzTI5Wxi+Yb/8US3EHP375Jn8cKhvOdp0O4DTlLc6XurXjdwmSi+L0TyhK2CM
 uDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPvyj3nuEwWon9lsaUm/iDVltXo00UpQXhVAA71IjNQ=;
 b=EcVk7NZnj0dqQVpxoAcxAkVT2yQIuZutW+TPyw8MesqufjMv8h8x1eJ4+fyRRAJRiK
 CG0ipuHWrbtlDrVzMq6P/4vsHE1vitrtq+nd5HWWBk7DSch/S7skQC0D63CMjjBddWQm
 C5wWYxOyz84FaPTngUO20gUijopZ3zyNpdHLqxnL76yQYJiliTySwJTeVioVEbSANcUG
 uB/AVvtSn9nEd7g/bFUTo/SQwuGxOLwdAvPjr5+jHtm6ASA6Fn/s5HBQ1JxiaIfc1mL4
 NNoFQfBJgzFQ7+PksS+lztvwplpGsoLgClVfR4JLmKCqC26m4/2rDNzdbS0mIxXMsScg
 1cZQ==
X-Gm-Message-State: AOAM530BR7zIDn2txZeomP4TOQsCDmhaY3NjgRNf+PSkFofXJD9zegtG
 tIJrK2FgZ5mxMMnyms0zzj37/z3S3z9JAijE
X-Google-Smtp-Source: ABdhPJwr+tdcgOwLk8J+UpYN0rC3Lhh5q1RY8R4KffqjfgmIPXD/35EnPLwt9xUUeIaygwEu7h7j5A==
X-Received: by 2002:a1c:1f49:: with SMTP id f70mr19852272wmf.57.1624292923165; 
 Mon, 21 Jun 2021 09:28:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/57] target/arm: Split vfp_access_check() into A and M
 versions
Date: Mon, 21 Jun 2021 17:27:46 +0100
Message-Id: <20210621162833.32535-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

vfp_access_check and its helper routine full_vfp_access_check() has
gradually grown and is now an awkward mix of A-profile only and
M-profile only pieces.  Refactor it into an A-profile only and an
M-profile only version, taking advantage of the fact that now the
only direct call to full_vfp_access_check() is in A-profile-only
code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210618141019.10671-7-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c | 79 +++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 31 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 85418dee2e4..d89c7834faa 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -188,32 +188,19 @@ static void gen_update_fp_context(DisasContext *s)
 }
 
 /*
- * Check that VFP access is enabled. If it is, do the necessary
- * M-profile lazy-FP handling and then return true.
- * If not, emit code to generate an appropriate exception and
- * return false.
+ * Check that VFP access is enabled, A-profile specific version.
+ *
+ * If VFP is enabled, return true. If not, emit code to generate an
+ * appropriate exception and return false.
  * The ignore_vfp_enabled argument specifies that we should ignore
- * whether VFP is enabled via FPEXC[EN]: this should be true for FMXR/FMRX
+ * whether VFP is enabled via FPEXC.EN: this should be true for FMXR/FMRX
  * accesses to FPSID, FPEXC, MVFR0, MVFR1, MVFR2, and false for all other insns.
  */
-static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
+static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-            /*
-             * M-profile mostly catches the "FPU disabled" case early, in
-             * disas_m_nocp(), but a few insns (eg LCTP, WLSTP, DLSTP)
-             * which do coprocessor-checks are outside the large ranges of
-             * the encoding space handled by the patterns in m-nocp.decode,
-             * and for them we may need to raise NOCP here.
-             */
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
-        } else {
-            gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                               syn_fp_access_trap(1, 0xe, false),
-                               s->fp_excp_el);
-        }
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
         return false;
     }
 
@@ -222,17 +209,39 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         unallocated_encoding(s);
         return false;
     }
+    return true;
+}
 
-    if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        /* Handle M-profile lazy FP state mechanics */
-
-        /* Trigger lazy-state preservation if necessary */
-        gen_preserve_fp_state(s);
-
-        /* Update ownership of FP context and create new FP context if needed */
-        gen_update_fp_context(s);
+/*
+ * Check that VFP access is enabled, M-profile specific version.
+ *
+ * If VFP is enabled, do the necessary M-profile lazy-FP handling and then
+ * return true. If not, emit code to generate an appropriate exception and
+ * return false.
+ */
+static bool vfp_access_check_m(DisasContext *s)
+{
+    if (s->fp_excp_el) {
+        /*
+         * M-profile mostly catches the "FPU disabled" case early, in
+         * disas_m_nocp(), but a few insns (eg LCTP, WLSTP, DLSTP)
+         * which do coprocessor-checks are outside the large ranges of
+         * the encoding space handled by the patterns in m-nocp.decode,
+         * and for them we may need to raise NOCP here.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                           syn_uncategorized(), s->fp_excp_el);
+        return false;
     }
 
+    /* Handle M-profile lazy FP state mechanics */
+
+    /* Trigger lazy-state preservation if necessary */
+    gen_preserve_fp_state(s);
+
+    /* Update ownership of FP context and create new FP context if needed */
+    gen_update_fp_context(s);
+
     return true;
 }
 
@@ -242,7 +251,11 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
  */
 bool vfp_access_check(DisasContext *s)
 {
-    return full_vfp_access_check(s, false);
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return vfp_access_check_m(s);
+    } else {
+        return vfp_access_check_a(s, false);
+    }
 }
 
 static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
@@ -732,7 +745,11 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         return false;
     }
 
-    if (!full_vfp_access_check(s, ignore_vfp_enabled)) {
+    /*
+     * Call vfp_access_check_a() directly, because we need to tell
+     * it to ignore FPEXC.EN for some register accesses.
+     */
+    if (!vfp_access_check_a(s, ignore_vfp_enabled)) {
         return true;
     }
 
-- 
2.20.1


