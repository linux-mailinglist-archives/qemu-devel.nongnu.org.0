Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49883BF354
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:11:02 +0200 (CEST)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IZB-0005kw-UI
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKs-0002Az-2C
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:17 -0400
Received: from mga06.intel.com ([134.134.136.31]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKp-0007L4-MS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534898"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534898"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770037"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 15/44] i386/tdx: Add hook to require generic device
 loader
Date: Wed,  7 Jul 2021 17:54:45 -0700
Message-Id: <c16cb881efabc16a94ff7c02cd8c7abe24411e3f.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Add a hook for TDX to denote that the TD Virtual Firmware must be
provided via the "generic" device loader.  Error out if pflash is used
in conjuction with TDX.

Suggested-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/pc_sysfw.c         |  6 ++++++
 include/sysemu/tdx.h       |  2 ++
 target/i386/kvm/tdx-stub.c |  5 +++++
 target/i386/kvm/tdx.c      | 25 +++++++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 6ce37a2b05..5ff571af36 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -38,6 +38,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
+#include "sysemu/tdx.h"
 
 #define FLASH_SECTOR_SIZE 4096
 
@@ -328,6 +329,11 @@ void pc_system_firmware_init(PCMachineState *pcms,
     int i;
     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
 
+    if (!tdx_system_firmware_init(pcms, rom_memory)) {
+        pc_system_flash_cleanup_unused(pcms);
+        return;
+    }
+
     if (!pcmc->pci_enabled) {
         x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, true);
         return;
diff --git a/include/sysemu/tdx.h b/include/sysemu/tdx.h
index 03461b6ae8..70eb01348f 100644
--- a/include/sysemu/tdx.h
+++ b/include/sysemu/tdx.h
@@ -3,8 +3,10 @@
 
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/kvm.h"
+#include "hw/i386/pc.h"
 
 bool kvm_has_tdx(KVMState *s);
+int tdx_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 #endif
 
 void tdx_pre_create_vcpu(CPUState *cpu);
diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
index 93afe07ddb..4e1a0a4280 100644
--- a/target/i386/kvm/tdx-stub.c
+++ b/target/i386/kvm/tdx-stub.c
@@ -7,6 +7,11 @@ bool kvm_has_tdx(KVMState *s)
 {
         return false;
 }
+
+int tdx_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory)
+{
+    return -ENOSYS;
+}
 #endif
 
 void tdx_pre_create_vcpu(CPUState *cpu)
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 67fb03b4b5..48c04d344d 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -109,6 +109,31 @@ int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     return 0;
 }
 
+int tdx_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory)
+{
+    MachineState *ms = MACHINE(pcms);
+    TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
+                                                    TYPE_TDX_GUEST);
+    int i;
+
+    if (!tdx) {
+        return -ENOSYS;
+    }
+
+    /*
+     * Sanitiy check for tdx:
+     * TDX uses generic loader to load bios instead of pflash.
+     */
+    for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
+        if (drive_get(IF_PFLASH, 0, i)) {
+            error_report("pflash not supported by VM type, "
+                         "use -device loader,file=<path>");
+            exit(1);
+        }
+    }
+    return 0;
+}
+
 void tdx_get_supported_cpuid(KVMState *s, uint32_t function,
                              uint32_t index, int reg, uint32_t *ret)
 {
-- 
2.25.1


