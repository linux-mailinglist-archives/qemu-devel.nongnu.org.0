Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A953379B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 20:14:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXrTP-0005Xc-54
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 14:14:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hXrNk-0001gD-U7
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:08:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hXrNj-0007bw-Qh
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:08:28 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hXrNj-0007aG-LO
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:08:27 -0400
Received: by mail-qk1-f194.google.com with SMTP id i125so1036376qkd.6
	for <qemu-devel@nongnu.org>; Mon, 03 Jun 2019 11:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=BMjQYyCdvFzPEzLYug8aCJTeB4WwbCrsrkhqi7chWAs=;
	b=ivAkR6eykUOeIY4CQxkvuZ5Z5paeVAgqeMFFIvVGL5SS/LJikVvdX+fMFj6N98+qN5
	M93vGUGwaFCfrG9hLKImPPcBcE2NXtnZd1btYeurexzGQUAf+ge65nWfQ/BbknsiN8xp
	dNyCdWhixFRBjVS3dB5mBScuvwzuOOnt3QHCjg1+dbz5sjtRfikTv1HP2DucuqRR8ncY
	sIxRi5vPVWpFJ2fUvQDpoZ5NlQPUMGNaCjC8yi/RJI+ZE02lFNs3RAOe2Kh+JJ5ERF++
	BybXgsVW/cPTfvVHEFHJEbmpEBrG601MO0quCnSsHXc8D4Uq0BeTfY14czBJn43lAPOz
	345g==
X-Gm-Message-State: APjAAAXV9GZkYqEjI3dYjDvSCLCFaxR0jAqkrNpB01XL+djWD+iF+wki
	0gP1qf/l1rnFajmkGcdzxQgYMcgTz70=
X-Google-Smtp-Source: APXvYqzQ+XHqmsjn3TzupPViJVKziY0oQ2xWhuugGWqqh6ugNPrqqFZvNNj85iytMydaOvr3KK2V4w==
X-Received: by 2002:a37:2f87:: with SMTP id v129mr4324610qkh.151.1559585306647;
	Mon, 03 Jun 2019 11:08:26 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id 9sm9016186qtv.69.2019.06.03.11.08.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 11:08:25 -0700 (PDT)
Date: Mon, 3 Jun 2019 14:08:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190521062836.6541-3-richardw.yang@linux.intel.com>
References: <20190603180807.16140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603180807.16140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.194
Subject: [Qemu-devel] [PULL v2 02/14] acpi: pci: use build_append_foo() API
 to construct MCFG
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

build_append_foo() API doesn't need explicit endianness conversions
which eliminates a source of errors and it makes build_mcfg() look like
declarative definition of MCFG table in ACPI spec, which makes it easy
to review.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

v3:
   * add some comment on the Configuration Space base address allocation
     structure
v2:
   * miss the reserved[8] of MCFG in last version, add it back
   * drop SOBs and make sure bios-tables-test all OK
Message-Id: <20190521062836.6541-3-richardw.yang@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 18 ------------------
 hw/acpi/pci.c               | 33 ++++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index f9aa4bd398..57a3f58b0c 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
 
 typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
 
-/* PCI fw r3.0 MCFG table. */
-/* Subtable */
-struct AcpiMcfgAllocation {
-    uint64_t address;                /* Base address, processor-relative */
-    uint16_t pci_segment;            /* PCI segment group number */
-    uint8_t start_bus_number;       /* Starting PCI Bus number */
-    uint8_t end_bus_number;         /* Final PCI Bus number */
-    uint32_t reserved;
-} QEMU_PACKED;
-typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
-
-struct AcpiTableMcfg {
-    ACPI_TABLE_HEADER_DEF;
-    uint8_t reserved[8];
-    AcpiMcfgAllocation allocation[0];
-} QEMU_PACKED;
-typedef struct AcpiTableMcfg AcpiTableMcfg;
-
 /*
  * TCPA Description Table
  *
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index fa0fa30bb9..9510597a19 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -30,17 +30,32 @@
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
-    AcpiTableMcfg *mcfg;
-    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
+    int mcfg_start = table_data->len;
 
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->base);
+    /*
+     * PCI Firmware Specification, Revision 3.0
+     * 4.1.2 MCFG Table Description.
+     */
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8);
 
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
+    /*
+     * Memory Mapped Enhanced Configuration Space Base Address Allocation
+     * Structure
+     */
+    /* Base address, processor-relative */
+    build_append_int_noprefix(table_data, info->base, 8);
+    /* PCI segment group number */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Starting PCI Bus number */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Final PCI Bus number */
+    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
 
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
+    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
+                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
 }
 
-- 
MST


