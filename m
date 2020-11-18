Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEE92B79DF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:02:30 +0100 (CET)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJMD-0002SP-56
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyq-0002pX-MH
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyo-0005b5-P7
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPtoxv7WglKBnzgx+soovpjTMEuQkTMmvaZ6ApeJyOI=;
 b=Cch/MK859D8kgzWlQU56xmSB0MC9GkzRmTLdzB9OYzLpDIqsElg6bk+Fjdwlot+gmpVHV5
 g8e0tqzi+JJDIgtwz65r0EIORgJv2r2TcJT3pV+eIzdKKIFIRqH4Vqw22tVHyOxPBpnVP1
 MBH5uaMXVGnxpQLWSVjATV64o2efhE8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-icS13zy2OcqVXJFHSyWbAg-1; Wed, 18 Nov 2020 03:38:16 -0500
X-MC-Unique: icS13zy2OcqVXJFHSyWbAg-1
Received: by mail-wr1-f71.google.com with SMTP id w6so636993wrk.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPtoxv7WglKBnzgx+soovpjTMEuQkTMmvaZ6ApeJyOI=;
 b=WwwMuosOTYTK87gkCYFAkZvg+G8e2FN+/2Ny0kMQiDapE2si+6QSXiObQ59U/APur8
 WHf6FKV63yaSshTDUqjZoOpAz3YilBlg8bHv9o8bN8IPSDFYJk1znNI3CsKYkENwYxc5
 tAgfUkXCr1f4OYKN7buEKmAK15NWc1VaaPOq6jvcpdbAE0Gki78f5GnbnHvilSoeexgS
 Uu8rzNd0YChxVo/LwzLojHIZ+/Mit+zLSpZWyfV7oGYL3hgPE489/dU97Ca+0wbcFnjR
 8IzuFIpjfqHfN8O/W5kuiLyMuMLvOZgB0HKMngkFVcpk6mp/CS4PAzwV9hb/EJt9Cemr
 rmeg==
X-Gm-Message-State: AOAM533Wc9gKRICcYb5p/xT9sRZzk4caLv8TJ6wM/y+JQf+3GQrumeOk
 osgM2Y13kPhRCwi/Ktgb9TFES5CX1ceXiqocXtBCe+wBosOp62Z0QBR0y16GG1/6LwtaDBcDTI0
 5/YvuBcd9XVYwlZuAc+AJyXnGD4kVFlC2ATirwpJEF+7OyI6b8KRKO9qYqJdk9ZZ/tkk=
X-Received: by 2002:a5d:6447:: with SMTP id d7mr3723263wrw.96.1605688694853;
 Wed, 18 Nov 2020 00:38:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/64tz/J/1yCJW+YtAzifGvixV7GaEpevSGQdCB5qvzagFWSSHJwObmBfTjfFmLG+3Od5ZuA==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr3723241wrw.96.1605688694634;
 Wed, 18 Nov 2020 00:38:14 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id 17sm7656486wma.3.2020.11.18.00.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/27] failover: Rename function to hide_device()
Date: Wed, 18 Nov 2020 09:37:37 +0100
Message-Id: <20201118083748.1328-17-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You should not use pasive.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/qdev-core.h | 28 +++++++++++++++-------------
 hw/core/qdev.c         |  4 ++--
 hw/net/virtio-net.c    |  7 +++----
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 250f4edef6..6ac86db44e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -81,16 +81,17 @@ typedef void (*BusUnrealize)(BusState *bus);
  * </note>
  *
  * # Hiding a device #
- * To hide a device, a DeviceListener function should_be_hidden() needs to
+ * To hide a device, a DeviceListener function hide_device() needs to
  * be registered.
- * It can be used to defer adding a device and therefore hide it from the
- * guest. The handler registering to this DeviceListener can save the QOpts
- * passed to it for re-using it later and must return that it wants the device
- * to be/remain hidden or not. When the handler function decides the device
- * shall not be hidden it will be added in qdev_device_add() and
- * realized as any other device. Otherwise qdev_device_add() will return early
- * without adding the device. The guest will not see a "hidden" device
- * until it was marked don't hide and qdev_device_add called again.
+ * It can be used to defer adding a device and therefore hide it from
+ * the guest. The handler registering to this DeviceListener can save
+ * the QOpts passed to it for re-using it later. It must return if it
+ * wants the device to be hidden or visible. When the handler function
+ * decides the device shall be visible it will be added with
+ * qdev_device_add() and realized as any other device. Otherwise
+ * qdev_device_add() will return early without adding the device. The
+ * guest will not see a "hidden" device until it was marked visible
+ * and qdev_device_add called again.
  *
  */
 struct DeviceClass {
@@ -196,11 +197,12 @@ struct DeviceListener {
     void (*realize)(DeviceListener *listener, DeviceState *dev);
     void (*unrealize)(DeviceListener *listener, DeviceState *dev);
     /*
-     * This callback is called upon init of the DeviceState and allows to
-     * inform qdev that a device should be hidden, depending on the device
-     * opts, for example, to hide a standby device.
+     * This callback is called upon init of the DeviceState and
+     * informs qdev if a device should be visible or hidden.  We can
+     * hide a failover device depending for example on the device
+     * opts.
      */
-    bool (*should_be_hidden)(DeviceListener *listener, QemuOpts *device_opts);
+    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 8f4b8f3cc1..cbdff0b6c6 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -217,8 +217,8 @@ bool qdev_should_hide_device(QemuOpts *opts)
     DeviceListener *listener;
 
     QTAILQ_FOREACH(listener, &device_listeners, link) {
-        if (listener->should_be_hidden) {
-            if (listener->should_be_hidden(listener, opts)) {
+        if (listener->hide_device) {
+            if (listener->hide_device(listener, opts)) {
                 return true;
             }
         }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9f12d33da0..747614ff2a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3161,8 +3161,8 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
     virtio_net_handle_migration_primary(n, s);
 }
 
-static bool virtio_net_primary_should_be_hidden(DeviceListener *listener,
-                                                QemuOpts *device_opts)
+static bool failover_hide_primary_device(DeviceListener *listener,
+                                         QemuOpts *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     bool hide;
@@ -3220,8 +3220,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     if (n->failover) {
-        n->primary_listener.should_be_hidden =
-            virtio_net_primary_should_be_hidden;
+        n->primary_listener.hide_device = failover_hide_primary_device;
         qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
         n->migration_state.notify = virtio_net_migration_state_notifier;
-- 
2.26.2


