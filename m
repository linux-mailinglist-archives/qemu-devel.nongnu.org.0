Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB8642658
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Bg-0002G0-0x; Mon, 05 Dec 2022 04:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28BT-0001xx-9s
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28BP-0006wx-SL
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wv3mQ50z7ELRb+0PxbMX5qClEbrZYnNWGDwG8BSgdlg=;
 b=OEeKb8NlIf+HwalK72K5FStBYR0UwDUb0NOL8qCxadf+miCWeuBX9/DNV5qfgTTb0TGr/S
 W+Ix9t0EiWndbNLQ9QTFVam4CdpN+Xwpa2/ZEKr6sI1ehv+6WmSuzTTH6T7eQXRIH4tHMC
 sLdPq2EhQJckNbVGVOj9CmDtlVQOAXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-SDGhJug8OKyBI7Not_p4Fg-1; Mon, 05 Dec 2022 04:54:39 -0500
X-MC-Unique: SDGhJug8OKyBI7Not_p4Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD957101A52A;
 Mon,  5 Dec 2022 09:54:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE8AE2166B30;
 Mon,  5 Dec 2022 09:54:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 15/51] hw/virtio: generalise CHR_EVENT_CLOSED handling
Date: Mon,  5 Dec 2022 10:51:52 +0100
Message-Id: <20221205095228.1314-16-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

..and use for both virtio-user-blk and virtio-user-gpio. This avoids
the circular close by deferring shutdown due to disconnection until a
later point. virtio-user-blk already had this mechanism in place so
generalise it as a vhost-user helper function and use for both blk and
gpio devices.

While we are at it we also fix up vhost-user-gpio to re-establish the
event handler after close down so we can reconnect later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20221130112439.2527228-5-alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user.h | 18 +++++++++
 hw/block/vhost-user-blk.c      | 41 +++-----------------
 hw/virtio/vhost-user-gpio.c    | 11 +++++-
 hw/virtio/vhost-user.c         | 71 ++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+), 37 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index c6e693cd3f..191216a74f 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -68,4 +68,22 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
  */
 void vhost_user_cleanup(VhostUserState *user);
 
+/**
+ * vhost_user_async_close() - cleanup vhost-user post connection drop
+ * @d: DeviceState for the associated device (passed to callback)
+ * @chardev: the CharBackend associated with the connection
+ * @vhost: the common vhost device
+ * @cb: the user callback function to complete the clean-up
+ *
+ * This function is used to handle the shutdown of a vhost-user
+ * connection to a backend. We handle this centrally to make sure we
+ * do all the steps and handle potential races due to VM shutdowns.
+ * Once the connection is disabled we call a backhalf to ensure
+ */
+typedef void (*vu_async_close_fn)(DeviceState *cb);
+
+void vhost_user_async_close(DeviceState *d,
+                            CharBackend *chardev, struct vhost_dev *vhost,
+                            vu_async_close_fn cb);
+
 #endif
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1177064631..aff4d2b8cb 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -369,17 +369,10 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
     vhost_user_blk_stop(vdev);
 
     vhost_dev_cleanup(&s->dev);
-}
 
-static void vhost_user_blk_chr_closed_bh(void *opaque)
-{
-    DeviceState *dev = opaque;
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VHostUserBlk *s = VHOST_USER_BLK(vdev);
-
-    vhost_user_blk_disconnect(dev);
+    /* Re-instate the event handler for new connections */
     qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
-                             NULL, opaque, NULL, true);
+                             NULL, dev, NULL, true);
 }
 
 static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
@@ -398,33 +391,9 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
         }
         break;
     case CHR_EVENT_CLOSED:
-        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
-            /*
-             * A close event may happen during a read/write, but vhost
-             * code assumes the vhost_dev remains setup, so delay the
-             * stop & clear.
-             */
-            AioContext *ctx = qemu_get_current_aio_context();
-
-            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
-                    NULL, NULL, false);
-            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
-
-            /*
-             * Move vhost device to the stopped state. The vhost-user device
-             * will be clean up and disconnected in BH. This can be useful in
-             * the vhost migration code. If disconnect was caught there is an
-             * option for the general vhost code to get the dev state without
-             * knowing its type (in this case vhost-user).
-             *
-             * FIXME: this is sketchy to be reaching into vhost_dev
-             * now because we are forcing something that implies we
-             * have executed vhost_dev_stop() but that won't happen
-             * until vhost_user_blk_stop() gets called from the bh.
-             * Really this state check should be tracked locally.
-             */
-            s->dev.started = false;
-        }
+        /* defer close until later to avoid circular close */
+        vhost_user_async_close(dev, &s->chardev, &s->dev,
+                               vhost_user_blk_disconnect);
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index be9be08b4c..b7b82a1099 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -233,6 +233,8 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
     return 0;
 }
 
+static void vu_gpio_event(void *opaque, QEMUChrEvent event);
+
 static void vu_gpio_disconnect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -245,6 +247,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
 
     vu_gpio_stop(vdev);
     vhost_dev_cleanup(&gpio->vhost_dev);
+
+    /* Re-instate the event handler for new connections */
+    qemu_chr_fe_set_handlers(&gpio->chardev,
+                             NULL, NULL, vu_gpio_event,
+                             NULL, dev, NULL, true);
 }
 
 static void vu_gpio_event(void *opaque, QEMUChrEvent event)
@@ -262,7 +269,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEvent event)
         }
         break;
     case CHR_EVENT_CLOSED:
-        vu_gpio_disconnect(dev);
+        /* defer close until later to avoid circular close */
+        vhost_user_async_close(dev, &gpio->chardev, &gpio->vhost_dev,
+                               vu_gpio_disconnect);
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index abe23d4ebe..8f635844af 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
+#include "sysemu/runstate.h"
 #include "sysemu/cryptodev.h"
 #include "migration/migration.h"
 #include "migration/postcopy-ram.h"
@@ -2670,6 +2671,76 @@ void vhost_user_cleanup(VhostUserState *user)
     user->chr = NULL;
 }
 
+
+typedef struct {
+    vu_async_close_fn cb;
+    DeviceState *dev;
+    CharBackend *cd;
+    struct vhost_dev *vhost;
+} VhostAsyncCallback;
+
+static void vhost_user_async_close_bh(void *opaque)
+{
+    VhostAsyncCallback *data = opaque;
+    struct vhost_dev *vhost = data->vhost;
+
+    /*
+     * If the vhost_dev has been cleared in the meantime there is
+     * nothing left to do as some other path has completed the
+     * cleanup.
+     */
+    if (vhost->vdev) {
+        data->cb(data->dev);
+    }
+
+    g_free(data);
+}
+
+/*
+ * We only schedule the work if the machine is running. If suspended
+ * we want to keep all the in-flight data as is for migration
+ * purposes.
+ */
+void vhost_user_async_close(DeviceState *d,
+                            CharBackend *chardev, struct vhost_dev *vhost,
+                            vu_async_close_fn cb)
+{
+    if (!runstate_check(RUN_STATE_SHUTDOWN)) {
+        /*
+         * A close event may happen during a read/write, but vhost
+         * code assumes the vhost_dev remains setup, so delay the
+         * stop & clear.
+         */
+        AioContext *ctx = qemu_get_current_aio_context();
+        VhostAsyncCallback *data = g_new0(VhostAsyncCallback, 1);
+
+        /* Save data for the callback */
+        data->cb = cb;
+        data->dev = d;
+        data->cd = chardev;
+        data->vhost = vhost;
+
+        /* Disable any further notifications on the chardev */
+        qemu_chr_fe_set_handlers(chardev,
+                                 NULL, NULL, NULL, NULL, NULL, NULL,
+                                 false);
+
+        aio_bh_schedule_oneshot(ctx, vhost_user_async_close_bh, data);
+
+        /*
+         * Move vhost device to the stopped state. The vhost-user device
+         * will be clean up and disconnected in BH. This can be useful in
+         * the vhost migration code. If disconnect was caught there is an
+         * option for the general vhost code to get the dev state without
+         * knowing its type (in this case vhost-user).
+         *
+         * Note if the vhost device is fully cleared by the time we
+         * execute the bottom half we won't continue with the cleanup.
+         */
+        vhost->started = false;
+    }
+}
+
 static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
 {
     if (!virtio_has_feature(dev->protocol_features,
-- 
2.38.1


