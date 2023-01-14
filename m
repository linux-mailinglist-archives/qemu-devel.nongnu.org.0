Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D366AE4F
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0K-000129-Fc; Sat, 14 Jan 2023 17:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0I-00011W-QN
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:27:58 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0H-0003hn-2I
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:27:58 -0500
Received: by mail-ej1-x632.google.com with SMTP id az20so40947975ejc.1
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whT6D5WKLjFRXoHNNRzzdcMxrjsv8D/ocKlR+tR8VYk=;
 b=WHbOBWzJAkQyMLLQfJXWSaVCt3I/O6O1uDJPg/FoGqhhPoyGkezg+TfPdlKI5SU5o+
 HzodhhNm4uCmuGEqZq57NXdTjYWOF+f8gNyr7NDPwLdF6xz9Pc1Fd0Yx8cqqTyQ/BpzG
 YddevsFgzJoN2LIlxgcUmCzXU8DUn6lEZuXf23jBnGcdsSFahNAIqA+c1PKAOwz5mSCo
 rLcpGq1PcjvlZrvyZdaApOp29RUndBooHadzGwdsqF6IYtzZJwT4RY9B8zQ9laGE8PjU
 NN4u4z3lIoHdzDSLRIN/g1Pq8WEybGJNfM4mq06FKoC59OmyfeVElWYj+xqKsmYFdIho
 hkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whT6D5WKLjFRXoHNNRzzdcMxrjsv8D/ocKlR+tR8VYk=;
 b=X57wrINiZOcaVTf2gYUgGKwJJfvUvnhZGSWpRAsiz/1r558nkNRNyy/Dza8ZbvaJbT
 VZBB+UHYoVDs21dWBkYTHrV7z/Gs9zMqsSzSZkGNr8TANaVFt1h0vckB0duhF1FYOsN6
 jmGsOsAbANt2LC47dsqJ/7oSPxcNaxEYkpBV7mFJVk3eJY9h7qYQPudoXNSqKBByCc9O
 C24w4fKKsh9ndtrCdqesqSZ4huWT5vtxIkOOpNd+LNWQmqxUygVS3fiODtRsFIJS57Q7
 /Q/QdvpDnI7PJFwhDpNHIefHML0onR3WHSZaaq+zD0ECbJ7981hKv66/kogT6ga8jTwA
 Ejrw==
X-Gm-Message-State: AFqh2kqOXbELFiHsQuAmlH4ogbIvJCu0GeMcOFHKAPD01CTjO+kt9wQH
 do0nzl6cvjRLBDKijvN1GmZSMH/tYYQ=
X-Google-Smtp-Source: AMrXdXseShLRJvcoW1cddVaMbQAVjFy8FSqQ3ggqoBzFsa0zqAjCqfs50FaeE0JoeH8LZSkEHdmVmg==
X-Received: by 2002:a17:906:5a71:b0:84d:4a2b:73b9 with SMTP id
 my49-20020a1709065a7100b0084d4a2b73b9mr18900278ejc.59.1673735275448; 
 Sat, 14 Jan 2023 14:27:55 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:27:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/7] hw/acpi/acpi_dev_interface: Remove unused parameter from
 AcpiDeviceIfClass::madt_cpu
Date: Sat, 14 Jan 2023 23:27:33 +0100
Message-Id: <20230114222738.282478-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114222738.282478-1-shentey@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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
index 9148b3a49e..c59a0acbf1 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -357,7 +357,6 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
     char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE, res_root);
     Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
-    AcpiDeviceIf *adev = ACPI_DEVICE_IF(obj);
 
     cpu_ctrl_dev = aml_device("%s", cphp_res_path);
     {
@@ -668,7 +667,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
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


