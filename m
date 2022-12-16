Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58564F421
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:30:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU5-00061p-Ue; Fri, 16 Dec 2022 16:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITy-0005y7-DH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:06 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITw-0000fi-Fk
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id m19so2730337wms.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W0Sgz5RvbZ0+7rq6tAt31bRICOQNwLU3F3RWRUnkyZA=;
 b=nWYsTOO2+5yZnowRxnSCb+4nrpmfb6c4N60eN+rF9JxW2PjqLssYlEw1w362oz3xKY
 5BHROy0SxGdher1BMmUD2L2IXQal2z4sgDLwdti4/4NA/6C5agcrRT0X9gUFHjztRGmZ
 wNgMneY42Y0K3cs36xArbgGINwLDEc8icKzGRiOvo94Vw27UxP7iH/ImsHFpU8wfE7eC
 xBFbAzcZrwk0VwCBvGCS856/FLviYEkZFEXllIau6HwK4J2+I+xjzodFDLkb4lZ3IGgB
 pigOzFfWsIDfccaBtlO3LJYk1wryTjVV7SBl37Rla4cp6kAbSUP89PR/br3bpivJWpzH
 43MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0Sgz5RvbZ0+7rq6tAt31bRICOQNwLU3F3RWRUnkyZA=;
 b=oxA1H4YpJTm7vvXzmMV2U3gxXHnOMiXb+LWkH4qGYkpKhWaovhNOmB92JIvLIMUW2T
 x2aPY8bfjc2uF9UP1YhsAgwWqhbGt2+govFDR/YuWMzLae/BdBSvurHxOlYZmeiv1fsA
 XUbK6eV4Pdx6H+BEJ6nBY61D5E2Vlkd8af7HVedgMQsmXx+7BW0jZN7wiMpGyTdUfP0I
 M34madyVZ6TUX0FYf+wDDnhra6Pw8cUs7cxjYaZXVjEABW8X8x+Q53Cbb18YBIBcIer2
 idmDUqbXZr3AF6mzLv9bxuP9SVxEJJMkk1cm6O1N+AHfeBciGbY1w5o1ZWcoILXdlHB7
 VrlA==
X-Gm-Message-State: ANoB5pmg8k5kTJmQxP2ud4Eff7ncnBhQ5n6hRm0GwkIc515nuSUxDx8i
 ZuxZyDFSTMKXnbILhshNdfKi2pdcUn+4Fa7h
X-Google-Smtp-Source: AA0mqf4NWKgdkRx2yB726se7EWbGX8DdRzPkInZY7bxxtV2R1UjB2uZGmg+IDosk8BKo0EM+2xcX+Q==
X-Received: by 2002:a05:600c:3b9c:b0:3d1:e710:98ec with SMTP id
 n28-20020a05600c3b9c00b003d1e71098ecmr35682143wms.21.1671226983264; 
 Fri, 16 Dec 2022 13:43:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/36] target/m68k: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:26 +0000
Message-Id: <20221216214244.1391647-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Convert the m68k CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-9-peter.maydell@linaro.org
---
 target/m68k/cpu-qom.h |  4 ++--
 target/m68k/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index cd9687192cd..0ec7750a926 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
 /*
  * M68kCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A Motorola 68k CPU model.
  */
@@ -40,7 +40,7 @@ struct M68kCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index b67ddea2aee..99af1ab541a 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -66,16 +66,18 @@ static void m68k_unset_feature(CPUM68KState *env, int feature)
     env->features &= ~BIT_ULL(feature);
 }
 
-static void m68k_cpu_reset(DeviceState *dev)
+static void m68k_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     M68kCPU *cpu = M68K_CPU(s);
     M68kCPUClass *mcc = M68K_CPU_GET_CLASS(cpu);
     CPUM68KState *env = &cpu->env;
     floatx80 nan = floatx80_default_nan(NULL);
     int i;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUM68KState, end_reset_fields));
 #ifdef CONFIG_SOFTMMU
@@ -552,10 +554,12 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     M68kCPUClass *mcc = M68K_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, m68k_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, m68k_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-- 
2.25.1


