Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E4A1B071
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 08:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ4dr-0005jN-Io
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 02:40:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4Zv-0002mj-RB
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4KB-0004tv-Ln
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:36 -0400
Received: from mga07.intel.com ([134.134.136.100]:24552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hQ4KB-0004ds-3S
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2019 23:20:34 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 12 May 2019 23:20:32 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 14:19:10 +0800
Message-Id: <20190513061913.9284-7-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190513061913.9284-1-richardw.yang@linux.intel.com>
References: <20190513061913.9284-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: [Qemu-devel] [RFC PATCH 6/9] hw/acpi: implement
 madt_sub[ACPI_APIC_LOCAL_X2APIC_NMI]
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
 hw/i386/acpi-build.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f48cc5b292..bec0bed53e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -371,11 +371,24 @@ static void pc_madt_xrupt_override_entry(GArray *entry, void *opaque)
     }
 }
 
+static void pc_madt_x2apic_nmi_entry(GArray *entry, void *opaque)
+{
+    AcpiMadtLocalX2ApicNmi *local_nmi;
+
+    local_nmi = acpi_data_push(entry, sizeof *local_nmi);
+    local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
+    local_nmi->length = sizeof(*local_nmi);
+    local_nmi->uid    = 0xFFFFFFFF; /* all processors */
+    local_nmi->flags  = cpu_to_le16(0);
+    local_nmi->lint   = 1; /* ACPI_LINT1 */
+}
+
 madt_operations i386_madt_sub = {
     [ACPI_APIC_PROCESSOR] = pc_madt_apic_entry,
     [ACPI_APIC_LOCAL_X2APIC] = pc_madt_x2apic_entry,
     [ACPI_APIC_IO] = pc_madt_io_entry,
     [ACPI_APIC_XRUPT_OVERRIDE] = pc_madt_xrupt_override_entry,
+    [ACPI_APIC_LOCAL_X2APIC_NMI] = pc_madt_x2apic_nmi_entry,
 };
 
 static void
@@ -424,14 +437,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
     }
 
     if (x2apic_mode) {
-        AcpiMadtLocalX2ApicNmi *local_nmi;
-
-        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
-        local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
-        local_nmi->length = sizeof(*local_nmi);
-        local_nmi->uid    = 0xFFFFFFFF; /* all processors */
-        local_nmi->flags  = cpu_to_le16(0);
-        local_nmi->lint   = 1; /* ACPI_LINT1 */
+        adevc->madt_sub[ACPI_APIC_LOCAL_X2APIC_NMI](table_data, NULL);
     } else {
         AcpiMadtLocalNmi *local_nmi;
 
-- 
2.19.1


