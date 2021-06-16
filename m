Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D203AA5EA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:06:45 +0200 (CEST)
Received: from localhost ([::1]:42212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltckG-0007o0-PL
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcQA-0004SY-0K
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPz-0001cw-2r
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OKxB9aMXMBUxq8Iq2kay9+mSOYnNmtBdcnlzYkDQcU=;
 b=dmYF1D5My7yPclBwtzHWWg+P0ser9jeAMOcjKTX7tdspDmvim71ac4LM3GwfnkGO68mDdm
 oPPLAs9477xL2kG1Xs4kvW45f2mO+9VxTKXgvwvN05kNTSF9pB1ij4Gu77eA61GVYa0bOy
 A/8LOA9A0mOWvxeOOe4WqBxc+sRHC3w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-cmZ8qeVZNBuuzV87iRMHDw-1; Wed, 16 Jun 2021 16:45:21 -0400
X-MC-Unique: cmZ8qeVZNBuuzV87iRMHDw-1
Received: by mail-wr1-f70.google.com with SMTP id
 f9-20020a5d64c90000b029011a3c2a0337so1885707wri.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OKxB9aMXMBUxq8Iq2kay9+mSOYnNmtBdcnlzYkDQcU=;
 b=RItnQSNIjv2793GWvP5V0zfzLnWpkXbD93HNBOt4TErBHZNy0otwpA3h2ojCw+yavv
 8tUnsJtWJ9DuJbXFFJZUPZhciNOfAdR9o8Yn2z4/sHuj247jeHrhqjLv/6+wDWh/FTLM
 +mpPBjrNi9lt9ugv0zVTM+LreYvnY5rXitUlhh/Bg4n64c9+z9aoP4Cn1E1+leNFjhlu
 MjYCUVRXyskMPnQnjcsS1n5t2Z5UPdre54MOwt1UmdXnkDmyIfRb6sbaGmumLxBxA6lZ
 gZXQWsZMRkO/pWpmZjvhvZvsYntUF7ZsA2Mj4eNRPdRsdwZQs4rKpjGAyAYnH4dtsDCy
 7Lig==
X-Gm-Message-State: AOAM532awfZCO73guhNy2kqtpsPqCUq5rBcmnA+wgUJWk3NTh2vaw1v9
 0MQI4qaoUlpwHmcbYgLYCY58C7Me1uhIVhvDwIrQ+PYrUM+uPj1EbsS0Zc9h4co5MMQtbug8Rzs
 +KivbJ2H4SDsVSrxGCH3vExQQv5GhrymIshk+fI3B3XlIc+Hy1Hr/GTQcthTJHUEt
X-Received: by 2002:a5d:58cc:: with SMTP id o12mr1166948wrf.384.1623876320497; 
 Wed, 16 Jun 2021 13:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyQaHC0ie/vly8Si7yvMMjFP3v1pG07LHIZmK1LAAi87HsEbRlhFl/GiE+k+VwjRriBxAq9w==
X-Received: by 2002:a5d:58cc:: with SMTP id o12mr1166907wrf.384.1623876320254; 
 Wed, 16 Jun 2021 13:45:20 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c21sm2705517wme.38.2021.06.16.13.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/23] hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c
Date: Wed, 16 Jun 2021 22:43:24 +0200
Message-Id: <20210616204328.2611406-20-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pc_madt_cpu_entry() is specific to QEMU 'PC' machines,
move it to acpi-pc.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-common.c | 40 ----------------------------------------
 hw/i386/acpi-pc.c     | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 77afebd9e1f..5ae1853b6f2 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -23,49 +23,10 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
-#include "hw/i386/pc.h"
 #include "target/i386/cpu.h"
 #include "acpi-build.h"
 #include "acpi-common.h"
 
-void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry)
-{
-    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
-
-    /* ACPI spec says that LAPIC entry for non present
-     * CPU may be omitted from MADT or it must be marked
-     * as disabled. However omitting non present CPU from
-     * MADT breaks hotplug on linux. So possible CPUs
-     * should be put in MADT but kept disabled.
-     */
-    if (apic_id < 255) {
-        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
-
-        apic->type = ACPI_APIC_PROCESSOR;
-        apic->length = sizeof(*apic);
-        apic->processor_id = uid;
-        apic->local_apic_id = apic_id;
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
-    } else {
-        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
-
-        apic->type = ACPI_APIC_LOCAL_X2APIC;
-        apic->length = sizeof(*apic);
-        apic->uid = cpu_to_le32(uid);
-        apic->x2apic_id = cpu_to_le32(apic_id);
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
-    }
-}
-
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                      X86MachineState *x86ms, AcpiDeviceIf *adev,
                      const char *oem_id, const char *oem_table_id)
@@ -155,4 +116,3 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                  (void *)(table_data->data + madt_start), "APIC",
                  table_data->len - madt_start, 1, oem_id, oem_table_id);
 }
-
diff --git a/hw/i386/acpi-pc.c b/hw/i386/acpi-pc.c
index 796ffc6f5c4..a3cd60d81e6 100644
--- a/hw/i386/acpi-pc.c
+++ b/hw/i386/acpi-pc.c
@@ -2707,3 +2707,42 @@ void acpi_setup(void)
      */
     acpi_build_tables_cleanup(&tables, false);
 }
+
+void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
+                       const CPUArchIdList *apic_ids, GArray *entry)
+{
+    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
+
+    /*
+     * ACPI spec says that LAPIC entry for non present
+     * CPU may be omitted from MADT or it must be marked
+     * as disabled. However omitting non present CPU from
+     * MADT breaks hotplug on linux. So possible CPUs
+     * should be put in MADT but kept disabled.
+     */
+    if (apic_id < 255) {
+        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
+
+        apic->type = ACPI_APIC_PROCESSOR;
+        apic->length = sizeof(*apic);
+        apic->processor_id = uid;
+        apic->local_apic_id = apic_id;
+        if (apic_ids->cpus[uid].cpu != NULL) {
+            apic->flags = cpu_to_le32(1);
+        } else {
+            apic->flags = cpu_to_le32(0);
+        }
+    } else {
+        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
+
+        apic->type = ACPI_APIC_LOCAL_X2APIC;
+        apic->length = sizeof(*apic);
+        apic->uid = cpu_to_le32(uid);
+        apic->x2apic_id = cpu_to_le32(apic_id);
+        if (apic_ids->cpus[uid].cpu != NULL) {
+            apic->flags = cpu_to_le32(1);
+        } else {
+            apic->flags = cpu_to_le32(0);
+        }
+    }
+}
-- 
2.31.1


