Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6C51C8B9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:11:48 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgt9-0001Lt-7V
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYS-0002Xe-JC
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:24 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004NS-B4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:24 -0400
Received: by mail-oi1-x232.google.com with SMTP id r185so435561oih.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=VGvGo1B3u/KAzEvHca8v0UxU+Vr1yFXmmzyqe9nxGXiLaKaBjhInogR1eJOr/fNXoA
 0ya6ZrtXvq2JUvahAvb3lUakQbkSX/yEUdPC/Wl6/Rp+cqAkZ+fPZhBdeun+W29VlEbh
 A0HthL+domZv8nIA/73dF9DvCQVt+cADVw3vzg1KEqdt8V0etzsI/i+B3XGc8jnhCo42
 NdvZ5xgpq6Zft9J9svmVFhpscG9HAUBe8cz7MHnMt2UtlSEmiq0AxxQh9KskRKuHUt2T
 br1sRH4vVuF6V+auygk4QfOBOtCvQFWLV254Vn1BN9SGe3EJIFwCi9+zZveQFVi+czb+
 RIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=jPQJ95X0jBPaSN2UY2q5OPbg807hSh9pB7Kcz3hs69OlW9c8IaBtHweSDZDlGe8KjW
 GTaAzd1GTpcCzVzoqWx+W7ctiVJDgyFqAbZu141z4n+T61dL+OJKWgNVEf3DZd0unA4H
 Z4HIi9EBrzQvaphTDe38dFDP4E2EjjifjilYw+KP3MDRfMa0fpn9I64dgTLZpSANeCVC
 HnenbOL+Z0rqvbzsj2k/6BOfYGL2+m08euR/LiRvAoki/F/0TXSJCZmQCgesKpZCUJxP
 FPpM/f7CFAb6+JylIxmawv6/3ZARETadHpiOfAxNP0jHZHB5mrlOArTcsnO5yhIA5pbq
 tkOg==
X-Gm-Message-State: AOAM532coQv9Ubh1aB7KVYfk2bIg66WXjPW0UepIyrHeYcnl51Cvgbd7
 /us4UjG11WBH1U4risZ1VizhO4Us6ElOJkuI
X-Google-Smtp-Source: ABdhPJy4muly8J93MIAuCDTysqnwf8tHzFB8kQG7Ah2JyzvrPJez27OftUAqRGqXvYvh7Z8oEhjjsA==
X-Received: by 2002:a05:6808:230c:b0:326:4acf:1517 with SMTP id
 bn12-20020a056808230c00b003264acf1517mr3123716oib.117.1651776614164; 
 Thu, 05 May 2022 11:50:14 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 04/24] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Thu,  5 May 2022 13:49:46 -0500
Message-Id: <20220505185006.200555-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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

This register is present for either VHE or Debugv8p2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72d05070f0..7b31c71980 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7246,11 +7246,14 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
+static const ARMCPRegInfo contextidr_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW,
+    .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2])
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
@@ -8215,6 +8218,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_vh, cpu) ||
+        cpu_isar_feature(aa64_debugv8p2, cpu)) {
+        define_one_arm_cp_reg(cpu, &contextidr_el2);
+    }
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
-- 
2.34.1


