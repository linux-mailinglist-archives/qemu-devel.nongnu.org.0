Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96128316A39
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:31:24 +0100 (CET)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rSd-0005PG-J4
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQT-0003i6-Lz
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:54554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQR-0008W0-H2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94CC6AE47;
 Wed, 10 Feb 2021 15:29:05 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 08/14] i386: split smm helper (softmmu)
Date: Wed, 10 Feb 2021 16:28:53 +0100
Message-Id: <20210210152859.25920-9-cfontana@suse.de>
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

smm is only really useful for softmmu, split in two modules
around the CONFIG_USER_ONLY, in order to remove the ifdef
and use the build system instead.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/tcg/{ => softmmu}/smm_helper.c | 18 ++-----------
 target/i386/tcg/user/smm_helper_user.c     | 31 ++++++++++++++++++++++
 target/i386/tcg/meson.build                |  1 -
 target/i386/tcg/softmmu/meson.build        |  1 +
 target/i386/tcg/user/meson.build           |  1 +
 5 files changed, 35 insertions(+), 17 deletions(-)
 rename target/i386/tcg/{ => softmmu}/smm_helper.c (98%)
 create mode 100644 target/i386/tcg/user/smm_helper_user.c

diff --git a/target/i386/tcg/smm_helper.c b/target/i386/tcg/softmmu/smm_helper.c
similarity index 98%
rename from target/i386/tcg/smm_helper.c
rename to target/i386/tcg/softmmu/smm_helper.c
index 62d027abd3..107de2b63d 100644
--- a/target/i386/tcg/smm_helper.c
+++ b/target/i386/tcg/softmmu/smm_helper.c
@@ -1,5 +1,5 @@
 /*
- *  x86 SMM helpers
+ *  x86 SMM helpers (softmmu-only)
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
@@ -22,23 +22,11 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/log.h"
-#include "helper-tcg.h"
+#include "tcg/helper-tcg.h"
 
 
 /* SMM support */
 
-#if defined(CONFIG_USER_ONLY)
-
-void do_smm_enter(X86CPU *cpu)
-{
-}
-
-void helper_rsm(CPUX86State *env)
-{
-}
-
-#else
-
 #ifdef TARGET_X86_64
 #define SMM_REVISION_ID 0x00020064
 #else
@@ -330,5 +318,3 @@ void helper_rsm(CPUX86State *env)
     qemu_log_mask(CPU_LOG_INT, "SMM: after RSM\n");
     log_cpu_state_mask(CPU_LOG_INT, CPU(cpu), CPU_DUMP_CCOP);
 }
-
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/i386/tcg/user/smm_helper_user.c b/target/i386/tcg/user/smm_helper_user.c
new file mode 100644
index 0000000000..50a1100e5e
--- /dev/null
+++ b/target/i386/tcg/user/smm_helper_user.c
@@ -0,0 +1,31 @@
+/*
+ *  x86 SMM helpers, user mode
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
+#include "exec/helper-proto.h"
+#include "tcg/helper-tcg.h"
+
+void do_smm_enter(X86CPU *cpu)
+{
+}
+
+void helper_rsm(CPUX86State *env)
+{
+}
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index 68fa0c3187..ec5daa1edc 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -8,7 +8,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'misc_helper.c',
   'mpx_helper.c',
   'seg_helper.c',
-  'smm_helper.c',
   'svm_helper.c',
   'tcg-cpu.c',
   'translate.c'), if_false: files('tcg-stub.c'))
diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
index 77453740ad..cc29893758 100644
--- a/target/i386/tcg/softmmu/meson.build
+++ b/target/i386/tcg/softmmu/meson.build
@@ -1,3 +1,4 @@
 i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'tcg-cpu-softmmu.c',
+  'smm_helper.c',
 ))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index b479c7dcdf..976415e35f 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,3 +1,4 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'tcg-cpu-user.c',
+  'smm_helper_user.c',
 ))
-- 
2.26.2


