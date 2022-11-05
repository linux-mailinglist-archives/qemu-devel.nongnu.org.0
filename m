Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74B561DC7B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMq0-0000Au-I7; Sat, 05 Nov 2022 13:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMog-0007Y4-JY
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoc-0007lH-JX
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gag5gdQNNtInKGqXoAiltRUevA6HG18svJOyxzNtlVk=;
 b=frFdXi99KpVA+C+vNcAPUZfQgms9wxXeC9U1KlLDJU87ekRGMNvPJcuEAZo/iRegJgmlBI
 lKY0m5jB6dKLDvcVb6uHWIEFcQMlise+rqSc587CR3ABoA97/47+meziPxNxA4ThCRwRVg
 gHTa4y9IuQbINonvboBZBzsPV86LB4k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-mYScJbGBM525bFHwG_0nmQ-1; Sat, 05 Nov 2022 13:18:40 -0400
X-MC-Unique: mYScJbGBM525bFHwG_0nmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so4774287wmb.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gag5gdQNNtInKGqXoAiltRUevA6HG18svJOyxzNtlVk=;
 b=4AT8NtaWkhvAaf8KYHtCA1p8ywTGxkzUMfVKlHbhErm+FmgTPoTXBMbNzi8Es9yy67
 u3yxx1VLP7quCPwasOA1OXOxZpEn6PFMATVF+B6EILdPm5tobflwRKvCTkVWv/zzeY1o
 n8HLf2sQQ6Q/F3E2jp4kbnuQ6YNAuC2+NMZSsD9LNWhVay2x8oJvNvgK9GZSwObXGvzm
 RJVfco+fsFtg/vgDH/mOg3q4DUaz++pUvWvNST8S67WdeJiWl51uZ5mPLdzLITuV52/F
 VjWVfBBqAdkWYGRp9rV1OS7ZvRojCp9HDuWjbq4ghLc9qJ10fcNYrsTTXIbx+SYhcoVW
 NRvA==
X-Gm-Message-State: ACrzQf3HBY+X67MQ/O563PMqsofFtfCfQFKNVi6Rktm4T3P3xoW6CFOe
 4Jez2EnJb1OEIsaAksbhGoYrpVJGGZdxOMGSIUFn8LG7pU1uC59LUBYRuFVTMTJ1ljkAPpuLz7g
 7kply/IT92Z3/gzUlePGUyaR0O0qX3MJXBgwQU/p9GQ01qhTVHh195ugQJ74H
X-Received: by 2002:a05:6000:1c2:b0:236:6e69:db3d with SMTP id
 t2-20020a05600001c200b002366e69db3dmr25794686wrx.144.1667668719421; 
 Sat, 05 Nov 2022 10:18:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7QrEXdjfLqI57rusHcXzMVXpU9/SUgmTsaiXOs44qJFZAjR9dGlrHPiB1afgYD3KhRPplYXA==
X-Received: by 2002:a05:6000:1c2:b0:236:6e69:db3d with SMTP id
 t2-20020a05600001c200b002366e69db3dmr25794669wrx.144.1667668719159; 
 Sat, 05 Nov 2022 10:18:39 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d4b12000000b002365f326037sm3110712wrq.63.2022.11.05.10.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:38 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v3 65/81] hw/i386/acpi-build: Resolve redundant attribute
Message-ID: <20221105171116.432921-66-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

The is_piix4 attribute is set once in one location and read once in
another. Doing both in one location allows for removing the attribute
altogether.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221026133110.91828-3-shentey@gmail.com>
Message-Id: <20221028103419.93398-3-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1ebf14b899..73d8a59737 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -112,7 +112,6 @@ typedef struct AcpiPmInfo {
 } AcpiPmInfo;
 
 typedef struct AcpiMiscInfo {
-    bool is_piix4;
     bool has_hpet;
 #ifdef CONFIG_TPM
     TPMVersion tpm_version;
@@ -281,17 +280,6 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
 
 static void acpi_get_misc_info(AcpiMiscInfo *info)
 {
-    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
-    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
-    assert(!!piix != !!lpc);
-
-    if (piix) {
-        info->is_piix4 = true;
-    }
-    if (lpc) {
-        info->is_piix4 = false;
-    }
-
     info->has_hpet = hpet_find();
 #ifdef CONFIG_TPM
     info->tpm_version = tpm_get_version(tpm_find());
@@ -1334,6 +1322,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
+    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
+    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
     CrsRangeEntry *entry;
     Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
     CrsRangeSet crs_range_set;
@@ -1354,11 +1344,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
+    assert(!!piix != !!lpc);
+
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
     build_dbg_aml(dsdt);
-    if (misc->is_piix4) {
+    if (piix) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
@@ -1371,7 +1363,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
-    } else {
+    } else if (lpc) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-- 
MST


