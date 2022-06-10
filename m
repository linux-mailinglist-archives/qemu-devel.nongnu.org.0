Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A0546A2B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:14:51 +0200 (CEST)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhHe-0002hX-U0
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAq-0007PM-QL
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:52 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAp-0007F1-8a
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 i131-20020a1c3b89000000b0039c6fd897b4so881456wma.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lH6ItysORPPk9UTIkMgi6tmR9z/veGNwlpK6Zu3O9R0=;
 b=U5BQCklR3C5nw+ecKSDKx62WrwVCFuVzLAyrbjGp6epsXjicE91AhQk34+y283i0Em
 sFr5K6+R5DtnBaffz3vGFWfltZHZpvNlM4JeftwbHODRkuuiuZNxkskaVIwpFtZa1Sz2
 ECuoiNXjtWyDxB32bZhhdI3LFFo7wJPMGL27GmoktzoECLTHhFw3CVVe2VEhBcTJRiU6
 ve4lruYsVHnQ3lyfcn4Qc5oAzSv6ToahTmGKyLBlbGl2+mAvH7xCiw+k0Nq6K8XH6tuk
 BJsRX0rFE7No4oS7lCHEaaIj0Fj4AvutavXH/1jQHHYrxnHAuu2aSs8hzkeZ3jMfXUat
 EAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH6ItysORPPk9UTIkMgi6tmR9z/veGNwlpK6Zu3O9R0=;
 b=jLSHX5+ZWrOS1FiG8tgppAEsD70vQ8JxVOfUbC6AoIk0UaZns+ggvISPK0SNf8gNPq
 7Ej/W3kzOnIBYPyjAzBcjePgfGPSWRX6mSMo+j/x9gJ59VuXkN2qXZVGzGPN/qe38G3X
 gq8DoDu44pTHcn/t6txnBnkJwz6T18kGbi1zXw4S3fMkB+7Ihsmbmk2HP86HIcNvLEQR
 wfjVGwMZFf2v7Tn8l3cndfNvic7rqIc79G5trPFp8mqPFMIRfWPp1CtFZBzow53jEy+u
 9q2LCp16W3Nns7dVWhLmrE649f6/lY3elSKdE6oioFRZGzsuiNRUrkw+1K/2+IZqWmje
 9Rrg==
X-Gm-Message-State: AOAM5314ccSqkPyreF8XFy3mFPmPQJvB2NFo2Bzl9NCQ/Lgdfu16KBNu
 BWYvOTdaSnpGmmOg5GMw+2UnIpy2LPoafA==
X-Google-Smtp-Source: ABdhPJwwmLd8ANt5Nbzt+JMZNiII8Pnfyz4wS3v6Niy/X05Xe8TiCx66t/ZDNbHbVJI0He0x2ELkQQ==
X-Received: by 2002:a05:600c:2d16:b0:39c:4d18:f77 with SMTP id
 x22-20020a05600c2d1600b0039c4d180f77mr479728wmf.146.1654877265380; 
 Fri, 10 Jun 2022 09:07:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] target/arm: Move arm_singlestep_active out of line
Date: Fri, 10 Jun 2022 17:07:14 +0100
Message-Id: <20220610160738.2230762-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Move the function to debug_helper.c, and the
declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 10 ----------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 12 ++++++++++++
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 78dbcb5592c..bb1dc3289a2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3106,16 +3106,6 @@ static inline bool arm_generate_debug_exceptions(CPUARMState *env)
     }
 }
 
-/* Is single-stepping active? (Note that the "is EL_D AArch64?" check
- * implicitly means this always returns false in pre-v8 CPUs.)
- */
-static inline bool arm_singlestep_active(CPUARMState *env)
-{
-    return extract32(env->cp15.mdscr_el1, 0, 1)
-        && arm_el_is_aa64(env, arm_debug_target_el(env))
-        && arm_generate_debug_exceptions(env);
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index af9de2dbe52..64e2c1dfad4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1325,6 +1325,7 @@ bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
+bool arm_singlestep_active(CPUARMState *env);
 
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 46893697cc7..1abf41c5f85 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,6 +11,18 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/*
+ * Is single-stepping active? (Note that the "is EL_D AArch64?" check
+ * implicitly means this always returns false in pre-v8 CPUs.)
+ */
+bool arm_singlestep_active(CPUARMState *env)
+{
+    return extract32(env->cp15.mdscr_el1, 0, 1)
+        && arm_el_is_aa64(env, arm_debug_target_el(env))
+        && arm_generate_debug_exceptions(env);
+}
+
 /* Return true if the linked breakpoint entry lbn passes its checks */
 static bool linked_bp_matches(ARMCPU *cpu, int lbn)
 {
-- 
2.25.1


