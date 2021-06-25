Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC59D3B40BB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:42:46 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiMH-0006JZ-FF
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzW-0002ph-Ay
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzT-0006rE-6R
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gsZ6SRq4ujOwE9GlvGKRId973IRdhJhHK5xgur8YK8=;
 b=KcB15t6bqp73Drg+ePCLC1ZrSaUdCPtqNFnJp8Q3NyvxMB3ij0XTEa0K1Kz59V2pw4fZ5e
 Z6ljZEnm4WzG1vozpWmzwph/c9Ut21w7gkcyKn6IotgkUsmNzN0NWUwOVQZQ/TuTwkfAIw
 zdZSXf7lXTbwRTShi1wCBvmpni6kI3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532--vstC_6CM6aCnp1IE58WBA-1; Fri, 25 Jun 2021 05:19:09 -0400
X-MC-Unique: -vstC_6CM6aCnp1IE58WBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52096DF8A5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:19:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB29360C05;
 Fri, 25 Jun 2021 09:19:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/53] acpi: build_rsdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Fri, 25 Jun 2021 05:17:45 -0400
Message-Id: <20210625091818.1047980-22-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
index 576fc0238c..f7241ea5ec 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1881,27 +1881,24 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
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


