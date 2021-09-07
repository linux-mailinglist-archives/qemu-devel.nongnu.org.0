Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C707402B3C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:58:26 +0200 (CEST)
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcYL-00037q-4l
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPC-0006zD-Tc
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPA-0008UQ-AK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A14Lus1aUG1GWGdDm1ioRWFsu0zLVIJjyBt6EYfXk1k=;
 b=aOXR+X/D0Qgt3G3v9F82fSKQZ2UE3A9iTqf0px59eL+LBXY94PkdGamgkHdyQbMgTY4kAD
 kGsMiRpj22VXCtsm1mdWiEekZjsB6vsMlfq99TidfdlxYSIg0ocVdQFQtuEkaI8q/NmZ4o
 9UpFPnKUCJq02pKZ2tElxSTzuXuCZIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-TxWYzfFxP4WCJIRqwt65Ng-1; Tue, 07 Sep 2021 10:48:54 -0400
X-MC-Unique: TxWYzfFxP4WCJIRqwt65Ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9CAA84A5E0;
 Tue,  7 Sep 2021 14:48:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D3945D9CA;
 Tue,  7 Sep 2021 14:48:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/35] acpi: x86: build_dsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:52 -0400
Message-Id: <20210907144814.741785-14-imammedo@redhat.com>
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
Cc: Eric Auger <eric.auger@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: marcel.apfelbaum@gmail.com
---
 hw/i386/acpi-build.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1f5fa3b5a..9cefb814c2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1405,12 +1405,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 #endif
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
+    AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
+                        .oem_table_id = x86ms->oem_table_id };
 
+    acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
-    /* Reserve space for header */
-    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
-
     build_dbg_aml(dsdt);
     if (misc->is_piix4) {
         sb_scope = aml_scope("_SB");
@@ -1845,9 +1845,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 1, x86ms->oem_id, x86ms->oem_table_id);
+    acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-- 
2.27.0


