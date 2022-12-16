Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BD64F37F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUb-000666-Er; Fri, 16 Dec 2022 16:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU5-00061s-DR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:13 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU3-0000bj-Ny
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b003d1e906ca23so2079825wma.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=edRWCBqsjA6zIj3Q58VGwuvfkVmFaYmBYW1gADSiXrE=;
 b=kwjR68fRgDg3ScAf8dq4gZgKwPjMaaY2antm5h066SlcLhvCtyDuuF1Nq7JUfapXZ/
 pVaC0f2qhB5cRzBi1w5PrhwnJb+EjhKXInf5dkKchQrq9w5Nk/9rfQRiHJACSmfW9VQg
 Isf/bYpn8O+saeK426Azj7yP9j4J/yIzwWKWcv8zYUWmHIwntE522mSdrvrIWVj6Eaww
 tyvqpskbAJQF4YwgWdLzE8nXI23IlKFkPdw7NDNT5WcMpf1+KXBULkqShvc7vJ/xBnr0
 kkeGLvavWHe20Xeq0ibqsv5sbrEdzTpE8t5WPiGBiJ7ZdQ37RQLUy1B4JRQXnftgDiHv
 CHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edRWCBqsjA6zIj3Q58VGwuvfkVmFaYmBYW1gADSiXrE=;
 b=Q8EQqtqX2GhUp8g/J/Faf3geKA2ut5zOXjOHqbea7nPj7+2zdXq1rLYHtIyv994K7E
 iojpLlOBk6fH7GV/ijbxpQ4umon1ZMnyO+F3AHxpMYY3Zh8qDsvXZ8PIladZG5UKQaqw
 TEoknDiQ5iAi6DG0ujyPVrNMv7eFSeYJBlgbkZggTGEdn+alXcQ/cSzD+sMs4eJVrmVW
 6+VWTxVHabJMBpN4Gh2MVdniUH8mZzVErUYUEt+wr0s7C4kAMfrUFEVRKE/fl47noD0R
 C8OhrXsTaAaPauXVdHs6Qk14kDb6qVno6UGcOeKf2QPIed4HD+bfx8iC3q3pddS7X+Af
 H9eg==
X-Gm-Message-State: ANoB5pk4IGiHALlTVrkNm42+pT8JUNlx93NO9knNw31BKDehDjPyW9lO
 dE8m5J7q0gudpkGHv+2vaX27+O+aXB0LLiep
X-Google-Smtp-Source: AA0mqf7orhWKqKHCXe4Py5CvMNZ26wa8adRC2U093csDVg0guuT1ms4KvR5lNrBugjE6z4+U6CUjGg==
X-Received: by 2002:a05:600c:4e92:b0:3d0:89f5:9296 with SMTP id
 f18-20020a05600c4e9200b003d089f59296mr27221992wmq.17.1671226990863; 
 Fri, 16 Dec 2022 13:43:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/36] target/sh4: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:34 +0000
Message-Id: <20221216214244.1391647-27-peter.maydell@linaro.org>
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

Convert the sh4 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-id: 20221124115023.2437291-17-peter.maydell@linaro.org
---
 target/sh4/cpu-qom.h |  4 ++--
 target/sh4/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index d4192d10908..89785a90f02 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_CPU_TYPE(SuperHCPU, SuperHCPUClass, SUPERH_CPU)
 /**
  * SuperHCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  * @pvr: Processor Version Register
  * @prr: Processor Revision Register
  * @cvr: Cache Version Register
@@ -47,7 +47,7 @@ struct SuperHCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     uint32_t pvr;
     uint32_t prr;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 453268392bf..951eb6b9c8d 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -87,14 +87,16 @@ static bool superh_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
-static void superh_cpu_reset(DeviceState *dev)
+static void superh_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     SuperHCPU *cpu = SUPERH_CPU(s);
     SuperHCPUClass *scc = SUPERH_CPU_GET_CLASS(cpu);
     CPUSH4State *env = &cpu->env;
 
-    scc->parent_reset(dev);
+    if (scc->parent_phases.hold) {
+        scc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUSH4State, end_reset_fields));
 
@@ -274,11 +276,13 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     SuperHCPUClass *scc = SUPERH_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, superh_cpu_realizefn,
                                     &scc->parent_realize);
 
-    device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, superh_cpu_reset_hold, NULL,
+                                       &scc->parent_phases);
 
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
-- 
2.25.1


