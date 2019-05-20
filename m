Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B1229A4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 03:03:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSWiG-0002JX-Si
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 21:03:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfd-0000fh-W8
	for qemu-devel@nongnu.org; Sun, 19 May 2019 21:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfd-0006cQ-0c
	for qemu-devel@nongnu.org; Sun, 19 May 2019 21:00:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:13790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSWfa-0006aZ-Kk; Sun, 19 May 2019 21:00:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 18:00:48 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga008.jf.intel.com with ESMTP; 19 May 2019 18:00:46 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 20 May 2019 08:59:52 +0800
Message-Id: <20190520005957.6953-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520005957.6953-1-richardw.yang@linux.intel.com>
References: <20190520005957.6953-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v5 1/6] q35: acpi: do not create dummy MCFG
 table
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

From: Igor Mammedov <imammedo@redhat.com>

Dummy table (with signature "QEMU") creation came from original SeaBIOS
codebase. And QEMU would have to keep it around if there were Q35 machine
that depended on keeping ACPI tables blob constant size. Luckily there
were no versioned Q35 machine types before commit:
  (since 2.3) a1666142db acpi-build: make ROMs RAM blocks resizeable
which obsoleted need to keep ACPI tables blob the same size on source/destination.

Considering the 1st versioned machine is pc-q35-2.4, the dummy table
is not really necessary and it's safe to drop it without breaking
cross version migration in both directions unconditionally.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b4ec14e349..4fb6184cbc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2413,7 +2413,6 @@ static void
 build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
-    const char *sig;
     int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
@@ -2423,19 +2422,7 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
     mcfg->allocation[0].start_bus_number = 0;
     mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
 
-    /* MCFG is used for ECAM which can be enabled or disabled by guest.
-     * To avoid table size changes (which create migration issues),
-     * always create the table even if there are no allocations,
-     * but set the signature to a reserved value in this case.
-     * ACPI spec requires OSPMs to ignore such tables.
-     */
-    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
-        /* Reserved signature: ignored by OSPM */
-        sig = "QEMU";
-    } else {
-        sig = "MCFG";
-    }
-    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
 
 /*
@@ -2604,6 +2591,9 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     }
     mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
+    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
+        return false;
+    }
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
     assert(o);
-- 
2.19.1


