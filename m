Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC4588EFD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:58:33 +0200 (CEST)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFpQ-0006wM-3H
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJEe4-0005Zf-1j
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:42:44 -0400
Received: from smtp-fw-9103.amazon.com ([207.171.188.200]:48467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJEdz-000489-Nk
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1659534159; x=1691070159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x98uMoxWp5rgjNFDMbf+krw72BDczBR2Qf1VC9TcJC0=;
 b=dh21CGFYdROLBVCDprUccHZx383g+3iGr1bI8HToLHY+xEwsiJFibJzv
 ND116/MeKEgyRCcnAFTtwmlxbumzNct18KN6bC2Lx51QkeQ4gdaoFiqvl
 3adrm9bcgVBLoWQaLwHcezRVuBIBtkPOHJoJi/TASfgAbTeva1/AYJFhL 4=;
X-IronPort-AV: E=Sophos;i="5.93,214,1654560000"; d="scan'208";a="1040527117"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-7dac3c4d.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 13:42:23 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-7dac3c4d.us-east-1.amazon.com (Postfix) with
 ESMTPS id D5AD88C76A; Wed,  3 Aug 2022 13:42:21 +0000 (UTC)
Received: from f4d4887fdcfb.ant.amazon.com (10.43.162.227) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Wed, 3 Aug 2022 13:42:17 +0000
From: <bchalios@amazon.es>
To: <qemu-devel@nongnu.org>
CC: <bchalios@amazon.es>, <ani@anisinha.ca>, <mst@redhat.com>,
 <imammedo@redhat.com>, <dwmw@amazon.co.uk>, <graf@amazon.de>,
 <xmarcalx@amazon.co.uk>
Subject: [PATCH 2/2] vmgenid: add generation counter
Date: Wed, 3 Aug 2022 15:41:47 +0200
Message-ID: <20220803134147.31073-3-bchalios@amazon.es>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220803134147.31073-1-bchalios@amazon.es>
References: <20220803134147.31073-1-bchalios@amazon.es>
MIME-Version: 1.0
X-Originating-IP: [10.43.162.227]
X-ClientProxiedBy: EX13D41UWC002.ant.amazon.com (10.43.162.127) To
 EX13D37EUA003.ant.amazon.com (10.43.165.7)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.171.188.200;
 envelope-from=prvs=207aa399e=bchalios@amazon.es; helo=smtp-fw-9103.amazon.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Aug 2022 10:54:38 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babis Chalios <bchalios@amazon.es>

Some user-space applications such as user-space PRNGs or applications
that keep world-unique data need to be notified about VM restore events,
so that they modify their internal state. However, the vmgenid 128-bits
UUID is consumed by the guest kernel to reseed its RNG, hence it is not
suitable to be exposed to user-space.

In order to address the user-space needs this commit extends the vmgenid
to include a 32-bits generation counter. The value of the counter is
meant to be increased every time we start a new VM from a saved state.

It is stored in a page aligned, one page-long buffer, so that it allows
the guest kernel to expose it as an mmap-able device to the user-space
for low latency access, out of the notification path.

Signed-off-by: Babis Chalios <bchalios@amazon.es>
---
 docs/specs/vmgenid.txt    | 97 +++++++++++++++++++++++++++------------
 hw/acpi/vmgenid.c         | 96 +++++++++++++++++++++++++++-----------
 include/hw/acpi/vmgenid.h |  9 +++-
 3 files changed, 144 insertions(+), 58 deletions(-)

diff --git a/docs/specs/vmgenid.txt b/docs/specs/vmgenid.txt
index 5274b4c895..3cf6d0e191 100644
--- a/docs/specs/vmgenid.txt
+++ b/docs/specs/vmgenid.txt
@@ -20,6 +20,15 @@ guest operating system notices the change, and is then able to react as
 appropriate by marking its copies of distributed databases as dirty,
 re-initializing its random number generator etc.
 
+Currently, in Linux the UUID exposed by vmgenid is consumed by the guest kernel
+to reseed its RNG and not exposed in the user-space, hence leaving applications
+without a mechanism which would help them detect a VM restore event.
+
+To address the use-case of user-space applications we extend the vmgenid
+specification to include a 32-bit generation counter. The counter needs to be
+incremented every time a VM is loaded from a saved state by the user. The guest
+kernel needs to expose to user-space applications which should monitor it for
+detecting the VM-load event.
 
 Requirements
 ------------
@@ -53,12 +62,24 @@ R2 to R5. [These AML requirements are isolated well enough in the Microsoft
 R6. The hypervisor shall expose a _HID (hardware identifier) object in the
     VMGenId device's scope that is unique to the hypervisor vendor.
 
+The generation counter and the buffer holding it shall adhere to the same
+requirements as the generation ID. Moreover,
+
+R7. The BIOS will need to include an object below the device named "CTRA",
+    which, similarly to "ADDR", will evaluate to a package of two integers. The
+    first integer must be the low 32-bits of the guest physical address of the
+    buffer that contains generation counter. The second integer must be the
+    hight 32 bits of the guest physical address of the same buffer.
+
+R8. The buffer holding the generation counter will be page aligned and 1 page
+    long.
+
 
 QEMU Implementation
 -------------------
 
 The above-mentioned specification does not dictate which ACPI descriptor table
-will contain the VM Generation ID device.  Other implementations (Hyper-V and
+will contain the VM Generation ID device. Other implementations (Hyper-V and
 Xen) put it in the main descriptor table (Differentiated System Description
 Table or DSDT).  For ease of debugging and implementation, we have decided to
 put it in its own Secondary System Description Table, or SSDT.
@@ -72,8 +93,8 @@ ASL+ Optimizing Compiler version 20150717-64
 Copyright (c) 2000 - 2015 Intel Corporation
 
 Reading ACPI table from file /sys/firmware/acpi/tables/SSDT - Length
-00000198 (0x0000C6)
-ACPI: SSDT 0x0000000000000000 0000C6 (v01 BOCHS  VMGENID  00000001 BXPC
+00000236 (0x0000EC)
+ACPI: SSDT 0x0000000000000000 0000EC (v01 BOCHS  VMGENID  00000001 BXPC
 00000001)
 Acpi table [SSDT] successfully installed and loaded
 Pass 1 parse of [SSDT]
@@ -95,9 +116,9 @@ ASL Output:    ./SSDT.dsl - 1631 bytes
  *
  * Original Table Header:
  *     Signature        "SSDT"
- *     Length           0x000000CA (202)
+ *     Length           0x000000EC (236)
  *     Revision         0x01
- *     Checksum         0x4B
+ *     Checksum         0x63
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "VMGENID"
  *     OEM Revision     0x00000001 (1)
@@ -133,6 +154,14 @@ DefinitionBlock ("/sys/firmware/acpi/tables/SSDT.aml", "SSDT", 1, "BOCHS ",
                 Index (Local0, One) = Zero
                 Return (Local0)
             }
+
+            Method (CTRA, 0, NotSerialized)
+            {
+                Local0 = Package (0x02) {}
+                Local0 [Zero] = (VGIA + 0x1000)
+                Local0 [One] = Zero
+                Return (Local0)
+            }
         }
     }
 
@@ -161,7 +190,8 @@ More information about fw_cfg can be found in "docs/specs/fw_cfg.txt"
 
 Two fw_cfg blobs are used in this case:
 
-/etc/vmgenid_guid - contains the actual VM Generation ID GUID
+/etc/vmgenid_data - contains the actual VM Generation ID GUID and Generation
+                    counter
                   - read-only to the guest
 /etc/vmgenid_addr - contains the address of the downloaded vmgenid blob
                   - writable by the guest
@@ -169,14 +199,14 @@ Two fw_cfg blobs are used in this case:
 
 QEMU sends the following commands to the guest at startup:
 
-1. Allocate memory for vmgenid_guid fw_cfg blob.
-2. Write the address of vmgenid_guid into the SSDT (VGIA ACPI variable as
+1. Allocate memory for vmgenid_data fw_cfg blob.
+2. Write the address of vmgenid_data into the SSDT (VGIA ACPI variable as
    shown above in the iasl dump).  Note that this change is not propagated
    back to QEMU.
-3. Write the address of vmgenid_guid back to QEMU's copy of vmgenid_addr
+3. Write the address of vmgenid_data back to QEMU's copy of vmgenid_addr
    via the fw_cfg DMA interface.
 
-After step 3, QEMU is able to update the contents of vmgenid_guid at will.
+After step 3, QEMU is able to update the contents of vmgenid_data at will.
 
 Since BIOS or UEFI does not necessarily run when we wish to change the GUID,
 the value of VGIA is persisted via the VMState mechanism.
@@ -196,46 +226,53 @@ All GUID passed in via command line or monitor are treated as big-endian.
 GUID values displayed via monitor are shown in big-endian format.
 
 
-GUID Storage Format:
+vmgenid Storage Format:
 --------------------
 
-In order to implement an OVMF "SDT Header Probe Suppressor", the contents of
-the vmgenid_guid fw_cfg blob are not simply a 128-bit GUID.  There is also
-significant padding in order to align and fill a memory page, as shown in the
-following diagram:
+The contents of the vmgenid_data fw_cfg blob are two memory pages. In beginning
+of the first page lives the OVMF SDT Header probe padded so that GUID is stored
+in an 8-byte aligned address. Immediately after that is stored the GUID
+followed by padding until the end of the page. The genration counter lives
+in the beginning of the second page. The rest of the page is padded with zeros.
+The layout is shown in the following diagram:
 
 +----------------------------------+
 | SSDT with OEM Table ID = VMGENID |
 +----------------------------------+
 | ...                              |       TOP OF PAGE
-| VGIA dword object ---------------|-----> +---------------------------+
-| ...                              |       | fw-allocated array for    |
-| _STA method referring to VGIA    |       | "etc/vmgenid_guid"        |
-| ...                              |       +---------------------------+
-| ADDR method referring to VGIA    |       |  0: OVMF SDT Header probe |
-| ...                              |       |     suppressor            |
-+----------------------------------+       | 36: padding for 8-byte    |
-                                           |     alignment             |
-                                           | 40: GUID                  |
-                                           | 56: padding to page size  |
-                                           +---------------------------+
-                                           END OF PAGE
+| VGIA dword object ---------------|-----> +------------------------------------+
+| ...                              |       | fw-allocated array for             |
+| _STA method referring to VGIA    |       | "etc/vmgenid_data"                 |
+| ...                              |       +------------------------------------+
+| ADDR method referring to VGIA    |       |  0: OVMF SDT Header probe          |
+| ...                              |       |     suppressor                     |
++----------------------------------+       | 36: padding for 8-byte             |
+                                           |     alignment                      |
+                                           | 40: GUID                           |
+                                           | 56: padding to page size           |
+                                           |                                    |
+                                           | ...                                |
+                                           | PAGE_SIZE    : Gen counter         |
+                                           | PAGE_SIZE + 4: padding to page size|
+                                           +------------------------------------+
 
 
 Device Usage:
 -------------
 
-The device has two properties, which may be only be set using the command line:
+The device has three properties, which may be only be set using the command
+line:
 
   guid - sets the value of the GUID. A special value "auto" instructs
          QEMU to generate a new random GUID.
   page-size - sets the target machines page size. Currently accepted values
               are 4096 (default) and 65536.
+  genctr - sets the Generation counter of the VM.
 
 For example:
 
-  QEMU  -device vmgenid,guid="324e6eaf-d1d1-4bf6-bf41-b9bb6c91fb87",page-size=65536
-  QEMU  -device vmgenid,guid=auto
+  QEMU  -device vmgenid,guid="324e6eaf-d1d1-4bf6-bf41-b9bb6c91fb87",page-size=65536,genctr=0
+  QEMU  -device vmgenid,guid=auto,genctr=42
 
 The property may be queried via QMP/HMP:
 
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index ac2b116b6a..980d19daf3 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -24,7 +24,7 @@
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 
-void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
+void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *vmgenid,
                         BIOSLinker *linker, const char *oem_id)
 {
     Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
@@ -34,17 +34,26 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
                         .oem_id = oem_id, .oem_table_id = "VMGENID" };
 
     /* Fill in the GUID values.  These need to be converted to little-endian
-     * first, since that's what the guest expects
+     * first, since that's what the guest expects. Allocate two pages, so that
+     * we can dedicate a full page (the second one) to the generation counter.
      */
-    g_array_set_size(guid, vms->page_size - ARRAY_SIZE(guid_le.data));
+    g_array_set_size(vmgenid, 2 * vms->page_size - ARRAY_SIZE(guid_le.data)
+                     - sizeof(vms->gen_ctr));
     guid_le = qemu_uuid_bswap(vms->guid);
     /* The GUID is written at a fixed offset into the fw_cfg file
      * in order to implement the "OVMF SDT Header probe suppressor"
      * see docs/specs/vmgenid.txt for more details
      */
-    g_array_insert_vals(guid, VMGENID_GUID_OFFSET, guid_le.data,
+    g_array_insert_vals(vmgenid, VMGENID_GUID_OFFSET, guid_le.data,
                         ARRAY_SIZE(guid_le.data));
 
+    /* Write the generation counter at the beginning of the second page of
+     * the fw_cfg file.
+     */
+    g_array_insert_vals(vmgenid, vms->page_size, (uint8_t *)&vms->gen_ctr,
+                        sizeof(vms->gen_ctr));
+    vms->has_gen_ctr = true;
+
     /* Put VMGNEID into a separate SSDT table */
     acpi_table_begin(&table, table_data);
     ssdt = init_aml_allocator();
@@ -84,6 +93,23 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     aml_append(method, aml_return(addr));
 
     aml_append(dev, method);
+
+    /* the CTRA method returns two 32-bit words representing the lower and
+     * upper halves of the physical address of the Generation counter inside
+     * the fw_cfg blob
+     */
+    method = aml_method("CTRA", 0, AML_NOTSERIALIZED);
+
+    addr = aml_local(0);
+    aml_append(method, aml_store(aml_package(2), addr));
+    aml_append(method, aml_store(aml_add(aml_name("VGIA"),
+                                         aml_int(vms->page_size), NULL),
+                                 aml_index(addr, aml_int(0))));
+    aml_append(method, aml_store(aml_int(0), aml_index(addr, aml_int(1))));
+    aml_append(method, aml_return(addr));
+
+    aml_append(dev, method);
+
     aml_append(scope, dev);
     aml_append(ssdt, scope);
 
@@ -95,8 +121,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
 
     /* Allocate guest memory for the Data fw_cfg blob */
-    bios_linker_loader_alloc(linker, VMGENID_GUID_FW_CFG_FILE, guid,
-                             vms->page_size,
+    bios_linker_loader_alloc(linker, VMGENID_DATA_FW_CFG_FILE, vmgenid,
+                             2 * vms->page_size,
                              false /* page boundary, high memory */);
 
     /* Patch address of GUID fw_cfg blob into the ADDR fw_cfg blob
@@ -108,7 +134,7 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
      */
     bios_linker_loader_write_pointer(linker,
         VMGENID_ADDR_FW_CFG_FILE, 0, sizeof(uint64_t),
-        VMGENID_GUID_FW_CFG_FILE, VMGENID_GUID_OFFSET);
+        VMGENID_DATA_FW_CFG_FILE, VMGENID_GUID_OFFSET);
 
     /* Patch address of GUID fw_cfg blob into the AML so OSPM can retrieve
      * and read it.  Note that while we provide storage for 64 bits, only
@@ -116,17 +142,18 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
      */
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
-        VMGENID_GUID_FW_CFG_FILE, 0);
+        VMGENID_DATA_FW_CFG_FILE, 0);
 
     /* must be called after above command to ensure correct table checksum */
     acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *guid)
+void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *vmgenid)
 {
-    /* Create a read-only fw_cfg file for GUID */
-    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data, vms->page_size);
+    /* Create a read-only fw_cfg file for vmgenid data */
+    fw_cfg_add_file(s, VMGENID_DATA_FW_CFG_FILE, vmgenid->data,
+                    2 * vms->page_size);
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,
                              vms->vmgenid_addr_le,
@@ -136,7 +163,7 @@ void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *guid)
 static void vmgenid_update_guest(VmGenIdState *vms)
 {
     Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
-    uint32_t vmgenid_addr;
+    uint32_t vmgenid_addr, vmgenid_gen_ctr_addr;
     QemuUUID guid_le;
 
     if (obj) {
@@ -146,22 +173,36 @@ static void vmgenid_update_guest(VmGenIdState *vms)
         /* A zero value in vmgenid_addr means that BIOS has not yet written
          * the address
          */
-        if (vmgenid_addr) {
-            /* QemuUUID has the first three words as big-endian, and expect
-             * that any GUIDs passed in will always be BE.  The guest,
-             * however, will expect the fields to be little-endian.
-             * Perform a byte swap immediately before writing.
-             */
-            guid_le = qemu_uuid_bswap(vms->guid);
-            /* The GUID is written at a fixed offset into the fw_cfg file
-             * in order to implement the "OVMF SDT Header probe suppressor"
-             * see docs/specs/vmgenid.txt for more details.
-             */
-            cpu_physical_memory_write(vmgenid_addr, guid_le.data,
-                                      sizeof(guid_le.data));
-            /* Send _GPE.E05 event */
-            acpi_send_event(DEVICE(obj), ACPI_VMGENID_CHANGE_STATUS);
+        if (!vmgenid_addr) {
+            return;
+        }
+
+        /* Only update the generation counter if the original guest supported
+         * it.
+         */
+        if (vms->has_gen_ctr) {
+            /* The generation counter address is in the second page of the blob */
+            vmgenid_gen_ctr_addr = vmgenid_addr - VMGENID_GUID_OFFSET
+                                   + vms->page_size;
+
+            cpu_physical_memory_write(vmgenid_gen_ctr_addr, &vms->gen_ctr,
+                                      sizeof(vms->gen_ctr));
         }
+
+        /* QemuUUID has the first three words as big-endian, and expect
+         * that any GUIDs passed in will always be BE.  The guest,
+         * however, will expect the fields to be little-endian.
+         * Perform a byte swap immediately before writing.
+         */
+        guid_le = qemu_uuid_bswap(vms->guid);
+        /* The GUID is written at a fixed offset into the fw_cfg file
+         * in order to implement the "OVMF SDT Header probe suppressor"
+         * see docs/specs/vmgenid.txt for more details.
+         */
+        cpu_physical_memory_write(vmgenid_addr, guid_le.data,
+                sizeof(guid_le.data));
+        /* Send _GPE.E05 event */
+        acpi_send_event(DEVICE(obj), ACPI_VMGENID_CHANGE_STATUS);
     }
 }
 
@@ -266,6 +307,7 @@ static Property vmgenid_device_properties[] = {
     DEFINE_PROP_UUID(VMGENID_GUID, VmGenIdState, guid),
     DEFINE_PROP_UNSIGNED(VMGENID_PAGE_SIZE, VmGenIdState, page_size, 0,
                          vmgenid_prop_page_size, uint32_t),
+    DEFINE_PROP_UINT32(VMGENID_GEN_CTR, VmGenIdState, gen_ctr, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index e4d83f5c74..56dd7533b0 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -9,7 +9,8 @@
 #define TYPE_VMGENID                  "vmgenid"
 #define VMGENID_GUID                  "guid"
 #define VMGENID_PAGE_SIZE             "page-size"
-#define VMGENID_GUID_FW_CFG_FILE      "etc/vmgenid_guid"
+#define VMGENID_GEN_CTR               "genctr"
+#define VMGENID_DATA_FW_CFG_FILE      "etc/vmgenid_data"
 #define VMGENID_ADDR_FW_CFG_FILE      "etc/vmgenid_addr"
 
 #define VMGENID_DEFAULT_FW_PAGE_SIZE  4096 /* Assume 4K page by default */
@@ -22,6 +23,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(VmGenIdState, VMGENID)
 struct VmGenIdState {
     DeviceState parent_obj;
     QemuUUID guid;                /* The 128-bit GUID seen by the guest */
+    uint32_t gen_ctr;             /* A 32bit generation counter meant to
+                                   * be exposed in the guest user-space
+                                   */
+    bool has_gen_ctr;             /* Backwards compatibility: Only update a
+                                   * guest when generation current present
+                                   */
     uint8_t vmgenid_addr_le[8];   /* Address of the GUID (little-endian) */
     uint32_t page_size;           /* Page size to use as a the allocation unit */
 };
-- 
2.32.1 (Apple Git-133)

Amazon Spain Services sociedad limitada unipersonal, Calle Ramirez de Prado 5, 28045 Madrid. Registro Mercantil de Madrid . Tomo 22458 . Folio 102 . Hoja M-401234 . CIF B84570936


