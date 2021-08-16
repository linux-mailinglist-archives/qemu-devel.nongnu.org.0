Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0443ED960
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:01:25 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFe7A-0001x1-Kl
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe4d-0007Dy-LB
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mFe4b-0004FO-Ft
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629125924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4lBP7OItPj97GmmCHX07BUF4/qvGLs2zCDqDf3BibLU=;
 b=TJ+QiKAdqYZiWUh0qwVoq0N9OQGNGgp1lEwP72bBJq47Lj/QQaup3E9IMGZdD91Ne80XRF
 gY0M7heRhqWY6yODNHmw1t53sU1gc4YuPdmS0OEXUTyy4IRir56LEiEthYi41wHY+wTO1P
 p3Hx4oxMuS9wwp4ffBlA6OwxBmBZcyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-t-CPusJNMYCw2oN7hPz0Yw-1; Mon, 16 Aug 2021 10:58:43 -0400
X-MC-Unique: t-CPusJNMYCw2oN7hPz0Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D06B871807;
 Mon, 16 Aug 2021 14:58:42 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18C5F6E6E1;
 Mon, 16 Aug 2021 14:58:39 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/6] qdev: add an Error parameter to the DeviceListener
 hide_device() function
Date: Mon, 16 Aug 2021 16:58:19 +0200
Message-Id: <20210816145824.15825-2-lvivier@redhat.com>
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

This allows an error to be reported to the caller of qdev_device_add()

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/qdev-core.h | 6 ++++--
 hw/core/qdev.c         | 4 ++--
 hw/net/virtio-net.c    | 2 +-
 softmmu/qdev-monitor.c | 4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1b..e23b23a2f8d6 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -202,7 +202,8 @@ struct DeviceListener {
      * hide a failover device depending for example on the device
      * opts.
      */
-    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts);
+    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts,
+                        Error **errp);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
@@ -804,12 +805,13 @@ void device_listener_unregister(DeviceListener *listener);
 /**
  * @qdev_should_hide_device:
  * @opts: QemuOpts as passed on cmdline.
+ * @errp: pointer to error object
  *
  * Check if a device should be added.
  * When a device is added via qdev_device_add() this will be called,
  * and return if the device should be added now or not.
  */
-bool qdev_should_hide_device(QemuOpts *opts);
+bool qdev_should_hide_device(QemuOpts *opts, Error **errp);
 
 typedef enum MachineInitPhase {
     /* current_machine is NULL.  */
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a92..13f4c1e696bf 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -211,13 +211,13 @@ void device_listener_unregister(DeviceListener *listener)
     QTAILQ_REMOVE(&device_listeners, listener, link);
 }
 
-bool qdev_should_hide_device(QemuOpts *opts)
+bool qdev_should_hide_device(QemuOpts *opts, Error **errp)
 {
     DeviceListener *listener;
 
     QTAILQ_FOREACH(listener, &device_listeners, link) {
         if (listener->hide_device) {
-            if (listener->hide_device(listener, opts)) {
+            if (listener->hide_device(listener, opts, errp)) {
                 return true;
             }
         }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52a..542f9e167eb4 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3279,7 +3279,7 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
 }
 
 static bool failover_hide_primary_device(DeviceListener *listener,
-                                         QemuOpts *device_opts)
+                                         QemuOpts *device_opts, Error **errp)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     const char *standby_id;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d8200..7adf0d22beb1 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -627,8 +627,8 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
             error_setg(errp, "Device with failover_pair_id don't have id");
             return NULL;
         }
-        if (qdev_should_hide_device(opts)) {
-            if (bus && !qbus_is_hotpluggable(bus)) {
+        if (qdev_should_hide_device(opts, errp)) {
+            if (errp && !*errp && bus && !qbus_is_hotpluggable(bus)) {
                 error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
             }
             return NULL;
-- 
2.31.1


