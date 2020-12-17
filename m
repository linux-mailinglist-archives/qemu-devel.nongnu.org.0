Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E32DD8A9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:49:19 +0100 (CET)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyL0-0007sR-Ll
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIJ-0006Ea-F1
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIG-0001uR-0i
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqAkyQpmZxCzeCcQIXEoFcL1zSDpPT1VN+itonnIjAM=;
 b=Qx4PmzFtOPstvLZek4fIcS+EJTz9T1594M8oR993SChRP+F54y3ag1HhziLh6aIyS/fvPw
 dcxXiKGLSdK+D/su/yGWMcQw6uz2QDAzw/Eq3qcY0RbURPtapg6LUlpkSKuYQrprYlHiAf
 CfFMgaVj+X2PSulLXlHFPfprVIenNPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-8nSrLDWqOAizf_P3QX79kQ-1; Thu, 17 Dec 2020 13:46:24 -0500
X-MC-Unique: 8nSrLDWqOAizf_P3QX79kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62528107ACE3;
 Thu, 17 Dec 2020 18:46:23 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16CDE18222;
 Thu, 17 Dec 2020 18:46:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/17] i386: move kvm accel files into kvm/
Date: Thu, 17 Dec 2020 13:46:04 -0500
Message-Id: <20201217184620.3945917-2-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201212155530.23098-2-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h                    | 2 +-
 target/i386/{ => kvm}/hyperv-proto.h | 0
 target/i386/{ => kvm}/hyperv.h       | 0
 target/i386/{ => kvm}/kvm_i386.h     | 0
 target/i386/kvm/trace.h              | 1 +
 MAINTAINERS                          | 2 +-
 hw/i386/fw_cfg.c                     | 2 +-
 hw/i386/intel_iommu.c                | 2 +-
 hw/i386/kvm/apic.c                   | 2 +-
 hw/i386/kvm/clock.c                  | 2 +-
 hw/i386/microvm.c                    | 2 +-
 hw/i386/pc.c                         | 2 +-
 hw/i386/x86.c                        | 2 +-
 meson.build                          | 1 +
 target/i386/cpu.c                    | 2 +-
 target/i386/helper.c                 | 2 +-
 target/i386/{ => kvm}/hyperv-stub.c  | 0
 target/i386/{ => kvm}/hyperv.c       | 0
 target/i386/{ => kvm}/kvm-stub.c     | 0
 target/i386/{ => kvm}/kvm.c          | 0
 target/i386/kvm/meson.build          | 3 +++
 target/i386/kvm/trace-events         | 7 +++++++
 target/i386/machine.c                | 4 ++--
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

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c4a49c06a8..d6bb053837 100644
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
diff --git a/MAINTAINERS b/MAINTAINERS
index d5ea7fbb8f..a77553833a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -426,7 +426,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 M: Marcelo Tosatti <mtosatti@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
-F: target/i386/kvm.c
+F: target/i386/kvm/
 F: scripts/kvm/vmxcap
 
 Guest CPU Cores (other accelerators)
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index b87f0e5070..e48a54fa36 100644
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
index b226b674e8..3dbff2be2e 100644
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
index f111ef87d8..edf2b0f061 100644
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
index 640fb5b0b7..5458f61d10 100644
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
index 49e1d419b2..6329f90ef9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -54,7 +54,7 @@
 #include "elf.h"
 #include "standard-headers/asm-x86/bootparam.h"
 #include CONFIG_DEVICES
-#include "kvm_i386.h"
+#include "kvm/kvm_i386.h"
 
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
diff --git a/meson.build b/meson.build
index fba6413056..372576f82c 100644
--- a/meson.build
+++ b/meson.build
@@ -1497,6 +1497,7 @@ trace_events_subdirs += [
   'target/arm',
   'target/hppa',
   'target/i386',
+  'target/i386/kvm',
   'target/mips',
   'target/ppc',
   'target/riscv',
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ca997a68cd..77f0e44df8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -31,7 +31,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/xen.h"
 #include "sysemu/whpx.h"
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
diff --git a/target/i386/meson.build b/target/i386/meson.build
index fc3ee80386..5363757131 100644
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
@@ -43,6 +40,7 @@ i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
 
+subdir('kvm')
 subdir('hvf')
 
 target_arch += {'i386': i386_ss}
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 246158ae1f..a22ab24e21 100644
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
 kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zx"
-- 
2.28.0


