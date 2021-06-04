Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F239BD19
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:28:52 +0200 (CEST)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCgl-0005rW-Si
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHy-0008Ec-B9
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHZ-0005nE-DO
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so1629616wmg.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1M9DSMG90oxpkIftDhmS6X3YTXP3prGe70gnCR2W/W0=;
 b=zqBSpXrVgFZHYH3MLkjTX40nmjnrTG1dVG15IOZoP5dtK/dTwoU1jDxFRaYDKemzjC
 MDqy4P4LuUHz2d5UIuYPPW32W/5YTO1VP426Uh3Fi/MF6mqHWvHloBrAktplt+UJcyTa
 LJLwC820GlaD1qcJsIwWs2wz9xZdgA2d1JDUAzn4J2pDppTmSWWqWE5n09urgB1qjOTF
 j62jYZqYHOVjaSGVZyEs/BiG0zUyg66K3o8IlXeWfrtmQM8QvdanolHWNYiS2EE/RK0i
 cWBwB4HUPVu/ig3J8CPLA/aqoc6BnjR3DoTtP7hlmWNwOmCHyCg/lDO8sMMKGPdKSaYr
 TvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1M9DSMG90oxpkIftDhmS6X3YTXP3prGe70gnCR2W/W0=;
 b=GsDEQTcRCNCz7zFUMhbHXxRqGoMtw/w3HbO1TGvQEGrHcQg2XwyqC4d6RinViB1Wyz
 +8LwVhvy9RSPR8/qFJ2JPeeRC5stZG7jtJKy3cK4p4a8H2g9XR03gJxgXulh0pd82i5V
 W0jqEmAuXvtvCeLwx8QXtGibIwpxf7vFUjHSz0ShLRW6VuKZFKWM3W1FONAdC2cryv/K
 SVRHd6bJqIfhc2OizxQrHqZ894Pdj/2zrHUk6+8ua8hBwbDrtz3pPjmhKyK3jZMoqhYR
 MfumONqaCOe3mKgtLeI7bRiSt9gB4CDdxsd0rmfwDLgg0rfLno4D14eg1KEpd7BVhl4s
 TTFw==
X-Gm-Message-State: AOAM531VYAU0NJxJmC4riQ0nRSr/E2vOfyRMu9EZ22dLHRTo9rjF4M3y
 LW0MQZcyYrfdKqNRk6Urk3iXYg==
X-Google-Smtp-Source: ABdhPJy5aJgTGsOdveDkCgsncsCH+sOgaRzZourWPm1MjJO5O+aRBnWWy/2e1OAHrWvsZGu/6wuheQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr4237576wmc.95.1622822567983;
 Fri, 04 Jun 2021 09:02:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s62sm9232329wms.13.2021.06.04.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 502211FFD2;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 61/99] target/arm: remove broad "else" statements when
 checking accels
Date: Fri,  4 Jun 2021 16:52:34 +0100
Message-Id: <20210604155312.15902-62-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <jgrall@amazon.com>,
 Olaf Hering <OHering@suse.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

There might be more than just KVM and TCG in the future,
so where appropriate, replace broad "else" statements
with the appropriate if (accel_enabled()) check.

Also invert some checks for !kvm_enabled() or !tcg_enabled()
where it seems appropriate to do so.

Note that to make qtest happy we need to perform gpio
initialization in the qtest_enabled() case as well.

Hopefully we do not break any Xen stuff.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Julien Grall <jgrall@amazon.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Olaf Hering <OHering@suse.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c     |  9 +++++----
 target/arm/cpu64.c   |  9 +++++----
 target/arm/machine.c | 18 ++++++------------
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7e3726ff00..57f975f5dc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -37,6 +37,7 @@
 #endif
 
 #include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
@@ -564,7 +565,7 @@ static void arm_cpu_initfn(Object *obj)
          * the same interface as non-KVM CPUs.
          */
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
-    } else {
+    } else if (tcg_enabled() || qtest_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
     }
 
@@ -741,14 +742,14 @@ void arm_cpu_post_init(Object *obj)
         ? cpu_isar_feature(aa64_fp_simd, cpu)
         : cpu_isar_feature(aa32_vfp, cpu)) {
         cpu->has_vfp = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
         }
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
         }
     }
@@ -849,7 +850,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
          * We have not registered the cpu properties when KVM
          * is in use, so the user will not be able to set them.
          */
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             arm_cpu_pauth_finalize(cpu, &local_err);
             if (local_err != NULL) {
                 error_propagate(errp, local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a8ff1994ca..e3d818275c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "cpu32.h"
 #include "qemu/module.h"
+#include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
@@ -297,7 +298,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              */
             bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
             bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
-        } else {
+        } else if (tcg_enabled()) {
             /* Propagate enabled bits down through required powers-of-two. */
             for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
                 if (!test_bit(vq - 1, cpu->sve_vq_init)) {
@@ -334,7 +335,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                                   "vector length must be enabled.\n");
                 return;
             }
-        } else {
+        } else if (tcg_enabled()) {
             /* Disabling a power-of-two disables all larger lengths. */
             if (test_bit(0, cpu->sve_vq_init)) {
                 error_setg(errp, "cannot disable sve128");
@@ -416,7 +417,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             }
             return;
         }
-    } else {
+    } else if (tcg_enabled()) {
         /* Ensure all required powers-of-two are enabled. */
         for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
             if (!test_bit(vq - 1, cpu->sve_vq_map)) {
@@ -610,7 +611,7 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-    } else {
+    } else if (tcg_enabled()) {
         uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 595ab94237..4acdccc22d 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -638,9 +638,11 @@ static int cpu_pre_save(void *opaque)
 
     if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
-    }
-
-    if (kvm_enabled()) {
+        if (!write_cpustate_to_list(cpu, false)) {
+            /* This should never fail. */
+            abort();
+        }
+    } else if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
             abort();
@@ -651,11 +653,6 @@ static int cpu_pre_save(void *opaque)
          * write_kvmstate_to_list()
          */
         kvm_arm_cpu_pre_save(cpu);
-    } else {
-        if (!write_cpustate_to_list(cpu, false)) {
-            /* This should never fail. */
-            abort();
-        }
     }
 
     cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
@@ -754,13 +751,10 @@ static int cpu_post_load(void *opaque, int version_id)
          */
         write_list_to_cpustate(cpu);
         kvm_arm_cpu_post_load(cpu);
-    } else {
+    } else if (tcg_enabled()) {
         if (!write_list_to_cpustate(cpu)) {
             return -1;
         }
-    }
-
-    if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
         hw_watchpoint_update_all(cpu);
 
-- 
2.20.1


