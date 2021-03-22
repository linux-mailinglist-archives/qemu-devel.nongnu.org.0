Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1959D344FD0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:23:15 +0100 (CET)
Received: from localhost ([::1]:51130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQ8w-0001i7-4E
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1w-0004wk-VN; Mon, 22 Mar 2021 15:16:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:48632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1t-0003ST-3N; Mon, 22 Mar 2021 15:16:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78503AF13;
 Mon, 22 Mar 2021 19:15:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v1 4/5] target/s390x: split cpu-dump from helper.c
Date: Mon, 22 Mar 2021 20:15:50 +0100
Message-Id: <20210322191551.25752-5-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322191551.25752-1-cfontana@suse.de>
References: <20210322191551.25752-1-cfontana@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/s390x/cpu-dump.c  | 131 +++++++++++++++++++++++++++++++++++++++
 target/s390x/helper.c    | 107 --------------------------------
 target/s390x/meson.build |   1 +
 3 files changed, 132 insertions(+), 107 deletions(-)
 create mode 100644 target/s390x/cpu-dump.c

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
new file mode 100644
index 0000000000..4170dec01a
--- /dev/null
+++ b/target/s390x/cpu-dump.c
@@ -0,0 +1,131 @@
+/*
+ * S/390 CPU dump to FILE
+ *
+ *  Copyright (c) 2009 Ulrich Hecht
+ *  Copyright (c) 2011 Alexander Graf
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "qemu/qemu-print.h"
+
+void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+    int i;
+
+    if (env->cc_op > 3) {
+        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %15s\n",
+                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
+    } else {
+        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %02x\n",
+                     env->psw.mask, env->psw.addr, env->cc_op);
+    }
+
+    for (i = 0; i < 16; i++) {
+        qemu_fprintf(f, "R%02d=%016" PRIx64, i, env->regs[i]);
+        if ((i % 4) == 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+
+    if (flags & CPU_DUMP_FPU) {
+        if (s390_has_feat(S390_FEAT_VECTOR)) {
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, "V%02d=%016" PRIx64 "%016" PRIx64 "%c",
+                             i, env->vregs[i][0], env->vregs[i][1],
+                             i % 2 ? '\n' : ' ');
+            }
+        } else {
+            for (i = 0; i < 16; i++) {
+                qemu_fprintf(f, "F%02d=%016" PRIx64 "%c",
+                             i, *get_freg(env, i),
+                             (i % 4) == 3 ? '\n' : ' ');
+            }
+        }
+    }
+
+#ifndef CONFIG_USER_ONLY
+    for (i = 0; i < 16; i++) {
+        qemu_fprintf(f, "C%02d=%016" PRIx64, i, env->cregs[i]);
+        if ((i % 4) == 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+#endif
+
+#ifdef DEBUG_INLINE_BRANCHES
+    for (i = 0; i < CC_OP_MAX; i++) {
+        qemu_fprintf(f, "  %15s = %10ld\t%10ld\n", cc_name(i),
+                     inline_branch_miss[i], inline_branch_hit[i]);
+    }
+#endif
+
+    qemu_fprintf(f, "\n");
+}
+
+const char *cc_name(enum cc_op cc_op)
+{
+    static const char * const cc_names[] = {
+        [CC_OP_CONST0]    = "CC_OP_CONST0",
+        [CC_OP_CONST1]    = "CC_OP_CONST1",
+        [CC_OP_CONST2]    = "CC_OP_CONST2",
+        [CC_OP_CONST3]    = "CC_OP_CONST3",
+        [CC_OP_DYNAMIC]   = "CC_OP_DYNAMIC",
+        [CC_OP_STATIC]    = "CC_OP_STATIC",
+        [CC_OP_NZ]        = "CC_OP_NZ",
+        [CC_OP_ADDU]      = "CC_OP_ADDU",
+        [CC_OP_SUBU]      = "CC_OP_SUBU",
+        [CC_OP_LTGT_32]   = "CC_OP_LTGT_32",
+        [CC_OP_LTGT_64]   = "CC_OP_LTGT_64",
+        [CC_OP_LTUGTU_32] = "CC_OP_LTUGTU_32",
+        [CC_OP_LTUGTU_64] = "CC_OP_LTUGTU_64",
+        [CC_OP_LTGT0_32]  = "CC_OP_LTGT0_32",
+        [CC_OP_LTGT0_64]  = "CC_OP_LTGT0_64",
+        [CC_OP_ADD_64]    = "CC_OP_ADD_64",
+        [CC_OP_SUB_64]    = "CC_OP_SUB_64",
+        [CC_OP_ABS_64]    = "CC_OP_ABS_64",
+        [CC_OP_NABS_64]   = "CC_OP_NABS_64",
+        [CC_OP_ADD_32]    = "CC_OP_ADD_32",
+        [CC_OP_SUB_32]    = "CC_OP_SUB_32",
+        [CC_OP_ABS_32]    = "CC_OP_ABS_32",
+        [CC_OP_NABS_32]   = "CC_OP_NABS_32",
+        [CC_OP_COMP_32]   = "CC_OP_COMP_32",
+        [CC_OP_COMP_64]   = "CC_OP_COMP_64",
+        [CC_OP_TM_32]     = "CC_OP_TM_32",
+        [CC_OP_TM_64]     = "CC_OP_TM_64",
+        [CC_OP_NZ_F32]    = "CC_OP_NZ_F32",
+        [CC_OP_NZ_F64]    = "CC_OP_NZ_F64",
+        [CC_OP_NZ_F128]   = "CC_OP_NZ_F128",
+        [CC_OP_ICM]       = "CC_OP_ICM",
+        [CC_OP_SLA_32]    = "CC_OP_SLA_32",
+        [CC_OP_SLA_64]    = "CC_OP_SLA_64",
+        [CC_OP_FLOGR]     = "CC_OP_FLOGR",
+        [CC_OP_LCBB]      = "CC_OP_LCBB",
+        [CC_OP_VC]        = "CC_OP_VC",
+        [CC_OP_MULS_32]   = "CC_OP_MULS_32",
+        [CC_OP_MULS_64]   = "CC_OP_MULS_64",
+    };
+
+    return cc_names[cc_op];
+}
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 2254873cef..41ccc83d11 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -23,7 +23,6 @@
 #include "s390x-internal.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
-#include "qemu/qemu-print.h"
 #include "hw/s390x/ioinst.h"
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
@@ -324,109 +323,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
-
-void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
-    int i;
-
-    if (env->cc_op > 3) {
-        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %15s\n",
-                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
-    } else {
-        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %02x\n",
-                     env->psw.mask, env->psw.addr, env->cc_op);
-    }
-
-    for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=%016" PRIx64, i, env->regs[i]);
-        if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-
-    if (flags & CPU_DUMP_FPU) {
-        if (s390_has_feat(S390_FEAT_VECTOR)) {
-            for (i = 0; i < 32; i++) {
-                qemu_fprintf(f, "V%02d=%016" PRIx64 "%016" PRIx64 "%c",
-                             i, env->vregs[i][0], env->vregs[i][1],
-                             i % 2 ? '\n' : ' ');
-            }
-        } else {
-            for (i = 0; i < 16; i++) {
-                qemu_fprintf(f, "F%02d=%016" PRIx64 "%c",
-                             i, *get_freg(env, i),
-                             (i % 4) == 3 ? '\n' : ' ');
-            }
-        }
-    }
-
-#ifndef CONFIG_USER_ONLY
-    for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "C%02d=%016" PRIx64, i, env->cregs[i]);
-        if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-#endif
-
-#ifdef DEBUG_INLINE_BRANCHES
-    for (i = 0; i < CC_OP_MAX; i++) {
-        qemu_fprintf(f, "  %15s = %10ld\t%10ld\n", cc_name(i),
-                     inline_branch_miss[i], inline_branch_hit[i]);
-    }
-#endif
-
-    qemu_fprintf(f, "\n");
-}
-
-const char *cc_name(enum cc_op cc_op)
-{
-    static const char * const cc_names[] = {
-        [CC_OP_CONST0]    = "CC_OP_CONST0",
-        [CC_OP_CONST1]    = "CC_OP_CONST1",
-        [CC_OP_CONST2]    = "CC_OP_CONST2",
-        [CC_OP_CONST3]    = "CC_OP_CONST3",
-        [CC_OP_DYNAMIC]   = "CC_OP_DYNAMIC",
-        [CC_OP_STATIC]    = "CC_OP_STATIC",
-        [CC_OP_NZ]        = "CC_OP_NZ",
-        [CC_OP_ADDU]      = "CC_OP_ADDU",
-        [CC_OP_SUBU]      = "CC_OP_SUBU",
-        [CC_OP_LTGT_32]   = "CC_OP_LTGT_32",
-        [CC_OP_LTGT_64]   = "CC_OP_LTGT_64",
-        [CC_OP_LTUGTU_32] = "CC_OP_LTUGTU_32",
-        [CC_OP_LTUGTU_64] = "CC_OP_LTUGTU_64",
-        [CC_OP_LTGT0_32]  = "CC_OP_LTGT0_32",
-        [CC_OP_LTGT0_64]  = "CC_OP_LTGT0_64",
-        [CC_OP_ADD_64]    = "CC_OP_ADD_64",
-        [CC_OP_SUB_64]    = "CC_OP_SUB_64",
-        [CC_OP_ABS_64]    = "CC_OP_ABS_64",
-        [CC_OP_NABS_64]   = "CC_OP_NABS_64",
-        [CC_OP_ADD_32]    = "CC_OP_ADD_32",
-        [CC_OP_SUB_32]    = "CC_OP_SUB_32",
-        [CC_OP_ABS_32]    = "CC_OP_ABS_32",
-        [CC_OP_NABS_32]   = "CC_OP_NABS_32",
-        [CC_OP_COMP_32]   = "CC_OP_COMP_32",
-        [CC_OP_COMP_64]   = "CC_OP_COMP_64",
-        [CC_OP_TM_32]     = "CC_OP_TM_32",
-        [CC_OP_TM_64]     = "CC_OP_TM_64",
-        [CC_OP_NZ_F32]    = "CC_OP_NZ_F32",
-        [CC_OP_NZ_F64]    = "CC_OP_NZ_F64",
-        [CC_OP_NZ_F128]   = "CC_OP_NZ_F128",
-        [CC_OP_ICM]       = "CC_OP_ICM",
-        [CC_OP_SLA_32]    = "CC_OP_SLA_32",
-        [CC_OP_SLA_64]    = "CC_OP_SLA_64",
-        [CC_OP_FLOGR]     = "CC_OP_FLOGR",
-        [CC_OP_LCBB]      = "CC_OP_LCBB",
-        [CC_OP_VC]        = "CC_OP_VC",
-        [CC_OP_MULS_32]   = "CC_OP_MULS_32",
-        [CC_OP_MULS_64]   = "CC_OP_MULS_64",
-    };
-
-    return cc_names[cc_op];
-}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index a73bae3dc5..6e1aa3b0cd 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -6,6 +6,7 @@ s390x_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'interrupt.c',
+  'cpu-dump.c',
 ))
 
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
-- 
2.26.2


