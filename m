Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA02D3400
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:33:24 +0100 (CET)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjfl-0007Pl-RU
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmioH-0008G6-Po
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:38:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmioE-00063O-Tx
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rCTXiBiz0IVDGz/6PAJRoYm80wXw7KG34Wn42GEidrE=;
 b=aSJ6UGPryCGtywSKYqyl5lPzRRrOfK7cshxXlmoNvHZsyALiCMf68vmgexPeoJMYtuOito
 HGmUZlKa/kmEXEkuttO48wCVfw55NLJSLz+s1kPuQrEVtx8Fv7/AhlTkWm2g1csBQ0Zls9
 6LwO+SmdAEaDIbd3t8gJZBNCaPFYX8U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-XZCHTCZPPQWLDPgjHAjtUw-1; Tue, 08 Dec 2020 14:37:27 -0500
X-MC-Unique: XZCHTCZPPQWLDPgjHAjtUw-1
Received: by mail-wr1-f70.google.com with SMTP id o4so2933784wrw.19
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rCTXiBiz0IVDGz/6PAJRoYm80wXw7KG34Wn42GEidrE=;
 b=OfidIQTKyhT0sMoUpQHhXMT7AIJ/2mQFZdDUe/jje8ViPAUhSkldHDqrXXKQZbF/zi
 IczdZeXMCza/Ke8v/lgREVL2SlLUNRKoay6I+UVD9+xcYX4KWnblhGgGbC0jLCM2xavW
 nOHq9ByF21ptNq7oGKpo99/CkwlS9turvtz0rrXuNSd17QG8TnxzrKvrGQrXYf4fQBTE
 gWdhSO4iwJVvH1x47B+hQo4ZOf/BfQRmdi+9E6rhqksKbpBaVZXUbN4KmcQ1vSONcRCN
 PwtGpYGicjhTMueKhvq/mfGTXKWS7mAFUBTIoUL++LmYk42JPKcxT7/7oZvWvfzxShLw
 ubOw==
X-Gm-Message-State: AOAM5313EnLtqRa4ExW07xfDgcahdILA2CKg9jj88qy6IJsyGN0mEpAz
 4ce4IBon73FgBxhahbOK9Q2hgDs4H/5YMVqpHoe8wCGf+G9D8oTkCAkMcwkwuDML0kYLdx4jK99
 8CJYy57MsZBd8/hwoy12EfPxHgpDxBiWl8DHha+560t4IvaziQEWGVnQzzzXr
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr5285588wmi.162.1607456245336; 
 Tue, 08 Dec 2020 11:37:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOSZajj6ET6rigEOwmkuc1+Rd9NbBqBusEvKui1yQ4U0fBYbu8LlgARmpuSn9DlPY7lWlK2Q==
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr5285562wmi.162.1607456245049; 
 Tue, 08 Dec 2020 11:37:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 90sm22147852wrl.60.2020.12.08.11.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:24 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 60/66] x86: acpi: let the firmware handle pending "CPU remove"
 events in SMM
Message-ID: <20201208193307.646726-61-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

if firmware and QEMU negotiated CPU hotunplug support, generate
_EJ0 method so that it will mark CPU for removal by firmware and
pass control to it by triggering SMI.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index 44c9da5112..f18b71dea9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1293,6 +1293,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         CPUHotplugFeatures opts = {
             .acpi_1_compatible = true, .has_legacy_cphp = true,
             .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
+            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
-- 
MST


