Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D8D34AF82
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:47:57 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsR2-00013F-Fl
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGh-0005rt-Sf
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:45236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGf-0000mJ-1t
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DFB1AD8D;
 Fri, 26 Mar 2021 19:37:11 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 06/65] target/arm: tcg: move sysemu-only parts of
 debug_helper
Date: Fri, 26 Mar 2021 20:36:02 +0100
Message-Id: <20210326193701.5981-7-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
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

move sysemu-only parts of debug_helper to sysemu/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug_helper.c        | 27 -----------------------
 target/arm/tcg/sysemu/debug_helper.c | 33 ++++++++++++++++++++++++++++
 target/arm/tcg/sysemu/meson.build    |  1 +
 3 files changed, 34 insertions(+), 27 deletions(-)
 create mode 100644 target/arm/tcg/sysemu/debug_helper.c

diff --git a/target/arm/tcg/debug_helper.c b/target/arm/tcg/debug_helper.c
index 2ff72d47d1..66a0915393 100644
--- a/target/arm/tcg/debug_helper.c
+++ b/target/arm/tcg/debug_helper.c
@@ -308,30 +308,3 @@ void arm_debug_excp_handler(CPUState *cs)
                         arm_debug_target_el(env));
     }
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * In BE32 system mode, target memory is stored byteswapped (on a
-     * little-endian host system), and by the time we reach here (via an
-     * opcode helper) the addresses of subword accesses have been adjusted
-     * to account for that, which means that watchpoints will not match.
-     * Undo the adjustment here.
-     */
-    if (arm_sctlr_b(env)) {
-        if (len == 1) {
-            addr ^= 3;
-        } else if (len == 2) {
-            addr ^= 2;
-        }
-    }
-
-    return addr;
-}
-
-#endif
diff --git a/target/arm/tcg/sysemu/debug_helper.c b/target/arm/tcg/sysemu/debug_helper.c
new file mode 100644
index 0000000000..0bce00144f
--- /dev/null
+++ b/target/arm/tcg/sysemu/debug_helper.c
@@ -0,0 +1,33 @@
+/*
+ * ARM debug helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+
+vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * In BE32 system mode, target memory is stored byteswapped (on a
+     * little-endian host system), and by the time we reach here (via an
+     * opcode helper) the addresses of subword accesses have been adjusted
+     * to account for that, which means that watchpoints will not match.
+     * Undo the adjustment here.
+     */
+    if (arm_sctlr_b(env)) {
+        if (len == 1) {
+            addr ^= 3;
+        } else if (len == 2) {
+            addr ^= 2;
+        }
+    }
+
+    return addr;
+}
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 6f014f77ec..1a4d7a0940 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -1,3 +1,4 @@
 arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'debug_helper.c',
   'mte_helper.c',
 ))
-- 
2.26.2


