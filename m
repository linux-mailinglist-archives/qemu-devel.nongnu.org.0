Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF9A3C16EE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:16:33 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WhU-0002t8-Me
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEW-0001EA-9I
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEU-0000LQ-OL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XD4k4xXyeghuFRurueoclCHryjdmUlrfuYrIi94/fCU=;
 b=h+hOpj3ey2G5blSP2S0Sf0EeqURJFzugY6q6yuo1tX9qCSFk6bOyu0xZqS9I85uCgaAbAc
 h1mflIzg7XQV2uQU4b8lc7LADCKDeZO4ldKZsyj/59gvLPUD0a55v7ncf08z/66NDyheRY
 oInS9FEMxDsqtS6ZSa5w3Dc+ANq5Lns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-VdlgtvuvOcC97LQbsyr4Dg-1; Thu, 08 Jul 2021 11:46:32 -0400
X-MC-Unique: VdlgtvuvOcC97LQbsyr4Dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF70D100C609
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:46:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 508A319C66;
 Thu,  8 Jul 2021 15:46:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/35] acpi: build_slit: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:46 -0400
Message-Id: <20210708154617.1538485-5-imammedo@redhat.com>
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
 hw/acpi/aml-build.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index c33fa6c799..80cd23f3a5 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1950,11 +1950,12 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
-    int slit_start, i, j;
-    slit_start = table_data->len;
+    int i, j;
     int nb_numa_nodes = ms->numa_state->num_nodes;
+    AcpiTable table = { .sig = "SLIT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_init_table(&table, table_data);
 
     build_append_int_noprefix(table_data, nb_numa_nodes, 8);
     for (i = 0; i < nb_numa_nodes; i++) {
@@ -1965,11 +1966,7 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                                       1);
         }
     }
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + slit_start),
-                 "SLIT",
-                 table_data->len - slit_start, 1, oem_id, oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 /* build rev1/rev3/rev5.1 FADT */
-- 
2.27.0


