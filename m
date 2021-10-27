Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351D43C74A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:02:59 +0200 (CEST)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfflp-0005Va-NX
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mffjI-0004AG-FW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mffjD-00042m-10
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635328812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jwXQ6vRTmZr7MCCTKJUs74L214N/usKVQiwGUzGY6vA=;
 b=cCArq+Ts9wt9ajWr/QxnLV67o5/eKp1GuXf/m27LnUvdFXAxV8RFYcJUULkVZCQ8h1yNY1
 Uowz/DL78wkiD86YbSA13bfQkpDlBQOrlrtCoj00PCdol2qdZR3UMamzJsNBA7SrAKHFAr
 wRj97DUgwjz/ERL+pInDPUKrdWaOeM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-7lcDVz7JPtKI1Rm4kh0xlA-1; Wed, 27 Oct 2021 06:00:11 -0400
X-MC-Unique: 7lcDVz7JPtKI1Rm4kh0xlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD2D802B7E
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 10:00:10 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B92ADCB;
 Wed, 27 Oct 2021 09:59:46 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] failover: specify an alternate MAC address
Date: Wed, 27 Oct 2021 11:59:45 +0200
Message-Id: <20211027095945.86710-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the guest driver doesn't support the STANDBY feature, by default
we keep the virtio-net device and don't hotplug the VFIO device,
but in some cases, user can prefer to use the VFIO device rather
than the virtio-net one. We can't unplug the virtio-net device
(because on migration it is expected on the destination side) but
we can keep both interfaces if the MAC addresses are different
(to have the same MAC address can cause kernel crash with old
kernel). The VFIO device will be unplugged before the migration
like in the normal failover migration but without a failover device.

This patch adds a new property to the virtio-net device:
"failover-legacy-mac"

If an alternate MAC address is provided with "failover-legacy-mac" and
the STANDBY feature is not supported, both interfaces are plugged
but the standby interface (virtio-net) MAC address is set to the
value provided by the "failover-legacy-mac" parameter.

If the STANDBY feature is supported by guest and QEMU, the virtio-net
failover acts as usual.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v2: rename alt-mac to failover-legacy-mac
        update doc with text provided by MST

 docs/system/virtio-net-failover.rst | 10 ++++++
 hw/net/virtio-net.c                 | 48 +++++++++++++++++++++++------
 include/hw/virtio/virtio-net.h      |  6 ++++
 3 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/docs/system/virtio-net-failover.rst b/docs/system/virtio-net-failover.rst
index 6002dc5d96e4..99f21cd55ef7 100644
--- a/docs/system/virtio-net-failover.rst
+++ b/docs/system/virtio-net-failover.rst
@@ -51,6 +51,16 @@ Usage
   is only for pairing the devices within QEMU. The guest kernel module
   net_failover will match devices with identical MAC addresses.
 
+  For legacy guests (including bios/EUFI) not supporting VIRTIO_NET_F_STANDBY,
+  two options exist:
+
+  1. if failover-legacy-mac has not been configured (default)
+     only the standby virtio-net device is visible to the guest
+
+  2. if failover-legacy-mac has been configured, virtio and vfio devices will
+     be presented to guest as two NIC devices, with virtio using the
+     failover-legacy-mac address.
+
 Hotplug
 -------
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f2014d5ea0b3..0d47d287de14 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -45,6 +45,9 @@
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
 
+/* zero MAC address to check with */
+static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
+
 #define VIRTIO_NET_VM_VERSION    11
 
 #define MAC_TABLE_ENTRIES    64
@@ -126,7 +129,6 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     VirtIONet *n = VIRTIO_NET(vdev);
     struct virtio_net_config netcfg;
     NetClientState *nc = qemu_get_queue(n->nic);
-    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
 
     int ret = 0;
     memset(&netcfg, 0 , sizeof(struct virtio_net_config));
@@ -871,10 +873,21 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     error_propagate(errp, err);
 }
 
+static void failover_plug_primary(VirtIONet *n)
+{
+    Error *err = NULL;
+
+    qapi_event_send_failover_negotiated(n->netclient_name);
+    qatomic_set(&n->failover_primary_hidden, false);
+    failover_add_primary(n, &err);
+    if (err) {
+        warn_report_err(err);
+    }
+}
+
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    Error *err = NULL;
     int i;
 
     if (n->mtu_bypass_backend &&
@@ -921,12 +934,22 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         memset(n->vlans, 0xff, MAX_VLAN >> 3);
     }
 
-    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
-        qapi_event_send_failover_negotiated(n->netclient_name);
-        qatomic_set(&n->failover_primary_hidden, false);
-        failover_add_primary(n, &err);
-        if (err) {
-            warn_report_err(err);
+    if (n->failover) {
+        if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
+            if (memcmp(&n->legacy_mac, &zero, sizeof(zero)) != 0 &&
+                memcmp(n->mac, &n->legacy_mac, ETH_ALEN) == 0) {
+                /*
+                 * set_features can be called twice, without & with F_STANDBY,
+                 * so restore original MAC address
+                 */
+                memcpy(n->mac, &n->nic->conf->macaddr, sizeof(n->mac));
+                qemu_format_nic_info_str(qemu_get_queue(n->nic), n->mac);
+            }
+            failover_plug_primary(n);
+        } else if (memcmp(&n->legacy_mac, &zero, sizeof(zero)) != 0) {
+            memcpy(n->mac, &n->legacy_mac, ETH_ALEN);
+            qemu_format_nic_info_str(qemu_get_queue(n->nic), n->mac);
+            failover_plug_primary(n);
         }
     }
 }
@@ -3595,9 +3618,15 @@ static bool primary_unplug_pending(void *opaque)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIONet *n = VIRTIO_NET(vdev);
 
-    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
+    if (!n->failover) {
         return false;
     }
+
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY) &&
+        memcmp(&n->legacy_mac, &zero, sizeof(zero)) == 0) {
+        return false;
+    }
+
     primary = failover_find_primary_device(n);
     return primary ? primary->pending_deleted_event : false;
 }
@@ -3672,6 +3701,7 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
                        VIRTIO_NET_RSC_DEFAULT_INTERVAL),
     DEFINE_NIC_PROPERTIES(VirtIONet, nic_conf),
+    DEFINE_PROP_MACADDR("failover-legacy-mac",  VirtIONet, legacy_mac),
     DEFINE_PROP_UINT32("x-txtimer", VirtIONet, net_conf.txtimer,
                        TX_TIMER_INTERVAL),
     DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index eb87032627d2..4b9523def5fb 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -213,6 +213,12 @@ struct VirtIONet {
     QDict *primary_opts;
     bool primary_opts_from_json;
     Notifier migration_state;
+    /*
+     * failover: to provide an alternate MAC address allows to keep both
+     * cards, primary and stand-by, if the STANDBY feature is not supported
+     * by the guest
+     */
+    MACAddr legacy_mac;
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
     struct EBPFRSSContext ebpf_rss;
-- 
2.31.1


