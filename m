Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB42DE8E5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:29:08 +0100 (CET)
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqKV1-0000hR-IL
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqKTl-0000Ag-QM
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:27:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqKTj-0002k4-R7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608316066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sQr8m5vrM+1K41e37lE5Ikn3yFSAEt8F75EyOEWM89M=;
 b=GJHsGm5jWUG5zndXKIu7aX36lQjd+L23CbFhb+A/GA91KU2B1rgJki/pfG+e3YxCXmkTQU
 sbsZRzBhAK77saCI+5p2MVSs+n+NE1nw2kpHSdTWyKDbhiqooa0zOiqxnPdTMoUFRouE52
 OKsgyXFf7vIXlvtUlgRtTynvkgf0AJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-RHd1kRYjPFWKMqKnI1-yIw-1; Fri, 18 Dec 2020 13:27:45 -0500
X-MC-Unique: RHd1kRYjPFWKMqKnI1-yIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 373E0107ACE3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 18:27:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8599110013C0;
 Fri, 18 Dec 2020 18:27:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pci: add romsize property
Date: Fri, 18 Dec 2020 13:27:36 -0500
Message-Id: <20201218182736.1634344-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property can be useful for distros to set up known-good ROM sizes for
migration purposes.  The VM will fail to start if the ROM is too large,
and migration compatibility will not be broken if the ROM is too small.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/pci.c             | 19 +++++++++++++++++--
 hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
 include/hw/pci/pci.h     |  1 +
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index d4349ea577..fd25253c2a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -67,6 +67,7 @@ static void pcibus_reset(BusState *qbus);
 static Property pci_props[] = {
     DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
     DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
+    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
     DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
     DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
@@ -2106,6 +2107,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     bool is_default_rom;
     uint16_t class_id;
 
+    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
+        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
+        return;
+    }
+
     /* initialize cap_present for pci_is_express() and pci_config_size(),
      * Note that hybrid PCIs are not set automatically and need to manage
      * QEMU_PCI_CAP_EXPRESS manually */
@@ -2366,7 +2372,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         g_free(path);
         return;
     }
-    size = pow2ceil(size);
+    if (pdev->romsize != -1) {
+        if (size > pdev->romsize) {
+            error_setg(errp, "romfile \"%s\" (%d bytes) is too large for ROM size %d",
+                       pdev->romfile, size, pdev->romsize);
+            g_free(path);
+            return;
+        }
+    } else {
+        pdev->romsize = pow2ceil(size);
+    }
 
     vmsd = qdev_get_vmsd(DEVICE(pdev));
 
@@ -2376,7 +2391,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
     }
     pdev->has_rom = true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
+    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index a50a80837e..153812f8cd 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     }
     fseek(fp, 0, SEEK_SET);
 
+    if (dev->romsize != -1) {
+        if (st.st_size > dev->romsize) {
+            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %d",
+                         rom_file, (long) st.st_size, dev->romsize);
+            goto close_rom;
+        }
+    } else {
+        dev->romsize = st.st_size;
+    }
+
     snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
-    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
+    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
     ptr = memory_region_get_ram_ptr(&dev->rom);
-    memset(ptr, 0xff, st.st_size);
+    memset(ptr, 0xff, dev->romsize);
 
     if (!fread(ptr, 1, st.st_size, fp)) {
         error_report("pci-assign: Cannot read from host %s", rom_file);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 259f9c992d..b028245b62 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -343,6 +343,7 @@ struct PCIDevice {
 
     /* Location of option rom */
     char *romfile;
+    uint32_t romsize;
     bool has_rom;
     MemoryRegion rom;
     uint32_t rom_bar;
-- 
2.26.2


