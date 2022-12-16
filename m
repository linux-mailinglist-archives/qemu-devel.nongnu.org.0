Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477EB64F34F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:44:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUy-0006Zb-Td; Fri, 16 Dec 2022 16:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU4-00061g-Fg
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU2-0000cM-MX
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso4980895wms.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OaolEeI/VBAVtDjg7jIzycyq6Q1jqs6WjWVYeKLQJ68=;
 b=OhHIdHLwNyH0CsC6iNDJuXMoEAHDtz8QuHhzMKd0GLMIzpW7N0XrnSGPzC5gBaNcxL
 6kAFZ7lBVN0vybG85Puxq++alFqsfLDBo6XZlbA1ocn23gIsIe2ETGdXcewAu1ZiDlfu
 bPW9KDprDuVeraTIVVpPSHHXNcTfWw03MZixxy6QmcrC5ye3LPA8KmlZPiv/5r8F/gDo
 wqK5NwhQ7oBTqkV2XksEqQclud70Ax9XRKK2mUrZUlOuwwXrhk4AYaagnNXTt17p/PBE
 qwuOGDw/ayaCB/zFKMU84FcKAUF9J4IA5eb9Vdq2QE2CGhP5uyd70aLCuABbNk8mPZIS
 rO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OaolEeI/VBAVtDjg7jIzycyq6Q1jqs6WjWVYeKLQJ68=;
 b=HEXRSyT0XnZfHaGf6QQy+b3NP6cykZHlO+Yv2j5Ga8UwW2rGVZP4eRhyunTLdbVIVq
 nhGRfNP86VJXFdloBcCsb3IHxAFozG4CRGumxLL+eVlgxU72J4pbGq/E3qw0kLHfxf6B
 vz3G2akb00uEXYPexyRRj6vyiCgDfSHEaAOjWcbnttsU0Zmxt8NaegxrQUFry/1j412D
 vLiSSoj8n+BvN7pB85ui14RJVokYp53zvZNA3XbpQdlXB5w5fDKUbOc1XU5B1lVhlicf
 myaIbAaWtJZtburYOXmFWThkI/MehgjHMH0vWcd87UAK4lgeLoNBRE7dVBevdO5QK56O
 2mHg==
X-Gm-Message-State: ANoB5pkxG1NCaX4lYXrNNk9v8KGLTi4VvqklJZpr6z/4SPsCK+MqPFsi
 5wpPczonyy1mMkCjtAk+E2PTRr/aezofcN7G
X-Google-Smtp-Source: AA0mqf5g710v4qF7o9bNSTi8Y3bFvLKgyePulA9YQO2+kwakHzUGXcscbgzPrEj4NufA9qN+QWxVmg==
X-Received: by 2002:a1c:cc1a:0:b0:3cf:5583:8b3f with SMTP id
 h26-20020a1ccc1a000000b003cf55838b3fmr27369970wmb.20.1671226989952; 
 Fri, 16 Dec 2022 13:43:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/36] target/rx: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:33 +0000
Message-Id: <20221216214244.1391647-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Convert the rx CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-id: 20221124115023.2437291-16-peter.maydell@linaro.org
---
 target/rx/cpu-qom.h |  4 ++--
 target/rx/cpu.c     | 13 ++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index 4533759d966..1c8466a1870 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -31,7 +31,7 @@ OBJECT_DECLARE_CPU_TYPE(RXCPU, RXCPUClass, RX_CPU)
 /*
  * RXCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A RX CPU model.
  */
@@ -41,7 +41,7 @@ struct RXCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #endif
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 9003c6e9fed..219ef28e463 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -62,14 +62,16 @@ static bool rx_cpu_has_work(CPUState *cs)
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
 
-static void rx_cpu_reset(DeviceState *dev)
+static void rx_cpu_reset_hold(Object *obj)
 {
-    RXCPU *cpu = RX_CPU(dev);
+    RXCPU *cpu = RX_CPU(obj);
     RXCPUClass *rcc = RX_CPU_GET_CLASS(cpu);
     CPURXState *env = &cpu->env;
     uint32_t *resetvec;
 
-    rcc->parent_reset(dev);
+    if (rcc->parent_phases.hold) {
+        rcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPURXState, end_reset_fields));
 
@@ -215,11 +217,12 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     CPUClass *cc = CPU_CLASS(klass);
     RXCPUClass *rcc = RX_CPU_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_parent_realize(dc, rx_cpu_realize,
                                     &rcc->parent_realize);
-    device_class_set_parent_reset(dc, rx_cpu_reset,
-                                  &rcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, rx_cpu_reset_hold, NULL,
+                                       &rcc->parent_phases);
 
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
-- 
2.25.1


