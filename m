Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E23C170C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:27:20 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wrv-0002IJ-9u
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEZ-0001ME-0T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEX-0000MD-82
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NxZTVyQuNTbcQh8MSyygHNgaRig6S6dwI3uu5ydpKE=;
 b=a/afFlWcccNe0/D0lu2Dft1Y2994b+lZv+TqzjT/Bwvsp3zrNQ1xumgw6VKYWZlWoUmXgl
 bEeScrbEb0wonN6yrsJRkez1U/pnUsGlx6A7OxXZOfsIxzZRYGTmQOoGUt2Pp5YYtg9t7z
 Eg1BPp07wFv4KOvJtKhU8SNc1g4h3Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-Ez1QWXcEMQmEZyOUaUgktw-1; Thu, 08 Jul 2021 11:46:35 -0400
X-MC-Unique: Ez1QWXcEMQmEZyOUaUgktw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C0EE100C609;
 Thu,  8 Jul 2021 15:46:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 343FE19C66;
 Thu,  8 Jul 2021 15:46:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/35] acpi: build_tpm2: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:48 -0400
Message-Id: <20210708154617.1538485-7-imammedo@redhat.com>
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
Cc: stefanb@linux.vnet.ibm.com, Stefan Berger <stefanb@linux.ibm.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
---
CC: stefanb@linux.vnet.ibm.com
---
 hw/acpi/aml-build.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 176d086b25..057c64fb48 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2103,13 +2103,14 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                 const char *oem_id, const char *oem_table_id)
 {
     uint8_t start_method_params[12] = {};
-    unsigned log_addr_offset, tpm2_start;
+    unsigned log_addr_offset;
     uint64_t control_area_start_address;
     TPMIf *tpmif = tpm_find();
     uint32_t start_method;
+    AcpiTable table = { .sig = "TPM2", .rev = 4,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    tpm2_start = table_data->len;
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_init_table(&table, table_data);
 
     /* Platform Class */
     build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
@@ -2147,9 +2148,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
-    build_header(linker, table_data,
-                 (void *)(table_data->data + tpm2_start),
-                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 #endif
 
-- 
2.27.0


