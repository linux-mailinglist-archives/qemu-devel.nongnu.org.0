Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBED3C16F4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:19:25 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WkG-000807-9i
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEV-0001Bk-9Z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WET-0000Kc-6H
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3FtTaLI6d7reROP0H2dey4JNfLhaIJxMMYm5ufEzI0=;
 b=C+McJCGLhfdZAXBl0myx8YZNztCeSssFSO53v/AkZXsZ9sF4Y1HPzr49pctBKfnrHKhq+O
 jWJXW3o2cgBpsPouFuQQGzA+p6nfSkbrRpo6zqdPQvqrPJc+F0jbh6nMRGWRM5Oo0ckZRM
 WkdxCGpUIjshokKxng1BjGIqVRccXJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-XH-Si9fIM52SYOupFVkPsA-1; Thu, 08 Jul 2021 11:46:31 -0400
X-MC-Unique: XH-Si9fIM52SYOupFVkPsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 181C719253C0
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:46:30 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C0FF19C66;
 Thu,  8 Jul 2021 15:46:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/35] acpi: build_rsdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:44 -0400
Message-Id: <20210708154617.1538485-3-imammedo@redhat.com>
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
which hides offests magic from API user.

While at it switch to build_append_int_noprefix() to build
entries to other tables (which also removes some manual offset
calculations).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 10 ----------
 hw/acpi/aml-build.c         | 27 ++++++++++++---------------
 2 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index cf9f44299c..ccfa3382aa 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -149,16 +149,6 @@ struct AcpiSerialPortConsoleRedirection {
 typedef struct AcpiSerialPortConsoleRedirection
                AcpiSerialPortConsoleRedirection;
 
-/*
- * ACPI 1.0 Root System Description Table (RSDT)
- */
-struct AcpiRsdtDescriptorRev1 {
-    ACPI_TABLE_HEADER_DEF       /* ACPI common table header */
-    uint32_t table_offset_entry[];  /* Array of pointers to other */
-    /* ACPI tables */
-} QEMU_PACKED;
-typedef struct AcpiRsdtDescriptorRev1 AcpiRsdtDescriptorRev1;
-
 /*
  * ACPI 2.0 eXtended System Description Table (XSDT)
  */
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index c598010144..705fe350bb 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1886,27 +1886,24 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id)
 {
     int i;
-    unsigned rsdt_entries_offset;
-    AcpiRsdtDescriptorRev1 *rsdt;
-    int rsdt_start = table_data->len;
-    const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
-    const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
-    const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
-
-    rsdt = acpi_data_push(table_data, rsdt_len);
-    rsdt_entries_offset = (char *)rsdt->table_offset_entry - table_data->data;
+    AcpiTable table = { .sig = "RSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+
+    acpi_init_table(&table, table_data);
     for (i = 0; i < table_offsets->len; ++i) {
         uint32_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
-        uint32_t rsdt_entry_offset = rsdt_entries_offset + rsdt_entry_size * i;
+        uint32_t rsdt_entry_offset = table.array->len;
+
+        /* reserve space for entry */
+        build_append_int_noprefix(table.array, 0, 4);
 
-        /* rsdt->table_offset_entry to be filled by Guest linker */
+        /* mark position of RSDT entry to be filled by Guest linker */
         bios_linker_loader_add_pointer(linker,
-            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, rsdt_entry_size,
+            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, 4,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
+
     }
-    build_header(linker, table_data,
-                 (void *)(table_data->data + rsdt_start),
-                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 /* Build xsdt table */
-- 
2.27.0


