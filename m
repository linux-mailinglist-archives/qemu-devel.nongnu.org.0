Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A96638F10
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycXb-0004V3-3a; Fri, 25 Nov 2022 12:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXO-0004PG-OB
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXK-0004Vu-VC
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id cl5so7765794wrb.9
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJQ/JEKALcH9lJ7xFy8iXB5Ea36VbtyMrZxDHC60VlY=;
 b=AUagxbEO11o/1lfmwfVUjY8I5arrrcNeztWvK4rAJFq54a3oDh//kSmc2cySSkLg4n
 ysNKCxIfwErf1dDKR7cR9yNU4AO6usKTAAsVvZ5pfJlUYbTZWLwwnxF0FImJaujYVGSm
 8yyi6DEwDGbpSlUdUbV2Ug7DRB0ahYsQ/H356W2n0Scriu/F/iE9pcw8KlyghvNRruA+
 90F4Pgw5yalJlkLFpycPIRm8VeUr70HoiqxpobCmUbtn1wkBAw/EaFDhEEN89efrjONj
 7ndCkykUjb4SGk8n47a37dUINVdyAw1jq2EfBf22OwwPMGVEneutR8rFHNSio8RpqRzX
 JzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJQ/JEKALcH9lJ7xFy8iXB5Ea36VbtyMrZxDHC60VlY=;
 b=SUdb0Juy916WcAhq9YJI52Mk/NRD+ViUB7tbnQ3z77TuQkYoLcx2VGL8wOyMYNLYH9
 sF2jys//BvJVugQvpbPxpZbiDq1VjFBp4MRBrgbv971p1LB2FPPk+jgY2BM/3DXBY0Ds
 Kgs1IvK/JKYvdTPHLExbGaamIepkqu3AazaJ7LkSH+DelfnbZ49/jYRVvKD4t9Lkmml7
 X86w3XWi/Qra44WdYbsz+4IjW0tsg4ZxFWfWqP2n6jL38eqHuII/ep3kg3Whrwt+YxYW
 nn/bSSN4aVXxeuOus1DlL/x/eIKbwAdfq7yZOJWcGERc4qYz6oOnv9rE8s+mH7GV6OKI
 kBdA==
X-Gm-Message-State: ANoB5pkS4dtkqk5S9oEpNbjg5gO7lVOObZmGL0ihErwquzYhhpBdFXhL
 BnbrxJvBuBSTlTcGmFxOyD2CKQ==
X-Google-Smtp-Source: AA0mqf4tc/v4dZG5knPEY6J9AERU3/HzESOdymW2ApKD+PVJ6HF282Ix0wpPJA2Q2HrlOzVk3IE+Fw==
X-Received: by 2002:adf:e3d2:0:b0:241:d676:a787 with SMTP id
 k18-20020adfe3d2000000b00241d676a787mr16445813wrm.694.1669397449063; 
 Fri, 25 Nov 2022 09:30:49 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b003c5571c27a1sm7843052wmq.32.2022.11.25.09.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 09:30:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B68581FFBD;
 Fri, 25 Nov 2022 17:30:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com, German Maglione <gmaglione@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 virtio-fs@redhat.com (open list:virtiofs)
Subject: [PATCH v2 5/5] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Date: Fri, 25 Nov 2022 17:30:43 +0000
Message-Id: <20221125173043.1998075-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125173043.1998075-1-alex.bennee@linaro.org>
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 02b61f38d3 ("hw/virtio: incorporate backend features in features")
properly negotiates VHOST_USER_F_PROTOCOL_FEATURES with the vhost-user
backend, but we forgot to enable vrings as specified in
docs/interop/vhost-user.rst:

    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
    ring starts directly in the enabled state.

    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
    initialized in a disabled state and is enabled by
    ``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.

Some vhost-user front-ends already did this by calling
vhost_ops.vhost_set_vring_enable() directly:
- backends/cryptodev-vhost.c
- hw/net/virtio-net.c
- hw/virtio/vhost-user-gpio.c

But most didn't do that, so we would leave the vrings disabled and some
backends would not work. We observed this issue with the rust version of
virtiofsd [1], which uses the event loop [2] provided by the
vhost-user-backend crate where requests are not processed if vring is
not enabled.

Let's fix this issue by enabling the vrings in vhost_dev_start() for
vhost-user front-ends that don't already do this directly. Same thing
also in vhost_dev_stop() where we disable vrings.

[1] https://gitlab.com/virtio-fs/virtiofsd
[2] https://github.com/rust-vmm/vhost/blob/240fc2966/crates/vhost-user-backend/src/event_loop.rs#L217

Fixes: 02b61f38d3 ("hw/virtio: incorporate backend features in features")
Reported-by: German Maglione <gmaglione@redhat.com>
Tested-by: German Maglione <gmaglione@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20221123131630.52020-1-sgarzare@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost.h      |  6 +++--
 backends/cryptodev-vhost.c     |  4 ++--
 backends/vhost-user.c          |  4 ++--
 hw/block/vhost-user-blk.c      |  4 ++--
 hw/net/vhost_net.c             |  8 +++----
 hw/scsi/vhost-scsi-common.c    |  4 ++--
 hw/virtio/vhost-user-fs.c      |  4 ++--
 hw/virtio/vhost-user-gpio.c    |  4 ++--
 hw/virtio/vhost-user-i2c.c     |  4 ++--
 hw/virtio/vhost-user-rng.c     |  4 ++--
 hw/virtio/vhost-vsock-common.c |  4 ++--
 hw/virtio/vhost.c              | 44 ++++++++++++++++++++++++++++++----
 hw/virtio/trace-events         |  4 ++--
 13 files changed, 67 insertions(+), 31 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index eaf628f656..1cafa0d776 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -203,24 +203,26 @@ static inline bool vhost_dev_is_started(struct vhost_dev *hdev)
  * vhost_dev_start() - start the vhost device
  * @hdev: common vhost_dev structure
  * @vdev: the VirtIODevice structure
+ * @vrings: true to have vrings enabled in this call
  *
  * Starts the vhost device. From this point VirtIO feature negotiation
  * can start and the device can start processing VirtIO transactions.
  *
  * Return: 0 on success, < 0 on error.
  */
-int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
+int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings);
 
 /**
  * vhost_dev_stop() - stop the vhost device
  * @hdev: common vhost_dev structure
  * @vdev: the VirtIODevice structure
+ * @vrings: true to have vrings disabled in this call
  *
  * Stop the vhost device. After the device is stopped the notifiers
  * can be disabled (@vhost_dev_disable_notifiers) and the device can
  * be torn down (@vhost_dev_cleanup).
  */
-void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings);
 
 /**
  * DOC: vhost device configuration handling
diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
index bc13e466b4..572f87b3be 100644
--- a/backends/cryptodev-vhost.c
+++ b/backends/cryptodev-vhost.c
@@ -94,7 +94,7 @@ cryptodev_vhost_start_one(CryptoDevBackendVhost *crypto,
         goto fail_notifiers;
     }
 
-    r = vhost_dev_start(&crypto->dev, dev);
+    r = vhost_dev_start(&crypto->dev, dev, false);
     if (r < 0) {
         goto fail_start;
     }
@@ -111,7 +111,7 @@ static void
 cryptodev_vhost_stop_one(CryptoDevBackendVhost *crypto,
                                  VirtIODevice *dev)
 {
-    vhost_dev_stop(&crypto->dev, dev);
+    vhost_dev_stop(&crypto->dev, dev, false);
     vhost_dev_disable_notifiers(&crypto->dev, dev);
 }
 
diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 5dedb2d987..7bfcaef976 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -85,7 +85,7 @@ vhost_user_backend_start(VhostUserBackend *b)
     }
 
     b->dev.acked_features = b->vdev->guest_features;
-    ret = vhost_dev_start(&b->dev, b->vdev);
+    ret = vhost_dev_start(&b->dev, b->vdev, true);
     if (ret < 0) {
         error_report("Error start vhost dev");
         goto err_guest_notifiers;
@@ -120,7 +120,7 @@ vhost_user_backend_stop(VhostUserBackend *b)
         return;
     }
 
-    vhost_dev_stop(&b->dev, b->vdev);
+    vhost_dev_stop(&b->dev, b->vdev, true);
 
     if (k->set_guest_notifiers) {
         ret = k->set_guest_notifiers(qbus->parent,
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 0d5190accf..1177064631 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -178,7 +178,7 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
     }
 
     s->dev.vq_index_end = s->dev.nvqs;
-    ret = vhost_dev_start(&s->dev, vdev);
+    ret = vhost_dev_start(&s->dev, vdev, true);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Error starting vhost");
         goto err_guest_notifiers;
@@ -213,7 +213,7 @@ static void vhost_user_blk_stop(VirtIODevice *vdev)
         return;
     }
 
-    vhost_dev_stop(&s->dev, vdev);
+    vhost_dev_stop(&s->dev, vdev, true);
 
     ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
     if (ret < 0) {
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 26e4930676..043058ff43 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -259,7 +259,7 @@ static int vhost_net_start_one(struct vhost_net *net,
         goto fail_notifiers;
     }
 
-    r = vhost_dev_start(&net->dev, dev);
+    r = vhost_dev_start(&net->dev, dev, false);
     if (r < 0) {
         goto fail_start;
     }
@@ -308,7 +308,7 @@ fail:
     if (net->nc->info->poll) {
         net->nc->info->poll(net->nc, true);
     }
-    vhost_dev_stop(&net->dev, dev);
+    vhost_dev_stop(&net->dev, dev, false);
 fail_start:
     vhost_dev_disable_notifiers(&net->dev, dev);
 fail_notifiers:
@@ -329,7 +329,7 @@ static void vhost_net_stop_one(struct vhost_net *net,
     if (net->nc->info->poll) {
         net->nc->info->poll(net->nc, true);
     }
-    vhost_dev_stop(&net->dev, dev);
+    vhost_dev_stop(&net->dev, dev, false);
     if (net->nc->info->stop) {
         net->nc->info->stop(net->nc);
     }
@@ -606,7 +606,7 @@ err_start:
         assert(r >= 0);
     }
 
-    vhost_dev_stop(&net->dev, vdev);
+    vhost_dev_stop(&net->dev, vdev, false);
 
     return r;
 }
diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
index 767f827e55..18ea5dcfa1 100644
--- a/hw/scsi/vhost-scsi-common.c
+++ b/hw/scsi/vhost-scsi-common.c
@@ -68,7 +68,7 @@ int vhost_scsi_common_start(VHostSCSICommon *vsc)
         goto err_guest_notifiers;
     }
 
-    ret = vhost_dev_start(&vsc->dev, vdev);
+    ret = vhost_dev_start(&vsc->dev, vdev, true);
     if (ret < 0) {
         error_report("Error start vhost dev");
         goto err_guest_notifiers;
@@ -101,7 +101,7 @@ void vhost_scsi_common_stop(VHostSCSICommon *vsc)
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     int ret = 0;
 
-    vhost_dev_stop(&vsc->dev, vdev);
+    vhost_dev_stop(&vsc->dev, vdev, true);
 
     if (k->set_guest_notifiers) {
         ret = k->set_guest_notifiers(qbus->parent, vsc->dev.nvqs, false);
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index dc4014cdef..d97b179e6f 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -76,7 +76,7 @@ static void vuf_start(VirtIODevice *vdev)
     }
 
     fs->vhost_dev.acked_features = vdev->guest_features;
-    ret = vhost_dev_start(&fs->vhost_dev, vdev);
+    ret = vhost_dev_start(&fs->vhost_dev, vdev, true);
     if (ret < 0) {
         error_report("Error starting vhost: %d", -ret);
         goto err_guest_notifiers;
@@ -110,7 +110,7 @@ static void vuf_stop(VirtIODevice *vdev)
         return;
     }
 
-    vhost_dev_stop(&fs->vhost_dev, vdev);
+    vhost_dev_stop(&fs->vhost_dev, vdev, true);
 
     ret = k->set_guest_notifiers(qbus->parent, fs->vhost_dev.nvqs, false);
     if (ret < 0) {
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index b2496c824c..b38e4d4cf0 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -81,7 +81,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
      */
     vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->guest_features);
 
-    ret = vhost_dev_start(&gpio->vhost_dev, vdev);
+    ret = vhost_dev_start(&gpio->vhost_dev, vdev, false);
     if (ret < 0) {
         error_report("Error starting vhost-user-gpio: %d", ret);
         goto err_guest_notifiers;
@@ -139,7 +139,7 @@ static void vu_gpio_stop(VirtIODevice *vdev)
         return;
     }
 
-    vhost_dev_stop(vhost_dev, vdev);
+    vhost_dev_stop(vhost_dev, vdev, false);
 
     ret = k->set_guest_notifiers(qbus->parent, vhost_dev->nvqs, false);
     if (ret < 0) {
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 1c9f3d20dc..dc5c828ba6 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -46,7 +46,7 @@ static void vu_i2c_start(VirtIODevice *vdev)
 
     i2c->vhost_dev.acked_features = vdev->guest_features;
 
-    ret = vhost_dev_start(&i2c->vhost_dev, vdev);
+    ret = vhost_dev_start(&i2c->vhost_dev, vdev, true);
     if (ret < 0) {
         error_report("Error starting vhost-user-i2c: %d", -ret);
         goto err_guest_notifiers;
@@ -80,7 +80,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
         return;
     }
 
-    vhost_dev_stop(&i2c->vhost_dev, vdev);
+    vhost_dev_stop(&i2c->vhost_dev, vdev, true);
 
     ret = k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
     if (ret < 0) {
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index f9084cde58..201a39e220 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -47,7 +47,7 @@ static void vu_rng_start(VirtIODevice *vdev)
     }
 
     rng->vhost_dev.acked_features = vdev->guest_features;
-    ret = vhost_dev_start(&rng->vhost_dev, vdev);
+    ret = vhost_dev_start(&rng->vhost_dev, vdev, true);
     if (ret < 0) {
         error_report("Error starting vhost-user-rng: %d", -ret);
         goto err_guest_notifiers;
@@ -81,7 +81,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
         return;
     }
 
-    vhost_dev_stop(&rng->vhost_dev, vdev);
+    vhost_dev_stop(&rng->vhost_dev, vdev, true);
 
     ret = k->set_guest_notifiers(qbus->parent, rng->vhost_dev.nvqs, false);
     if (ret < 0) {
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index a67a275de2..d21c72b401 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -70,7 +70,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
     }
 
     vvc->vhost_dev.acked_features = vdev->guest_features;
-    ret = vhost_dev_start(&vvc->vhost_dev, vdev);
+    ret = vhost_dev_start(&vvc->vhost_dev, vdev, true);
     if (ret < 0) {
         error_report("Error starting vhost: %d", -ret);
         goto err_guest_notifiers;
@@ -105,7 +105,7 @@ void vhost_vsock_common_stop(VirtIODevice *vdev)
         return;
     }
 
-    vhost_dev_stop(&vvc->vhost_dev, vdev);
+    vhost_dev_stop(&vvc->vhost_dev, vdev, true);
 
     ret = k->set_guest_notifiers(qbus->parent, vvc->vhost_dev.nvqs, false);
     if (ret < 0) {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index d1c4c20b8c..7fb008bc9e 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1777,15 +1777,36 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
     return 0;
 }
 
+static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable)
+{
+    if (!hdev->vhost_ops->vhost_set_vring_enable) {
+        return 0;
+    }
+
+    /*
+     * For vhost-user devices, if VHOST_USER_F_PROTOCOL_FEATURES has not
+     * been negotiated, the rings start directly in the enabled state, and
+     * .vhost_set_vring_enable callback will fail since
+     * VHOST_USER_SET_VRING_ENABLE is not supported.
+     */
+    if (hdev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER &&
+        !virtio_has_feature(hdev->backend_features,
+                            VHOST_USER_F_PROTOCOL_FEATURES)) {
+        return 0;
+    }
+
+    return hdev->vhost_ops->vhost_set_vring_enable(hdev, enable);
+}
+
 /* Host notifiers must be enabled at this point. */
-int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
+int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
 {
     int i, r;
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
-    trace_vhost_dev_start(hdev, vdev->name);
+    trace_vhost_dev_start(hdev, vdev->name, vrings);
 
     vdev->vhost_started = true;
     hdev->started = true;
@@ -1830,10 +1851,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             goto fail_log;
         }
     }
+    if (vrings) {
+        r = vhost_dev_set_vring_enable(hdev, true);
+        if (r) {
+            goto fail_log;
+        }
+    }
     if (hdev->vhost_ops->vhost_dev_start) {
         r = hdev->vhost_ops->vhost_dev_start(hdev, true);
         if (r) {
-            goto fail_log;
+            goto fail_start;
         }
     }
     if (vhost_dev_has_iommu(hdev) &&
@@ -1848,6 +1875,10 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
     }
     return 0;
+fail_start:
+    if (vrings) {
+        vhost_dev_set_vring_enable(hdev, false);
+    }
 fail_log:
     vhost_log_put(hdev, false);
 fail_vq:
@@ -1866,18 +1897,21 @@ fail_features:
 }
 
 /* Host notifiers must be enabled at this point. */
-void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
+void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
 {
     int i;
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
-    trace_vhost_dev_stop(hdev, vdev->name);
+    trace_vhost_dev_stop(hdev, vdev->name, vrings);
 
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
     }
+    if (vrings) {
+        vhost_dev_set_vring_enable(hdev, false);
+    }
     for (i = 0; i < hdev->nvqs; ++i) {
         vhost_virtqueue_stop(hdev,
                              vdev,
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 820dadc26c..14fc5b9bb2 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -9,8 +9,8 @@ vhost_section(const char *name) "%s"
 vhost_reject_section(const char *name, int d) "%s:%d"
 vhost_iotlb_miss(void *dev, int step) "%p step %d"
 vhost_dev_cleanup(void *dev) "%p"
-vhost_dev_start(void *dev, const char *name) "%p:%s"
-vhost_dev_stop(void *dev, const char *name) "%p:%s"
+vhost_dev_start(void *dev, const char *name, bool vrings) "%p:%s vrings:%d"
+vhost_dev_stop(void *dev, const char *name, bool vrings) "%p:%s vrings:%d"
 
 
 # vhost-user.c
-- 
2.34.1


