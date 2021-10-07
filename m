Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB104424E23
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:34:30 +0200 (CEST)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNvB-0005Fn-Qa
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYNqe-0007EZ-3O
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:29:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYNqb-00022l-H3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633591784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtsQrBTSZxnze/3PFKDuMZdI/yapTOY94mDoz2wrV3U=;
 b=G0wli1iSE9w13mbe2YYllmYkzGkSgIAHtSwL4ehLBpodd4g9SoFzJKf4f0WqA3BSbtlfI9
 9bHjqszOjNnrkvRmCnLIFW0ag/VYUZ3i9JbnFvmW4xAbXTjMWsSAR6Rmo55h8qRN33uSfh
 QgOyDkFWH6ybB/RKgk5yz5zotE9UQxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-fQuwCeVQOaejh9FDPgKk0w-1; Thu, 07 Oct 2021 03:29:43 -0400
X-MC-Unique: fQuwCeVQOaejh9FDPgKk0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350875074B;
 Thu,  7 Oct 2021 07:29:42 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E2D410013C1;
 Thu,  7 Oct 2021 07:29:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v4 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Thu,  7 Oct 2021 09:29:21 +0200
Message-Id: <20211007072922.655330-3-eric.auger@redhat.com>
In-Reply-To: <20211007072922.655330-1-eric.auger@redhat.com>
References: <20211007072922.655330-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).

The DBG2 table allows to describe one or more debug ports.

Generate an DBG2 table featuring a single debug port, the PL011.

The DBG2 specification can be found at
"Microsoft Debug Port Table 2 (DBG2)"
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>

---

v3 -> v4:
- Change the revision in the header (0), + vs comments,
  s/0x1000/vms->memmap[VIRT_UART].size
- Added Michael's A-b

v2 -> v3:
Took into account all comments from Igor on v2:
mostly style adjustment, revision references

v1 -> v2:
- rebased on Igor's refactoring
---
 hw/arm/virt-acpi-build.c | 63 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cec97352b..dd17a48c00 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -616,6 +616,64 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_end(linker, &table);
 }
 
+/* Debug Port Table 2 (DBG2) */
+static void
+build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+{
+    AcpiTable table = { .sig = "DBG2", .rev = 0, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
+    int dbg2devicelength;
+    const char name[] = "COM0";
+    const int namespace_length = sizeof(name);
+
+    acpi_table_begin(&table, table_data);
+
+    dbg2devicelength = 22 + /* BaseAddressRegister[] offset */
+                       12 + /* BaseAddressRegister[] */
+                       4 + /* AddressSize[] */
+                       namespace_length /* NamespaceString[] */;
+
+    /* OffsetDbgDeviceInfo */
+    build_append_int_noprefix(table_data, 44, 4);
+    /* NumberDbgDeviceInfo */
+    build_append_int_noprefix(table_data, 1, 4);
+
+    /* Table 2. Debug Device Information structure format */
+    build_append_int_noprefix(table_data, 0, 1); /* Revision */
+    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
+    /* NumberofGenericAddressRegisters */
+    build_append_int_noprefix(table_data, 1, 1);
+    /* NameSpaceStringLength */
+    build_append_int_noprefix(table_data, namespace_length, 2);
+    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
+    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
+    /* OemDataOffset (0 means no OEM data) */
+    build_append_int_noprefix(table_data, 0, 2);
+
+    /* Port Type */
+    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
+    /* Port Subtype */
+    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
+    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
+    /* BaseAddressRegisterOffset */
+    build_append_int_noprefix(table_data, 22, 2);
+    /* AddressSizeOffset */
+    build_append_int_noprefix(table_data, 34, 2);
+
+    /* BaseAddressRegister[] */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
+                     vms->memmap[VIRT_UART].base);
+
+    /* AddressSize[] */
+    build_append_int_noprefix(table_data,
+                              vms->memmap[VIRT_UART].size, 4);
+
+    /* NamespaceString[] */
+    g_array_append_vals(table_data, name, namespace_length);
+
+    acpi_table_end(linker, &table);
+};
+
 /*
  * ACPI spec, Revision 5.1 Errata A
  * 5.2.12 Multiple APIC Description Table (MADT)
@@ -875,7 +933,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
+    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
@@ -898,6 +956,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_dbg2(tables_blob, tables->linker, vms);
+
     if (vms->ras) {
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_add_table(table_offsets, tables_blob);
-- 
2.26.3


