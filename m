Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B363AE08
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:43:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhCJ-0005kB-Hx; Mon, 28 Nov 2022 11:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhC1-0005es-OH
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:17 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBw-0004p3-94
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:16 -0500
Received: by mail-wr1-x429.google.com with SMTP id q7so16909634wrr.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t99r97KCMhXOciLLqoHwe9PQyDGYbDiDI/NZ8iKrgRk=;
 b=gfzXxV+32fSwTQnK/DhCd3u/ZV4415Ir9JddM1WpLdYlL16ZLNkRwOw64YWzMtNysq
 gX49rBDMVbK0AqQ3FyMYZNpuCJkxxPT0ojjwk7XDGezio1Gn6SiGRkPM/4wGm3OLCZkU
 DacMvQvm2LDzogfqlO+rwPUdf0P6JuNYuU33THgagOg8binDquCBL/WNoLiWpESmdTFY
 jrwMnHtSEirPCvsFXaqcOAxdtmrRe8Dr2Pb7bv+XUF/NTo6P0io4+eaQxnTklWTIVFb0
 YSd0mMHv6XpaElSC5PW7w+y3VwBRmQgUOvzjQCC0R0NBbahLXSRIr6zIy+Jl8CPeZoAF
 qvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t99r97KCMhXOciLLqoHwe9PQyDGYbDiDI/NZ8iKrgRk=;
 b=4HRDpnUZvPivTOQi2x5MyEw1tQBMe5ZzCqLsfC4zwdW3dH7TRe7f8EXmPQpN7t7IoV
 ROAr8XyTzbtsiz+zrykC7mv7mvJcQ1Ua5ogRni1Q/FWY0ui8YZNfbTx59icOXhUI48oU
 H3PUB5JSOb3hZ5BJ+UDp8XrrFZnysoJzSNXbNYA2IUOWll2A/cqmZZRQgy/ixdEhONX6
 yT8eN1nyeluiNKMsfdrMZTdO/0xaEpB5iZmKcqhVcrFvYB0yV6lDN2RGUW2DC3uWLzyQ
 Q+yb5DvzPrOITtGSiZZGcPmPcIRrHthrb72l4jmCtFUCmUekGrNF5Pls601cZVjakpua
 sXCw==
X-Gm-Message-State: ANoB5pnn2hox0BkovILX4yJHTtDL1N5FLEsKsqNkq8Zh7nJMK+/4Kcix
 xGbQEeTKN0DD8qNC5BXKVM37Qg==
X-Google-Smtp-Source: AA0mqf5XZ7KJFi+vv4UufAZ1AFG16qx3Ks6zX5EblTjAWlH1dNcprQ/OWhcIVn0SiaZesCZohHmH7w==
X-Received: by 2002:a05:6000:24f:b0:242:1f0d:a223 with SMTP id
 m15-20020a056000024f00b002421f0da223mr607250wrz.409.1669653670864; 
 Mon, 28 Nov 2022 08:41:10 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a5d5141000000b002365cd93d05sm11118156wrt.102.2022.11.28.08.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:41:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F0401FFBF;
 Mon, 28 Nov 2022 16:41:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH  v3 7/7] hw/virtio: generalise CHR_EVENT_CLOSED handling
Date: Mon, 28 Nov 2022 16:41:05 +0000
Message-Id: <20221128164105.1191058-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128164105.1191058-1-alex.bennee@linaro.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

..and use for both virtio-user-blk and virtio-user-gpio. This avoids
the circular close by deferring shutdown due to disconnection until a
later point. virtio-user-blk already had this mechanism in place so
generalise it as a vhost-user helper function and use for both blk and
gpio devices.

While we are at it we also fix up vhost-user-gpio to re-establish the
event handler after close down so we can reconnect later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
index 75e28bcd3b..cd76287766 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -239,6 +239,8 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
     return 0;
 }
 
+static void vu_gpio_event(void *opaque, QEMUChrEvent event);
+
 static void vu_gpio_disconnect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -251,6 +253,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
 
     vu_gpio_stop(vdev);
     vhost_dev_cleanup(&gpio->vhost_dev);
+
+    /* Re-instate the event handler for new connections */
+    qemu_chr_fe_set_handlers(&gpio->chardev,
+                             NULL, NULL, vu_gpio_event,
+                             NULL, dev, NULL, true);
 }
 
 static void vu_gpio_event(void *opaque, QEMUChrEvent event)
@@ -268,7 +275,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEvent event)
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
2.34.1


