Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332726D7952
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:09:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk04e-0000ix-IJ; Wed, 05 Apr 2023 06:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk04c-0000im-Pn
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:09:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk04b-0004Zy-9w
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:09:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id y14so35651133wrq.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7I8pgcW6ZwGjVMfJNjtnaXujAveSVqm+E8tHMTx8v0=;
 b=MhyujAomibFLPs5Z1r+fQrzzSvg9H4r2EBzSetnjfIovo0D4SOHWUwSeiRMNgPoh1o
 7h6hDoLWJdA8tHYvvh8HqzgvOpEgD8lMQv3Tz77QtPegzuQe5Qlye+HlBf3iI294ejVj
 dkyFO5ZwK+u+nCxKcob1h3I1Hua9GeSm3zg4LMwmxMpoq8AjbZ/7zeL7FuqCwP1PDlzR
 9AXgnwO44IVGF5Kt1cF5t91+2Spcqj4EPyL/GbCKZZQh9S2g/AvunFvUkRs9SV1l90g3
 DYNOhupV0YEvOrj5PGN49nkPggU8u37pDPwL8d0V/htEWC24jJi27Kzgqvu52RRWcVFG
 TJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7I8pgcW6ZwGjVMfJNjtnaXujAveSVqm+E8tHMTx8v0=;
 b=068SRFW+EoXvLLWHJMf9xSZEgY7eN66pA6X+FlQo6zjA5cv6cXK8Tt9/PoPwvalF4e
 TLSRnYScM+HNgBzGbC6MD+xn5fzfmABaCq6Tvucj++Pidh6XUL+Z8qLcVzmkG2TV+Ehz
 lkrBRalitfpDat6oqBrXcD6N66hk2DQXv+vCkd71Ycis0FsBJfghzmvOs1Xw1/IGnmiP
 11jc/2uLz4QKlwz8BD+q1vPSoySaqe3bzt3gvHrFgoodIAmcjJWbxblqk+I2NNzcwpkT
 PBKTNc+EMqNXo9H2vOHRJyoP5HXt9RBDjiVtgL/urrInh/qR+/fpPJQFeN8IFo7rpXMH
 8KpA==
X-Gm-Message-State: AAQBX9dn8iWE05vWsrmJBAjxCr/2aRCtm5pQTA0jMWGDifGv4LHkXfx7
 a1G/Y2r4r75yEPi6J/gv60id39LqMIllcL6Rlu8=
X-Google-Smtp-Source: AKy350ZZ4fgFqdvHAn3EadEjlpVz+1pRNjnGMd2Adfq6cwTKDA6rtjIPgVMQ19Y5BFSB/g3YNh95tw==
X-Received: by 2002:adf:f492:0:b0:2ce:a7df:c115 with SMTP id
 l18-20020adff492000000b002cea7dfc115mr3589528wro.41.1680689339485; 
 Wed, 05 Apr 2023 03:08:59 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 f16-20020adffcd0000000b002d5a8d8442asm14561130wrs.37.2023.04.05.03.08.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:08:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] target/arm: Remove KVM AArch32 CPU definitions
Date: Wed,  5 Apr 2023 12:08:47 +0200
Message-Id: <20230405100848.76145-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405100848.76145-1-philmd@linaro.org>
References: <20230405100848.76145-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Missed in commit 80485d88f9 ("target/arm: Restrict
v7A TCG cpus to TCG accel").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm-consts.h | 9 +++------
 target/arm/cpu_tcg.c    | 2 --
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 09967ec5e6..7c6adc14f6 100644
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
index df0c45e523..1911d7ec47 100644
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
2.38.1


