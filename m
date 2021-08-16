Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB823ED95E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:01:10 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFe6v-0001SB-Fw
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe4t-0007OA-8I
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe4r-0004QR-JM
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629125941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDKpyxF0omOTPJyzF1Kn+LcSkX87I17Qwo22m0DJb/M=;
 b=JZAtJmbfRrL2S/EnmLz6O4qMCcSRAkq3Ykt3I0s60QQ8JIozJVDsdFJ7yrcoHFE9DJqxiW
 GdyMDdF0jtLZxuYrSLgalLJ2DO75l1DMtxmpVDS0ib2SOSkjUdyM0lGqDAnAe5P/OzgZ19
 +VUeaUBxVbRfwAoccMBngzGi0SyOZP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-8vAFv0-lOlK-Wq9diz6qUQ-1; Mon, 16 Aug 2021 10:58:59 -0400
X-MC-Unique: 8vAFv0-lOlK-Wq9diz6qUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15189801B3D;
 Mon, 16 Aug 2021 14:58:59 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C5966E0B6;
 Mon, 16 Aug 2021 14:58:45 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/6] failover: virtio-net: remove failover_primary_hidden
 flag
Date: Mon, 16 Aug 2021 16:58:21 +0200
Message-Id: <20210816145824.15825-4-lvivier@redhat.com>
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

We dont't need a flag to know if the primary device must be hidden, we
can rely on the machine state:
Device is hidden if the machine is in prelaunch state (src) or
in inmigrate state with migration status set to none (dst).
We don't need to check the flag in virtio_net_handle_migration_primary()
because this function is only registered if the failover is enabled
and the flag also set to false. This function also sets it back to
true after a successful unplug during the migration but we don't
need to know it is hidden because nothing will try to plug it back
after the migration (except in case of error but the flag is set
back to false).

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/virtio/virtio-net.h |  2 --
 hw/net/virtio-net.c            | 25 +++++++++++++++----------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 824a69c23f06..21d8c3aa5f3a 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -205,8 +205,6 @@ struct VirtIONet {
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
-    /* primary failover device is hidden*/
-    bool failover_primary_hidden;
     bool failover;
     DeviceListener primary_listener;
     Notifier migration_state;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 0c5ec930356b..c81466f6efb7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -36,8 +36,10 @@
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
 #include "hw/virtio/virtio-access.h"
+#include "migration/migration.h"
 #include "migration/misc.h"
 #include "standard-headers/linux/ethtool.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
@@ -937,7 +939,6 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 
     if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
         qapi_event_send_failover_negotiated(n->netclient_name);
-        qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
             warn_report_err(err);
@@ -3225,7 +3226,6 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
         return false;
     }
     qdev_set_parent_bus(dev, primary_bus, &error_abort);
-    qatomic_set(&n->failover_primary_hidden, false);
     hotplug_ctrl = qdev_get_hotplug_handler(dev);
     if (hotplug_ctrl) {
         hotplug_handler_pre_plug(hotplug_ctrl, dev, &err);
@@ -3243,7 +3243,6 @@ out:
 
 static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
 {
-    bool should_be_hidden;
     Error *err = NULL;
     DeviceState *dev = failover_find_primary_device(n);
 
@@ -3251,13 +3250,10 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
         return;
     }
 
-    should_be_hidden = qatomic_read(&n->failover_primary_hidden);
-
-    if (migration_in_setup(s) && !should_be_hidden) {
+    if (migration_in_setup(s)) {
         if (failover_unplug_primary(n, dev)) {
             vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
             qapi_event_send_unplug_primary(dev->id);
-            qatomic_set(&n->failover_primary_hidden, true);
         } else {
             warn_report("couldn't unplug primary device");
         }
@@ -3299,8 +3295,18 @@ static bool failover_hide_primary_device(DeviceListener *listener,
         return false;
     }
 
-    /* failover_primary_hidden is set during feature negotiation */
-    return qatomic_read(&n->failover_primary_hidden);
+    if (runstate_check(RUN_STATE_PRELAUNCH)) {
+        /* hide the failover primary on src on startup */
+        return true;
+    }
+
+    if (runstate_check(RUN_STATE_INMIGRATE) &&
+        migration_incoming_get_current()->state == MIGRATION_STATUS_NONE) {
+        /* hide the failover primary on dest on startup */
+        return true;
+    }
+
+    return false;
 }
 
 static void virtio_net_device_realize(DeviceState *dev, Error **errp)
@@ -3338,7 +3344,6 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
 
     if (n->failover) {
         n->primary_listener.hide_device = failover_hide_primary_device;
-        qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
         n->migration_state.notify = virtio_net_migration_state_notifier;
         add_migration_state_change_notifier(&n->migration_state);
-- 
2.31.1


