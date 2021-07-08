Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD43BF380
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:19:53 +0200 (CEST)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ihk-0003MV-4B
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILP-00034S-1D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILN-0007ML-5L
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534908"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534908"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770065"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:56 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 24/44] i386/tdx: Add MMIO HOB entries
Date: Wed,  7 Jul 2021 17:54:54 -0700
Message-Id: <3cf3b4e1ccbddd08bb4695930b6ebee9678f9454.1625704981.git.isaku.yamahata@intel.com>
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

Add MMIO HOB entries, which are needed to enumerate legal MMIO ranges to
early TDVF.

Note, the attribute absolutely must include UNCACHEABLE, else TDVF will
effectively consider it a bad HOB entry and ignore it.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/tdvf-hob.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/tdvf-hob.h |  5 ++++
 2 files changed, 74 insertions(+)

diff --git a/hw/i386/tdvf-hob.c b/hw/i386/tdvf-hob.c
index 5e0bf807f7..60c5ed0e03 100644
--- a/hw/i386/tdvf-hob.c
+++ b/hw/i386/tdvf-hob.c
@@ -22,7 +22,10 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "e820_memory_layout.h"
+#include "hw/i386/pc.h"
 #include "hw/i386/x86.h"
+#include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_host.h"
 #include "sysemu/tdx.h"
 #include "tdvf-hob.h"
 #include "uefi.h"
@@ -62,6 +65,70 @@ static void *tdvf_get_area(TdvfHob *hob, uint64_t size)
     return ret;
 }
 
+static void tdvf_hob_add_mmio_resource(TdvfHob *hob, uint64_t start,
+                                       uint64_t end)
+{
+    EFI_HOB_RESOURCE_DESCRIPTOR *region;
+
+    if (!start) {
+        return;
+    }
+
+    region = tdvf_get_area(hob, sizeof(*region));
+    *region = (EFI_HOB_RESOURCE_DESCRIPTOR) {
+        .Header = {
+            .HobType = EFI_HOB_TYPE_RESOURCE_DESCRIPTOR,
+            .HobLength = cpu_to_le16(sizeof(*region)),
+            .Reserved = cpu_to_le32(0),
+        },
+        .Owner = EFI_HOB_OWNER_ZERO,
+        .ResourceType = cpu_to_le32(EFI_RESOURCE_MEMORY_MAPPED_IO),
+        .ResourceAttribute = cpu_to_le32(EFI_RESOURCE_ATTRIBUTE_TDVF_MMIO),
+        .PhysicalStart = cpu_to_le64(start),
+        .ResourceLength = cpu_to_le64(end - start),
+    };
+}
+
+static void tdvf_hob_add_mmio_resources(TdvfHob *hob)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    X86MachineState *x86ms = X86_MACHINE(ms);
+    PCIHostState *pci_host;
+    uint64_t start, end;
+    uint64_t mcfg_base, mcfg_size;
+    Object *host;
+
+    /* Effectively PCI hole + other MMIO devices. */
+    tdvf_hob_add_mmio_resource(hob, x86ms->below_4g_mem_size,
+                               APIC_DEFAULT_ADDRESS);
+
+    /* Stolen from acpi_get_i386_pci_host(), there's gotta be an easier way. */
+    pci_host = OBJECT_CHECK(PCIHostState,
+                            object_resolve_path("/machine/i440fx", NULL),
+                            TYPE_PCI_HOST_BRIDGE);
+    if (!pci_host) {
+        pci_host = OBJECT_CHECK(PCIHostState,
+                                object_resolve_path("/machine/q35", NULL),
+                                TYPE_PCI_HOST_BRIDGE);
+    }
+    g_assert(pci_host);
+
+    host = OBJECT(pci_host);
+
+    /* PCI hole above 4gb. */
+    start = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_START,
+                                     NULL);
+    end = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_END, NULL);
+    tdvf_hob_add_mmio_resource(hob, start, end);
+
+    /* MMCFG region */
+    mcfg_base = object_property_get_uint(host, PCIE_HOST_MCFG_BASE, NULL);
+    mcfg_size = object_property_get_uint(host, PCIE_HOST_MCFG_SIZE, NULL);
+    if (mcfg_base && mcfg_base != PCIE_BASE_ADDR_UNMAPPED && mcfg_size) {
+        tdvf_hob_add_mmio_resource(hob, mcfg_base, mcfg_base + mcfg_size);
+    }
+}
+
 static int tdvf_e820_compare(const void *lhs_, const void* rhs_)
 {
     const struct e820_entry *lhs = lhs_;
@@ -156,6 +223,8 @@ void tdvf_hob_create(TdxGuest *tdx, TdxFirmwareEntry *hob_entry)
 
     tdvf_hob_add_memory_resources(&hob);
 
+    tdvf_hob_add_mmio_resources(&hob);
+
     last_hob = tdvf_get_area(&hob, sizeof(*last_hob));
     *last_hob =  (EFI_HOB_GENERIC_HEADER) {
         .HobType = EFI_HOB_TYPE_END_OF_HOB_LIST,
diff --git a/hw/i386/tdvf-hob.h b/hw/i386/tdvf-hob.h
index c6c5c1d564..9967dbfe5a 100644
--- a/hw/i386/tdvf-hob.h
+++ b/hw/i386/tdvf-hob.h
@@ -17,4 +17,9 @@ void tdvf_hob_create(TdxGuest *tdx, TdxFirmwareEntry *hob_entry);
      EFI_RESOURCE_ATTRIBUTE_INITIALIZED |       \
      EFI_RESOURCE_ATTRIBUTE_UNACCEPTED)
 
+#define EFI_RESOURCE_ATTRIBUTE_TDVF_MMIO        \
+    (EFI_RESOURCE_ATTRIBUTE_PRESENT     |       \
+     EFI_RESOURCE_ATTRIBUTE_INITIALIZED |       \
+     EFI_RESOURCE_ATTRIBUTE_UNCACHEABLE)
+
 #endif
-- 
2.25.1


