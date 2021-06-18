Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38153ACD69
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:19:48 +0200 (CEST)
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFLX-0004YB-ON
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCu-0007kK-N1
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCW-00021Q-1b
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id b3so680198wrm.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s+/OW/sFe2egCGOmpvnbQvn6rHu2TjvlR2dS4FiM/Es=;
 b=xVS0gbG06NwDSpb+gjm5ECyaDk+hbPjjXM7p23bOAQJJ65HLKnWQJ3wFDbtmGuPC6c
 OBj/qz8Hrh9UQy8LdTeeNvvDib39AET33++an0HMpv2+TvzkmQ5SEJII6ntgO5r0dk99
 bc1+zJxM2p0s+d+L4US2gQPohd+qs+/ZpMuqZH1E53xiQ/0nZgoOBFhUZidOuqdi35te
 WWAa6a/rvs866+faDWMkkSE7lenHXxWUQu6er7fOTIipdyXiQkzUsmXbccCxba7QgEJP
 BWLoxCsev8fUycycxLvB75Py5eRBnKEBHpL3HuTnKxZY8q6wtUtR2VWIUCuDjWxW+7ys
 hnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+/OW/sFe2egCGOmpvnbQvn6rHu2TjvlR2dS4FiM/Es=;
 b=nOm/el8YOHoq4Go8WJap4/M2bo4Be0KYQV0umTn3/kvNa1WCoftdoZuqzVs5Z5XhnF
 2THxtw0xiSXvPtC3VxZtUsKSTRZ91l6pguxcTfb/cyZPseD1naYZMMV+8Y48TBkHjjJn
 /hAGCiSeHusFYy62bHt+7IXbqW2atJzti+xRSndgbPS/1dZRUNs9e1ObB52I5cvUxP98
 e35nspgUpKfd6WIZdIGP0jQoQ5Bwuw6gzLNVP/hQj0gE8dR7YQukTOiADHzRdKW1zqLE
 bzcFq269pe0SkSOVatDQo5NRY8ecqzVvzyENwEgUSDxqCqjBSuom9J6FzagxujaGd2XT
 Mqbg==
X-Gm-Message-State: AOAM5333PFh/XCsF7hVlwHhdOwE06X/1eXumbkfnvBzvC5phEHGJ511u
 jpTRok6k8AGJHpkmmo2Qkr4tMiYjTQ+E6cn7
X-Google-Smtp-Source: ABdhPJy2tL1+g8uAcKhAkc3PRW8RdFJSjbXBB07NBsboGH5fQWoFwd3Atnl4H+jt3rLuqJoShPrbAw==
X-Received: by 2002:adf:e948:: with SMTP id m8mr12791619wrn.205.1624025426812; 
 Fri, 18 Jun 2021 07:10:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/arm: Split vfp_access_check() into A and M versions
Date: Fri, 18 Jun 2021 15:10:18 +0100
Message-Id: <20210618141019.10671-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vfp_access_check and its helper routine full_vfp_access_check() has
gradually grown and is now an awkward mix of A-profile only and
M-profile only pieces.  Refactor it into an A-profile only and an
M-profile only version, taking advantage of the fact that now the
only direct call to full_vfp_access_check() is in A-profile-only
code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


