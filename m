Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65C564F37B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:50:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUI-00063k-AL; Fri, 16 Dec 2022 16:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITt-0005wk-VA
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITr-0000bF-7y
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso1997490wmb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dunqq5wh2SHxaxGYJwoMKd8AXFWzRcMTlvb9MMShOc4=;
 b=TLP1xrFhSRfMUMqkyT+dTh13tj/ELikcOblvMo5R4hWvlrtYhcjuUN6HLzod2ptn1w
 Oqoq1DPOcKAHWBfL+Aj3n/yRsgVN+OapNb/SvOCE9SObATp7P+J2RV1OM5TB0vWJl9th
 bm4g6Ubj8U6N6u740R2JhQh60fjcbi2+LEZF4qpT2WC2TO7mdZ4EITBWVztM+op1CuiF
 LL/1Aw8uPsUC/WXlhu3tKUlwoAM9dTzKQdFShaUjG/zEAG0l8mEGTOwn70Jcg0epu6iP
 TnYsEj8P1lhhy7BbRzF3/AYQsGqzdrxwBz3v2hLGdJzy2Boz16fNT+5GPgboR4nlAEAg
 OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dunqq5wh2SHxaxGYJwoMKd8AXFWzRcMTlvb9MMShOc4=;
 b=41PqaYvSLc2yzR9BiOhFSMkjFrlJwc5NUKStJbZ1YXbHioMzPO23oHVvjF/XIEnN97
 Egua7iPWLRHNGnZ785yk3fNfMxRFbX7kbah/muXRv2z4OQX7xKL+YYFAtcGnPgXEnWVN
 UNSzVDD+JWr8aYMe0jfCthILUJn4+3kVKumqn55KAENQ+tSzXhZnq7jzxOVpvbBjS5yZ
 hrSuv+0qvFGNYWnNfY/oTR3x4rdT7lHBkWKUOr5Iafbb7iXdpHJDQyar9v1QjP77pdWK
 QwQqgU5kWbyDb7FO6TVjPc2z9Rq/yZAII3QMDsR8ULP7AiEtTFmO/FVUZ3vOCNhJAe9J
 5WiA==
X-Gm-Message-State: ANoB5pnRM/ShBShCqJ98M4CIfRPO1H6GeER7guH9GuJZPDTEb6qaABcy
 Y6FV9M70f3FkjpEtFZ3XPSl7unCVzOKB8BVF
X-Google-Smtp-Source: AA0mqf5ITsKy3hj6kkedX5GY5RCFXNYEQvXtm357V1fHoxYT4jCciAGMc9wAdduVaRfcWmyS2qE15g==
X-Received: by 2002:a05:600c:3d06:b0:3c6:e60f:3f55 with SMTP id
 bh6-20020a05600c3d0600b003c6e60f3f55mr26989589wmb.12.1671226977379; 
 Fri, 16 Dec 2022 13:42:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/36] target/arm: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:20 +0000
Message-Id: <20221216214244.1391647-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Convert the Arm CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20221124115023.2437291-3-peter.maydell@linaro.org
---
 target/arm/cpu-qom.h |  4 ++--
 target/arm/cpu.c     | 13 +++++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 64c44cef2dd..514c22ced9b 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -43,7 +43,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info);
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * An ARM CPU model.
  */
@@ -54,7 +54,7 @@ struct ARMCPUClass {
 
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0f55004d7e7..2fa022f62ba 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -202,14 +202,16 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     assert(oldvalue == newvalue);
 }
 
-static void arm_cpu_reset(DeviceState *dev)
+static void arm_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     ARMCPU *cpu = ARM_CPU(s);
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
     CPUARMState *env = &cpu->env;
 
-    acc->parent_reset(dev);
+    if (acc->parent_phases.hold) {
+        acc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUARMState, end_reset_fields));
 
@@ -2211,12 +2213,15 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(acc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, arm_cpu_realizefn,
                                     &acc->parent_realize);
 
     device_class_set_props(dc, arm_cpu_properties);
-    device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
+
+    resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
+                                       &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-- 
2.25.1


