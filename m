Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C861DCAA
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:50:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpP-0007q4-WA; Sat, 05 Nov 2022 13:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmr-0006fB-5l
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmm-0007Nd-Ew
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=LjoZgLrjHD69L1Y4+JoPKVos31ZiVuPlezLfX2VnGxKA1tvcIri3fETefwIpnZco0oWhE0
 W9CvXRAQrhQ+uLchIhNujraZyCvNPXec8gTaUzGoN6+s7Wk9xbI9NStudxPJkDU1OTVB7/
 ZUbWswHrI1eWuN4TXfebinCVR4F923g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-kn_GrvwXOT6_vFXQGfZkgw-1; Sat, 05 Nov 2022 13:16:42 -0400
X-MC-Unique: kn_GrvwXOT6_vFXQGfZkgw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso3839087wmb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=KEIZCsXIHYNe5tqtAk+T2PzoyolDRUonOEK9HSq8RMesX/JSnkKwKxc9qRZCZguOST
 hIo9Ep6ZMsITHiBBCpYODEgZ4kT67PIyBP6jUefjrknQsLX1gWO2zYBuuP1dTu/SgWTm
 dC8v6ZlA5eml6X/zpgfS2AXn169xiBmcEmCXv+48cLIKYXM2b3LSxJhr2XULgRpNcKrc
 rMdJclCBSutgUD18ge7OOMZueTGFXMbZh/QnCEMbz2+vPeW8U5bs9i0AbsFxbgPFTy1Q
 87Agh53LnKu1sRzndUH3d/L9lrkp00bNeJQxjl1jexhzZ4zIHotVYCbpW/u6GPgTJ4Zt
 ZXZQ==
X-Gm-Message-State: ACrzQf14lWleKnNiqS8b8EbjY0qZSlVz1J36lLTWfuJQFQp3v+Hae/Iy
 YtsxiTbbLUB3wylowVtxQIjQMOXMfByPLbVBsacFg+yPlaUDzP5zDFLXDoi2DiRsf9yYO2W0Eft
 VocdPVAeRs+RfdxTZZY/fiadeOqLZrzuDwvTbFS9Ehsqj4WxwL1qqzZt4lg/O
X-Received: by 2002:a7b:ce02:0:b0:3c6:c796:1071 with SMTP id
 m2-20020a7bce02000000b003c6c7961071mr395470wmc.138.1667668600567; 
 Sat, 05 Nov 2022 10:16:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6TZZa0+NSAsP2i0CfY/R+eCQkjs7ugO3oKA8EHIGUDltWFfZUYcOUT7H+w3/kFymWjbsrLGQ==
X-Received: by 2002:a7b:ce02:0:b0:3c6:c796:1071 with SMTP id
 m2-20020a7bce02000000b003c6c7961071mr395461wmc.138.1667668600245; 
 Sat, 05 Nov 2022 10:16:40 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003a3170a7af9sm3118883wme.4.2022.11.05.10.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:39 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v3 24/81] acpi: arm/virt: madt: bump to revision 4 accordingly
 to ACPI 6.0 Errata A
Message-ID: <20221105171116.432921-25-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Miguel Luis <miguel.luis@oracle.com>

MADT has been updated with the GIC Structures from ACPI 6.0 Errata A
and so MADT revision and GICC Structure must be updated also.

Fixes: 37f33084ed2e ("acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table")

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221011181730.10885-4-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e5377744f3..da9e41e72b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -685,7 +685,7 @@ build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 };
 
 /*
- * ACPI spec, Revision 5.1 Errata A
+ * ACPI spec, Revision 6.0 Errata A
  * 5.2.12 Multiple APIC Description Table (MADT)
  */
 static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
@@ -704,7 +704,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
-    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
     acpi_table_begin(&table, table_data);
@@ -739,7 +739,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         /* 5.2.12.14 GIC Structure */
         build_append_int_noprefix(table_data, 0xB, 1);  /* Type */
-        build_append_int_noprefix(table_data, 76, 1);   /* Length */
+        build_append_int_noprefix(table_data, 80, 1);   /* Length */
         build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
         build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
@@ -759,6 +759,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
         /* MPIDR */
         build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
+        /* Processor Power Efficiency Class */
+        build_append_int_noprefix(table_data, 0, 1);
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 3);
     }
 
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
@@ -770,12 +774,6 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
 
         if (its_class_name() && !vmc->no_its) {
-            /*
-             * FIXME: Structure is from Revision 6.0 where 'GIC Structure'
-             * has additional fields on top of implemented 5.1 Errata A,
-             * to make it consistent with v6.0 we need to bump everything
-             * to v6.0
-             */
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
-- 
MST


