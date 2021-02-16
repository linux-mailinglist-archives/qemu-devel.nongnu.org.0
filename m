Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5331C586
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:30:08 +0100 (CET)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq7r-0008QM-Pl
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptp-0006Wd-IF
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:25640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptl-0001b1-4n
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:36 -0500
IronPort-SDR: hz9n/qWYKBHV+Tx3pXJHtmwvIoyq2bbCBufwL8HcgveHftnr3mfQW9mvZiofsigo+mDbc57MGa
 TbZXAJ+tUtjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558768"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
IronPort-SDR: bTa1V5nNWnVHlu6obW20lt5sVgr0Pj1YcFNm5PpOHi1oRbxr5dqA8HeXEGI8aoHUWBMRFVGeCN
 gy31Vn4/T52w==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705429"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 15/23] i386/tdx: Add hook to require generic device loader
Date: Mon, 15 Feb 2021 18:13:11 -0800
Message-Id: <2ea61dad121c2ec89597b3b6dbfe538be22ac2cc.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
---
 hw/i386/pc_sysfw.c         |  6 ++++++
 include/sysemu/tdx.h       |  2 ++
 target/i386/kvm/tdx-stub.c |  5 +++++
 target/i386/kvm/tdx.c      | 25 +++++++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 11172214f1..65eed485ff 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -39,6 +39,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
+#include "sysemu/tdx.h"
 
 #define FLASH_SECTOR_SIZE 4096
 
@@ -207,6 +208,11 @@ void pc_system_firmware_init(PCMachineState *pcms,
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
index d095dab662..e8cd2a7672 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -106,6 +106,31 @@ int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
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
2.17.1


