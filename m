Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535DA367FEE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:00:55 +0200 (CEST)
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZY0q-0005Gu-Jt
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXvD-0006he-M1; Thu, 22 Apr 2021 07:55:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:40384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXv9-00023W-Oe; Thu, 22 Apr 2021 07:55:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C137AFC2;
 Thu, 22 Apr 2021 11:54:37 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 11/13] target/s390x: move kvm files into kvm/
Date: Thu, 22 Apr 2021 13:54:28 +0200
Message-Id: <20210422115430.15078-12-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210422115430.15078-1-cfontana@suse.de>
References: <20210422115430.15078-1-cfontana@suse.de>
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
 meson.build                        |  1 +
 target/s390x/{ => kvm}/kvm_s390x.h |  0
 target/s390x/kvm/trace.h           |  1 +
 hw/intc/s390_flic_kvm.c            |  2 +-
 hw/s390x/s390-stattrib-kvm.c       |  2 +-
 hw/s390x/tod-kvm.c                 |  2 +-
 hw/vfio/ap.c                       |  2 +-
 target/s390x/cpu-sysemu.c          |  2 +-
 target/s390x/cpu.c                 |  2 +-
 target/s390x/cpu_models.c          |  2 +-
 target/s390x/diag.c                |  2 +-
 target/s390x/interrupt.c           |  2 +-
 target/s390x/{ => kvm}/kvm.c       |  2 +-
 target/s390x/machine.c             |  2 +-
 target/s390x/mmu_helper.c          |  2 +-
 target/s390x/kvm/meson.build       | 17 +++++++++++++++++
 target/s390x/kvm/trace-events      |  7 +++++++
 target/s390x/meson.build           | 16 +---------------
 target/s390x/trace-events          |  6 ------
 19 files changed, 39 insertions(+), 33 deletions(-)
 rename target/s390x/{ => kvm}/kvm_s390x.h (100%)
 create mode 100644 target/s390x/kvm/trace.h
 rename target/s390x/{ => kvm}/kvm.c (99%)
 create mode 100644 target/s390x/kvm/meson.build
 create mode 100644 target/s390x/kvm/trace-events

diff --git a/meson.build b/meson.build
index 25363b492d..2a4c1964bf 100644
--- a/meson.build
+++ b/meson.build
@@ -1852,6 +1852,7 @@ if have_system or have_user
     'target/ppc',
     'target/riscv',
     'target/s390x',
+    'target/s390x/kvm',
     'target/sparc',
   ]
 endif
diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
similarity index 100%
rename from target/s390x/kvm_s390x.h
rename to target/s390x/kvm/kvm_s390x.h
diff --git a/target/s390x/kvm/trace.h b/target/s390x/kvm/trace.h
new file mode 100644
index 0000000000..ae195b1306
--- /dev/null
+++ b/target/s390x/kvm/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_s390x_kvm.h"
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index b3fb9f8395..91987b0951 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include <sys/ioctl.h>
 #include "qemu/error-report.h"
 #include "qemu/module.h"
diff --git a/hw/s390x/s390-stattrib-kvm.c b/hw/s390x/s390-stattrib-kvm.c
index f89d8d9d16..6664345fb1 100644
--- a/hw/s390x/s390-stattrib-kvm.c
+++ b/hw/s390x/s390-stattrib-kvm.c
@@ -17,7 +17,7 @@
 #include "sysemu/kvm.h"
 #include "exec/ram_addr.h"
 #include "cpu.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 
 Object *kvm_s390_stattrib_create(void)
 {
diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
index 0b94477486..ec855811ae 100644
--- a/hw/s390x/tod-kvm.c
+++ b/hw/s390x/tod-kvm.c
@@ -13,7 +13,7 @@
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "hw/s390x/tod.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 
 static void kvm_s390_get_tod_raw(S390TOD *tod, Error **errp)
 {
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 9571c2f91f..56a33b1277 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -23,7 +23,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "cpu.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/s390x/ap-bridge.h"
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 6081b7ef32..f3c1b4845a 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -24,7 +24,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "qemu/timer.h"
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 59efe48bcd..6e82ba73cc 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -24,7 +24,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "qemu/module.h"
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 4ff8cba7e5..0ed1c23774 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 311e22b4ea..5b75853a7e 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -22,7 +22,7 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/pv.h"
 #include "sysemu/kvm.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 
 int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 {
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index d0e58d6e8d..4e64ee705f 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
diff --git a/target/s390x/kvm.c b/target/s390x/kvm/kvm.c
similarity index 99%
rename from target/s390x/kvm.c
rename to target/s390x/kvm/kvm.c
index 2a22cc69f6..4e47563faf 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -27,7 +27,7 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm_int.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 81a8a7ff99..37a076858c 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -17,7 +17,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "migration/vmstate.h"
 #include "tcg/tcg_s390x.h"
 #include "sysemu/kvm.h"
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 52fdd86c63..d779a9fc51 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -20,7 +20,7 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "kvm_s390x.h"
+#include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/kvm/meson.build b/target/s390x/kvm/meson.build
new file mode 100644
index 0000000000..d1356356b1
--- /dev/null
+++ b/target/s390x/kvm/meson.build
@@ -0,0 +1,17 @@
+
+s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'kvm.c'
+))
+
+# Newer kernels on s390 check for an S390_PGSTE program header and
+# enable the pgste page table extensions in that case. This makes
+# the vm.allocate_pgste sysctl unnecessary. We enable this program
+# header if
+#  - we build on s390x
+#  - we build the system emulation for s390x (qemu-system-s390x)
+#  - KVM is enabled
+#  - the linker supports --s390-pgste
+if host_machine.cpu_family() == 's390x' and cc.has_link_argument('-Wl,--s390-pgste')
+  s390x_softmmu_ss.add(when: 'CONFIG_KVM',
+                       if_true: declare_dependency(link_args: ['-Wl,--s390-pgste']))
+endif
diff --git a/target/s390x/kvm/trace-events b/target/s390x/kvm/trace-events
new file mode 100644
index 0000000000..5289f5f675
--- /dev/null
+++ b/target/s390x/kvm/trace-events
@@ -0,0 +1,7 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# kvm.c
+kvm_enable_cmma(int rc) "CMMA: enabling with result code %d"
+kvm_clear_cmma(int rc) "CMMA: clearing with result code %d"
+kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) "Warning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
+kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datamatch) "fd: %d sch: @0x%x assign: %d vq: %d"
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 6c8e03b8fb..ec73bed524 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,8 +8,6 @@ s390x_ss.add(files(
   'cpu-dump.c',
 ))
 
-s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-
 gen_features = executable('gen-features', 'gen-features.c', native: true,
                           build_by_default: false)
 
@@ -32,22 +30,10 @@ s390x_softmmu_ss.add(files(
   'cpu-sysemu.c',
 ))
 
-# Newer kernels on s390 check for an S390_PGSTE program header and
-# enable the pgste page table extensions in that case. This makes
-# the vm.allocate_pgste sysctl unnecessary. We enable this program
-# header if
-#  - we build on s390x
-#  - we build the system emulation for s390x (qemu-system-s390x)
-#  - KVM is enabled
-#  - the linker supports --s390-pgste
-if host_machine.cpu_family() == 's390x' and cc.has_link_argument('-Wl,--s390-pgste')
-  s390x_softmmu_ss.add(when: 'CONFIG_KVM',
-                       if_true: declare_dependency(link_args: ['-Wl,--s390-pgste']))
-endif
-
 s390x_user_ss = ss.source_set()
 
 subdir('tcg')
+subdir('kvm')
 
 target_arch += {'s390x': s390x_ss}
 target_softmmu_arch += {'s390x': s390x_softmmu_ss}
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index e6c5fc1d03..c3414f58af 100644
--- a/target/s390x/trace-events
+++ b/target/s390x/trace-events
@@ -10,12 +10,6 @@ ioinst_sch_id(const char *insn, int cssid, int ssid, int schid) "IOINST: %s (%x.
 ioinst_chp_id(const char *insn, int cssid, int chpid) "IOINST: %s (%x.%02x)"
 ioinst_chsc_cmd(uint16_t cmd, uint16_t len) "IOINST: chsc command 0x%04x, len 0x%04x"
 
-# kvm.c
-kvm_enable_cmma(int rc) "CMMA: enabling with result code %d"
-kvm_clear_cmma(int rc) "CMMA: clearing with result code %d"
-kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) "Warning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
-kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datamatch) "fd: %d sch: @0x%x assign: %d vq: %d"
-
 # cpu-sysemu.c
 cpu_set_state(int cpu_index, uint8_t state) "setting cpu %d state to %" PRIu8
 cpu_halt(int cpu_index) "halting cpu %d"
-- 
2.26.2


