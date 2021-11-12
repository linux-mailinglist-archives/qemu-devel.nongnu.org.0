Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D144E570
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:13:17 +0100 (CET)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUUe-0000z2-4r
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUSq-0006N3-CD
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUSo-0006c1-N5
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pS+4xDNcZYt4ikFpHqXiWgz0JzNTvY4QfS51TJN1NBk=;
 b=SoqICLYWgAS4jq/ZZNRvxKc16uxyW+HLcBItAzni7/BfmyzD+mff9PLJ3brtI04ymknQ39
 a3pN3EOmeITziTKSVFKOuz0+THRz9PXKOxxK5eMFQ3BOWb50So0VsyTc/k9jgt9FmPn2zV
 BS/WRaL8m/0G5GnMkD3++rP+l8l3x+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-tKR00HBeOPSNwLvZA1940Q-1; Fri, 12 Nov 2021 06:11:18 -0500
X-MC-Unique: tKR00HBeOPSNwLvZA1940Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF7FBAF8B;
 Fri, 12 Nov 2021 11:11:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CB9F5C1C5;
 Fri, 12 Nov 2021 11:11:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v3 4/5] hw/i386/acpi-build: Deny control on PCIe
 Native Hot-plug in _OSC
Date: Fri, 12 Nov 2021 06:08:56 -0500
Message-Id: <20211112110857.3116853-5-imammedo@redhat.com>
In-Reply-To: <20211112110857.3116853-1-imammedo@redhat.com>
References: <20211112110857.3116853-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: ani@anisinha.ca, mapfelba@redhat.com, jusual@redhat.com, kraxel@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

There are two ways to enable ACPI PCI Hot-plug:

        * Disable the Hot-plug Capable bit on PCIe slots.

This was the first approach which led to regression [1-2], as
I/O space for a port is allocated only when it is hot-pluggable,
which is determined by HPC bit.

        * Leave the HPC bit on and disable PCIe Native Hot-plug in _OSC
          method.

This removes the (future) ability of hot-plugging switches with PCIe
Native hotplug since ACPI PCI Hot-plug only works with cold-plugged
bridges. If the user wants to explicitely use this feature, they can
disable ACPI PCI Hot-plug with:
        --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off

Change the bit in _OSC method so that the OS selects ACPI PCI Hot-plug
instead of PCIe Native.

[1] https://gitlab.com/qemu-project/qemu/-/issues/641
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - (mst)
      * drop local hotplug var and opencode it
      * rename acpi_pcihp parameter to enable_native_pcie_hotplug
        to reflect what it actually does

tested:
  with hotplugging nic into 1 root port with seabios/ovmf/Fedora34
  Windows tested only with seabios (using exiting images)
  (installer fails to install regardless on bios)
---
 hw/i386/acpi-build.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a3ad6abd33..a99c6e4fe3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(table, scope);
 }
 
-static Aml *build_q35_osc_method(void)
+static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
 {
     Aml *if_ctx;
     Aml *if_ctx2;
@@ -1359,8 +1359,10 @@ static Aml *build_q35_osc_method(void)
     /*
      * Always allow native PME, AER (no dependencies)
      * Allow SHPC (PCI bridges can have SHPC controller)
+     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
      */
-    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+    aml_append(if_ctx, aml_and(a_ctrl,
+        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
 
     if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
     /* Unknown revision */
@@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, build_q35_osc_method());
+        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
             aml_append(sb_scope, build_q35_dram_controller(&mcfg));
@@ -1565,7 +1567,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-                aml_append(dev, build_q35_osc_method());
+
+                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
+                aml_append(dev, build_q35_osc_method(true));
             } else {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
-- 
2.27.0


