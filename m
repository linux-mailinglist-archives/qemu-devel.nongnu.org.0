Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE403C1702
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:24:17 +0200 (CEST)
Received: from localhost ([::1]:55412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Woy-0002YR-HA
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEZ-0001NV-Ed
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEX-0000Mm-Pr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mgf+imGcQ7NOmAVCtMJ17T0tYfMTN4zlxsiV6uZOEGg=;
 b=K4k9NMRShzk6DIU0UIPb71SDrjh7CvZ6oGX5S60uo1fILYt0N2x4JtruEAE47xTISekRji
 r8ld60poGUoTQv5cQOHOyh/ognCHkUIyQd9qAZTkVuxOahANYtlpobdIroGKVWjvdTNOhI
 ij/DZI9LIds4rDdQjS8p+f6rf6reOvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Cg0PRhppM3O5lx9g23TOlg-1; Thu, 08 Jul 2021 11:46:33 -0400
X-MC-Unique: Cg0PRhppM3O5lx9g23TOlg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E15CA802E63
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:46:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4226319C66;
 Thu,  8 Jul 2021 15:46:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/35] acpi: build_fadt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:47 -0400
Message-Id: <20210708154617.1538485-6-imammedo@redhat.com>
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
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 80cd23f3a5..176d086b25 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1974,9 +1974,10 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
 {
     int off;
-    int fadt_start = tbl->len;
+    AcpiTable table = { .sig = "FACP", .rev = f->rev,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    acpi_data_push(tbl, sizeof(AcpiTableHeader));
+    acpi_init_table(&table, tbl);
 
     /* FACS address to be filled by Guest linker at runtime */
     off = tbl->len;
@@ -2040,7 +2041,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
 
     if (f->rev == 1) {
-        goto build_hdr;
+        goto done;
     }
 
     build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
@@ -2077,7 +2078,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
 
     if (f->rev <= 4) {
-        goto build_hdr;
+        goto done;
     }
 
     /* SLEEP_CONTROL_REG */
@@ -2088,9 +2089,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     /* TODO: extra fields need to be added to support revisions above rev5 */
     assert(f->rev == 5);
 
-build_hdr:
-    build_header(linker, tbl, (void *)(tbl->data + fadt_start),
-                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
+done:
+    acpi_table_composed(linker, &table);
 }
 
 #ifdef CONFIG_TPM
-- 
2.27.0


