Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257ED3293E6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:42:57 +0100 (CET)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqJb-00033h-NO
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lGok5-00017a-U3; Mon, 01 Mar 2021 15:02:09 -0500
Received: from mail.ispras.ru ([83.149.199.84]:60680)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lGok2-0006ao-Lx; Mon, 01 Mar 2021 15:02:09 -0500
Received: from localhost.localdomain (unknown [77.232.9.83])
 by mail.ispras.ru (Postfix) with ESMTPSA id E215F40755ED;
 Mon,  1 Mar 2021 20:01:56 +0000 (UTC)
From: Vitaly Cheptsov <cheptsov@ispras.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
Date: Mon,  1 Mar 2021 22:59:18 +0300
Message-Id: <20210301195919.9333-1-cheptsov@ispras.ru>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Mar 2021 16:41:25 -0500
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
Cc: Vitaly Cheptsov <cheptsov@ispras.ru>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After fixing the _UID value for the primary PCI root bridge in
af1b80ae it was discovered that this change updates Windows
configuration in an incompatible way causing network configuration
failure unless DHCP is used. More details provided on the list:

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08484.html

This change reverts the _UID update from 1 to 0 for q35 and i440fx
VMs before version 5.2 to maintain the original behaviour when
upgrading.

Cc: qemu-stable@nongnu.org
Cc: qemu-devel@nongnu.org
Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
---
 hw/i386/acpi-build.c | 4 ++--
 hw/i386/pc_piix.c    | 2 ++
 hw/i386/pc_q35.c     | 2 ++
 include/hw/i386/pc.h | 1 +
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 31a5f6f4a5..442b4629a9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1277,7 +1277,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1296,7 +1296,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2904b40163..46cc951073 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -405,6 +405,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000";
+    pcmc->pci_root_uid = 0;
 
     m->family = "pc_piix";
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
@@ -448,6 +449,7 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
+    pcmc->pci_root_uid = 1;
 }
 
 DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0a212443aa..53450190f5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -329,6 +329,7 @@ static void pc_q35_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000e";
+    pcmc->pci_root_uid = 0;
 
     m->family = "pc_q35";
     m->desc = "Standard PC (Q35 + ICH9, 2009)";
@@ -375,6 +376,7 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
+    pcmc->pci_root_uid = 1;
 }
 
 DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c9d194a5e7..d4c3d73c11 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -105,6 +105,7 @@ struct PCMachineClass {
     int legacy_acpi_table_size;
     unsigned acpi_data_size;
     bool do_not_add_smb_acpi;
+    int pci_root_uid;
 
     /* SMBIOS compat: */
     bool smbios_defaults;
-- 
2.24.3 (Apple Git-128)


