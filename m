Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486F6E8F37
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAG-0000eb-AR; Thu, 20 Apr 2023 06:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA8-0000Yx-P5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA2-0003qr-Jv
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f177cb2c6cso3442635e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985105; x=1684577105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xejyZEcnXPcOcrIXCJsdEKcNfQCMmDuIs1Hj5HcWKBo=;
 b=ENAYuJWxPz0cR/5LkYDHvlhIRXugbjVNvEdlbUXVEWEbAxYJw4AmBzLHh7QFySrVtC
 N6jJCKupc2X9yjU4TuyZm38joGz0wU7PyzapqO5DnAaUMtWQ6zBl9EyQnezzarpNQlgH
 FLAch1vaHaYEDCXcziFNWNZD/BpKLbGzH1PFxexFljifcDtAfcGmz/HNG0FxipJ8YtXh
 mZhjWqU/G/hXNIirTNfo9mT5YONYXWxXXLEl+mytm1wnsZD8OZ2MZnr0Ut2GlgA1KHZg
 9XwhLTawCAyZXZBwNdaLDJAEivdxWC+9yDdNWGpgVeB5G8G8MgRmii7ClgxZwLqQi4Rp
 RoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985105; x=1684577105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xejyZEcnXPcOcrIXCJsdEKcNfQCMmDuIs1Hj5HcWKBo=;
 b=fDHDH0JtcM7VnlwUXQPsbk1CmAz/wdRlZpqW1vE/xqZRPbSn7SbgHA8DJWuR1VwFp9
 UX9zSpcrUHRqsOtL3BiFtY8vJoIr00Em/6vKrEGmSzH9xc3cAOlkIXA/gAHwb45NZKAi
 XxHOovKYxiWCxb8A1Zt/KXnH1wsUxewQTC9ihc9GmCpsVyxAXLf2e2zjiCh3ylOeq6oy
 Tzp8KvsQO/JGpzdHGRkRR289YnzFV0O9C6tu07/KNPXvx7pApYWJTOisbsghON/0fHFM
 2qHZUHXY9OBsiyS9xOGoStOMVn9jWmYlzH5mdUo/PoHQIYGW4ohVvgISw30gro1K6UVt
 5Zvg==
X-Gm-Message-State: AAQBX9fE34WFRuW6gm5mZsv5tacDtm/y1why+n8n2UdpionVrqDHBpaW
 NXO9O0VVu0Qt8V50kcrnXZeeqxtiqk//jiWk/M8=
X-Google-Smtp-Source: AKy350ZFjgvb6vhTmkNRhj5kd6czcrdPHpCQBw6cOAGs5vx+Oqn7n8V3rfO8Mket/x/a3e4dU8JZ5w==
X-Received: by 2002:adf:d84d:0:b0:2d8:47c7:7b50 with SMTP id
 k13-20020adfd84d000000b002d847c77b50mr968474wrl.1.1681985104825; 
 Thu, 20 Apr 2023 03:05:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] target/arm: Remove KVM AArch32 CPU definitions
Date: Thu, 20 Apr 2023 11:04:44 +0100
Message-Id: <20230420100456.944969-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Missed in commit 80485d88f9 ("target/arm: Restrict
v7A TCG cpus to TCG accel").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230405100848.76145-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm-consts.h | 9 +++------
 target/arm/cpu_tcg.c    | 2 --
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 09967ec5e64..7c6adc14f6e 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -124,13 +124,10 @@ MISMATCH_CHECK(QEMU_PSCI_RET_INTERNAL_FAILURE, PSCI_RET_INTERNAL_FAILURE);
 MISMATCH_CHECK(QEMU_PSCI_RET_NOT_PRESENT, PSCI_RET_NOT_PRESENT);
 MISMATCH_CHECK(QEMU_PSCI_RET_DISABLED, PSCI_RET_DISABLED);
 
-/* Note that KVM uses overlapping values for AArch32 and AArch64
- * target CPU numbers. AArch32 targets:
+/*
+ * Note that KVM uses overlapping values for AArch32 and AArch64
+ * target CPU numbers. AArch64 targets:
  */
-#define QEMU_KVM_ARM_TARGET_CORTEX_A15 0
-#define QEMU_KVM_ARM_TARGET_CORTEX_A7 1
-
-/* AArch64 targets: */
 #define QEMU_KVM_ARM_TARGET_AEM_V8 0
 #define QEMU_KVM_ARM_TARGET_FOUNDATION_V8 1
 #define QEMU_KVM_ARM_TARGET_CORTEX_A57 2
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index df0c45e523b..1911d7ec47f 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -546,7 +546,6 @@ static void cortex_a7_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
     cpu->midr = 0x410fc075;
     cpu->reset_fpsid = 0x41023075;
     cpu->isar.mvfr0 = 0x10110222;
@@ -595,7 +594,6 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
     /* r4p0 cpu, not requiring expensive tlb flush errata */
     cpu->midr = 0x414fc0f0;
     cpu->revidr = 0x0;
-- 
2.34.1


