Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315933F8D2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:11:02 +0100 (CET)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbZM-0004N5-Iw
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMax9-0004Vv-IT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:48796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMaws-0007uk-2P
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16420AF2B;
 Wed, 17 Mar 2021 18:30:38 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 49/50] target/arm: cpu-pauth: new module for ARMv8.3 Pointer
 Authentication
Date: Wed, 17 Mar 2021 19:30:12 +0100
Message-Id: <20210317183013.25772-50-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317183013.25772-1-cfontana@suse.de>
References: <20210317183013.25772-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pointer Authentication is an AARCH64-only ARMv8.3 optional
extension, whose cpu properties can be separated out in its own module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.h           | 13 +-------
 target/arm/tcg/cpu-pauth.h | 38 ++++++++++++++++++++++
 target/arm/cpu.c           |  3 +-
 target/arm/cpu64.c         | 34 +-------------------
 target/arm/tcg/cpu-pauth.c | 66 ++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |  1 +
 6 files changed, 108 insertions(+), 47 deletions(-)
 create mode 100644 target/arm/tcg/cpu-pauth.h
 create mode 100644 target/arm/tcg/cpu-pauth.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 662ac5ee62..e9cfb99ad9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -203,6 +203,7 @@ typedef struct {
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
 # include "cpu-sve.h"
+# include "tcg/cpu-pauth.h"
 #else
 # define ARM_MAX_VQ    1
 #endif /* TARGET_AARCH64 */
@@ -211,18 +212,6 @@ typedef struct ARMVectorReg {
     uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
 } ARMVectorReg;
 
-/* ARMv8.3 Pointer Authentication Extension (AARCH64-only) */
-
-#ifdef TARGET_AARCH64
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
-/* In AArch32 mode, PAC keys do not exist at all.  */
-typedef struct ARMPACKey {
-    uint64_t lo, hi;
-} ARMPACKey;
-#else
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-#endif
-
 typedef struct CPUARMState {
     /* Regs for current mode.  */
     uint32_t regs[16];
diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
new file mode 100644
index 0000000000..5b130cdada
--- /dev/null
+++ b/target/arm/tcg/cpu-pauth.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU AArch64 Pointer Authentication Extensions
+ *
+ * Copyright (c) 2013 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#ifndef CPU_PAUTH_H
+#define CPU_PAUTH_H
+
+/* ARMv8.3 pauth is an AARCH64 option, only include this for TARGET_AARCH64 */
+
+/* called by arm_cpu_finalize_features in realizefn */
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+
+/* add the CPU Pointer Authentication properties */
+void cpu_pauth_add_props(Object *obj);
+
+/* Pointer Authentication Code Key */
+
+typedef struct ARMPACKey {
+    uint64_t lo, hi;
+} ARMPACKey;
+
+#endif /* CPU_PAUTH_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6cf688d772..cf4676e52c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -843,8 +843,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
          * is in use, so the user will not be able to set them.
          */
         if (tcg_enabled()) {
-            arm_cpu_pauth_finalize(cpu, &local_err);
-            if (local_err != NULL) {
+            if (!cpu_pauth_finalize(cpu, &local_err)) {
                 error_propagate(errp, local_err);
                 return;
             }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 70345fbecb..9bc5ddfc09 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -245,36 +245,6 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
-{
-    int arch_val = 0, impdef_val = 0;
-    uint64_t t;
-
-    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
-    if (cpu->prop_pauth) {
-        if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
-        } else {
-            arch_val = 1;
-        }
-    } else if (cpu->prop_pauth_impdef) {
-        error_setg(errp, "cannot enable pauth-impdef without pauth");
-        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
-    }
-
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
-    cpu->isar.id_aa64isar1 = t;
-}
-
-static Property arm_cpu_pauth_property =
-    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
-static Property arm_cpu_pauth_impdef_property =
-    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
-
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -433,9 +403,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-        /* Default to PAUTH on, with the architected algorithm. */
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+        cpu_pauth_add_props(obj);
     }
 
     cpu_sve_add_props(obj);
diff --git a/target/arm/tcg/cpu-pauth.c b/target/arm/tcg/cpu-pauth.c
new file mode 100644
index 0000000000..4f087923ac
--- /dev/null
+++ b/target/arm/tcg/cpu-pauth.c
@@ -0,0 +1,66 @@
+/*
+ * QEMU AArch64 Pointer Authentication Extensions
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "sysemu/tcg.h"
+#include "tcg/cpu-pauth.h"
+#include "hw/qdev-properties.h"
+
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+{
+    bool result = true;
+    int arch_val = 0, impdef_val = 0;
+    uint64_t t;
+
+    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
+    if (cpu->prop_pauth) {
+        if (cpu->prop_pauth_impdef) {
+            impdef_val = 1;
+        } else {
+            arch_val = 1;
+        }
+    } else if (cpu->prop_pauth_impdef) {
+        error_setg(errp, "cannot enable pauth-impdef without pauth");
+        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
+        result = false;
+    }
+
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
+    cpu->isar.id_aa64isar1 = t;
+    return result;
+}
+
+static Property arm_cpu_pauth_property =
+    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
+static Property arm_cpu_pauth_impdef_property =
+    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
+
+void cpu_pauth_add_props(Object *obj)
+{
+    /* Default to PAUTH on, with the architected algorithm. */
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index d22e5efb84..47d80a06f5 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -40,6 +40,7 @@ arm_ss.add(when: ['TARGET_AARCH64', 'CONFIG_TCG'], if_true: files(
   'pauth_helper.c',
   'sve_helper.c',
   'cpu-sve.c',
+  'cpu-pauth.c',
 ))
 
 subdir('user')
-- 
2.26.2


