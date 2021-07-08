Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07953BF364
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:17:30 +0200 (CEST)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IfR-0006Ai-MM
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILB-0002qt-0U
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IL6-0007Kq-A5
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534903"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534903"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770053"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:56 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Date: Wed,  7 Jul 2021 17:54:50 -0700
Message-Id: <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
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
 isaku.yamahata@gmail.com, kvm@vger.kernel.org,
 "Min M . Xu" <min.m.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Add support for loading TDX's Trusted Domain Virtual Firmware (TDVF) via
the generic loader.  Prioritize the TDVF above plain hex to avoid false
positives with hex (TDVF has explicit metadata to confirm it's a TDVF).

Enumerate TempMem as added, private memory, i.e. E820_RESERVED,
otherwise TDVF will interpret the whole shebang as MMIO and complain
that the aperture overlaps other MMIO regions.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Reported-by: Min M. Xu <min.m.xu@intel.com>
---
 hw/core/generic-loader.c |   5 +
 hw/core/meson.build      |   3 +
 hw/core/tdvf-stub.c      |   6 +
 hw/i386/meson.build      |   1 +
 hw/i386/tdvf.c           | 312 +++++++++++++++++++++++++++++++++++++++
 include/sysemu/tdvf.h    |   6 +
 target/i386/kvm/tdx.h    |  26 ++++
 7 files changed, 359 insertions(+)
 create mode 100644 hw/core/tdvf-stub.c
 create mode 100644 hw/i386/tdvf.c
 create mode 100644 include/sysemu/tdvf.h

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index d14f932eea..ee2f49b47a 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -34,6 +34,7 @@
 #include "hw/core/cpu.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
+#include "sysemu/tdvf.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
@@ -147,6 +148,10 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
                                       as);
             }
 
+            if (size < 0) {
+                size = load_tdvf(s->file);
+            }
+
             if (size < 0) {
                 size = load_targphys_hex_as(s->file, &entry, as);
             }
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 18f44fb7c2..ec943debf1 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -24,6 +24,9 @@ common_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
 common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 
+common_ss.add(when: 'CONFIG_TDX', if_false: files('tdvf-stub.c'))
+common_ss.add(when: 'CONFIG_ALL', if_true: files('tdvf-stub.c'))
+
 softmmu_ss.add(files(
   'cpu-sysemu.c',
   'fw-path-provider.c',
diff --git a/hw/core/tdvf-stub.c b/hw/core/tdvf-stub.c
new file mode 100644
index 0000000000..5f2586dd70
--- /dev/null
+++ b/hw/core/tdvf-stub.c
@@ -0,0 +1,6 @@
+#include "sysemu/tdvf.h"
+
+int load_tdvf(const char *filename)
+{
+    return -1;
+}
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index e5d109f5c6..945e805525 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -24,6 +24,7 @@ i386_ss.add(when: 'CONFIG_PC', if_true: files(
   'pc_sysfw.c',
   'acpi-build.c',
   'port92.c'))
+i386_ss.add(when: 'CONFIG_TDX', if_true: files('tdvf.c'))
 
 subdir('kvm')
 subdir('xen')
diff --git a/hw/i386/tdvf.c b/hw/i386/tdvf.c
new file mode 100644
index 0000000000..9b0065d656
--- /dev/null
+++ b/hw/i386/tdvf.c
@@ -0,0 +1,312 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+
+ * Copyright (c) 2020 Intel Corporation
+ * Author: Isaku Yamahata <isaku.yamahata at gmail.com>
+ *                        <isaku.yamahata at intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/units.h"
+#include "cpu.h"
+#include "exec/hwaddr.h"
+#include "hw/boards.h"
+#include "hw/i386/e820_memory_layout.h"
+#include "hw/i386/tdvf.h"
+#include "hw/i386/x86.h"
+#include "hw/loader.h"
+#include "sysemu/tdx.h"
+#include "sysemu/tdvf.h"
+#include "target/i386/kvm/tdx.h"
+
+static void tdvf_init_ram_memory(MachineState *ms, TdxFirmwareEntry *entry)
+{
+    void *ram_ptr = memory_region_get_ram_ptr(ms->ram);
+    X86MachineState *x86ms = X86_MACHINE(ms);
+
+    if (entry->type == TDVF_SECTION_TYPE_BFV ||
+        entry->type == TDVF_SECTION_TYPE_CFV) {
+            error_report("TDVF type %u addr 0x%" PRIx64 " in RAM (disallowed)",
+                         entry->type, entry->address);
+            exit(1);
+    }
+
+    if (entry->address < 4 * GiB) {
+        entry->mem_ptr = ram_ptr + entry->address;
+    } else {
+        /*
+         * If TDVF temp memory describe in TDVF metadata lays in RAM, reserve
+         * the region property.
+         */
+        if (entry->address >= 4 * GiB + x86ms->above_4g_mem_size ||
+            entry->address + entry->size >= 4 * GiB + x86ms->above_4g_mem_size) {
+            error_report("TDVF type %u address 0x%" PRIx64 " size 0x%" PRIx64
+                         " above high memory",
+                         entry->type, entry->address, entry->size);
+            exit(1);
+        }
+        entry->mem_ptr = ram_ptr + x86ms->below_4g_mem_size +
+                         entry->address - 4 * GiB;
+    }
+    e820_change_type(entry->address, entry->size, E820_RESERVED);
+}
+
+static void tdvf_init_bios_memory(int fd, const char *filename,
+                                  TdxFirmwareEntry *entry)
+{
+    static unsigned int nr_cfv;
+    static unsigned int nr_tmp;
+
+    MemoryRegion *system_memory = get_system_memory();
+    Error *err = NULL;
+    const char *name;
+
+    /* Error out if the section might overlap other structures. */
+    if (entry->address < 4 * GiB - 16 * MiB) {
+        error_report("TDVF type %u address 0x%" PRIx64 " in PCI hole",
+                        entry->type, entry->address);
+        exit(1);
+    }
+
+    if (entry->type == TDVF_SECTION_TYPE_BFV) {
+        name = g_strdup("tdvf.bfv");
+    } else if (entry->type == TDVF_SECTION_TYPE_CFV) {
+        name = g_strdup_printf("tdvf.cfv%u", nr_cfv++);
+    } else if (entry->type == TDVF_SECTION_TYPE_TD_HOB) {
+        name = g_strdup("tdvf.hob");
+    } else if (entry->type == TDVF_SECTION_TYPE_TEMP_MEM) {
+        name = g_strdup_printf("tdvf.tmp%u", nr_tmp++);
+    } else {
+        error_report("TDVF type %u unknown/unsupported", entry->type);
+        exit(1);
+    }
+    entry->mr = g_malloc(sizeof(*entry->mr));
+
+    memory_region_init_ram(entry->mr, NULL, name, entry->size, &err);
+    if (err) {
+        error_report_err(err);
+        exit(1);
+    }
+
+    entry->mem_ptr = memory_region_get_ram_ptr(entry->mr);
+    if (entry->data_len) {
+        /*
+         * The memory_region api doesn't allow partial file mapping, create
+         * ram and copy the contents
+         */
+        if (lseek(fd, entry->data_offset, SEEK_SET) != entry->data_offset) {
+            error_report("can't seek to 0x%x %s", entry->data_offset, filename);
+            exit(1);
+        }
+        if (read(fd, entry->mem_ptr, entry->data_len) != entry->data_len) {
+            error_report("can't read 0x%x %s", entry->data_len, filename);
+            exit(1);
+        }
+    }
+
+    memory_region_add_subregion(system_memory, entry->address, entry->mr);
+
+    if (entry->type == TDVF_SECTION_TYPE_TEMP_MEM) {
+        e820_add_entry(entry->address, entry->size, E820_RESERVED);
+    }
+}
+
+static void tdvf_parse_section_entry(TdxFirmwareEntry *entry,
+                                     const TdvfSectionEntry *src,
+                                     uint64_t file_size)
+{
+    entry->data_offset = le32_to_cpu(src->DataOffset);
+    entry->data_len = le32_to_cpu(src->RawDataSize);
+    entry->address = le64_to_cpu(src->MemoryAddress);
+    entry->size = le64_to_cpu(src->MemoryDataSize);
+    entry->type = le32_to_cpu(src->Type);
+    entry->attributes = le32_to_cpu(src->Attributes);
+
+    /* sanity check */
+    if (entry->data_offset + entry->data_len > file_size) {
+        error_report("too large section: DataOffset 0x%x RawDataSize 0x%x",
+                     entry->data_offset, entry->data_len);
+        exit(1);
+    }
+    if (entry->size < entry->data_len) {
+        error_report("broken metadata RawDataSize 0x%x MemoryDataSize 0x%lx",
+                     entry->data_len, entry->size);
+        exit(1);
+    }
+    if (!QEMU_IS_ALIGNED(entry->address, TARGET_PAGE_SIZE)) {
+        error_report("MemoryAddress 0x%lx not page aligned", entry->address);
+        exit(1);
+    }
+    if (!QEMU_IS_ALIGNED(entry->size, TARGET_PAGE_SIZE)) {
+        error_report("MemoryDataSize 0x%lx not page aligned", entry->size);
+        exit(1);
+    }
+    if (entry->type == TDVF_SECTION_TYPE_TD_HOB ||
+        entry->type == TDVF_SECTION_TYPE_TEMP_MEM) {
+        if (entry->data_len > 0) {
+            error_report("%d section with RawDataSize 0x%x > 0",
+                         entry->type, entry->data_len);
+            exit(1);
+        }
+    }
+}
+
+static void tdvf_parse_metadata_entries(int fd, TdxFirmware *fw,
+                                        TdvfMetadata *metadata)
+{
+
+    TdvfSectionEntry *sections;
+    ssize_t entries_size;
+    uint32_t len, i;
+
+    fw->nr_entries = le32_to_cpu(metadata->NumberOfSectionEntries);
+    if (fw->nr_entries < 2) {
+        error_report("Invalid number of entries (%u) in TDVF", fw->nr_entries);
+        exit(1);
+    }
+
+    len = le32_to_cpu(metadata->Length);
+    entries_size = fw->nr_entries * sizeof(TdvfSectionEntry);
+    if (len != sizeof(*metadata) + entries_size) {
+        error_report("TDVF metadata len (0x%x) mismatch, expected (0x%x)",
+                     len, (uint32_t)(sizeof(*metadata) + entries_size));
+        exit(1);
+    }
+
+    fw->entries = g_new(TdxFirmwareEntry, fw->nr_entries);
+    sections = g_new(TdvfSectionEntry, fw->nr_entries);
+
+    if (read(fd, sections, entries_size) != entries_size)  {
+        error_report("Failed to read TDVF section entries");
+        exit(1);
+    }
+
+    for (i = 0; i < fw->nr_entries; i++) {
+        tdvf_parse_section_entry(&fw->entries[i], &sections[i], fw->file_size);
+    }
+    g_free(sections);
+}
+
+static int tdvf_parse_metadata_header(int fd, TdvfMetadata *metadata)
+{
+    uint32_t offset;
+    int64_t size;
+
+    size = lseek(fd, 0, SEEK_END);
+    if (size < TDVF_METDATA_OFFSET_FROM_END || (uint32_t)size != size) {
+        return -1;
+    }
+
+    /* Chase the metadata pointer to get to the actual metadata. */
+    offset = size - TDVF_METDATA_OFFSET_FROM_END;
+    if (lseek(fd, offset, SEEK_SET) != offset) {
+        return -1;
+    }
+    if (read(fd, &offset, sizeof(offset)) != sizeof(offset)) {
+        return -1;
+    }
+
+    offset = le32_to_cpu(offset);
+    if (offset > size - sizeof(*metadata)) {
+        return -1;
+    }
+
+    /* Pointer to the metadata has been resolved, read the actual metadata. */
+    if (lseek(fd, offset, SEEK_SET) != offset) {
+        return -1;
+    }
+    if (read(fd, metadata, sizeof(*metadata)) != sizeof(*metadata)) {
+        return -1;
+    }
+
+    /* Finally, verify the signature to determine if this is a TDVF image. */
+    if (metadata->Signature[0] != 'T' || metadata->Signature[1] != 'D' ||
+        metadata->Signature[2] != 'V' || metadata->Signature[3] != 'F') {
+        return -1;
+    }
+
+    /* Sanity check that the TDVF doesn't overlap its own metadata. */
+    metadata->Length = le32_to_cpu(metadata->Length);
+    if (metadata->Length > size - offset) {
+        return -1;
+    }
+
+    /* Only version 1 is supported/defined. */
+    metadata->Version = le32_to_cpu(metadata->Version);
+    if (metadata->Version != 1) {
+        return -1;
+    }
+
+    return size;
+}
+
+int load_tdvf(const char *filename)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    X86MachineState *x86ms = X86_MACHINE(ms);
+    TdxFirmwareEntry *entry;
+    TdvfMetadata metadata;
+    TdxGuest *tdx;
+    TdxFirmware *fw;
+    int64_t size;
+    int fd;
+
+    if (!kvm_enabled()) {
+        return -1;
+    }
+
+    tdx = (void *)object_dynamic_cast(OBJECT(ms->cgs), TYPE_TDX_GUEST);
+    if (!tdx) {
+        return -1;
+    }
+
+    fd = open(filename, O_RDONLY | O_BINARY);
+    if (fd < 0) {
+        return -1;
+    }
+
+    size = tdvf_parse_metadata_header(fd, &metadata);
+    if (size < 0) {
+        close(fd);
+        return -1;
+    }
+
+    /* Error out if the user is attempting to load multiple TDVFs. */
+    fw = &tdx->fw;
+    if (fw->file_name) {
+        error_report("tdvf can only be specified once.");
+        exit(1);
+    }
+
+    fw->file_size = size;
+    fw->file_name = g_strdup(filename);
+
+    tdvf_parse_metadata_entries(fd, fw, &metadata);
+
+    for_each_fw_entry(fw, entry) {
+        if (entry->address < x86ms->below_4g_mem_size ||
+            entry->address > 4 * GiB) {
+            tdvf_init_ram_memory(ms, entry);
+        } else {
+            tdvf_init_bios_memory(fd, filename, entry);
+        }
+    }
+
+    close(fd);
+    return 0;
+}
diff --git a/include/sysemu/tdvf.h b/include/sysemu/tdvf.h
new file mode 100644
index 0000000000..0cf085e3ae
--- /dev/null
+++ b/include/sysemu/tdvf.h
@@ -0,0 +1,6 @@
+#ifndef QEMU_TDVF_H
+#define QEMU_TDVF_H
+
+int load_tdvf(const char *filename);
+
+#endif
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 844d24aade..2fed27b3fb 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -5,6 +5,30 @@
 #include "qapi/error.h"
 #include "exec/confidential-guest-support.h"
 
+typedef struct TdxFirmwareEntry {
+    uint32_t data_offset;
+    uint32_t data_len;
+    uint64_t address;
+    uint64_t size;
+    uint32_t type;
+    uint32_t attributes;
+
+    MemoryRegion *mr;
+    void *mem_ptr;
+} TdxFirmwareEntry;
+
+typedef struct TdxFirmware {
+    const char *file_name;
+    uint64_t file_size;
+
+    /* metadata */
+    uint32_t nr_entries;
+    TdxFirmwareEntry *entries;
+} TdxFirmware;
+
+#define for_each_fw_entry(fw, e)                                        \
+    for (e = (fw)->entries; e != (fw)->entries + (fw)->nr_entries; e++)
+
 #define TYPE_TDX_GUEST "tdx-guest"
 #define TDX_GUEST(obj)     \
     OBJECT_CHECK(TdxGuest, (obj), TYPE_TDX_GUEST)
@@ -20,6 +44,8 @@ typedef struct TdxGuest {
 
     bool initialized;
     bool debug;
+
+    TdxFirmware fw;
 } TdxGuest;
 
 int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-- 
2.25.1


