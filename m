Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC2265C631
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:27:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClsA-0001J0-Nw; Tue, 03 Jan 2023 13:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCls8-0001ER-EA
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:48 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCls6-0005PZ-Ev
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:48 -0500
Received: by mail-qt1-x82d.google.com with SMTP id h21so25144672qta.12
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XGZyyVJrORAvKbSeUKRUPp59hPckNE/NE/CsroPLC8I=;
 b=NHdHvaU7cg6ADgfUMSqL7Wufc7pZP03nykMBJ9xVriepX1f33rUqc46D/u75EOYxSY
 gPhPG1EUmdtPfcVRRAGJSQwN+/HQdBpUkwQYEzcX3WKeXkasgD4OyUIsHsOGjy50JNYc
 ALLGncTt66v18D5DBboIEktqmHm4ZMR+ha8jiTEVB8TBQd7LKEKm3IBltJb92kQjU9Oi
 v0tfeHa4IPZaNJlZbdNZQNuIjQU1Ju+lWi7eVEDrJWcllfuX6dTotmaDLfziY94kEljC
 rEwNuIWQv59VxETU2ttkva55t9B6+2mwaJb7kWjqREcMRiL1wIc37+jRaDasZ7iRGO4y
 MNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XGZyyVJrORAvKbSeUKRUPp59hPckNE/NE/CsroPLC8I=;
 b=IDA//vVpONJ6YqSq1aFBC/bDyMLEUtlf8TnlZcw9PWyEBV/jjsDwr1oCz7ok/LHHd1
 4YhpWNDrJD1hknW5gJ/iPbSd4FI/yWTZ16Nsb6ChTENVP5cCZCLObY5SGPu0SOpgN0L2
 S4K4pjUufJ/QZiGT/VER1XT2eKaCSZRKMQ+4OO1oP2jB3778As7g9ARsehvxUpNf/NEF
 jcElrNcyvLs3wVzlzGg4Qbh94IfiWJsRQl1GEcJdx41c1NkRs7JF1OUuZJmnUm16l5ve
 QRJRpfkvGnW+yFnKRFlTW3S5n2uXhP6z96WvyIB8f5520bxgJJR4Ba+D9+jWSRhwRNwo
 7kTA==
X-Gm-Message-State: AFqh2kpEXFiLIYWQMzK0ZrdiBsW39KIYJS4iIHlxM8r+A4paEK2c8sYB
 MQziykX1NRul0c9tMiMw65n59AqA6ubGtM5fKrk=
X-Google-Smtp-Source: AMrXdXtTW8RU7pZZs7OjtgjAZ9BsRtWxWxZz0yyGtZGe0WSmOl1eSRD5Is+C6AkfOvV2ww98TC31CA==
X-Received: by 2002:a05:622a:4c0f:b0:3ab:8975:ad89 with SMTP id
 ey15-20020a05622a4c0f00b003ab8975ad89mr46381625qtb.60.1672769925314; 
 Tue, 03 Jan 2023 10:18:45 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 39/40] target/arm: Move "has-mpu" and "pmsav7-dregion" to
 class properties
Date: Tue,  3 Jan 2023 10:16:45 -0800
Message-Id: <20230103181646.55711-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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

With the movement of the properties, we can remove the has_mpu field
from the cpu entirely, using only the class.  The pmsav7_dregion field
must stay in the cpu to handle the usage with VMSTATE_VARRAY_UINT32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h |   3 ++
 target/arm/cpu.h     |   2 -
 target/arm/cpu.c     | 117 ++++++++++++++++++++++++-------------------
 target/arm/helper.c  |   3 +-
 4 files changed, 71 insertions(+), 54 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 0e71569ab5..8f266baa26 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -192,6 +192,9 @@ struct ARMCPUClass {
     OnOffAuto has_vfp;
     /* CPU has Neon */
     OnOffAuto has_neon;
+
+    /* CPU has memory protection unit */
+    bool has_mpu;
 };
 
 static inline int arm_class_feature(ARMCPUClass *acc, int feature)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8d2f78b601..1b181ecde4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -889,8 +889,6 @@ struct ArchCPU {
     /* CPU has PMU (Performance Monitor Unit) */
     bool has_pmu;
 
-    /* CPU has memory protection unit */
-    bool has_mpu;
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
     /* v8M SAU number of supported regions */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e48f62a6fc..b984735793 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1279,19 +1279,6 @@ static void arm_cpu_initfn(Object *obj)
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
-static Property arm_cpu_has_mpu_property =
-            DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
-
-/* This is like DEFINE_PROP_UINT32 but it doesn't set the default value,
- * because the CPU initfn will have already set cpu->pmsav7_dregion to
- * the right value for that particular CPU type, and we don't want
- * to override that with an incorrect constant value.
- */
-static Property arm_cpu_pmsav7_dregion_property =
-            DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
-                                           pmsav7_dregion,
-                                           qdev_prop_uint32, uint32_t);
-
 static bool arm_get_pmu(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1375,14 +1362,6 @@ static void arm_cpu_post_init(Object *obj)
         object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property);
-        if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
-            qdev_property_add_static(DEVICE(obj),
-                                     &arm_cpu_pmsav7_dregion_property);
-        }
-    }
-
     if (arm_feature(&cpu->env, ARM_FEATURE_M_SECURITY)) {
         object_property_add_link(obj, "idau", TYPE_IDAU_INTERFACE, &cpu->idau,
                                  qdev_prop_allow_set_link_before_realize,
@@ -1663,39 +1642,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
     }
 
-    /* MPU can be configured out of a PMSA CPU either by setting has-mpu
-     * to false or by setting pmsav7-dregion to 0.
-     */
-    if (!cpu->has_mpu) {
-        cpu->pmsav7_dregion = 0;
-    }
-    if (cpu->pmsav7_dregion == 0) {
-        cpu->has_mpu = false;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_PMSA) &&
-        arm_feature(env, ARM_FEATURE_V7)) {
+    if (cpu->pmsav7_dregion) {
         uint32_t nr = cpu->pmsav7_dregion;
 
-        if (nr > 0xff) {
-            error_setg(errp, "PMSAv7 MPU #regions invalid %" PRIu32, nr);
-            return;
-        }
-
-        if (nr) {
-            if (arm_feature(env, ARM_FEATURE_V8)) {
-                /* PMSAv8 */
-                env->pmsav8.rbar[M_REG_NS] = g_new0(uint32_t, nr);
-                env->pmsav8.rlar[M_REG_NS] = g_new0(uint32_t, nr);
-                if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-                    env->pmsav8.rbar[M_REG_S] = g_new0(uint32_t, nr);
-                    env->pmsav8.rlar[M_REG_S] = g_new0(uint32_t, nr);
-                }
-            } else {
-                env->pmsav7.drbar = g_new0(uint32_t, nr);
-                env->pmsav7.drsr = g_new0(uint32_t, nr);
-                env->pmsav7.dracr = g_new0(uint32_t, nr);
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            /* PMSAv8 */
+            env->pmsav8.rbar[M_REG_NS] = g_new0(uint32_t, nr);
+            env->pmsav8.rlar[M_REG_NS] = g_new0(uint32_t, nr);
+            if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+                env->pmsav8.rbar[M_REG_S] = g_new0(uint32_t, nr);
+                env->pmsav8.rlar[M_REG_S] = g_new0(uint32_t, nr);
             }
+        } else {
+            env->pmsav7.drbar = g_new0(uint32_t, nr);
+            env->pmsav7.drsr = g_new0(uint32_t, nr);
+            env->pmsav7.dracr = g_new0(uint32_t, nr);
         }
     }
 
@@ -1933,6 +1894,28 @@ static const struct TCGCPUOps arm_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static bool arm_class_prop_bool_ofs(ObjectClass *oc, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uintptr_t ofs = (uintptr_t)opaque;
+    bool *ptr = (void *)acc + ofs;
+
+    return visit_type_bool(v, name, ptr, errp);
+}
+
+static bool arm_class_prop_uint32_ofs(ObjectClass *oc, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uintptr_t ofs = (uintptr_t)opaque;
+    uint32_t *ptr = (void *)acc + ofs;
+
+    return visit_type_uint32(v, name, ptr, errp);
+}
+
 static bool arm_class_prop_uint64_ofs(ObjectClass *oc, Visitor *v,
                                       const char *name, void *opaque,
                                       Error **errp)
@@ -2202,6 +2185,22 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
                            arm_class_prop_set_auto_ofs,
                            (void *)(uintptr_t)offsetof(ARMCPUClass, has_neon));
     }
+
+    if (arm_class_feature(acc, ARM_FEATURE_PMSA)) {
+        acc->has_mpu = true;
+        class_property_add(oc, "has-mpu", "bool", NULL,
+                           arm_class_prop_bool_ofs,
+                           arm_class_prop_bool_ofs,
+                           (void *)(uintptr_t)offsetof(ARMCPUClass, has_mpu));
+
+        if (arm_class_feature(acc, ARM_FEATURE_V7)) {
+            class_property_add(oc, "pmsav7-dregion", "uint32", NULL,
+                               arm_class_prop_uint32_ofs,
+                               arm_class_prop_uint32_ofs,
+                               (void *)(uintptr_t)
+                               offsetof(ARMCPUClass, pmsav7_dregion));
+        }
+    }
 }
 
 static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
@@ -2439,6 +2438,22 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
         }
     }
 
+    /*
+     * MPU can be configured out of a PMSA CPU either by setting has-mpu
+     * to false or by setting pmsav7-dregion to 0.
+     */
+    if (!acc->has_mpu) {
+        acc->pmsav7_dregion = 0;
+    }
+    if (acc->pmsav7_dregion == 0) {
+        acc->has_mpu = false;
+    }
+    if (acc->pmsav7_dregion > 0xff) {
+        error_setg(errp, "PMSAv7 MPU #regions invalid %" PRIu32,
+                   acc->pmsav7_dregion);
+        return false;
+    }
+
     /* Run some consistency checks for TCG. */
     if (tcg_enabled()) {
         bool no_aa32 = arm_class_feature(acc, ARM_FEATURE_AARCH64) &&
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e414fa11dd..90f49108f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4804,8 +4804,9 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
 
-    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
+    if (arm_feature(env, ARM_FEATURE_PMSA) && !acc->has_mpu) {
         /* M bit is RAZ/WI for PMSA with no MPU implemented */
         value &= ~SCTLR_M;
     }
-- 
2.34.1


