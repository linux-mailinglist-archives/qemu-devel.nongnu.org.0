Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DEF3ED972
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:04:59 +0200 (CEST)
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeAc-0000hX-SC
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe4x-0007Yy-6h
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe4u-0004SN-Ke
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629125944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6SySTLoG1DNk5qAoPB1PExu68iFG/H55ERAE+KjVb0=;
 b=LrY8DjqCm9Qfgjww0DLums7xtlVsmYkMtkhQwHfUOEao6EqOO9yoTPqAmnMh1F7+F1NDkx
 M65P6Gh6FU9CyVw72X0PpEsKVMtW6gg9+X4m+hO97mm74A6I0hz99w6iS4UYuLxOyLnYj7
 rHl+/mRhPIadWMpO9IPvW+wu7VvXUaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-iMbaUN1OMzKTdh9I6TmzGw-1; Mon, 16 Aug 2021 10:59:02 -0400
X-MC-Unique: iMbaUN1OMzKTdh9I6TmzGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E21100E422;
 Mon, 16 Aug 2021 14:59:02 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 728596E0B6;
 Mon, 16 Aug 2021 14:58:59 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/6] failover: pci: move failover hotplug/unplug code into
 pci subsystem
Date: Mon, 16 Aug 2021 16:58:22 +0200
Message-Id: <20210816145824.15825-5-lvivier@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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

failover allows a VFIO device to be unplugged on migration to switch
to the standby device, a virtio-net device.

Failover relies on PCI ability to hotplug/unplug a card (the VFIO
one) but all the code is implemented in virtio-net device that
is not a PCI device (even not in virtio-net-pci that is the bridge
between the PCI bus and the virtio-net device)

This patch moves all the failover PCI related code to the PCI
sub-system and keeps only in virtio-net the code related to the
failover (that is implemented in the virtio-net driver in the kernel)

There are several parts involved in the PCI device hotplug/unplug:

- the migration state notifier

  originally virtio_net_handle_migration_primary(), moved to hw/pci/pci.c
  as pci_dev_handle_migration(). On source, this function unplugs the card
  on migration setup and plugs it back in case of failure.
  (helpers are pci_dev_migration_unplug() and pci_dev_migration_replug(),
   previously failover_unplug_primary() and failover_replug_primary()).

- the hide device listener

  originally failover_hide_primary_device(), moved to hw/pci/pci.c
  as pci_dev_hide_device().
  This function is called by qdev_device_add() to know if a device
  must be hidden or not. To do that, the function checks the command line,
  if the device doesn't have a "failover_pair_id" it is not hidden. Otherwise
  it is hidden at startup on source and destination and it is only plugged by
  a compatible virtio-net device).

- the unplug pending checking functions

  originally primary_unplug_pending() and dev_unplug_pending(),
  moved to hw/pci/pci.c as bus_unplug_pending() and
  pci_device_unplug_pending()

  bus_unplug_pending() is called during the migration to check
  if the PCI device has been unplugged before starting to migrate
  data. It has been moved from vmstate_virtio_net to vmstate_pcibus.
  We can't move it to vmstate_pci_device because the device vmstate is
  removed before to start the migration (we don't migrate the device we
  unplug).

  pci_device_unplug_pending() is called by bus_unplug_pending() to
  check if an unplug is pending for a given device (this is a class
  function) of the bus.

  For a given PCI bus, bus_unplug_pending() will call
  pci_device_unplug_pending() for each available bus slot.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/pci/pci.h           |   4 +
 include/hw/virtio/virtio-net.h |   2 -
 include/hw/virtio/virtio.h     |   1 -
 hw/net/virtio-net.c            | 156 ------------------------------
 hw/pci/pci.c                   | 170 ++++++++++++++++++++++++++++++++-
 5 files changed, 173 insertions(+), 160 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266e3725..d35214144d1b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -241,6 +241,9 @@ struct PCIDeviceClass {
 
     /* rom bar */
     const char *romfile;
+
+    DeviceListener listener;
+    bool (*dev_unplug_pending)(void *opaque);
 };
 
 typedef void (*PCIINTxRoutingNotifier)(PCIDevice *dev);
@@ -359,6 +362,7 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    Notifier migration_state;
     uint32_t acpi_index;
 };
 
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 21d8c3aa5f3a..d8161b61cc9e 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -206,8 +206,6 @@ struct VirtIONet {
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
     bool failover;
-    DeviceListener primary_listener;
-    Notifier migration_state;
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
     struct EBPFRSSContext ebpf_rss;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb7507..c9d26d5daa43 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -159,7 +159,6 @@ struct VirtioDeviceClass {
      */
     int (*post_load)(VirtIODevice *vdev);
     const VMStateDescription *vmsd;
-    bool (*primary_unplug_pending)(void *opaque);
 };
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c81466f6efb7..35e3d024f8d6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -36,10 +36,8 @@
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
 #include "hw/virtio/virtio-access.h"
-#include "migration/migration.h"
 #include "migration/misc.h"
 #include "standard-headers/linux/ethtool.h"
-#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
@@ -3188,127 +3186,6 @@ void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
     n->netclient_type = g_strdup(type);
 }
 
-static bool failover_unplug_primary(VirtIONet *n, DeviceState *dev)
-{
-    HotplugHandler *hotplug_ctrl;
-    PCIDevice *pci_dev;
-    Error *err = NULL;
-
-    hotplug_ctrl = qdev_get_hotplug_handler(dev);
-    if (hotplug_ctrl) {
-        pci_dev = PCI_DEVICE(dev);
-        pci_dev->partially_hotplugged = true;
-        hotplug_handler_unplug_request(hotplug_ctrl, dev, &err);
-        if (err) {
-            error_report_err(err);
-            return false;
-        }
-    } else {
-        return false;
-    }
-    return true;
-}
-
-static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
-                                    Error **errp)
-{
-    Error *err = NULL;
-    HotplugHandler *hotplug_ctrl;
-    PCIDevice *pdev = PCI_DEVICE(dev);
-    BusState *primary_bus;
-
-    if (!pdev->partially_hotplugged) {
-        return true;
-    }
-    primary_bus = dev->parent_bus;
-    if (!primary_bus) {
-        error_setg(errp, "virtio_net: couldn't find primary bus");
-        return false;
-    }
-    qdev_set_parent_bus(dev, primary_bus, &error_abort);
-    hotplug_ctrl = qdev_get_hotplug_handler(dev);
-    if (hotplug_ctrl) {
-        hotplug_handler_pre_plug(hotplug_ctrl, dev, &err);
-        if (err) {
-            goto out;
-        }
-        hotplug_handler_plug(hotplug_ctrl, dev, &err);
-    }
-    pdev->partially_hotplugged = false;
-
-out:
-    error_propagate(errp, err);
-    return !err;
-}
-
-static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
-{
-    Error *err = NULL;
-    DeviceState *dev = failover_find_primary_device(n);
-
-    if (!dev) {
-        return;
-    }
-
-    if (migration_in_setup(s)) {
-        if (failover_unplug_primary(n, dev)) {
-            vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
-            qapi_event_send_unplug_primary(dev->id);
-        } else {
-            warn_report("couldn't unplug primary device");
-        }
-    } else if (migration_has_failed(s)) {
-        /* We already unplugged the device let's plug it back */
-        if (!failover_replug_primary(n, dev, &err)) {
-            if (err) {
-                error_report_err(err);
-            }
-        }
-    }
-}
-
-static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
-{
-    MigrationState *s = data;
-    VirtIONet *n = container_of(notifier, VirtIONet, migration_state);
-    virtio_net_handle_migration_primary(n, s);
-}
-
-static bool failover_hide_primary_device(DeviceListener *listener,
-                                         QemuOpts *device_opts, Error **errp)
-{
-    VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
-    const char *standby_id;
-
-    if (!device_opts) {
-        return false;
-    }
-    standby_id = qemu_opt_get(device_opts, "failover_pair_id");
-    if (standby_id == NULL) {
-        return false;
-    }
-    if (device_opts->id == NULL) {
-        error_setg(errp, "Device with failover_pair_id don't have id");
-        return true;
-    }
-    if (g_strcmp0(standby_id, n->netclient_name) != 0) {
-        return false;
-    }
-
-    if (runstate_check(RUN_STATE_PRELAUNCH)) {
-        /* hide the failover primary on src on startup */
-        return true;
-    }
-
-    if (runstate_check(RUN_STATE_INMIGRATE) &&
-        migration_incoming_get_current()->state == MIGRATION_STATUS_NONE) {
-        /* hide the failover primary on dest on startup */
-        return true;
-    }
-
-    return false;
-}
-
 static void virtio_net_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -3343,10 +3220,6 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     if (n->failover) {
-        n->primary_listener.hide_device = failover_hide_primary_device;
-        device_listener_register(&n->primary_listener);
-        n->migration_state.notify = virtio_net_migration_state_notifier;
-        add_migration_state_change_notifier(&n->migration_state);
         n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
     }
 
@@ -3492,11 +3365,6 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     g_free(n->mac_table.macs);
     g_free(n->vlans);
 
-    if (n->failover) {
-        device_listener_unregister(&n->primary_listener);
-        remove_migration_state_change_notifier(&n->migration_state);
-    }
-
     max_queues = n->multiqueue ? n->max_queues : 1;
     for (i = 0; i < max_queues; i++) {
         virtio_net_del_queue(n, i);
@@ -3539,28 +3407,6 @@ static int virtio_net_pre_save(void *opaque)
     return 0;
 }
 
-static bool primary_unplug_pending(void *opaque)
-{
-    DeviceState *dev = opaque;
-    DeviceState *primary;
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VirtIONet *n = VIRTIO_NET(vdev);
-
-    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
-        return false;
-    }
-    primary = failover_find_primary_device(n);
-    return primary ? primary->pending_deleted_event : false;
-}
-
-static bool dev_unplug_pending(void *opaque)
-{
-    DeviceState *dev = opaque;
-    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(dev);
-
-    return vdc->primary_unplug_pending(dev);
-}
-
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3570,7 +3416,6 @@ static const VMStateDescription vmstate_virtio_net = {
         VMSTATE_END_OF_LIST()
     },
     .pre_save = virtio_net_pre_save,
-    .dev_unplug_pending = dev_unplug_pending,
 };
 
 static Property virtio_net_properties[] = {
@@ -3662,7 +3507,6 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->legacy_features |= (0x1 << VIRTIO_NET_F_GSO);
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
-    vdc->primary_unplug_pending = primary_unplug_pending;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 23d2ae2ab232..e88686b45976 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -33,11 +33,15 @@
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
+#include "migration/migration.h"
+#include "migration/misc.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
+#include "monitor/qdev.h"
 #include "net/net.h"
 #include "sysemu/numa.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
@@ -47,8 +51,10 @@
 #include "hw/pci/msix.h"
 #include "hw/hotplug.h"
 #include "hw/boards.h"
+#include "hw/virtio/virtio-net.h" /* for failover */
 #include "qapi/error.h"
 #include "qapi/qapi-commands-pci.h"
+#include "qapi/qapi-events-migration.h"
 #include "qemu/cutils.h"
 
 //#define DEBUG_PCI
@@ -82,6 +88,28 @@ static Property pci_props[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+static bool bus_unplug_pending(void *opaque)
+{
+    DeviceState *dev = opaque;
+    PCIBus *bus = PCI_BUS(dev);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
+        PCIDeviceClass *pc;
+
+        if (bus->devices[i] == NULL) {
+            continue;
+        }
+
+        pc = PCI_DEVICE_GET_CLASS(bus->devices[i]);
+        if (pc->dev_unplug_pending &&
+            pc->dev_unplug_pending(DEVICE(bus->devices[i]))) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static const VMStateDescription vmstate_pcibus = {
     .name = "PCIBUS",
     .version_id = 1,
@@ -92,7 +120,8 @@ static const VMStateDescription vmstate_pcibus = {
                              nirq, 0, vmstate_info_int32,
                              int32_t),
         VMSTATE_END_OF_LIST()
-    }
+    },
+    .dev_unplug_pending = bus_unplug_pending,
 };
 
 static void pci_init_bus_master(PCIDevice *pci_dev)
@@ -1171,6 +1200,10 @@ static void pci_qdev_unrealize(DeviceState *dev)
     PCIDevice *pci_dev = PCI_DEVICE(dev);
     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(pci_dev);
 
+    if (pci_dev->failover_pair_id) {
+        remove_migration_state_change_notifier(&pci_dev->migration_state);
+    }
+
     pci_unregister_io_regions(pci_dev);
     pci_del_option_rom(pci_dev);
 
@@ -2116,6 +2149,127 @@ PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
     return bus->devices[devfn];
 }
 
+static bool pci_dev_migration_unplug(PCIDevice *pci_dev)
+{
+    HotplugHandler *hotplug_ctrl;
+    DeviceState *dev = &pci_dev->qdev;
+    Error *err = NULL;
+
+    hotplug_ctrl = qdev_get_hotplug_handler(dev);
+    if (hotplug_ctrl) {
+        pci_dev->partially_hotplugged = true;
+        hotplug_handler_unplug_request(hotplug_ctrl, dev, &err);
+        if (err) {
+            error_report_err(err);
+            return false;
+        }
+    } else {
+        return false;
+    }
+    return true;
+}
+
+static bool pci_dev_migration_replug(PCIDevice *pci_dev, Error **errp)
+{
+    Error *err = NULL;
+    HotplugHandler *hotplug_ctrl;
+    DeviceState *dev = &pci_dev->qdev;
+    BusState *primary_bus;
+
+    if (!pci_dev->partially_hotplugged) {
+        return true;
+    }
+    primary_bus = dev->parent_bus;
+    if (!primary_bus) {
+        error_setg(errp, "virtio_net: couldn't find primary bus");
+        return false;
+    }
+    qdev_set_parent_bus(dev, primary_bus, &error_abort);
+    hotplug_ctrl = qdev_get_hotplug_handler(dev);
+    if (hotplug_ctrl) {
+        hotplug_handler_pre_plug(hotplug_ctrl, dev, &err);
+        if (err) {
+            goto out;
+        }
+        hotplug_handler_plug(hotplug_ctrl, dev, &err);
+    }
+    pci_dev->partially_hotplugged = false;
+
+out:
+    error_propagate(errp, err);
+    return !err;
+}
+
+static void pci_dev_handle_migration(PCIDevice *pci_dev, MigrationState *s)
+{
+    Error *err = NULL;
+    DeviceState *dev = &pci_dev->qdev;
+
+    if (migration_in_setup(s)) {
+        if (pci_dev_migration_unplug(pci_dev)) {
+            vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
+            qapi_event_send_unplug_primary(dev->id);
+        } else {
+            warn_report("couldn't unplug primary device");
+        }
+    } else if (migration_has_failed(s)) {
+        /* We already unplugged the device let's plug it back */
+        if (!pci_dev_migration_replug(pci_dev, &err)) {
+            if (err) {
+                error_report_err(err);
+            }
+        }
+    }
+}
+
+static void pci_dev_migration_state_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+    PCIDevice *pci_dev = container_of(notifier, PCIDevice, migration_state);
+    pci_dev_handle_migration(pci_dev, s);
+}
+
+static bool pci_dev_hide_device(DeviceListener *listener,
+                                QemuOpts *device_opts, Error **errp)
+{
+    const char *opt;
+    DeviceState *d;
+
+    if (!device_opts) {
+        return false;
+    }
+
+    opt = qemu_opt_get(device_opts, "failover_pair_id");
+    if (opt) {
+        if (device_opts->id == NULL) {
+            error_setg(errp, "Device with failover_pair_id don't have id");
+            return true;
+        }
+        d =  qdev_find_recursive(sysbus_get_default(), opt);
+        if (d == NULL) {
+            /*
+             * if the the virtio-net device is not plugged it can be
+             * plugged later, and this device will be added to the failover
+             */
+            return false;
+        }
+
+        if (runstate_check(RUN_STATE_PRELAUNCH)) {
+            /* hide the failover primary on src on startup */
+            return true;
+        }
+
+        if (runstate_check(RUN_STATE_INMIGRATE) &&
+            migration_incoming_get_current()->state == MIGRATION_STATUS_NONE) {
+            /* hide the failover primary on dest on startup */
+            return true;
+        }
+        return false;
+    }
+
+    return false;
+}
+
 static void pci_qdev_realize(DeviceState *qdev, Error **errp)
 {
     PCIDevice *pci_dev = (PCIDevice *)qdev;
@@ -2175,6 +2329,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
             return;
         }
         qdev->allow_unplug_during_migration = true;
+        pci_dev->migration_state.notify = pci_dev_migration_state_notifier;
+        add_migration_state_change_notifier(&pci_dev->migration_state);
     }
 
     /* rom loading */
@@ -2684,14 +2840,26 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev)
     return pci_get_bus(dev)->address_space_io;
 }
 
+static bool pci_device_unplug_pending(void *opaque)
+{
+    DeviceState *dev = opaque;
+
+    return dev->pending_deleted_event;
+}
+
 static void pci_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
 
     k->realize = pci_qdev_realize;
     k->unrealize = pci_qdev_unrealize;
     k->bus_type = TYPE_PCI_BUS;
     device_class_set_props(k, pci_props);
+    pc->dev_unplug_pending = pci_device_unplug_pending;
+
+    pc->listener.hide_device = pci_dev_hide_device;
+    device_listener_register(&pc->listener);
 }
 
 static void pci_device_class_base_init(ObjectClass *klass, void *data)
-- 
2.31.1


