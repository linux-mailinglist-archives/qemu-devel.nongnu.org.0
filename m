Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9563766BE84
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5D-0005Dn-Cx; Mon, 16 Jan 2023 07:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5B-0005Bb-Qv; Mon, 16 Jan 2023 07:59:25 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP59-00015l-Tf; Mon, 16 Jan 2023 07:59:25 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kt14so9011665ejc.3;
 Mon, 16 Jan 2023 04:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whT6D5WKLjFRXoHNNRzzdcMxrjsv8D/ocKlR+tR8VYk=;
 b=XkX+OIrpPq+GklrUO7/3QbL3KGbz7G2imlMNYZ1HCvonpFGllklNMMXKbQO/XjuBmw
 MFQ1R2uTl/zbI9ZWVlzJjWkSpzeYPor+fxOHuLZ05FRiWiSAZ8YX/5VHde4qa9xQ46cU
 TSj+8S0DrmgpctkdyfcGhkECfr5yD49VMqFxqLUEh6E4WON/+2YPtQF0CObBd4LCdWyk
 AIvFSA8HDeZW26SSgdxuYUSvE8VobpsRYxjjakpXwJmV6vScQ8+S90xMBhIdh5uJlnpw
 QpN1pvXsR2e7637/zA40bXejan1dheRxK9HUG//+8kCPuIFI1kC4csCIgq2YySkwTP5J
 35JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whT6D5WKLjFRXoHNNRzzdcMxrjsv8D/ocKlR+tR8VYk=;
 b=CgoYH5ftBfrwg8aCJUoBQABIlknN6j6LhNcFtjxja2o7Is9jr1q04LoKA3uJIxgHuw
 8r5yVj+2x+5J/RqQyK+H9BzNThbbuLU5se5IOtWsVy8fksCY4e3YPn5tApSh6QJZe4an
 o2MMvXh+185SYETNw4KWxWEmtMktm2oJP691AOspKQ169FDYpTEQ+v9MO4h7miskmroT
 2Dif/QPteD8mz7WRBe8BCiaPCKe49NofKLSiHVvdpTYndymvuav6Beebp5wUldz2Jx4N
 e2gZilKAWsIc8cyfB981ZqUX8uz/3SmMTOdbfx/HZplDs4ybkqAnsqRKB4pmvnuDj6Oy
 dKCA==
X-Gm-Message-State: AFqh2kprNcgxNySQo66K5Vf2belF12Y34ayokM0lhsVGGG3Ah1Bdh9G8
 mZWA7l26G/VrMqxA1FPQFNFZcs6L8wY=
X-Google-Smtp-Source: AMrXdXudXtTgDheebzsc2BLHWq2PEForiTV53281wtgsd6PSxNIuiU2YEPtuV7uZdrtoOYAaTkGZMg==
X-Received: by 2002:a17:906:39ca:b0:871:e336:cd2a with SMTP id
 i10-20020a17090639ca00b00871e336cd2amr658385eje.47.1673873961574; 
 Mon, 16 Jan 2023 04:59:21 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/8] hw/acpi/acpi_dev_interface: Remove unused parameter
 from AcpiDeviceIfClass::madt_cpu
Date: Mon, 16 Jan 2023 13:58:36 +0100
Message-Id: <20230116125842.66817-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125842.66817-1-shentey@gmail.com>
References: <20230116125842.66817-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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


