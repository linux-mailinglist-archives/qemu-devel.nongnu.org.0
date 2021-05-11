Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B937A1A0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:21:58 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNeP-0007G1-UX
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWo-0001jT-Qg
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWk-0000kn-M4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7777hvSMy0VCT8106OmBqPDTCRQ3h6Megi6JP/KEMso=;
 b=WvAwZpJVF7SdkI46Cl2e8YRRqaiTn1n9OGgbP5IDUIEPmAX5V2GbM8Fnwq7bOPnH2ooTrP
 d6UKQGOGWrYuxhqQXvJN2UlhEPs7qVtcQ2GtS1x2ZBOg57icsRfzG0kfyluDRPEqTu6aqV
 RewPwDQ2GWx/yNhY6toBMOtdCLkdwSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-jvLKcqLBP7iu9Nqrd1uJtg-1; Tue, 11 May 2021 04:13:59 -0400
X-MC-Unique: jvLKcqLBP7iu9Nqrd1uJtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7E5B1006C82;
 Tue, 11 May 2021 08:13:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 856F254342;
 Tue, 11 May 2021 08:13:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] i386: split svm_helper into sysemu and stub-only user
Date: Tue, 11 May 2021 04:13:31 -0400
Message-Id: <20210511081350.419428-15-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

For now we just copy over the previous user stubs, but really,

everything that requires s->cpl == 0 should be impossible
to trigger from user-mode emulation.

Later on we should add a check that asserts this easily f.e.:

static bool check_cpl0(DisasContext *s)
{
     int cpl = s->cpl;
 #ifdef CONFIG_USER_ONLY
     assert(cpl == 3);
 #endif
     if (cpl != 0) {
         gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
         return false;
     }
     return true;
}

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-17-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/meson.build               |  1 -
 target/i386/tcg/sysemu/meson.build        |  1 +
 target/i386/tcg/{ => sysemu}/svm_helper.c | 62 +-----------------
 target/i386/tcg/user/meson.build          |  1 +
 target/i386/tcg/user/svm_stubs.c          | 76 +++++++++++++++++++++++
 5 files changed, 80 insertions(+), 61 deletions(-)
 rename target/i386/tcg/{ => sysemu}/svm_helper.c (96%)
 create mode 100644 target/i386/tcg/user/svm_stubs.c

diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index 449d9719ef..f9110e890c 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -8,7 +8,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'misc_helper.c',
   'mpx_helper.c',
   'seg_helper.c',
-  'svm_helper.c',
   'tcg-cpu.c',
   'translate.c'), if_false: files('tcg-stub.c'))
 
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index f84519a213..126528d0c9 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -5,4 +5,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'bpt_helper.c',
   'misc_helper.c',
   'fpu_helper.c',
+  'svm_helper.c',
 ))
diff --git a/target/i386/tcg/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
similarity index 96%
rename from target/i386/tcg/svm_helper.c
rename to target/i386/tcg/sysemu/svm_helper.c
index 0145afceae..d6c2cccda6 100644
--- a/target/i386/tcg/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -1,5 +1,5 @@
 /*
- *  x86 SVM helpers
+ *  x86 SVM helpers (sysemu only)
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
@@ -796,5 +740,3 @@ void do_vmexit(CPUX86State *env)
        host's code segment or non-canonical (in the case of long mode), a
        #GP fault is delivered inside the host. */
 }
-
-#endif
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 2ab8bd903c..3edaee7402 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,4 +1,5 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'excp_helper.c',
   'misc_stubs.c',
+  'svm_stubs.c',
 ))
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
new file mode 100644
index 0000000000..97528b56ad
--- /dev/null
+++ b/target/i386/tcg/user/svm_stubs.c
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
-- 
2.26.2



