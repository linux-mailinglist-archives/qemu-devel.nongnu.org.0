Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4D341E91A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 10:29:11 +0200 (CEST)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWDuo-0007I6-JE
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 04:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWDr8-0004WW-SB
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWDr2-0007Tt-Fj
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633076713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=02VRuu+jbIJ5WWM36RzPFfnTYUvx0Hx5/oV8ujMoAjA=;
 b=QdU54voITG+Pcp3zbC/uznIZGID6MKy916os3VY8RKtt9ObL2cT57vNKfUfP79ZHLEFcbY
 iUHwv2Vu4bX+VqJs+iFcKKtH17npuDWcs5ekch3Be0Js729lwFkB8E+Qvy86vrDUeqLLeU
 Ob1XxFqKXr/uqk0xJJKm7HticVDyNcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-e7G-pvVPMK-L-HOk7szwcw-1; Fri, 01 Oct 2021 04:25:09 -0400
X-MC-Unique: e7G-pvVPMK-L-HOk7szwcw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FEACCC623;
 Fri,  1 Oct 2021 08:25:05 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8403B102AE4B;
 Fri,  1 Oct 2021 08:25:03 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] failover: fix unplug pending detection
Date: Fri,  1 Oct 2021 10:25:02 +0200
Message-Id: <20211001082502.1342878-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Failover needs to detect the end of the PCI unplug to start migration
after the VFIO card has been unplugged.

To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
pcie_unplug_device().

But since
    17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
we have switched to ACPI unplug and these functions are not called anymore
and the flag not set. So failover migration is not able to detect if card
is really unplugged and acts as it's done as soon as it's started. So it
doesn't wait the end of the unplug to start the migration. We don't see any
problem when we test that because ACPI unplug is faster than PCIe native
hotplug and when the migration really starts the unplug operation is
already done.

See c000a9bd06ea ("pci: mark device having guest unplug request pending")
    a99c4da9fc2a ("pci: mark devices partially unplugged")

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---

Notes:
    v3: add some inlined comments to explain partially_hotplugged and
        pending_deleted_event
    v2: move partially_hotplugged to acpi_pcihp_eject_slot()

 hw/acpi/pcihp.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index f610a25d2ef9..30405b5113d7 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -222,9 +222,27 @@ static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slo
         PCIDevice *dev = PCI_DEVICE(qdev);
         if (PCI_SLOT(dev->devfn) == slot) {
             if (!acpi_pcihp_pc_no_hotplug(s, dev)) {
-                hotplug_ctrl = qdev_get_hotplug_handler(qdev);
-                hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
-                object_unparent(OBJECT(qdev));
+                /*
+                 * partially_hotplugged is used by virtio-net failover:
+                 * failover has asked the guest OS to unplug the device
+                 * but we need to keep some references to the device
+                 * to be able to plug it back in case of failure so
+                 * we don't execute hotplug_handler_unplug().
+                 */
+                if (dev->partially_hotplugged) {
+                    /*
+                     * pending_deleted_event is set to true when
+                     * virtio-net failover asks to unplug the device,
+                     * and set to false here when the operation is done
+                     * This is used by the migration loop to detect the
+                     * end of the operation and really start the migration.
+                     */
+                    qdev->pending_deleted_event = false;
+                } else {
+                    hotplug_ctrl = qdev_get_hotplug_handler(qdev);
+                    hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
+                    object_unparent(OBJECT(qdev));
+                }
             }
         }
     }
@@ -396,6 +414,12 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
+    /*
+     * pending_deleted_event is used by virtio-net failover to detect the
+     * end of the unplug operation, the flag is set to false in
+     * acpi_pcihp_eject_slot() when the operation is completed.
+     */
+    pdev->qdev.pending_deleted_event = true;
     s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
-- 
2.31.1


