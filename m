Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D362D5A8A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:29:48 +0100 (CET)
Received: from localhost ([::1]:53946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knL4t-0003O9-9V
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knKoJ-0001zX-CW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:12:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knKoE-0006QR-DC
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:12:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2093EAD5C;
 Thu, 10 Dec 2020 12:12:33 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v10 04/32] i386: move kvm accel files into kvm/
Date: Thu, 10 Dec 2020 13:11:58 +0100
Message-Id: <20201210121226.19822-5-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210121226.19822-1-cfontana@suse.de>
References: <20201210121226.19822-1-cfontana@suse.de>
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
 meson.build                          | 1 +
 target/i386/cpu.h                    | 2 +-
 target/i386/{ => kvm}/hyperv-proto.h | 0
 target/i386/{ => kvm}/hyperv.h       | 0
 target/i386/{ => kvm}/kvm_i386.h     | 0
 target/i386/kvm/trace.h              | 1 +
 hw/i386/fw_cfg.c                     | 2 +-
 hw/i386/intel_iommu.c                | 2 +-
 hw/i386/kvm/apic.c                   | 2 +-
 hw/i386/kvm/clock.c                  | 2 +-
 hw/i386/microvm.c                    | 2 +-
 hw/i386/pc.c                         | 2 +-
 hw/i386/x86.c                        | 2 +-
 target/i386/cpu.c                    | 2 +-
 target/i386/helper.c                 | 2 +-
 target/i386/{ => kvm}/hyperv-stub.c  | 0
 target/i386/{ => kvm}/hyperv.c       | 0
 target/i386/{ => kvm}/kvm-stub.c     | 0
 target/i386/{ => kvm}/kvm.c          | 0
 target/i386/machine.c                | 4 ++--
 MAINTAINERS                          | 2 +-
 target/i386/kvm/meson.build          | 3 +++
 target/i386/kvm/trace-events         | 7 +++++++
 target/i386/meson.build              | 4 +---
 target/i386/trace-events             | 6 ------
 25 files changed, 26 insertions(+), 22 deletions(-)
 rename target/i386/{ => kvm}/hyperv-proto.h (100%)
 rename target/i386/{ => kvm}/hyperv.h (100%)
 rename target/i386/{ => kvm}/kvm_i386.h (100%)
 create mode 100644 target/i386/kvm/trace.h
 rename target/i386/{ => kvm}/hyperv-stub.c (100%)
 rename target/i386/{ => kvm}/hyperv.c (100%)
 rename target/i386/{ => kvm}/kvm-stub.c (100%)
 rename target/i386/{ => kvm}/kvm.c (100%)
 create mode 100644 target/i386/kvm/meson.build
 create mode 100644 target/i386/kvm/trace-events

diff --git a/meson.build b/meson.build
index 732b29a1f3..d3f4aeeb32 100644
--- a/meson.build
+++ b/meson.build
@@ -1467,6 +1467,7 @@ trace_events_subdirs += [
   'target/arm',
   'target/hppa',
   'target/i386',
+  'target/i386/kvm',
   'target/mips',
   'target/ppc',
   'target/riscv',
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 88e8586f8f..9ecda75aec 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -22,7 +22,7 @@
 
 #include "sysemu/tcg.h"
 #include "cpu-qom.h"
-#include "hyperv-proto.h"
+#include "kvm/hyperv-proto.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
 
diff --git a/target/i386/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
similarity index 100%
rename from target/i386/hyperv-proto.h
rename to target/i386/kvm/hyperv-proto.h
diff --git a/target/i386/hyperv.h b/target/i386/kvm/hyperv.h
similarity index 100%
rename from target/i386/hyperv.h
rename to target/i386/kvm/hyperv.h
diff --git a/target/i386/kvm_i386.h b/target/i386/kvm/kvm_i386.h
similarity index 100%
rename from target/i386/kvm_i386.h
rename to target/i386/kvm/kvm_i386.h
diff --git a/target/i386/kvm/trace.h b/target/i386/kvm/trace.h
new file mode 100644
index 0000000000..46b75c6942
--- /dev/null
+++ b/target/i386/kvm/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_i386_kvm.h"
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index e06579490c..fae1bb380f 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -21,7 +21,7 @@
 #include "hw/timer/hpet.h"
 #include "hw/nvram/fw_cfg.h"
 #include "e820_memory_layout.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 #include CONFIG_DEVICES
 
 struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 0cc71e4057..b4f5094259 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -37,7 +37,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
 #include "hw/i386/apic_internal.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 #include "migration/vmstate.h"
 #include "trace.h"
 
diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index dd29906061..07bebc1282 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -17,7 +17,7 @@
 #include "hw/pci/msi.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
-#include "target/i386/kvm_i386.h"
+#include "kvm/kvm_i386.h"
 
 static inline void kvm_apic_set_reg(struct kvm_lapic_state *kapic,
                                     int reg_id, uint32_t val)
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 24fe5091b6..2d8a366369 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -20,7 +20,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 #include "migration/vmstate.h"
 #include "hw/sysbus.h"
 #include "hw/kvm/clock.h"
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 5428448b70..3ed6adff83 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -51,7 +51,7 @@
 
 #include "cpu.h"
 #include "elf.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 #include "hw/xen/start_info.h"
 
 #define MICROVM_QBOOT_FILENAME "qboot.rom"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9e29f3792b..e562f5e190 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -61,7 +61,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/start_info.h"
 #include "ui/qemu-spice.h"
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 5944fc44ed..88d0c70e12 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -52,7 +52,7 @@
 #include "elf.h"
 #include "standard-headers/asm-x86/bootparam.h"
 #include CONFIG_DEVICES
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 
 #define BIOS_FILENAME "bios.bin"
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5a8c96072e..b9bd249c8f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -30,7 +30,7 @@
 #include "sysemu/hvf.h"
 #include "sysemu/cpus.h"
 #include "sysemu/xen.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 #include "sev_i386.h"
 
 #include "qemu/error-report.h"
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 034f46bcc2..a1b3367ab2 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -24,7 +24,7 @@
 #include "qemu/qemu-print.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/i386/hyperv-stub.c b/target/i386/kvm/hyperv-stub.c
similarity index 100%
rename from target/i386/hyperv-stub.c
rename to target/i386/kvm/hyperv-stub.c
diff --git a/target/i386/hyperv.c b/target/i386/kvm/hyperv.c
similarity index 100%
rename from target/i386/hyperv.c
rename to target/i386/kvm/hyperv.c
diff --git a/target/i386/kvm-stub.c b/target/i386/kvm/kvm-stub.c
similarity index 100%
rename from target/i386/kvm-stub.c
rename to target/i386/kvm/kvm-stub.c
diff --git a/target/i386/kvm.c b/target/i386/kvm/kvm.c
similarity index 100%
rename from target/i386/kvm.c
rename to target/i386/kvm/kvm.c
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 233e46bb70..1614e8c2f8 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -3,9 +3,9 @@
 #include "exec/exec-all.h"
 #include "hw/isa/isa.h"
 #include "migration/cpu.h"
-#include "hyperv.h"
+#include "kvm/hyperv.h"
 #include "hw/i386/x86.h"
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41..5b3eced829 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -425,7 +425,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 M: Marcelo Tosatti <mtosatti@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
-F: target/i386/kvm.c
+F: target/i386/kvm/
 F: scripts/kvm/vmxcap
 
 Guest CPU Cores (other accelerators)
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
new file mode 100644
index 0000000000..1d66559187
--- /dev/null
+++ b/target/i386/kvm/meson.build
@@ -0,0 +1,3 @@
+i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
+i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
new file mode 100644
index 0000000000..b4e2d9e4ea
--- /dev/null
+++ b/target/i386/kvm/trace-events
@@ -0,0 +1,7 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# kvm.c
+kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %" PRIu32
+kvm_x86_add_msi_route(int virq) "Adding route entry for virq %d"
+kvm_x86_remove_msi_route(int virq) "Removing route entry for virq %d"
+kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
diff --git a/target/i386/meson.build b/target/i386/meson.build
index a1a02f3e99..0209542a8a 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -18,7 +18,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'smm_helper.c',
   'svm_helper.c',
   'translate.c'), if_false: files('tcg-stub.c'))
-i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 i386_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-stub.c'))
 
 i386_softmmu_ss = ss.source_set()
@@ -28,8 +27,6 @@ i386_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
 ))
-i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
-i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
   'whpx-all.c',
   'whpx-cpus.c',
@@ -42,6 +39,7 @@ i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
 
+subdir('kvm')
 subdir('hvf')
 
 target_arch += {'i386': i386_ss}
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 789c700d4a..d166f9d5e0 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -1,11 +1,5 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
-# kvm.c
-kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %" PRIu32
-kvm_x86_add_msi_route(int virq) "Adding route entry for virq %d"
-kvm_x86_remove_msi_route(int virq) "Removing route entry for virq %d"
-kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
-
 # sev.c
 kvm_sev_init(void) ""
 kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zu"
-- 
2.26.2


