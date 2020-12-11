Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24122D7384
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 11:10:49 +0100 (CET)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knfNw-0007ni-Vt
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 05:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knfMR-0006cR-F2
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:09:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:49492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knfMO-0007ap-OS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:09:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38C9BB16A;
 Fri, 11 Dec 2020 10:09:11 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v11 1/7] accel: extend AccelState and AccelClass to user-mode
Date: Fri, 11 Dec 2020 11:09:02 +0100
Message-Id: <20201211100908.19696-2-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211100908.19696-1-cfontana@suse.de>
References: <20201211100908.19696-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/boards.h                |  2 +-
 include/{sysemu => qemu}/accel.h   | 14 +++++----
 include/sysemu/hvf.h               |  2 +-
 include/sysemu/kvm.h               |  2 +-
 include/sysemu/kvm_int.h           |  2 +-
 target/i386/hvf/hvf-i386.h         |  2 +-
 accel/accel-common.c               | 50 ++++++++++++++++++++++++++++++
 accel/{accel.c => accel-softmmu.c} | 27 ++--------------
 accel/accel-user.c                 | 24 ++++++++++++++
 accel/qtest/qtest.c                |  2 +-
 accel/tcg/tcg-all.c                | 13 ++++++--
 accel/xen/xen-all.c                |  2 +-
 bsd-user/main.c                    |  6 +++-
 linux-user/main.c                  |  6 +++-
 softmmu/memory.c                   |  2 +-
 softmmu/qtest.c                    |  2 +-
 softmmu/vl.c                       |  2 +-
 target/i386/hax/hax-all.c          |  2 +-
 target/i386/hvf/hvf.c              |  2 +-
 target/i386/hvf/x86_task.c         |  2 +-
 target/i386/whpx/whpx-all.c        |  2 +-
 MAINTAINERS                        |  2 +-
 accel/meson.build                  |  4 ++-
 accel/tcg/meson.build              |  2 +-
 24 files changed, 124 insertions(+), 52 deletions(-)
 rename include/{sysemu => qemu}/accel.h (95%)
 create mode 100644 accel/accel-common.c
 rename accel/{accel.c => accel-softmmu.c} (75%)
 create mode 100644 accel/accel-user.c

diff --git a/include/hw/boards.h b/include/hw/boards.h
index f94f4ad5d8..f8ae50c49c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -6,7 +6,7 @@
 #include "exec/memory.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/blockdev.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "qapi/qapi-types-machine.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/include/sysemu/accel.h b/include/qemu/accel.h
similarity index 95%
rename from include/sysemu/accel.h
rename to include/qemu/accel.h
index e08b8ab8fa..fac4a18703 100644
--- a/include/sysemu/accel.h
+++ b/include/qemu/accel.h
@@ -20,8 +20,8 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
-#ifndef HW_ACCEL_H
-#define HW_ACCEL_H
+#ifndef QEMU_ACCEL_H
+#define QEMU_ACCEL_H
 
 #include "qom/object.h"
 #include "exec/hwaddr.h"
@@ -37,8 +37,8 @@ typedef struct AccelClass {
     /*< public >*/
 
     const char *name;
-#ifndef CONFIG_USER_ONLY
     int (*init_machine)(MachineState *ms);
+#ifndef CONFIG_USER_ONLY
     void (*setup_post)(MachineState *ms, AccelState *accel);
     bool (*has_memory)(MachineState *ms, AddressSpace *as,
                        hwaddr start_addr, hwaddr size);
@@ -67,11 +67,13 @@ typedef struct AccelClass {
     OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL)
 
 AccelClass *accel_find(const char *opt_name);
+AccelState *current_accel(void);
+
+#ifndef CONFIG_USER_ONLY
 int accel_init_machine(AccelState *accel, MachineState *ms);
 
 /* Called just before os_setup_post (ie just before drop OS privs) */
 void accel_setup_post(MachineState *ms);
+#endif /* !CONFIG_USER_ONLY */
 
-AccelState *current_accel(void);
-
-#endif
+#endif /* QEMU_ACCEL_H */
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index f893768df9..c98636bc81 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -13,7 +13,7 @@
 #ifndef HVF_H
 #define HVF_H
 
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "qom/object.h"
 
 #ifdef CONFIG_HVF
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index bb5d5cf497..739682f3c3 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -17,7 +17,7 @@
 #include "qemu/queue.h"
 #include "hw/core/cpu.h"
 #include "exec/memattrs.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "qom/object.h"
 
 #ifdef NEED_CPU_H
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 65740806da..ccb8869f01 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -10,7 +10,7 @@
 #define QEMU_KVM_INT_H
 
 #include "exec/memory.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "sysemu/kvm.h"
 
 typedef struct KVMSlot
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index e0edffd077..50b914fd67 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -16,7 +16,7 @@
 #ifndef HVF_I386_H
 #define HVF_I386_H
 
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "sysemu/hvf.h"
 #include "cpu.h"
 #include "x86.h"
diff --git a/accel/accel-common.c b/accel/accel-common.c
new file mode 100644
index 0000000000..ddec8cb5ae
--- /dev/null
+++ b/accel/accel-common.c
@@ -0,0 +1,50 @@
+/*
+ * QEMU accel class, components common to system emulation and user mode
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2014 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/accel.h"
+
+static const TypeInfo accel_type = {
+    .name = TYPE_ACCEL,
+    .parent = TYPE_OBJECT,
+    .class_size = sizeof(AccelClass),
+    .instance_size = sizeof(AccelState),
+};
+
+/* Lookup AccelClass from opt_name. Returns NULL if not found */
+AccelClass *accel_find(const char *opt_name)
+{
+    char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
+    AccelClass *ac = ACCEL_CLASS(object_class_by_name(class_name));
+    g_free(class_name);
+    return ac;
+}
+
+static void register_accel_types(void)
+{
+    type_register_static(&accel_type);
+}
+
+type_init(register_accel_types);
diff --git a/accel/accel.c b/accel/accel-softmmu.c
similarity index 75%
rename from accel/accel.c
rename to accel/accel-softmmu.c
index cb555e3b06..f89da8f9d1 100644
--- a/accel/accel.c
+++ b/accel/accel-softmmu.c
@@ -1,5 +1,5 @@
 /*
- * QEMU System Emulator, accelerator interfaces
+ * QEMU accel class, system emulation components
  *
  * Copyright (c) 2003-2008 Fabrice Bellard
  * Copyright (c) 2014 Red Hat Inc.
@@ -24,28 +24,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "hw/boards.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #include "qom/object.h"
 
-static const TypeInfo accel_type = {
-    .name = TYPE_ACCEL,
-    .parent = TYPE_OBJECT,
-    .class_size = sizeof(AccelClass),
-    .instance_size = sizeof(AccelState),
-};
-
-/* Lookup AccelClass from opt_name. Returns NULL if not found */
-AccelClass *accel_find(const char *opt_name)
-{
-    char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
-    AccelClass *ac = ACCEL_CLASS(object_class_by_name(class_name));
-    g_free(class_name);
-    return ac;
-}
-
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
     AccelClass *acc = ACCEL_GET_CLASS(accel);
@@ -76,10 +60,3 @@ void accel_setup_post(MachineState *ms)
         acc->setup_post(ms, accel);
     }
 }
-
-static void register_accel_types(void)
-{
-    type_register_static(&accel_type);
-}
-
-type_init(register_accel_types);
diff --git a/accel/accel-user.c b/accel/accel-user.c
new file mode 100644
index 0000000000..26bdda6236
--- /dev/null
+++ b/accel/accel-user.c
@@ -0,0 +1,24 @@
+/*
+ * QEMU accel class, user-mode components
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/accel.h"
+
+AccelState *current_accel(void)
+{
+    static AccelState *accel;
+
+    if (!accel) {
+        AccelClass *ac = accel_find("tcg");
+
+        g_assert(ac != NULL);
+        accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
+    }
+    return accel;
+}
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index b282cea5cf..b4e731cb2b 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -17,7 +17,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "sysemu/qtest.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 1ac0b76515..7125d0cc29 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -30,9 +30,12 @@
 #include "tcg/tcg.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/boards.h"
+#include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
+
+#ifndef CONFIG_USER_ONLY
 #include "tcg-cpus.h"
+#endif /* CONFIG_USER_ONLY */
 
 struct TCGState {
     AccelState parent_obj;
@@ -106,8 +109,12 @@ static int tcg_init(MachineState *ms)
     mttcg_enabled = s->mttcg_enabled;
 
     /*
-     * Initialize TCG regions
+     * Initialize TCG regions only for softmmu.
+     *
+     * This needs to be done later for user mode, because the prologue
+     * generation needs to be delayed so that GUEST_BASE is already set.
      */
+#ifndef CONFIG_USER_ONLY
     tcg_region_init();
 
     if (mttcg_enabled) {
@@ -117,6 +124,8 @@ static int tcg_init(MachineState *ms)
     } else {
         cpus_register_accel(&tcg_cpus_rr);
     }
+#endif /* !CONFIG_USER_ONLY */
+
     return 0;
 }
 
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 878a4089d9..594aaf6b49 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -15,7 +15,7 @@
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pt.h"
 #include "chardev/char.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "sysemu/cpus.h"
 #include "sysemu/xen.h"
 #include "sysemu/runstate.h"
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0a918e8f74..ff295bcb29 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
+#include "qemu/accel.h"
 #include "sysemu/tcg.h"
 #include "qemu-version.h"
 #include <machine/trap.h>
@@ -908,8 +909,11 @@ int main(int argc, char **argv)
     }
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    {
+        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
+        ac->init_machine(NULL);
+    }
     cpu_type = parse_cpu_option(cpu_model);
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/linux-user/main.c b/linux-user/main.c
index 24d1eb73ad..5c059a8445 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
+#include "qemu/accel.h"
 #include "sysemu/tcg.h"
 #include "qemu-version.h"
 #include <sys/syscall.h>
@@ -703,8 +704,11 @@ int main(int argc, char **argv, char **envp)
     cpu_type = parse_cpu_option(cpu_model);
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    {
+        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
+        ac->init_machine(NULL);
+    }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
     cpu_reset(cpu);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 22bacbbc78..585ec6f8dc 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -32,7 +32,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/tcg.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "hw/boards.h"
 #include "migration/vmstate.h"
 
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 7965dc9a16..130c366615 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -20,7 +20,7 @@
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "hw/irq.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "sysemu/cpu-timers.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..bc20c526d2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -40,7 +40,7 @@
 
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "hw/usb.h"
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index fecfe8cd6e..d7f4bb44a7 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -28,7 +28,7 @@
 #include "exec/address-spaces.h"
 
 #include "qemu-common.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/boards.h"
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index ed9356565c..ffc9efa40f 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -69,7 +69,7 @@
 #include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
 #include "qemu/main-loop.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "target/i386/cpu.h"
 
 #include "hvf-cpus.h"
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index 6f04478b3a..d66dfd7669 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -28,7 +28,7 @@
 
 #include "hw/i386/apic_internal.h"
 #include "qemu/main-loop.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "target/i386/cpu.h"
 
 // TODO: taskswitch handling
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f4f3e33eac..ee6b606194 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -13,7 +13,7 @@
 #include "exec/address-spaces.h"
 #include "exec/ioport.h"
 #include "qemu-common.h"
-#include "sysemu/accel.h"
+#include "qemu/accel.h"
 #include "sysemu/whpx.h"
 #include "sysemu/cpus.h"
 #include "sysemu/runstate.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index d876f504a6..6235dd3a9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -434,7 +434,7 @@ Overall
 M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-F: include/sysemu/accel.h
+F: include/qemu/accel.h
 F: accel/accel.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
diff --git a/accel/meson.build b/accel/meson.build
index b26cca227a..b44ba30c86 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,4 +1,6 @@
-softmmu_ss.add(files('accel.c'))
+specific_ss.add(files('accel-common.c'))
+softmmu_ss.add(files('accel-softmmu.c'))
+user_ss.add(files('accel-user.c'))
 
 subdir('qtest')
 subdir('kvm')
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index f39aab0a0c..424d9bb1fc 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,5 +1,6 @@
 tcg_ss = ss.source_set()
 tcg_ss.add(files(
+  'tcg-all.c',
   'cpu-exec-common.c',
   'cpu-exec.c',
   'tcg-runtime-gvec.c',
@@ -13,7 +14,6 @@ tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c'), libdl])
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
-  'tcg-all.c',
   'cputlb.c',
   'tcg-cpus.c',
   'tcg-cpus-mttcg.c',
-- 
2.26.2


