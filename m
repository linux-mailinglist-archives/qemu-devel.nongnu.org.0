Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEA73C16B6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:59:47 +0200 (CEST)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WRF-0003ys-Ez
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEV-0001BP-29
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WER-0000KU-TX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/CYVSS746Qrs+kgHF9is9+1ofHW09U2JDGVesuWOfE=;
 b=N+VdAHcdKBhVOmEkLrNsZF8NFzZdW2Y9Yu6sxUfyY7/8nXSa5sGnDYIattpOLdc+W0PlZC
 bP7ToZMsOTWmKWg61td6VTNzPDsklORXU9JnfeAZNQJGb4OEwmYuRqn8Q2+NPC08J+7ar8
 nz383HWfYLeFYXI9Udi6GOgcujY8Srg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-WFTN_kzTPmGfSnDpBNfqOQ-1; Thu, 08 Jul 2021 11:46:30 -0400
X-MC-Unique: WFTN_kzTPmGfSnDpBNfqOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 251EA100C612
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:46:29 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79AC619C66;
 Thu,  8 Jul 2021 15:46:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/35] acpi: add helper routines to initialize ACPI tables
Date: Thu,  8 Jul 2021 11:45:43 -0400
Message-Id: <20210708154617.1538485-2-imammedo@redhat.com>
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

Patch introduces acpi_init_table()/acpi_table_composed() API
that hides pointer/offset arithmetic from user as opposed
to build_header(), to prevent errors caused by it [1].

 acpi_init_table():
     initializes table header and keeps track of
     table data/offsets
 acpi_table_composed():
     sets actual table length and tells bios loader
     where table is for the later initialization on
     guest side.

1) commits
   bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
   4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/aml-build.h | 14 +++++++++
 hw/acpi/aml-build.c         | 58 +++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 471266d739..d590660bd2 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -413,6 +413,20 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
 Aml *aml_object_type(Aml *object);
 
 void build_append_int_noprefix(GArray *table, uint64_t value, int size);
+
+typedef struct AcpiTable {
+    const char *sig;
+    const uint8_t rev;
+    const char *oem_id;
+    const char *oem_table_id;
+    /* private vars tracking table state */
+    GArray *array;
+    unsigned table_offset;
+} AcpiTable;
+
+void acpi_init_table(AcpiTable *desc, GArray *array);
+void acpi_table_composed(BIOSLinker *linker, AcpiTable *table);
+
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d5103e6d7b..c598010144 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -52,6 +52,19 @@ static void build_append_byte(GArray *array, uint8_t val)
     g_array_append_val(array, val);
 }
 
+static void build_append_padded_str(GArray *array, const char *str,
+                                    size_t maxlen, char pad)
+{
+    size_t i;
+    size_t len = strlen(str);
+
+    g_assert(len <= maxlen);
+    g_array_append_vals(array, str, len);
+    for (i = maxlen - len; i > 0; i--) {
+        g_array_append_val(array, pad);
+    }
+}
+
 static void build_append_array(GArray *array, GArray *val)
 {
     g_array_append_vals(array, val->data, val->len);
@@ -1692,6 +1705,51 @@ Aml *aml_object_type(Aml *object)
     return var;
 }
 
+void acpi_init_table(AcpiTable *desc, GArray *array)
+{
+
+    desc->array = array;
+    desc->table_offset = array->len;
+
+    /*
+     * ACPI spec 1.0b
+     * 5.2.3 System Description Table Header
+     */
+    g_assert(strlen(desc->sig) == 4);
+    g_array_append_vals(array, desc->sig, 4); /* Signature */
+    build_append_int_noprefix(array, 0, 4); /* Length */
+    build_append_int_noprefix(array, desc->rev, 1); /* Revision */
+    build_append_int_noprefix(array, 0, 1); /* Checksum */
+    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
+    /* OEM Table ID */
+    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
+    build_append_int_noprefix(array, 1, 4); /* OEM Revision */
+    g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
+    build_append_int_noprefix(array, 1, 4); /* Creator Revision */
+}
+
+void acpi_table_composed(BIOSLinker *linker, AcpiTable *desc)
+{
+    /*
+     * ACPI spec 1.0b
+     * 5.2.3 System Description Table Header
+     * Table 5-2 DESCRIPTION_HEADER Fields
+     */
+    const unsigned checksum_offset = 9;
+    uint32_t table_len = desc->array->len - desc->table_offset;
+    uint32_t table_len_le = cpu_to_le32(table_len);
+    gchar *len_ptr = &desc->array->data[desc->table_offset + 4];
+
+    /* patch "Length" field that has been reserved by acpi_init_table()
+     * to the actual length, i.e. accumulated table length from
+     * acpi_init_table() till acpi_table_composed()
+     */
+    memcpy(len_ptr, &table_len_le, sizeof table_len_le);
+
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
+        desc->table_offset, table_len, desc->table_offset + checksum_offset);
+}
+
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-- 
2.27.0


