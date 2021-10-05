Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37616422DED
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:26:46 +0200 (CEST)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnHB-0001sq-6a
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtA-0000ZP-6y
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmt8-0005HD-9U
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ubtv06sdXqWfSsbHdaI94YkCgWlWrYubEpResPKOljE=;
 b=CbH6lhyLEoJdF2f4XT7J3ZcNVJ04iAAIsgkYcj8LjXIdFip0ZrT88fwF2d6P0oMaOwPkV+
 Z60G7WqJt2qN8afdOmLT4Ixrxe5tHlXXMB0AMSn06xjS7IV1alLKQNN/2NhG1cZvF2roV0
 5Qa/t8050p1lttuQeVNtoSWIH4XzRRg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-GgL2gOmKOuaEjCXKg6tPgQ-1; Tue, 05 Oct 2021 12:01:48 -0400
X-MC-Unique: GgL2gOmKOuaEjCXKg6tPgQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 10-20020a05600c240a00b0030d403f24e2so1483022wmp.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ubtv06sdXqWfSsbHdaI94YkCgWlWrYubEpResPKOljE=;
 b=tSXujfOnCvtd0w3BzVLsm+QcSYjzjE7k+eRhDMaK/b41r4qXdkLi3oOiVtHvBcCp/H
 pmzQ07Kn++/L1Gb9+KiQInIvXO7h2YzkYslZ6q2c2Bja3ndKC/x44h8aHxn7XAKvTmhF
 uct0VaqZLTnfJt7O6EDkMPnwT86lNBsYddr8iDpBIJ87Pz9pwsDko/G8Jt0bMnDdbg88
 AeXEjKJmSOCvG2gKDfk6cjUnBeKad3DRa/esGozT6chl+Fk8bOLeiBPvTLpmJXk6u7h0
 efdWtO6P04jLRxJnb1+1SH+V9ZV3ytEPngN+22/nZTrQwZU6Wus1fC/vra0LpZa0c61J
 Un1g==
X-Gm-Message-State: AOAM533mOkHOJhVObpQXMrlebHq4jVTJaKYhkF2/VlyZOe9NFZPUWPCq
 SrBBXJng78Y60dVq24aYyhL/+Jr9B7EV/9+S8meE+bOIEG9puUOkyjbduRtgv+PHtBBnVlLN4dd
 QvvEueQ/9A5ii9wrNVOOTbJYwpYh0tU/pUE1Kh7oQz8t+jFf4DXeg6g8PJDqB
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr21847161wrr.332.1633449707269; 
 Tue, 05 Oct 2021 09:01:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqY1ykQlm0m1AO4j8IENyOJbOFBBHhESskgVer5Azur6EbSbmA28uEA8qMI4rAFX+MoXwpDQ==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr21847107wrr.332.1633449706961; 
 Tue, 05 Oct 2021 09:01:46 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id h18sm2804067wmq.23.2021.10.05.09.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:46 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/57] acpi: build_xsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-18-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
entries to other tables (which also removes some manual offset
calculations).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 10 ----------
 hw/acpi/aml-build.c         | 29 ++++++++++++++---------------
 2 files changed, 14 insertions(+), 25 deletions(-)

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
+    AcpiTable table = { .sig = "XSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+
+    acpi_table_begin(&table, table_data);
 
-    xsdt = acpi_data_push(table_data, xsdt_len);
-    xsdt_entries_offset = (char *)xsdt->table_offset_entry - table_data->data;
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
MST


