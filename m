Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803161686D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJG-0004Lq-DG; Wed, 02 Nov 2022 12:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJ5-0003ig-Ka
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJ3-0002S9-K8
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=iCoQCUTxX4J6nRiIGkubEQbA32LIOzcdrkUjabllz70PWJnd7HwtIsfK4HPe0w5Tb45ETv
 dqEyVqPrZ6oxF274zCB3/fmJu+hJ9PJxBt5HofrRYPeHpobJsRQDMTPFxrXcX8YAexQEOw
 S4A8zCyFNbSwgEQiz+b0KhQASj8lruw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-lG8Knx9sM6yUTHTdIIi3_w-1; Wed, 02 Nov 2022 12:09:30 -0400
X-MC-Unique: lG8Knx9sM6yUTHTdIIi3_w-1
Received: by mail-wr1-f71.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so5055148wra.23
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=Ul2cTX+n6WtcYdPYQL+u7BqBFiMSelYw5FNOXJrd19i/+mEQ+UWWiXEU9J45296scz
 uMuT2L2KjSuVsb3P2Kd0qQNyyqbNs5im7aa51Gq3kZQ/ygRdEu70MtJzAb6dTvRhjNaY
 ihMA7eHeQ0xz8ucdfWdWZFFJIvNA7ro+vDWfPcrzgg2RVuu6kiUBLzLpudSCIzvfNbU6
 Xkczy3v150+pwzMjvMTLiD8ZZ79oriBT4a8nvhBddsOGfSOuT5GnfwYVywrSCTPEDGrG
 +eoZ71v5ZuTPFqk1fXJtq1D40HAVoGVOMqiqR1I/nNSRdkiQOCQIHoKGzk4oz7KXUhJZ
 xdgA==
X-Gm-Message-State: ACrzQf36IWVx4DV5yfpULWH9D9HnMhzbTc3K7S7RWdD96UF/OBkaYNgN
 yMrwSDMjF7DYiptmO5QOlm4UvX+rNJn88R0TVL4s0Axj4uco9D+Evi+xWPlZ/IY4AHffkDke+tQ
 DyDtsMrjp8ebnAC+zmWeWveFPbIeRMpC5WdsxqHP0qbxQcB5jc3TbhzaEapuU
X-Received: by 2002:a7b:cd07:0:b0:3cf:71b7:7a32 with SMTP id
 f7-20020a7bcd07000000b003cf71b77a32mr10943151wmj.202.1667405369214; 
 Wed, 02 Nov 2022 09:09:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+9B5S+eQlGHsYXMWbS+xgraZRUuXMaSnOZtl2FRgPnfqE6lJdQ46ZQuUM/5ybmZTxLwnQVw==
X-Received: by 2002:a7b:cd07:0:b0:3cf:71b7:7a32 with SMTP id
 f7-20020a7bcd07000000b003cf71b77a32mr10943128wmj.202.1667405368921; 
 Wed, 02 Nov 2022 09:09:28 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t12-20020a7bc3cc000000b003cf66a2d433sm2374176wmj.33.2022.11.02.09.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:28 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL v2 24/82] acpi: arm/virt: madt: bump to revision 4 accordingly
 to ACPI 6.0 Errata A
Message-ID: <20221102160336.616599-25-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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


