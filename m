Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417955BE53
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:02:16 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63Mb-0003bA-Mt
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kJ-0002iD-Eb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:39 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kH-0003us-OI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:39 -0400
Received: by mail-pf1-x430.google.com with SMTP id a15so10860111pfv.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMHowAe2qqOcR59WIhFIt7ar7qrWdpcyRnVo7s79wDU=;
 b=M2VRsroE7qD9F2EoJaW/fOsPoy0uGgP2yzBaCecTaKYiZeb1uKLOyWq+O2N79SzT01
 h8Y/lvnnHHKqayXwDmceSGXdMmILMvadNTRZYWZa00Bv/HhkMSunNidW0HHjXk7cyt2d
 JeolNr/+F9hndx5bMvMP8VcmDAPm6EJOkhpi0JOCz/iDQ3SjXsTdWThDJQX70ajT41CE
 b+lVy9BBkKv7FY4M6ykXMTOj7tziQbPnTdF/FUmi8j3+qXXD4iIN4sVOAtMOtb/ncDlU
 CkIgjMJ4TYyyka0eYyV5vGyRPgNDDp6Pni9zPOi3kLYCalDgdZ1XNwlrCoxRA4VmMUkw
 4OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMHowAe2qqOcR59WIhFIt7ar7qrWdpcyRnVo7s79wDU=;
 b=opKi8w+bwQlJgJxyhRNR+3cOnavBAyIQdKTvgCgyBK7IePEDFV11AZ0ZZWBjXc8ChU
 apAhu58fQdgz2rQYchUR/NXERoFZuVQ9TV6xc/PurP+vL58y49j3+z6wLFmvAasFAO7Y
 7OfbdvgC3dPm49RXz1Jvz2w0MWbipeIiEAd7dmKygMtjE1tED6Wcj6NE1CVJWG8RbewP
 8nRoC67vXja6Gs5EqUqIv0OQXFvKoE7gCZoU543GwMbth1RfGq3RxVYX1o8fd0Mlrmna
 NgOh/5jYVWVK+v1nPlUzc03bUvd+yA00AgDxGedNE5zvVjBgkvZGPm9rmcZNfASwvMOq
 8fxA==
X-Gm-Message-State: AJIora+nFDjGwrTdJsz4cZctJcWBwyfQVoWGcQ7zTQ4tA/nvYzBCzgDl
 KlYrL3z2MTXK5mFj+g6B/5SSOSLhIbm1LQ==
X-Google-Smtp-Source: AGRyM1uvCtRhgncLYqYeVyt2/WxXR+3MjEV6++hnIq23Q4SbKY3dsKy27y/ipQ6T8Qt0ckq5DGDzaA==
X-Received: by 2002:a63:7a49:0:b0:40c:ca38:aed7 with SMTP id
 j9-20020a637a49000000b0040cca38aed7mr15981612pgn.11.1656390156422; 
 Mon, 27 Jun 2022 21:22:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 31/45] target/arm: Reset streaming sve state on exception
 boundaries
Date: Tue, 28 Jun 2022 09:51:03 +0530
Message-Id: <20220628042117.368549-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 976e414eda..2dc1f95c6d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -11766,10 +11779,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1


