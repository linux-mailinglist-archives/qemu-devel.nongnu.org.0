Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B66738B1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU90-00075e-Rd; Thu, 19 Jan 2023 07:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8y-0006zD-7V; Thu, 19 Jan 2023 07:35:48 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8w-0007dk-8F; Thu, 19 Jan 2023 07:35:47 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYF1kH8z4xyV;
 Thu, 19 Jan 2023 23:35:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYC3FM7z4xZj;
 Thu, 19 Jan 2023 23:35:43 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 15/25] target/arm: Allow users to set the number of VFP
 registers
Date: Thu, 19 Jan 2023 13:34:39 +0100
Message-Id: <20230119123449.531826-16-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
have 16 64-bit FPU registers and not 32 registers. Let users set the
number of VFP registers with a CPU property.

The primary use case of this property is for the Cortex A7 of the
Aspeed AST2600 SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/arm/cpu.h        |  2 ++
 hw/arm/aspeed_ast2600.c |  2 ++
 target/arm/cpu.c        | 31 +++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..5f2fefef4e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -901,6 +901,8 @@ struct ArchCPU {
     bool has_pmu;
     /* CPU has VFP */
     bool has_vfp;
+    /* CPU has 32 VFP registers */
+    bool has_vfp_d32;
     /* CPU has Neon */
     bool has_neon;
     /* CPU has M-profile DSP extension */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cd75465c2b..37f43b4165 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -309,6 +309,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                                 &error_abort);
         object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->cpu[i]), "vfp-d32", false,
+                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..ad90de75fb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1269,6 +1269,9 @@ static Property arm_cpu_cfgend_property =
 static Property arm_cpu_has_vfp_property =
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
 
+static Property arm_cpu_has_vfp_d32_property =
+            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
+
 static Property arm_cpu_has_neon_property =
             DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
 
@@ -1400,6 +1403,14 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 
+    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
+        cpu->has_vfp_d32 = true;
+        if (!kvm_enabled()) {
+            qdev_property_add_static(DEVICE(obj),
+                                     &arm_cpu_has_vfp_d32_property);
+        }
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
         if (!kvm_enabled()) {
@@ -1661,6 +1672,26 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!cpu->has_vfp_d32 &&
+        arm_feature(env, ARM_FEATURE_V8) &&
+        !arm_feature(env, ARM_FEATURE_M)) {
+        error_setg(errp, "ARMv8A CPUs must have VFP32");
+        return;
+    }
+
+    if (cpu->has_vfp_d32 != cpu->has_neon) {
+        error_setg(errp, "ARM CPUs must have both VFP32 and Neon or neither");
+        return;
+    }
+
+   if (!cpu->has_vfp_d32) {
+        uint32_t u;
+
+        u = cpu->isar.mvfr0;
+        u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
+        cpu->isar.mvfr0 = u;
+    }
+
     if (!cpu->has_vfp) {
         uint64_t t;
         uint32_t u;
-- 
2.39.0


