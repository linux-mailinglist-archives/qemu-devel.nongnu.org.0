Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF503C16D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:06:20 +0200 (CEST)
Received: from localhost ([::1]:57674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WXb-0007iq-FC
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEe-0001gA-Q9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEd-0000Pi-27
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=it8P6jPSlAKF+o/XbptrOaB6SFyD5GLhSK4VGT+8kvU=;
 b=ZCR8Ve2WTbqzWYlswBMTz2EgMG4NCMEiJqjzkNfa0RuNDFKcTLiwbwnWeSQG4mwNQMVBa8
 wIn8AWOE7E/4dvhUN2HaBkBRo+U0ps14BQJySszSxwrNmvqZQcqKx8RinxonzrS1KaoZMN
 j6M5EfVHzJGzyTwteVv5ZfsYivb7Ipo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-4hWIb-uENTOxjW386zpTDA-1; Thu, 08 Jul 2021 11:46:40 -0400
X-MC-Unique: 4hWIb-uENTOxjW386zpTDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A338419253CB;
 Thu,  8 Jul 2021 15:46:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2EEC19C66;
 Thu,  8 Jul 2021 15:46:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/35] acpi: nvdimm_build_ssdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:53 -0400
Message-Id: <20210708154617.1538485-12-imammedo@redhat.com>
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: xiaoguangrong.eric@gmail.com
---
 hw/acpi/nvdimm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 6a144b4542..b61bd681a1 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1274,14 +1274,15 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
                               NVDIMMState *nvdimm_state,
                               uint32_t ram_slots, const char *oem_id)
 {
+    int mem_addr_offset;
     Aml *ssdt, *sb_scope, *dev;
-    int mem_addr_offset, nvdimm_ssdt;
+    AcpiTable table = { .sig = "SSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = "NVDIMM" };
 
     acpi_add_table(table_offsets, table_data);
 
+    acpi_init_table(&table, table_data);
     ssdt = init_aml_allocator();
-    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
-
     sb_scope = aml_scope("\\_SB");
 
     dev = aml_device("NVDR");
@@ -1310,8 +1311,6 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     aml_append(sb_scope, dev);
     aml_append(ssdt, sb_scope);
 
-    nvdimm_ssdt = table_data->len;
-
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
     mem_addr_offset = build_append_named_dword(table_data,
@@ -1323,10 +1322,13 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
         NVDIMM_DSM_MEM_FILE, 0);
-    build_header(linker, table_data,
-        (void *)(table_data->data + nvdimm_ssdt),
-                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM");
     free_aml_allocator();
+    /*
+     * must be executed as the last so that pointer patching command above
+     * would be executed by guest before it recalculates checksum which were
+     * scheduled by acpi_table_composed()
+     */
+    acpi_table_composed(linker, &table);
 }
 
 void nvdimm_build_srat(GArray *table_data)
-- 
2.27.0


