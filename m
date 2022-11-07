Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131E6202C3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAzD-0004vZ-RP; Mon, 07 Nov 2022 17:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAz3-0004u6-N6
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyv-0007o0-Lh
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARh2sl8Vb/DTthXngVp+HQaYKzL6p5aL6+WOaFC/kmA=;
 b=PgPIlIbNvDwVu2XpnJIZHW2znPORmRtEWZmuedEx4jUWSi0CaLH5WVMejGslbw0428rmHW
 eRV/rhGxe2d2kb6UEkJpE5YdCliAIMfbMIsnmawamIFxE3lUBF7d1sB211f3+S1LfTUdIQ
 ZMbcdOiVaELX6EQJIz5xWXr/QwC+1ts=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-fYyoyU7CPIOHFDZ2KAEdfA-1; Mon, 07 Nov 2022 17:52:39 -0500
X-MC-Unique: fYyoyU7CPIOHFDZ2KAEdfA-1
Received: by mail-qt1-f199.google.com with SMTP id
 v12-20020ac8578c000000b003a50eb13e29so9070473qta.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARh2sl8Vb/DTthXngVp+HQaYKzL6p5aL6+WOaFC/kmA=;
 b=mnQArBygiHqdYcJNT+3n62WF+ashWWwDpTjucxyvjEJ2ubeM2Fd6tMWKcXPCD2UnOG
 bFp74a2G8HcPMs5BcIIHyHhp8hzAWZDOQPJHVAPJ39x6QZ24JDo57gDYEnMxhGYUz0Cg
 xsTXxVTshGdNrUPdOrenUd9JstfLXHVhA/kFYc6CejpXFFVJVzjwzpcgqTi4kX6em4vu
 d53RuaCThUNRkclvLOeDSBF7uQjGYNOhsZiaFHXC4e7IIsXteCXey80AC/1ufGDTN4GB
 CrMVxH6s6NWuomj8pkTv1iy/xKNqmGRrzQP51VBLGktouDjBvRWAmGhvSF/QqMVzya6m
 C2PQ==
X-Gm-Message-State: ACrzQf2exxCrOxjUsaKFAnaeiJXCztlZyzCCMB+Vr3sE0Ggs2vDA2Raj
 gcoXk5WCUU8/+C9Pr9XGmTQzaRzCZbA0FhWxrtpFOWsSaeC3mBhV/Vwk1u6BNqZlCmoJ7gccvWW
 fPwJUIM/pa4bHs725x2XgiivtT5G+A8jQfTc7PS4ZzEcwekM+Wy6FEFOQ1xtx
X-Received: by 2002:a0c:9091:0:b0:4bb:5477:c22c with SMTP id
 p17-20020a0c9091000000b004bb5477c22cmr47878323qvp.85.1667861559321; 
 Mon, 07 Nov 2022 14:52:39 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4q4cUfWSrLU8FPSnE2cntuaii2KQObygl7YDyRR46ASYuAj4rUNF6O94sI5T+/LTbntgzVgQ==
X-Received: by 2002:a0c:9091:0:b0:4bb:5477:c22c with SMTP id
 p17-20020a0c9091000000b004bb5477c22cmr47878302qvp.85.1667861559064; 
 Mon, 07 Nov 2022 14:52:39 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 r16-20020ac87ef0000000b003996aa171b9sm6773520qtc.97.2022.11.07.14.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:52:38 -0800 (PST)
Date: Mon, 7 Nov 2022 17:52:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v4 61/83] hw/i386/acpi-build: Resolve north rather than south
 bridges
Message-ID: <20221107224600.934080-62-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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


