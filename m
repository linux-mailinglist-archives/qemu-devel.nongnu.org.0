Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305AC2DB325
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:59:15 +0100 (CET)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEbS-0000HP-7W
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXG-0002uc-Ga
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXD-0001S3-Ft
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87kN2KFn8+g3wvMLyjOHo93vTqEDscCjXQNO5mdHiII=;
 b=HGubrdtX+hSv9+vYCRohMhSe663K9fJavh3vawHOsKdOqVif37eoqyQP5quVZBir/5KFCY
 v9H/wN6nf8iXFJQUlawn9T35wSf3SKSNKGbMp60opafHWWtIwcdM0o5crj0AjIobgdg41s
 Jh9z1wUfS10muxOLwt8uSfkc7I1OZMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-RGVYDSN-PPmG_VSizRnkLQ-1; Tue, 15 Dec 2020 12:54:48 -0500
X-MC-Unique: RGVYDSN-PPmG_VSizRnkLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A9F18B37E0
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B09E260C15;
 Tue, 15 Dec 2020 17:54:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/45] vl: extract softmmu/globals.c
Date: Tue, 15 Dec 2020 12:54:05 -0500
Message-Id: <20201215175445.1272776-6-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c         |  2 ++
 include/exec/cpu-common.h |  3 ++
 include/exec/exec-all.h   |  3 --
 softmmu/globals.c         | 74 +++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build       |  1 +
 softmmu/vl.c              | 45 ++----------------------
 6 files changed, 83 insertions(+), 45 deletions(-)
 create mode 100644 softmmu/globals.c

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d7f8fdee45..26cfd87b5c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -216,6 +216,8 @@ GlobalProperty hw_compat_2_1[] = {
 };
 const size_t hw_compat_2_1_len = G_N_ELEMENTS(hw_compat_2_1);
 
+MachineState *current_machine;
+
 static char *machine_get_kernel(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index bd5e15dd7d..5a0a2d93e0 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -105,4 +105,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length);
 
 #endif
 
+/* vl.c */
+extern int singlestep;
+
 #endif /* CPU_COMMON_H */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 94fe05daaa..fab573da06 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -676,7 +676,4 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
                                        MemoryRegionSection *section);
 #endif
 
-/* vl.c */
-extern int singlestep;
-
 #endif
diff --git a/softmmu/globals.c b/softmmu/globals.c
new file mode 100644
index 0000000000..e62d9cd8da
--- /dev/null
+++ b/softmmu/globals.c
@@ -0,0 +1,74 @@
+/*
+ * Global variables that (mostly) should not exist
+ *
+ * Copyright (c) 2003-2020 QEMU contributors
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
+#include "exec/cpu-common.h"
+#include "hw/display/vga.h"
+#include "hw/i386/pc.h"
+#include "hw/i386/x86.h"
+#include "hw/loader.h"
+#include "hw/xen/xen.h"
+#include "net/net.h"
+#include "sysemu/cpus.h"
+#include "sysemu/sysemu.h"
+
+enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
+int display_opengl;
+const char* keyboard_layout;
+bool enable_mlock;
+bool enable_cpu_pm;
+int nb_nics;
+NICInfo nd_table[MAX_NICS];
+int autostart = 1;
+int vga_interface_type = VGA_NONE;
+Chardev *parallel_hds[MAX_PARALLEL_PORTS];
+int win2k_install_hack;
+int singlestep;
+int fd_bootchk = 1;
+int no_reboot;
+int no_shutdown;
+int graphic_rotate;
+QEMUOptionRom option_rom[MAX_OPTION_ROMS];
+int nb_option_roms;
+int old_param;
+const char *qemu_name;
+int alt_grab;
+int ctrl_grab;
+unsigned int nb_prom_envs;
+const char *prom_envs[MAX_PROM_ENVS];
+int boot_menu;
+bool boot_strict;
+uint8_t *boot_splash_filedata;
+int only_migratable; /* turn it off unless user states otherwise */
+int icount_align_option;
+
+/* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
+ * little-endian "wire format" described in the SMBIOS 2.6 specification.
+ */
+QemuUUID qemu_uuid;
+bool qemu_uuid_set;
+
+uint32_t xen_domid;
+enum xen_mode xen_mode = XEN_EMULATE;
+bool xen_domid_restrict;
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 2a73ebc223..e5865b97cb 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -4,6 +4,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'cpus.c',
   'cpu-throttle.c',
   'datadir.c',
+  'globals.c',
   'physmem.c',
   'ioport.c',
   'rtc.c',
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6282ae2101..685d92df5d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -26,6 +26,7 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "exec/cpu-common.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -67,6 +68,8 @@
 #include "qemu/log.h"
 #include "sysemu/blockdev.h"
 #include "hw/block/block.h"
+#include "hw/i386/x86.h"
+#include "hw/i386/pc.h"
 #include "migration/misc.h"
 #include "migration/snapshot.h"
 #include "migration/global_state.h"
@@ -139,17 +142,8 @@ static bool preconfig_requested;
 static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 static bool nographic = false;
-enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 static int mem_prealloc; /* force preallocation of physical target memory */
-int display_opengl;
-const char* keyboard_layout = NULL;
 static ram_addr_t ram_size;
-bool enable_mlock = false;
-bool enable_cpu_pm = false;
-int nb_nics;
-NICInfo nd_table[MAX_NICS];
-int autostart = 1;
-int vga_interface_type = VGA_NONE;
 static const char *vga_model = NULL;
 static DisplayOptions dpy;
 static int num_serial_hds;
@@ -157,41 +151,10 @@ static Chardev **serial_hds;
 static const char *log_mask;
 static const char *log_file;
 static bool list_data_dirs;
-Chardev *parallel_hds[MAX_PARALLEL_PORTS];
-int win2k_install_hack = 0;
-int singlestep = 0;
-int fd_bootchk = 1;
-int no_reboot;
-int no_shutdown = 0;
-int graphic_rotate = 0;
 static const char *watchdog;
-QEMUOptionRom option_rom[MAX_OPTION_ROMS];
-int nb_option_roms;
-int old_param = 0;
-const char *qemu_name;
-int alt_grab = 0;
-int ctrl_grab = 0;
-unsigned int nb_prom_envs = 0;
-const char *prom_envs[MAX_PROM_ENVS];
-int boot_menu;
-bool boot_strict;
-uint8_t *boot_splash_filedata;
-int only_migratable; /* turn it off unless user states otherwise */
-bool wakeup_suspend_enabled;
-int icount_align_option;
 static const char *qtest_chrdev;
 static const char *qtest_log;
 
-/* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
- * little-endian "wire format" described in the SMBIOS 2.6 specification.
- */
-QemuUUID qemu_uuid;
-bool qemu_uuid_set;
-
-uint32_t xen_domid;
-enum xen_mode xen_mode = XEN_EMULATE;
-bool xen_domid_restrict;
-
 static int has_defaults = 1;
 static int default_serial = 1;
 static int default_parallel = 1;
@@ -799,8 +762,6 @@ static int usb_parse(const char *cmdline)
 /***********************************************************/
 /* machine registration */
 
-MachineState *current_machine;
-
 static MachineClass *find_machine(const char *name, GSList *machines)
 {
     GSList *el;
-- 
2.26.2



