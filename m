Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D44172DD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:51:03 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkfO-0007NU-Mw
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkK1-00052q-R6
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkK0-0001Jo-BC
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCrK5OfoAJbNh/u9lbT/9DUws5i2IZqo+HSbs1VORf4=;
 b=Db9WUXDh1qv2yOxfg5R6BecjTJwidIU7TF7WJroGAK+hW5Pc6GG+/nnWNR6+Q+zqLp0BBF
 ukADZlXCQyahCUCwFSUB7plSmWWTuifluAyUReaajZcHc/Jif4p3S7KmeEQw9eFzlgrdUt
 GZEl9MtqoA5jjHuWcugJzFBwaOirIVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-3VDvJRcwOfamC966J6Delw-1; Fri, 24 Sep 2021 08:28:54 -0400
X-MC-Unique: 3VDvJRcwOfamC966J6Delw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B714D1084683;
 Fri, 24 Sep 2021 12:28:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2881062465;
 Fri, 24 Sep 2021 12:28:40 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/35] acpi: nvdimm_build_ssdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:38 -0400
Message-Id: <20210924122802.1455362-12-imammedo@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: ani@anisinha.ca, Eric Auger <eric.auger@redhat.com>,
 xiaoguangrong.eric@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v4:
  * s/acpi_table_composed/acpi_table_end/
      (Reviewed-by: Eric Auger <eric.auger@redhat.com>)
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: xiaoguangrong.eric@gmail.com
---
 hw/acpi/nvdimm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 15f6ca82ca..a7539cfe89 100644
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
 
+    acpi_table_begin(&table, table_data);
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
+     * would be executed by guest before it recalculated checksum which were
+     * scheduled by acpi_table_end()
+     */
+    acpi_table_end(linker, &table);
 }
 
 void nvdimm_build_srat(GArray *table_data)
-- 
2.27.0


