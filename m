Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC6290445
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:45:40 +0200 (CEST)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTOB1-00043M-Fx
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO4V-00078H-Iy
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO4Q-0001aR-Pi
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGXqb9BFfnNurtzC/viU+q+85XiIE1npzvkhDdWHjL8=;
 b=h8OrqzGgMSamTcZkvPt6YqvzGBySEVq/CG2LJufafF9KydZB4SXb/JrSLZ4O+5UF+3ACL7
 Y/Sho0eGtzjDLJT9C2uHq6XooksaJ+gc8SRO5g2xaU//efBQdeB9Ui49Gk15Kb8ynd8sbR
 E3MjMDGludKeoJwljBsAd0HKJ5ZMlTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-c1vkKg2KN4ulNLdxUDJXeg-1; Fri, 16 Oct 2020 07:38:48 -0400
X-MC-Unique: c1vkKg2KN4ulNLdxUDJXeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464B818A0769;
 Fri, 16 Oct 2020 11:38:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD9257667A;
 Fri, 16 Oct 2020 11:38:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1D999D74; Fri, 16 Oct 2020 13:38:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] apci: drop has_pci arg for acpi_build_madt
Date: Fri, 16 Oct 2020 13:38:33 +0200
Message-Id: <20201016113835.17465-6-kraxel@redhat.com>
In-Reply-To: <20201016113835.17465-1-kraxel@redhat.com>
References: <20201016113835.17465-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting x86ms->pci_irq_mask to zero has the same effect,
so we don't need the has_pci argument any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/acpi-common.h  |  3 +--
 hw/i386/acpi-build.c   |  2 +-
 hw/i386/acpi-common.c  | 25 +++++++++++--------------
 hw/i386/acpi-microvm.c |  2 +-
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index 9cac18dddf5b..c30e461f1854 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -9,7 +9,6 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev,
-                     bool has_pci);
+                     X86MachineState *x86ms, AcpiDeviceIf *adev);
 
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 45ad2f953341..e3a4bc206c4e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2477,7 +2477,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), true);
+                    ACPI_DEVICE_IF(x86ms->acpi_dev));
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1584abb3e6b0..8a769654060e 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -72,8 +72,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 }
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev,
-                     bool has_pci)
+                     X86MachineState *x86ms, AcpiDeviceIf *adev)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
@@ -113,19 +112,17 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
         intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
     }
 
-    if (has_pci) {
-        for (i = 1; i < 16; i++) {
-            if (!(x86ms->pci_irq_mask & (1 << i))) {
-                /* No need for a INT source override structure. */
-                continue;
-            }
-            intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-            intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
-            intsrcovr->length = sizeof(*intsrcovr);
-            intsrcovr->source = i;
-            intsrcovr->gsi    = cpu_to_le32(i);
-            intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
+    for (i = 1; i < 16; i++) {
+        if (!(x86ms->pci_irq_mask & (1 << i))) {
+            /* No need for a INT source override structure. */
+            continue;
         }
+        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
+        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
+        intsrcovr->length = sizeof(*intsrcovr);
+        intsrcovr->source = i;
+        intsrcovr->gsi    = cpu_to_le32(i);
+        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
     }
 
     if (x2apic_mode) {
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 8e2d2b7cff83..5efa89c32709 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -196,7 +196,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->pci_irq_mask != 0);
+                    ACPI_DEVICE_IF(x86ms->acpi_dev));
 
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
-- 
2.27.0


