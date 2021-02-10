Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67FF316A5A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:38:02 +0100 (CET)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rZ3-0006Ts-Sg
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQi-00043z-PA
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:54600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQd-0008WU-0V
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2837AC97;
 Wed, 10 Feb 2021 15:29:07 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 12/14] i386: separate fpu_helper into user and softmmu parts
Date: Wed, 10 Feb 2021 16:28:57 +0100
Message-Id: <20210210152859.25920-13-cfontana@suse.de>
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
 target/i386/cpu.h                            |  3 +
 target/i386/tcg/fpu_helper.c                 | 58 +----------------
 target/i386/tcg/softmmu/fpu_helper_softmmu.c | 67 ++++++++++++++++++++
 target/i386/tcg/user/fpu_helper_user.c       | 49 ++++++++++++++
 target/i386/tcg/softmmu/meson.build          |  1 +
 target/i386/tcg/user/meson.build             |  1 +
 6 files changed, 123 insertions(+), 56 deletions(-)
 create mode 100644 target/i386/tcg/softmmu/fpu_helper_softmmu.c
 create mode 100644 target/i386/tcg/user/fpu_helper_user.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index a4f9bbef55..afcf34e40b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1811,7 +1811,10 @@ int cpu_x86_support_mca_broadcast(CPUX86State *env);
 int cpu_get_pic_interrupt(CPUX86State *s);
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
+bool fpu_check_raise_ferr_irq(CPUX86State *s);
 void cpu_set_ignne(void);
+void cpu_clear_ignne(void);
+
 /* mpx_helper.c */
 void cpu_sync_bndcs_hflags(CPUX86State *env);
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..c4196d4ff0 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -75,36 +75,6 @@
 #define floatx80_ln2_d make_floatx80(0x3ffe, 0xb17217f7d1cf79abLL)
 #define floatx80_pi_d make_floatx80(0x4000, 0xc90fdaa22168c234LL)
 
-#if !defined(CONFIG_USER_ONLY)
-static qemu_irq ferr_irq;
-
-void x86_register_ferr_irq(qemu_irq irq)
-{
-    ferr_irq = irq;
-}
-
-static void cpu_clear_ignne(void)
-{
-    CPUX86State *env = &X86_CPU(first_cpu)->env;
-    env->hflags2 &= ~HF2_IGNNE_MASK;
-}
-
-void cpu_set_ignne(void)
-{
-    CPUX86State *env = &X86_CPU(first_cpu)->env;
-    env->hflags2 |= HF2_IGNNE_MASK;
-    /*
-     * We get here in response to a write to port F0h.  The chipset should
-     * deassert FP_IRQ and FERR# instead should stay signaled until FPSW_SE is
-     * cleared, because FERR# and FP_IRQ are two separate pins on real
-     * hardware.  However, we don't model FERR# as a qemu_irq, so we just
-     * do directly what the chipset would do, i.e. deassert FP_IRQ.
-     */
-    qemu_irq_lower(ferr_irq);
-}
-#endif
-
-
 static inline void fpush(CPUX86State *env)
 {
     env->fpstt = (env->fpstt - 1) & 7;
@@ -203,8 +173,8 @@ static void fpu_raise_exception(CPUX86State *env, uintptr_t retaddr)
         raise_exception_ra(env, EXCP10_COPR, retaddr);
     }
 #if !defined(CONFIG_USER_ONLY)
-    else if (ferr_irq && !(env->hflags2 & HF2_IGNNE_MASK)) {
-        qemu_irq_raise(ferr_irq);
+    else {
+        (void)fpu_check_raise_ferr_irq(env);
     }
 #endif
 }
@@ -2501,18 +2471,6 @@ void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
     }
 }
 
-#if defined(CONFIG_USER_ONLY)
-void cpu_x86_fsave(CPUX86State *env, target_ulong ptr, int data32)
-{
-    helper_fsave(env, ptr, data32);
-}
-
-void cpu_x86_frstor(CPUX86State *env, target_ulong ptr, int data32)
-{
-    helper_frstor(env, ptr, data32);
-}
-#endif
-
 #define XO(X)  offsetof(X86XSaveArea, X)
 
 static void do_xsave_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
@@ -2780,18 +2738,6 @@ void helper_fxrstor(CPUX86State *env, target_ulong ptr)
     }
 }
 
-#if defined(CONFIG_USER_ONLY)
-void cpu_x86_fxsave(CPUX86State *env, target_ulong ptr)
-{
-    helper_fxsave(env, ptr);
-}
-
-void cpu_x86_fxrstor(CPUX86State *env, target_ulong ptr)
-{
-    helper_fxrstor(env, ptr);
-}
-#endif
-
 void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
 {
     uintptr_t ra = GETPC();
diff --git a/target/i386/tcg/softmmu/fpu_helper_softmmu.c b/target/i386/tcg/softmmu/fpu_helper_softmmu.c
new file mode 100644
index 0000000000..c3c78f4e28
--- /dev/null
+++ b/target/i386/tcg/softmmu/fpu_helper_softmmu.c
@@ -0,0 +1,67 @@
+/*
+ *  x86 FPU, MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4/PNI helpers (softmmu code)
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
+#include <math.h>
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "qemu/host-utils.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "fpu/softfloat.h"
+#include "fpu/softfloat-macros.h"
+#include "tcg/helper-tcg.h"
+
+#include "hw/irq.h"
+
+static qemu_irq ferr_irq;
+
+void x86_register_ferr_irq(qemu_irq irq)
+{
+    ferr_irq = irq;
+}
+
+bool fpu_check_raise_ferr_irq(CPUX86State *env)
+{
+    if (ferr_irq && !(env->hflags2 & HF2_IGNNE_MASK)) {
+        qemu_irq_raise(ferr_irq);
+        return true;
+    }
+    return false;
+}
+
+void cpu_clear_ignne(void)
+{
+    CPUX86State *env = &X86_CPU(first_cpu)->env;
+    env->hflags2 &= ~HF2_IGNNE_MASK;
+}
+
+void cpu_set_ignne(void)
+{
+    CPUX86State *env = &X86_CPU(first_cpu)->env;
+    env->hflags2 |= HF2_IGNNE_MASK;
+    /*
+     * We get here in response to a write to port F0h.  The chipset should
+     * deassert FP_IRQ and FERR# instead should stay signaled until FPSW_SE is
+     * cleared, because FERR# and FP_IRQ are two separate pins on real
+     * hardware.  However, we don't model FERR# as a qemu_irq, so we just
+     * do directly what the chipset would do, i.e. deassert FP_IRQ.
+     */
+    qemu_irq_lower(ferr_irq);
+}
diff --git a/target/i386/tcg/user/fpu_helper_user.c b/target/i386/tcg/user/fpu_helper_user.c
new file mode 100644
index 0000000000..7c0782ebca
--- /dev/null
+++ b/target/i386/tcg/user/fpu_helper_user.c
@@ -0,0 +1,49 @@
+/*
+ *  x86 FPU, MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4/PNI helpers (user-mode)
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
+#include <math.h>
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "qemu/host-utils.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "fpu/softfloat.h"
+#include "fpu/softfloat-macros.h"
+#include "tcg/helper-tcg.h"
+
+void cpu_x86_fsave(CPUX86State *env, target_ulong ptr, int data32)
+{
+    helper_fsave(env, ptr, data32);
+}
+
+void cpu_x86_frstor(CPUX86State *env, target_ulong ptr, int data32)
+{
+    helper_frstor(env, ptr, data32);
+}
+
+void cpu_x86_fxsave(CPUX86State *env, target_ulong ptr)
+{
+    helper_fxsave(env, ptr);
+}
+
+void cpu_x86_fxrstor(CPUX86State *env, target_ulong ptr)
+{
+    helper_fxrstor(env, ptr);
+}
diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
index 50b830419d..63576e5833 100644
--- a/target/i386/tcg/softmmu/meson.build
+++ b/target/i386/tcg/softmmu/meson.build
@@ -4,4 +4,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'excp_helper_softmmu.c',
   'bpt_helper_softmmu.c',
   'misc_helper_softmmu.c',
+  'fpu_helper_softmmu.c',
 ))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 0fa9a48ee3..e0fb69e601 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -4,4 +4,5 @@ i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'excp_helper_user.c',
   'bpt_helper_user.c',
   'misc_helper_user.c',
+  'fpu_helper_user.c',
 ))
-- 
2.26.2


