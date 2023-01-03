Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B565C634
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCls4-0000z3-8u; Tue, 03 Jan 2023 13:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrt-0000ud-QG
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:34 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrr-0005Gi-ST
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:33 -0500
Received: by mail-vs1-xe30.google.com with SMTP id i188so32589073vsi.8
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEB0nGrFaxYSQkHhsFi8mtdM2L5qlb+qHO4UJ4164dk=;
 b=TlypqxXaZZJ22Jk4QzZikCffd42datcqaIAYF1XoajbPDRBi3nNePrFAAuSxUxGvEr
 fD4j34mc3Sge2aRiDz2GAKeu1/BtMOHKhW5lrudrlK+5Ugf7uOcOL/qqYGgX4V2ZV3Ux
 Ni+ruI57MQf4iUH7pu3tHryl/6I1j5g2+Um4eNRHlPp40kL9yI0KmvAlyEHsEdRp6vsn
 ot8Bnd0jXhG2kuxmSmNRqeWkG3ppb6a7zwkA+DUzPRSS9OT4QwR0mOIhK25knWZY5pRh
 hj8l6U+iA5UMoD1aD2CHtOpupBkSGJVa5ivnt5wAkr8hq37siRadBnI9jC7ahIYQWFal
 nhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEB0nGrFaxYSQkHhsFi8mtdM2L5qlb+qHO4UJ4164dk=;
 b=LPHiyq+Aiehq7zeRdbdJzx3ZMmPySl2J2rwK386hvA/p4FRfjIdr7s9FL1DnN3sMfr
 5EGjWVeZTwa58sG6KRwFEzKLncK8dwSR5riCS818yl5WfMcbsYHNf/FnUwLemnl4XxG8
 UvIZYiBdsenJciMP7duP/4BITJ38sopF7DY2xiyRYb3hHLGwchpp3AAu0fWkjQy56Yd3
 D3+O3LzNUK+MmDezkCF2rVdgVefkizVqCgyiePM/05rP1Bv3F/qxPWTtZktSP+Gjl39Z
 +eaTw9wwXb+TUhoYEDfHoWbvohi7ZXbtiJF1yurfZTpqXuFfZwz9iKs4M8UA8R14jCRm
 Y/XQ==
X-Gm-Message-State: AFqh2kqKWoGmGxIUAxVjuvbgv9dKjdlm2CZaQHa3RnKn3WfwUWBIRprr
 Z7RshGXKpTMUrc6OtmNT4L3cRMwdGRXXFWyAiHg=
X-Google-Smtp-Source: AMrXdXsUZaLwJr4wPxysXLfW45Km+04SFLWPItor2IUxtdBcKn/kR+A/dHbIT1g0O5ajBMw69UgvMQ==
X-Received: by 2002:a67:f70b:0:b0:3b5:1986:1914 with SMTP id
 m11-20020a67f70b000000b003b519861914mr23886333vso.17.1672769911029; 
 Tue, 03 Jan 2023 10:18:31 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 34/40] target/arm: Move "reset-hivecs" to class property
Date: Tue,  3 Jan 2023 10:16:40 -0800
Message-Id: <20230103181646.55711-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe30.google.com
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

Remove the reset_hivecs variable entirely and create
property accessor functions that directly read/write
a bit of the reset value of SCTLR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  1 -
 hw/arm/digic.c       | 11 ++++-----
 hw/arm/npcm7xx.c     |  9 ++++----
 hw/arm/xlnx-zynqmp.c | 11 +++++----
 target/arm/cpu.c     | 55 +++++++++++++++++++++++++++++++++-----------
 5 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e425846007..c0baec37d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -973,7 +973,6 @@ struct ArchCPU {
     uint64_t ccsidr[16];
     uint64_t reset_cbar;
     uint32_t reset_auxcr;
-    bool reset_hivecs;
 
     /*
      * Intermediate values used during property parsing.
diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 6df5547977..fed5d38695 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -34,9 +34,13 @@
 static void digic_init(Object *obj)
 {
     DigicState *s = DIGIC(obj);
+    const char *cpu_type = ARM_CPU_TYPE_NAME("arm946");
+    ObjectClass *cpu_class = object_class_by_name(cpu_type);
     int i;
 
-    object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm946"));
+    class_property_set_bool(cpu_class, "reset-hivecs", true, &error_abort);
+
+    object_initialize_child(obj, "cpu", &s->cpu, cpu_type);
 
     for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
         g_autofree char *name = g_strdup_printf("timer[%d]", i);
@@ -52,11 +56,6 @@ static void digic_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd;
     int i;
 
-    if (!object_property_set_bool(OBJECT(&s->cpu), "reset-hivecs", true,
-                                  errp)) {
-        return;
-    }
-
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
     }
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 41124b7444..97ac4ac7e9 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -390,11 +390,14 @@ static qemu_irq npcm7xx_irq(NPCM7xxState *s, int n)
 static void npcm7xx_init(Object *obj)
 {
     NPCM7xxState *s = NPCM7XX(obj);
+    const char *cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    ObjectClass *cpu_class = object_class_by_name(cpu_type);
     int i;
 
+    class_property_set_bool(cpu_class, "reset-hivecs", true, &error_abort);
+
     for (i = 0; i < NPCM7XX_MAX_NUM_CPUS; i++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a9"));
+        object_initialize_child(obj, "cpu[*]", &s->cpu[i], cpu_type);
     }
 
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
@@ -466,8 +469,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
                                 &error_abort);
         object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
                                 NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
-        object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", true,
-                                 &error_abort);
 
         /* Disable security extensions. */
         object_property_set_bool(OBJECT(&s->cpu[i]), "has_el3", false,
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 335cfc417d..13ab999eb8 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -243,8 +243,6 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
             s->boot_cpu_ptr = &s->rpu_cpu[i];
         }
 
-        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), "reset-hivecs", true,
-                                 &error_abort);
         if (!qdev_realize(DEVICE(&s->rpu_cpu[i]), NULL, errp)) {
             return;
         }
@@ -375,6 +373,8 @@ static void xlnx_zynqmp_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
+    const char *cpu_type;
+    ObjectClass *cpu_class;
     int i;
     int num_apus = MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
 
@@ -382,10 +382,13 @@ static void xlnx_zynqmp_init(Object *obj)
                             TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
 
+    cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    cpu_class = object_class_by_name(cpu_type);
+    class_property_set_bool(cpu_class, "reset-hivecs", true, &error_abort);
+
     for (i = 0; i < num_apus; i++) {
         object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
-                                &s->apu_cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a53"));
+                                &s->apu_cpu[i], cpu_type);
     }
 
     object_initialize_child(obj, "gic", &s->gic, gic_class_name());
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bc4a052e4c..032a2cc00a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1280,9 +1280,6 @@ static void arm_cpu_initfn(Object *obj)
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
-static Property arm_cpu_reset_hivecs_property =
-            DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
-
 #ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
@@ -1375,10 +1372,6 @@ static void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_cbar_property);
     }
 
-    if (!arm_feature(&cpu->env, ARM_FEATURE_M)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property);
-    }
-
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         object_property_add_uint64_ptr(obj, "rvbar",
                                        &cpu->rvbar_prop,
@@ -1801,10 +1794,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (cpu->reset_hivecs) {
-            cpu->reset_sctlr |= (1 << 13);
-    }
-
     if (cpu->cfgend) {
         if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
             cpu->reset_sctlr |= SCTLR_EE;
@@ -2169,6 +2158,39 @@ static bool arm_class_prop_uint64_ofs(ObjectClass *oc, Visitor *v,
     return visit_type_uint64(v, name, ptr, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool arm_class_prop_set_sctlrbit(ObjectClass *oc, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uint32_t mask = (uintptr_t)opaque;
+    bool val;
+
+    if (!visit_type_bool(v, name, &val, errp)) {
+        return false;
+    }
+
+    if (val) {
+        acc->reset_sctlr |= mask;
+    } else {
+        acc->reset_sctlr &= ~mask;
+    }
+    return true;
+}
+
+static bool arm_class_prop_get_sctlrbit(ObjectClass *oc, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uint32_t mask = (uintptr_t)opaque;
+    bool val = acc->reset_sctlr & mask;
+
+    return visit_type_bool(v, name, &val, errp);
+}
+#endif /* !CONFIG_USER_ONLY */
+
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2305,7 +2327,14 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
                            (void *)(uintptr_t)
                            offsetof(ARMCPUClass, gt_cntfrq_hz));
     }
-#endif /* CONFIG_USER_ONLY */
+
+    if (!arm_class_feature(acc, ARM_FEATURE_M)) {
+        class_property_add(oc, "reset-hivecs", "bool", NULL,
+                           arm_class_prop_get_sctlrbit,
+                           arm_class_prop_set_sctlrbit,
+                           (void *)((uintptr_t)1 << 13));
+    }
+#endif /* !CONFIG_USER_ONLY */
 }
 
 static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
@@ -2324,7 +2353,7 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
         error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz", acc->gt_cntfrq_hz);
         return false;
     }
-#endif /* CONFIG_USER_ONLY */
+#endif /* !CONFIG_USER_ONLY */
 
     /* Run some consistency checks for TCG. */
     if (tcg_enabled()) {
-- 
2.34.1


