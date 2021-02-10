Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD14316A69
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:43:15 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9re6-0003F1-Us
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQj-00046E-NU
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:54580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQc-0008WF-Fw
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A14D2B127;
 Wed, 10 Feb 2021 15:29:06 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 10/14] i386: split tcg btp_helper into softmmu and user parts
Date: Wed, 10 Feb 2021 16:28:55 +0100
Message-Id: <20210210152859.25920-11-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210152859.25920-1-cfontana@suse.de>
References: <20210210152859.25920-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/tcg/helper-tcg.h                 |   3 +
 target/i386/tcg/bpt_helper.c                 | 275 -----------------
 target/i386/tcg/softmmu/bpt_helper_softmmu.c | 293 +++++++++++++++++++
 target/i386/tcg/user/bpt_helper_user.c       |  33 +++
 target/i386/tcg/softmmu/meson.build          |   1 +
 target/i386/tcg/user/meson.build             |   1 +
 6 files changed, 331 insertions(+), 275 deletions(-)
 create mode 100644 target/i386/tcg/softmmu/bpt_helper_softmmu.c
 create mode 100644 target/i386/tcg/user/bpt_helper_user.c

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index c133c63555..b420b3356d 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -92,4 +92,7 @@ void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
 /* smm_helper.c */
 void do_smm_enter(X86CPU *cpu);
 
+/* bpt_helper.c */
+bool check_hw_breakpoints(CPUX86State *env, bool force_dr6_update);
+
 #endif /* I386_HELPER_TCG_H */
diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c
index 979230ac12..2433991f07 100644
--- a/target/i386/tcg/bpt_helper.c
+++ b/target/i386/tcg/bpt_helper.c
@@ -23,219 +23,6 @@
 #include "exec/helper-proto.h"
 #include "helper-tcg.h"
 
-
-#ifndef CONFIG_USER_ONLY
-static inline bool hw_local_breakpoint_enabled(unsigned long dr7, int index)
-{
-    return (dr7 >> (index * 2)) & 1;
-}
-
-static inline bool hw_global_breakpoint_enabled(unsigned long dr7, int index)
-{
-    return (dr7 >> (index * 2)) & 2;
-
-}
-static inline bool hw_breakpoint_enabled(unsigned long dr7, int index)
-{
-    return hw_global_breakpoint_enabled(dr7, index) ||
-           hw_local_breakpoint_enabled(dr7, index);
-}
-
-static inline int hw_breakpoint_type(unsigned long dr7, int index)
-{
-    return (dr7 >> (DR7_TYPE_SHIFT + (index * 4))) & 3;
-}
-
-static inline int hw_breakpoint_len(unsigned long dr7, int index)
-{
-    int len = ((dr7 >> (DR7_LEN_SHIFT + (index * 4))) & 3);
-    return (len == 2) ? 8 : len + 1;
-}
-
-static int hw_breakpoint_insert(CPUX86State *env, int index)
-{
-    CPUState *cs = env_cpu(env);
-    target_ulong dr7 = env->dr[7];
-    target_ulong drN = env->dr[index];
-    int err = 0;
-
-    switch (hw_breakpoint_type(dr7, index)) {
-    case DR7_TYPE_BP_INST:
-        if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_breakpoint_insert(cs, drN, BP_CPU,
-                                        &env->cpu_breakpoint[index]);
-        }
-        break;
-
-    case DR7_TYPE_IO_RW:
-        /* Notice when we should enable calls to bpt_io.  */
-        return hw_breakpoint_enabled(env->dr[7], index)
-               ? HF_IOBPT_MASK : 0;
-
-    case DR7_TYPE_DATA_WR:
-        if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert(cs, drN,
-                                        hw_breakpoint_len(dr7, index),
-                                        BP_CPU | BP_MEM_WRITE,
-                                        &env->cpu_watchpoint[index]);
-        }
-        break;
-
-    case DR7_TYPE_DATA_RW:
-        if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert(cs, drN,
-                                        hw_breakpoint_len(dr7, index),
-                                        BP_CPU | BP_MEM_ACCESS,
-                                        &env->cpu_watchpoint[index]);
-        }
-        break;
-    }
-    if (err) {
-        env->cpu_breakpoint[index] = NULL;
-    }
-    return 0;
-}
-
-static void hw_breakpoint_remove(CPUX86State *env, int index)
-{
-    CPUState *cs = env_cpu(env);
-
-    switch (hw_breakpoint_type(env->dr[7], index)) {
-    case DR7_TYPE_BP_INST:
-        if (env->cpu_breakpoint[index]) {
-            cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
-            env->cpu_breakpoint[index] = NULL;
-        }
-        break;
-
-    case DR7_TYPE_DATA_WR:
-    case DR7_TYPE_DATA_RW:
-        if (env->cpu_breakpoint[index]) {
-            cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
-            env->cpu_breakpoint[index] = NULL;
-        }
-        break;
-
-    case DR7_TYPE_IO_RW:
-        /* HF_IOBPT_MASK cleared elsewhere.  */
-        break;
-    }
-}
-
-void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7)
-{
-    target_ulong old_dr7 = env->dr[7];
-    int iobpt = 0;
-    int i;
-
-    new_dr7 |= DR7_FIXED_1;
-
-    /* If nothing is changing except the global/local enable bits,
-       then we can make the change more efficient.  */
-    if (((old_dr7 ^ new_dr7) & ~0xff) == 0) {
-        /* Fold the global and local enable bits together into the
-           global fields, then xor to show which registers have
-           changed collective enable state.  */
-        int mod = ((old_dr7 | old_dr7 * 2) ^ (new_dr7 | new_dr7 * 2)) & 0xff;
-
-        for (i = 0; i < DR7_MAX_BP; i++) {
-            if ((mod & (2 << i * 2)) && !hw_breakpoint_enabled(new_dr7, i)) {
-                hw_breakpoint_remove(env, i);
-            }
-        }
-        env->dr[7] = new_dr7;
-        for (i = 0; i < DR7_MAX_BP; i++) {
-            if (mod & (2 << i * 2) && hw_breakpoint_enabled(new_dr7, i)) {
-                iobpt |= hw_breakpoint_insert(env, i);
-            } else if (hw_breakpoint_type(new_dr7, i) == DR7_TYPE_IO_RW
-                       && hw_breakpoint_enabled(new_dr7, i)) {
-                iobpt |= HF_IOBPT_MASK;
-            }
-        }
-    } else {
-        for (i = 0; i < DR7_MAX_BP; i++) {
-            hw_breakpoint_remove(env, i);
-        }
-        env->dr[7] = new_dr7;
-        for (i = 0; i < DR7_MAX_BP; i++) {
-            iobpt |= hw_breakpoint_insert(env, i);
-        }
-    }
-
-    env->hflags = (env->hflags & ~HF_IOBPT_MASK) | iobpt;
-}
-
-static bool check_hw_breakpoints(CPUX86State *env, bool force_dr6_update)
-{
-    target_ulong dr6;
-    int reg;
-    bool hit_enabled = false;
-
-    dr6 = env->dr[6] & ~0xf;
-    for (reg = 0; reg < DR7_MAX_BP; reg++) {
-        bool bp_match = false;
-        bool wp_match = false;
-
-        switch (hw_breakpoint_type(env->dr[7], reg)) {
-        case DR7_TYPE_BP_INST:
-            if (env->dr[reg] == env->eip) {
-                bp_match = true;
-            }
-            break;
-        case DR7_TYPE_DATA_WR:
-        case DR7_TYPE_DATA_RW:
-            if (env->cpu_watchpoint[reg] &&
-                env->cpu_watchpoint[reg]->flags & BP_WATCHPOINT_HIT) {
-                wp_match = true;
-            }
-            break;
-        case DR7_TYPE_IO_RW:
-            break;
-        }
-        if (bp_match || wp_match) {
-            dr6 |= 1 << reg;
-            if (hw_breakpoint_enabled(env->dr[7], reg)) {
-                hit_enabled = true;
-            }
-        }
-    }
-
-    if (hit_enabled || force_dr6_update) {
-        env->dr[6] = dr6;
-    }
-
-    return hit_enabled;
-}
-
-void breakpoint_handler(CPUState *cs)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    CPUBreakpoint *bp;
-
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
-            cs->watchpoint_hit = NULL;
-            if (check_hw_breakpoints(env, false)) {
-                raise_exception(env, EXCP01_DB);
-            } else {
-                cpu_loop_exit_noexc(cs);
-            }
-        }
-    } else {
-        QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-            if (bp->pc == env->eip) {
-                if (bp->flags & BP_CPU) {
-                    check_hw_breakpoints(env, true);
-                    raise_exception(env, EXCP01_DB);
-                }
-                break;
-            }
-        }
-    }
-}
-#endif
-
 void helper_single_step(CPUX86State *env)
 {
 #ifndef CONFIG_USER_ONLY
@@ -252,41 +39,6 @@ void helper_rechecking_single_step(CPUX86State *env)
     }
 }
 
-void helper_set_dr(CPUX86State *env, int reg, target_ulong t0)
-{
-#ifndef CONFIG_USER_ONLY
-    switch (reg) {
-    case 0: case 1: case 2: case 3:
-        if (hw_breakpoint_enabled(env->dr[7], reg)
-            && hw_breakpoint_type(env->dr[7], reg) != DR7_TYPE_IO_RW) {
-            hw_breakpoint_remove(env, reg);
-            env->dr[reg] = t0;
-            hw_breakpoint_insert(env, reg);
-        } else {
-            env->dr[reg] = t0;
-        }
-        return;
-    case 4:
-        if (env->cr[4] & CR4_DE_MASK) {
-            break;
-        }
-        /* fallthru */
-    case 6:
-        env->dr[6] = t0 | DR6_FIXED_1;
-        return;
-    case 5:
-        if (env->cr[4] & CR4_DE_MASK) {
-            break;
-        }
-        /* fallthru */
-    case 7:
-        cpu_x86_update_dr7(env, t0);
-        return;
-    }
-    raise_exception_err_ra(env, EXCP06_ILLOP, 0, GETPC());
-#endif
-}
-
 target_ulong helper_get_dr(CPUX86State *env, int reg)
 {
     switch (reg) {
@@ -307,30 +59,3 @@ target_ulong helper_get_dr(CPUX86State *env, int reg)
     }
     raise_exception_err_ra(env, EXCP06_ILLOP, 0, GETPC());
 }
-
-/* Check if Port I/O is trapped by a breakpoint.  */
-void helper_bpt_io(CPUX86State *env, uint32_t port,
-                   uint32_t size, target_ulong next_eip)
-{
-#ifndef CONFIG_USER_ONLY
-    target_ulong dr7 = env->dr[7];
-    int i, hit = 0;
-
-    for (i = 0; i < DR7_MAX_BP; ++i) {
-        if (hw_breakpoint_type(dr7, i) == DR7_TYPE_IO_RW
-            && hw_breakpoint_enabled(dr7, i)) {
-            int bpt_len = hw_breakpoint_len(dr7, i);
-            if (port + size - 1 >= env->dr[i]
-                && port <= env->dr[i] + bpt_len - 1) {
-                hit |= 1 << i;
-            }
-        }
-    }
-
-    if (hit) {
-        env->dr[6] = (env->dr[6] & ~0xf) | hit;
-        env->eip = next_eip;
-        raise_exception(env, EXCP01_DB);
-    }
-#endif
-}
diff --git a/target/i386/tcg/softmmu/bpt_helper_softmmu.c b/target/i386/tcg/softmmu/bpt_helper_softmmu.c
new file mode 100644
index 0000000000..1f3dd09cad
--- /dev/null
+++ b/target/i386/tcg/softmmu/bpt_helper_softmmu.c
@@ -0,0 +1,293 @@
+/*
+ *  i386 breakpoint helpers - softmmu-only code
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
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
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "tcg/helper-tcg.h"
+
+
+static inline bool hw_local_breakpoint_enabled(unsigned long dr7, int index)
+{
+    return (dr7 >> (index * 2)) & 1;
+}
+
+static inline bool hw_global_breakpoint_enabled(unsigned long dr7, int index)
+{
+    return (dr7 >> (index * 2)) & 2;
+
+}
+static inline bool hw_breakpoint_enabled(unsigned long dr7, int index)
+{
+    return hw_global_breakpoint_enabled(dr7, index) ||
+           hw_local_breakpoint_enabled(dr7, index);
+}
+
+static inline int hw_breakpoint_type(unsigned long dr7, int index)
+{
+    return (dr7 >> (DR7_TYPE_SHIFT + (index * 4))) & 3;
+}
+
+static inline int hw_breakpoint_len(unsigned long dr7, int index)
+{
+    int len = ((dr7 >> (DR7_LEN_SHIFT + (index * 4))) & 3);
+    return (len == 2) ? 8 : len + 1;
+}
+
+static int hw_breakpoint_insert(CPUX86State *env, int index)
+{
+    CPUState *cs = env_cpu(env);
+    target_ulong dr7 = env->dr[7];
+    target_ulong drN = env->dr[index];
+    int err = 0;
+
+    switch (hw_breakpoint_type(dr7, index)) {
+    case DR7_TYPE_BP_INST:
+        if (hw_breakpoint_enabled(dr7, index)) {
+            err = cpu_breakpoint_insert(cs, drN, BP_CPU,
+                                        &env->cpu_breakpoint[index]);
+        }
+        break;
+
+    case DR7_TYPE_IO_RW:
+        /* Notice when we should enable calls to bpt_io.  */
+        return hw_breakpoint_enabled(env->dr[7], index)
+               ? HF_IOBPT_MASK : 0;
+
+    case DR7_TYPE_DATA_WR:
+        if (hw_breakpoint_enabled(dr7, index)) {
+            err = cpu_watchpoint_insert(cs, drN,
+                                        hw_breakpoint_len(dr7, index),
+                                        BP_CPU | BP_MEM_WRITE,
+                                        &env->cpu_watchpoint[index]);
+        }
+        break;
+
+    case DR7_TYPE_DATA_RW:
+        if (hw_breakpoint_enabled(dr7, index)) {
+            err = cpu_watchpoint_insert(cs, drN,
+                                        hw_breakpoint_len(dr7, index),
+                                        BP_CPU | BP_MEM_ACCESS,
+                                        &env->cpu_watchpoint[index]);
+        }
+        break;
+    }
+    if (err) {
+        env->cpu_breakpoint[index] = NULL;
+    }
+    return 0;
+}
+
+static void hw_breakpoint_remove(CPUX86State *env, int index)
+{
+    CPUState *cs = env_cpu(env);
+
+    switch (hw_breakpoint_type(env->dr[7], index)) {
+    case DR7_TYPE_BP_INST:
+        if (env->cpu_breakpoint[index]) {
+            cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
+            env->cpu_breakpoint[index] = NULL;
+        }
+        break;
+
+    case DR7_TYPE_DATA_WR:
+    case DR7_TYPE_DATA_RW:
+        if (env->cpu_breakpoint[index]) {
+            cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
+            env->cpu_breakpoint[index] = NULL;
+        }
+        break;
+
+    case DR7_TYPE_IO_RW:
+        /* HF_IOBPT_MASK cleared elsewhere.  */
+        break;
+    }
+}
+
+void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7)
+{
+    target_ulong old_dr7 = env->dr[7];
+    int iobpt = 0;
+    int i;
+
+    new_dr7 |= DR7_FIXED_1;
+
+    /* If nothing is changing except the global/local enable bits,
+       then we can make the change more efficient.  */
+    if (((old_dr7 ^ new_dr7) & ~0xff) == 0) {
+        /* Fold the global and local enable bits together into the
+           global fields, then xor to show which registers have
+           changed collective enable state.  */
+        int mod = ((old_dr7 | old_dr7 * 2) ^ (new_dr7 | new_dr7 * 2)) & 0xff;
+
+        for (i = 0; i < DR7_MAX_BP; i++) {
+            if ((mod & (2 << i * 2)) && !hw_breakpoint_enabled(new_dr7, i)) {
+                hw_breakpoint_remove(env, i);
+            }
+        }
+        env->dr[7] = new_dr7;
+        for (i = 0; i < DR7_MAX_BP; i++) {
+            if (mod & (2 << i * 2) && hw_breakpoint_enabled(new_dr7, i)) {
+                iobpt |= hw_breakpoint_insert(env, i);
+            } else if (hw_breakpoint_type(new_dr7, i) == DR7_TYPE_IO_RW
+                       && hw_breakpoint_enabled(new_dr7, i)) {
+                iobpt |= HF_IOBPT_MASK;
+            }
+        }
+    } else {
+        for (i = 0; i < DR7_MAX_BP; i++) {
+            hw_breakpoint_remove(env, i);
+        }
+        env->dr[7] = new_dr7;
+        for (i = 0; i < DR7_MAX_BP; i++) {
+            iobpt |= hw_breakpoint_insert(env, i);
+        }
+    }
+
+    env->hflags = (env->hflags & ~HF_IOBPT_MASK) | iobpt;
+}
+
+bool check_hw_breakpoints(CPUX86State *env, bool force_dr6_update)
+{
+    target_ulong dr6;
+    int reg;
+    bool hit_enabled = false;
+
+    dr6 = env->dr[6] & ~0xf;
+    for (reg = 0; reg < DR7_MAX_BP; reg++) {
+        bool bp_match = false;
+        bool wp_match = false;
+
+        switch (hw_breakpoint_type(env->dr[7], reg)) {
+        case DR7_TYPE_BP_INST:
+            if (env->dr[reg] == env->eip) {
+                bp_match = true;
+            }
+            break;
+        case DR7_TYPE_DATA_WR:
+        case DR7_TYPE_DATA_RW:
+            if (env->cpu_watchpoint[reg] &&
+                env->cpu_watchpoint[reg]->flags & BP_WATCHPOINT_HIT) {
+                wp_match = true;
+            }
+            break;
+        case DR7_TYPE_IO_RW:
+            break;
+        }
+        if (bp_match || wp_match) {
+            dr6 |= 1 << reg;
+            if (hw_breakpoint_enabled(env->dr[7], reg)) {
+                hit_enabled = true;
+            }
+        }
+    }
+
+    if (hit_enabled || force_dr6_update) {
+        env->dr[6] = dr6;
+    }
+
+    return hit_enabled;
+}
+
+void breakpoint_handler(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    CPUBreakpoint *bp;
+
+    if (cs->watchpoint_hit) {
+        if (cs->watchpoint_hit->flags & BP_CPU) {
+            cs->watchpoint_hit = NULL;
+            if (check_hw_breakpoints(env, false)) {
+                raise_exception(env, EXCP01_DB);
+            } else {
+                cpu_loop_exit_noexc(cs);
+            }
+        }
+    } else {
+        QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+            if (bp->pc == env->eip) {
+                if (bp->flags & BP_CPU) {
+                    check_hw_breakpoints(env, true);
+                    raise_exception(env, EXCP01_DB);
+                }
+                break;
+            }
+        }
+    }
+}
+
+void helper_set_dr(CPUX86State *env, int reg, target_ulong t0)
+{
+    switch (reg) {
+    case 0: case 1: case 2: case 3:
+        if (hw_breakpoint_enabled(env->dr[7], reg)
+            && hw_breakpoint_type(env->dr[7], reg) != DR7_TYPE_IO_RW) {
+            hw_breakpoint_remove(env, reg);
+            env->dr[reg] = t0;
+            hw_breakpoint_insert(env, reg);
+        } else {
+            env->dr[reg] = t0;
+        }
+        return;
+    case 4:
+        if (env->cr[4] & CR4_DE_MASK) {
+            break;
+        }
+        /* fallthru */
+    case 6:
+        env->dr[6] = t0 | DR6_FIXED_1;
+        return;
+    case 5:
+        if (env->cr[4] & CR4_DE_MASK) {
+            break;
+        }
+        /* fallthru */
+    case 7:
+        cpu_x86_update_dr7(env, t0);
+        return;
+    }
+    raise_exception_err_ra(env, EXCP06_ILLOP, 0, GETPC());
+}
+
+/* Check if Port I/O is trapped by a breakpoint.  */
+void helper_bpt_io(CPUX86State *env, uint32_t port,
+                   uint32_t size, target_ulong next_eip)
+{
+    target_ulong dr7 = env->dr[7];
+    int i, hit = 0;
+
+    for (i = 0; i < DR7_MAX_BP; ++i) {
+        if (hw_breakpoint_type(dr7, i) == DR7_TYPE_IO_RW
+            && hw_breakpoint_enabled(dr7, i)) {
+            int bpt_len = hw_breakpoint_len(dr7, i);
+            if (port + size - 1 >= env->dr[i]
+                && port <= env->dr[i] + bpt_len - 1) {
+                hit |= 1 << i;
+            }
+        }
+    }
+
+    if (hit) {
+        env->dr[6] = (env->dr[6] & ~0xf) | hit;
+        env->eip = next_eip;
+        raise_exception(env, EXCP01_DB);
+    }
+}
diff --git a/target/i386/tcg/user/bpt_helper_user.c b/target/i386/tcg/user/bpt_helper_user.c
new file mode 100644
index 0000000000..2a31ddb0bf
--- /dev/null
+++ b/target/i386/tcg/user/bpt_helper_user.c
@@ -0,0 +1,33 @@
+/*
+ *  i386 breakpoint helpers - user-mode code
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
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
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "tcg/helper-tcg.h"
+
+void helper_set_dr(CPUX86State *env, int reg, target_ulong t0)
+{
+}
+
+void helper_bpt_io(CPUX86State *env, uint32_t port,
+                   uint32_t size, target_ulong next_eip)
+{
+}
diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
index e1ab2e4b43..d004ecea62 100644
--- a/target/i386/tcg/softmmu/meson.build
+++ b/target/i386/tcg/softmmu/meson.build
@@ -2,4 +2,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'tcg-cpu-softmmu.c',
   'smm_helper.c',
   'excp_helper_softmmu.c',
+  'bpt_helper_softmmu.c',
 ))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index e1eddd19bb..317f101b28 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -2,4 +2,5 @@ i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'tcg-cpu-user.c',
   'smm_helper_user.c',
   'excp_helper_user.c',
+  'bpt_helper_user.c',
 ))
-- 
2.26.2


