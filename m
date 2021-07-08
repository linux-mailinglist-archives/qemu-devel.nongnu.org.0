Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF583C170F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:28:34 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wt7-00070e-4G
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WF1-0002jd-PJ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEy-0000XL-PS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Rx2D70mmoHNz7x7h7CKzJQppcdYAgUFn/Y2KDfAwh4=;
 b=FJufMg1yhK5y2dvaNqcsk6QVHjffV3Yr8XL2xKhoOAac/ZMyy5jqIobQrFfjjDS2ik6xFL
 hff/jvGiZU6xcSWML4Y64BYC6XiVsl1CitlrVf8tXxKPOrSUfAjM4elUR/EUP8O6UsvHEw
 Tbbi0jrd8JVGcvQOchL7C3Eoi21MkuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-1fjPVxO-O3S109DWChCNSQ-1; Thu, 08 Jul 2021 11:47:02 -0400
X-MC-Unique: 1fjPVxO-O3S109DWChCNSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06862362FA;
 Thu,  8 Jul 2021 15:47:02 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 355CD19D9F;
 Thu,  8 Jul 2021 15:47:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/35] acpi: build_dsdt_microvm: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:46:08 -0400
Message-Id: <20210708154617.1538485-27-imammedo@redhat.com>
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: marcel.apfelbaum@gmail.com
---
 hw/i386/acpi-microvm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 1a0f77b911..82126680bb 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -113,16 +113,16 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     Aml *dsdt, *sb_scope, *scope, *pkg;
     bool ambiguous;
     Object *isabus;
+    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = x86ms->oem_id,
+                        .oem_table_id = x86ms->oem_table_id };
 
     isabus = object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous);
     assert(isabus);
     assert(!ambiguous);
 
+    acpi_init_table(&table, table_data);
     dsdt = init_aml_allocator();
 
-    /* Reserve space for header */
-    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
-
     sb_scope = aml_scope("_SB");
     fw_cfg_add_acpi_dsdt(sb_scope, x86ms->fw_cfg);
     isa_build_aml(ISA_BUS(isabus), sb_scope);
@@ -144,11 +144,10 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     aml_append(scope, aml_name_decl("_S5", pkg));
     aml_append(dsdt, scope);
 
-    /* copy AML table into ACPI tables blob and patch header there */
+    /* copy AML bytecode into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 2, x86ms->oem_id, x86ms->oem_table_id);
+
+    acpi_table_composed(linker, &table);
     free_aml_allocator();
 }
 
-- 
2.27.0


