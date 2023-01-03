Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59D65C5EF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:18:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrm-0000dX-LZ; Tue, 03 Jan 2023 13:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrg-0000Ma-Pu
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:20 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrd-0005Ln-N1
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:20 -0500
Received: by mail-qt1-x82f.google.com with SMTP id v14so22398957qtq.3
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBH2/umBb6PUIXvvI6VS3ET+RrQOEaWp5m0MqQjwqxU=;
 b=n/EpmBe8YZVoQauSUJmZprJIC2a1icTYbWavIhbs27arcEEFf1I7yKWA/We/3oyhMY
 865AmGM6zhAoVgmSZVjfgRz2GRM4a8941m2wXSUJkX+prC6ZK/AMp59RKUtUUshSG8H2
 pfVRjgHodz6UnRiBapUr5OALcn8smD/vDu4tnULsh1axJRSfLYryMloBo6DECs8uber2
 99MIM2hzlQiLCuFZOEuNJ0VJ/+t8h6fy1FkD/xQsFm6eCqz/Xr3kIsd6CFzXA1HGdcdq
 YPzBBMvRsbbboNYZ/vcMwATcYo9fdO/5R4HwhlOP7xlhFEKnSOZrVK40qawIDoXQV84H
 TffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBH2/umBb6PUIXvvI6VS3ET+RrQOEaWp5m0MqQjwqxU=;
 b=LRwqNCttRku5wG5mFvHrJtKhsqcMFTu5ljQToylThl/ZTUgIOdYBnhXMfyOZQJSLz5
 jlC9VhX9ScvjCZ6+ywneIaWTg+jiffYABGSzi3WCknfw5bk0dVlNR0nfAp2Hd9YP5OyO
 riFQRUPcPG6u0ZBsbn7sN0dSMXCpHBkhlGUFIIKzgVGEXMZTWzx/uxKdMBWmC+ULfuNM
 9Dp0+WrHlqN2d3wr4AQx3G0H1+4sOXp8AokQnprDcrqyLlMXkfWgX+F1B3WhQaQ8PJNH
 COJTv5+vSA646BSUSvz494jQ77lsB8FEwd5fKBngIi3Ka1gHEZfb0plDzh8/tzyTfedU
 VKBA==
X-Gm-Message-State: AFqh2kroC3CKOFKsLkDBKQiYxunxagRvNGwykdewJnR9/QvnWs+c6m3A
 OUrAW+eF4G/bWiTiyJtp8nhP0jP7H8+ZFjq+Fwg=
X-Google-Smtp-Source: AMrXdXsIpsDFWVspYR0ifayqMc/qK9BwUtZbERMTPmWGIFrUqkqsVYw6tWPwZUkxsjo3eGg0B6aC7g==
X-Received: by 2002:ac8:5207:0:b0:3a8:177a:665f with SMTP id
 r7-20020ac85207000000b003a8177a665fmr57422301qtn.50.1672769896583; 
 Tue, 03 Jan 2023 10:18:16 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 29/40] target/arm: Remove m-profile has_vfp and has_dsp
 properties
Date: Tue,  3 Jan 2023 10:16:35 -0800
Message-Id: <20230103181646.55711-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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

Replace the properties with separate cpu classes that have
these features disabled.  These stand in the way of moving
all id-register properties to the cpu class level, because
of the case of SSE200, which has one cortex-m33 with dsp+vfp
and one without.

Create the full set of m-profile cpus with and without the
corresponding options.  As per

  https://developer.arm.com/documentation/102787/0100

cortex m-{4,7,33,55} have a configurable fpu, while only
cortex-m33 has a configurable dsp (we don't implement m35).

The armv7m boards besides armsse will be able to use
  -cpu cortex-mX-nofpu
instead of
  -cpu cortex-mX,has_fpu=off.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/arm/armsse.h |  3 +-
 include/hw/arm/armv7m.h |  2 -
 target/arm/cpu.h        |  2 -
 hw/arm/armsse.c         | 53 +++++++++++++++------------
 hw/arm/armv7m.c         | 12 ------
 hw/arm/musca.c          | 14 +++----
 target/arm/cpu.c        | 30 +--------------
 target/arm/cpu_tcg.c    | 81 +++++++++++++++++++++++++++++++++++++++++
 8 files changed, 118 insertions(+), 79 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 9648e7a419..98e371c83c 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -123,6 +123,7 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
  */
 #define TYPE_IOTKIT "iotkit"
 #define TYPE_SSE200 "sse-200"
+#define TYPE_SSE200_B "sse-200-b"
 #define TYPE_SSE300 "sse-300"
 
 /* We have an IRQ splitter and an OR gate input for each external PPC
@@ -221,8 +222,6 @@ struct ARMSSE {
     uint32_t exp_numirq;
     uint32_t sram_addr_width;
     uint32_t init_svtor;
-    bool cpu_fpu[SSE_MAX_CPUS];
-    bool cpu_dsp[SSE_MAX_CPUS];
 };
 
 typedef struct ARMSSEInfo ARMSSEInfo;
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index b7ba0ff409..a24433172c 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -97,8 +97,6 @@ struct ARMv7MState {
     uint32_t init_nsvtor;
     bool enable_bitband;
     bool start_powered_off;
-    bool vfp;
-    bool dsp;
 };
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e8dd75b003..4b47a420d5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -897,8 +897,6 @@ struct ArchCPU {
     bool has_vfp;
     /* CPU has Neon */
     bool has_neon;
-    /* CPU has M-profile DSP extension */
-    bool has_dsp;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 0202bad787..9d6280eec5 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -57,7 +57,7 @@ typedef struct ARMSSEDeviceInfo {
 
 struct ARMSSEInfo {
     const char *name;
-    const char *cpu_type;
+    const char *cpu_type[SSE_MAX_CPUS];
     uint32_t sse_version;
     int sram_banks;
     uint32_t sram_bank_base;
@@ -83,8 +83,6 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
-    DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
-    DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -94,10 +92,6 @@ static Property sse200_properties[] = {
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
-    DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
-    DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], false),
-    DEFINE_PROP_BOOL("CPU1_FPU", ARMSSE, cpu_fpu[1], true),
-    DEFINE_PROP_BOOL("CPU1_DSP", ARMSSE, cpu_dsp[1], true),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -107,8 +101,6 @@ static Property sse300_properties[] = {
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 18),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
-    DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
-    DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -505,7 +497,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
         .sse_version = ARMSSE_IOTKIT,
-        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
+        .cpu_type[0] = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 1,
         .sram_bank_base = 0x20000000,
         .num_cpus = 1,
@@ -526,7 +518,31 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE200,
         .sse_version = ARMSSE_SSE200,
-        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
+        .cpu_type[0] = ARM_CPU_TYPE_NAME("cortex-m33-nodsp-novfp"),
+        .cpu_type[1] = ARM_CPU_TYPE_NAME("cortex-m33"),
+        .sram_banks = 4,
+        .sram_bank_base = 0x20000000,
+        .num_cpus = 2,
+        .sys_version = 0x22041743,
+        .iidr = 0,
+        .cpuwait_rst = 2,
+        .has_mhus = true,
+        .has_cachectrl = true,
+        .has_cpusecctrl = true,
+        .has_cpuid = true,
+        .has_cpu_pwrctrl = false,
+        .has_sse_counter = false,
+        .has_tcms = false,
+        .props = sse200_properties,
+        .devinfo = sse200_devices,
+        .irq_is_common = sse200_irq_is_common,
+    },
+    {
+        /* For Musca-B1, differs only on cpu[0]. */
+        .name = TYPE_SSE200_B,
+        .sse_version = ARMSSE_SSE200,
+        .cpu_type[0] = ARM_CPU_TYPE_NAME("cortex-m33"),
+        .cpu_type[1] = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 4,
         .sram_bank_base = 0x20000000,
         .num_cpus = 2,
@@ -547,7 +563,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE300,
         .sse_version = ARMSSE_SSE300,
-        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m55"),
+        .cpu_type[0] = ARM_CPU_TYPE_NAME("cortex-m55"),
         .sram_banks = 2,
         .sram_bank_base = 0x21000000,
         .num_cpus = 1,
@@ -720,7 +736,8 @@ static void armsse_init(Object *obj)
         name = g_strdup_printf("armv7m%d", i);
         object_initialize_child(OBJECT(&s->cluster[i]), name, &s->armv7m[i],
                                 TYPE_ARMV7M);
-        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type", info->cpu_type);
+        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type",
+                             info->cpu_type[i]);
         g_free(name);
         name = g_strdup_printf("arm-sse-cpu-container%d", i);
         memory_region_init(&s->cpu_container[i], obj, name, UINT64_MAX);
@@ -1019,16 +1036,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
         }
-        if (!s->cpu_fpu[i]) {
-            if (!object_property_set_bool(cpuobj, "vfp", false, errp)) {
-                return;
-            }
-        }
-        if (!s->cpu_dsp[i]) {
-            if (!object_property_set_bool(cpuobj, "dsp", false, errp)) {
-                return;
-            }
-        }
 
         if (i > 0) {
             memory_region_add_subregion_overlap(&s->cpu_container[i], 0,
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 50a9507c0b..fdd1c77c08 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -323,16 +323,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "vfp")) {
-        if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
-            return;
-        }
-    }
-    if (object_property_find(OBJECT(s->cpu), "dsp")) {
-        if (!object_property_set_bool(OBJECT(s->cpu), "dsp", s->dsp, errp)) {
-            return;
-        }
-    }
 
     /*
      * Tell the CPU where the NVIC is; it will fail realize if it doesn't
@@ -528,8 +518,6 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
     DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
                      false),
-    DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
-    DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 6eeee57c9d..1cb76ba2a9 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -377,8 +377,12 @@ static void musca_init(MachineState *machine)
     mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
     clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
 
+    /*
+     * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
+     * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
+     */
     object_initialize_child(OBJECT(machine), "sse-200", &mms->sse,
-                            TYPE_SSE200);
+                            mmc->type == MUSCA_A ? TYPE_SSE200 : TYPE_SSE200_B);
     ssedev = DEVICE(&mms->sse);
     object_property_set_link(OBJECT(&mms->sse), "memory",
                              OBJECT(system_memory), &error_fatal);
@@ -387,14 +391,6 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
     qdev_connect_clock_in(ssedev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(ssedev, "S32KCLK", mms->s32kclk);
-    /*
-     * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
-     * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
-     */
-    if (mmc->type == MUSCA_B1) {
-        qdev_prop_set_bit(ssedev, "CPU0_FPU", true);
-        qdev_prop_set_bit(ssedev, "CPU0_DSP", true);
-    }
     sysbus_realize(SYS_BUS_DEVICE(&mms->sse), &error_fatal);
 
     /*
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f4d8be6c4c..0824af601f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1305,9 +1305,6 @@ static Property arm_cpu_has_vfp_property =
 static Property arm_cpu_has_neon_property =
             DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
 
-static Property arm_cpu_has_dsp_property =
-            DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
-
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -1428,7 +1425,7 @@ static void arm_cpu_post_init(Object *obj)
         ? cpu_isar_feature(aa64_fp_simd, cpu)
         : cpu_isar_feature(aa32_vfp, cpu)) {
         cpu->has_vfp = true;
-        if (!kvm_enabled()) {
+        if (!kvm_enabled() && !arm_feature(&cpu->env, ARM_FEATURE_M)) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
         }
     }
@@ -1440,11 +1437,6 @@ static void arm_cpu_post_init(Object *obj)
         }
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_M) &&
-        arm_feature(&cpu->env, ARM_FEATURE_THUMB_DSP)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_dsp_property);
-    }
-
     if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property);
         if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
@@ -1801,26 +1793,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.mvfr1 = u;
     }
 
-    if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
-        uint32_t u;
-
-        unset_feature(env, ARM_FEATURE_THUMB_DSP);
-
-        u = cpu->isar.id_isar1;
-        u = FIELD_DP32(u, ID_ISAR1, EXTEND, 1);
-        cpu->isar.id_isar1 = u;
-
-        u = cpu->isar.id_isar2;
-        u = FIELD_DP32(u, ID_ISAR2, MULTU, 1);
-        u = FIELD_DP32(u, ID_ISAR2, MULTS, 1);
-        cpu->isar.id_isar2 = u;
-
-        u = cpu->isar.id_isar3;
-        u = FIELD_DP32(u, ID_ISAR3, SIMD, 1);
-        u = FIELD_DP32(u, ID_ISAR3, SATURATE, 0);
-        cpu->isar.id_isar3 = u;
-    }
-
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_M)) {
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index a3b6940040..2292597c3c 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -661,6 +661,34 @@ static void cortex_m3_class_init(ARMCPUClass *acc)
     acc->isar.id_isar6 = 0x00000000;
 }
 
+static void disable_m_dsp(ARMCPUClass *acc)
+{
+    uint32_t u;
+
+    u = acc->isar.id_isar1;
+    u = FIELD_DP32(u, ID_ISAR1, EXTEND, 1);
+    acc->isar.id_isar1 = u;
+
+    u = acc->isar.id_isar2;
+    u = FIELD_DP32(u, ID_ISAR2, MULTU, 1);
+    u = FIELD_DP32(u, ID_ISAR2, MULTS, 1);
+    acc->isar.id_isar2 = u;
+
+    u = acc->isar.id_isar3;
+    u = FIELD_DP32(u, ID_ISAR3, SIMD, 1);
+    u = FIELD_DP32(u, ID_ISAR3, SATURATE, 0);
+    acc->isar.id_isar3 = u;
+
+    unset_class_feature(acc, ARM_FEATURE_THUMB_DSP);
+}
+
+static void disable_m_vfp(ARMCPUClass *acc)
+{
+    acc->isar.mvfr0 = 0;
+    acc->isar.mvfr1 = 0;
+    acc->isar.mvfr2 = 0;
+}
+
 static void cortex_m4_class_init(ARMCPUClass *acc)
 {
     set_class_feature(acc, ARM_FEATURE_V7);
@@ -689,6 +717,12 @@ static void cortex_m4_class_init(ARMCPUClass *acc)
     acc->isar.id_isar6 = 0x00000000;
 }
 
+static void cortex_m4_nf_class_init(ARMCPUClass *acc)
+{
+    cortex_m4_class_init(acc);
+    disable_m_vfp(acc);
+}
+
 static void cortex_m7_class_init(ARMCPUClass *acc)
 {
     set_class_feature(acc, ARM_FEATURE_V7);
@@ -717,6 +751,12 @@ static void cortex_m7_class_init(ARMCPUClass *acc)
     acc->isar.id_isar6 = 0x00000000;
 }
 
+static void cortex_m7_nf_class_init(ARMCPUClass *acc)
+{
+    cortex_m7_class_init(acc);
+    disable_m_vfp(acc);
+}
+
 static void cortex_m33_class_init(ARMCPUClass *acc)
 {
     set_class_feature(acc, ARM_FEATURE_V8);
@@ -749,6 +789,25 @@ static void cortex_m33_class_init(ARMCPUClass *acc)
     acc->ctr = 0x8000c000;
 }
 
+static void cortex_m33_nd_class_init(ARMCPUClass *acc)
+{
+    cortex_m33_class_init(acc);
+    disable_m_dsp(acc);
+}
+
+static void cortex_m33_nf_class_init(ARMCPUClass *acc)
+{
+    cortex_m33_class_init(acc);
+    disable_m_vfp(acc);
+}
+
+static void cortex_m33_ndnf_class_init(ARMCPUClass *acc)
+{
+    cortex_m33_class_init(acc);
+    disable_m_dsp(acc);
+    disable_m_vfp(acc);
+}
+
 static void cortex_m55_class_init(ARMCPUClass *acc)
 {
     set_class_feature(acc, ARM_FEATURE_V8);
@@ -784,6 +843,12 @@ static void cortex_m55_class_init(ARMCPUClass *acc)
     acc->ctr = 0x8303c003;
 }
 
+static void cortex_m55_nf_class_init(ARMCPUClass *acc)
+{
+    cortex_m55_class_init(acc);
+    disable_m_vfp(acc);
+}
+
 static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
     /* Dummy the TCM region regs for the moment */
     { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
@@ -1081,10 +1146,26 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
 static const ARMCPUInfo arm_v7m_tcg_cpus[] = {
     { .name = "cortex-m0",   .class_init = cortex_m0_class_init },
     { .name = "cortex-m3",   .class_init = cortex_m3_class_init },
+
     { .name = "cortex-m4",   .class_init = cortex_m4_class_init },
+    { .name = "cortex-m4-novfp",
+      .class_init = cortex_m4_nf_class_init },
+
     { .name = "cortex-m7",   .class_init = cortex_m7_class_init },
+    { .name = "cortex-m7-novfp",
+      .class_init = cortex_m7_nf_class_init },
+
     { .name = "cortex-m33",  .class_init = cortex_m33_class_init },
+    { .name = "cortex-m33-nodsp",
+      .class_init = cortex_m33_nd_class_init },
+    { .name = "cortex-m33-novfp",
+      .class_init = cortex_m33_nf_class_init },
+    { .name = "cortex-m33-nodsp-novfp",
+      .class_init = cortex_m33_ndnf_class_init },
+
     { .name = "cortex-m55",  .class_init = cortex_m55_class_init },
+    { .name = "cortex-m55-novfp",
+      .class_init = cortex_m55_nf_class_init },
 };
 
 static const TypeInfo arm_v7m_cpu_type_info = {
-- 
2.34.1


