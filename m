Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC593E4AA1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:15:20 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8rv-0006Cj-7u
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mD8qf-0004zh-N3
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mD8qe-0004kp-0m
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628529239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0p5WhJfZl3Kma45czLYahy111/GBe94Y4IWP4BL+rY=;
 b=QipVWZXhGdTj2xNwK0EaImvrIi7kaRonAmNhScM1veZXWh7IHbdtXqUeoVBXDv6bg0EQSj
 S3j7szfzoLBuWPdwyzAKnMOnpL7aeICLW97JMK4AsorQMe4GsscIZehXcjbmtl/AR7rDka
 5pKrZJpBA/v4I4ZpOoJuiasMHF8ScqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-IcPeWbwCPRuhlUWDaVc_3A-1; Mon, 09 Aug 2021 13:13:58 -0400
X-MC-Unique: IcPeWbwCPRuhlUWDaVc_3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E1F107ACF5
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 17:13:57 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A592C5DF21;
 Mon,  9 Aug 2021 17:13:53 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] virtio: failover: define the default device to use in
 case of error
Date: Mon,  9 Aug 2021 19:13:42 +0200
Message-Id: <20210809171342.18146-2-lvivier@redhat.com>
In-Reply-To: <20210809171342.18146-1-lvivier@redhat.com>
References: <20210809171342.18146-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the guest driver doesn't support the STANDBY feature, by default
we keep the virtio-net device and don't hotplug the VFIO device,
but in some cases, user can prefer to use the VFIO device rather
than the virtio-net one. We can't unplug the virtio-net device
(because on migration it is expected on the destination side)
but we can force the guest driver to be disabled. Then, we can
hotplug the VFIO device that will be unplugged before the migration
like in the normal failover migration but without the failover device.

This patch adds a new property to virtio-net device: "failover-default".

By default, "failover-default" is set to true and thus the default NIC
to use if the failover cannot be enabled is the virtio-net device
(this is what is done until now with the virtio-net failover).

If "failover-default" is set to false, in case of error, the virtio-net
device is not the default anymore and the failover primary device
is used instead.

If the STANDBY feature is supported by guest and host, the virtio-net
failover acts as usual.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 +
 hw/net/virtio-net.c            | 49 +++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 824a69c23f06..ab77930a327e 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -208,6 +208,7 @@ struct VirtIONet {
     /* primary failover device is hidden*/
     bool failover_primary_hidden;
     bool failover;
+    bool failover_default;
     DeviceListener primary_listener;
     Notifier migration_state;
     VirtioNetRssData rss_data;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52a..972c03232a96 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -935,12 +935,23 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         memset(n->vlans, 0xff, MAX_VLAN >> 3);
     }
 
-    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
-        qapi_event_send_failover_negotiated(n->netclient_name);
-        qatomic_set(&n->failover_primary_hidden, false);
-        failover_add_primary(n, &err);
-        if (err) {
-            warn_report_err(err);
+    /*
+     * if the virtio-net driver has the STANDBY feature, we can plug the primary
+     * if not but is not the default failover device,
+     * we need to plug the primary alone and the virtio-net driver will
+     * be disabled in the validate_features() function but validate_features()
+     * is only available with virtio 1.0 spec
+     */
+    if (n->failover) {
+        if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY) ||
+           (virtio_has_feature(features, VIRTIO_F_VERSION_1) &&
+            !n->failover_default)) {
+            qapi_event_send_failover_negotiated(n->netclient_name);
+            qatomic_set(&n->failover_primary_hidden, false);
+            failover_add_primary(n, &err);
+            if (err) {
+                warn_report_err(err);
+            }
         }
     }
 }
@@ -3625,9 +3636,34 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_INT32("speed", VirtIONet, net_conf.speed, SPEED_UNKNOWN),
     DEFINE_PROP_STRING("duplex", VirtIONet, net_conf.duplex_str),
     DEFINE_PROP_BOOL("failover", VirtIONet, failover, false),
+    DEFINE_PROP_BOOL("failover-default", VirtIONet, failover_default, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/* validate_features() is only available with VIRTIO_F_VERSION_1 */
+static int failover_validate_features(VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+
+    /*
+     * If the guest driver doesn't support the STANDBY feature, by default
+     * we keep the virtio-net device and don't hotplug the VFIO device,
+     * but in some cases, user can prefer to use the VFIO device rather
+     * than the virtio-net one. We can't unplug the virtio-net device
+     * (because on migration it is expected on the destination side)
+     * but we can force the guest driver to be disabled. In this case, We can
+     * hotplug the VFIO device that will be unplugged before the migration
+     * like in the normal failover migration but without the failover device.
+     */
+    if (n->failover && !n->failover_default &&
+        !virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
+        /* disable virtio-net */
+        return -ENODEV;
+    }
+
+    return 0;
+}
+
 static void virtio_net_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3651,6 +3687,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
+    vdc->validate_features = failover_validate_features;
 }
 
 static const TypeInfo virtio_net_info = {
-- 
2.31.1


