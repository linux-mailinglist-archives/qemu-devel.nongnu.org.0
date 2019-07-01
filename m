Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D892ACF9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 04:36:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hV5Ud-0005ic-0h
	for lists+qemu-devel@lfdr.de; Sun, 26 May 2019 22:36:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hV5TZ-0005HD-Q2
	for qemu-devel@nongnu.org; Sun, 26 May 2019 22:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hV5TY-0002WU-AK
	for qemu-devel@nongnu.org; Sun, 26 May 2019 22:35:01 -0400
Received: from mga12.intel.com ([192.55.52.136]:23758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hV5TU-0002O7-Mj; Sun, 26 May 2019 22:34:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2019 19:34:55 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga004.jf.intel.com with ESMTP; 26 May 2019 19:34:53 -0700
Date: Mon, 27 May 2019 10:34:23 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190527023423.GA9136@richard>
References: <20190326024320.27895-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190326024320.27895-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-devel] [PATCH v6] hw/acpi: extract acpi_add_rom_blob()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 26, 2019 at 10:43:20AM +0800, Wei Yang wrote:
>arm and i386 has almost the same function acpi_add_rom_blob(), except
>giving different FWCfgCallback function.
>
>This patch moves acpi_add_rom_blob() to utils.c by passing
>FWCfgCallback to it.
>
>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>

Hello~ would this one be picked up?

>---
>v6:
>  * change author from Igor to Michael
>v5:
>  * remove unnecessary header glib/gprintf.h
>  * rearrange include header to make it more suitable
>v4:
>  * extract -> moves
>  * adjust comment in source to make checkpatch happy
>v3:
>  * put acpi_add_rom_blob() to hw/acpi/utils.c
>v2:
>  * remove unused header in original source file
>
>author
>---
> hw/acpi/Makefile.objs    |  2 +-
> hw/acpi/utils.c          | 36 ++++++++++++++++++++++++++++++++++++
> hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
> hw/i386/acpi-build.c     | 26 ++++++++++----------------
> include/hw/acpi/utils.h  |  9 +++++++++
> 5 files changed, 66 insertions(+), 33 deletions(-)
> create mode 100644 hw/acpi/utils.c
> create mode 100644 include/hw/acpi/utils.h
>
>diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
>index 2d46e3789a..ba93c5b64a 100644
>--- a/hw/acpi/Makefile.objs
>+++ b/hw/acpi/Makefile.objs
>@@ -10,7 +10,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
> 
> common-obj-y += acpi_interface.o
> common-obj-y += bios-linker-loader.o
>-common-obj-y += aml-build.o
>+common-obj-y += aml-build.o utils.o
> common-obj-$(CONFIG_TPM) += tpm.o
> 
> common-obj-$(CONFIG_IPMI) += ipmi.o
>diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
>new file mode 100644
>index 0000000000..77b9e8148f
>--- /dev/null
>+++ b/hw/acpi/utils.c
>@@ -0,0 +1,36 @@
>+/*
>+ * Utilities for generating ACPI tables and passing them to Guests
>+ *
>+ * Copyright (C) 2019 Intel Corporation
>+ * Copyright (C) 2019 Red Hat Inc
>+ *
>+ * Author: Wei Yang <richardw.yang@linux.intel.com>
>+ * Author: Michael S. Tsirkin <mst@redhat.com>
>+ *
>+ * This program is free software; you can redistribute it and/or modify
>+ * it under the terms of the GNU General Public License as published by
>+ * the Free Software Foundation; either version 2 of the License, or
>+ * (at your option) any later version.
>+
>+ * This program is distributed in the hope that it will be useful,
>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>+ * GNU General Public License for more details.
>+
>+ * You should have received a copy of the GNU General Public License along
>+ * with this program; if not, see <http://www.gnu.org/licenses/>.
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "hw/acpi/aml-build.h"
>+#include "hw/acpi/utils.h"
>+#include "hw/loader.h"
>+
>+MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>+                                GArray *blob, const char *name,
>+                                uint64_t max_size)
>+{
>+    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>+                        name, update, opaque, NULL, true);
>+}
>+
>diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>index 57679a89bf..a846f74a14 100644
>--- a/hw/arm/virt-acpi-build.c
>+++ b/hw/arm/virt-acpi-build.c
>@@ -37,9 +37,9 @@
> #include "hw/acpi/acpi.h"
> #include "hw/nvram/fw_cfg.h"
> #include "hw/acpi/bios-linker-loader.h"
>-#include "hw/loader.h"
> #include "hw/hw.h"
> #include "hw/acpi/aml-build.h"
>+#include "hw/acpi/utils.h"
> #include "hw/pci/pcie_host.h"
> #include "hw/pci/pci.h"
> #include "hw/arm/virt.h"
>@@ -881,14 +881,6 @@ static void virt_acpi_build_reset(void *build_opaque)
>     build_state->patched = false;
> }
> 
>-static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
>-                                       GArray *blob, const char *name,
>-                                       uint64_t max_size)
>-{
>-    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>-                        name, virt_acpi_build_update, build_state, NULL, true);
>-}
>-
> static const VMStateDescription vmstate_virt_acpi_build = {
>     .name = "virt_acpi_build",
>     .version_id = 1,
>@@ -920,20 +912,22 @@ void virt_acpi_setup(VirtMachineState *vms)
>     virt_acpi_build(vms, &tables);
> 
>     /* Now expose it all to Guest */
>-    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
>-                                               ACPI_BUILD_TABLE_FILE,
>-                                               ACPI_BUILD_TABLE_MAX_SIZE);
>+    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
>+                                              build_state, tables.table_data,
>+                                              ACPI_BUILD_TABLE_FILE,
>+                                              ACPI_BUILD_TABLE_MAX_SIZE);
>     assert(build_state->table_mr != NULL);
> 
>     build_state->linker_mr =
>-        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
>-                          "etc/table-loader", 0);
>+        acpi_add_rom_blob(virt_acpi_build_update, build_state,
>+                          tables.linker->cmd_blob, "etc/table-loader", 0);
> 
>     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                     acpi_data_len(tables.tcpalog));
> 
>-    build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>-                                              ACPI_BUILD_RSDP_FILE, 0);
>+    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
>+                                             build_state, tables.rsdp,
>+                                             ACPI_BUILD_RSDP_FILE, 0);
> 
>     qemu_register_reset(virt_acpi_build_reset, build_state);
>     virt_acpi_build_reset(build_state);
>diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>index 416da318ae..b17d4a711d 100644
>--- a/hw/i386/acpi-build.c
>+++ b/hw/i386/acpi-build.c
>@@ -37,7 +37,6 @@
> #include "hw/acpi/cpu.h"
> #include "hw/nvram/fw_cfg.h"
> #include "hw/acpi/bios-linker-loader.h"
>-#include "hw/loader.h"
> #include "hw/isa/isa.h"
> #include "hw/block/fdc.h"
> #include "hw/acpi/memory_hotplug.h"
>@@ -58,6 +57,7 @@
> #include "hw/i386/x86-iommu.h"
> 
> #include "hw/acpi/aml-build.h"
>+#include "hw/acpi/utils.h"
> 
> #include "qom/qom-qobject.h"
> #include "hw/i386/amd_iommu.h"
>@@ -2842,14 +2842,6 @@ static void acpi_build_reset(void *build_opaque)
>     build_state->patched = 0;
> }
> 
>-static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
>-                                       GArray *blob, const char *name,
>-                                       uint64_t max_size)
>-{
>-    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>-                        name, acpi_build_update, build_state, NULL, true);
>-}
>-
> static const VMStateDescription vmstate_acpi_build = {
>     .name = "acpi_build",
>     .version_id = 1,
>@@ -2891,14 +2883,15 @@ void acpi_setup(void)
>     acpi_build(&tables, MACHINE(pcms));
> 
>     /* Now expose it all to Guest */
>-    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
>-                                               ACPI_BUILD_TABLE_FILE,
>-                                               ACPI_BUILD_TABLE_MAX_SIZE);
>+    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
>+                                              build_state, tables.table_data,
>+                                              ACPI_BUILD_TABLE_FILE,
>+                                              ACPI_BUILD_TABLE_MAX_SIZE);
>     assert(build_state->table_mr != NULL);
> 
>     build_state->linker_mr =
>-        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
>-                          "etc/table-loader", 0);
>+        acpi_add_rom_blob(acpi_build_update, build_state,
>+                          tables.linker->cmd_blob, "etc/table-loader", 0);
> 
>     fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
>@@ -2935,8 +2928,9 @@ void acpi_setup(void)
>         build_state->rsdp_mr = NULL;
>     } else {
>         build_state->rsdp = NULL;
>-        build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>-                                                  ACPI_BUILD_RSDP_FILE, 0);
>+        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
>+                                                 build_state, tables.rsdp,
>+                                                 ACPI_BUILD_RSDP_FILE, 0);
>     }
> 
>     qemu_register_reset(acpi_build_reset, build_state);
>diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
>new file mode 100644
>index 0000000000..140b4de603
>--- /dev/null
>+++ b/include/hw/acpi/utils.h
>@@ -0,0 +1,9 @@
>+#ifndef HW_ACPI_UTILS_H
>+#define HW_ACPI_UTILS_H
>+
>+#include "hw/nvram/fw_cfg.h"
>+
>+MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>+                                GArray *blob, const char *name,
>+                                uint64_t max_size);
>+#endif
>-- 
>2.19.1

-- 
Wei Yang
Help you, Help me

