Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD841EA169
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 11:59:24 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfhE3-0005xT-Ay
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 05:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhCh-0004Cb-2w
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 05:57:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55628
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhCg-0002KI-Ay
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 05:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591005477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTXgEzXD+1H1BMRYxUFuz4+svCjaNgDjnJz3ULVIiag=;
 b=fnB20jDnsf0IuaRkDvjm5R3B9rDb7SBO+GSEMLIucI8RyT/wEMU3HW5k4ny0G0kQi7pyXZ
 9fX80tjEX0vk15uFwmoRIAQtuqK9t5YblWGtBTG+PkkroEgAOGSMpUnUFFbCRxyjp4kpbX
 urnx5LjUKteIDuX6d1LoOPt/q5NNiSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-PQsUf_WaN-qcsC_XoxV0Tw-1; Mon, 01 Jun 2020 05:57:53 -0400
X-MC-Unique: PQsUf_WaN-qcsC_XoxV0Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ACA419200C0;
 Mon,  1 Jun 2020 09:57:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5F595C1B2;
 Mon,  1 Jun 2020 09:57:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 1/4] acpi: Convert build_tpm2() to build_append* API
Date: Mon,  1 Jun 2020 11:57:34 +0200
Message-Id: <20200601095737.32671-2-eric.auger@redhat.com>
In-Reply-To: <20200601095737.32671-1-eric.auger@redhat.com>
References: <20200601095737.32671-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:19:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation of its move to the generic acpi code,
let's convert build_tpm2() to use build_append API. This
latter now is prefered in place of direct ACPI struct field
settings with manual endianness conversion.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/acpi-build.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b5669d6c65..f0d35d7b17 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2298,30 +2298,40 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 static void
 build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
-    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof *tpm2_ptr);
+    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
     unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
     unsigned log_addr_offset =
         (char *)&tpm2_ptr->log_area_start_address - table_data->data;
+    uint8_t start_method_params[12] = {};
 
-    tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
+    /* platform class */
+    build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
+    /* reserved */
+    build_append_int_noprefix(table_data, 0, 2);
     if (TPM_IS_TIS_ISA(tpm_find())) {
-        tpm2_ptr->control_area_address = cpu_to_le64(0);
-        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
+        /* address of control area */
+        build_append_int_noprefix(table_data, 0, 8);
+        /* start method */
+        build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO, 4);
     } else if (TPM_IS_CRB(tpm_find())) {
-        tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
-        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
+        build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
+        build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
     } else {
         g_warn_if_reached();
     }
 
-    tpm2_ptr->log_area_minimum_length =
-        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
+    /* platform specific parameters */
+    g_array_append_vals(table_data, &start_method_params, 12);
 
-    acpi_data_push(tcpalog, le32_to_cpu(tpm2_ptr->log_area_minimum_length));
+    /* log area minimum length */
+    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
+
+    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
     bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
                              false);
 
     /* log area start address to be filled by Guest linker */
+    build_append_int_noprefix(table_data, 0, 8);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    log_addr_offset, log_addr_size,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
-- 
2.20.1


