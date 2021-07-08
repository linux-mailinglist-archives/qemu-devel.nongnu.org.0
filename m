Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88093C16FD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:21:48 +0200 (CEST)
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WmZ-0005I9-Mq
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEW-0001Fp-Uj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEV-0000LU-6B
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GITM+rvZ4ph8OTLf+stP141UviNkvmcuSdVjBrCoHww=;
 b=A1ofczcfLbpRUwFXFYiYPH6Y7xVvYoTDgQs60vyPzf1PXK9wt4/cGeLCm8aHHvs+LV7ryS
 1spbfrD8Cce0NbISuN0ITnJjQWSxWJIv0lYC0EkpfFPHVSYGu07X2YEbM+OWzmj1PDFLrN
 YLuJtlfnI7zsOQBnxncl8vEYF6Z/rfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-K7zZ8esNN5Cao9XFlAlw2Q-1; Thu, 08 Jul 2021 11:46:32 -0400
X-MC-Unique: K7zZ8esNN5Cao9XFlAlw2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A47F802E61
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:46:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DC4E19C66;
 Thu,  8 Jul 2021 15:46:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/35] acpi: build_xsdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:45 -0400
Message-Id: <20210708154617.1538485-4-imammedo@redhat.com>
In-Reply-To: <20210708154617.1538485-1-imammedo@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
entries to other tables (which also removes some manual offset
calculations).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 10 ----------
 hw/acpi/aml-build.c         | 27 ++++++++++++---------------
 2 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index ccfa3382aa..f6d2ca172b 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -149,16 +149,6 @@ struct AcpiSerialPortConsoleRedirection {
 typedef struct AcpiSerialPortConsoleRedirection
                AcpiSerialPortConsoleRedirection;
 
-/*
- * ACPI 2.0 eXtended System Description Table (XSDT)
- */
-struct AcpiXsdtDescriptorRev2 {
-    ACPI_TABLE_HEADER_DEF       /* ACPI common table header */
-    uint64_t table_offset_entry[];  /* Array of pointers to other */
-    /* ACPI tables */
-} QEMU_PACKED;
-typedef struct AcpiXsdtDescriptorRev2 AcpiXsdtDescriptorRev2;
-
 /*
  * ACPI 1.0 Firmware ACPI Control Structure (FACS)
  */
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 705fe350bb..c33fa6c799 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1912,27 +1912,24 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id)
 {
     int i;
-    unsigned xsdt_entries_offset;
-    AcpiXsdtDescriptorRev2 *xsdt;
-    int xsdt_start = table_data->len;
-    const unsigned table_data_len = (sizeof(uint64_t) * table_offsets->len);
-    const unsigned xsdt_entry_size = sizeof(xsdt->table_offset_entry[0]);
-    const size_t xsdt_len = sizeof(*xsdt) + table_data_len;
-
-    xsdt = acpi_data_push(table_data, xsdt_len);
-    xsdt_entries_offset = (char *)xsdt->table_offset_entry - table_data->data;
+    AcpiTable table = { .sig = "XSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+
+    acpi_init_table(&table, table_data);
+
     for (i = 0; i < table_offsets->len; ++i) {
         uint64_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
-        uint64_t xsdt_entry_offset = xsdt_entries_offset + xsdt_entry_size * i;
+        uint64_t xsdt_entry_offset = table.array->len;
 
-        /* xsdt->table_offset_entry to be filled by Guest linker */
+        /* reserve space for entry */
+        build_append_int_noprefix(table.array, 0, 8);
+
+        /* mark position of RSDT entry to be filled by Guest linker */
         bios_linker_loader_add_pointer(linker,
-            ACPI_BUILD_TABLE_FILE, xsdt_entry_offset, xsdt_entry_size,
+            ACPI_BUILD_TABLE_FILE, xsdt_entry_offset, 8,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
-    build_header(linker, table_data,
-                 (void *)(table_data->data + xsdt_start),
-                 "XSDT", xsdt_len, 1, oem_id, oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
-- 
2.27.0


