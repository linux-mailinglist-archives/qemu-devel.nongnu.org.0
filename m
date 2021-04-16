Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC9362743
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:55:04 +0200 (CEST)
Received: from localhost ([::1]:38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSgJ-0006WI-7B
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLc-0005Jd-A2
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:47062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLR-0001eC-FG
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54979B2F0;
 Fri, 16 Apr 2021 16:28:59 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v14 73/80] target/arm: cpu-pauth: new module for ARMv8.3 Pointer
 Authentication
Date: Fri, 16 Apr 2021 18:28:17 +0200
Message-Id: <20210416162824.25131-74-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210416162824.25131-1-cfontana@suse.de>
References: <20210416162824.25131-1-cfontana@suse.de>
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
 target/arm/cpu.h           |  3 --
 target/arm/tcg/cpu-pauth.h | 34 ++++++++++++++++++++
 target/arm/cpu.c           |  1 +
 target/arm/cpu64.c         | 35 ++-------------------
 target/arm/tcg/cpu-pauth.c | 63 ++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |  1 +
 6 files changed, 101 insertions(+), 36 deletions(-)
 create mode 100644 target/arm/tcg/cpu-pauth.h
 create mode 100644 target/arm/tcg/cpu-pauth.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 56326da1f8..236717ec71 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -216,13 +216,10 @@ typedef struct ARMPredicateReg {
     uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
 } ARMPredicateReg;
 
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 /* In AArch32 mode, PAC keys do not exist at all.  */
 typedef struct ARMPACKey {
     uint64_t lo, hi;
 } ARMPACKey;
-#else
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
 
 #endif /* TARGET_AARCH64 */
 
diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
new file mode 100644
index 0000000000..af127876fe
--- /dev/null
+++ b/target/arm/tcg/cpu-pauth.h
@@ -0,0 +1,34 @@
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
+#include "cpu.h"
+
+/* called by arm_cpu_finalize_features in realizefn */
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+
+/* add the CPU Pointer Authentication properties */
+void cpu_pauth_add_props(Object *obj);
+
+#endif /* CPU_PAUTH_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e9867c991a..229ef989b4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -33,6 +33,7 @@
 #ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
+#include "tcg/cpu-pauth.h"
 #include "cpu32.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b1b5cf5cc9..b76fbb4947 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "cpu32.h"
 #include "cpu-sve.h"
+#include "tcg/cpu-pauth.h"
 #include "qemu/module.h"
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
@@ -246,36 +247,6 @@ static void aarch64_a72_initfn(Object *obj)
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
@@ -433,9 +404,7 @@ static void aarch64_max_initfn(Object *obj)
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
index 0000000000..f821087b14
--- /dev/null
+++ b/target/arm/tcg/cpu-pauth.c
@@ -0,0 +1,63 @@
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
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+{
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
+    }
+
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
+    cpu->isar.id_aa64isar1 = t;
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
index b6040f0320..8c4b7ca7a7 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -36,6 +36,7 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
 ))
 
 arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
+  'cpu-pauth.c',
   'translate-a64.c',
   'translate-sve.c',
   'helper-a64.c',
-- 
2.26.2


