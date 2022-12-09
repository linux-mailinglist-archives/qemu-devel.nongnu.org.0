Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916CA648181
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bOS-0002G9-In; Fri, 09 Dec 2022 06:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bO3-0002Aq-6Q
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:17:57 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bNx-0005i5-B4
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:17:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id f18so4865271wrj.5
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jfhc3x6jzrxNP376or3RNjR3F8wMtVqE4b+ijWwzKS4=;
 b=Sbho48j1dVf6znqaQO+DdIE02CDpMVgwukhT9Uqq2jd5XrxKK6N9aWxIRCWKwRGXoX
 K8rm7ippF3ejUb+qgMLDlFM4bMCxafW/2+Yl9jTmWR860FZFegE40o5y45FLGA+CVami
 xKX0CVYbxYo4moFpvOuC2gEZGv3iC53balG55Hc3olfUDLBuQIm84gT70WnS5W4Ycv08
 WEvSBVzKxXsgdcSsB7V0lxW4MD10vtiSSVsQoiQ7+ym3FC1WZT/De+AU/MqxOqEmLqmq
 k2yzbDm1/PwsMqJCLZkpL9xzqchS8k/PA7qOyavLZsS94mzLsaWBuq7PtV40kON5V41n
 jWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jfhc3x6jzrxNP376or3RNjR3F8wMtVqE4b+ijWwzKS4=;
 b=3ozdmTqALrmhlVGOWZKjWvUW1jOZcQvNdI8b4Jr+00yBIJqrMdOr+vzFhTjB+n0V+W
 SlVAqOCxXg+qqLcMDkz1M7w+0etxQyVWAnRdyrM6bjYqcz4kS4c0NDtonbK3aSaxD7ax
 pUXnf0chjXkVG/oz52IJHwFDLcNbrW7RxcMA+m6WoD57V4r5Ka2U1OY5WfPvg7mhuI3Q
 sfmJZ+UTplRJkeiuCz62xk5TK66ylHNde2jVsz1ogwdlEBrNSKtmohfYh+Yo5xdODhDQ
 Creb35x/UlmY2p0fGf29w1rOb8J+4Eu9vVcEvLyrmPw5GKpvcn+JUOry2OYaODGYimV9
 7FZw==
X-Gm-Message-State: ANoB5plpfd0a5+tyP+JQYnQK5myMG/kuwlhaYDaHLM58QrkH5AOi6nSJ
 UW/4nu7IiCp+Kb2D+jGolDHAhvX/vRqTO6sEkQM=
X-Google-Smtp-Source: AA0mqf6gqzUO6+S9vDVYfafHpaesKk9saWKNqJVjxjai4UoJ0WaPyAhKUrAy8dut9vk6QXkTqQtk4w==
X-Received: by 2002:a5d:488f:0:b0:236:74c5:7ec with SMTP id
 g15-20020a5d488f000000b0023674c507ecmr3201769wrq.13.1670584658820; 
 Fri, 09 Dec 2022 03:17:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 cc19-20020a5d5c13000000b0024165454262sm1169787wrb.11.2022.12.09.03.17.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:17:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0] target/arm: Keep "internals.h" internal to
 target/arm/
Date: Fri,  9 Dec 2022 12:17:36 +0100
Message-Id: <20221209111736.59796-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"target/arm/internals.h" is supposed to be *internal* to
target/arm/. hw/arm/virt.c includes it to get arm_pamax()
declaration. Move this declaration to "cpu.h" which can
be included out of target/arm/, and move the implementation
in machine.c which is always built with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Do we need a new pair of c/h for architectural helpers?

ptw.c should be restricted to TCG.
---
 hw/arm/virt.c          |  2 +-
 target/arm/cpu.h       |  9 +++++++++
 target/arm/internals.h |  9 ---------
 target/arm/machine.c   | 39 +++++++++++++++++++++++++++++++++++++++
 target/arm/ptw.c       | 39 ---------------------------------------
 5 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..4528ca8da2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -70,7 +70,6 @@
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
-#include "target/arm/internals.h"
 #include "hw/mem/memory-device.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
@@ -79,6 +78,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "target/arm/cpu.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9aeed3c848..8cdad4855f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3444,6 +3444,15 @@ static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
 }
 #endif
 
+/*
+ * arm_pamax
+ * @cpu: ARMCPU
+ *
+ * Returns the implementation defined bit-width of physical addresses.
+ * The ARMv8 reference manuals refer to this as PAMax().
+ */
+unsigned int arm_pamax(ARMCPU *cpu);
+
 /*
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 161e42d50f..5e9546b6a3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -241,15 +241,6 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
     aarch64_restore_sp(env, cur_el);
 }
 
-/*
- * arm_pamax
- * @cpu: ARMCPU
- *
- * Returns the implementation defined bit-width of physical addresses.
- * The ARMv8 reference manuals refer to this as PAMax().
- */
-unsigned int arm_pamax(ARMCPU *cpu);
-
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
  * but depends on TTBCR.EAE for 32 bit.
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 54c5c62433..51f84f90f0 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -6,6 +6,45 @@
 #include "internals.h"
 #include "migration/cpu.h"
 
+/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
+static const uint8_t pamax_map[] = {
+    [0] = 32,
+    [1] = 36,
+    [2] = 40,
+    [3] = 42,
+    [4] = 44,
+    [5] = 48,
+    [6] = 52,
+};
+
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        unsigned int parange =
+            FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+        /*
+         * id_aa64mmfr0 is a read-only register so values outside of the
+         * supported mappings can be considered an implementation error.
+         */
+        assert(parange < ARRAY_SIZE(pamax_map));
+        return pamax_map[parange];
+    }
+
+    /*
+     * In machvirt_init, we call arm_pamax on a cpu that is not fully
+     * initialized, so we can't rely on the propagation done in realize.
+     */
+    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
+        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
+        /* v7 with LPAE */
+        return 40;
+    }
+    /* Anything else */
+    return 32;
+}
+
 static bool vfp_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f812734bfb..03703cb107 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -42,45 +42,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
-/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
-static const uint8_t pamax_map[] = {
-    [0] = 32,
-    [1] = 36,
-    [2] = 40,
-    [3] = 42,
-    [4] = 44,
-    [5] = 48,
-    [6] = 52,
-};
-
-/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
-unsigned int arm_pamax(ARMCPU *cpu)
-{
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        unsigned int parange =
-            FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-        /*
-         * id_aa64mmfr0 is a read-only register so values outside of the
-         * supported mappings can be considered an implementation error.
-         */
-        assert(parange < ARRAY_SIZE(pamax_map));
-        return pamax_map[parange];
-    }
-
-    /*
-     * In machvirt_init, we call arm_pamax on a cpu that is not fully
-     * initialized, so we can't rely on the propagation done in realize.
-     */
-    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
-        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
-        /* v7 with LPAE */
-        return 40;
-    }
-    /* Anything else */
-    return 32;
-}
-
 /*
  * Convert a possible stage1+2 MMU index into the appropriate stage 1 MMU index
  */
-- 
2.38.1


