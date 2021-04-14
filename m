Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81E35EF93
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:46:05 +0200 (CEST)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWb9v-0001pu-4H
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWb88-0001JJ-7K
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWb84-0002w6-Q1
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618389847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cRv21Oui1X8ghQuE5l8LixMzgmmVoQCyWUkNUeV54Zw=;
 b=HbcPfU+MXmNokeivvOHJgM2jH8OBnl4NN1yJDBbb8MVQT+KjblBPhyp7W/45StcNtwdee1
 MOect5ZEMfDSL8VZD3TbrzXWT4YymKlpiio7f5lpl8Vj9EWKlWXGk/Hcow5TdkZ4Pj5jNb
 z43YypQ4eJkt5YXB4qAjP81U1rD3WUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-45g17KdtNIKzYJlOKT1qWA-1; Wed, 14 Apr 2021 04:44:03 -0400
X-MC-Unique: 45g17KdtNIKzYJlOKT1qWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 927AF107ACF7;
 Wed, 14 Apr 2021 08:44:02 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA7D60864;
 Wed, 14 Apr 2021 08:43:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2] x86: acpi: use offset instead of pointer when
 using build_header()
Date: Wed, 14 Apr 2021 04:43:56 -0400
Message-Id: <20210414084356.3792113-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, pbonzini@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do the same as in commit
 (4d027afeb3a97 Virt: ACPI: fix qemu assert due to re-assigned table data address)
for remaining tables that happen to use saved at
the beginning pointer to build header to avoid assert
when table_data is relocated due to implicit re-size.

In this case user is trying to start Windows 10 and getting assert at
 hw/acpi/bios-linker-loader.c:239:
  bios_linker_loader_add_checksum: Assertion `start_offset < file->blob->len' failed.

Fixes: https://bugs.launchpad.net/bugs/1923497
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - amend commit message (Michael)
PS:
 I have build_header() refactoring patch that requires offset
 instead of pointer, to make it harder to misuse but it's
 a bit intrusive for last minute fixes. So here goes simplified
 variant, and I'll post refactoring patch for 6.1. later.

 hw/acpi/aml-build.c  | 15 +++++++++------
 hw/i386/acpi-build.c |  8 ++++++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d33ce8954a..f0035d2b4a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1830,6 +1830,7 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     int i;
     unsigned rsdt_entries_offset;
     AcpiRsdtDescriptorRev1 *rsdt;
+    int rsdt_start = table_data->len;
     const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
     const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
     const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
@@ -1846,7 +1847,8 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
     build_header(linker, table_data,
-                 (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
+                 (void *)(table_data->data + rsdt_start),
+                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
 }
 
 /* Build xsdt table */
@@ -1857,6 +1859,7 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     int i;
     unsigned xsdt_entries_offset;
     AcpiXsdtDescriptorRev2 *xsdt;
+    int xsdt_start = table_data->len;
     const unsigned table_data_len = (sizeof(uint64_t) * table_offsets->len);
     const unsigned xsdt_entry_size = sizeof(xsdt->table_offset_entry[0]);
     const size_t xsdt_len = sizeof(*xsdt) + table_data_len;
@@ -1873,7 +1876,8 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
     build_header(linker, table_data,
-                 (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
+                 (void *)(table_data->data + xsdt_start),
+                 "XSDT", xsdt_len, 1, oem_id, oem_table_id);
 }
 
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
@@ -2053,10 +2057,9 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
     uint64_t control_area_start_address;
     TPMIf *tpmif = tpm_find();
     uint32_t start_method;
-    void *tpm2_ptr;
 
     tpm2_start = table_data->len;
-    tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
 
     /* Platform Class */
     build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
@@ -2095,8 +2098,8 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                                    log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
     build_header(linker, table_data,
-                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, oem_id,
-                 oem_table_id);
+                 (void *)(table_data->data + tpm2_start),
+                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
 }
 
 Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750aef..daaf8f473e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1816,6 +1816,7 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
            const char *oem_table_id)
 {
     Acpi20Hpet *hpet;
+    int hpet_start = table_data->len;
 
     hpet = acpi_data_push(table_data, sizeof(*hpet));
     /* Note timer_block_id value must be kept in sync with value advertised by
@@ -1824,13 +1825,15 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     hpet->timer_block_id = cpu_to_le32(0x8086a201);
     hpet->addr.address = cpu_to_le64(HPET_BASE);
     build_header(linker, table_data,
-                 (void *)hpet, "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
+                 (void *)(table_data->data + hpet_start),
+                 "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
 }
 
 static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                const char *oem_id, const char *oem_table_id)
 {
+    int tcpa_start = table_data->len;
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
     unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
     unsigned log_addr_offset =
@@ -1849,7 +1852,8 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
         ACPI_BUILD_TPMLOG_FILE, 0);
 
     build_header(linker, table_data,
-                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
+                 (void *)(table_data->data + tcpa_start),
+                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
 }
 
 #define HOLE_640K_START  (640 * KiB)
-- 
2.27.0


