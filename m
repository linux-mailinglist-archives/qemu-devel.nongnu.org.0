Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48676676719
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:21:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFf0-00027g-ID; Sat, 21 Jan 2023 10:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFey-000258-CQ; Sat, 21 Jan 2023 10:20:00 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFew-0005ej-I3; Sat, 21 Jan 2023 10:20:00 -0500
Received: by mail-ej1-x636.google.com with SMTP id u19so20743603ejm.8;
 Sat, 21 Jan 2023 07:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOOGokVY46q32OBGRjm7qxWhNUmvSaTbbMhc+Q0cxVE=;
 b=pBtcZ6Y/EqQczKJojjt6PHQcZRuc29omxPfx9w/ixED19uxG9/Eg5OwJdQEyXR8ZiB
 2vmA4otmIPJMnn2p/opANCNKl5Hh5JxDduPvBR2jSg0EL14tFERWe5uMeVY7MWZBFI9+
 ru3My3JIKg4p5ehSb+VmPJpShy7LpWRJmRqvDdO0LJeuphVMcYol2Z8WjEan97jzspcW
 vrTH8iOAcDJIZe9aO2zTLZ+hc9xAMyDvcRStXBrUAtYJoolUmsmLCBOarVByd7we4a8p
 hPFQjbrytAfi0jkBe6aAwlJNsW5RfCn7mIVLleYPGLncDGefTN5U7UpOtGMXl97T1Q5u
 ygSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sOOGokVY46q32OBGRjm7qxWhNUmvSaTbbMhc+Q0cxVE=;
 b=58JU3AxxLcQgcGGHYPItjppbWe7veBb/ylKGLXVneaBy+bprq7wnsHObgolz8nX1DU
 JAp+C1KPflGjBriNnZQfG41sJtF1allKog2SYsmdwSAjWUiL4jhJ7/vOlcHbdD3nF8YG
 aaVWW0SlzDyjtvUwE5uVE4zUMI9n8LtJWrlaDvQTys70yYsu/ZekpKH87+EbvKPE3i9m
 2wZV4ltT61qSJA2J5J5+ZWToUBiBDyLEAG2nZwf3xfPzyn9xH39pbS62DPhfTFzOnDnX
 fFHuFHTfrUeyUMqrTY8q4nc7ZyWQj63Rzc1yXB58HNHxKHxU20d+l85ktOtHnRc28aRF
 oD0w==
X-Gm-Message-State: AFqh2kr5Ub/KCBjyqjl8nk9ZWzJNSLG9SrFvnBDE8otDZRyb4eZrsQHc
 baRWZWhJa0oFWW1C4CvQ9dMH4rLAM/A72A==
X-Google-Smtp-Source: AMrXdXsvDBLGou33q0VDfjOaqDFb94Y7dAyTe6xodFJPKijf9DmZij9wMn4PJObZTWsxqQ6y+OlIMg==
X-Received: by 2002:a17:906:af6e:b0:7c1:5b5e:4d78 with SMTP id
 os14-20020a170906af6e00b007c15b5e4d78mr15373653ejb.51.1674314397278; 
 Sat, 21 Jan 2023 07:19:57 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:19:56 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 4/7] hw/acpi/acpi_dev_interface: Remove unused parameter
 from AcpiDeviceIfClass::madt_cpu
Date: Sat, 21 Jan 2023 16:19:38 +0100
Message-Id: <20230121151941.24120-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
2.39.1


