Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA854171FE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:38:19 +0200 (CEST)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkT4-0005Oi-EA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJX-0004XB-Tv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJV-00018c-3c
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hU3iuovAYr+KigCVxKgKDuJjoqCygI1O9BwQijBNNQk=;
 b=iUB/ZbE2r7PU7TlcuZbuZx9hHVkHLQ+hkeRBIfv+ScXFFNGNP79ZZBkmyAsulmxDmnl/rh
 iNMHgfs6sKauz+AH3bmCfrH4DabzS7SDwDhgJc+GFXnmwTIThSDivdTZc1Vc9wfXpxADic
 +pGpkDUqvyh5iUs4hNQp2Nh38vuey6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-nudjnDpQNym9IctTsXV6dQ-1; Fri, 24 Sep 2021 08:28:22 -0400
X-MC-Unique: nudjnDpQNym9IctTsXV6dQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2273802936;
 Fri, 24 Sep 2021 12:28:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05D6662465;
 Fri, 24 Sep 2021 12:28:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/35] acpi: build_xsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:30 -0400
Message-Id: <20210924122802.1455362-4-imammedo@redhat.com>
In-Reply-To: <20210924122802.1455362-1-imammedo@redhat.com>
References: <20210924122802.1455362-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: ani@anisinha.ca, Eric Auger <eric.auger@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
entries to other tables (which also removes some manual offset
calculations).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v4:
  * add expected doc comment above build_xsdt()
    (Eric Auger <eric.auger@redhat.com>)
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
---
 include/hw/acpi/acpi-defs.h | 10 ----------
 hw/acpi/aml-build.c         | 31 +++++++++++++++----------------
 2 files changed, 15 insertions(+), 26 deletions(-)

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
index 616a292229..86b8322ee1 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1912,33 +1912,32 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     acpi_table_end(linker, &table);
 }
 
-/* Build xsdt table */
+/*
+ * ACPI 2.0 eXtended System Description Table (XSDT)
+ */
 void
 build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
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
+    acpi_table_begin(&table, table_data);
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
+    acpi_table_end(linker, &table);
 }
 
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
-- 
2.27.0


