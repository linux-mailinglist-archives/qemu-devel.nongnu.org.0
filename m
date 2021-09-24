Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646AA4172A1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:49:07 +0200 (CEST)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkdW-0003zR-4q
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJh-0004wM-35
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJe-0001BB-8G
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqC8lVipO4KcUTb9GNFBCdcHaCNUXEYaJuFSwdOzT78=;
 b=SZ0t85FVIqVqkl8pT4TY81XrwlDrNJ6E3157IKPcMaaQ6KD2Ndb2NjcK0taal09MS5+sCD
 iXJT79tIBKDneE7Rg1z6eccSFG6oQMzlLsvu7o3oPgqSj6Ooj+d/C2nG5KRY//RbTnzHJE
 kDW4mjR90z5wzlhsxe3o4RwORrUBZb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-DT1N9TCYNE2uLh3vwKNKAw-1; Fri, 24 Sep 2021 08:28:32 -0400
X-MC-Unique: DT1N9TCYNE2uLh3vwKNKAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75F67101F001;
 Fri, 24 Sep 2021 12:28:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9F8E62465;
 Fri, 24 Sep 2021 12:28:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/35] acpi: acpi_build_hest: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:34 -0400
Message-Id: <20210924122802.1455362-8-imammedo@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: drjones@redhat.com, Dongjiu Geng <gengdongjiu1@gmail.com>, mst@redhat.com,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, eauger@redhat.com,
 ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
CC: gengdongjiu1@gmail.com
CC: eauger@redhat.com
---
 hw/acpi/ghes.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a749b84d62..45d9a809cc 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -362,18 +362,16 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id)
 {
-    uint64_t hest_start = table_data->len;
+    AcpiTable table = { .sig = "HEST", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    /* Hardware Error Source Table header*/
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_table_begin(&table, table_data);
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
-    build_header(linker, table_data, (void *)(table_data->data + hest_start),
-                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
-- 
2.27.0


