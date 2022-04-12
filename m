Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6AB4FC953
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:37:44 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4XP-0005gR-34
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TN-0001lQ-Ao
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:33 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TL-0001my-PP
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:32 -0400
Received: by mail-pf1-x42f.google.com with SMTP id cj5so269604pfb.13
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/hGWeYYiNWRormK6+Z3WghHxlA4vi4CjIBFLwBE3yec=;
 b=qAOQC5ia4f0xUXaZ4GpZ+XwLxJuROMspCPRDC+Ujf1EoyrcumETjX/1nXC1Jnuj8Id
 8+/VsWoZQbrNzS1eXSBNkuRp3eS5fKBSq8Ll981k0EEax4XoJsd+oIqdDqLrpASV+qP5
 A6mua8L66EO3NBUILTLqouo+zE0SaH3juukp30vmjKa0gfAmD2yVR6qwPbhrKgj1YlgG
 MLNOBq9v21hu4FR0Ilrma/VKej57og3iLx5JXmDyLv2c8anVhYojkQnjNRocy2tKZ4Uy
 Q70Izksa+h7NoL3pJJNglFv5jbSKh0ZNhT5tNpTuidsqCsKTGj3EI3hKPvnuQ3fely3u
 Gm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/hGWeYYiNWRormK6+Z3WghHxlA4vi4CjIBFLwBE3yec=;
 b=mV/6fNpljThwIrL/qLvpPIEF6yfn/1ULmJc577mEdHaGwe/8jkdN135mOekd8PI+zo
 0nnrEmPPtN5gT7nzcSeaaiM74zGuXATRBc1NjYL8L4bPH0zGfsgX1pBDgKyeK3kmgCaC
 1PF/Q2XMoLwfVkBZY4yt2PJCFBTKWyfVMVvxLPvmLHPE6TmPILUXsnOTTGjbiNcsHzfA
 8MRbdu+7fEtmY3Nn7Kj4SzTO4BL2XgVlp1UdU1kp8HIz7lOlXPgg+/ViQyaa0ElsCLmp
 WVfRHVxouF+1MH60cKY6uFNCj7UxQqlp3g08O6qBswkWmshac4VO3CRDvgX+sqNvX48L
 TrMw==
X-Gm-Message-State: AOAM533IKQHSvVfDt/BlNtfLYyEwCUrcAdtHAPOeRwWNKa0k8gaQdeeL
 laKE7tyXmqcjhgp2Vf1bm8OqI+QV0wGppw==
X-Google-Smtp-Source: ABdhPJwefxCUqyVX2DcoLjFjqqk29JXj4t5JT16qaBofOLOhZWGk7ChbhzqIyo4GjZf8pECRcen13g==
X-Received: by 2002:a63:581d:0:b0:39d:5138:1ce2 with SMTP id
 m29-20020a63581d000000b0039d51381ce2mr6585338pgb.621.1649723610531; 
 Mon, 11 Apr 2022 17:33:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/24] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Mon, 11 Apr 2022 17:33:04 -0700
Message-Id: <20220412003326.588530-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This register is present for either VHE or Debugv8p2, and is
RES0 from EL3 when EL2 is not present.  Move the definition
out of vhe_reginfo and provide a fallback for missing EL2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d14650615..210c139818 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7443,11 +7443,20 @@ static const ARMCPRegInfo jazelle_regs[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo contextidr_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW,
+    .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2])
+};
+
+static const ARMCPRegInfo contextidr_no_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0
+};
+
 static const ARMCPRegInfo vhe_reginfo[] = {
-    { .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
     { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
@@ -8443,6 +8452,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_vh, cpu) ||
+        cpu_isar_feature(aa64_debugv8p2, cpu)) {
+        if (arm_feature(env, ARM_FEATURE_EL2)) {
+            define_one_arm_cp_reg(cpu, &contextidr_el2);
+        } else {
+            define_one_arm_cp_reg(cpu, &contextidr_no_el2);
+        }
+    }
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
-- 
2.25.1


