Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9471B075
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 08:42:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ4fY-0007H8-Rl
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 02:42:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4Zy-0002mj-6t
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4K5-0004mx-1y
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:30 -0400
Received: from mga07.intel.com ([134.134.136.100]:24552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hQ4K4-0004ds-QY
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2019 23:20:28 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 12 May 2019 23:20:26 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 14:19:08 +0800
Message-Id: <20190513061913.9284-5-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190513061913.9284-1-richardw.yang@linux.intel.com>
References: <20190513061913.9284-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: [Qemu-devel] [RFC PATCH 4/9] hw/acpi: implement
 madt_sub[ACPI_APIC_IO]
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
Cc: yang.zhong@intel.com, ehabkost@redhat.com, mst@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>, pbonzini@redhat.com,
	imammedo@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/i386/acpi-build.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4b480efff9..a661fff51d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -339,9 +339,22 @@ static void pc_madt_x2apic_entry(GArray *entry, void *opaque)
     }
 }
 
+static void pc_madt_io_entry(GArray *entry, void *opaque)
+{
+    AcpiMadtIoApic *io_apic;
+
+    io_apic = acpi_data_push(entry, sizeof *io_apic);
+    io_apic->type = ACPI_APIC_IO;
+    io_apic->length = sizeof(*io_apic);
+    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
+    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
+    io_apic->interrupt = cpu_to_le32(0);
+}
+
 madt_operations i386_madt_sub = {
     [ACPI_APIC_PROCESSOR] = pc_madt_apic_entry,
     [ACPI_APIC_LOCAL_X2APIC] = pc_madt_x2apic_entry,
+    [ACPI_APIC_IO] = pc_madt_io_entry,
 };
 
 static void
@@ -355,7 +368,6 @@ build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
     bool x2apic_mode = false;
 
     AcpiMultipleApicTable *madt;
-    AcpiMadtIoApic *io_apic;
     AcpiMadtIntsrcovr *intsrcovr;
     int i;
 
@@ -376,12 +388,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
         }
     }
 
-    io_apic = acpi_data_push(table_data, sizeof *io_apic);
-    io_apic->type = ACPI_APIC_IO;
-    io_apic->length = sizeof(*io_apic);
-    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
-    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
-    io_apic->interrupt = cpu_to_le32(0);
+    adevc->madt_sub[ACPI_APIC_IO](table_data, NULL);
 
     if (pcms->apic_xrupt_override) {
         intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-- 
2.19.1


