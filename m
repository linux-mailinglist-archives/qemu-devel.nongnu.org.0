Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B43229A8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 03:06:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSWl1-0004du-GC
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 21:06:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfh-0000tx-PL
	for qemu-devel@nongnu.org; Sun, 19 May 2019 21:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfg-0006eB-Rc
	for qemu-devel@nongnu.org; Sun, 19 May 2019 21:00:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:13790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSWfe-0006aZ-IU; Sun, 19 May 2019 21:00:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 18:00:54 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga008.jf.intel.com with ESMTP; 19 May 2019 18:00:51 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 20 May 2019 08:59:54 +0800
Message-Id: <20190520005957.6953-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520005957.6953-1-richardw.yang@linux.intel.com>
References: <20190520005957.6953-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v5 3/6] i386,
 acpi: remove mcfg_ prefix in AcpiMcfgInfo members
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is obvious the member in AcpiMcfgInfo describe MCFG's property.

Remove the mcfg_ prefix.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4fb6184cbc..9c1152c819 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -88,8 +88,8 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 typedef struct AcpiMcfgInfo {
-    uint64_t mcfg_base;
-    uint32_t mcfg_size;
+    uint64_t base;
+    uint32_t size;
 } AcpiMcfgInfo;
 
 typedef struct AcpiPmInfo {
@@ -2416,11 +2416,11 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
     int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
 
     build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
@@ -2589,15 +2589,15 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     if (!o) {
         return false;
     }
-    mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
+    mcfg->base = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
-    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
+    if (mcfg->base == PCIE_BASE_ADDR_UNMAPPED) {
         return false;
     }
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
     assert(o);
-    mcfg->mcfg_size = qnum_get_uint(qobject_to(QNum, o));
+    mcfg->size = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
     return true;
 }
-- 
2.19.1


