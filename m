Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF8D65C644
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:28:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrj-0000T7-5T; Tue, 03 Jan 2023 13:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrT-0008P3-3w
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:10 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrR-0005Ii-KZ
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:06 -0500
Received: by mail-vs1-xe36.google.com with SMTP id 3so32567815vsq.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cpI31q8puiq+k9BfPqvIkCRkk/xl8XaSMre9iCPsr0=;
 b=sBGvtHN5Tao+Pzl4QK/QG95guKdeOvzOOlORTYmjvxJrWMarhCUIEjrH204YTgqCzk
 1o33v5RMGFHLe29WvbC8ZOnO7X3f9xgp9SMMpDXsulKb+JMEKzUD80VVJRwnYhPCTjQR
 +M6Zqqh0QjzLYGWksF41xrHaeXGinBZsdukl88Ymy86MuuC+6d1m11kxygiaqInLGU+u
 d8z7VBtzM1G34T9xj6zrC729a+l/YfaGDw2wFaCcHv/9ZVs4uCyjBUvjsu2vQ2xYWvHE
 K50mju71bGd8+qqwO6/xE8G6cgHZyUIDiMmDswx14FaAWkWlpU3eGAS4o1bc2xDjjil6
 XKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cpI31q8puiq+k9BfPqvIkCRkk/xl8XaSMre9iCPsr0=;
 b=HPW3OvQ9xnksZ8CJtT/8s1REtVCgw8datZ84DzdGtal/keZFki3+gsneWRB8H7caN5
 2UqshzM6nAlxVsqQzE+VUD0dbabp02GJdff55pQa9ak2WjWknWWuoDVFXBJk8Ebgy6ix
 PikDF/vc29zch8FeI43DNvnmsb5wXz8F8l1rnmXGvCcGy0iRPOejJ5sn0yNhJL1lXk2a
 j/w9oGzzJSgBkDdN112vmp8Y9mLltsQ978zFHWUynLPnW3exAlv6RI07SQZLps08VIGp
 x+SgAISqSGu0Pe2qvUKciv1ll0ES84zktNIC7kOJZgyTqLqT+Fw3VWIuG4teFBtzQ9AE
 hJqw==
X-Gm-Message-State: AFqh2kqzR9rS/iaaWl9D4YdWvPzWAEjyNd06EXHrjSgRxsdCnG/XSilp
 GcRy78iUqNsZ3pfqRn8CH3zLKNN/ihh8k8XjTu8=
X-Google-Smtp-Source: AMrXdXsA1G+BBk6tqktY/lrnFb/qn3IrJ7VYT4NKcw4u80Gk8UHP0VaF+A/TT5kjVDH3g0nEmbTqgQ==
X-Received: by 2002:a67:e417:0:b0:3cc:e60c:64bc with SMTP id
 d23-20020a67e417000000b003cce60c64bcmr7693970vsf.34.1672769884529; 
 Tue, 03 Jan 2023 10:18:04 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 25/40] target/arm/hvf: Use offsetof in
 hvf_arm_get_host_cpu_features
Date: Tue,  3 Jan 2023 10:16:31 -0800
Message-Id: <20230103181646.55711-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use an offsetof vs ARMCPUClass, which means that the regs[]
array may be static const, and we can include midr in the list.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d47159b9bf..362dd4ac2e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -459,19 +459,29 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
 
 bool hvf_arm_get_host_cpu_features(ARMCPUClass *acc, Error **errp)
 {
-    const struct isar_regs {
-        int reg;
-        uint64_t *val;
+    static const struct isar_regs {
+        int reg, offset;
     } regs[] = {
-        { HV_SYS_REG_ID_AA64PFR0_EL1, &acc->isar.id_aa64pfr0 },
-        { HV_SYS_REG_ID_AA64PFR1_EL1, &acc->isar.id_aa64pfr1 },
-        { HV_SYS_REG_ID_AA64DFR0_EL1, &acc->isar.id_aa64dfr0 },
-        { HV_SYS_REG_ID_AA64DFR1_EL1, &acc->isar.id_aa64dfr1 },
-        { HV_SYS_REG_ID_AA64ISAR0_EL1, &acc->isar.id_aa64isar0 },
-        { HV_SYS_REG_ID_AA64ISAR1_EL1, &acc->isar.id_aa64isar1 },
-        { HV_SYS_REG_ID_AA64MMFR0_EL1, &acc->isar.id_aa64mmfr0 },
-        { HV_SYS_REG_ID_AA64MMFR1_EL1, &acc->isar.id_aa64mmfr1 },
-        { HV_SYS_REG_ID_AA64MMFR2_EL1, &acc->isar.id_aa64mmfr2 },
+        { HV_SYS_REG_ID_AA64PFR0_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64pfr0) },
+        { HV_SYS_REG_ID_AA64PFR1_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64pfr1) },
+        { HV_SYS_REG_ID_AA64DFR0_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64dfr0) },
+        { HV_SYS_REG_ID_AA64DFR1_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64dfr1) },
+        { HV_SYS_REG_ID_AA64ISAR0_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64isar0) },
+        { HV_SYS_REG_ID_AA64ISAR1_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64isar1) },
+        { HV_SYS_REG_ID_AA64MMFR0_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64mmfr0) },
+        { HV_SYS_REG_ID_AA64MMFR1_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64mmfr1) },
+        { HV_SYS_REG_ID_AA64MMFR2_EL1,
+          offsetof(ARMCPUClass, isar.id_aa64mmfr2) },
+        { HV_SYS_REG_MIDR_EL1,
+          offsetof(ARMCPUClass, midr) },
     };
     hv_vcpu_t fd;
     hv_return_t r = HV_SUCCESS;
@@ -485,9 +495,9 @@ bool hvf_arm_get_host_cpu_features(ARMCPUClass *acc, Error **errp)
     }
 
     for (i = 0; i < ARRAY_SIZE(regs); i++) {
-        r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val);
+        uint64_t *p = (void *)acc + regs[i].offset;
+        r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, p);
     }
-    r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &acc->midr);
     r |= hv_vcpu_destroy(fd);
 
     /*
-- 
2.34.1


