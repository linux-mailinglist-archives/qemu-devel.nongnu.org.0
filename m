Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB860E25A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:41:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongVx-00064g-GQ; Wed, 26 Oct 2022 09:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVs-0005x1-Mt; Wed, 26 Oct 2022 09:32:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVp-0007kx-Rq; Wed, 26 Oct 2022 09:32:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id a67so41441511edf.12;
 Wed, 26 Oct 2022 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxDRbgVA64cXKgk3YgNb+L46+FS+6e7D3e8U1RBDU4w=;
 b=FV0NkI61Kgpnj3y5oi2vS+Fv0pXbnA+9ZovE5nlZZJ4rXejV9SR8SgZz+utXqjtQr0
 x2LP03EdPHwpk3UpP/0SdzCmlYjKWcI1WRd8P9E9ViYeCiJtXdvJpskmboL4CiQvbNb9
 Jv8h84R3vF1baKuBQar+/sBQxsoVlVwPz57ar4s/AzLuKGoAfv8cnj0UU0iNQ4ID5fQE
 52wI7qa/qJddgm/BwHJYEdpM9el+UeLZeZ/XeshdLOPryFHMHLjd6yZffQ8uINqqsjHq
 j3AM1jCwb3cIxy7na0gbf164ctGJKkePCq68UsYorPOkF3V0ye4tlVerG59by3eJx3pj
 i8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxDRbgVA64cXKgk3YgNb+L46+FS+6e7D3e8U1RBDU4w=;
 b=dKRwuEUxunKnZHmrCjhhxl788ah/V3RhId+mEdvBqK9M5N/77BpfjI4nOhk+PM3DND
 424NPmnmZ+JyYJUxEBuvhZCVzvkFYOBOvt6z6WSb8SHrFi0QgSbUQCFS2jVTmzFxin/O
 AkH6O5aT62Y+9y9CLnMb/Q0qMe9FfUiIETCJbrsCs6sGc+wLk8mV+6M4D4+MzA80M3kn
 axM5BhLTQ9l9xF3siE46r0nCX3LqMQjWWOJ3yt0GnZ4PdcXTz/5HSVpL7xNqTkVYfHFv
 itOfwOmX2EPgfaRJ5CUJT47G7GD75wTIv429pp1yeOph+8V+dWHtsPvuafVAy0zd7D0I
 xtSw==
X-Gm-Message-State: ACrzQf08VscCFwohUlMQOSaOKVZnHO3+wW2iURDIl8F6y4UpgIL71dF9
 lyj9eRZelJ6W5bhro9FMD8IzZFt7Eds=
X-Google-Smtp-Source: AMsMyM4Rh6YSxzRrJC3z7r81u6bNfmpQ19kabqvR1fmbTwSikVHb9p/ztJS8nzT1qkVnI7aC3NHc6g==
X-Received: by 2002:a05:6402:1e8d:b0:454:79a9:201f with SMTP id
 f13-20020a0564021e8d00b0045479a9201fmr41615767edf.176.1666791119070; 
 Wed, 26 Oct 2022 06:31:59 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906328d00b00730b3bdd8d7sm3032524ejw.179.2022.10.26.06.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 06:31:58 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/4] hw/i386/acpi-build: Generate AML for north and south
 bridges separately
Date: Wed, 26 Oct 2022 15:31:10 +0200
Message-Id: <20221026133110.91828-5-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221026133110.91828-1-shentey@gmail.com>
References: <20221026133110.91828-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. This is
slightly confusing when trying to understand the code. Split north and
south bridge code to communicate which piece of code assumes which type
of bridge.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f0a20c8b21..8fbe223d08 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -60,6 +60,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci-host/i440fx.h"
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
 
@@ -1437,6 +1438,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
+    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
+    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
     Object *piix = object_resolve_type_unambiguous(TYPE_PIIX3_PCI_DEVICE);
     Object *ich9 = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
     CrsRangeEntry *entry;
@@ -1459,13 +1462,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
+    assert(!!i440fx != !!q35);
     assert(!!piix != !!ich9);
 
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
     build_dbg_aml(dsdt);
-    if (piix) {
+    if (i440fx) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
@@ -1473,13 +1477,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
-
-        build_piix4_isa_bridge(dsdt);
-        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
-            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
-        }
-        build_piix4_pci0_int(dsdt);
-    } else if (ich9) {
+    } else if (q35) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
@@ -1518,7 +1516,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
 
         aml_append(dsdt, sb_scope);
+    }
 
+    if (piix) {
+        build_piix4_isa_bridge(dsdt);
+        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
+        }
+        build_piix4_pci0_int(dsdt);
+    } else if (ich9) {
         build_q35_isa_bridge(dsdt);
         if (pm->pcihp_bridge_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
-- 
2.38.1


