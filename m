Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE466C3DC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRQd-0001F9-8y; Mon, 16 Jan 2023 10:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQb-0001Ew-NI; Mon, 16 Jan 2023 10:29:41 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQa-00086L-2F; Mon, 16 Jan 2023 10:29:41 -0500
Received: by mail-ej1-x62d.google.com with SMTP id v6so25908016ejg.6;
 Mon, 16 Jan 2023 07:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nx0LGN3Qk/UMV0sF6tMy2QhR6Lgb61/OubAnCadihe8=;
 b=hilvT145mdSXaimttciNUjFMdDzUNtLeP851z+4Cwk7Pjb78ixX0R+6atpA1E3Tkyv
 QO1BVK4oKEz3z83rbazKiUjK5PuM/OKL2qnsFBTYO95M/Igv/gJEU7io2pN6j62nf330
 dpzOCTa5INmk6bd3NmK+Z+mJioSB1BCz8nbO58we+vraPVLng5xPiKzTRYr6MLrFFM7V
 yvNLmVTZIyp9vFqD7vY3rg/S65R9h8VyzHaHIOX9ue5LTPb02KrwxziugnDOTZLFiiuE
 KleSQfaYw3JNh+GYsK3CRRYLyBwpuvQxJcrskd2rLtFCodIUrXcMwfEVA38cKpv1FhDL
 7Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nx0LGN3Qk/UMV0sF6tMy2QhR6Lgb61/OubAnCadihe8=;
 b=KBSc3rQ1O0mqTVAhJC/QqkQX9qOx5eViyBoZFvHKgMpNCAs3cY4v2Ks6wsB9BBAeeq
 aBzSOVTyokpjf/uWR1s7CxoPyyhfb13rN3OYa7eJwenKwJJDlBVWYAqPdh0M9ERgbZ2R
 5oxpqWyPT2z/DuqfmjaTj/jDuDFq48xcAnd9Z55Z6/IP4sMh0YUBqFjz7C3RMwZm6Hu0
 2++ApqI73SPeMGyd5FzdEqGjo+acdiM0juTj6zrhKqy67/hcwUh6uyhDmweEF4M/XGap
 0KT1UF2QheEg7fYqztol5lfMURG0Ckv+I//U+QlpmsZD6cYeCsYOjBTTrFo5HhYArOn9
 juOA==
X-Gm-Message-State: AFqh2kpgSLxpXbSuYnqiWBEB/henoS4QV2dheIVX7dFyNfSxzMrQvLFl
 NpnYafbwf/lmrozXLlaAQFdBdugNquU=
X-Google-Smtp-Source: AMrXdXvyzEMVg1R9Md05ofa83Dy/JvyQpyHnGK7EjSj0dTAcviIFehySQ23iLZHPFRDQw/vrVSUWLg==
X-Received: by 2002:a17:907:34d6:b0:86f:fe8a:2f1c with SMTP id
 zy22-20020a17090734d600b0086ffe8a2f1cmr4980908ejb.35.1673882977654; 
 Mon, 16 Jan 2023 07:29:37 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906b08300b007c0688a68cbsm12180764ejy.176.2023.01.16.07.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:29:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 1/7] hw/acpi/acpi_dev_interface: Remove unused parameter
 from AcpiDeviceIfClass::madt_cpu
Date: Mon, 16 Jan 2023 16:29:02 +0100
Message-Id: <20230116152908.147275-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116152908.147275-1-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The only function ever assigned to AcpiDeviceIfClass::madt_cpu is
pc_madt_cpu_entry() which doesn't use the AcpiDeviceIf parameter.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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
index 991f905f5d..a0647165d1 100644
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
2.39.0


