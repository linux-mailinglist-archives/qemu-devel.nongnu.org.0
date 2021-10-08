Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC033426C03
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:53:20 +0200 (CEST)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYqJL-0003jO-BY
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq4W-0003yy-5P
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq4T-0005fm-Up
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WjBdz/6j8bBjxLCB04zzlXvVueacn5cmIOmGJiyL/I=;
 b=Gy7LOkHzLrHmCOloE2h0JDPfXco49P2E5tYANwO3MycMMutaFPYUzdk/WsmaWvRHFTd6uX
 9Jr94+cPPesCLDEy95mDVJnkx1VuH8t2AKitiBxuUUX/QmMK/aaD4MARuc9jcw9LB1c3ph
 /M0RdpUpoRoSFAwqY0SBC5mTi+eRo38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-5F_YD_w-PvWIhdFLYuvjuQ-1; Fri, 08 Oct 2021 09:37:55 -0400
X-MC-Unique: 5F_YD_w-PvWIhdFLYuvjuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0965C10939E3;
 Fri,  8 Oct 2021 13:36:57 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063B019724;
 Fri,  8 Oct 2021 13:36:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] qdev: Add Error parameter to hide_device() callbacks
Date: Fri,  8 Oct 2021 15:34:38 +0200
Message-Id: <20211008133442.141332-12-kwolf@redhat.com>
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hide_device() is used for virtio-net failover, where the standby virtio
device delays creation of the primary device. It only makes sense to
have a single primary device for each standby device. Adding a second
one should result in an error instead of hiding it and never using it
afterwards.

Prepare for this by adding an Error parameter to the hide_device()
callback where virtio-net is informed about adding a primary device.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/qdev-core.h | 8 ++++++--
 hw/core/qdev.c         | 7 +++++--
 hw/net/virtio-net.c    | 2 +-
 softmmu/qdev-monitor.c | 5 ++++-
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 5a073fc368..74d8b614a7 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -201,8 +201,12 @@ struct DeviceListener {
      * informs qdev if a device should be visible or hidden.  We can
      * hide a failover device depending for example on the device
      * opts.
+     *
+     * On errors, it returns false and errp is set. Device creation
+     * should fail in this case.
      */
-    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts);
+    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts,
+                        Error **errp);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
@@ -837,7 +841,7 @@ void device_listener_unregister(DeviceListener *listener);
  * When a device is added via qdev_device_add() this will be called,
  * and return if the device should be added now or not.
  */
-bool qdev_should_hide_device(QemuOpts *opts);
+bool qdev_should_hide_device(QemuOpts *opts, Error **errp);
 
 typedef enum MachineInitPhase {
     /* current_machine is NULL.  */
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d918b50a1d..c3a021c444 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -211,14 +211,17 @@ void device_listener_unregister(DeviceListener *listener)
     QTAILQ_REMOVE(&device_listeners, listener, link);
 }
 
-bool qdev_should_hide_device(QemuOpts *opts)
+bool qdev_should_hide_device(QemuOpts *opts, Error **errp)
 {
+    ERRP_GUARD();
     DeviceListener *listener;
 
     QTAILQ_FOREACH(listener, &device_listeners, link) {
         if (listener->hide_device) {
-            if (listener->hide_device(listener, opts)) {
+            if (listener->hide_device(listener, opts, errp)) {
                 return true;
+            } else if (*errp) {
+                return false;
             }
         }
     }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f205331dcf..a17d5739fc 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3304,7 +3304,7 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
 }
 
 static bool failover_hide_primary_device(DeviceListener *listener,
-                                         QemuOpts *device_opts)
+                                         QemuOpts *device_opts, Error **errp)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     const char *standby_id;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index feb15818e6..ccc3c11563 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -625,6 +625,7 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
 
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
 {
+    ERRP_GUARD();
     DeviceClass *dc;
     const char *driver, *path;
     DeviceState *dev = NULL;
@@ -668,11 +669,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
             error_setg(errp, "Device with failover_pair_id don't have id");
             return NULL;
         }
-        if (qdev_should_hide_device(opts)) {
+        if (qdev_should_hide_device(opts, errp)) {
             if (bus && !qbus_is_hotpluggable(bus)) {
                 error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
             }
             return NULL;
+        } else if (*errp) {
+            return NULL;
         }
     }
 
-- 
2.31.1


