Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6CF44BB53
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:39:54 +0100 (CET)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgKv-00039d-QZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:39:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgDO-000362-Rn
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgDM-0005B1-U0
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636522324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cr401o/cZcjiBG72QYcFoeOXEjnmy6xACe3yRA95Wwc=;
 b=KupW7Do1XSsoggJ9gc7dGlqogJd4GU4Iqf3b4Qfxsi3tiVG9jVVx4RaCsCsMz6Mfjd8/k1
 /xBjxTaJtCBglhGjGs3uUo4Hfj7mix0ihSHh0oAUyxKuvxpW5l2HngnyuB1lvSj9ibq3w8
 E0pF+r5sXupEKkDBQY86J1K1h8fV7oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-oMJuFaNKOge7Gemj-nDwvA-1; Wed, 10 Nov 2021 00:32:03 -0500
X-MC-Unique: oMJuFaNKOge7Gemj-nDwvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BC6B1808308;
 Wed, 10 Nov 2021 05:32:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F07765D9CA;
 Wed, 10 Nov 2021 05:31:42 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/i386/acpi-build: Deny control on PCIe Native Hot-plug
 in _OSC
Date: Wed, 10 Nov 2021 06:30:13 +0100
Message-Id: <20211110053014.489591-5-jusual@redhat.com>
In-Reply-To: <20211110053014.489591-1-jusual@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/i386/acpi-build.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a3ad6abd33..a2f92ab32b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(table, scope);
 }
 
-static Aml *build_q35_osc_method(void)
+static Aml *build_q35_osc_method(bool acpi_pcihp)
 {
     Aml *if_ctx;
     Aml *if_ctx2;
@@ -1345,6 +1345,7 @@ static Aml *build_q35_osc_method(void)
     Aml *method;
     Aml *a_cwd1 = aml_name("CDW1");
     Aml *a_ctrl = aml_local(0);
+    const uint64_t hotplug = acpi_pcihp ? 0x1E : 0x1F;
 
     method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
     aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
@@ -1359,8 +1360,9 @@ static Aml *build_q35_osc_method(void)
     /*
      * Always allow native PME, AER (no dependencies)
      * Allow SHPC (PCI bridges can have SHPC controller)
+     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
      */
-    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+    aml_append(if_ctx, aml_and(a_ctrl, aml_int(hotplug), a_ctrl));
 
     if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
     /* Unknown revision */
@@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, build_q35_osc_method());
+        aml_append(dev, build_q35_osc_method(pm->pcihp_bridge_en));
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
+                aml_append(dev, build_q35_osc_method(false));
             } else {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
-- 
2.31.1


