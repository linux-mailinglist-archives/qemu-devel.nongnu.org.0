Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A8402B31
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:56:07 +0200 (CEST)
Received: from localhost ([::1]:42720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcW6-0005iZ-VW
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOx-0006I5-I7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOw-0008Gv-0H
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQ9qw6Wo+2y/RwYQx01DpUM8PBNnLYvQ3XTNHFqowQ8=;
 b=BsmaX3QPUtRrj1QCB3kKrb9rWMJQskrxSo7fYMJ5TCgbpixRzk8q8y/iF+Mh7DQHxVMV/V
 cgo0Qwh4c4atqzKK75SBDX7lPJKpnTBzg9vvRYp3wJWYxtZsgUqHw/Vw/MCMzncXDpvpK1
 CCGS0Zrb6rgDNkBYyDHtZzQgKg6+bpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-8pgcZGY3OBiPPSSfO1he0A-1; Tue, 07 Sep 2021 10:48:40 -0400
X-MC-Unique: 8pgcZGY3OBiPPSSfO1he0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929CF1940927
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 14:48:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26BCD5D9CA;
 Tue,  7 Sep 2021 14:48:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/35] acpi: build_mcfg: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:47 -0400
Message-Id: <20210907144814.741785-9-imammedo@redhat.com>
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
---
 hw/acpi/pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 75b1103ec4..20b70dcd81 100644
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
+    acpi_table_begin(&table, table_data);
 
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
+    acpi_table_end(linker, &table);
 }
-- 
2.27.0


