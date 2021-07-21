Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675433D1368
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:11:17 +0200 (CEST)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EoW-0001rp-Eo
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6Eme-0007mR-NG
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6Emc-0007t9-Mm
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626883758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JVPtsjsOQv338btzY0jmt1RrUhWLBgOIwfsSzGPTSz0=;
 b=Mgelk0s74ldyI0TKRHIr2007a1efziLoZvD8Ugm6eiYCgwVj7oKL2Gz1rZTZF1B5q64K3v
 Ql+hzx24AV6Di8M04S77LKsxO7WP99dOKUpWXXAyRIcDZE9UFKGVkPVtoin++KWKHg8idk
 QM2U+l/ROzdt7gZ3Ky915dMqpsXC7cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-KH9cA_mANcWzEcyoT_RsXw-1; Wed, 21 Jul 2021 12:09:16 -0400
X-MC-Unique: KH9cA_mANcWzEcyoT_RsXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC01A92504;
 Wed, 21 Jul 2021 16:09:15 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E61161095;
 Wed, 21 Jul 2021 16:09:06 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] failover: unregister ROM on unplug
Date: Wed, 21 Jul 2021 18:09:05 +0200
Message-Id: <20210721160905.234915-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The intend of failover is to allow to migrate a VM with a VFIO
networking card without disrupting the network operation by switching
to a virtio-net device during the migration.

This simple change allows to test failover with a simulated device
like e1000e rather than a vfio device, even if it's useless in real
life it can help to debug failover.

This is interesting to developers that want to test failover on
a system with no vfio device. Moreover it simplifies host networking
configuration as we can use the same bridge for virtio-net and
the other failover networking device.

Without this change the migration of a system configured with failover
fails with:

  ...
  -device virtio-net-pci,id=virtionet0,failover=on,...  \
  -device e1000,failover_pair_id=virtionet0,... \
  ...

  (qemu) migrate ...

  Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
  error while loading state for instance 0x0 of device 'ram'
  load of migration failed: Invalid argument

This happens because QEMU correctly unregisters the interface vmstate but
not the ROM one. This patch fixes that.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v4:
      export and use pci_del_option_rom()
    
    v3:
      remove useless space before comma
    
    v2:
      reset has_rom to false
      update commit log message

 include/hw/pci/pci.h | 2 ++
 hw/net/virtio-net.c  | 1 +
 hw/pci/pci.c         | 3 +--
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266e3725..84707034cbf8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -369,6 +369,8 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
+void pci_del_option_rom(PCIDevice *pdev);
+
 int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
                        uint8_t offset, uint8_t size,
                        Error **errp);
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52a..d6f03633f1b3 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3256,6 +3256,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
     if (migration_in_setup(s) && !should_be_hidden) {
         if (failover_unplug_primary(n, dev)) {
             vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
+            pci_del_option_rom(PCI_DEVICE(dev));
             qapi_event_send_unplug_primary(dev->id);
             qatomic_set(&n->failover_primary_hidden, true);
         } else {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 23d2ae2ab232..c210d92b5ba7 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -228,7 +228,6 @@ static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
 static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
-static void pci_del_option_rom(PCIDevice *pdev);
 
 static uint16_t pci_default_sub_vendor_id = PCI_SUBVENDOR_ID_REDHAT_QUMRANET;
 static uint16_t pci_default_sub_device_id = PCI_SUBDEVICE_ID_QEMU;
@@ -2429,7 +2428,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
     pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
 }
 
-static void pci_del_option_rom(PCIDevice *pdev)
+void pci_del_option_rom(PCIDevice *pdev)
 {
     if (!pdev->has_rom)
         return;
-- 
2.31.1


