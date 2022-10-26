Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A160E259
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:41:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongVv-0005x4-SR; Wed, 26 Oct 2022 09:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVr-0005wI-Ce; Wed, 26 Oct 2022 09:32:07 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVp-0007km-Qa; Wed, 26 Oct 2022 09:32:07 -0400
Received: by mail-ej1-x629.google.com with SMTP id b2so21280344eja.6;
 Wed, 26 Oct 2022 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HxXdl7oEF+i6qVetlrC96ePVGZivy2YPeOTXA2wfdQw=;
 b=djAFXNHsRZNdgTLlZZyAl1kAC9+IKkmhG7NKQLKLs/X9+/dMnE6/GJQja0d3oZEcYE
 lMT1xTVsGpm1HhaIbfWUOwWgMX10DamRGmyPEiJl9wEmQHcgJIV2GA6R+9k9GTaY5+vd
 E/mG0hlLyBzMcrKXr16jlgvac9+vmyvDLDAUwJs28YqrxT8ZnUZbCzSixUzUjCsCKWYE
 WXJSkz4RdF8qy90HN1a3OjJyMxi9nm6mhxX+TnKZPSmAHortwGlv6xyUu8fRtQrNxleO
 9w15rgx79eaeeYTlcm1u9ZOYzabQ36mdIyxz0oblBQmSwH6Hc7wsAMnDeGlnJ04lOkjL
 aqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxXdl7oEF+i6qVetlrC96ePVGZivy2YPeOTXA2wfdQw=;
 b=zz4FUT2fcOklB5kvUEhFA4DmFOT34slEuN8zcVh3vzigyR7wBiYrcy1cp7+F65D4Hu
 qc1IxWEEKJ+0FbtJzt3QE2tVtCdzNYpOmzqu4z5XeuLrweV+YDuuaJfZ5dILBHFR4FZX
 Ve/dqybf08GzkOOL3lXX4pir3MhcTVHhoLzyWjApPzPkFuTemaTaRwEBYWjDLoEh/je+
 D5YFoUzFeZ0+n8VhJhMCtSUU81+eVjzvTB4oNF0UgqKk37V4xS3ngeSv8gKUwsCRAfG/
 7IaOyxNrcDpjPYziBHDfFs0635V3mXx0/9hGkqRy6C6qHfCdwq7vqVqCjh2CBqBO9iQ+
 J9BA==
X-Gm-Message-State: ACrzQf3pMPR25qDuukMV/FSS/xwg4KHZ39R8C0MkzEUCS1OAgZn3Y6ae
 Vbma0nIaRG1HyO7JWo+8NUasfIGU5VE=
X-Google-Smtp-Source: AMsMyM7i/q8y+1ihWhoMlIXTo0Dt/petsbX3Sm/NBFwVkZ4R9sn4NnFmJCiSqwKufZYZxW+viz9C+Q==
X-Received: by 2002:a17:907:2da5:b0:78e:1208:8783 with SMTP id
 gt37-20020a1709072da500b0078e12088783mr37981670ejc.743.1666791116845; 
 Wed, 26 Oct 2022 06:31:56 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906328d00b00730b3bdd8d7sm3032524ejw.179.2022.10.26.06.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 06:31:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/4] hw/i386/acpi-build: Resolve redundant attribute
Date: Wed, 26 Oct 2022 15:31:08 +0200
Message-Id: <20221026133110.91828-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221026133110.91828-1-shentey@gmail.com>
References: <20221026133110.91828-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

The is_piix4 attribute is set once in one location and read once in
another. Doing both in one location allows for removing the attribute
altogether.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b4d9a05760..f3131fee60 100644
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
@@ -1449,6 +1437,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
+    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
+    Object *ich9 = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
     CrsRangeEntry *entry;
     Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
     CrsRangeSet crs_range_set;
@@ -1469,11 +1459,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
+    assert(!!piix != !!ich9);
+
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
     build_dbg_aml(dsdt);
-    if (misc->is_piix4) {
+    if (piix) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
@@ -1487,7 +1479,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
-    } else {
+    } else if (ich9) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-- 
2.38.1


