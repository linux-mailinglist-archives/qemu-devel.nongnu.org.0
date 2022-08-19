Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EB599ACF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:22:09 +0200 (CEST)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP04m-0008Hd-Ng
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkO-0002DE-I0
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkH-0001QW-Vl
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so2299140wms.5
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=rlB3te70E8fDcNZgIxgUZkmq5hKy8dXzvxbhDulIQgc=;
 b=jQwwI7ZsZYyohUGFe1oyhFvha5d7NUCU+ZFyNS549L2JAmwiV7YsSs4LfHPNdE5hpt
 Gy/QsVKdxnwpdPvpxdxJlzfF667tP6HKwPaNwq4xCuggnWA3mfv1A1bRTOXDHY/m0vAJ
 sM2GzR0aEeROPjIOG3ipdTDeO7WxJyFrNLsXIQsU6kO9dFcKUiXsr7ic7rZszHh7z3d/
 drM+NbY1r6EX/Xs/0iHgAx0aEtC20fUyG3PijnCMi8xMp8ZoM6TD0EOCDKG/6+lR05Od
 Li1k53zTJ6CR4BbQqaUlRpuLCKRKFG6sZhEYz2uWK7eH135LzGI33FjrUefeFRrjiTir
 6TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=rlB3te70E8fDcNZgIxgUZkmq5hKy8dXzvxbhDulIQgc=;
 b=x8ZHIco+Kl+23nuA7BjQBlmVem0MMC7iw+lA0Pe7zLuj32UqQKASbqNEAFKPMKSKxg
 Be69RWyBhcGM23NV1kv7/t6SHeMO1dvXS8aRJ6B+5wMyWlaW1nm9mibCG2IB6dGoZ/zX
 wo16UpCf6XNRvjBflEk10pk9AQavxigLOPSM8BpE7vb7XzKq79BEQNIqTJXMTZ39isjB
 MEmzwLeuuGLfdRFOw5wDoez7Y8YA9X05balYRKIZuZXdWvZnDocq6/on+7V3XZJvrKHH
 +FV8AK8/zwEZihwwb3WqY4Dmp31a2fmcq+1B2NCv5kAAkfYs8/ScHLnqVrtDCKr+Dc2u
 i1+g==
X-Gm-Message-State: ACgBeo0UapYqdPVCPubTosaPzT7zGQW34fGW0YnonoUACKv/QAxdjKHD
 tN8LSGgp7kYcRAaA35Fx9hIbfAD8ABicYQ==
X-Google-Smtp-Source: AA6agR4Ge7toZL9q9WrkMB4nGAB7moq1a7ZtpQ6yYQc1Cp7hxb9f4o73hFfjyJL54eU3u11FrnFL0w==
X-Received: by 2002:a1c:f317:0:b0:3a5:e38f:46b with SMTP id
 q23-20020a1cf317000000b003a5e38f046bmr4357252wmq.98.1660906856620; 
 Fri, 19 Aug 2022 04:00:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/arm: Implement ID_MMFR5
Date: Fri, 19 Aug 2022 12:00:49 +0100
Message-Id: <20220819110052.2942289-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

In Armv8.6 a new AArch32 ID register ID_MMFR5 is defined.
Implement this; we want to be able to use it to report to
the guest that we implement FEAT_ETS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837e..fcc5927587e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -975,6 +975,7 @@ struct ArchCPU {
         uint32_t id_mmfr2;
         uint32_t id_mmfr3;
         uint32_t id_mmfr4;
+        uint32_t id_mmfr5;
         uint32_t id_pfr0;
         uint32_t id_pfr1;
         uint32_t id_pfr2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c171770b035..07378519259 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7586,11 +7586,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "RES_0_C0_C3_6", .state = ARM_CP_STATE_BOTH,
+            { .name = "ID_MMFR5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_mmfr5 },
             { .name = "RES_0_C0_C3_7", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 84c4c85f405..2d737c443eb 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -643,6 +643,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
+                              ARM64_SYS_REG(3, 0, 0, 3, 6));
 
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
-- 
2.25.1


