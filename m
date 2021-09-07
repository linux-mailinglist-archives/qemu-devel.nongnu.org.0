Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB379402B49
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:03:25 +0200 (CEST)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcdA-0003th-Ur
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcP4-0006WO-90
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcP2-0008M3-Hz
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZQcBJinCOqdbROm/pEXccwcMjhgke8rWdD4F2rLcdc=;
 b=SW2Hwd6MMh67tZ/mYp8oy7u4PlgY052z+/HyHV97eHULmhpZpmQ0lkuL41Ce4+ECQOfKO4
 1bo/tPzjgOvvA0vQG0ewkEIo8erFmq0GtpHilaJPUR6wu6vJrCWUA4omRbJI7odnFJVpZS
 3C6sErwth7DjYM/YeBoqBCFZntcUbHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-jsTf5nzFOI-rHAptdVQ_Zg-1; Tue, 07 Sep 2021 10:48:44 -0400
X-MC-Unique: jsTf5nzFOI-rHAptdVQ_Zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D21C1013722;
 Tue,  7 Sep 2021 14:48:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B9FC5D9CA;
 Tue,  7 Sep 2021 14:48:43 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/35] acpi: nvdimm_build_nfit: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:49 -0400
Message-Id: <20210907144814.741785-11-imammedo@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Also since acpi_table_begin() reserves space only for standard header
while previous acpi_data_push() reserved the header + 4 bytes field,
add 4 bytes 'Reserved' field into nvdimm_build_nfit() which didn't
have it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: xiaoguangrong.eric@gmail.com
---
 hw/acpi/nvdimm.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e3d5fe1939..15f6ca82ca 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -44,22 +44,6 @@ static const uint8_t nvdimm_nfit_spa_uuid[] =
       UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
               0x18, 0xb7, 0x8c, 0xdb);
 
-/*
- * NVDIMM Firmware Interface Table
- * @signature: "NFIT"
- *
- * It provides information that allows OSPM to enumerate NVDIMM present in
- * the platform and associate system physical address ranges created by the
- * NVDIMMs.
- *
- * It is defined in ACPI 6.0: 5.2.25 NVDIMM Firmware Interface Table (NFIT)
- */
-struct NvdimmNfitHeader {
-    ACPI_TABLE_HEADER_DEF
-    uint32_t reserved;
-} QEMU_PACKED;
-typedef struct NvdimmNfitHeader NvdimmNfitHeader;
-
 /*
  * define NFIT structures according to ACPI 6.0: 5.2.25 NVDIMM Firmware
  * Interface Table (NFIT).
@@ -401,25 +385,33 @@ void nvdimm_plug(NVDIMMState *state)
     nvdimm_build_fit_buffer(state);
 }
 
+/*
+ * NVDIMM Firmware Interface Table
+ * @signature: "NFIT"
+ *
+ * It provides information that allows OSPM to enumerate NVDIMM present in
+ * the platform and associate system physical address ranges created by the
+ * NVDIMMs.
+ *
+ * It is defined in ACPI 6.0: 5.2.25 NVDIMM Firmware Interface Table (NFIT)
+ */
+
 static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
                               GArray *table_data, BIOSLinker *linker,
                               const char *oem_id, const char *oem_table_id)
 {
     NvdimmFitBuffer *fit_buf = &state->fit_buf;
-    unsigned int header;
+    AcpiTable table = { .sig = "NFIT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
     acpi_add_table(table_offsets, table_data);
 
-    /* NFIT header. */
-    header = table_data->len;
-    acpi_data_push(table_data, sizeof(NvdimmNfitHeader));
+    acpi_table_begin(&table, table_data);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
     /* NVDIMM device structures. */
     g_array_append_vals(table_data, fit_buf->fit->data, fit_buf->fit->len);
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + header), "NFIT",
-                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, oem_id,
-                 oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 #define NVDIMM_DSM_MEMORY_SIZE      4096
-- 
2.27.0


