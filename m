Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59B681B40
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:19:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacO-0002FN-S6; Mon, 30 Jan 2023 15:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacM-0002FF-QG
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacL-0006ov-5l
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4xKW55WbzZUUTC4V0V5YkoGjBGQKM6cbuIn9hbt55U=;
 b=H4eYMtQBey57I1HUorh0psjYuuUclcUnjgovCllODQE3kkA/FOn6Qi7K1mOy+8fzcB7Nyu
 dACkeArBiMnyxm0WNR+Z1UYzm+9SCRN07fI71IeoE61lrovEEcRj2oABGXPsPaWPkziUPk
 bUasqDYiSV7YYi9NEgX2a+TRXfIAWEk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-nis30A_VM0GT0Q_Jsc0RLg-1; Mon, 30 Jan 2023 15:19:02 -0500
X-MC-Unique: nis30A_VM0GT0Q_Jsc0RLg-1
Received: by mail-ej1-f72.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso1895350ejz.15
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e4xKW55WbzZUUTC4V0V5YkoGjBGQKM6cbuIn9hbt55U=;
 b=z3RPQW0TV7Wc+jbguKh/DJByGtql4HPORiXxqFYOdDuGVkUU7ZgVQE6fz3lxIx3Qut
 tLy7w1pBWcG8Enx22/rs9XC0duO6IZfWxUILW2ChmMuuIXWEDHVZXilHSi3Ugif5by08
 HpyH6SWhzottJHcVxol0S1giTZrwZcPCvqbaW1y5Dg2QyrtqgiUV88SqqbvJTp+nc+Km
 nK/Zj+Ocm8pTojEDM1BScumpI9RydLj6m/f35AYDF1XN8Lbi4PYYU3Ti7uig9BTuiaC3
 mzPVtAiCz5mvZ+Q/wEw9ZmtiygYWyiF7pfmOzhyO9uiOOIxKhW66zae/UYwivcVLjJvy
 pxGQ==
X-Gm-Message-State: AFqh2ko67bMJ5KD/+aSf8S4x/JIGwX15rF+uzkSONpVjmizhIc+wki3T
 x/CU0UICNkUB/VjZ7zr/1hP1eCqVVcGgS5p1Clg3oMtbT8M6iNIm0wzk/wSteKesVTop+jjLNOm
 0tzEBEPfdyGZLr0+uru9rqDt803TfSQTk+VmAK6mK1j6x7c8r1Sc0pn78zycs
X-Received: by 2002:a05:6402:24a0:b0:499:b4ce:b26e with SMTP id
 q32-20020a05640224a000b00499b4ceb26emr63825440eda.40.1675109940937; 
 Mon, 30 Jan 2023 12:19:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUdQizZS4ssO/7BMoOfup5U4UvFTEjFGr5mdIkVdqozPrSjtfygTtWiusSJ3tDibPtCx+m8w==
X-Received: by 2002:a05:6402:24a0:b0:499:b4ce:b26e with SMTP id
 q32-20020a05640224a000b00499b4ceb26emr63825416eda.40.1675109940675; 
 Mon, 30 Jan 2023 12:19:00 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 ed10-20020a056402294a00b004a236384909sm3000690edb.10.2023.01.30.12.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:00 -0800 (PST)
Date: Mon, 30 Jan 2023 15:18:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 05/56] hw/acpi/acpi_dev_interface: Remove unused parameter
 from AcpiDeviceIfClass::madt_cpu
Message-ID: <20230130201810.11518-6-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The only function ever assigned to AcpiDeviceIfClass::madt_cpu is
pc_madt_cpu_entry() which doesn't use the AcpiDeviceIf parameter.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230121151941.24120-5-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi_dev_interface.h | 3 +--
 include/hw/i386/pc.h                 | 6 ++----
 hw/acpi/acpi-x86-stub.c              | 5 ++---
 hw/acpi/cpu.c                        | 3 +--
 hw/i386/acpi-common.c                | 7 +++----
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index ea6056ab92..a1648220ff 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -52,8 +52,7 @@ struct AcpiDeviceIfClass {
     /* <public> */
     void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
-    void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
-                     const CPUArchIdList *apic_ids, GArray *entry,
+    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *entry,
                      bool force_enabled);
 };
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88a120bc23..66e3d059ef 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -9,7 +9,6 @@
 #include "hw/block/flash.h"
 #include "hw/i386/x86.h"
 
-#include "hw/acpi/acpi_dev_interface.h"
 #include "hw/hotplug.h"
 #include "qom/object.h"
 #include "hw/i386/sgx-epc.h"
@@ -193,9 +192,8 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 
 /* hw/i386/acpi-common.c */
-void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry,
-                       bool force_enabled);
+void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
+                       GArray *entry, bool force_enabled);
 
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
index 3df1e090f4..d0d399d26b 100644
--- a/hw/acpi/acpi-x86-stub.c
+++ b/hw/acpi/acpi-x86-stub.c
@@ -2,9 +2,8 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/acpi-build.h"
 
-void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry,
-                       bool force_enabled)
+void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
+                       GArray *entry, bool force_enabled)
 {
 }
 
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 4e580959a2..19c154d78f 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -355,7 +355,6 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
     char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE, res_root);
     Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
-    AcpiDeviceIf *adev = ACPI_DEVICE_IF(obj);
 
     cpu_ctrl_dev = aml_device("%s", cphp_res_path);
     {
@@ -666,7 +665,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
             /* build _MAT object */
             assert(adevc && adevc->madt_cpu);
-            adevc->madt_cpu(adev, i, arch_ids, madt_buf,
+            adevc->madt_cpu(i, arch_ids, madt_buf,
                             true); /* set enabled flag */
             aml_append(dev, aml_name_decl("_MAT",
                 aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 4aaafbdd7b..52e5c1439a 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -33,9 +33,8 @@
 #include "acpi-build.h"
 #include "acpi-common.h"
 
-void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry,
-                       bool force_enabled)
+void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
+                       GArray *entry, bool force_enabled)
 {
     uint32_t apic_id = apic_ids->cpus[uid].arch_id;
     /* Flags – Local APIC Flags */
@@ -112,7 +111,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
-        adevc->madt_cpu(adev, i, apic_ids, table_data, false);
+        adevc->madt_cpu(i, apic_ids, table_data, false);
         if (apic_ids->cpus[i].arch_id > 254) {
             x2apic_mode = true;
         }
-- 
MST


