Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E12D1347
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:12:45 +0100 (CET)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHFs-00078h-SL
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHBG-0002B7-Rv
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:07:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHBF-0002j2-4u
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607350076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JiikAGjxKlfjM9xswts2oNechk9jWBkH4vly4tbD/4=;
 b=eirNYGcMUcnLN6m4Gs0Me/zJqhDXR19C/9kx8zB2irvDaiV50890/urHEoMtxlJgbijpd0
 TObEdu98d2oFShjPJ+gJ9PoyodyUz2wsfaoP/AMlbIEKE804qi8o+eYGArJV7VL8WLA8YC
 NQrOAghgX+UWHTAGVXybhvzsynW9n9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-0Dhlg-neMQehpUJ3E_esqw-1; Mon, 07 Dec 2020 09:07:53 -0500
X-MC-Unique: 0Dhlg-neMQehpUJ3E_esqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A204C8144E0;
 Mon,  7 Dec 2020 14:07:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A35CF10016FF;
 Mon,  7 Dec 2020 14:07:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] x86: acpi: let the firmware handle pending "CPU
 remove" events in SMM
Date: Mon,  7 Dec 2020 09:07:36 -0500
Message-Id: <20201207140739.3829993-6-imammedo@redhat.com>
In-Reply-To: <20201207140739.3829993-1-imammedo@redhat.com>
References: <20201207140739.3829993-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if firmware and QEMU negotiated CPU hotunplug support, generate
_EJ0 method so that it will mark CPU for removal by firmware and
pass control to it by triggering SMI.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - drop reserved bit before CPU_FW_EJECT_EVENT field, otherwise
    AML will point to bit #5 instead on intended bit #4
    (Ankur Arora <ankur.a.arora@oracle.com>)
---
 include/hw/acpi/cpu.h |  1 +
 hw/acpi/cpu.c         | 14 ++++++++++++--
 hw/i386/acpi-build.c  |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index d71edde456..999caaf510 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -51,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
 typedef struct CPUHotplugFeatures {
     bool acpi_1_compatible;
     bool has_legacy_cphp;
+    bool fw_unplugs_cpu;
     const char *smi_path;
 } CPUHotplugFeatures;
 
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 1293204438..6350caa765 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -342,6 +342,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_INSERT_EVENT  "CINS"
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
+#define CPU_FW_EJECT_EVENT "CEJF"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     hwaddr io_base,
@@ -394,7 +395,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));
         /* initiates device eject, write only */
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
-        aml_append(field, aml_reserved_field(4));
+        /* tell firmware to do device eject, write only */
+        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
+        aml_append(field, aml_reserved_field(3));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -429,6 +432,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
         Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
         Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
+        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
 
         aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
         aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
@@ -471,7 +475,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
-            aml_append(method, aml_store(one, ej_evt));
+            if (opts.fw_unplugs_cpu) {
+                aml_append(method, aml_store(one, fw_ej_evt));
+                aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
+                           aml_name("%s", opts.smi_path)));
+            } else {
+                aml_append(method, aml_store(one, ej_evt));
+            }
             aml_append(method, aml_release(ctrl_lock));
         }
         aml_append(cpus_dev, method);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9036e5594c..475e76f514 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1586,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         CPUHotplugFeatures opts = {
             .acpi_1_compatible = true, .has_legacy_cphp = true,
             .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
+            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
-- 
2.27.0


