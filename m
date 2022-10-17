Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7CE600C7A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:32:33 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNQ8-0005iS-D1
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNG3-0005c5-4H
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNG1-0002ks-Jt
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4VNBT3uULaHIsMMouJP1APykVaS1lWIj1144jVPtFS8=;
 b=VaXBktMOJ/mgrvXPHdREn8495rvTnaCDXGlgQ/DWsbZdCxeV1un3SSIJg+9p6ggvgzmKih
 VpjJAU+ssqY69benSSIDGUiNOoR+J/CcGBemEVV/Zh407Nqy4uU1dqCAEiR1pioytnsT+s
 mA1gGrFydqPhDPozBuEj4XxL9DrPwZY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-IRsaXQr0OnOkt9qWL9YvBA-1; Mon, 17 Oct 2022 06:22:01 -0400
X-MC-Unique: IRsaXQr0OnOkt9qWL9YvBA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E57A38173D8;
 Mon, 17 Oct 2022 10:22:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFDA492B06;
 Mon, 17 Oct 2022 10:22:00 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 07/11] acpi: enumerate SMB bridge automatically along with
 other PCI devices
Date: Mon, 17 Oct 2022 12:21:42 +0200
Message-Id: <20221017102146.2254096-8-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

to make that happen (bridge sits at _ADR: 0x001F0003),
relax PCI enumeration logic to include devices with *function* > 0
if device has something to say about itself (i.e. has build_dev_aml
callback set).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e1483bb11a..916343d8d6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -448,9 +448,10 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             /*
              * allow describing coldplugged bridges in ACPI even if they are not
              * on function 0, as they are not unpluggable, for all other devices
-             * generate description only for function 0 per slot
+             * generate description only for function 0 per slot, and for other
+             * functions if device on function provides its own AML
              */
-            if (func && !bridge_in_acpi) {
+            if (func && !bridge_in_acpi && !get_dev_aml_func(DEVICE(pdev))) {
                 continue;
             }
         } else {
@@ -1319,25 +1320,6 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
     return method;
 }
 
-static void build_smb0(Aml *table, int devnr, int func)
-{
-    Aml *scope = aml_scope("_SB.PCI0");
-    Aml *dev = aml_device("SMB0");
-    bool ambiguous;
-    Object *obj;
-    /*
-     * temporarily fish out device hosting SMBUS, build_smb0 will be gone once
-     * PCI enumeration will be switched to call_dev_aml_func()
-     */
-    obj = object_resolve_path_type("", TYPE_ICH9_SMB_DEVICE, &ambiguous);
-    assert(obj && !ambiguous);
-
-    aml_append(dev, aml_name_decl("_ADR", aml_int(devnr << 16 | func)));
-    call_dev_aml_func(DEVICE(obj), dev);
-    aml_append(scope, dev);
-    aml_append(table, scope);
-}
-
 static void build_acpi0017(Aml *table)
 {
     Aml *dev, *scope, *method;
@@ -1440,9 +1422,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_q35_pci0_int(dsdt);
-        if (pcms->smbus) {
-            build_smb0(dsdt, ICH9_SMB_DEV, ICH9_SMB_FUNC);
-        }
     }
 
     if (misc->has_hpet) {
-- 
2.31.1


