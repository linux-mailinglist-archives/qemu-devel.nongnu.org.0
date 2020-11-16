Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101682B4A8D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:17:40 +0100 (CET)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehCF-0007Xu-0r
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3j-0000HW-Sn
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:51 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3h-0007uP-Up
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m6so2089666wrg.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5URRqI2Uq5Oefocw0RaK3NP6xNImZJ6yO5PhF2xMruc=;
 b=JxEeSDAYk4z9qhN8UxPH2ARPR/BxXTLpHOI/tjuBAndRPZ+m54neCaOeyTwNZbGspT
 Xe5i9MjF2vstH3UYzJsJ6c9wS48QDuhJKn+JVhxuLiMgD3G+C6pONEEhWlfsETLLfznB
 9J/MX36Qw2FxSwppyr8pWEdoSLgeEfIys1xps10wnd1T8nMDZR7O8VtfW2HgRp/K0/7b
 5xpee2wtZ0odVsK8NEdQgs7Oy61iw3Yi6JHv1ZC3m5VyOVpKy+zLBgAND7M501PwNhb6
 pZaU/tQyi253j5u4g8C1X9ecM7HFVfR9WJPwcDwuWosOEwYtFNnLFYPmj/y6UhSVgtrg
 jG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5URRqI2Uq5Oefocw0RaK3NP6xNImZJ6yO5PhF2xMruc=;
 b=dBE05NNQn/jgIGfeEDADTKvGAdoqVFPzP+OnkNd1R97a4GfRS3f621sCCckNm1ohbw
 LxCC0cl1RBLpEQZ1lgPEKZBxWzkkSYn9bkdGOerCtA7c+r1uJrJyyyxQz2WvqI5y+jIn
 x0DfOzypJ65lJE6P6r3NDUwnjsFjFhFhxk5nS7LSBz4VKFjIewePnfGj27+bXhCHtLss
 H7lO5zJYq51S+702rMJwkA5wy+D4M+iGkGAnELFzIT2GO8l7Bmxcu38+AJQ104yWpAD4
 fJhBw2q69qTJ/xGJqS5D1Cmb0hPCzn9aWa9E87+OBun+TtSLLNyB1VG7SsGBwiCQWIfp
 D4/g==
X-Gm-Message-State: AOAM5333Up5AfZOIgiYtnE3xAQdh1bPGLnEpr/IpKy5ZjM8wrXwPN6ab
 XQhf90+/lkSGUMI2Bv2RrITxfzV0BCQ2EA==
X-Google-Smtp-Source: ABdhPJy4kT1qoVBKV+DO0d45wYE1yaYrFedtarkzA/aumowjDBt5TxGhSY9LIyqDt8T05xSe40V9Hg==
X-Received: by 2002:adf:f546:: with SMTP id j6mr21353805wrp.219.1605542928517; 
 Mon, 16 Nov 2020 08:08:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/15] target/arm: Factor out preserve-fp-state from
 full_vfp_access_check()
Date: Mon, 16 Nov 2020 16:08:28 +0000
Message-Id: <20201116160831.31000-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Factor out the code which handles M-profile lazy FP state preservation
from full_vfp_access_check(); accesses to the FPCXT_NS register are
a special case which need to do just this part (corresponding in the
pseudocode to the PreserveFPState() function), and not the full
set of actions matching the pseudocode ExecuteFPCheck() which
normal FP instructions need to do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 45 ++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 1ccaccbc834..6bc07992eb4 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -83,6 +83,32 @@ static inline long vfp_f16_offset(unsigned reg, bool top)
     return offs;
 }
 
+/*
+ * Generate code for M-profile lazy FP state preservation if needed;
+ * this corresponds to the pseudocode PreserveFPState() function.
+ */
+static void gen_preserve_fp_state(DisasContext *s)
+{
+    if (s->v7m_lspact) {
+        /*
+         * Lazy state saving affects external memory and also the NVIC,
+         * so we must mark it as an IO operation for icount (and cause
+         * this to be the last insn in the TB).
+         */
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            s->base.is_jmp = DISAS_UPDATE_EXIT;
+            gen_io_start();
+        }
+        gen_helper_v7m_preserve_fp_state(cpu_env);
+        /*
+         * If the preserve_fp_state helper doesn't throw an exception
+         * then it will clear LSPACT; we don't need to repeat this for
+         * any further FP insns in this TB.
+         */
+        s->v7m_lspact = false;
+    }
+}
+
 /*
  * Check that VFP access is enabled. If it is, do the necessary
  * M-profile lazy-FP handling and then return true.
@@ -113,24 +139,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         /* Handle M-profile lazy FP state mechanics */
 
         /* Trigger lazy-state preservation if necessary */
-        if (s->v7m_lspact) {
-            /*
-             * Lazy state saving affects external memory and also the NVIC,
-             * so we must mark it as an IO operation for icount (and cause
-             * this to be the last insn in the TB).
-             */
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                s->base.is_jmp = DISAS_UPDATE_EXIT;
-                gen_io_start();
-            }
-            gen_helper_v7m_preserve_fp_state(cpu_env);
-            /*
-             * If the preserve_fp_state helper doesn't throw an exception
-             * then it will clear LSPACT; we don't need to repeat this for
-             * any further FP insns in this TB.
-             */
-            s->v7m_lspact = false;
-        }
+        gen_preserve_fp_state(s);
 
         /* Update ownership of FP context: set FPCCR.S to match current state */
         if (s->v8m_fpccr_s_wrong) {
-- 
2.20.1


