Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F21E294F1A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 16:54:12 +0200 (CEST)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVFVD-0003cD-Dn
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 10:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVFQW-0006at-NF
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVFQU-0006mn-0w
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603291756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nSxZT2xk1YhiojHLxRheQ1w2vOMqxUcykNd1t8Cfzc=;
 b=FcWpkRKlxHSMAO6Kyez+5V+VcZDwhPXvmxCQUYqpUHKxK01EqSJiJu2JkW3NmBYJ9FSWae
 aeAtqTnFcQO3hVAxz8nlrFTjpGb8tbegbJwPlQy4daNOYpTpLk7qqjaGQjTweRO3tJWuUs
 hYy2xN9VeuXeHwjFA+Zw2V4gXd8b/GM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-NnIn8J3mNA276Q7aJyy1Vg-1; Wed, 21 Oct 2020 10:49:14 -0400
X-MC-Unique: NnIn8J3mNA276Q7aJyy1Vg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE410425EC;
 Wed, 21 Oct 2020 14:48:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D3CE6EF6B;
 Wed, 21 Oct 2020 14:48:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 40E8C9D0F; Wed, 21 Oct 2020 16:48:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/17] microvm: set pci_irq_mask
Date: Wed, 21 Oct 2020 16:48:39 +0200
Message-Id: <20201021144852.16665-5-kraxel@redhat.com>
In-Reply-To: <20201021144852.16665-1-kraxel@redhat.com>
References: <20201021144852.16665-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 22:12:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Makes sure the PCI interrupt overrides are added to the
APIC table in case PCIe is enabled.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20201016113835.17465-5-kraxel@redhat.com
---
 hw/i386/acpi-microvm.c | 2 +-
 hw/i386/microvm.c      | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index f16f2311955c..8e2d2b7cff83 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -196,7 +196,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), false);
+                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->pci_irq_mask != 0);
 
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 68a7f424acf9..c60ba4e840b0 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -210,6 +210,12 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         mms->gpex.ecam.size   = PCIE_ECAM_SIZE;
         mms->gpex.irq         = PCIE_IRQ_BASE;
         create_gpex(mms);
+        x86ms->pci_irq_mask = ((1 << (PCIE_IRQ_BASE + 0)) |
+                               (1 << (PCIE_IRQ_BASE + 1)) |
+                               (1 << (PCIE_IRQ_BASE + 2)) |
+                               (1 << (PCIE_IRQ_BASE + 3)));
+    } else {
+        x86ms->pci_irq_mask = 0;
     }
 
     if (mms->pic == ON_OFF_AUTO_ON || mms->pic == ON_OFF_AUTO_AUTO) {
-- 
2.27.0


