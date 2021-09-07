Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16C4402B19
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:52:26 +0200 (CEST)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcSX-00063k-NT
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOq-0005wx-0q
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcOo-0008Av-CV
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1AGsQsk1vbg/voIK4JaT0qWXIAI0+DTYqN2DxaIxBI=;
 b=aYVWkVpPQFaGYvHKzeVwDtJaW7o09lEes5NQQ6vhT2IVnfgOJgPdWYETGiM6b2Y0Z3Tqt9
 eEJJ0YenpGHoDf0fBgpqober/tcpfYEng+lwYJeXLnrHiPe66haaLaXsNZoO6/fVwQUVw2
 71lqJzbPWA17fd79QRQFTYnNlhJUzJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-E7a9oghmPGelEuGW0ZjMxg-1; Tue, 07 Sep 2021 10:48:32 -0400
X-MC-Unique: E7a9oghmPGelEuGW0ZjMxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 917B480196C;
 Tue,  7 Sep 2021 14:48:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 713E45D9CA;
 Tue,  7 Sep 2021 14:48:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/35] acpi: build_tpm2: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:45 -0400
Message-Id: <20210907144814.741785-7-imammedo@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: Eric Auger <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 stefanb@linux.vnet.ibm.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: stefanb@linux.vnet.ibm.com
---
 hw/acpi/aml-build.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index dbf3ffe889..5e8bfb631c 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2107,13 +2107,14 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
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
+    acpi_table_begin(&table, table_data);
 
     /* Platform Class */
     build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
@@ -2151,9 +2152,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
-    build_header(linker, table_data,
-                 (void *)(table_data->data + tpm2_start),
-                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 #endif
 
-- 
2.27.0


