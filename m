Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F86C3C171C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:32:17 +0200 (CEST)
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wwi-0005aE-Ix
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEq-0002Aw-BH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEn-0000T8-Ja
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJUE5ruUCubFBY+sYAE0g5kPKoDCP5IiIuKFuL88eYI=;
 b=dVMp7qJcK0KLlA3jdu+Gf3Bjy7r7B01X9j6jCMcIAP1agDGGWbypHCv4zCCkm7B+hTV3BU
 FPueTJWgvuB6QB0wXzoUZLJArAA0JXVlt1RQvMqf7lzvUwXW3At3/33h1qdwXWMTo374kR
 tizZ8OYTY1qabUmmxs3BsDZd8xBsEwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-ve-4sieMNp6BcW6LnHUMwQ-1; Thu, 08 Jul 2021 11:46:48 -0400
X-MC-Unique: ve-4sieMNp6BcW6LnHUMwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 939B0802E61;
 Thu,  8 Jul 2021 15:46:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A24919C66;
 Thu,  8 Jul 2021 15:46:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/35] acpi: build_tpm_tcpa: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:57 -0400
Message-Id: <20210708154617.1538485-16-imammedo@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: stefanb@linux.vnet.ibm.com, Stefan Berger <stefanb@linux.ibm.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
table entries (which also removes some manual offset
calculations).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
---
v2:
  * fix assert when starting QEMU with TPM 1.2
      Stefan Berger <stefanb@linux.ibm.com>

CC: stefanb@linux.vnet.ibm.com
---
 include/hw/acpi/acpi-defs.h | 14 -------------
 hw/i386/acpi-build.c        | 40 ++++++++++++++++++++++---------------
 2 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 4d8f8b34b0..3b42b138f0 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -418,20 +418,6 @@ struct AcpiSratProcessorGiccAffinity {
 
 typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
 
-/*
- * TCPA Description Table
- *
- * Following Level 00, Rev 00.37 of specs:
- * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
- */
-struct Acpi20Tcpa {
-    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
-    uint16_t platform_class;
-    uint32_t log_area_minimum_length;
-    uint64_t log_area_start_address;
-} QEMU_PACKED;
-typedef struct Acpi20Tcpa Acpi20Tcpa;
-
 /* DMAR - DMA Remapping table r2.2 */
 struct AcpiTableDmar {
     ACPI_TABLE_HEADER_DEF
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 96ad3e1b9d..5457e35798 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1849,31 +1849,39 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
 }
 
 #ifdef CONFIG_TPM
+/*
+ * TCPA Description Table
+ *
+ * Following Level 00, Rev 00.37 of specs:
+ * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
+ * 7.1.2 ACPI Table Layout
+ */
 static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                const char *oem_id, const char *oem_table_id)
 {
-    int tcpa_start = table_data->len;
-    Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
-    unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
-    unsigned log_addr_offset =
-        (char *)&tcpa->log_area_start_address - table_data->data;
+    unsigned log_addr_offset;
+    AcpiTable table = { .sig = "TCPA", .rev = 2,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
-    tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
-    acpi_data_push(tcpalog, le32_to_cpu(tcpa->log_area_minimum_length));
+    acpi_init_table(&table, table_data);
+    /* Platform Class */
+    build_append_int_noprefix(table_data, TPM_TCPA_ACPI_CLASS_CLIENT, 2);
+    /* Log Area Minimum Length (LAML) */
+    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
+    /* Log Area Start Address (LASA) */
+    log_addr_offset = table_data->len;
+    build_append_int_noprefix(table_data, 0, 8);
 
+    acpi_table_composed(linker, &table);
+
+    /* allocate/reserve space for TPM log area */
+    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
     bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
                              false /* high memory */);
-
     /* log area start address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_TABLE_FILE, log_addr_offset, log_addr_size,
-        ACPI_BUILD_TPMLOG_FILE, 0);
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + tcpa_start),
-                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
+        log_addr_offset, 8, ACPI_BUILD_TPMLOG_FILE, 0);
 }
 #endif
 
-- 
2.27.0


