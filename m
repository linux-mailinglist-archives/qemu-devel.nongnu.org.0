Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AA761375E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:06:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJL-0005oJ-Ua; Mon, 31 Oct 2022 08:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJ1-0004iD-Gy
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIz-0003Rc-Jo
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARh2sl8Vb/DTthXngVp+HQaYKzL6p5aL6+WOaFC/kmA=;
 b=WFzTDTQs7dUMvyrWvsBtkCWDLC2qxAQ6jFRQMOHO1IiE5E9JHqCM2ibFUBc/Ike1Yz5VCy
 jvQ1kpk85pFX2zTi/3Hq3GAKhOKvKNmPe78McJW8rx/0ctCJPY1mIdPKw0ZvMhTRtDGCJZ
 LQ0vTnjSozRTldB4W9/cuiOH45X7tgU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-Sng2W0SdMhC-BOF2u2Jz9A-1; Mon, 31 Oct 2022 08:54:15 -0400
X-MC-Unique: Sng2W0SdMhC-BOF2u2Jz9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso3033560wrb.18
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARh2sl8Vb/DTthXngVp+HQaYKzL6p5aL6+WOaFC/kmA=;
 b=HCyxcceFVRX16QB0TG//g1whDsf5Np2+wev6pPq+dz2xmg7zYOKwRxO6hOvm6n3euA
 z1XhKtBokQEBfYkEDt6nrPxkmukGtT/+XtP/xJvNy8iw6a7P+vIk1jnaycPku0GkS9nG
 PaP9p42l9uDlieS9gn/AemkBLdqu8GKmFCfY+sUn4zaWCV8WRdyHpNOhY4q/WGteRD4u
 Q7VnXjlHS+fBQgxYFVAZJmmYMgHNfaeBqSbtLhA3/6xz14MhoUoRQOlCs3kPsNIa4QQB
 vR8ROF5Ot5eU6d1T+4WLCE2Fsb8dtmY+D9PLC/xlZLhuH6hd+zKwpTsO5+rfMvju4BgW
 FTZw==
X-Gm-Message-State: ACrzQf0sz7RRfKwXt31SXv9awXpcZPUEQ37QNsHMLPXzQUc2Qq2GUzqN
 73SjH7EY2t1r5kFAbxGDCnrDoZa+ayMh0MYwUF2Aw20I0BjbwVTUcUAdJHq/C07lIPcAIibV2Ei
 B33GfhqAsQasObfeyoWoYPk890f8HlsVs9SPV5lta0zBB7vrY7n+jU+FEVODZ
X-Received: by 2002:a05:600c:15c9:b0:3cf:6054:3b3b with SMTP id
 v9-20020a05600c15c900b003cf60543b3bmr10395459wmf.167.1667220854342; 
 Mon, 31 Oct 2022 05:54:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Yby+uWfyGhw1KpDZ9l7D7D8UOeewOWZBRrxXLZxfBPgcAxcOW3aDqdhK6IEnmq4pu4hQwbw==
X-Received: by 2002:a05:600c:15c9:b0:3cf:6054:3b3b with SMTP id
 v9-20020a05600c15c900b003cf60543b3bmr10395430wmf.167.1667220854027; 
 Mon, 31 Oct 2022 05:54:14 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 a21-20020a1cf015000000b003cf78aafdd7sm545292wmb.39.2022.10.31.05.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:13 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 73/86] hw/i386/acpi-build: Resolve north rather than south
 bridges
Message-ID: <20221031124928.128475-74-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


