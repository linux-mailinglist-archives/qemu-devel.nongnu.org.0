Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C683ED977
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:06:52 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeCR-0003qY-9v
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe59-0008Ag-Ea
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe57-0004aA-Ky
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629125957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZHVkQFhMeVwNMuwblNyslAVMeW9xi1A392tyaO0Q68=;
 b=FN2ElOSI/5RXUCnxJx91C0IZO4RMjSPE8CWDIzVsVjBM+WGlxz2AH1lumIIinq6I8vUs4E
 mkkW9qoBTLXSUTHNiwyzdKD5mEZ9+yv3TQ2CcvYIShd6xJpKlCyXrm3haCdf4u38+X0PGK
 LS5MGHS3VAlnv2ORAk/Io+F4a4uZz0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-uE6jZGrIO128lqVK6gQGkg-1; Mon, 16 Aug 2021 10:59:15 -0400
X-MC-Unique: uE6jZGrIO128lqVK6gQGkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80A17CC622;
 Mon, 16 Aug 2021 14:59:14 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F138F421F;
 Mon, 16 Aug 2021 14:59:04 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/6] pci: automatically unplug a PCI card before migration
Date: Mon, 16 Aug 2021 16:58:24 +0200
Message-Id: <20210816145824.15825-7-lvivier@redhat.com>
In-Reply-To: <20210816145824.15825-1-lvivier@redhat.com>
References: <20210816145824.15825-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have moved all the functions needed by failover to unplug a card to the
PCI subsystem.

A side effect of this change is we can implement automatic hotplug/unplug
of any PCI card during migration without using a failover virtio-net card.
For that, we need to introduce a new PCI device property,
"unplug-on-migration", we can set to "true" or "on" if we want QEMU unplugs
the card before the migration and plugs it back on the destination side
after the migration.

We modify the pci_dev_hide_device() function to check for the
"unplug-on-migration" property on the command line.
If it is present, the device is hidden on startup only on the destination
side and it will be unplugged before the migration.

To implement the "unplug-on-migration" property, we add a post_load
function in vmstate_pcibus to hotplug the card after the migration
(bus_post_load() and pci_dev_replug_on_migration()). This is not
needed with virtio-net failover because the device is plugged back
by the virtio-net device during the features migration
(VIRTIO_NET_F_STANDBY)

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/pci/pci.h |  1 +
 hw/pci/pci.c         | 76 ++++++++++++++++++++++++++++++++++++++------
 hw/vfio/pci.c        |  2 +-
 3 files changed, 69 insertions(+), 10 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d35214144d1b..e02d965c064f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -362,6 +362,7 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    bool unplug_on_migration;
     Notifier migration_state;
     uint32_t acpi_index;
 };
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 7cb140940a84..dc8f80241fa4 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -82,6 +82,8 @@ static Property pci_props[] = {
                     QEMU_PCIE_LNKSTA_DLLLA_BITNR, true),
     DEFINE_PROP_BIT("x-pcie-extcap-init", PCIDevice, cap_present,
                     QEMU_PCIE_EXTCAP_INIT_BITNR, true),
+    DEFINE_PROP_BOOL("unplug-on-migration", PCIDevice,
+                     unplug_on_migration, false),
     DEFINE_PROP_STRING("failover_pair_id", PCIDevice,
                        failover_pair_id),
     DEFINE_PROP_UINT32("acpi-index",  PCIDevice, acpi_index, 0),
@@ -110,6 +112,45 @@ static bool bus_unplug_pending(void *opaque)
     return false;
 }
 
+static int pci_dev_replug_on_migration(void *opaque, QemuOpts *opts,
+                                       Error **errp)
+{
+    Error *err = NULL;
+    const char *bus_name = opaque;
+    const char *opt;
+    DeviceState *dev;
+
+    if (g_strcmp0(qemu_opt_get(opts, "bus"), bus_name)) {
+        return 0;
+    }
+
+    opt = qemu_opt_get(opts, "unplug-on-migration");
+    if (g_strcmp0(opt, "on") && g_strcmp0(opt, "true")) {
+        return 0;
+    }
+    dev = qdev_device_add(opts, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return 1;
+    }
+    object_unref(OBJECT(dev));
+    return 0;
+}
+
+static int bus_post_load(void *opaque, int version_id)
+{
+    Error *err = NULL;
+    PCIBus *bus = opaque;
+
+    if (qemu_opts_foreach(qemu_find_opts("device"),
+                          pci_dev_replug_on_migration, bus->qbus.name, &err)) {
+        error_report_err(err);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_pcibus = {
     .name = "PCIBUS",
     .version_id = 1,
@@ -122,6 +163,7 @@ static const VMStateDescription vmstate_pcibus = {
         VMSTATE_END_OF_LIST()
     },
     .dev_unplug_pending = bus_unplug_pending,
+    .post_load = bus_post_load,
 };
 
 static void pci_init_bus_master(PCIDevice *pci_dev)
@@ -1200,7 +1242,7 @@ static void pci_qdev_unrealize(DeviceState *dev)
     PCIDevice *pci_dev = PCI_DEVICE(dev);
     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(pci_dev);
 
-    if (pci_dev->failover_pair_id) {
+    if (pci_dev->unplug_on_migration) {
         remove_migration_state_change_notifier(&pci_dev->migration_state);
     }
 
@@ -2268,6 +2310,15 @@ static bool pci_dev_hide_device(DeviceListener *listener,
         return false;
     }
 
+    opt = qemu_opt_get(device_opts, "unplug-on-migration");
+    if (g_strcmp0(opt, "on") == 0 || g_strcmp0(opt, "true") == 0) {
+        if (runstate_check(RUN_STATE_INMIGRATE)) {
+            return migration_incoming_get_current()->state !=
+                   MIGRATION_STATUS_ACTIVE;
+        }
+        return false;
+    }
+
     return false;
 }
 
@@ -2293,6 +2344,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
     }
 
+    if (pci_dev->failover_pair_id) {
+        pci_dev->unplug_on_migration = true;
+    }
+
     pci_dev = do_pci_register_device(pci_dev,
                                      object_get_typename(OBJECT(qdev)),
                                      pci_dev->devfn, errp);
@@ -2309,12 +2364,6 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     if (pci_dev->failover_pair_id) {
-        if (!pci_bus_is_express(pci_get_bus(pci_dev))) {
-            error_setg(errp, "failover primary device must be on "
-                             "PCIExpress bus");
-            pci_qdev_unrealize(DEVICE(pci_dev));
-            return;
-        }
         class_id = pci_get_word(pci_dev->config + PCI_CLASS_DEVICE);
         if (class_id != PCI_CLASS_NETWORK_ETHERNET) {
             error_setg(errp, "failover primary device is not an "
@@ -2322,10 +2371,19 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
             pci_qdev_unrealize(DEVICE(pci_dev));
             return;
         }
+    }
+
+    if (pci_dev->unplug_on_migration) {
+        if (!pci_bus_is_express(pci_get_bus(pci_dev))) {
+            error_setg(errp, "Unplugged device on migration must be on "
+                             "PCIExpress bus");
+            pci_qdev_unrealize(DEVICE(pci_dev));
+            return;
+        }
         if ((pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
             || (PCI_FUNC(pci_dev->devfn) != 0)) {
-            error_setg(errp, "failover: primary device must be in its own "
-                              "PCI slot");
+            error_setg(errp, "Unplugged device on migration must be in its "
+                              "own PCI slot");
             pci_qdev_unrealize(DEVICE(pci_dev));
             return;
         }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23b5..187e1b58a4d9 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3080,7 +3080,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
-    if (!pdev->failover_pair_id) {
+    if (!pdev->unplug_on_migration) {
         ret = vfio_migration_probe(&vdev->vbasedev, errp);
         if (ret) {
             error_report("%s: Migration disabled", vdev->vbasedev.name);
-- 
2.31.1


