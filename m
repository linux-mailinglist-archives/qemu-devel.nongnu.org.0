Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB0402B4E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:04:48 +0200 (CEST)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNceV-0006YY-5p
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPV-00086d-Pa
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPT-0000Ij-Ka
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Z4ANwVwFERtO/UlrpRbhq4WOz2p4H8Tnp6UHKYVU68=;
 b=AX16EHHQKaX0CllyztXARFGGEJ+q16ERTO8w4pvG7ORT0tdpQTyuOlroJlJY4BP/KwywqP
 ObD+ACNMUFmyUYRsv4Hz/iOR6JXJSbxIfKYD3r/OpBlJ2gAlK8s+p65s7BRkBdTd1THYMN
 zb6JUPgMo4dsJ3XIG7Ml3tI7n42RKQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-x-aWSX9CN7iBVXC-0vbTbA-1; Tue, 07 Sep 2021 10:49:13 -0400
X-MC-Unique: x-aWSX9CN7iBVXC-0vbTbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C15E984A5E9;
 Tue,  7 Sep 2021 14:49:12 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F034D5D9DE;
 Tue,  7 Sep 2021 14:49:11 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/35] acpi: x86: set enabled when composing _MAT entries
Date: Tue,  7 Sep 2021 10:48:02 -0400
Message-Id: <20210907144814.741785-24-imammedo@redhat.com>
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

Instead of composing disabled _MAT entry and then later on
patching it to enabled for hotpluggbale CPUs in DSDT,
set it to enabled at the time _MAT entry is built.

It will allow to drop usage of packed structures in
following patches when build_madt() is switched to use
build_append_int_noprefix() API.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: marcel.apfelbaum@gmail.com
---
 include/hw/acpi/acpi_dev_interface.h |  3 ++-
 include/hw/i386/pc.h                 |  6 +++---
 hw/acpi/acpi-x86-stub.c              |  3 ++-
 hw/acpi/cpu.c                        | 17 ++---------------
 hw/i386/acpi-common.c                | 18 ++++++------------
 5 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 769ff55c7e..ea6056ab92 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -53,6 +53,7 @@ struct AcpiDeviceIfClass {
     void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
     void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
-                     const CPUArchIdList *apic_ids, GArray *entry);
+                     const CPUArchIdList *apic_ids, GArray *entry,
+                     bool force_enabled);
 };
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4d2e35a152..82cf7b7e30 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -187,10 +187,10 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len);
 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 
-
-/* acpi-build.c */
+/* hw/i386/acpi-common.c */
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry);
+                       const CPUArchIdList *apic_ids, GArray *entry,
+                       bool force_enabled);
 
 extern GlobalProperty pc_compat_6_1[];
 extern const size_t pc_compat_6_1_len;
diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
index e9e46c5c5f..3df1e090f4 100644
--- a/hw/acpi/acpi-x86-stub.c
+++ b/hw/acpi/acpi-x86-stub.c
@@ -3,7 +3,8 @@
 #include "hw/i386/acpi-build.h"
 
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry)
+                       const CPUArchIdList *apic_ids, GArray *entry,
+                       bool force_enabled)
 {
 }
 
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index f82e9512fd..b20903ea30 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -669,21 +669,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
             /* build _MAT object */
             assert(adevc && adevc->madt_cpu);
-            adevc->madt_cpu(adev, i, arch_ids, madt_buf);
-            switch (madt_buf->data[0]) {
-            case ACPI_APIC_PROCESSOR: {
-                AcpiMadtProcessorApic *apic = (void *)madt_buf->data;
-                apic->flags = cpu_to_le32(1);
-                break;
-            }
-            case ACPI_APIC_LOCAL_X2APIC: {
-                AcpiMadtProcessorX2Apic *apic = (void *)madt_buf->data;
-                apic->flags = cpu_to_le32(1);
-                break;
-            }
-            default:
-                assert(0);
-            }
+            adevc->madt_cpu(adev, i, arch_ids, madt_buf,
+                            true); /* set enabled flag */
             aml_append(dev, aml_name_decl("_MAT",
                 aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
             g_array_free(madt_buf, true);
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index a0cde1d874..7983a13a93 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -34,9 +34,11 @@
 #include "acpi-common.h"
 
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry)
+                       const CPUArchIdList *apic_ids, GArray *entry,
+                       bool force_enabled)
 {
     uint32_t apic_id = apic_ids->cpus[uid].arch_id;
+    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ? 1 : 0;
 
     /* ACPI spec says that LAPIC entry for non present
      * CPU may be omitted from MADT or it must be marked
@@ -51,11 +53,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
         apic->length = sizeof(*apic);
         apic->processor_id = uid;
         apic->local_apic_id = apic_id;
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
+        apic->flags = cpu_to_le32(flags);
     } else {
         AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
 
@@ -63,11 +61,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
         apic->length = sizeof(*apic);
         apic->uid = cpu_to_le32(uid);
         apic->x2apic_id = cpu_to_le32(apic_id);
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
+        apic->flags = cpu_to_le32(flags);
     }
 }
 
@@ -96,7 +90,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
-        adevc->madt_cpu(adev, i, apic_ids, table_data);
+        adevc->madt_cpu(adev, i, apic_ids, table_data, false);
         if (apic_ids->cpus[i].arch_id > 254) {
             x2apic_mode = true;
         }
-- 
2.27.0


