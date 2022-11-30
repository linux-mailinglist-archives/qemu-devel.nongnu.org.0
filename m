Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFDA63D468
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:26:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LCp-0004LM-V0; Wed, 30 Nov 2022 06:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCo-0004Kr-DK
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:46 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCm-0004f5-BO
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so26568682wrb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0vYxjuaqbUEfq8b4gIiF/ZbN3KdM8Pj31Ygq8IP/yg=;
 b=L1KC+57by6v+IpoLNdPsTmItlohwFz44/DCEVLB/To7mCmuP7oN8FjkfeW1UUjIAfJ
 PPiPYw5e6hjF/fvlUY4G5SmHWGr4JBnbjxWPvTN0SPtZzsYKBI46iS4ZEZ80BWF8324g
 U/tDKo1IwDWsfJ0tkgrxmMKhBiN6/T9EBv11rjv8YiNnvLTj5Drb4dvDQu/99y57Liu4
 vy0KDYw+PbKbmycKAcj6ZHuATLsjHHNYtU0mrRfJsRa07NFupDjcsJy9Sh/2/EEpbhuB
 XXJX+h7elvim33RReAgbfNwq7fHDSeMSgXXbY4kYr5D8ePjhQKSZrIvik3RFsEow/OZu
 0oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0vYxjuaqbUEfq8b4gIiF/ZbN3KdM8Pj31Ygq8IP/yg=;
 b=C4/LWz9tpfJFZh0xuJmB2/j0XWR6tSAr4nabZ6nnuzB6/BBGdn6kBW1dtpjwiIt4M5
 9hX7oxdvaYE81EBpDsgUpBJ/jXxAP1GwkqfNg2rg65F1j3Hvxx0IoPbK2ygkMVel3q3f
 SZIUuVIud647m4YpYtEropnyeLzmORbjc/DJKk2d/XLY/nq4VTHXFAmlZY3dunup17PU
 5F1Xay4no8eOaFg51Wbqhy/aLiDr7inllhHotjCdGErujsYpEaxwi13cf2cKYDY+/ZOC
 pAQXGSCCYUWAT0s1MZ2d/6etdojWJLDe1xCt+cWY29x7a3JDxnTFFq3+OCskFWEq/zQX
 o+vw==
X-Gm-Message-State: ANoB5pmrvc8uCrR7xGNwIhN5xD+5bCwi02gVYRdfcAnRNR1ILAHItgE8
 GKanqltPGXf+zrzWrIRtII9lHQ==
X-Google-Smtp-Source: AA0mqf4jDNmDC+aTvJq8ud0Rw3dFKEmItHSKlmYL7x/A2xYpV8RujJkElCP3uslkAK+LLo+xTt82ww==
X-Received: by 2002:adf:e105:0:b0:236:73af:f9ad with SMTP id
 t5-20020adfe105000000b0023673aff9admr36161861wrz.225.1669807482931; 
 Wed, 30 Nov 2022 03:24:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a5d44cc000000b002362f6fcaf5sm1266412wrr.48.2022.11.30.03.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:24:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E25B11FFBC;
 Wed, 30 Nov 2022 11:24:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH  v4 4/5] hw/virtio: generalise CHR_EVENT_CLOSED handling
Date: Wed, 30 Nov 2022 11:24:38 +0000
Message-Id: <20221130112439.2527228-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112439.2527228-1-alex.bennee@linaro.org>
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
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
2.34.1


