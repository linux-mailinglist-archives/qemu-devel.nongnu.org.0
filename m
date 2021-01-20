Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9B2FDB13
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:46:07 +0100 (CET)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KMg-00018P-72
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2KKl-0000Yl-1s
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:44:07 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2KKj-0002gL-7s
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:44:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id b5so2985178pjl.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67xzIqyo2tBpv4YQ+6Pg2E90WdIC5doQl/LnYiN3APs=;
 b=jTd1ASasOnKExLWRKQ9Bf8Y2hChy2ZiM3l4T60jCBUGcZk9AyuffMEdXyZNChRYfdt
 UA5igoVX2OF86ywqKkxY/fX6gy/Xn6Ni4zUv1OAo/9i/dyr1W1dCf6UB1AR7W1bZuUk8
 IHL9GAmd6143DaSU5lFxStWIsQhC4vdgNqeXpoo42dpxSqPKGerL5J94mVqa850voN3y
 d8m9lvrveFwL8VRh69llsvgsgPZjtguycpTDhFj2i/RzCybdPwflSXV8Q5/Unnm5KQ1i
 2ceNK0F8FXXtJZKO5MFNW2apCcZGxRPSbuY29LZ4pYUAAEDsZqayMfCk18liBu7rpUiv
 mgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67xzIqyo2tBpv4YQ+6Pg2E90WdIC5doQl/LnYiN3APs=;
 b=NEjzE7JOoarm+LlnxCvt7jh4rYnBtu3Mpw2qLl3QFRTDlEKzXIiBhWq58jP1esu8Dv
 G5lhW0Y/dWWxPUlF1sZEItr90WanL+f4XGDr/1/yGy57vNXY3EwNWsqZ9gcqJOeaWfed
 yWwUcxU9zhgc9mjUGqhJWtcfG48WeUy39y6a7VBeEADScOlQWkrFUWvc4sfTBzMrPLuJ
 ZWOfUALSMy4pBKNffAbGF6O/UZZZNxU2anaXvArKtqZJJIhHgiWXXbF5ewPizyyah1AY
 h4Se5gUxULCJW7eCKi+4kILhYwYJfeGiReswgTc5k8bxAaWMxdB9aLbn2fJpr735wSAQ
 gD+g==
X-Gm-Message-State: AOAM531m7q8kGBXdmxsktJTVTwXOD6/Urip7VoMJvqINP2/yhXNCO+UI
 jcqzUYYT+c4/v9sWy1oSAxXimdz/cNwGAg==
X-Google-Smtp-Source: ABdhPJxnzgBLqBm2Ciattdb8roG66VGvWtp8OcVKzg7CHIjZyXMEPdpZdway2wAMy/l3AgUpM0lCXw==
X-Received: by 2002:a17:90a:245:: with SMTP id t5mr7792172pje.89.1611175443657; 
 Wed, 20 Jan 2021 12:44:03 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id f22sm3275183pfk.179.2021.01.20.12.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 12:44:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/arm: Implement ID_PFR2
Date: Wed, 20 Jan 2021 10:44:00 -1000
Message-Id: <20210120204400.1056582-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was defined at some point before ARMv8.4, and will
shortly be used by new processor descriptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update for isar changes
v3: Add kvm lookup
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df0d677833..d080239863 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -922,6 +922,7 @@ struct ARMCPU {
         uint32_t id_mmfr4;
         uint32_t id_pfr0;
         uint32_t id_pfr1;
+        uint32_t id_pfr2;
         uint32_t mvfr0;
         uint32_t mvfr1;
         uint32_t mvfr2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 10102aab3c..677a4aa79e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7671,11 +7671,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_PFR2", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_pfr2 },
             { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index f74bac2457..3c37fc4fb6 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -578,6 +578,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 1, 0));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
                               ARM64_SYS_REG(3, 0, 0, 1, 1));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
+                              ARM64_SYS_REG(3, 0, 0, 3, 4));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr0,
                               ARM64_SYS_REG(3, 0, 0, 1, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
-- 
2.25.1


