Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC53B4117
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:04:55 +0200 (CEST)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwihi-00042J-3T
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0Y-0004bM-NU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0V-0007ZQ-JK
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sevqBq2jwh0irBge6etk6FQ9XWj0lwGxMZYsSIdfkWI=;
 b=A9btc02/v0CmtfXfU5Ix7+onxuXPORQfnJegArUni7Pxu6gbgdnDtLVX2d8dn4uGlXM7+G
 Sl3sQ5mP6hYNzao3GOizG1YVs7LIS79NugsoSiwaBUk45H7Ph5wOrRufUvUWl/eX/J3QYy
 8OqpFGWCm/kVGwDI0nZ7vBn8oNzBeJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-S1wKasHQOWG-XlIRkgFMLA-1; Fri, 25 Jun 2021 05:20:12 -0400
X-MC-Unique: S1wKasHQOWG-XlIRkgFMLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C62362FA;
 Fri, 25 Jun 2021 09:20:11 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F357060CA0;
 Fri, 25 Jun 2021 09:20:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 51/53] acpi: build_facs: use build_append_int_noprefix() API
 to compose table
Date: Fri, 25 Jun 2021 05:18:16 -0400
Message-Id: <20210625091818.1047980-53-imammedo@redhat.com>
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

Drop usage of packed structures and explicit endian
conversions when building table and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: marcel.apfelbaum@gmail.com
---
 include/hw/acpi/acpi-defs.h | 14 --------------
 include/hw/acpi/aml-build.h |  1 +
 hw/acpi/aml-build.c         |  2 +-
 hw/i386/acpi-build.c        | 18 ++++++++++++++----
 4 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 0b375e7589..1a0774edd6 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -117,18 +117,4 @@ typedef struct AcpiFadtData {
 #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
 #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
 
-/*
- * ACPI 1.0 Firmware ACPI Control Structure (FACS)
- */
-struct AcpiFacsDescriptorRev1 {
-    uint32_t signature;           /* ACPI Signature */
-    uint32_t length;                 /* Length of structure, in bytes */
-    uint32_t hardware_signature;     /* Hardware configuration signature */
-    uint32_t firmware_waking_vector; /* ACPI OS waking vector */
-    uint32_t global_lock;            /* Global Lock */
-    uint32_t flags;
-    uint8_t  resverved3 [40];        /* Reserved - must be zero */
-} QEMU_PACKED;
-typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
-
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index dcb7ce11a8..de7d50a5a0 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -413,6 +413,7 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
 Aml *aml_object_type(Aml *object);
 
 void build_append_int_noprefix(GArray *table, uint64_t value, int size);
+void build_append_byte(GArray *array, uint8_t val);
 
 typedef struct AcpiTable {
     const char *sig;
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 813542b081..c86003c3e9 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -47,7 +47,7 @@ static void build_prepend_byte(GArray *array, uint8_t val)
     g_array_prepend_val(array, val);
 }
 
-static void build_append_byte(GArray *array, uint8_t val)
+void build_append_byte(GArray *array, uint8_t val)
 {
     g_array_append_val(array, val);
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ea6bfff5b7..90c88fdffc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -346,13 +346,23 @@ static void acpi_align_size(GArray *blob, unsigned align)
     g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
 }
 
-/* FACS */
+/*
+ * ACPI spec 1.0b,
+ * 5.2.6 Firmware ACPI Control Structure
+ */
 static void
 build_facs(GArray *table_data)
 {
-    AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
-    memcpy(&facs->signature, "FACS", 4);
-    facs->length = cpu_to_le32(sizeof(*facs));
+    const char *sig = "FACS";
+    const uint8_t reserved[40] = {};
+
+    g_array_append_vals(table_data, sig, 4); /* Signature */
+    build_append_int_noprefix(table_data, 64, 4); /* Length */
+    build_append_int_noprefix(table_data, 0, 4); /* Hardware Signature */
+    build_append_int_noprefix(table_data, 0, 4); /* Firmware Waking Vector */
+    build_append_int_noprefix(table_data, 0, 4); /* Global Lock */
+    build_append_int_noprefix(table_data, 0, 4); /* Flags */
+    g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
-- 
2.27.0


