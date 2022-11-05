Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE361DC8B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:36:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqt-0000vt-UZ; Sat, 05 Nov 2022 13:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMop-0007Zo-Tw
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMon-0007m7-Bk
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARh2sl8Vb/DTthXngVp+HQaYKzL6p5aL6+WOaFC/kmA=;
 b=FPIzn5UgNA8eEJz5PtwABzFfMWA1Hxx2m65rkKRLOVka2gE4lVCqZ7PDs/Oyla1jeVpPRC
 C+wP7x3tLKF/ZMdlE+CVw6m6eZA7qeuEEXR+Ul3kOyx+mwLiiXg3cg5Y51qDy29mPjVwbX
 JTH0ciEv/hI+Kvy9DAkNWpAcny3lr20=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-aP108it1OrCJZWoCPghwdQ-1; Sat, 05 Nov 2022 13:18:43 -0400
X-MC-Unique: aP108it1OrCJZWoCPghwdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r187-20020a1c44c4000000b003c41e9ae97dso5992070wma.6
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARh2sl8Vb/DTthXngVp+HQaYKzL6p5aL6+WOaFC/kmA=;
 b=k41wNoPiPnKlQaUZ8fhOj0TudHvEOxzks3tj9h2DCdg81tr+ojixHdNNa1GtJqVh7v
 Uhr6DRIkExaQoniiHf0ak1CcVXM+9PkFfiMOb1+fBWNQRle8bLaxFS2z+JM4G53tlZ3t
 2+s8DJQ7IFdCb1xCXFR/DMRZfMraWBu3VI9L2mmROnyM9PRpn4GGQpB8L47xo1dVirLd
 SZyZY/VA9kN0VRXzwxeCoAXofl2ara8anrZNHsKq6l0Z8edDwf2E4JGBKJ2x7J+5VLKq
 gyhEhQCQ6TtN//pR7ty0otRfp9GZRg4ATETWme0+xuRKjBXiPMX2dKAOiw4YrWhkR5K8
 4F+Q==
X-Gm-Message-State: ACrzQf1Jz2CNrtu4GRDLaFJ2H3RnH88pqHiHJiK4a1rdifM9pW0rU5g7
 A2V4cl9IbIXmUbgd5NE1W7ctyXEQrPe9RK2aZOSdkZ6azxBGbKyn16qb0ot59sgGyl87offOGcX
 j536RrkLO4ED+4ZxIO11fAFdSItbiTSo0Q2ad/X7VnqOh6U6T4t5P1qiURoIX
X-Received: by 2002:a5d:51c2:0:b0:235:e6a9:b492 with SMTP id
 n2-20020a5d51c2000000b00235e6a9b492mr389610wrv.212.1667668722206; 
 Sat, 05 Nov 2022 10:18:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7oJ4Mmx9TnU/WL+KflP6lGUyno3QXY6OZzkdmCo574Onn6NmBDomx5HAbwDs0IBcDFjlJI+A==
X-Received: by 2002:a5d:51c2:0:b0:235:e6a9:b492 with SMTP id
 n2-20020a5d51c2000000b00235e6a9b492mr389600wrv.212.1667668721943; 
 Sat, 05 Nov 2022 10:18:41 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c089600b003c6bbe910fdsm7416732wmp.9.2022.11.05.10.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:41 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v3 66/81] hw/i386/acpi-build: Resolve north rather than south
 bridges
Message-ID: <20221105171116.432921-67-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
AML generation has been moved into the south bridges and since the
machines define themselves primarily through their north bridges, let's
switch to resolving the north bridges for AML generation instead. This
also allows for easier experimentation with different south bridges in
the "pc" machine, e.g. with PIIX4 and VT82xx.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221028103419.93398-4-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 73d8a59737..d9eaa5fc4d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -60,6 +60,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci-host/i440fx.h"
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
 
@@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
-    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
-    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
+    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
+    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
     CrsRangeEntry *entry;
     Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
     CrsRangeSet crs_range_set;
@@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
-    assert(!!piix != !!lpc);
+    assert(!!i440fx != !!q35);
 
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
     build_dbg_aml(dsdt);
-    if (piix) {
+    if (i440fx) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
@@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
-    } else if (lpc) {
+    } else if (q35) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-- 
MST


