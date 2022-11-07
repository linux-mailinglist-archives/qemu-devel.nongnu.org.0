Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37FE62036A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:11:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAyu-0004ks-AA; Mon, 07 Nov 2022 17:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAys-0004hH-Au
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyp-0007TL-TL
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gag5gdQNNtInKGqXoAiltRUevA6HG18svJOyxzNtlVk=;
 b=FdOLJhRRQ1/GEB1ffO73UUIZ+MFE8F1735EK/RB4CXtWcrz6E6v1O4DpfmcL2EfsE9bL8s
 jWcirvK3FC/C36WeoetdPGezYYfELCBzH1gzvVBrmNpP+vGwtJgjaUU30uJELF4taUUUuF
 KODekP7dvO/GuulMS1YU8S4MXcoE5Y0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-Cu4Bt2VuM4Gyq6KU57LFiw-1; Mon, 07 Nov 2022 17:52:34 -0500
X-MC-Unique: Cu4Bt2VuM4Gyq6KU57LFiw-1
Received: by mail-qk1-f198.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so11324896qko.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gag5gdQNNtInKGqXoAiltRUevA6HG18svJOyxzNtlVk=;
 b=1khNUTIbhH5pOVwn/iPHeWJLDUYooAS9LXXBtqn35JSHFKhLRwdoCXS1edNSlqdqFa
 QGJytvz5HMhBx+MZAN9FhnZDM/W+3+qGAGsnIqpCLOai5sZiaUWAyrxpQvjJnmhHHhS5
 tyn1W4kVgOekub95DvPZayP6V5KHqidbUmrfTL9vavJ5POFmIg4h/VYvXJTxPaOlG44f
 KDWuVWj3YZXtyJo1Yux+I66PbzBGYJ0OPw8QufO9i4me6IBXXhaELSQYOoyODT4E36ot
 OLorqJQt3GHfJ9eE2Lur5O5cmePttOxcsRnfAME9fXB11LbdCHgLB2XO0z9CSQO7qHI4
 4Iqg==
X-Gm-Message-State: ACrzQf0D4jscLcBBqUqSTXoL5z/moE+OLr88buDaMc01tFftNXa8dqxv
 nJWikLWNu5koszMisAQcoVvxFFv1kCvRT5RPE8903L/5EkKItPLmbgnXG/6snVNPKHIKxgC1Txi
 JqMA9bWIchqsuhW1dxyfsYbV5a8hDtNAfeFKx1AzHyfybRLCaPvntsvACBVvb
X-Received: by 2002:a0c:cb90:0:b0:4bb:a808:4485 with SMTP id
 p16-20020a0ccb90000000b004bba8084485mr48224527qvk.101.1667861553740; 
 Mon, 07 Nov 2022 14:52:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7RNAJn9GpRqPzTVfsoozKCO6KK1UD+o2ajWX1v8k01I44qlrmaV85TyUkhTKxe1rcMApbUKg==
X-Received: by 2002:a0c:cb90:0:b0:4bb:a808:4485 with SMTP id
 p16-20020a0ccb90000000b004bba8084485mr48224491qvk.101.1667861553463; 
 Mon, 07 Nov 2022 14:52:33 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05620a40ca00b006fa12a74c53sm7906317qko.61.2022.11.07.14.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:52:33 -0800 (PST)
Date: Mon, 7 Nov 2022 17:52:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v4 60/83] hw/i386/acpi-build: Resolve redundant attribute
Message-ID: <20221107224600.934080-61-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


