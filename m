Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A057665C607
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrt-0000re-8p; Tue, 03 Jan 2023 13:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrr-0000kJ-3C
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:31 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrp-0005NJ-4H
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:30 -0500
Received: by mail-qv1-xf35.google.com with SMTP id i12so21971381qvs.2
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoAnTqEKYUyofNs53oxpjz0CHNCNiHX3yNW6NklBHxc=;
 b=A1OdUv5XhgoYnJ9jUjAgslxUNeEDceQkWQU+o+tkk5oMWFcXXegUF0K6aUjiIUAcVT
 cDxC+1lrw5fhFVJI1/MjWIYrGx4Pn65ZQYcq0QLgVhhrwMactwNSKyF124gw0Lvk6MoY
 +d4r4TxzeNfPc2vNTt3czI9QoXkWtjgPixQePLMqLMU4nPegH/89Y8hHQu2WGmZV3ryk
 f1ES/ypi6GHumeiGCmuRWyYfTrqD9qBvMexgApDkqv3CUumgyxPB2laUAFKNYj5UlkvB
 DPLO2+jcwT1VuV5gEQWXXfAJyGu42gizXq/rVXGElPNqKjdEwLh85og44vqSXZNYKOsr
 nq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoAnTqEKYUyofNs53oxpjz0CHNCNiHX3yNW6NklBHxc=;
 b=jMUJe4Tob2XOSRIVX4GKh9iMP7XcE5b6rhX1Gpk6gEY5bHQlTlcPrrCxXyu939rvq3
 UvLlI7TktEfAXbC0aLRiMGkZuHHu14nzLkceMrZbhGFwYc5EAbWEEv5ego3aqw4f1gCW
 BENCXZxEer/TF8nb0IsrWFzLMMisURvi6KeFufhUVFnRDMePPuGNwwG/2tNvQR4M6OFN
 bXGJ8CnVBs7CLKEZQj1QaO8h/RiVJbhXZHzq+2KSst/IqcKOLewyIAONFZTp2M0oHKNo
 u6D6pWd3Z/rYtMTLa/yGsV+a5jvWex4BDUpqpzf/ky8q3bkJ9DmE1L0jgxLvDRa9mv/3
 PGzg==
X-Gm-Message-State: AFqh2kprGcqyYruZdVZNrubFR27Ref7h8PbL0Doeci+va3peFSmlo+SD
 0B4Zmaj0PqV2IiHBAO2zDfKZdvZqTrorC1HaO/4=
X-Google-Smtp-Source: AMrXdXsYVzfvZwvtWdRkhrWC3xYIoC33SZgeSd+rkf85Bv2vw3/EeBBw7PT4JAauG157BAfkK5cIyw==
X-Received: by 2002:ad4:548a:0:b0:531:d60f:6a98 with SMTP id
 pv10-20020ad4548a000000b00531d60f6a98mr4924542qvb.38.1672769908122; 
 Tue, 03 Jan 2023 10:18:28 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 33/40] target/arm: Move "cntfrq" to class property
Date: Tue,  3 Jan 2023 10:16:39 -0800
Message-Id: <20230103181646.55711-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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

With the movement of the property, we can remove the field
from the cpu entirely, using only the class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h    |  3 +++
 target/arm/cpu.h        |  3 ---
 hw/arm/aspeed_ast2600.c |  6 +++--
 target/arm/cpu.c        | 50 +++++++++++++++++++++++------------------
 target/arm/helper.c     |  3 ++-
 5 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 6b113d7fe6..2d6fa38a30 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -154,6 +154,9 @@ struct ARMCPUClass {
      */
     uint64_t ccsidr[16];
 
+    /* Generic timer counter frequency, in Hz */
+    uint64_t gt_cntfrq_hz;
+
     uint32_t revidr;
     uint32_t id_afr0;
     uint32_t reset_fpsid;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f2dceae0e7..e425846007 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1019,9 +1019,6 @@ struct ArchCPU {
 
     ARMVQMap sve_vq;
     ARMVQMap sme_vq;
-
-    /* Generic timer counter frequency, in Hz */
-    uint64_t gt_cntfrq_hz;
 };
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cd75465c2b..bb8579546e 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -145,6 +145,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
 {
     AspeedSoCState *s = ASPEED_SOC(obj);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    ObjectClass *cpu_class;
     int i;
     char socname[8];
     char typename[64];
@@ -153,6 +154,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
         g_assert_not_reached();
     }
 
+    cpu_class = object_class_by_name(sc->cpu_type);
+    class_property_set_uint(cpu_class, "cntfrq", 1125000000, &error_abort);
+
     for (i = 0; i < sc->num_cpus; i++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[i], sc->cpu_type);
     }
@@ -305,8 +309,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "mp-affinity",
                                 aspeed_calc_affinity(i), &error_abort);
 
-        object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
-                                &error_abort);
         object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
                                 &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7d68c50d7c..bc4a052e4c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1277,10 +1277,6 @@ static void arm_cpu_initfn(Object *obj)
     }
 }
 
-static Property arm_cpu_gt_cntfrq_property =
-            DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz,
-                               NANOSECONDS_PER_SECOND / GTIMER_SCALE);
-
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
@@ -1342,6 +1338,12 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
 {
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
+
+    if (!arm_class_feature(acc, ARM_FEATURE_GENERIC_TIMER)) {
+        return GTIMER_SCALE;
+    }
+
     /*
      * The exact approach to calculating guest ticks is:
      *
@@ -1360,8 +1362,8 @@ unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
      * Finally, CNTFRQ is effectively capped at 1GHz to ensure our scale factor
      * cannot become zero.
      */
-    return NANOSECONDS_PER_SECOND > cpu->gt_cntfrq_hz ?
-      NANOSECONDS_PER_SECOND / cpu->gt_cntfrq_hz : 1;
+    return (NANOSECONDS_PER_SECOND > acc->gt_cntfrq_hz ?
+            NANOSECONDS_PER_SECOND / acc->gt_cntfrq_hz : 1);
 }
 
 static void arm_cpu_post_init(Object *obj)
@@ -1466,10 +1468,6 @@ static void arm_cpu_post_init(Object *obj)
 
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property);
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
-        qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
-    }
-
     if (kvm_enabled()) {
         kvm_arm_add_vcpu_properties(obj);
     }
@@ -1614,18 +1612,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     {
-        uint64_t scale;
-
-        if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
-            if (!cpu->gt_cntfrq_hz) {
-                error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
-                           cpu->gt_cntfrq_hz);
-                return;
-            }
-            scale = gt_cntfrq_period_ns(cpu);
-        } else {
-            scale = GTIMER_SCALE;
-        }
+        uint64_t scale = gt_cntfrq_period_ns(cpu);
 
         cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                arm_gt_ptimer_cb, cpu);
@@ -2242,6 +2229,7 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
 
     acc->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
                                          NULL, g_free);
+    acc->gt_cntfrq_hz = NANOSECONDS_PER_SECOND / GTIMER_SCALE;
 
     acc->info = data;
     if (acc->info->class_init) {
@@ -2308,6 +2296,16 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
     if (arm_class_feature(acc, ARM_FEATURE_M)) {
         set_class_feature(acc, ARM_FEATURE_PMSA);
     }
+
+#ifndef CONFIG_USER_ONLY
+    if (arm_class_feature(acc, ARM_FEATURE_GENERIC_TIMER)) {
+        class_property_add(oc, "cntfrq", "uint64", NULL,
+                           arm_class_prop_uint64_ofs,
+                           arm_class_prop_uint64_ofs,
+                           (void *)(uintptr_t)
+                           offsetof(ARMCPUClass, gt_cntfrq_hz));
+    }
+#endif /* CONFIG_USER_ONLY */
 }
 
 static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
@@ -2320,6 +2318,14 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
         }
     }
 
+#ifndef CONFIG_USER_ONLY
+    /* TODO: Perhaps better to put this check in a property set hook. */
+    if (!acc->gt_cntfrq_hz) {
+        error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz", acc->gt_cntfrq_hz);
+        return false;
+    }
+#endif /* CONFIG_USER_ONLY */
+
     /* Run some consistency checks for TCG. */
     if (tcg_enabled()) {
         bool no_aa32 = arm_class_feature(acc, ARM_FEATURE_AARCH64) &&
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d18200ed16..67d32c2e59 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2977,8 +2977,9 @@ void arm_gt_hvtimer_cb(void *opaque)
 static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
 {
     ARMCPU *cpu = env_archcpu(env);
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
 
-    cpu->env.cp15.c14_cntfrq = cpu->gt_cntfrq_hz;
+    cpu->env.cp15.c14_cntfrq = acc->gt_cntfrq_hz;
 }
 
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
-- 
2.34.1


