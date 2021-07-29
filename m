Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916CF3DABC6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:21:58 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9BbR-0000Ti-Kg
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m9BZr-0007Bw-5k
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m9BZp-00066y-Dd
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627586416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpisueJxgFlIT8wxh2HjvXQpKaEAT4rXIT8y1vLGI4I=;
 b=S79DpjqnWR+Gv92H3txE7tRrWAxxSwnf/8fJU3pqQ2hl0jX8u70S7Cb94bKRyBWN4Cms2Y
 F9PTQ4yWl+dxs0XapyHZhCcoBvQntSFMhrdVP6B6jWz6gMF+MpnzPOFz9zgIPa+Cyuk79l
 uDcfwt7vDi4M6ADA4Afwsx/VaLibtcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-aSboEl4bOAyx-0A6wN_adg-1; Thu, 29 Jul 2021 15:19:24 -0400
X-MC-Unique: aSboEl4bOAyx-0A6wN_adg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D4C3482F
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 19:19:23 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31061369A;
 Thu, 29 Jul 2021 19:19:22 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] virtio: failover: define the default device to use in
 case of error
Date: Thu, 29 Jul 2021 21:19:10 +0200
Message-Id: <20210729191910.317114-3-lvivier@redhat.com>
In-Reply-To: <20210729191910.317114-1-lvivier@redhat.com>
References: <20210729191910.317114-1-lvivier@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 hw/net/virtio-net.c            | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

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
index 16d20cdee52a..6fe0a09a263b 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -891,6 +891,39 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
     Error *err = NULL;
     int i;
 
+    /*
+     * If the guest driver doesn't support the STANDBY feature, by default
+     * we keep the virtio-net device and don't hotplug the VFIO device,
+     * but in some cases, user can prefer to use the VFIO device rather
+     * than the virtio-net one. We can't unplug the virtio-net device
+     * (because on migration it is expected on the destination side)
+     * but we can force the guest driver to be disabled. Then, we can
+     * hotplug the VFIO device that will be unplugged before the migration
+     * like in the normal failover migration but without the failover device.
+     */
+    if (n->failover && !n->failover_default) {
+        if (!virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
+            /* disable the first queue to disable the driver */
+            virtio_queue_disable(vdev, 0);
+            /*
+             * as the virtio-net driver is disable we can plug back the
+             * failover primary device
+             */
+            qatomic_set(&n->failover_primary_hidden, false);
+            failover_add_primary(n, &err);
+            if (err) {
+                warn_report_err(err);
+            }
+            return;
+        } else {
+          /*
+           * if the driver renegotiates features, we need to re-enable
+           * the queue
+           */
+          virtio_queue_enable(vdev, 0);
+        }
+    }
+
     if (n->mtu_bypass_backend &&
             !virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_MTU)) {
         features &= ~(1ULL << VIRTIO_NET_F_MTU);
@@ -3625,6 +3658,7 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_INT32("speed", VirtIONet, net_conf.speed, SPEED_UNKNOWN),
     DEFINE_PROP_STRING("duplex", VirtIONet, net_conf.duplex_str),
     DEFINE_PROP_BOOL("failover", VirtIONet, failover, false),
+    DEFINE_PROP_BOOL("failover-default", VirtIONet, failover_default, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


