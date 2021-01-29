Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D5308809
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:05:07 +0100 (CET)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RaM-00018S-Ei
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVx-0004En-S7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVi-0006rI-2q
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id z16so4190764wml.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZkKoXRPBApffD0MVNlI1cfOJ0LjvP5jIStY6aHbrYvw=;
 b=NKxv1P4MB4XbN3ZewdPH/j8n77nNSB/vlYFKmvJlLSoCMpGtQacrPa2mJcMppaMNDH
 rSvxSZdufHrzlXhq8j1QLoLPbJYKAYA96bjugJjqShWUG9UlOJqMSI0VawmSGT25sC+A
 iqBJUtOocYxadwORw7dS9O+FFYxGymmk68jvlj1mhEhduJnxhGqgocoVGGNLY67O6Kbx
 xUuA+UfldXln32U4PwcgQPVkuBpQvfwhUDpH+UUlzwrCRul3cyFHW85LXggq5LHY294R
 1OK0qQ5gbSnhbqx8N+rOWY2+2wfCNdUcLNTHx8sEASNOMyA2KYJtw6vZQu36/x3utok7
 k4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZkKoXRPBApffD0MVNlI1cfOJ0LjvP5jIStY6aHbrYvw=;
 b=ueYLRgUS6j4HxpnCik0ayTmgC4A5XPtr59Bp05WU2gGFnmYbRtH3NWygDc/wLqzYSl
 wv6Re0L7XIiftLqzgek9WzrqeZ8yEIZ6LQw4vNYWS/tHSKy01IlkGEiYnM9Q3OIsJIoS
 MTV8+xLo0lkgisVKpfDG5qPRe8+UosonTtHYEM/WMTgKJ3uFXSTGv1K4+3Sul6aLV2Z+
 WG6lDeORO8b6t+25ope8bHXRLNq9o94TT7auJlhZu0etznmkiK8/vTL3/VzDAldaLqii
 Tj6+ipoIBeQAeANUmbJacWuHMd0ndMT3MTSDDOnPA3pnOP06pOp0eyRbHulBAQOIZW6u
 Ow5w==
X-Gm-Message-State: AOAM530l8VSOEfQBryaFNQXe1xeLHcOfDSAnqhW19y4jujMF3wlm97Mj
 Q46Bp7NMpWMe5zTO0BIQlLfYGmkudmGYtg==
X-Google-Smtp-Source: ABdhPJzgjLRjJ/L+LnVgsy3hhusUYrY5lDIUpF68vnrJh4BR8jMqCEkjWX143MB2yblPcTkBQgVuTA==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr3273425wml.8.1611918016225; 
 Fri, 29 Jan 2021 03:00:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/46] target/arm: Implement ID_PFR2
Date: Fri, 29 Jan 2021 10:59:27 +0000
Message-Id: <20210129110012.8660-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This was defined at some point before ARMv8.4, and will
shortly be used by new processor descriptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210120204400.1056582-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df0d6778330..d080239863c 100644
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
index d2ead3fcbdb..417777d4bed 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7662,11 +7662,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index f74bac24574..3c37fc4fb6a 100644
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
2.20.1


