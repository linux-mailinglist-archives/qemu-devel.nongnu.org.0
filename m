Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF032CF4A2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 20:21:13 +0100 (CET)
Received: from localhost ([::1]:37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klGdj-0004N9-Nb
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 14:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEc2-0007M6-Mm
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEbJ-0006g1-0l
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/Nl+WZ4XT1oU5mwwz7qPDiqZIQr41q/DtWn8exps3U=;
 b=hf7dua/v5xLIR37BOo302+65UPtHHABN7FGOA8Ke7vw/uiGNT4diSqm65ZnPpHxrYllV++
 oj9ptya1AQbaeWq5Y2htJyBa4JUFUKuYWl8OY5LxLDKdk+Gbyq98CXTH6oOBN4yEZj9qEB
 RTH4HKo7SP5TN5Bw2uXndv1NebtNLdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-gFoAKXhNO1OT3hvCKFDX_g-1; Fri, 04 Dec 2020 12:09:53 -0500
X-MC-Unique: gFoAKXhNO1OT3hvCKFDX_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EEA8015FA;
 Fri,  4 Dec 2020 17:09:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEE30620D7;
 Fri,  4 Dec 2020 17:09:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] x86: acpi: let the firmware handle pending "CPU remove"
 events in SMM
Date: Fri,  4 Dec 2020 12:09:36 -0500
Message-Id: <20201204170939.1815522-6-imammedo@redhat.com>
In-Reply-To: <20201204170939.1815522-1-imammedo@redhat.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/hw/acpi/cpu.h |  1 +
 hw/acpi/cpu.c         | 15 +++++++++++++--
 hw/i386/acpi-build.c  |  1 +
 3 files changed, 15 insertions(+), 2 deletions(-)

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
index 811218f673..bded2a837f 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -341,6 +341,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_INSERT_EVENT  "CINS"
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
+#define CPU_FW_EJECT_EVENT "CEJF"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     hwaddr io_base,
@@ -393,7 +394,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));
         /* initiates device eject, write only */
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
-        aml_append(field, aml_reserved_field(4));
+        aml_append(field, aml_reserved_field(1));
+        /* tell firmware to do device eject, write only */
+        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
+        aml_append(field, aml_reserved_field(2));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -428,6 +432,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
         Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
         Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
+        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
 
         aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
         aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
@@ -470,7 +475,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
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


