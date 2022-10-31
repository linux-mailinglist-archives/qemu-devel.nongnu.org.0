Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7101613700
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHa-0005TA-FG; Mon, 31 Oct 2022 08:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUH5-0002el-2u
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGs-0002Ya-7B
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=X/qx5jqOp0+OMOuCbvRlYUNqk9M6o2HTNTGlQlydnfbg+kmyf0HfiNWpUkPNeFtQpkEZhP
 NbFE8eOqOqfDNVkCaq8Mx8XnMsH5M6mQ6f0JK4Cntohv5f6EdZ+7XIawPcPS6Ocdg9hsPz
 orx+QHsde7htH8QxsKOPdSIj4olU8nk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-5uRjQDb1P_KpZPaDf-pt-g-1; Mon, 31 Oct 2022 08:52:00 -0400
X-MC-Unique: 5uRjQDb1P_KpZPaDf-pt-g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a1c3b07000000b003c5e6b44ebaso3416369wma.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4Z960VIxvzpdnrCdhzcTsEiETvQalucQByjEZaVNKQ=;
 b=LEiabeuWr8DQ5DTW9gMeOZMWHCDrTlDlF0WJRET9bpiZvcrxPTaSJX3clewDvfWwHb
 Q/3/7fBB9vW4OsHW9HI+GF0wraCw/e+V57ycO579at9lOoMWJZEry+nSK0ExXAeil793
 apjwfokb5usqA/ihrAeNJtCx+uwj4vzQn1Hs+9V4/XOJv2AwmDoIKA6XExwxc2pNc6d8
 8Woh85gGgZuxcw242Hz9Q024n9fbuNTzIdMT+aINer7OzSOAkA2Z9MRwZaVA1azAd+WR
 l3OXleBXNh9zLm460D2KRBsYYiSkC/D9Gt7fQdmQFegxDqgVU3FfVhynBoWIE3MrFZgV
 f/Aw==
X-Gm-Message-State: ACrzQf2Z1frvTBWCT7zHsrAwgEs+qcxWsX/URJ6UfupIGyKvY8hC0JcU
 rf3mA0oBnDCREquwk2tqdZyIUjpQnYIbfEn06c4c3vYy8E1Mw6p7eu6Yd5wrx36mswVPboAZXFR
 oApUF0wgqzohSPbz3ZIraYdcy4XD7rnkkoTygDS8ilg0/dKMn/watIexetnby
X-Received: by 2002:a05:600c:28ce:b0:3cf:6e78:e335 with SMTP id
 h14-20020a05600c28ce00b003cf6e78e335mr4033222wmd.142.1667220718086; 
 Mon, 31 Oct 2022 05:51:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pmxSAHRBt4UiaxtpiMHONuBkoyDg8VSVmcpUtNZ/gOj9QOFy25jFIy6shJRim4qk2HRDk0Q==
X-Received: by 2002:a05:600c:28ce:b0:3cf:6e78:e335 with SMTP id
 h14-20020a05600c28ce00b003cf6e78e335mr4033204wmd.142.1667220717817; 
 Mon, 31 Oct 2022 05:51:57 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 a15-20020a5d53cf000000b0023682011c1dsm7087511wrw.104.2022.10.31.05.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:57 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 25/86] acpi: arm/virt: madt: bump to revision 4 accordingly to
 ACPI 6.0 Errata A
Message-ID: <20221031124928.128475-26-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


