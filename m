Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9641720C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:40:08 +0200 (CEST)
Received: from localhost ([::1]:34276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkUp-0002vN-0h
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkK5-00053Z-5B
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkK2-0001Jt-QH
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrNRqbufTFvlypBsP/ZQ8ndL7wmQLFd90isGt2YUfbs=;
 b=WKB9hzePIBz8eL+x+Pt/OCbyv9HUG3iCJylVUjQq5ppeSfadJCqjLdI69eU1FK+c5gc7Hq
 Ndb4QHZH4M4a2dlid2J8+ktNtiZkf64PzhIa/fEWcYJYKMOMMojirYW37JVtz1lfwv26hU
 hioFQ96xJZyB7Nre4eu7hBioRySpq20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-D1-jRn78OBCgWGR1D_42Mw-1; Fri, 24 Sep 2021 08:28:56 -0400
X-MC-Unique: D1-jRn78OBCgWGR1D_42Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B548015C7;
 Fri, 24 Sep 2021 12:28:55 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BC9762465;
 Fri, 24 Sep 2021 12:28:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/35] acpi: vmgenid_build_acpi: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:39 -0400
Message-Id: <20210924122802.1455362-13-imammedo@redhat.com>
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
Cc: ani@anisinha.ca, Eric Auger <eric.auger@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v4:
  * drop not related "vgia_offset = table_data->len" newline change
       (Reviewed-by: Eric Auger <eric.auger@redhat.com>)
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
---
 hw/acpi/vmgenid.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 4f41a13ea0..0c9f158ac9 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -29,6 +29,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
     uint32_t vgia_offset;
     QemuUUID guid_le;
+    AcpiTable table = { .sig = "SSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = "VMGENID" };
 
     /* Fill in the GUID values.  These need to be converted to little-endian
      * first, since that's what the guest expects
@@ -42,12 +44,10 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     g_array_insert_vals(guid, VMGENID_GUID_OFFSET, guid_le.data,
                         ARRAY_SIZE(guid_le.data));
 
-    /* Put this in a separate SSDT table */
+    /* Put VMGNEID into a separate SSDT table */
+    acpi_table_begin(&table, table_data);
     ssdt = init_aml_allocator();
 
-    /* Reserve space for header */
-    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
-
     /* Storage for the GUID address */
     vgia_offset = table_data->len +
         build_append_named_dword(ssdt->buf, "VGIA");
@@ -116,9 +116,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
         ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
         VMGENID_GUID_FW_CFG_FILE, 0);
 
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
+    /* must be called after above command to ensure correct table checksum */
+    acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-- 
2.27.0


