Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26F3C16FB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:19:35 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WkQ-00007X-CP
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEb-0001S2-0R
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WEZ-0000Mu-6U
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9MD6W9OzcUVfoHPqh5/aQHC20q8foDt855wejz225Q=;
 b=VrqdqR3rp/am79qhpjanpj3nYTyd7FL489G4PIHFRQvQFt/vDgIlZWHxswQqOHZo3xyUIC
 a8UO+JKSjVnjzbgy0SmDOpsOC2L5TN7MbC6SJQLdAxPPiaIgEwsJPz/YH+ApPfHy1c7zEf
 0/n4T2q6NAlaUWfzzNvNvWo1/hcf19Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-eH-j7sQENVOFffR0qqCfNQ-1; Thu, 08 Jul 2021 11:46:37 -0400
X-MC-Unique: eH-j7sQENVOFffR0qqCfNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8235E19253C0
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:46:36 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5D6719C66;
 Thu,  8 Jul 2021 15:46:35 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/35] acpi: build_mcfg: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Thu,  8 Jul 2021 11:45:50 -0400
Message-Id: <20210708154617.1538485-9-imammedo@redhat.com>
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
 hw/acpi/pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 75b1103ec4..81ab83e636 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -28,19 +28,20 @@
 #include "hw/acpi/pci.h"
 #include "hw/pci/pcie_host.h"
 
+/*
+ * PCI Firmware Specification, Revision 3.0
+ * 4.1.2 MCFG Table Description.
+ */
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id)
 {
-    int mcfg_start = table_data->len;
+    AcpiTable table = { .sig = "MCFG", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+
+    acpi_init_table(&table, table_data);
 
-    /*
-     * PCI Firmware Specification, Revision 3.0
-     * 4.1.2 MCFG Table Description.
-     */
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
     /* Reserved */
     build_append_int_noprefix(table_data, 0, 8);
-
     /*
      * Memory Mapped Enhanced Configuration Space Base Address Allocation
      * Structure
@@ -56,6 +57,5 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
     /* Reserved */
     build_append_int_noprefix(table_data, 0, 4);
 
-    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
+    acpi_table_composed(linker, &table);
 }
-- 
2.27.0


