Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AB0402B5C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:10:41 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNckC-0002HZ-DB
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcQ3-0001TJ-OE
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcQ1-0000ke-5S
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7INbcwKFqMe1S/1oW+CT1GC1FXrxA5jFkwKlDud0iY=;
 b=VBowO9B2vTpQulutp/2z4GE4CE4PG/U2zkeVmwYYa7/unllF33/n6Yl70Zy1zT/SuEizCx
 y0OwIHgIZRuf/CNsm8K+0sK+wTPj1i3TTAr6kFr4pnY/IDuFsFx/8UV6MC/OJbmrd0Q/qS
 wG0HR44vCvbOc/QAQuA4h1p3+ctFAS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-0wccDcnBPEmUTmnyFRpDNQ-1; Tue, 07 Sep 2021 10:49:47 -0400
X-MC-Unique: 0wccDcnBPEmUTmnyFRpDNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F3CF107ACCA;
 Tue,  7 Sep 2021 14:49:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D5BF5D9CA;
 Tue,  7 Sep 2021 14:49:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/35] acpi: build_facs: use build_append_int_noprefix()
 API to compose table
Date: Tue,  7 Sep 2021 10:48:12 -0400
Message-Id: <20210907144814.741785-34-imammedo@redhat.com>
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
index 6e1f42e119..6f3d1de1b1 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -413,6 +413,7 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
 Aml *aml_object_type(Aml *object);
 
 void build_append_int_noprefix(GArray *table, uint64_t value, int size);
+void build_append_byte(GArray *array, uint8_t val);
 
 typedef struct AcpiTable {
     const char *sig;
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 050fdb3f37..4135b385e5 100644
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
index 9f888d5a2c..547cd4ed9d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -345,13 +345,23 @@ static void acpi_align_size(GArray *blob, unsigned align)
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


