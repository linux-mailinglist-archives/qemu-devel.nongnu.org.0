Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DB610EA7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:36:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMiG-0006nv-Ed; Fri, 28 Oct 2022 06:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi6-0006lE-Dm; Fri, 28 Oct 2022 06:35:34 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi4-0001iX-OH; Fri, 28 Oct 2022 06:35:34 -0400
Received: by mail-ed1-x534.google.com with SMTP id a13so7288050edj.0;
 Fri, 28 Oct 2022 03:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uyFQ29muJG9K5iydquCCKJMd020oeRBjlgn0yovGN0=;
 b=oCVg5zghrptz7oIK+jW+1YAMJzmEtFmV49xaCaIfmVwA74O42vlTwo0Z96Kt54pc9m
 catXJz1KzzhwZ7BZcYySqEB6Fv1KE8DChuFnXVaoNLihlIOSaoCUrf8CpMZgf4yQt/+b
 np/gBudLsuhiVReX8d3UwBSDrfvc8A10kENlndpLUtb2YYevm9Uws4kJqFwCrdvpEK05
 Hv0XyvchNa1DGYqNuaSy+ojwjHZ/L0OsfId+0R96E3mGX2plwDRSIpAhSuaJKk8PawUB
 SIZwV1Her40g2GfO4E4oLQsXejyyVZugmWRmvn7nWp/UZmVovMx3DHsEr63qRfrC/fRu
 s6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uyFQ29muJG9K5iydquCCKJMd020oeRBjlgn0yovGN0=;
 b=384F4kW9bPotwRLxA9003Bv0DOtAlhWCb70IvD43jqo2qrPImvHCA8kwNC9jJUX/Qj
 nx0uTqsrEUMWsBd71dEbukT+wSz8MY7GpSOtx0kjyTXBasjgOJlAWMvB+tNGuFBqEP/t
 l08lJjGeQ4KZgbnZofeeu61BwK6/vma+6eSGX4/ggSIySyiKaX2o/tmPT5CSrF819ISP
 2xfzvdVxf5PzhdeNbwLuU0UlQ6rxpFwk1cRi7u8KLBEVJUFyeZMERmd0GlTul4uPzVZa
 wG6N4VgH+Syx0E5cRyMFXlU9yOzWag/vmUxstLtTUuSix2ai+/NQFy2+PiQZW51suoQN
 MeGQ==
X-Gm-Message-State: ACrzQf1/KOGFZup4GoOcn5i1OTW0GJDTE52rrrFpEzizDsdJLgg5rXQj
 qPhYk7fexB4/H1f4v+jyFg6VXvjP54Y=
X-Google-Smtp-Source: AMsMyM7/X28po9S7tKj1G3iobxzKhY8X1V1FOAw52cKKMHoeMWrqg1pyKcg3RZCfYgMNvL2/8wAh7Q==
X-Received: by 2002:a05:6402:280a:b0:461:9845:d9c9 with SMTP id
 h10-20020a056402280a00b004619845d9c9mr29033287ede.268.1666953330596; 
 Fri, 28 Oct 2022 03:35:30 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b0078128c89439sm2050527ejo.6.2022.10.28.03.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:35:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/3] hw/i386/acpi-build: Resolve redundant attribute
Date: Fri, 28 Oct 2022 12:34:18 +0200
Message-Id: <20221028103419.93398-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028103419.93398-1-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221026133110.91828-3-shentey@gmail.com>
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
2.38.1


