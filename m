Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784337A1F6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:29:14 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNlR-0007pA-1X
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWs-0001p6-Cm
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWk-0000kp-Rg
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TMZiQ6cnCKAENVrLRU8lzTu06xHD8+0Q2KCz9ExqG4=;
 b=K45oPQU8WOU87VybGRnTZNyof8FmI45QO7/wAJaqE7CSMFiV49+KwAzg7f4kaGMC7TJ0Pr
 KbGdQLrinM0hN0HUIZ4Tos9PO0puHsu7NiyLakLRCDlNGEqvf9CVouKusG2zJfgpTu7i1U
 LumB63CSegbm/4VX853h0C2NjT87x0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-njvGFpYCMt-uIhEojfKAOg-1; Tue, 11 May 2021 04:13:59 -0400
X-MC-Unique: njvGFpYCMt-uIhEojfKAOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B3786D249;
 Tue, 11 May 2021 08:13:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A0662B45D;
 Tue, 11 May 2021 08:13:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/33] i386: separate fpu_helper sysemu-only parts
Date: Tue, 11 May 2021 04:13:30 -0400
Message-Id: <20210511081350.419428-14-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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

create a separate tcg/sysemu/fpu_helper.c for the sysemu-only parts.

For user mode, some small #ifdefs remain in tcg/fpu_helper.c
which do not seem worth splitting into their own user-mode module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-16-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                   |  3 ++
 target/i386/tcg/fpu_helper.c        | 41 +--------------------
 target/i386/tcg/sysemu/fpu_helper.c | 57 +++++++++++++++++++++++++++++
 target/i386/tcg/sysemu/meson.build  |  1 +
 4 files changed, 63 insertions(+), 39 deletions(-)
 create mode 100644 target/i386/tcg/sysemu/fpu_helper.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 4776daad23..5aae3ec0f4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1817,7 +1817,10 @@ int cpu_x86_support_mca_broadcast(CPUX86State *env);
 int cpu_get_pic_interrupt(CPUX86State *s);
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
+void fpu_check_raise_ferr_irq(CPUX86State *s);
 void cpu_set_ignne(void);
+void cpu_clear_ignne(void);
+
 /* mpx_helper.c */
 void cpu_sync_bndcs_hflags(CPUX86State *env);
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 20e4d2e715..1b30f1bb73 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,17 +21,10 @@
 #include <math.h>
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
-#include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
 #include "helper-tcg.h"
 
-#ifdef CONFIG_SOFTMMU
-#include "hw/irq.h"
-#endif
-
 /* float macros */
 #define FT0    (env->ft0)
 #define ST0    (env->fpregs[env->fpstt].d)
@@ -75,36 +68,6 @@
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
@@ -202,8 +165,8 @@ static void fpu_raise_exception(CPUX86State *env, uintptr_t retaddr)
         raise_exception_ra(env, EXCP10_COPR, retaddr);
     }
 #if !defined(CONFIG_USER_ONLY)
-    else if (ferr_irq && !(env->hflags2 & HF2_IGNNE_MASK)) {
-        qemu_irq_raise(ferr_irq);
+    else {
+        fpu_check_raise_ferr_irq(env);
     }
 #endif
 }
diff --git a/target/i386/tcg/sysemu/fpu_helper.c b/target/i386/tcg/sysemu/fpu_helper.c
new file mode 100644
index 0000000000..1c3610da3b
--- /dev/null
+++ b/target/i386/tcg/sysemu/fpu_helper.c
@@ -0,0 +1,57 @@
+/*
+ *  x86 FPU, MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4/PNI helpers (sysemu code)
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
+#include "hw/irq.h"
+
+static qemu_irq ferr_irq;
+
+void x86_register_ferr_irq(qemu_irq irq)
+{
+    ferr_irq = irq;
+}
+
+void fpu_check_raise_ferr_irq(CPUX86State *env)
+{
+    if (ferr_irq && !(env->hflags2 & HF2_IGNNE_MASK)) {
+        qemu_irq_raise(ferr_irq);
+        return;
+    }
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
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index b2aaab6eef..f84519a213 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -4,4 +4,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'excp_helper.c',
   'bpt_helper.c',
   'misc_helper.c',
+  'fpu_helper.c',
 ))
-- 
2.26.2



