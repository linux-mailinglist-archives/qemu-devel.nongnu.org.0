Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B9316A51
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:35:37 +0100 (CET)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rWi-0002lu-Dk
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQk-00048Q-NH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:54640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQd-00004x-Hh
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:26 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50E64B133;
 Wed, 10 Feb 2021 15:29:08 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 13/14] i386: slit svm_helper into softmmu and stub-only user
Date: Wed, 10 Feb 2021 16:28:58 +0100
Message-Id: <20210210152859.25920-14-cfontana@suse.de>
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
 target/i386/tcg/{ => softmmu}/svm_helper.c | 62 +-----------------
 target/i386/tcg/user/svm_helper_user.c     | 76 ++++++++++++++++++++++
 target/i386/tcg/meson.build                |  1 -
 target/i386/tcg/softmmu/meson.build        |  1 +
 target/i386/tcg/user/meson.build           |  1 +
 5 files changed, 80 insertions(+), 61 deletions(-)
 rename target/i386/tcg/{ => softmmu}/svm_helper.c (96%)
 create mode 100644 target/i386/tcg/user/svm_helper_user.c

diff --git a/target/i386/tcg/svm_helper.c b/target/i386/tcg/softmmu/svm_helper.c
similarity index 96%
rename from target/i386/tcg/svm_helper.c
rename to target/i386/tcg/softmmu/svm_helper.c
index 097bb9b83d..a2c9819330 100644
--- a/target/i386/tcg/svm_helper.c
+++ b/target/i386/tcg/softmmu/svm_helper.c
@@ -1,5 +1,5 @@
 /*
- *  x86 SVM helpers
+ *  x86 SVM helpers (softmmu-only)
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
@@ -22,66 +22,10 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "helper-tcg.h"
+#include "tcg/helper-tcg.h"
 
 /* Secure Virtual Machine helpers */
 
-#if defined(CONFIG_USER_ONLY)
-
-void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
-{
-}
-
-void helper_vmmcall(CPUX86State *env)
-{
-}
-
-void helper_vmload(CPUX86State *env, int aflag)
-{
-}
-
-void helper_vmsave(CPUX86State *env, int aflag)
-{
-}
-
-void helper_stgi(CPUX86State *env)
-{
-}
-
-void helper_clgi(CPUX86State *env)
-{
-}
-
-void helper_skinit(CPUX86State *env)
-{
-}
-
-void helper_invlpga(CPUX86State *env, int aflag)
-{
-}
-
-void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
-                uintptr_t retaddr)
-{
-    assert(0);
-}
-
-void helper_svm_check_intercept_param(CPUX86State *env, uint32_t type,
-                                      uint64_t param)
-{
-}
-
-void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
-                                   uint64_t param, uintptr_t retaddr)
-{
-}
-
-void helper_svm_check_io(CPUX86State *env, uint32_t port, uint32_t param,
-                         uint32_t next_eip_addend)
-{
-}
-#else
-
 static inline void svm_save_seg(CPUX86State *env, hwaddr addr,
                                 const SegmentCache *sc)
 {
@@ -797,5 +741,3 @@ void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1)
        host's code segment or non-canonical (in the case of long mode), a
        #GP fault is delivered inside the host. */
 }
-
-#endif
diff --git a/target/i386/tcg/user/svm_helper_user.c b/target/i386/tcg/user/svm_helper_user.c
new file mode 100644
index 0000000000..97528b56ad
--- /dev/null
+++ b/target/i386/tcg/user/svm_helper_user.c
@@ -0,0 +1,76 @@
+/*
+ *  x86 SVM helpers (user-mode)
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
+void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
+{
+}
+
+void helper_vmmcall(CPUX86State *env)
+{
+}
+
+void helper_vmload(CPUX86State *env, int aflag)
+{
+}
+
+void helper_vmsave(CPUX86State *env, int aflag)
+{
+}
+
+void helper_stgi(CPUX86State *env)
+{
+}
+
+void helper_clgi(CPUX86State *env)
+{
+}
+
+void helper_skinit(CPUX86State *env)
+{
+}
+
+void helper_invlpga(CPUX86State *env, int aflag)
+{
+}
+
+void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
+                uintptr_t retaddr)
+{
+    assert(0);
+}
+
+void helper_svm_check_intercept_param(CPUX86State *env, uint32_t type,
+                                      uint64_t param)
+{
+}
+
+void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
+                                   uint64_t param, uintptr_t retaddr)
+{
+}
+
+void helper_svm_check_io(CPUX86State *env, uint32_t port, uint32_t param,
+                         uint32_t next_eip_addend)
+{
+}
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index ec5daa1edc..6fbac2f240 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -8,7 +8,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'misc_helper.c',
   'mpx_helper.c',
   'seg_helper.c',
-  'svm_helper.c',
   'tcg-cpu.c',
   'translate.c'), if_false: files('tcg-stub.c'))
 
diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
index 63576e5833..ded71d8103 100644
--- a/target/i386/tcg/softmmu/meson.build
+++ b/target/i386/tcg/softmmu/meson.build
@@ -5,4 +5,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'bpt_helper_softmmu.c',
   'misc_helper_softmmu.c',
   'fpu_helper_softmmu.c',
+  'svm_helper.c',
 ))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index e0fb69e601..cf7025c63c 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -5,4 +5,5 @@ i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'bpt_helper_user.c',
   'misc_helper_user.c',
   'fpu_helper_user.c',
+  'svm_helper_user.c',
 ))
-- 
2.26.2


