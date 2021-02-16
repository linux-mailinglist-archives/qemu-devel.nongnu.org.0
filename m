Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA9C31C584
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:28:58 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq6j-000733-AT
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpuH-0006ro-Bq
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:16:05 -0500
Received: from mga17.intel.com ([192.55.52.151]:25640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpuE-0001b1-WE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:16:05 -0500
IronPort-SDR: QgGJgayEzZ/6PYwoFfJwLt+ed3nPR2OMj3R59VKhXcGUGMQiBEYLucNDHr0Q0VvFxPYGujZ5D0
 zrcdTq5sz7Ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558779"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:54 -0800
IronPort-SDR: sgFYJihCG3Low2pGfY8Y9Msmd0NIKiCT1BKPUKAJ2IITt/1H9l1AYN0rn5GzN52ISwVhYXeAfp
 8qelepet7r3w==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705457"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:54 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 23/23] target/i386: Add machine option to disable PIC/8259
Date: Mon, 15 Feb 2021 18:13:19 -0800
Message-Id: <594a1420065737aa10c872878c303f82666e2870.1613188118.git.isaku.yamahata@intel.com>
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

Add a machine option to disable the legacy PIC (8259), which cannot be
supported for TDX guests as TDX-SEAM doesn't allow directly interrupt
injection.  Using posted interrupts for the PIC is not a viable option
as the guest BIOS/kernel will not do EOI for PIC IRQs, i.e. will leave
the vIRR bit set.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 hw/i386/pc.c         | 18 ++++++++++++++++++
 hw/i386/pc_piix.c    |  4 +++-
 hw/i386/pc_q35.c     |  4 +++-
 include/hw/i386/pc.h |  2 ++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8aa85dec54..12d44659bf 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1532,6 +1532,20 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_pic(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->pic_enabled;
+}
+
+static void pc_machine_set_pic(Object *obj, bool value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->pic_enabled = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1672,6 +1686,7 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->pit_enabled = true;
+    pcms->pic_enabled = true;
     pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
@@ -1797,6 +1812,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, PC_MACHINE_PIT,
         pc_machine_get_pit, pc_machine_set_pit);
 
+    object_class_property_add_bool(oc, PC_MACHINE_PIC,
+        pc_machine_get_pic, pc_machine_set_pic);
+
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2904b40163..4b59d40c3c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -220,7 +220,9 @@ static void pc_init1(MachineState *machine,
     }
     isa_bus_irqs(isa_bus, x86ms->gsi);
 
-    pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    if (pcms->pic_enabled) {
+        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    }
 
     if (pcmc->pci_enabled) {
         ioapic_init_gsi(gsi_state, "i440fx");
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0a212443aa..c68799efbb 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -250,7 +250,9 @@ static void pc_q35_init(MachineState *machine)
     pci_bus_set_route_irq_fn(host_bus, ich9_route_intx_pin_to_irq);
     isa_bus = ich9_lpc->isa_bus;
 
-    pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    if (pcms->pic_enabled) {
+        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    }
 
     if (pcmc->pci_enabled) {
         ioapic_init_gsi(gsi_state, "q35");
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 5f93540a43..6368f7bf77 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -44,6 +44,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool pic_enabled;
     uint64_t max_fw_size;
     char *oem_id;
     char *oem_table_id;
@@ -63,6 +64,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
+#define PC_MACHINE_PIC              "pic"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
 #define PC_MACHINE_OEM_ID           "oem-id"
 #define PC_MACHINE_OEM_TABLE_ID     "oem-table-id"
-- 
2.17.1


