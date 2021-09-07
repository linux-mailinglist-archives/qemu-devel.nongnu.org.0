Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2C402B1D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:52:57 +0200 (CEST)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcT1-0006xu-TZ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPE-00074I-1x
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPB-0008V8-Oo
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdtuB89hvfO5mpdgjmBojpstSJEmRt39dgNdhvj8iHc=;
 b=CdsTcF7Ba2ROWya/14uwJKfsQ8WU0y1p299h2tU2ZCavS7deKgJ9TbCRKTc0wCejeOtOF3
 4NOkfqtM/O/9PIkyzUC2XM0B/VmTt2FZjYGRmO7VO98q92WjOuvlcH8kJC5Cba7shj3wRq
 Ja+QScfh41xb/DNCBEBTaK/yVwUXMxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Kx0UYKNUOX2ahOTBzrJOxg-1; Tue, 07 Sep 2021 10:48:56 -0400
X-MC-Unique: Kx0UYKNUOX2ahOTBzrJOxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA81501E0;
 Tue,  7 Sep 2021 14:48:55 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F0105D9CA;
 Tue,  7 Sep 2021 14:48:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/35] acpi: build_hpet: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:53 -0400
Message-Id: <20210907144814.741785-15-imammedo@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

while at it convert build_hpet() to endian agnostic
build_append_FOO() API

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: marcel.apfelbaum@gmail.com
---
 include/hw/acpi/acpi-defs.h | 13 -------------
 hw/i386/acpi-build.c        | 26 ++++++++++++++++++--------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index f6d2ca172b..4d8f8b34b0 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -358,19 +358,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-/*
- * HPET Description Table
- */
-struct Acpi20Hpet {
-    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
-    uint32_t           timer_block_id;
-    struct AcpiGenericAddress addr;
-    uint8_t            hpet_number;
-    uint16_t           min_tick;
-    uint8_t            page_protect;
-} QEMU_PACKED;
-typedef struct Acpi20Hpet Acpi20Hpet;
-
 /*
  * SRAT (NUMA topology description) table
  */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9cefb814c2..7cfa0cf825 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1849,22 +1849,32 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     free_aml_allocator();
 }
 
+/*
+ * IA-PC HPET (High Precision Event Timers) Specification (Revision: 1.0a)
+ * 3.2.4The ACPI 2.0 HPET Description Table (HPET)
+ */
 static void
 build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
            const char *oem_table_id)
 {
-    Acpi20Hpet *hpet;
-    int hpet_start = table_data->len;
+    AcpiTable table = { .sig = "HPET", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    hpet = acpi_data_push(table_data, sizeof(*hpet));
+    acpi_table_begin(&table, table_data);
     /* Note timer_block_id value must be kept in sync with value advertised by
      * emulated hpet
      */
-    hpet->timer_block_id = cpu_to_le32(0x8086a201);
-    hpet->addr.address = cpu_to_le64(HPET_BASE);
-    build_header(linker, table_data,
-                 (void *)(table_data->data + hpet_start),
-                 "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
+    /* Event Timer Block ID */
+    build_append_int_noprefix(table_data, 0x8086a201, 4);
+    /* BASE_ADDRESS */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0, 0, 0, HPET_BASE);
+    /* HPET Number */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Main Counter Minimum Clock_tick in Periodic Mode */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Page Protection And OEM Attribute */
+    build_append_int_noprefix(table_data, 0, 1);
+    acpi_table_end(linker, &table);
 }
 
 #ifdef CONFIG_TPM
-- 
2.27.0


