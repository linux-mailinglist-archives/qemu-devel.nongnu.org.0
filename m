Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DD7455D36
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:01:04 +0100 (CET)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhyJ-000737-OG
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:01:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnhZK-0007VP-Qy
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnhZJ-0002cC-0i
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPYKx9uhzqpV56MxW183OXn607XHAZablOEesagsGDs=;
 b=YGLSYiT6dyfac9ZMtuiwZoKPt9/tWu5gnuRWwqbu34zLL6Sa/aBXpfEFXCCDn7JdJNNS56
 CQ3HZgPE/Oxa+nII0I5fbzhqrgVklaJlvMoh9XTud6hsFJSj247cmHbk0XfHNkU2A3RsyU
 HvFJWDU9vPfBNq0T0lLCr0tX4QnWVU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-9zHduQgxNOK5h3xDzPNi0Q-1; Thu, 18 Nov 2021 08:35:10 -0500
X-MC-Unique: 9zHduQgxNOK5h3xDzPNi0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 559238799E0;
 Thu, 18 Nov 2021 13:35:09 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5B83AEA;
 Thu, 18 Nov 2021 13:34:32 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] failover: fix unplug pending detection
Date: Thu, 18 Nov 2021 14:32:23 +0100
Message-Id: <20211118133225.324937-4-lvivier@redhat.com>
In-Reply-To: <20211118133225.324937-1-lvivier@redhat.com>
References: <20211118133225.324937-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
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
2.33.1


