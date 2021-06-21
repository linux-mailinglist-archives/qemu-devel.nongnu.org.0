Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A578A3AEF37
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:34:56 +0200 (CEST)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMsx-0007S8-MW
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn1-00073d-2P
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmx-0007Vm-NE
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id k42so9059140wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MgLjZC69VI/ckX1IDBh/fnvJmjLjBOurOUWCg9xqgmY=;
 b=cduYtt63VGB7sF0AHWXOSsN9m0keMYcZDevZbjt/tzdDK+0M/yVkUIKIsltMxTV85t
 +ZreJ4SY2OiF8odMGthZbM1jC6Tu3b5NRnmrt4qAEO+8sKBgGP+qDvUcnr2oFm6k0xYP
 +zh/5iTTOxxf4ESa414ABlwYqxP1pEpgV8V6QW0d7Bd6cxNN8WEbtHJLu95p+6lnNd7l
 WaBkLibQOgALC/pS2bUwyisyl2D+KQcTPBFP3GPu3QG8JeyNG7+pGscELhCMcFsL51hS
 zZbejeLOseNWHKyfOqUrb9CspFEFfUJHvicZOE9T/5JbZiZ3t71ZHh1hSR8TYTttQheW
 oQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MgLjZC69VI/ckX1IDBh/fnvJmjLjBOurOUWCg9xqgmY=;
 b=GZNQy85nEPmevT0Nv+4stgwQjv8eE7imyuiOOLQ8HivrLA9E3I9i5Rgf69L3ACoUlJ
 jdWkSIn7Sfpw/qetutJUo6Aqx5Uk7t+qBRCAO2uK3lOvCWmfHBsEcraxFkBw8XpaLsr8
 5Bjudmvstd1jaEkaxOHrrY7qNaL+s3oV19NZLJA3nJxCCIFWW0NNWgabYuxb6a6yqwEZ
 YQIryg3rAA8NHj+BvY0ziyh6HOPYGCKagrnqZJM7Cp5l/l9oAXQk/J8BOt/50lDunV9o
 nC4rJexrRyjteIpHqUboeQT6kAuq98XhNHZCHakUQtdkpak9QxNJDTEYdT1tC5+UMqWJ
 yc6Q==
X-Gm-Message-State: AOAM530eYDOaVBidlg9LAITihwUUvyvg0n0nERLsguCrV2jMSbCcJn5U
 KDWVMNEwJibk/1uYF0s+JMXC5DCScTMXHOk9
X-Google-Smtp-Source: ABdhPJy/+UPfjfa7LkCGuN9qvkaj8dJJ9/YOS0ljFNwfxmXI0QT5LVvp2pd1hh8GJjBLyWj9SIU2HA==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr28225704wmb.72.1624292922392; 
 Mon, 21 Jun 2021 09:28:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/57] target/arm: Factor FP context update code out into
 helper function
Date: Mon, 21 Jun 2021 17:27:45 +0100
Message-Id: <20210621162833.32535-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Factor the code in full_vfp_access_check() which updates the
ownership of the FP context and creates a new FP context
out into its own function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210618141019.10671-6-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c | 104 +++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 8987ef2e5b9..85418dee2e4 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -131,6 +131,62 @@ void gen_preserve_fp_state(DisasContext *s)
     }
 }
 
+/*
+ * Generate code for M-profile FP context handling: update the
+ * ownership of the FP context, and create a new context if
+ * necessary. This corresponds to the parts of the pseudocode
+ * ExecuteFPCheck() after the inital PreserveFPState() call.
+ */
+static void gen_update_fp_context(DisasContext *s)
+{
+    /* Update ownership of FP context: set FPCCR.S to match current state */
+    if (s->v8m_fpccr_s_wrong) {
+        TCGv_i32 tmp;
+
+        tmp = load_cpu_field(v7m.fpccr[M_REG_S]);
+        if (s->v8m_secure) {
+            tcg_gen_ori_i32(tmp, tmp, R_V7M_FPCCR_S_MASK);
+        } else {
+            tcg_gen_andi_i32(tmp, tmp, ~R_V7M_FPCCR_S_MASK);
+        }
+        store_cpu_field(tmp, v7m.fpccr[M_REG_S]);
+        /* Don't need to do this for any further FP insns in this TB */
+        s->v8m_fpccr_s_wrong = false;
+    }
+
+    if (s->v7m_new_fp_ctxt_needed) {
+        /*
+         * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA,
+         * the FPSCR, and VPR.
+         */
+        TCGv_i32 control, fpscr;
+        uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
+
+        fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(fpscr);
+        if (dc_isar_feature(aa32_mve, s)) {
+            TCGv_i32 z32 = tcg_const_i32(0);
+            store_cpu_field(z32, v7m.vpr);
+        }
+
+        /*
+         * We don't need to arrange to end the TB, because the only
+         * parts of FPSCR which we cache in the TB flags are the VECLEN
+         * and VECSTRIDE, and those don't exist for M-profile.
+         */
+
+        if (s->v8m_secure) {
+            bits |= R_V7M_CONTROL_SFPA_MASK;
+        }
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_ori_i32(control, control, bits);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        /* Don't need to do this for any further FP insns in this TB */
+        s->v7m_new_fp_ctxt_needed = false;
+    }
+}
+
 /*
  * Check that VFP access is enabled. If it is, do the necessary
  * M-profile lazy-FP handling and then return true.
@@ -173,52 +229,8 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         /* Trigger lazy-state preservation if necessary */
         gen_preserve_fp_state(s);
 
-        /* Update ownership of FP context: set FPCCR.S to match current state */
-        if (s->v8m_fpccr_s_wrong) {
-            TCGv_i32 tmp;
-
-            tmp = load_cpu_field(v7m.fpccr[M_REG_S]);
-            if (s->v8m_secure) {
-                tcg_gen_ori_i32(tmp, tmp, R_V7M_FPCCR_S_MASK);
-            } else {
-                tcg_gen_andi_i32(tmp, tmp, ~R_V7M_FPCCR_S_MASK);
-            }
-            store_cpu_field(tmp, v7m.fpccr[M_REG_S]);
-            /* Don't need to do this for any further FP insns in this TB */
-            s->v8m_fpccr_s_wrong = false;
-        }
-
-        if (s->v7m_new_fp_ctxt_needed) {
-            /*
-             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA,
-             * the FPSCR, and VPR.
-             */
-            TCGv_i32 control, fpscr;
-            uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
-
-            fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
-            gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-            tcg_temp_free_i32(fpscr);
-            if (dc_isar_feature(aa32_mve, s)) {
-                TCGv_i32 z32 = tcg_const_i32(0);
-                store_cpu_field(z32, v7m.vpr);
-            }
-
-            /*
-             * We don't need to arrange to end the TB, because the only
-             * parts of FPSCR which we cache in the TB flags are the VECLEN
-             * and VECSTRIDE, and those don't exist for M-profile.
-             */
-
-            if (s->v8m_secure) {
-                bits |= R_V7M_CONTROL_SFPA_MASK;
-            }
-            control = load_cpu_field(v7m.control[M_REG_S]);
-            tcg_gen_ori_i32(control, control, bits);
-            store_cpu_field(control, v7m.control[M_REG_S]);
-            /* Don't need to do this for any further FP insns in this TB */
-            s->v7m_new_fp_ctxt_needed = false;
-        }
+        /* Update ownership of FP context and create new FP context if needed */
+        gen_update_fp_context(s);
     }
 
     return true;
-- 
2.20.1


