Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42A3B40B9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:40:54 +0200 (CEST)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiKT-0001Vy-Fz
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzg-0003Cs-3g
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzd-0006zB-Vk
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2dnj5ofR1pP14rqmIvjnp+y1VQ61moNNf/hWnxaLQI=;
 b=N0qXdnRNcQ0oIXfLgRlGx4tyw2T4ZqaPOLxM6iRyhKoqkvmC0w2EWN3wJ9OcQQPUHu71+k
 Hi7HuJkjx2wm7zXVQqbT4SwyH2+dEC2ODa9vuuqcPRX8F6Ako2b0HKRqqI3qwyKGxe0XRE
 t384v/WeiUNm4h/cqMripjfYu+sJECU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-xmXjrmPxN_G59xi51DwNNA-1; Fri, 25 Jun 2021 05:19:19 -0400
X-MC-Unique: xmXjrmPxN_G59xi51DwNNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89FB0DF8A0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:19:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2BE960C05;
 Fri, 25 Jun 2021 09:19:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/53] acpi: vmgenid_build_acpi: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Fri, 25 Jun 2021 05:17:55 -0400
Message-Id: <20210625091818.1047980-32-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
 hw/acpi/vmgenid.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 4f41a13ea0..1801e8badf 100644
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
@@ -42,15 +44,12 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     g_array_insert_vals(guid, VMGENID_GUID_OFFSET, guid_le.data,
                         ARRAY_SIZE(guid_le.data));
 
-    /* Put this in a separate SSDT table */
+    /* Put VMGNEID into a separate SSDT table */
+    acpi_init_table(&table, table_data);
     ssdt = init_aml_allocator();
 
-    /* Reserve space for header */
-    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
-
     /* Storage for the GUID address */
-    vgia_offset = table_data->len +
-        build_append_named_dword(ssdt->buf, "VGIA");
+    vgia_offset = table_data->len + build_append_named_dword(ssdt->buf, "VGIA");
     scope = aml_scope("\\_SB");
     dev = aml_device("VGEN");
     aml_append(dev, aml_name_decl("_HID", aml_string("QEMUVGID")));
@@ -116,9 +115,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
         ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
         VMGENID_GUID_FW_CFG_FILE, 0);
 
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
+    /* must be called after above command to ensure correct table checksum */
+    acpi_table_composed(linker, &table);
     free_aml_allocator();
 }
 
-- 
2.27.0


