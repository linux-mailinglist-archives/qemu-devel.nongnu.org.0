Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DF936F606
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:57:12 +0200 (CEST)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcN5L-0001pv-QP
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMfi-0006IR-0D
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:30:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:63447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMfW-00017U-93
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:30:40 -0400
IronPort-SDR: L8wsqDFdhWxq9/Pd2Gs20DU1pmf7DqW1IOxxJOOBXFLaxxIi5z/DQPfUXYH0RltkjpNteNXS5C
 ek3tACSSdiWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023196"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023196"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:29:06 -0700
IronPort-SDR: bUfNW+qC2puBNd4wD8ari7ozHiqMhlePK002N3RZ4lI0/UvsQOLzA99OAwf+NvJOck7OgymDuA
 LSvvXhz5LYQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258682"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:29:04 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 30/32] Kconfig: Add CONFIG_SGX support
Date: Fri, 30 Apr 2021 14:24:53 +0800
Message-Id: <20210430062455.8117-31-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210430062455.8117-1-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new CONFIG_SGX for sgx support in the Qemu, and the Kconfig
default enable sgx in the i386 platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 backends/meson.build                     |  2 +-
 default-configs/devices/i386-softmmu.mak |  1 +
 hw/i386/Kconfig                          |  5 +++++
 hw/i386/meson.build                      |  2 +-
 hw/i386/sgx-stub.c                       | 13 +++++++++++++
 5 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 hw/i386/sgx-stub.c

diff --git a/backends/meson.build b/backends/meson.build
index 46fd16b269..6e68945528 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -16,6 +16,6 @@ softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vho
 softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
 softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
 softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
-softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-epc.c'))
+softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
 
 subdir('tpm')
diff --git a/default-configs/devices/i386-softmmu.mak b/default-configs/devices/i386-softmmu.mak
index 84d1a2487c..598c6646df 100644
--- a/default-configs/devices/i386-softmmu.mak
+++ b/default-configs/devices/i386-softmmu.mak
@@ -22,6 +22,7 @@
 #CONFIG_TPM_CRB=n
 #CONFIG_TPM_TIS_ISA=n
 #CONFIG_VTD=n
+#CONFIG_SGX=n
 
 # Boards:
 #
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877..581526be44 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -2,6 +2,10 @@ config SEV
     bool
     depends on KVM
 
+config SGX
+    bool
+    depends on KVM
+
 config PC
     bool
     imply APPLESMC
@@ -17,6 +21,7 @@ config PC
     imply PVPANIC_ISA
     imply QXL
     imply SEV
+    imply SGX
     imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 087426c75c..f79f1bafab 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -5,7 +5,6 @@ i386_ss.add(files(
   'e820_memory_layout.c',
   'multiboot.c',
   'x86.c',
-  'sgx-epc.c',
 ))
 
 i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
@@ -17,6 +16,7 @@ i386_ss.add(when: 'CONFIG_Q35', if_true: files('pc_q35.c'))
 i386_ss.add(when: 'CONFIG_VMMOUSE', if_true: files('vmmouse.c'))
 i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
 i386_ss.add(when: 'CONFIG_VTD', if_true: files('intel_iommu.c'))
+i386_ss.add(when: 'CONFIG_SGX', if_true: files('sgx-epc.c'), if_false: files('sgx-stub.c'))
 
 i386_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-common.c'))
 i386_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device_x86.c'))
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
new file mode 100644
index 0000000000..edf17c3309
--- /dev/null
+++ b/hw/i386/sgx-stub.c
@@ -0,0 +1,13 @@
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+#include "hw/i386/sgx-epc.h"
+
+void pc_machine_init_sgx_epc(PCMachineState *pcms)
+{
+    return;
+}
+
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+{
+    return 1;
+}
-- 
2.29.2.334.gfaefdd61ec


